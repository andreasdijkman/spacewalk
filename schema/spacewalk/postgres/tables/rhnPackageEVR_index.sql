-- oracle equivalent source sha1 da58729447ffdfef410e10523f99a83ce08096d7
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

create unique index rhn_pe_v_r_e_uq
    on rhnpackageevr (version, release, epoch)
 where epoch is not null;

create unique index rhn_pe_v_r_uq
    on rhnpackageevr (version, release)
 where epoch is null;

CREATE INDEX RHN_PE_MOD_BMP
    ON RHNPACKAGEEVR (MODULAR);
