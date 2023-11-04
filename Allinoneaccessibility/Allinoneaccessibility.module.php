<?php
#---------------------------------------------------------------------------------------------------
# Module: Allinoneaccessibility
# Author: Skynet Technologies USA LLC
# Copyright: (C) 2023 Skynet Technologies USA LLC, hello@skynettechnologies.com
# Module's homepage is: http://dev.cmsmadesimple.org/projects/allinoneaccessibility
# Licence: GNU General Public License version 3
#          see /Allinoneaccessibility/lang/LICENCE.txt or <http://www.gnu.org/licenses/>
#---------------------------------------------------------------------------------------------------
# CMS - CMS Made Simple is (c) 2019 by CMS Made Simple Foundation (copyright@cmsmadesimple.org)
# Project's homepage is: http://www.cmsmadesimple.org
#---------------------------------------------------------------------------------------------------
# This program is free software; you can redistribute it and/or modify it under the terms of the
# GNU General Public License as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with this program.
# If not, see <http://www.gnu.org/licenses/>.
#---------------------------------------------------------------------------------------------------

class Allinoneaccessibility extends CMSModule
{
    const MANAGE_PERM = 'manage_allinoneaccessibility';

    public function GetVersion() { 
        return '1.0.0'; 
    }

    public function GetFriendlyName() { 
        return $this->Lang('friendlyname'); 
    }

    public function GetAdminDescription() { 
        return $this->Lang('admindescription'); 
    }

    public function IsPluginModule() { 
        return TRUE; 
    }

    public function HasAdmin() { 
        return TRUE; 
    }

    public function VisibleToAdminUser() { 
        return $this->CheckPermission(self::MANAGE_PERM); 
    }

    public function GetAuthor() { 
        return 'Skynet Technologies USA LLC'; 
    }

    public function GetAuthorEmail() { 
        return 'hello@skynettechnologies.com '; 
    }

    public function UninstallPreMessage() { 
        return $this->Lang('ask_uninstall'); 
    }

    public function InitializeFrontend() {
        $this->RegisterModulePlugin();
        $sql = 'SELECT *
        FROM '.CMS_DB_PREFIX.'mod_allinoneaccessibilty H ORDER BY id DESC';
        $db = \cms_utils::get_db();
        $data = $db->GetRow($sql);
    
        if(!$data){
            $data = [
                'license_key' => '',
                'color'=>'#420083',
                'position'=>'bottom_right',
                'icon_type'=>'aioa-icon-type-1',
                'icon_size'=>'aioa-medium-icon',
            ];
        }
        
        echo '<script id="aioa-adawidget" src="https://www.skynettechnologies.com/accessibility/js/all-in-one-accessibility-js-widget-minify.js?colorcode='.$data['color'].'&token='.$data['license_key'].'&position='.$data['position'].'.'.$data['icon_type'].'.'.$data['icon_size'].' " async=""></script>';
        
    }

    
}