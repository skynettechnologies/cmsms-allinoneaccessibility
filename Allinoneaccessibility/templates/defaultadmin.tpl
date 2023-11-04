<style>
    .aioa-settings-panel .input-hidden {
        position: absolute;
        left: -9999px;
    }
    .aioa-settings-panel .icon input[type=radio] +label{
        width: 130px;
        height: 130px;
        padding: 10px !important;
        text-align: center;
        background-color: #f7f9ff;
        outline: 4px solid #f7f9ff;
        outline-offset: -4px;
        border-radius: 10px;
    }
    .aioa-settings-panel .icon input[type=radio]:checked+label {
        outline-color: #80c944;
        position: relative;
    }

    .aioa-settings-panel .icon input[type=radio]:checked+label::before {

        content: "";
        width: 20px;
        height: 20px;
        position: absolute;
        left: auto;
        right: -4px;
        top: -4px;
        background: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 25 25' class='aioa-feature-on'%3E%3Cg%3E%3Ccircle fill='%2343A047' cx='12.5' cy='12.5' r='12'%3E%3C/circle%3E%3Cpath fill='%23FFFFFF' d='M12.5,1C18.9,1,24,6.1,24,12.5S18.9,24,12.5,24S1,18.9,1,12.5S6.1,1,12.5,1 M12.5,0C5.6,0,0,5.6,0,12.5S5.6,25,12.5,25S25,19.4,25,12.5S19.4,0,12.5,0L12.5,0z'%3E%3C/path%3E%3C/g%3E%3Cpolygon fill='%23FFFFFF' points='9.8,19.4 9.8,19.4 9.8,19.4 4.4,13.9 7.1,11.1 9.8,13.9 17.9,5.6 20.5,8.4 '%3E%3C/polygon%3E%3C/svg%3E") no-repeat center center/contain !important;
        border: none;
    }

    /* IMAGE STYLES */
    .aioa-settings-panel input[type=radio]+label>img {
        cursor: pointer;
    }

    .aioa-settings-panel .icon-label {
        display: flex;
        justify-content: center;
        height: 90px;
        width: 90px;
        border: 2px solid gray;
        border-radius: 3px;
    }

    .aioa-settings-panel label {
        font-weight: bold !important;
    }

    .d-none {
        display: none;
    }

    .aioa-settings-panel {
        font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", "Noto Sans", "Liberation Sans", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
        box-sizing: border-box;
    }

    .aioa-settings-panel *,
    .aioa-settings-panel *::after,
    .aioa-settings-panel *::before {
        box-sizing: border-box;
    }

    .aioa-settings-panel .form-group {
        margin-bottom: 1rem;
        margin-top: 1rem;
    }

    .aioa-settings-panel .panel-body {
        padding-left: 0.75rem;
        padding-right: 0.75rem;
    }

    .aioa-settings-panel .row {
        display: flex;
        flex-wrap: wrap;
        margin-left: -0.75rem;
        margin-right: -0.75rem;
    }

    .aioa-settings-panel .row>* {
        padding-right: 0.75rem;
        padding-left: 0.75rem;
    }


    @media screen and (min-width:576px) {
        .aioa-settings-panel .col-sm-2 {
            flex: 0 0 auto;
            width: 16.66666%;
        }

        .aioa-settings-panel .col-sm-10 {
            flex: 0 0 auto;
            width: 83.33333%;
        }

        .aioa-settings-panel .col-sm-8 {
            flex: 0 0 auto;
            width: 66.6666%;
        }

        .aioa-settings-panel .col-sm-3 {
            flex: 0 0 auto;
            width: 25%;
        }
    }

    .aioa-settings-panel .form-control {
        display: block;
        width: 100%;
        padding: .375rem .75rem;
        font-size: 1rem;
        font-weight: 400;
        line-height: 1.5;
        color: #212529;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #ced4da;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        border-radius: .25rem;
        transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;

    }

    .aioa-settings-panel .form-control:focus {
        border-color: rgba(66, 0, 131, .3803921569);
        box-shadow: 0 0 0 0.25rem rgba(66, 0, 131, .2);
        outline: 0;
    }

    .aioa-settings-panel .visually-hidden,
    .aioa-settings-panel .visually-hidden-focusable:not(:focus):not(:focus-within) {
        position: absolute !important;
        width: 1px !important;
        height: 1px !important;
        padding: 0 !important;
        margin: -1px !important;
        overflow: hidden !important;
        clip: rect(0, 0, 0, 0) !important;
        white-space: nowrap !important;
        border: 0 !important;
    }
    .d-none{
        display:none !important;
    }
    #invalid-key-msg{
        color:red;
    }
    #settings-license_key_msg{
        margin-top : 0.1rem;
    }
    .loading {
        position: fixed;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        opacity: 0.7;
        background-color: #fff;
        z-index: 99;
    }

    .loading-image {
        z-index: 100;
    }    
</style>

