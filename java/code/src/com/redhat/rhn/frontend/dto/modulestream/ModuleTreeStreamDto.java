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
 * ModuleTreeStreamDto
 * @version $Rev$
 */
public class ModuleTreeStreamDto {

    private String name;
    private boolean installed;

    /**
     * Constructor
     */
    public ModuleTreeStreamDto() {
        super();
    }

    /**
     * @param nameIn stream name
     * @param installedIn whether module:stream is installed
     */
    public ModuleTreeStreamDto(String nameIn, boolean installedIn) {
        this.name = nameIn;
        this.installed = installedIn;
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
     * @return the installed
     */
    public boolean isInstalled() {
        return installed;
    }

    /**
     * @param installedIn the installed to set
     */
    public void setInstalled(boolean installedIn) {
        this.installed = installedIn;
    }
}
