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
package com.redhat.rhn.frontend.events;

import com.redhat.rhn.common.messaging.EventMessage;
import com.redhat.rhn.domain.user.User;
import com.redhat.rhn.manager.rhnset.RhnSetDecl;
import com.redhat.rhn.manager.ssm.SsmOperationManager;
import com.redhat.rhn.manager.system.SystemManager;

import org.apache.log4j.Logger;

/**
 * SsmChangeModuleSubsctiptionAction
 * @see com.redhat.rhn.frontend.events.SsmChangeModuleSubscriptionEvent
 * @version $Rev$
 */
public class SsmChangeModuleSubscriptionAction extends AbstractDatabaseAction {
    public static final String OPERATION_NAME = "ssm.modules.changesubscription.operationname";

    private static Logger log =
        Logger.getLogger(SsmChangeModuleSubscriptionAction.class);

    /**
     * {@inheritDoc}
     */
    public void doExecute(EventMessage msgIn) {
        SsmChangeModuleSubscriptionEvent event =
            (SsmChangeModuleSubscriptionEvent)msgIn;
        User user = event.getUser();

        long operationId = SsmOperationManager.createOperation(user,
                                                               OPERATION_NAME,
                                                               RhnSetDecl.SYSTEMS.getLabel());

        try {
            SystemManager.subscribeUnsubscribeServersToModulesStreams(user, event.getSids(),
                                                                      event.getRemoveList(),
                                                                      event.getInstallList());
        }
        catch (Exception e) {
            log.error("Error changing SSM servers' module subscriptions: " + event, e);
        }
        finally {
            SsmOperationManager.completeOperation(user, operationId);
        }


    }
}
