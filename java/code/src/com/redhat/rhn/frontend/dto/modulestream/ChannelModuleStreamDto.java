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
 * ChannelModuleStreamDto
 * @version $Rev$
 */
public class ChannelModuleStreamDto {

    private String channel;
    private String module;
    private String stream;

    /**
     * Constructor
     */
    public ChannelModuleStreamDto() {
        super();
    }

    /**
     * @param channelIn the channel
     * @param moduleIn the module
     * @param streamIn the stream
     */
    public ChannelModuleStreamDto(String channelIn,
                                  String moduleIn,
                                  String streamIn) {
        this.channel = channelIn;
        this.module = moduleIn;
        this.stream = streamIn;
    }

    /**
     * @return the channel
     */
    public String getChannel() {
        return channel;
    }

    /**
     * @param channelIn the channel to set
     */
    public void setChannel(String channelIn) {
        this.channel = channelIn;
    }

    /**
     * @return the module
     */
    public String getModule() {
        return module;
    }

    /**
     * @param moduleIn the module to set
     */
    public void setModule(String moduleIn) {
        this.module = moduleIn;
    }

    /**
     * @return the stream
     */
    public String getStream() {
        return stream;
    }

    /**
     * @param streamIn the stream to set
     */
    public void setStream(String streamIn) {
        this.stream = streamIn;
    }

}
