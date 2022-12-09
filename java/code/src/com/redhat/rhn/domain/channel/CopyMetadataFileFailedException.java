/**
 * Copyright (C) 2022 Oracle and/or its affiliates.
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

package com.redhat.rhn.domain.channel;

/**
 * Copying metadata file during channel clone failed.
 * <p>
 */
public class CopyMetadataFileFailedException extends RuntimeException  {

    /**
     * Constructor
     * @param message the reason copying failed
     */
    public CopyMetadataFileFailedException(String message) {
        super(message);
    }

    /**
     * Constructor
     * @param message the reason copying failed
     * @param cause the cause (which is saved for later retrieval
     * by the Throwable.getCause() method). (A null value is
     * permitted, and indicates that the cause is nonexistent or
     * unknown.)
     */
    public CopyMetadataFileFailedException(String message, Throwable cause) {
        super(message, cause);
    }

}