<div class="panel panel-default aioa-settings-panel">
   	<div class="panel-body">
		{form_start}
			<div class="pageoverflow">
				<p class="pageinput">
				<input type="submit" name="{$actionid}submit" value="{$mod->Lang('submit')}"/>
				</p>
			</div>
			<div class="form-group row">
				<label class="col-sm-2" for="input-status">{$mod->Lang('license_key')}</label>
				<div class="col-sm-10">
					<input type="text" name="{$actionid}license_key" value="{$data->license_key}" placeholder="{$mod->Lang('enter_license_key')}"
						id="input-name" class="form-control license_key"/>
				</div>
				<div class="col-sm-2"></div>
				<div class="col-sm-10">
					<div style="margin-top: 5px;">
						{if $data->license_key != '' && $data->is_key_valid == 0}<span id="invalid-key-msg">{$mod->Lang('key_invalid')}</span>{/if}
						{if $data->is_key_valid == 0}
                        <p id="license_key_msg">
							{$mod->Lang('please')} <a href="https://www.skynettechnologies.com/add-ons/cart/?add-to-cart=116&variation_id=117&quantity=1&utm_source={$data->domain}&utm_medium=cmsmadesimple-module&utm_campaign=purchase-plan" target="_blank">{$mod->Lang('upgrade')}</a>
							{$mod->Lang('key_msg')}</p>
                        {/if}
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2" for="input-status">{$mod->Lang('color')}</label>
				<div class="col-sm-8">
				<input type="text" name="{$actionid}color" value="{$data->color}"
					id="colorcode" class="form-control colorint" placeholder="{$mod->Lang('enter_color')}"></input>
				</div>
				<div class="col-sm-2">
				<input type="color" id="colorpicker" name="{$actionid}colorpicker" class="colorpicker"
					 value="{$data->color}" style="height: 37px">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2" for="input-status">{$mod->Lang('position')}</label>
				<div class="col-sm-10">
				<div style="font-weight: bold">
					Where would you like to place the accessibility icon on your site?
				</div>
				</div>
				<div class="col-sm-2"></div>
				<div class="col-sm-3">
				<input type="radio" name="{$actionid}position" id="aioaPositionTL" class="aioa-position" value="top_left" {if $data->position == 'top_left'}checked="checked"{/if}>
				<label for="aioaPositionTL" style="font-weight:normal !important">Top left</label><br>
				<input type="radio" name="{$actionid}position" id="aioaPositionTC" class="aioa-position" value="top_center" {if $data->position == 'top_center'}checked="checked"{/if}>
				<label for="aioaPositionTC" style="font-weight:normal !important">Top Center</label><br>
				<input type="radio" name="{$actionid}position" id="aioaPositionTR" class="aioa-position" value="top_right" {if $data->position == 'top_right'}checked="checked"{/if}>
				<label for="aioaPositionTR" style="font-weight:normal !important">Top Right</label>
				</div>
				<div class="col-sm-3">
				<input type="radio" name="{$actionid}position" id="aioaPositionBL" class="aioa-position" value="bottom_left" {if $data->position == 'bottom_left'}checked="checked"{/if}>
				<label for="aioaPositionBL" style="font-weight:normal !important">Bottom left</label><br>
				<input type="radio" name="{$actionid}position" id="aioaPositionBR" class="aioa-position" value="bottom_right" {if $data->position == 'bottom_right'}checked="checked"{/if}>
				<label for="aioaPositionBR" style="font-weight:normal !important">Bottom Right</label><br>
				<input type="radio" name="{$actionid}position" id="aioaPositionBC" class="aioa-position" value="bottom_center" {if $data->position == 'bottom_center'}checked="checked"{/if}>
				<label for="aioaPositionBC" style="font-weight:normal !important">Bottom Center</label>
				</div>
				<div class="col-sm-3">
				<input type="radio" name="{$actionid}position" id="aioaPositionML" class="aioa-position" value="middel_left" {if $data->position == 'middel_left'}checked="checked"{/if}>
				<label for="aioaPositionML" style="font-weight:normal !important">Middle left</label><br>
				<input type="radio" name="{$actionid}position" id="aioaPositionMR" class="aioa-position" value="middel_right" {if $data->position == 'middel_right'}checked="checked"{/if}>
				<label for="aioaPositionMR" style="font-weight:normal !important">Middle Right</label>
				</div>
			</div>
            
			<div class="form-group row mt-4 icon aioa-icon-type {if ($data->is_key_valid == 0)}d-none{/if}">
				<label class="col-sm-2">{$mod->Lang('icon_type')}</label>
				<div class="col-sm-2">
				<input type="radio" id="edit-type-1" name="{$actionid}icon_type" value="aioa-icon-type-1"
					class="input-hidden icon_type" {if $data->icon_type == 'aioa-icon-type-1' } checked {/if}>
				<label for="edit-type-1" class="icon-label">
					<img src="https://skynettechnologies.com/sites/default/files/python/aioa-icon-type-1.svg"
							width="65" height="65" id="aioa-icon-type-1-img" style="margin: auto" />
					<span class="visually-hidden">Type 1</span>
				</label>
				</div>
				<div class="col-sm-2">
				<input type="radio" id="edit-type-2" name="{$actionid}icon_type" value="aioa-icon-type-2"
					class="input-hidden icon_type" {if $data->icon_type == 'aioa-icon-type-2' } checked {/if}>
				<label for="edit-type-2" class="icon-label">
					<img src="https://skynettechnologies.com/sites/default/files/python/aioa-icon-type-2.svg"
							width="65" height="65" id="aioa-icon-type-2-img" style="margin: auto" />
					<span class="visually-hidden">Type 2</span>
				</label>
				</div>
				<div class="col-sm-2">
				<input type="radio" id="edit-type-3" name="{$actionid}icon_type" value="aioa-icon-type-3"
					class="input-hidden icon_type" {if $data->icon_type == 'aioa-icon-type-3' } checked {/if}>
				<label for="edit-type-3" class="icon-label">
					<img src="https://skynettechnologies.com/sites/default/files/python/aioa-icon-type-3.svg"
							width="65" height="65" id="aioa-icon-type-3-img" style="margin: auto" />
					<span class="visually-hidden">Type 3</span>
				</label>
				</div>
			</div>
            
			<div class="form-group row mt-4 icon {if ($data->is_key_valid == 0)}d-none{/if}">
				<label class="col-sm-2" style="margin: auto">{$mod->Lang('icon_size')}</label>
				<div class="col-sm-2">
				<input type="radio" id="edit-size-big" name="{$actionid}icon_size" value="aioa-big-icon" class="input-hidden aioa-iconsize"
					{if $data->icon_size == 'aioa-big-icon' } checked {/if}>
				<label for="edit-size-big" class="icon-label">
					<img src="https://skynettechnologies.com/sites/default/files/python/{$data->icon_type}.svg"
							width="75" height="75" style="margin: auto" class="icon-img" />
					<span class="visually-hidden">Type 1</span>
				</label>
				</div>
				<div class="col-sm-2">
				<input type="radio" id="edit-size-medium" name="{$actionid}icon_size" value="aioa-medium-icon"
					class="input-hidden aioa-iconsize" {if $data->icon_size == 'aioa-medium-icon' } checked {/if}>
				<label for="edit-size-medium" class="icon-label">
					<img src="https://skynettechnologies.com/sites/default/files/python/{$data->icon_type}.svg"
							width="65" height="65" style="margin: auto" class="icon-img" />
					<span class="visually-hidden">Type 2</span>
				</label>
				</div>
				<div class="col-sm-2">
				<input type="radio" id="edit-size-default" name="{$actionid}icon_size" value="aioa-default-icon"
					class="input-hidden aioa-iconsize" {if $data->icon_size == 'aioa-default-icon' } checked {/if}>
				<label for="edit-size-default" class="icon-label">
					<img src="https://skynettechnologies.com/sites/default/files/python/{$data->icon_type}.svg" width="55" height="55" style="margin: auto" class="icon-img" />
					<span class="visually-hidden">Type 3</span>
				</label>
				</div>
				<div class="col-sm-2">
				<input type="radio" id="edit-size-small" name="{$actionid}icon_size" value="aioa-small-icon"
					class="input-hidden aioa-iconsize" {if $data->icon_size == 'aioa-small-icon' } checked {/if}>
				<label for="edit-size-small" class="icon-label">
					<img src="https://skynettechnologies.com/sites/default/files/python/{$data->icon_type}.svg"
							width="45" height="45" style="margin: auto" class="icon-img" />
					<span class="visually-hidden">Type 3</span>
				</label>
				</div>
				<div class="col-sm-2">
				<input type="radio" id="edit-size-extra-small" name="{$actionid}icon_size"
					value="aioa-extra-small-icon"" class="input-hidden aioa-iconsize" {if $data->icon_size == 'aioa-extra-small-icon' } checked {/if}>
				<label for="edit-size-extra-small" class="icon-label">
					<img src="https://skynettechnologies.com/sites/default/files/python/{$data->icon_type}.svg"
							width="35" height="35" style="margin: auto" class="icon-img" />
					<span class="visually-hidden">Type 3</span>
				</label>
				</div>
			</div>
            
		{form_end}
   	</div>
</div>
<script>
	setTimeout(function() {
		$('#invalid-key-msg').fadeOut('slow');
	}, 3000);
    
	$('#colorpicker').on('input', function() {
		$('#colorcode').val(this.value);
	});

	$('#colorcode').on('input', function() {
		$('#colorpicker').val(this.value);
	});

	$(".icon_type").change(function () {
        var iconType = $(this).val();
		var iconImg = $("#"+iconType+"-img").attr("src");
		console.log($("#"+iconType+"-img").attr("src"));
		$(".icon-img").attr("src", iconImg);
	});

</script>