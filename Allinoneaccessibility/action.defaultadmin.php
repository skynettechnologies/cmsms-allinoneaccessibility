<?php
#---------------------------------------------------------------------------------------------------
# Module: Allinoneaccessibility
# Author: Skynet Technologies USA LLC
# Copyright: (C) 2023 Skynet Technologies USA LLC, hello@skynettechnologies.com
# Licence: GNU General Public License version 3
#          see /Allinoneaccessibility/lang/LICENCE.txt or <http://www.gnu.org/licenses/gpl-3.0.html>
#---------------------------------------------------------------------------------------------------

if( !defined('CMS_VERSION') ) exit;

if( !$this->CheckPermission(Allinoneaccessibility::MANAGE_PERM) ) return;
    $aioa = new AllinoneaccessibilityItem();

    if( isset($params['submit']) ) {
    $dataquery = new AllinoneaccessibilityQuery;
    $check_aioadata = $dataquery->GetMatches(); 
    $domain = parse_url($config['root_url'], PHP_URL_HOST);

    /* Start Code Check Key Valid OR Not */
    $url = "https://www.skynettechnologies.com/add-ons/license-api.php?";
    $postdata['token'] = trim($params['license_key']);
    $postdata['SERVER_NAME'] = $domain;

    $curl = curl_init($url);
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_POSTFIELDS, $postdata);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    $resp = curl_exec($curl);
    $resp = json_decode($resp);

    if (empty($resp->accessibilityloader) ){
        $is_valid = 0;
    }else{
        $is_valid = 1;
    }
    /* End Code Check Key Valid OR Not */

    /* Start Code For Save Data on server By API */

    $url = "https://ada.skynettechnologies.us/api/widget-setting-update-platform";
    $data = [
        'u'                 => $domain,
        'widget_position'   => ($params['position'] != '') ? $params['position'] : "",
        'widget_color_code' => ($params['color'] != '') ? $params['color'] : "",
        'widget_icon_type'  => ($params['icon_type'] != '') ? $params['icon_type'] : "",
        'widget_icon_size'  => ($params['icon_size'] != '') ? $params['icon_size'] : ""
    ];

    $curl = curl_init($url);
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_POST, true);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_POSTFIELDS, $data);

    $resp = curl_exec($curl);
    curl_close($curl);

    /* End Code For Save Data on server By API */

    $aioa->license_key = trim($params['license_key']);
    $aioa->color = ($params['color']);
    $aioa->position = ($params['position']);
    $aioa->icon_type = $params['icon_type'];
    $aioa->icon_size = $params['icon_size'];
    $aioa->is_key_valid = $is_valid;
    $aioa->domain = $domain;
    $aioa->id = $check_aioadata ? $check_aioadata[0]->id : 0;
    $aioa->save();
    
    $this->SetMessage($this->Lang('setting_saved'));
    $this->RedirectToAdminTab();
}

$query = new AllinoneaccessibilityQuery;
$aioadata = $query->GetMatches();
$data = $aioadata ? $aioadata[0] : '';

if(!$data){
    $default_data = [
        'license_key' => '',
        'color'=>'#420083',
        'position'=>'bottom_right',
        'icon_type'=>'aioa-icon-type-1',
        'icon_size'=>'aioa-medium-icon',
        'icon_url'=> "https://skynettechnologies.com/sites/default/files/python/aioa-icon-type-1.svg",
        'is_key_valid'=>0,
        'domain'=>parse_url($config['root_url'], PHP_URL_HOST)
    ];
    $data = (object) $default_data;
}


$tpl = $smarty->CreateTemplate($this->GetTemplateResource('defaultadmin.tpl'),null,null,
$smarty);
$tpl->assign('data',$data);
$tpl->display();
