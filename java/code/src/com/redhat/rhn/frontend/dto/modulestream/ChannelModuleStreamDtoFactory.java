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

import java.util.regex.Pattern;
import java.util.regex.Matcher;

/**
 * ChannelModuleStreamDtoFactory
 * @version $Rev$
 */
public class ChannelModuleStreamDtoFactory {

    private static final String REGEX = "^(.+):(.+)$";
    private static final Pattern PATTERN = Pattern.compile(REGEX);
    private static Matcher matcher;

    private ChannelModuleStreamDtoFactory() {
        // not called
    }

    /**
     * @param chanMod the channel:module string
     * @param stream the stream
     * @return ChannelModuleStreamDto
     */
    public static ChannelModuleStreamDto create(String chanMod, String stream) {
        matcher = PATTERN.matcher(chanMod);
        if (matcher.find()) {
            return new ChannelModuleStreamDto(matcher.group(1),
                                              matcher.group(2),
                                              stream);
        }

        return null;
    }

}
