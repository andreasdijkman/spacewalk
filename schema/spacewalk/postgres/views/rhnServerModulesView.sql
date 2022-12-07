-- oracle equivalent source sha1 1c55b936b718e368b8cb78b2b3d9a458865d5f11
--
-- Copyright (C) 2020 Oracle and/or its affiliates. All rights reserved.
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
CREATE OR REPLACE VIEW RHNSERVERMODULESVIEW (SERVER_ID, MODULE_STREAM) AS
 SELECT DISTINCT
   sp.server_id,
   substring(e.synopsis FROM '[^ ]+:[^ ]+') AS module_stream
 FROM
     rhnServerPackage sp
     JOIN rhnPackageEvr     pe ON sp.evr_id = pe.id
     JOIN rhnPackage        p ON pe.id = p.evr_id
     JOIN rhnErrataPackage  ep ON p.id = ep.package_id
     JOIN rhnErrata         e ON ep.errata_id = e.id
WHERE
      pe.modular = 1
      AND substring(e.synopsis FROM '[^ ]+:[^ ]+') IS NOT NULL;
