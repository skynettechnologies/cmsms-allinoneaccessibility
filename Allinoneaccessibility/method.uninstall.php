<?php
#---------------------------------------------------------------------------------------------------
# Module: Allinoneaccessibility
# Author: Skynet Technologies USA LLC
# Copyright: (C) 2023 Skynet Technologies USA LLC, hello@skynettechnologies.com
# Licence: GNU General Public License version 3
#          see /Allinoneaccessibility/lang/LICENCE.txt or <http://www.gnu.org/licenses/gpl-3.0.html>
#---------------------------------------------------------------------------------------------------

if( !defined('CMS_VERSION') ) exit;
$this->RemovePermission(Allinoneaccessibility::MANAGE_PERM);
$db = $this->GetDb();
$dict = NewDataDictionary( $db );
$sqlarray = $dict->DropTableSQL( CMS_DB_PREFIX.'mod_allinoneaccessibilty');
$dict->ExecuteSQLArray($sqlarray);