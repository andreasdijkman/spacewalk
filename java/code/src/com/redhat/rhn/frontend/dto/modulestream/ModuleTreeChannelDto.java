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
 * ModuleTreeChannelDto
 * @version $Rev$
 */
public class ModuleTreeChannelDto {

    private Long id;
    private String label;
    private String name;
    private List<ModuleTreeModuleDto> modules = new ArrayList<ModuleTreeModuleDto>();

    /**
     * Constructor
     */
    public ModuleTreeChannelDto() {
        super();
    }

    /**
     * @param idIn the id
     * @param labelIn the label
     * @param nameIn the name
     */
    public ModuleTreeChannelDto(Long idIn, String labelIn, String nameIn) {
        this.id = idIn;
        this.label = labelIn;
        this.name = nameIn;
    }

    /**
     * @return the id
     */
    public Long getId() {
        return id;
    }

    /**
     * @param idIn the id to set
     */
    public void setId(Long idIn) {
        this.id = idIn;
    }

    /**
     * @return the label
     */
    public String getLabel() {
        return label;
    }

    /**
     * @param labelIn the label to set
     */
    public void setLabel(String labelIn) {
        this.label = labelIn;
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
     * @return the modules
     */
    public List<ModuleTreeModuleDto> getModules() {
        return modules;
    }

    /**
     * @param modulesIn the modules to set
     */
    public void setModules(List<ModuleTreeModuleDto> modulesIn) {
        this.modules = modulesIn;
    }
}
