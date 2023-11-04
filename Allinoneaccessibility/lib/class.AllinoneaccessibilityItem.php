<?php
#---------------------------------------------------------------------------------------------------
# Module: Allinoneaccessibility
# Author: Skynet Technologies USA LLC
# Copyright: (C) 2023 Skynet Technologies USA LLC, hello@skynettechnologies.com
# Licence: GNU General Public License version 3
#          see /Allinoneaccessibility/lang/LICENCE.txt or <http://www.gnu.org/licenses/gpl-3.0.html>
#---------------------------------------------------------------------------------------------------

class AllinoneaccessibilityItem
{
    private $_data = [
        'id'=>null,
        'license_key'=>null,
        'color'=>null,
        'position'=>null,
        'icon_type'=>null,
        'icon_size'=>null,
        'is_key_valid'=>null,
        'domain'=>null,
    ];

    public function __get($key)
    {
        switch( $key ) {
            case 'id':
            case 'license_key':
            case 'color':
            case 'position':
            case 'icon_type':
            case 'icon_size':
            case 'is_key_valid':
            case 'domain':
            return $this->_data[$key];
        }
    }

    public function __set($key,$val)
    {
        switch( $key ) {
        case 'id':
        case 'license_key':
        case 'color':
        case 'position':
        case 'icon_type':
        case 'icon_size':
        case 'is_key_valid':
        case 'domain':
        $this->_data[$key] = trim($val);
        break;
        $this->_data[$key] = (int) $val;
        break;
        }
    }
    public function save()
    {
        if( $this->id > 0 ) {
            $this->update();
        } else {
            $this->insert();
        }
    }

    
    protected function insert()
    {
        $db = \cms_utils::get_db();
        $sql = 'INSERT INTO '.CMS_DB_PREFIX.'mod_allinoneaccessibilty
        (license_key,color,position,icon_type,icon_size,is_key_valid,domain)
        VALUES (?,?,?,?,?,?,?)';
        $dbr = $db->Execute($sql,array($this->license_key,$this->color,$this->position,
        $this->icon_type,$this->icon_size,$this->is_key_valid,$this->domain));
        if( !$dbr ) return FALSE;
        $this->_data['id'] = $db->Insert_ID();
        return TRUE;
    }
    protected function update()
    {
        $db = \cms_utils::get_db();
        $sql = 'UPDATE '.CMS_DB_PREFIX.'mod_allinoneaccessibilty SET license_key = ?, color = ?,
        position = ?, icon_type = ?, icon_size = ? , is_key_valid = ? , domain = ? WHERE id = ?';
        
        $dbr = $db->Execute($sql,array($this->license_key,$this->color,$this->position,
        $this->icon_type,$this->icon_size,$this->is_key_valid,$this->domain,$this->id));
        if( !$dbr ) return FALSE;
        return TRUE;
    }
    /** internal */
    public function fill_from_array($row)
    {
        foreach( $row as $key => $val ) {
            if( array_key_exists($key,$this->_data) ) {
                $this->_data[$key] = $val;
            }
        }
    }

    
}
?>
   