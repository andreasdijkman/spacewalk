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
package com.redhat.rhn.frontend.action.ssm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.redhat.rhn.common.db.datasource.DataResult;
import com.redhat.rhn.common.messaging.MessageQueue;
import com.redhat.rhn.domain.rhnset.RhnSet;
import com.redhat.rhn.domain.server.Server;
import com.redhat.rhn.domain.user.User;
import com.redhat.rhn.frontend.common.modules.CommonModulesAction;
import com.redhat.rhn.frontend.dto.modulestream.ChannelModuleStreamDto;
import com.redhat.rhn.frontend.dto.modulestream.ServerModuleStreamDto;
import com.redhat.rhn.frontend.events.SsmChangeModuleSubscriptionEvent;
import com.redhat.rhn.frontend.struts.RequestContext;
import com.redhat.rhn.frontend.struts.RhnHelper;
import com.redhat.rhn.frontend.struts.StrutsDelegate;
import com.redhat.rhn.manager.action.ActionManager;
import com.redhat.rhn.manager.rhnset.RhnSetDecl;
import com.redhat.rhn.manager.system.SystemManager;

import org.apache.log4j.Logger;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.DynaActionForm;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

/**
 * ModuleSubscriptionAction - action to setup/process viewing a system's module:stream
 * subscription info.
 * @version $Rev: 1 $
 */
public class ModuleSubscriptionAction extends CommonModulesAction {

    /**
     * Logger for this class
     */
    private static Logger log = Logger.getLogger(ModuleSubscriptionAction.class);

    public static final String SSM_MODULE_TREE = "ssm_module_tree";
    public static final String SSM_MODULES_REMOVE_LIST = "ssm_modules_remove_list";
    public static final String SSM_MODULES_INSTALL_LIST = "ssm_modules_install_list";

    /** {@inheritDoc} */
    public ActionForward unspecified(ActionMapping mapping,
                                     ActionForm formIn,
                                     HttpServletRequest request,
                                     HttpServletResponse response) {
        DynaActionForm form = (DynaActionForm) formIn;
        RequestContext rctx = new RequestContext(request);
        User user = rctx.getCurrentUser();

        DataResult<ServerModuleStreamDto> moduleStreamList =
            SystemManager.ssmModuleStreamSubscriptions(user.getId());

        setupTree(user, request, moduleStreamList, SSM_MODULE_TREE);

        return mapping.findForward(RhnHelper.DEFAULT_FORWARD);
    }

    /**
     * Confirm updating the modules and streams for an SSM set.
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
        super.populateModuleOperationAttrs(request, SSM_MODULES_REMOVE_LIST, SSM_MODULES_INSTALL_LIST);

        // We don't worry about list of servers because this is in SSM set
        return mapping.findForward(RhnHelper.CONFIRM_FORWARD);
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

        ArrayList<ChannelModuleStreamDto> removeList =
            (ArrayList<ChannelModuleStreamDto>)session.getAttribute(SSM_MODULES_REMOVE_LIST);
        ArrayList<ChannelModuleStreamDto> installList =
            (ArrayList<ChannelModuleStreamDto>)session.getAttribute(SSM_MODULES_INSTALL_LIST);

        session.removeAttribute(SSM_MODULES_REMOVE_LIST);
        session.removeAttribute(SSM_MODULES_INSTALL_LIST);

        // Create SSM event to schedule remote command bash script execution
        RhnSet set = RhnSetDecl.SYSTEMS.get(user);
        ArrayList<Long> sids = new ArrayList<Long>(set.getElementValues());

        // Prune servers that don't have dnf because it's needed for modules operations
        // Strictly this should really be only OL8, not any other dnf system
        // However knowing what distro release is being run is surprisingly unreliable
        // The user can edit that information in Spacewalk, too.
        // Use Iterator to avoid concurrent modification issues
        for (Iterator<Long> iter = sids.iterator(); iter.hasNext();) {
            Long sid = iter.next();
            Server server = SystemManager.lookupByIdAndUser(sid, user);
            if (SystemManager.listInstalledPackage("dnf", server).isEmpty()) {
                iter.remove();
            }
        }

        // Prune servers that can't run remote scripts
        sids = ActionManager.removeServersWithoutScripting(sids);

        SsmChangeModuleSubscriptionEvent event = new SsmChangeModuleSubscriptionEvent(user, sids,
                                                                                      removeList, installList);
        MessageQueue.publish(event);

        // Add success message with link to action
        StrutsDelegate strutsDelegate = getStrutsDelegate();
        ActionMessages msgs = new ActionMessages();
        ActionMessage msg = new ActionMessage("ssm.modules.edit.success", sids.size());
        msgs.add(ActionMessages.GLOBAL_MESSAGE, msg);
        strutsDelegate.saveMessages(request, msgs);

        return mapping.findForward("update");
    }


    protected Map getKeyMethodMap() {
        Map<String, String> map = new HashMap<String, String>();
        map.put("ssm.modules.edit.confirm_modules_streams", "confirmModulesStreams");
        map.put("ssm.modules.edit.update_modules_streams", "updateModulesStreams");
        return map;
    }

}
