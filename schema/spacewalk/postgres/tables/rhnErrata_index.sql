-- oracle equivalent source sha1 8ac74bb5f7e63f340a9b9e90950ad2a4dd8baf99
--
-- Copyright (c) 2017 Red Hat, Inc.
--
-- This software is licensed to you under the GNU General Public License,
-- version 2 (GPLv2). There is NO WARRANTY for this software, express or
-- implied, including the implied warranties of MERCHANTABILITY or FITNESS
-- FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv2
-- along with this software; if not, see
-- http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
--
-- Red Hat trademarks are not licensed under GPLv2. No permission is
-- granted to use or replicate Red Hat trademarks that are incorporated
-- in this software or its documentation.
--

CREATE UNIQUE INDEX rhn_errata_advname_uq
    ON rhnErrata (advisory_name)
 WHERE org_id IS NULL;

CREATE UNIQUE INDEX rhn_errata_advname_org_uq
    ON rhnErrata (advisory_name, org_id)
 WHERE org_id IS NOT NULL;

CREATE UNIQUE INDEX rhn_errata_adv_uq
    ON rhnErrata (advisory)
 WHERE org_id IS NULL;

CREATE UNIQUE INDEX rhn_errata_adv_org_uq
    ON rhnErrata (advisory, org_id)
 WHERE org_id IS NOT NULL;

CREATE INDEX rhn_errata_adv_typ_id_idx
    ON rhnErrata(advisory_type, id)
 WHERE org-id IS NOT NULL;

CREATE INDEX rhn_errata_syn_regex_idx
    ON rhnErrata (substring(synopsis FROM '[^ ]+:[^ ]+'))
 WHERE org-id IS NOT NULL;


