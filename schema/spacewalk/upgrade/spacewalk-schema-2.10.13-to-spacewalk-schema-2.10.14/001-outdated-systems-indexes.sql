--
-- Copyright (C) 2021 Oracle and/or its affiliates. All rights reserved.
--
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation, version 2
--
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301, USA.
--

CREATE INDEX rhn_channel_id_name_idx
    ON rhnChannel(parent_channel, id, name)
    TABLESPACE [[64k_tbs]]
    NOLOGGING;

CREATE INDEX rhn_errata_advisory_type_id_idx
    ON rhnErrata(advisory_type, id);
    TABLESPACE [[64k_tbs]]
    NOLOGGING;

CREATE INDEX rhn_snc_server_errata_id_idx
    ON rhnServerNeededCache(server_id, errata_id)
    TABLESPACE [[128m_tbs]]
    NOLOGGING;
