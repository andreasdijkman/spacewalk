/**
 * Copyright (C) 2021 Oracle and/or its affiliates. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation, version 2
 *
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.
 */
package com.redhat.rhn.frontend.action.systems.sdc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.redhat.rhn.common.db.datasource.DataResult;
import com.redhat.rhn.domain.action.script.ScriptRunAction;
import com.redhat.rhn.domain.server.Server;
import com.redhat.rhn.domain.user.User;
import com.redhat.rhn.frontend.common.modules.CommonModulesAction;
import com.redhat.rhn.frontend.dto.modulestream.ChannelModuleStreamDto;
import com.redhat.rhn.frontend.dto.modulestream.ServerModuleStreamDto;
import com.redhat.rhn.frontend.struts.RequestContext;
import com.redhat.rhn.frontend.struts.RhnHelper;
import com.redhat.rhn.frontend.struts.StrutsDelegate;
import com.redhat.rhn.manager.system.SystemManager;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

/**
 * SystemModulesAction - action to setup/process viewing a system's module:stream
 * subscription info.
 * @version $Rev: 1 $
 */
public class SystemModulesAction extends CommonModulesAction {

    /**
     * Logger for this class
     */
    private static Logger log = Logger.getLogger(SystemModulesAction.class);

    public static final String SID = "sid";
    public static final String MODULE_TREE = "module_tree";
    public static final String MODULES_REMOVE_LIST = "modules_remove_list";
    public static final String MODULES_INSTALL_LIST = "modules_install_list";

    /** {@inheritDoc} */
    public ActionForward unspecified(ActionMapping mapping,
                                     ActionForm formIn,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
        DynaActionForm form = (DynaActionForm) formIn;
        RequestContext rctx = new RequestContext(request);
        User user = rctx.getCurrentUser();
        Server server = SystemManager.lookupByIdAndUser(rctx.getRequiredParam(RequestContext.SID), user);

        // Setup request attributes
        request.setAttribute(RequestContext.SYSTEM, server);
        if (server.getBaseChannel() != null) {
            DataResult<ServerModuleStreamDto> moduleStreamList =
                SystemManager.systemModuleStreamSubscriptions(server.getId(), user.getId());

            setupTree(user, request, moduleStreamList, MODULE_TREE);
        }
        else {
            log.debug("System base_channel is null.");
        }

        SdcHelper.ssmCheck(request, server.getId(), user);

        return getStrutsDelegate().forwardParam(mapping.findForward(RhnHelper.DEFAULT_FORWARD),
                                                RequestContext.SID, server.getId().toString());
    }

    /**
     * Confirm updating the modules and streams for a system.
     * @param mapping ActionMapping
     * @param formIn ActionForm
     * @param request ServletRequest
     * @param response ServletResponse
     * @return The ActionForward to go to next.
     */
    public ActionForward confirmModulesStreams(ActionMapping mapping,
                                               ActionForm formIn,
                                               HttpServletRequest request,
                                               HttpServletResponse response) {
        RequestContext rctx = new RequestContext(request);
        User user = rctx.getCurrentUser();
        Server s  = SystemManager.lookupByIdAndUser(
                                                    rctx.getRequiredParam(RequestContext.SID), user);

        super.populateModuleOperationAttrs(request, MODULES_REMOVE_LIST, MODULES_INSTALL_LIST);

        request.setAttribute(SID, s.getId());
        SdcHelper.ssmCheck(request, s.getId(), user);
        return getStrutsDelegate().forwardParam(mapping.findForward(RhnHelper.CONFIRM_FORWARD),
                                                RequestContext.SID, s.getId().toString());
    }

    /**
     * Update the modules and streams for a system.
     * @param mapping ActionMapping
     * @param formIn ActionForm
     * @param request ServletRequest
     * @param response ServletResponse
     * @return The ActionForward to go to next.
     */
    public ActionForward updateModulesStreams(ActionMapping mapping,
                                              ActionForm formIn,
                                              HttpServletRequest request,
                                              HttpServletResponse response) {
        RequestContext rctx = new RequestContext(request);
        HttpSession session = request.getSession(true);
        User user = rctx.getCurrentUser();
        Server s  = SystemManager.lookupByIdAndUser(
                                                    rctx.getRequiredParam(RequestContext.SID), user);

        List<ChannelModuleStreamDto> removeList =
            (ArrayList<ChannelModuleStreamDto>)session.getAttribute(MODULES_REMOVE_LIST);
        List<ChannelModuleStreamDto> installList =
            (ArrayList<ChannelModuleStreamDto>)session.getAttribute(MODULES_INSTALL_LIST);

        session.removeAttribute(MODULES_REMOVE_LIST);
        session.removeAttribute(MODULES_INSTALL_LIST);

        // Create and schedule bash script
        ScriptRunAction sra =
            SystemManager.subscribeUnsubscribeServerToModulesStreams(user, s, removeList, installList);

        // Add success message with link to action
        StrutsDelegate strutsDelegate = getStrutsDelegate();
        ActionMessages msgs = new ActionMessages();
        ActionMessage msg = new ActionMessage("sdc.modules.edit.success",
                                              s.getId().toString(), sra.getId().toString());
        msgs.add(ActionMessages.GLOBAL_MESSAGE, msg);
        strutsDelegate.saveMessages(request, msgs);

        return strutsDelegate.forwardParam(mapping.findForward("update"),
                                                RequestContext.SID, s.getId().toString());
    }

    protected Map getKeyMethodMap() {
        Map<String, String> map = new HashMap<String, String>();
        map.put("sdc.modules.edit.confirm_modules_streams", "confirmModulesStreams");
        map.put("sdc.modules.edit.update_modules_streams", "updateModulesStreams");
        return map;
    }
}
