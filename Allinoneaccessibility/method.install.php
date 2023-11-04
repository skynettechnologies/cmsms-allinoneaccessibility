<?php
#---------------------------------------------------------------------------------------------------
# Module: Allinoneaccessibility
# Author: Skynet Technologies USA LLC
# Copyright: (C) 2023 Skynet Technologies USA LLC, hello@skynettechnologies.com
# Licence: GNU General Public License version 3
#          see /Allinoneaccessibility/lang/LICENCE.txt or <http://www.gnu.org/licenses/gpl-3.0.html>
#---------------------------------------------------------------------------------------------------


if( !defined('CMS_VERSION') ) exit;
    $this->CreatePermission(Allinoneaccessibility::MANAGE_PERM,'Manage Allinoneaccessibility');
    $db = $this->GetDb();
    $dict = NewDataDictionary($db);
    $taboptarray = array('mysql' => 'TYPE=MyISAM');
    $flds = "
    id I KEY AUTO,
    license_key C(255),
    color C(255),
    position C(255),
    icon_type C(255),
    icon_size C(255),
    is_key_valid I1,
    domain C(255)
    ";

$sqlarray = $dict->CreateTableSQL(CMS_DB_PREFIX.'mod_allinoneaccessibilty',$flds,$taboptarray);
$dict->ExecuteSQLArray($sqlarray);

