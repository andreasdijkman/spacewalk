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
package com.redhat.rhn.frontend.dto.modulestream;

/**
 * ServerModuleStreamDto
 * @version $Rev$
 */
public class ServerModuleStreamDto {

    private Long parentChannelId;
    private String parentChannelLabel;
    private String parentChannelName;
    private Long channelId;
    private String channelLabel;
    private String channelName;
    private String channelModuleStream;
    private Long serverId;
    private String serverModuleStream;

    /**
     * @return the parentChannelId
     */
    public Long getParentChannelId() {
        return parentChannelId;
    }

    /**
     * @param parentChannelIdIn the parentChannelId to set
     */
    public void setParentChannelId(Long parentChannelIdIn) {
        this.parentChannelId = parentChannelIdIn;
    }

    /**
     * @return the parentChannelLabel
     */
    public String getParentChannelLabel() {
        return parentChannelLabel;
    }

    /**
     * @param parentChannelLabelIn the parentChannelLabel to set
     */
    public void setParentChannelLabel(String parentChannelLabelIn) {
        this.parentChannelLabel = parentChannelLabelIn;
    }

    /**
     * @return the parentChannelName
     */
    public String getParentChannelName() {
        return parentChannelName;
    }

    /**
     * @param parentChannelNameIn the parentChannelName to set
     */
    public void setParentChannelName(String parentChannelNameIn) {
        this.parentChannelName = parentChannelNameIn;
    }

    /**
     * @return the channelId
     */
    public Long getChannelId() {
        return channelId;
    }

    /**
     * @param channelIdIn the channelId to set
     */
    public void setChannelId(Long channelIdIn) {
        this.channelId = channelIdIn;
    }

    /**
     * @return the channelLabel
     */
    public String getChannelLabel() {
        return channelLabel;
    }

    /**
     * @param channelLabelIn the channelLabel to set
     */
    public void setChannelLabel(String channelLabelIn) {
        this.channelLabel = channelLabelIn;
    }

    /**
     * @return the channelName
     */
    public String getChannelName() {
        return channelName;
    }

    /**
     * @param channelNameIn the channelName to set
     */
    public void setChannelName(String channelNameIn) {
        this.channelName = channelNameIn;
    }

    /**
     * @return the channelModuleStream
     */
    public String getChannelModuleStream() {
        return channelModuleStream;
    }

    /**
     * @return the channel module name
     */
    public String getChannelModule() {
        return channelModuleStream.substring(0, channelModuleStream.indexOf(":"));
    }

    /**
     * @return the channel stream name
     */
    public String getChannelStream() {
        return channelModuleStream.substring(channelModuleStream.indexOf(":") + 1, channelModuleStream.length());
    }

    /**
     * @param channelModuleStreamIn the channelModuleStream to set
     */
    public void setChannelModuleStream(String channelModuleStreamIn) {
        this.channelModuleStream = channelModuleStreamIn;
    }

    /**
     * @return the serverId
     */
    public Long getServerId() {
        return serverId;
    }

    /**
     * @param serverIdIn the serverId to set
     */
    public void setServerId(Long serverIdIn) {
        this.serverId = serverIdIn;
    }

    /**
     * @return the serverModuleStream
     */
    public String getServerModuleStream() {
        return serverModuleStream;
    }

    /**
     * @param serverModuleStreamIn the serverModuleStream to set
     */
    public void setServerModuleStream(String serverModuleStreamIn) {
        this.serverModuleStream = serverModuleStreamIn;
    }


}
