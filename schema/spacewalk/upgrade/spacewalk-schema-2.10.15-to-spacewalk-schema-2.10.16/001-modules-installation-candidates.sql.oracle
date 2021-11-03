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
CREATE OR REPLACE VIEW
RHNCHANMODSRVSUBSVIEW
(
	PARENT_CHANNEL_ID,
	PARENT_CHANNEL_LABEL,
	PARENT_CHANNEL_NAME,
	CHANNEL_ID,
	CHANNEL_LABEL,
	CHANNEL_NAME,
	CHANNEL_MODULE_STREAM,
	SERVER_ID,
	SERVER_MODULE_STREAM
)
AS
SELECT DISTINCT
        pc.id AS parent_channel_id,
	pc.label AS parent_channel_label,
        pc.name AS parent_channel_name,
	c.id AS channel_id,
        c.label AS channel_label,
        c.name AS channel_name,
        regexp_substr(e.synopsis,'[^ ]+:[^ ]+') AS channel_module_stream,
        sc.server_id,
	smv.module_stream as server_module_stream
FROM
	rhnChannel c
        JOIN rhnChannel pc ON (c.PARENT_CHANNEL = pc.id
	     		       OR c.PARENT_CHANNEL IS NULL)
	LEFT OUTER JOIN rhnServerChannel sc ON sc.channel_id = c.id
	JOIN rhnChannelPackage cp ON cp.channel_id = c.id
	JOIN rhnPackage p ON cp.package_id = p.id
	JOIN rhnErrataPackage ep ON p.id = ep.package_id
	JOIN rhnErrata e ON ep.errata_id = e.id
	JOIN rhnPackageEvr pe ON p.evr_id = pe.id
	LEFT OUTER JOIN rhnServerModulesView smv ON (regexp_substr(e.synopsis,'[^ ]+:[^ ]+') = smv.module_stream
                                                     AND sc.server_id = smv.server_id)
WHERE lower(pe.release) LIKE '%module+%'
AND regexp_substr(e.synopsis,'[^ ]+:[^ ]+') IS NOT NULL
ORDER BY pc.label, c.label, channel_module_stream, sc.server_id;
