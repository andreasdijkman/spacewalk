-- Copyright (C) 2023 Oracle and/or its affiliates.
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

DROP INDEX rhn_sp_snep_uq;

DROP INDEX rhn_pe_mod_bmp;



CREATE INDEX rhn_err_syn_id_idx
    ON rhnErrata(synopsis, id)
    TABLESPACE [[64k_tbs]]
    NOLOGGING;

CREATE INDEX rhn_pkg_evr_pid_idx
    ON rhnPackage (evr_id, id)
    TABLESPACE [[64k_tbs]]
    NOLOGGING;

CREATE UNIQUE INDEX rhn_pe_mod_id
    ON rhnPackageEvr(modular, id)
    TABLESPACE [[64k_tbs]]
    NOLOGGING;

CREATE UNIQUE INDEX rhn_sp_senp_uq
    ON rhnServerPackage (server_id, evr_id, name_id, package_arch_id)
    TABLESPACE [[128m_tbs]]
    NOLOGGING;
