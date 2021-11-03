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

import java.util.ArrayList;

import com.redhat.rhn.common.messaging.EventMessage;
import com.redhat.rhn.domain.user.User;
import com.redhat.rhn.frontend.dto.modulestream.ChannelModuleStreamDto;

/**
 * SsmChangeModuleSubscriptionEvent - SSM Module:Stream subscription change event
 *
 * @version $Rev$
 */
public class SsmChangeModuleSubscriptionEvent extends BaseEvent implements EventMessage {

    private ArrayList<Long> sids;
    private ArrayList<ChannelModuleStreamDto> removeList;
    private ArrayList<ChannelModuleStreamDto> installList;

    /** Constructor
     * @param userIn user
     * @param sidsIn list of server sids to be operated on
     * @param removeListIn the list of modules to remove
     * @param installListIn the list of moduels to install
     */
    public SsmChangeModuleSubscriptionEvent(User userIn, ArrayList<Long> sidsIn,
                                            ArrayList<ChannelModuleStreamDto> removeListIn,
                                            ArrayList<ChannelModuleStreamDto> installListIn) {
        if (userIn == null) {
            throw new IllegalArgumentException("user cannot be null");
        }

        if (sidsIn.isEmpty()) {
            throw new IllegalArgumentException("Server sids list cannot be empty");
        }

        setUser(userIn);
        this.sids = sidsIn;
        this.removeList = removeListIn;
        this.installList = installListIn;
    }

    /**
     * @return the sids
     */
    public ArrayList<Long> getSids() {
        return sids;
    }

    /**
     * @param sidsIn the sids to set
     */
    public void setSids(ArrayList<Long> sidsIn) {
        this.sids = sidsIn;
    }

    /**
     * @return the removeList
     */

    public ArrayList<ChannelModuleStreamDto> getRemoveList() {
        return removeList;
    }

    /**
     * @param removeListIn the removeList to set
     */
    public void setRemoveList(ArrayList<ChannelModuleStreamDto> removeListIn) {
        this.removeList = removeListIn;
    }

    /**
     * @return the installList
     */
    public ArrayList<ChannelModuleStreamDto> getInstallList() {
        return installList;
    }

    /**
     * @param installListIn the installList to set
     */
    public void setInstallList(ArrayList<ChannelModuleStreamDto> installListIn) {
        this.installList = installListIn;
    }

    /** {@inheritDoc} */
    public String toText() {
        return toString();
    }

    /** {@inheritDoc} */
    public String toString() {
        return "SsmModuleSubscriptionsEvent[User: " + getUser().getLogin() +
            ", Install: " + this.installList + ", Remove: " +
            this.removeList + "]";
    }

}
