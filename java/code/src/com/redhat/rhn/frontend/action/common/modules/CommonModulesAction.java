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
package com.redhat.rhn.frontend.common.modules;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.redhat.rhn.common.db.datasource.DataResult;
import com.redhat.rhn.domain.user.User;
import com.redhat.rhn.frontend.dto.modulestream.ChannelModuleStreamDto;
import com.redhat.rhn.frontend.dto.modulestream.ChannelModuleStreamDtoFactory;
import com.redhat.rhn.frontend.dto.modulestream.ModuleTreeChannelDto;
import com.redhat.rhn.frontend.dto.modulestream.ModuleTreeModuleDto;
import com.redhat.rhn.frontend.dto.modulestream.ModuleTreeStreamDto;
import com.redhat.rhn.frontend.dto.modulestream.ServerModuleStreamDto;
import com.redhat.rhn.frontend.struts.RhnLookupDispatchAction;

/**
 * CommonModulesAction - abstract base action to setup viewing a system's module:stream
 * subscription info.
 * @version $Rev: 1 $
 */
public abstract class CommonModulesAction extends RhnLookupDispatchAction {

    /** Setup the channel->module->stream DTO tree for Web UI tree generation
     * @param user user
     * @param request ServetRequest
     * @param moduleStreamList the module:stream list to display
     * @param attrName the request attribute name in which to store the channel list
     */
    protected void setupTree(User user, HttpServletRequest request,
                             DataResult<ServerModuleStreamDto> moduleStreamList,
                             String attrName) {
        List<ModuleTreeChannelDto> channelList = new ArrayList<ModuleTreeChannelDto>();
        ModuleTreeChannelDto chan = new ModuleTreeChannelDto();
        ModuleTreeModuleDto mod = new ModuleTreeModuleDto();
        String prevChan = "";
        String prevMod = "";

        for (ServerModuleStreamDto modStr : moduleStreamList) {

            // New channel?
            if (!modStr.getChannelLabel().equals(prevChan)) {
                chan = new ModuleTreeChannelDto(modStr.getChannelId(), modStr.getChannelLabel(),
                                                modStr.getChannelName());
                channelList.add(chan);
                prevChan = modStr.getChannelLabel();

                // Reset the module to handle the module name being the same in the new channel
                // e.g.
                // ChannelA:Module1
                // ChannelB:Module1
                prevMod = "";
            }

            // New module?
            if (!modStr.getChannelModule().equals(prevMod)) {
                mod = new ModuleTreeModuleDto(modStr.getChannelModule());
                chan.getModules().add(mod);
                prevMod = modStr.getChannelModule();
            }

            // New stream
            boolean streamInstalled = modStr.getChannelModuleStream().equals(modStr.getServerModuleStream());
            mod.getStreams().add(new ModuleTreeStreamDto(modStr.getChannelStream(), streamInstalled));
        }

        request.setAttribute(attrName, channelList);
    }

    protected void populateModuleOperationAttrs(HttpServletRequest request,
                                                String removeAttrName,
                                                String installAttrName) {
        HttpSession session = request.getSession(true);

        List<ChannelModuleStreamDto> removeList = new ArrayList<ChannelModuleStreamDto>();
        List<ChannelModuleStreamDto> installList = new ArrayList<ChannelModuleStreamDto>();
        ChannelModuleStreamDto cms;

        Enumeration<String> names = request.getParameterNames();

        // The channel:module is in the radio button "name" because this makes the group
        // The value is either "do_not_install" for no action, "remove" to remove, or the name of the stream to install
        while (names.hasMoreElements()) {
            String aName = names.nextElement();
            String aValue = request.getParameter(aName);

            if (aName.contains(":")) {
                if ("remove".equals(aValue)) {
                    cms = ChannelModuleStreamDtoFactory.create(aName, "");
                    removeList.add(cms);
                }
                else if (!aValue.isEmpty() && !"no_action".equals(aValue)) {
                    cms = ChannelModuleStreamDtoFactory.create(aName, aValue);
                    installList.add(cms);
                }
            }
        }

        request.setAttribute(removeAttrName, removeList);
        request.setAttribute(installAttrName, installList);

        // The confirm page causes a redirect to the list page, which loses the context
        // Normally this is solved with an RhnSet, but this is keyed off DB PKs
        // We don't have an DB entries for modules, so store in HTTP session
        session.setAttribute(removeAttrName, removeList);
        session.setAttribute(installAttrName, installList);
    }
}
