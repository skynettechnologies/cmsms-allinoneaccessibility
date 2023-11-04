<?php
#---------------------------------------------------------------------------------------------------
# Module: Allinoneaccessibility
# Author: Skynet Technologies USA LLC
# Copyright: (C) 2023 Skynet Technologies USA LLC, hello@skynettechnologies.com
# Licence: GNU General Public License version 3
#          see /Allinoneaccessibility/lang/LICENCE.txt or <http://www.gnu.org/licenses/gpl-3.0.html>
#---------------------------------------------------------------------------------------------------

class AllinoneaccessibilityQuery extends CmsDbQueryBase
{
    public function execute()
    {
        if( !is_null($this->_rs) ){ return; } 
        $sql = 'SELECT SQL_CALC_FOUND_ROWS H.*
        FROM '.CMS_DB_PREFIX.'mod_allinoneaccessibilty H ORDER BY id DESC';
        $db = \cms_utils::get_db();
        $this->_rs = $db->SelectLimit($sql,1,$this->_offset);
        IF( $db->ErrorMsg() ) throw new \CmsSQLErrorException($db->sql.' -- '.$db->ErrorMsg());
        $this->_totalmatchingrows = $db->GetOne('SELECT FOUND_ROWS()');
    }

    public function &GetObject()
    {
        $obj = new AllinoneaccessibilityItem;
        $obj->fill_from_array($this->fields);
        return $obj;
    }
}
?>