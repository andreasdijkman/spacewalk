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

import java.util.ArrayList;
import java.util.List;

/**
 * ModuleTreeModuleDto
 * @version $Rev$
 */
public class ModuleTreeModuleDto {

    private String name;
    private List<ModuleTreeStreamDto> streams = new ArrayList<ModuleTreeStreamDto>();

    /**
     * Constructor
     */
    public ModuleTreeModuleDto() {
        super();
    }

    /**
     * @param nameIn name
     */
    public ModuleTreeModuleDto(String nameIn) {
        this.name = nameIn;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param nameIn the name to set
     */
    public void setName(String nameIn) {
        this.name = nameIn;
    }

    /**
     * @return the streams
     */
    public List<ModuleTreeStreamDto> getStreams() {
        return streams;
    }

    /**
     * @param streamsIn the streams to set
     */
    public void setStreams(List<ModuleTreeStreamDto> streamsIn) {
        this.streams = streamsIn;
    }

    /**
     * @return whether this module installed. Inferred from whether a child stream is installed.
     */
    public boolean isInstalled() {
        for (ModuleTreeStreamDto stream : streams) {
            if (stream.isInstalled()) {
                return true;
            }
        }
        return false;
    }
}
