<?php
/**
 * @version    $Id$
 * @package    SUN Framework
 * @author     JoomlaShine Team <support@joomlashine.com>
 * @copyright  Copyright (C) 2012 JoomlaShine.com. All Rights Reserved.
 * @license    GNU/GPL v2 or later http://www.gnu.org/licenses/gpl-2.0.html
 *
 * Websites: http://www.joomlashine.com
 * Technical Support:  Feedback - http://www.joomlashine.com/contact-us/get-support.html
 */

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

/**
 * Class that handles general template admin Ajax requests.
 *
 * @package  SUN Framework
 * @since    1.3.0
 */
class SunFwAjaxAdmin extends SunFwAjax
{

	/**
	 * Get components for rendering template admin screen.
	 *
	 * @return  void
	 */
	public function getAction()
	{
		// Get the first template style ID.
		$this->dbo->setQuery(
			'SELECT id FROM #__template_styles WHERE template = ' . $this->dbo->quote($this->templateName) . 'ORDER BY home DESC, id ASC',
			0, 1);

		$firstStyle = $this->dbo->loadResult();

		// Get root URL.
		$root = JUri::root();

		// Get template style data.
		$this->dbo->setQuery('SELECT COUNT(id) FROM #__sunfw_styles WHERE template = ' . $this->dbo->quote($this->templateName));

		$hasData = $this->dbo->loadResult();

		// Get authorization token.
		$params = SunFwHelper::getExtensionParams('template', $this->template['name']);

		if (empty($params['token']))
		{
			$params = SunFwHelper::getExtensionParams('plugin', 'sunfw', 'system');

			if (!empty($params['token']))
			{
				SunFwHelper::updateExtensionParams(array(
					'token' => $params['token']
				), 'template', $this->template['name']);
			}
		}

		// Get active languages if multi-language is in use.
		$lang = array();

		if (JLanguageMultilang::isEnabled() && method_exists('JLanguageHelper', 'getInstalledLanguages'))
		{
			$lang = JLanguageHelper::getInstalledLanguages(0);

			// Get URL Language Code.
			$dbo = JFactory::getDbo();

			$qry = $dbo->getQuery(true)
				->select('lang_code, sef')
				->from('#__languages')
				->where('lang_code IN (' . implode(', ', array_map(array(
				$dbo,
				'quote'
			), array_keys($lang))) . ')');

			$dbo->setQuery($qry);

			$lang = $dbo->loadAssocList('lang_code', 'sef');
		}

		// Get registered username.
		$params = SunFwHelper::getExtensionParams('template', $this->template['name']);

		// Define base Ajax URL.
		$ajaxBase = "{$root}administrator/index.php?option=com_ajax&format=json&plugin=sunfw&template_name={$this->templateName}&style_id={$this->styleID}&" .
			 JSession::getFormToken() . '=1';

		// Get documentation link.
		$this->documentationLink = '#';

		if (preg_match('/^tpl_([^\d]+)(\d*)$/', $this->template['id'], $match))
		{
			$name = $match[1];
			$gene = empty($match[2]) ? $name : "{$name}-{$match[2]}";

			$this->documentationLink = sprintf(SUNFW_DOCUMENTATION_URL, $name, $gene);
		}

		// Get plugin params.
		$pluginParams = SunFwHelper::getExtensionParams('plugin', 'sunfw', 'system');

		// Get Google Analytics profile ID.
		$cache = JFactory::getConfig()->get('tmp_path') . "/{$this->template['id']}/product-info.json";

		if (is_file($cache) && ( time() - filemtime($cache) < 60 * 60 ) && ( $info = file_get_contents($cache) ) != '')
		{
			$info = json_decode($info);
		}
		elseif (!empty($params['token']))
		{
			// Instantiate a HTTP client.
			$http = new JHttp();
			$link = SUNFW_GET_INFO_URL;

			// Build URL for requesting product info.
			$link .= '&token=' . $params['token'] . '&identified_name=' . SUNFW_ID;

			// Send a request to JoomlaShine server to get product info.
			try
			{
				$info = $http->get($link);

				// Cache license data to a local file.
				file_put_contents($cache, $info->body);

				$info = json_decode($info->body);
			}
			catch (Exception $e)
			{
				// Reuse cache file if available.
				if (is_file($cache) && ( $info = file_get_contents($cache) ) != '')
				{
					// Refresh cache file after 1 hour.
					touch($cache);

					$info = json_decode($info);
				}
			}
		}

		// Get license.
		$license = $this->getLicense();

		$this->setResponse(
			array(
				'firstStyle' => $firstStyle,
				'namespace' => md5($root . '|' . $this->templateName . '|' . $this->styleID),
				'hasData' => (int) $hasData,
				'license' => $license,
				'token' => ( empty($params['token']) || empty($license) ) ? '' : $params['token'],
				'lang' => $lang,
				'ga' => array(
					'debug' => false,
					'enabled' => isset($pluginParams['allow_tracking']) ? (int) $pluginParams['allow_tracking'] : 0,
					'profile' => isset($info) ? $info->message->ga_property_id : null,
					'set' => array(
						'dimension1' => $this->template['realName'],
						'dimension2' => 'edition',
						'dimension4' => SUNFW_VERSION,
						'dimension5' => SunFwHelper::getTemplateVersion($this->template['name']),
						'dimension6' => 'width'
					)
				),
				'urls' => array(
					'root' => $root,
					'plugin' => "{$root}plugins/system/sunfw",
					'ajaxBase' => $ajaxBase,
					'configManual' => $this->documentationLink,
					'savePluginParams' => '&action=savePluginParams',
					'Mrk1ZsC2' => '&action=getBanner',
					'nN8dY5cp' => '&context=sample-data&action=get',
					'yuqT1eqf' => '&context=admin&action=tryPro',
					'CgZp5GTv' => sprintf(SUNFW_TEMPLATE_URL, preg_replace('/^tpl_([^\d]+)\d*$/', '\\1', $this->template['id'])),
					'K1m0cfHG' => SUNFW_CUSTOMER_AREA
				),
				'components' => array(
					array(
						'id' => 'alerts',
						'name' => 'ComponentAlerts',
						'data' => $this->getComponentAlerts()
					),
					array(
						'id' => 'header',
						'name' => 'ComponentHeader',
						'data' => $this->getComponentHeader()
					),
					array(
						'id' => 'body',
						'name' => 'ComponentBody',
						'data' => $this->getComponentBody()
					),
					array(
						'id' => 'footer',
						'name' => 'ComponentFooter',
						'data' => $this->getComponentFooter()
					),
					array(
						'id' => 'update',
						'name' => 'ComponentUpdate',
						'data' => $this->getComponentUpdate()
					)
				),
				'textMapping' => array(
					'ok' => JText::_('SUNFW_OK'),
					'cancel' => JText::_('SUNFW_CANCEL'),
					'close' => JText::_('SUNFW_CLOSE'),
					'save' => JText::_('SUNFW_SAVE'),
					'undo' => JText::_('SUNFW_UNDO'),
					'redo' => JText::_('SUNFW_REDO'),
					'loading' => JText::_('SUNFW_LOADING'),
					'yes' => JText::_('SUNFW_YES'),
					'no' => JText::_('SUNFW_NO'),
					'left' => JText::_('SUNFW_LEFT'),
					'center' => JText::_('SUNFW_CENTER'),
					'right' => JText::_('SUNFW_RIGHT'),
					'top' => JText::_('SUNFW_TOP'),
					'middle' => JText::_('SUNFW_MIDDLE'),
					'bottom' => JText::_('SUNFW_BOTTOM'),
					'none' => JText::_('SUNFW_NONE'),
					'text' => JText::_('SUNFW_TEXT'),
					'link' => JText::_('SUNFW_LINK'),
					'icon' => JText::_('SUNFW_ICON'),
					'name' => JText::_('SUNFW_NAME'),
					'normal' => JText::_('SUNFW_NORMAL'),
					'select' => JText::_('SUNFW_SELECT'),
					'effect' => JText::_('SUNFW_EFFECT'),
					'push' => JText::_('SUNFW_PUSH'),
					'slide' => JText::_('SUNFW_SLIDE'),
					'title' => JText::_('SUNFW_TITLE'),
					'general' => JText::_('SUNFW_GENERAL'),
					'effects' => JText::_('SUNFW_EFFECTS'),
					'menu' => JText::_('SUNFW_MENU'),
					'image' => JText::_('SUNFW_IMAGE'),
					'continue' => JText::_('SUNFW_CONTINUE'),
					'all' => JText::_('SUNFW_ALL'),
					'fading' => JText::_('SUNFW_FADING'),
					'module' => JText::_('SUNFW_MODULE'),
					'width' => JText::_('SUNFW_WIDTH'),
					'height' => JText::_('SUNFW_HEIGHT'),
					'back' => JText::_('SUNFW_BACK'),
					'style' => JText::_('SUNFW_STYLE'),
					'skip' => JText::_('SUNFW_SKIP'),
					'color' => JText::_('SUNFW_COLOR'),
					'border' => JText::_('SUNFW_BORDER'),
					'standard' => JText::_('SUNFW_STANDARD'),
					'google' => JText::_('SUNFW_GOOGLE'),
					'custom' => JText::_('SUNFW_CUSTOM'),
					'margin' => JText::_('SUNFW_MARGIN'),
					'padding' => JText::_('SUNFW_PADDING'),
					'icons' => JText::_('SUNFW_ICONS'),
					'language' => JText::_('SUNFW_LANGUAGE'),
					'section' => JText::_('SUNFW_SECTION'),
					'row' => JText::_('SUNFW_ROW'),
					'column' => JText::_('SUNFW_COLUMN'),
					'block' => JText::_('SUNFW_BLOCK'),
					'item' => JText::_('SUNFW_ITEM'),
					'logo' => JText::_('SUNFW_LOGO'),
					'mobile' => JText::_('SUNFW_MOBILE'),
					'desktop' => JText::_('SUNFW_DESKTOP'),
					'laptop' => JText::_('SUNFW_LATOP'),
					'tablet' => JText::_('SUNFW_TABLET'),
					'smartphone' => JText::_('SUNFW_SMARTPHONE'),
					'visibility' => JText::_('SUNFW_VISIBLE'),

					'please-wait' => JText::_('SUNFW_PLEASE_WAIT'),
					'saving-data' => JText::_('SUNFW_SAVING_DATA'),
					'save-success' => JText::_('SUNFW_SAVE_DATA_SUCCESS'),
					'save-all' => JText::_('SUNFW_SAVE_ALL'),
					'no-settings' => JText::_('SUNFW_NO_SETTINGS'),
					'edit-item' => JText::_('SUNFW_EDIT_ITEM'),
					'edit-icon' => JText::_('SUNFW_EDIT_ICON'),
					'text-color' => JText::_('SUNFW_TEXT_COLOR'),
					'custom-classes' => JText::_('SUNFW_CUSTOME_CLASSES'),
					'search-for' => JText::_('SUNFW_SEARCH_FOR'),
					'file-manager' => JText::_('SUNFW_FILE_MANAGER'),
					'choose-image' => JText::_('SUNFW_CHOOSE_IMAGE'),
					'joomla-module' => JText::_('SUNFW_SELECT_JOOMLA_MODULE'),
					'module-style' => JText::_('SUNFW_SELECT_MODULE_STYLE'),
					'alt-text' => JText::_('SUNFW_ALT_TEXT'),
					'start-editing' => JText::_('SUNFW_START_EDITING'),
					'click-to-select' => JText::_('SUNFW_CLICK_TO_SELECT'),
					'title-cannot-be-blank' => JText::_('SUNFW_TITLE_CANNOT_BE_BLANK'),
					'settings-not-available' => JText::_('SUNFW_SETTINGS_NOT_AVAILABLE'),
					'powered-by' => JText::_('SUNFW_POWERED_BY'),
					'update-to' => JText::_('SUNFW_UPDATE_TO'),
					'learn-more' => JText::_('SUNFW_LEARN_MORE'),
					'download-it' => JText::_('SUNFW_DOWNLOAD_IT'),
					'update-product' => JText::_('SUNFW_UPDATE_PRODUCT'),

					'get-started' => JText::_('SUNFW_GET_STARTED'),
					'install-sample-data' => JText::_('SUNFW_INSTALL_SAMPLE_DATA'),
					'install-sample-data-intro' => JText::_('SUNFW_INSTALL_SAMPLE_DATA_INTRO'),
					'read-documentation' => JText::_('SUNFW_READ_DOCUMENTATION'),
					'read-documentation-intro' => JText::_('SUNFW_READ_DOCUMENTATION_INTRO'),
					'hide-get-started-message' => JText::_('SUNFW_HIDE_GET_STARTED_MESSAGE'),
					'got-it' => JText::_('SUNFW_GOT_IT'),
					'save-settings' => JText::_('SUNFW_SAVE_SETTINGS'),

					'AwEwCtWR' => JText::_('SUNFW_PRIVACY_SETTINGS_TITLE'),
					'Vw6nEmbC' => JText::_('SUNFW_PRIVACY_SETTINGS_CONTENT'),
					'm8Z3DzfB' => JText::_('SUNFW_PRIVACY_SETTINGS_ACCEPT'),
					'HNeEdv2Z' => JText::_('SUNFW_PRIVACY_SETTINGS_DECLINE'),
					'uVDbHsJD' => JText::_('SUNFW_PRIVACY_SETTINGS_INTRO'),

					'module-position' => JText::_('SUNFW_MODULE_POSITION'),
					'create-position' => JText::_('SUNFW_CREATE_POSITION'),
					'position-name' => JText::_('SUNFW_POSITION_NAME'),

					'filter-menu-items-by-language' => JText::_('SUNFW_FILTER_MENU_ITEM_BY_LANGUAGE'),
					'select-menu-item' => JText::_('SUNFW_SELECT_MENU_ITEM'),
					'edit-menu-item' => JText::_('SUNFW_EDIT_MENU_ITEM'),

					'select-module' => JText::_('SUNFW_SELECT_MODULE'),
					'choose-module' => JText::_('SUNFW_CHOOSE_MODULE'),
					'configure-module' => JText::_('SUNFW_CONFIGURE_MODULE'),
					'select-module-style' => JText::_('SUNFW_SELECT_MODULE_STYLE'),

					'html-content' => JText::_('SUNFW_HTML_CONTENT'),
					'set-html-content' => JText::_('SUNFW_SET_HTML_CONTENT'),

					'background-color' => JText::_('SUNFW_BACKGROUND_COLOR'),
					'background-image' => JText::_('SUNFW_BACKGROUND_IMAGE'),
					'background-image-settings' => JText::_('SUNFW_BACKGROUND_IMAGE_SETTINGS'),
					'background-repeat' => JText::_('SUNFW_BACKGROUND_REPEAT'),
					'background-size' => JText::_('SUNFW_BACKGROUND_SIZE'),
					'background-attachment' => JText::_('SUNFW_BACKGROUND_ATTACHMENT'),
					'background-position' => JText::_('SUNFW_BACKGROUND_POSITION'),

					'border-settings' => JText::_('SUNFW_BORDER_SETTINGS'),
					'border-width' => JText::_('SUNFW_BORDER_WIDTH'),
					'border-style' => JText::_('SUNFW_BORDER_STYLE'),
					'border-color' => JText::_('SUNFW_BORDER_COLOR'),
					'border-top' => JText::_('SUNFW_BORDER_TOP'),
					'border-right' => JText::_('SUNFW_BORDER_RIGHT'),
					'border-bottom' => JText::_('SUNFW_BORDER_BOTTOM'),
					'border-left' => JText::_('SUNFW_BORDER_LEFT'),
					'border-color-hover' => JText::_('SUNFW_BORDER_COLOR_HOVER'),

					'font-type' => JText::_('SUNFW_FONT_TYPE'),
					'font-family' => JText::_('SUNFW_FONT_FAMILY'),
					'google-font-selector' => JText::_('SUNFW_GOOGLE_FONT_SELECTOR'),
					'google-font-categories' => JText::_('SUNFW_GOOGLE_FONT_CATEGORIES'),
					'google-font-subsets' => JText::_('SUNFW_GOOGLE_FONT_SUBSETS'),
					'google-font-total' => JText::_('SUNFW_GOOGLE_FONT_TOTAL'),
					'google-font-search' => JText::_('SUNFW_GOOGLE_FONT_SEARCH'),
					'google-font-variants' => JText::_('SUNFW_GOOGLE_FONT_VARIANTS'),
					'google-font-variant' => JText::_('SUNFW_GOOGLE_FONT_VARIANT'),
					'google-font-subset' => JText::_('SUNFW_GOOGLE_FONT_SUBSET'),
					'font-file' => JText::_('SUNFW_FONT_FILE'),
					'choose-custom-font' => JText::_('SUNFW_CHOOSE_CUSTOM_FONT'),

					'text-transform' => JText::_('SUNFW_TEXT_TRANSFORM'),
					'text-transform-capitalize' => JText::_('SUNFW_TEXT_TRANSFORM_CAPITALIZE'),
					'text-transform-uppercase' => JText::_('SUNFW_TEXT_TRANSFORM_UPPERCASE'),
					'text-transform-lowercase' => JText::_('SUNFW_TEXT_TRANSFORM_LOWERCASE'),

					'base-size' => JText::_('SUNFW_TEXT_BASE_SIZE'),
					'font-size' => JText::_('SUNFW_FONT_SIZE'),
					'font-style' => JText::_('SUNFW_FONT_STYLE'),
					'font-style-normal' => JText::_('SUNFW_FONT_STYLE_NORMAL'),
					'font-style-italic' => JText::_('SUNFW_FONT_STYLE_ITALIC'),
					'font-style-oblique' => JText::_('SUNFW_FONT_STYLE_OBLIQUE'),
					'font-weight' => JText::_('SUNFW_FONT_WEIGHT'),
					'font-weight-bold' => JText::_('SUNFW_FONT_WEIGHT_BOLD'),
					'line-height' => JText::_('SUNFW_LINE_HEIGHT'),
					'letter-spacing' => JText::_('SUNFW_TEXT_LETTER_SPACING'),

					'box-shadow' => JText::_('SUNFW_BOX_SHADOW'),
					'box-shadow-settings' => JText::_('SUNFW_BOX_SHADOW_SETTINGS'),
					'box-shadow-h-shadow' => JText::_('SUNFW_BOX_SHADOW_H_SHADOW'),
					'box-shadow-v-shadow' => JText::_('SUNFW_BOX_SHADOW_V_SHADOW'),
					'box-shadow-blur' => JText::_('SUNFW_BOX_SHADOW_BLUR'),
					'box-shadow-spread' => JText::_('SUNFW_BOX_SHADOW_SPREAD'),
					'box-shadow-color' => JText::_('SUNFW_BOX_SHADOW_COLOR'),
					'box-shadow-inset' => JText::_('SUNFW_BOX_SHADOW_INSET'),
					'box-shadow-opacity' => JText::_('SUNFW_BOX_SHADOW_OPACITY'),

					'text-shadow' => JText::_('SUNFW_TEXT_TEXT_SHADOW'),
					'text-shadow-settings' => JText::_('SUNFW_TEXT_SHADOW_SETTINGS'),

					'margin-settings' => JText::_('SUNFW_MARGIN_SETTINGS'),
					'margin-top' => JText::_('SUNFW_MARGIN_TOP'),
					'margin-right' => JText::_('SUNFW_MARGIN_RIGHT'),
					'margin-bottom' => JText::_('SUNFW_MARGIN_BOTTOM'),
					'margin-left' => JText::_('SUNFW_MARGIN_LEFT'),

					'padding-settings' => JText::_('SUNFW_PADDING_SETTINGS'),
					'padding-top' => JText::_('SUNFW_PADDING_TOP'),
					'padding-right' => JText::_('SUNFW_PADDING_RIGHT'),
					'padding-bottom' => JText::_('SUNFW_PADDING_BOTTOM'),
					'padding-left' => JText::_('SUNFW_PADDING_LEFT'),

					'border-radius' => JText::_('SUNFW_TEXT_BORDER_RADIUS'),
					'border-radius-settings' => JText::_('SUNFW_BORDER_RADIUS_SETTINGS'),
					'border-radius-top' => JText::_('SUNFW_BORDER_RADIUS_TOP'),
					'border-radius-right' => JText::_('SUNFW_BORDER_RADIUS_RIGHT'),
					'border-radius-bottom' => JText::_('SUNFW_BORDER_RADIUS_BOTTOM'),
					'border-radius-left' => JText::_('SUNFW_BORDER_RADIUS_LEFT'),

					'social-icons' => JText::_('SUNFW_SOCIAL_ICONS'),
					'icon-color' => JText::_('SUNFW_ICON_COLOR'),
					'icon-size' => JText::_('SUNFW_ICON_SIZE'),
					'link-target' => JText::_('SUNFW_LINK_TARGET'),
					'add-social-icon' => JText::_('SUNFW_SOCIAL_ICON_ADD'),
					'social-network' => JText::_('SUNFW_SOCIAL_NETWORK'),
					'social-icon' => JText::_('SUNFW_SOCIAL_ICON'),
					'profile-link' => JText::_('SUNFW_SOCIAL_PROFILE_LINK'),

					'show-module-title' => JText::_('SUNFW_TEXT_SHOW_MODULE_TITLE'),
					'social-icon-setting' => JText::_('SUNFW_SOCIAL_ICONS_SETTING'),
					'social-title' => JText::_('SUNFW_SOCIAL_TITLE'),

					'color-picker-main-color' => JText::_('SUNFW_MAIN_COLOR'),
					'color-picker-sub-color' => JText::_('SUNFW_SUB_COLOR'),
					'color-picker-custom-color' => JText::_('SUNFW_CUSTOM_COLOR'),

					'article-selector' => JText::_('SUNFW_ARTICLE_PICKER'),
					'edit-article' => JText::_('SUNFW_EDIT_ARTICLE'),
					'select-article' => JText::_('SUNFW_SELECT_ARTICLE'),
					'choose-article' => JText::_('SUNFW_CHOOSE_ARTICLE'),

					'JxPmqKxB-Gjfd4Sxv' => JText::_('SUNFW_USER_VERIFICATION_TITLE'),
					'yUsBHMth' => JText::_('SUNFW_SELECT_EXISTING_ACCOUNT'),
					'HYffw0aK' => JText::_('SUNFW_REGISTER_NEW_ACCOUNT'),
					'JxPmqKxB-td6Tz2Gb' => JText::_('SUNFW_USER_VERIFICATION_MESSAGE'),
					'JxPmqKxB-HYffw0aK' => JText::_('SUNFW_USER_VERIFICATION_REGISTER'),
					'JxPmqKxB-Qe77Z23Y' => JText::_('SUNFW_USER_VERIFICATION_PRIMARY_BUTTON'),
					'JxPmqKxB-UBp6A5Q9' => JText::_('SUNFW_USER_VERIFICATION_SECONDARY_BUTTON'),

					'NBp9UaGE-Gjfd4Sxv' => JText::_('SUNFW_PRODUCT_VERIFICATION_TITLE'),
					'NBp9UaGE-wvJcKMWJ' => JText::_('SUNFW_PRODUCT_VERIFICATION_ALL_DONE'),
					'mPSFCX47' => JText::_('SUNFW_YOUR_WEBSITE_IS_REGISTERED_TO_FOLLOWING_PRODUCT_LICENSE'),
					'NgZ6fjv2' => JText::_('SUNFW_PRODUCT_VERIFICATION_THANK_YOU'),
					'Az99s9KS' => JText::_('SUNFW_PRODUCT_VERIFICATION_LETS_GET_STARTED'),
					'mQXvSGWx' => JText::_('SUNFW_PRODUCT_VERIFICATION_FREE_EDITION'),
					'NBp9UaGE-got-it' => JText::_('SUNFW_PRODUCT_VERIFICATION_GOT_IT'),

					'K53G78yE-Gjfd4Sxv' => JText::_('SUNFW_TIME_TO_GO_PRO_TITLE'),
					'K53G78yE-td6Tz2Gb' => JText::_('SUNFW_TIME_TO_GO_PRO_MESSAGE'),
					'KW6yu9fy-td6Tz2Gb' => JText::_('SUNFW_TRIAL_EXPIRED_MESSAGE'),
					'K53G78yE-Qe77Z23Y' => JText::_('SUNFW_TIME_TO_GO_PRO_PRIMARY_BUTTON'),
					'K53G78yE-UBp6A5Q9' => JText::_('SUNFW_TIME_TO_GO_PRO_SECONDARY_BUTTON'),
					'K53G78yE-Z23xaNm4' => JText::_('SUNFW_TIME_TO_GO_PRO_MAYBE_LATER_BUTTON'),

					'extra-menu-options-Gjfd4Sxv' => JText::_('SUNFW_MENU_OPTIONS_LIMITATION_TITLE'),
					'extra-menu-options-td6Tz2Gb' => JText::_('SUNFW_MENU_OPTIONS_LIMITATION_MESSAGE'),

					'extra-article-options-Gjfd4Sxv' => JText::_('SUNFW_ARTICLE_OPTIONS_LIMITATION_TITLE'),
					'extra-article-options-td6Tz2Gb' => JText::_('SUNFW_ARTICLE_OPTIONS_LIMITATION_MESSAGE'),

					'KBwZeTmw-Gjfd4Sxv' => JText::_('SUNFW_THANK_YOU_TRIAL_EDITION_TITLE'),
					'KBwZeTmw-td6Tz2Gb' => JText::_('SUNFW_THANK_YOU_TRIAL_EDITION_MESSAGE'),
					'KBwZeTmw-NdnhAJdA' => JText::_('SUNFW_THANK_YOU_TRIAL_EDITION_BUTTON_TEXT'),

					'ct4pYJcT-Gjfd4Sxv' => JText::_('SUNFW_SORRY_TRIAL_EXPIRED_TITLE'),
					'ct4pYJcT-td6Tz2Gb' => JText::_('SUNFW_LIGHTCART_API_ERROR_12'),
					'ct4pYJcT-NdnhAJdA' => JText::_('SUNFW_SORRY_TRIAL_EDITION_BUTTON_TEXT')
				)
			));
	}

	/**
	 * Method to get alert data.
	 *
	 * @return  array
	 */
	protected function getComponentAlerts()
	{
		// Allow 3rd-party plugins to add their own alerts.
		$items = array_merge(array(), JEventDispatcher::getInstance()->trigger('SunFwGetComponentAlerts'));

		$data = array(
			'items' => $items
		);

		return $data;
	}

	/**
	 * Method to get data for header nav bar.
	 *
	 * @return  array
	 */
	protected function getComponentHeader()
	{
		// Get site URL.
		$root = JUri::root(true);

		// Define header nav bar.
		$data = array(
			'logo' => array(
				'link' => JUri::root(),
				'image' => "{$root}/plugins/system/sunfw/assets/images/logo.png",
				'title' => htmlspecialchars($this->app->getCfg('sitename'), ENT_QUOTES, 'UTF-8')
			),
			'menu' => array(
				array(
					'href' => '#',
					'icon' => 'database',
					'type' => 'trigger-other',
					'title' => JText::_('SUNFW_DATA_TAB'),
					'target' => '#data, #sample-data',
					'items' => array(
						array(
							'href' => '#',
							'type' => 'trigger-other',
							'title' => JText::_('SUNFW_SAMPLE_DATA_TAB'),
							'target' => '#data, #sample-data'
						),
						array(
							'href' => '#',
							'type' => 'trigger-other',
							'title' => JText::_('SUNFW_MAINTENANCE_TAB'),
							'target' => '#data, #maintenance'
						)
					)
				),
				array(
					'href' => '#',
					'icon' => 'gear',
					'type' => 'trigger-other',
					'title' => JText::_('SUNFW_GLOBAL_PARAMETERS'),
					'target' => '#global-parameters, #user-account',
					'items' => array(
						array(
							'href' => '#',
							'type' => 'trigger-other',
							'title' => JText::_('SUNFW_USER_ACCOUNT_TAB'),
							'target' => '#global-parameters, #user-account'
						),
						array(
							'href' => '#',
							'type' => 'trigger-other',
							'title' => JText::_('SUNFW_PRIVACY_SETTINGS_TAB'),
							'target' => '#global-parameters, #privacy-settings'
						)
					)
				),
				array(
					'href' => '#',
					'icon' => 'info',
					'type' => 'trigger-other',
					'title' => JText::_('SUNFW_ABOUT'),
					'target' => '#about'
				),
				array(
					'id' => 'sunfw-learn-more',
					'href' => '#',
					'icon' => 'life-ring',
					'title' => JText::_('SUNFW_HELP'),
					'items' => array(
						array(
							'id' => 'sunfw-get-started',
							'href' => '#',
							'icon' => 'flag',
							'title' => JText::_('SUNFW_GET_STARTED')
						),
						array(
							'href' => $this->documentationLink,
							'icon' => 'book',
							'title' => JText::_('SUNFW_ABOUT_DOCUMENTATION'),
							'target' => '_blank'
						),
						array(
							'href' => SUNFW_SUPPORT_URL,
							'icon' => 'comment-o',
							'title' => JText::_('SUNFW_ABOUT_SUPPPORT'),
							'target' => '_blank'
						)
					),
					'dropdownClass' => 'dropdown-menu-right'
				)
			),
			'textMapping' => array(
				'y37Rm2cT' => JText::_('SUNFW_UPGRADE_TO_PRO_FOR_ADVANCED_FEATURES'),
				'zntBTB4M' => JText::_('SUNFW_YOUR_TRIAL_LICENSE_WILL_EXPIRE_IN'),
				'AVyacBDn' => JText::_('SUNFW_YOUR_TRIAL_LICENSE_IS_EXPIRED'),
				'WRJJEdEg' => JText::_('SUNFW_YOUR_PRO_LICENSE_IS_EXPIRED'),
				'BcBkJNHJ' => JText::_('SUNFW_PURCHASE_PRO'),
				'bMz6gJBY' => JText::_('SUNFW_RENEW_PRO'),

				'w2b97wVJ-Gjfd4Sxv' => JText::_('SUNFW_ADVANCED_FEATURES_LIMITATION_TITLE'),
				'w2b97wVJ-td6Tz2Gb' => JText::_('SUNFW_ADVANCED_FEATURES_LIMITATION_MESSAGE'),

				'w4NZZZgN-PbjM7szs' => JText::_('SUNFW_RENEW_PRO_MODAL_TITLE'),
				'w4NZZZgN-Gjfd4Sxv' => JText::_('SUNFW_RENEW_PRO_TITLE'),
				'w4NZZZgN-M3qrv0Rh' => JText::_('SUNFW_RENEW_PRO_MESSAGE_1'),
				'w4NZZZgN-sDVgQf7K' => JText::_('SUNFW_RENEW_PRO_MESSAGE_2'),
				'w4NZZZgN-NdnhAJdA' => JText::_('SUNFW_RENEW_PRO_BUTTON_TEXT')
			)
		);

		// Allow 3rd-party plugins to add their own menu items into header nav bar.
		$data = array_merge_recursive($data, JEventDispatcher::getInstance()->trigger('SunFwGetComponentHeader'));

		return $data;
	}

	/**
	 * Method to get data for main workspace.
	 *
	 * @return  array
	 */
	protected function getComponentBody()
	{
		// Get site URL.
		$root = JUri::root(true);

		// Build URL to save a copy of the current template style.
		$saveAsCopy = "index.php?option=com_ajax&format=json&plugin=sunfw&context=admin&action=saveAsCopy&template_name={$this->templateName}&style_id={$this->styleID}&" .
			 JSession::getFormToken() . '=1';

		// Get all input components.
		$inputs = array();
		$path = JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/inputs';

		foreach (glob("{$path}/*.js") as $input)
		{
			$inputs[substr(basename($input), 0, -3)] = $root . str_replace(JPATH_ROOT, '', $input);
		}

		// Prepare getting started content.
		$gettingStarted = null;

		if (SunFwHelper::getBrandSetting('replaceTplGettingStartedContent'))
		{
			$gettingStarted = SunFwHelper::getBrandSetting('getTplGettingStartedContent');
		}

		// Define tabs and associated editors in main workspace.
		$vd = 'v=' . SUNFW_VERSION . '&d=' . SUNFW_RELEASED_DATE;
		$data = array(
			'tabs' => array(
				array(
					'href' => '#layout',
					'title' => JText::_('SUNFW_LAYOUT_TAB'),
					'render' => array(
						'name' => 'PaneLayout',
						'file' => "{$root}/plugins/system/sunfw/assets/joomlashine/admin/js/layout/render.js?{$vd}",
						'data' => ( new SunFwAjaxLayout() )->getAction(true)
					),
					'className' => 'toggle-pane'
				),
				array(
					'href' => '#styles',
					'title' => JText::_('SUNFW_STYLES_TAB'),
					'render' => array(
						'name' => 'PaneStyles',
						'file' => "{$root}/plugins/system/sunfw/assets/joomlashine/admin/js/styles/render.js?{$vd}",
						'data' => ( new SunFwAjaxStyles() )->getAction(true)
					),
					'className' => 'toggle-pane'
				),
				array(
					'href' => '#mega-menu',
					'title' => JText::_('SUNFW_MEGAMENU_TAB'),
					'render' => array(
						'name' => 'PaneMegaMenu',
						'file' => "{$root}/plugins/system/sunfw/assets/joomlashine/admin/js/mega-menu/render.js?{$vd}",
						'data' => ( new SunFwAjaxMegaMenu() )->getAction(true)
					),
					'className' => 'toggle-pane'
				),
				array(
					'href' => '#system',
					'title' => JText::_('SUNFW_SYSTEM_TAB'),
					'render' => array(
						'name' => 'PaneSystem',
						'file' => "{$root}/plugins/system/sunfw/assets/joomlashine/admin/js/system/render.js?{$vd}",
						'data' => ( new SunFwAjaxSystem() )->getAction(true)
					),
					'className' => 'toggle-pane'
				),
				array(
					'href' => '#extras',
					'title' => JText::_('SUNFW_EXTRAS_TAB'),
					'items' => array(
						array(
							'href' => '#cookie-law',
							'title' => JText::_('SUNFW_COOKIE_LAW_TAB'),
							'render' => array(
								'name' => 'PaneCookieLaw',
								'file' => "{$root}/plugins/system/sunfw/assets/joomlashine/admin/js/cookie-law/render.js?{$vd}",
								'data' => ( new SunFwAjaxCookieLaw() )->getAction(true)
							),
							'className' => 'toggle-pane'
						),
						array(
							'href' => '#social-share',
							'title' => JText::_('SUNFW_SOCIAL_SHARE_TAB'),
							'render' => array(
								'name' => 'PaneSocialShare',
								'file' => "{$root}/plugins/system/sunfw/assets/joomlashine/admin/js/social-share/render.js?{$vd}",
								'data' => ( new SunFwAjaxSocialShare() )->getAction(true)
							),
							'className' => 'toggle-pane'
						),
						array(
							'href' => '#commenting',
							'title' => JText::_('SUNFW_COMMENTING_TAB'),
							'render' => array(
								'name' => 'PaneCommenting',
								'file' => "{$root}/plugins/system/sunfw/assets/joomlashine/admin/js/commenting/render.js?{$vd}",
								'data' => ( new SunFwAjaxCommenting() )->getAction(true)
							),
							'className' => 'toggle-pane'
						),
						array(
							'href' => '#custom-404',
							'title' => JText::_('SUNFW_CUSTOM_404_TAB'),
							'render' => array(
								'name' => 'PaneCustom404',
								'file' => "{$root}/plugins/system/sunfw/assets/joomlashine/admin/js/custom-404/render.js?{$vd}",
								'data' => ( new SunFwAjaxCustomFourzerofour() )->getAction(true)
							),
							'className' => 'toggle-pane'
						)
					),
					'className' => 'extras'
				),
				array(
					'href' => '#menu-assignment',
					'title' => JText::_('SUNFW_MENU_ASSIGNMENT_TAB'),
					'render' => array(
						'name' => 'PaneAssignment',
						'file' => "{$root}/plugins/system/sunfw/assets/joomlashine/admin/js/assignment/render.js?{$vd}",
						'data' => ( new SunFwAjaxAssignment() )->getAction(true)
					),
					'className' => 'toggle-pane'
				),
				array(
					'href' => '#data',
					'title' => JText::_('SUNFW_DATA_TAB'),
					'listClass' => 'hidden',
					'items' => array(
						array(
							'href' => '#sample-data',
							'title' => JText::_('SUNFW_SAMPLE_DATA'),
							'render' => array(
								'name' => 'PaneSampleData',
								'file' => "{$root}/plugins/system/sunfw/assets/joomlashine/admin/js/sample-data/render.js?{$vd}"
							),
							'className' => 'toggle-pane'
						),
						array(
							'href' => '#maintenance',
							'title' => JText::_('SUNFW_MAINTENANCE_TAB'),
							'render' => array(
								'name' => 'PaneMaintenance',
								'file' => "{$root}/plugins/system/sunfw/assets/joomlashine/admin/js/maintenance/render.js?{$vd}",
								'data' => ( new SunFwAjaxMaintenance() )->getAction(true)
							),
							'className' => 'toggle-pane'
						)
					)
				),
				array(
					'href' => '#global-parameters',
					'title' => JText::_('SUNFW_GLOBAL_PARAMETERS_TAB'),
					'listClass' => 'hidden',
					'items' => array(
						array(
							'href' => '#user-account',
							'title' => JText::_('SUNFW_USER_ACCOUNT_TAB'),
							'render' => array(
								'name' => 'PaneUserAccount',
								'file' => "{$root}/plugins/system/sunfw/assets/joomlashine/admin/js/user-account/render.js?{$vd}",
								'data' => ( new SunFwAjaxUserAccount() )->getAction(true)
							),
							'className' => 'toggle-pane'
						),
						array(
							'href' => '#privacy-settings',
							'title' => JText::_('SUNFW_PRIVACY_SETTINGS_TAB'),
							'render' => array(
								'name' => 'PanePrivacySettings',
								'file' => "{$root}/plugins/system/sunfw/assets/joomlashine/admin/js/privacy-settings/render.js?{$vd}"
							),
							'className' => 'toggle-pane'
						)
					)
				),
				array(
					'href' => '#about',
					'title' => JText::_('SUNFW_ABOUT'),
					'render' => array(
						'name' => 'PaneAbout',
						'file' => "{$root}/plugins/system/sunfw/assets/joomlashine/admin/js/about/render.js?{$vd}",
						'data' => ( new SunFwAjaxAbout() )->getAction(true)
					),
					'listClass' => 'hidden',
					'className' => 'toggle-pane'
				)
			),
			'buttons' => array(
				array(
					array(
						'id' => 'sunfw-save-all',
						'href' => '#',
						'type' => 'success',
						'icon' => 'pencil-square-o mr-1',
						'label' => JText::_('SUNFW_SAVE_ALL'),
						'disabled' => true
					),
					array(
						'type' => 'save',
						'label' => '',
						'menu' => array(
							array(
								'id' => 'sunfw-save-as-copy',
								'href' => $saveAsCopy,
								'title' => JText::_('SUNFW_SAVE_AS_COPY')
							)
						),
						'menuClass' => 'dropdown-menu-right'
					)
				),
				array(
					'href' => 'index.php?option=com_templates',
					'icon' => 'times px-2',
					'label' => JText::_('SUNFW_CLOSE'),
					'className' => 'sub-btn'
				)
			),
			'inputs' => $inputs,
			'gettingStarted' => $gettingStarted,
			'textMapping' => array(
				'TQRUYEYz-Gjfd4Sxv' => JText::_('SUNFW_TEMPLATE_STYLE_LIMITATION_TITLE'),
				'TQRUYEYz-td6Tz2Gb' => JText::_('SUNFW_TEMPLATE_STYLE_LIMITATION_MESSAGE'),

				'XFnHMC0g-Gjfd4Sxv' => JText::_('SUNFW_SAMPLE_DATA_LIMITATION_TITLE'),
				'XFnHMC0g-td6Tz2Gb' => JText::_('SUNFW_SAMPLE_DATA_LIMITATION_MESSAGE'),

				'pane-styles-Gjfd4Sxv' => JText::_('SUNFW_PANE_STYLES_LIMITATION_TITLE'),
				'pane-styles-td6Tz2Gb' => JText::_('SUNFW_PANE_STYLES_LIMITATION_MESSAGE'),
				'pane-styles-cmZjnUuu' => JText::_('SUNFW_PANE_STYLES_LIMITATION_MORE_INFO'),

				'pane-mega-menu-Gjfd4Sxv' => JText::_('SUNFW_PANE_MEGA_MENU_LIMITATION_TITLE'),
				'pane-mega-menu-td6Tz2Gb' => JText::_('SUNFW_PANE_MEGA_MENU_LIMITATION_MESSAGE'),
				'pane-mega-menu-cmZjnUuu' => JText::_('SUNFW_PANE_MEGA_MENU_LIMITATION_MORE_INFO'),

				'pane-cookie-law-Gjfd4Sxv' => JText::_('SUNFW_PANE_COOKIE_LAW_LIMITATION_TITLE'),
				'pane-cookie-law-td6Tz2Gb' => JText::_('SUNFW_PANE_COOKIE_LAW_LIMITATION_MESSAGE'),
				'pane-cookie-law-cmZjnUuu' => JText::_('SUNFW_PANE_COOKIE_LAW_LIMITATION_MORE_INFO'),

				'pane-social-share-Gjfd4Sxv' => JText::_('SUNFW_PANE_SOCIAL_SHARE_LIMITATION_TITLE'),
				'pane-social-share-td6Tz2Gb' => JText::_('SUNFW_PANE_SOCIAL_SHARE_LIMITATION_MESSAGE'),
				'pane-social-share-cmZjnUuu' => JText::_('SUNFW_PANE_SOCIAL_SHARE_LIMITATION_MORE_INFO'),

				'pane-commenting-Gjfd4Sxv' => JText::_('SUNFW_PANE_COMMENTING_LIMITATION_TITLE'),
				'pane-commenting-td6Tz2Gb' => JText::_('SUNFW_PANE_COMMENTING_LIMITATION_MESSAGE'),
				'pane-commenting-cmZjnUuu' => JText::_('SUNFW_PANE_COMMENTING_LIMITATION_MORE_INFO'),

				'pane-custom-404-Gjfd4Sxv' => JText::_('SUNFW_PANE_CUSTOM_404_LIMITATION_TITLE'),
				'pane-custom-404-td6Tz2Gb' => JText::_('SUNFW_PANE_CUSTOM_404_LIMITATION_MESSAGE'),
				'pane-custom-404-cmZjnUuu' => JText::_('SUNFW_PANE_CUSTOM_404_LIMITATION_MORE_INFO'),

				'xrZVPjMr-Gjfd4Sxv' => JText::_('SUNFW_ADD_LAYOUT_ITEM_LIMITATION_TITLE'),
				'xrZVPjMr-td6Tz2Gb' => JText::_('SUNFW_ADD_LAYOUT_ITEM_LIMITATION_MESSAGE'),

				'h6qjVrwy-Gjfd4Sxv' => JText::_('SUNFW_ADD_LAYOUT_ITEM_LIMITATION_TITLE'),
				'h6qjVrwy-td6Tz2Gb' => JText::_('SUNFW_ADD_LAYOUT_ITEM_LIMITATION_MESSAGE'),

				'setting-responsive-support-Gjfd4Sxv' => JText::_('SUNFW_RESPONSIVE_LAYOUT_LIMITATION_TITLE'),
				'setting-responsive-support-td6Tz2Gb' => JText::_('SUNFW_RESPONSIVE_LAYOUT_LIMITATION_MESSAGE'),

				'setting-joomlashine-branding-Gjfd4Sxv' => JText::_('SUNFW_JOOMLASHINE_BRANDING_LIMITATION_TITLE'),
				'setting-joomlashine-branding-td6Tz2Gb' => JText::_('SUNFW_JOOMLASHINE_BRANDING_LIMITATION_MESSAGE'),

				'setting-assets-compression-Gjfd4Sxv' => JText::_('SUNFW_ASSETS_COMPRESSION_LIMITATION_TITLE'),
				'setting-assets-compression-td6Tz2Gb' => JText::_('SUNFW_ASSETS_COMPRESSION_LIMITATION_MESSAGE'),

				'ErWVstHA-Gjfd4Sxv' => JText::_('SUNFW_BANNER_REMOVAL_TITLE'),
				'ErWVstHA-td6Tz2Gb' => JText::_('SUNFW_BANNER_REMOVAL_MESSAGE'),

				'KW6yu9fy' => JText::_('SUNFW_TRIAL_EXPIRED'),
				'Sbrr2pJQ' => JText::_('SUNFW_PRO_BADGE_TEXT'),
				'XNqRzhzv' => JText::_('SUNFW_TRY_PRO_LINK_TEXT'),
				'Q3TX2PUM' => JText::_('SUNFW_PRO_TOOLTIP_TEXT')
			)
		);

		// Check if the Custom 404 feature is supported by the current template.
		$xml = SunFwHelper::getManifest($this->templateName);

		if (!$xml || !( $xml = current($xml->xpath('//feature[@name="custom_404"]')) ) || (string) $xml['enabled'] !== 'yes')
		{
			foreach ($data['tabs'] as $i => $tab)
			{
				if ($tab['href'] === '#extras')
				{
					foreach ($tab['items'] as $j => $sub)
					{
						if ($sub['href'] === '#custom-404')
						{
							unset($data['tabs'][$i]['items'][$j]);

							break 2;
						}
					}
				}
			}
		}

		// Allow 3rd-party plugins to add their own tabs into main workspace.
		$data = array_merge_recursive($data, JEventDispatcher::getInstance()->trigger('SunFwGetComponentBody'));

		return $data;
	}

	/**
	 * Method to get data for footer info bar.
	 *
	 * @return  array
	 */
	protected function getComponentFooter()
	{
		// Prepare footer content.
		if (SunFwHelper::getBrandSetting('replaceTplFooterContent'))
		{
			$otherFooter = SunFwHelper::getBrandSetting('getTplFooterContent');
		}
		else
		{
			$otherFooter = array(
				sprintf(JText::_('SUNFW_OTHER_PRODUCTS_PAGE_BUILDER'),
					'<a href="http://www.joomlashine.com/joomla-extensions/jsn-pagebuilder.html" target="_blank" rel="noopener noreferrer" class="link-normal sunfw-prd">JSN PageBuilder</a>')
			);
		}

		// Define footer info bar.
		$data = array(
			'credits' => array(
				'template' => array(
					'name' => $this->template['realName'],
					'link' => sprintf(SUNFW_TEMPLATE_URL, preg_replace('/^tpl_([^\d]+)\d*$/', '\\1', $this->template['id'])),
					'edition' => $this->template['edition'],
					'version' => $this->template['version']
				),
				'framework' => array(
					'name' => JText::_('PLG_SYSTEM_SUNFW'),
					'link' => 'http://www.joomlashine.com/joomla-templates/jsn-sunframework.html',
					'version' => SUNFW_VERSION
				)
			),
			'others' => (array) $otherFooter,
			'showChangelogs' => SunFwHelper::getBrandSetting('showTplChangelog', 1),
			'showUpdate' => SunFwHelper::getBrandSetting('showTplUpgradeButton', 1)
		);

		// Allow 3rd-party plugins to add their own tabs into main workspace.
		$data = array_merge_recursive($data, JEventDispatcher::getInstance()->trigger('SunFwGetComponentFooter'));

		return $data;
	}

	/**
	 * Method to get update data.
	 *
	 * @return  array
	 */
	protected function getComponentUpdate()
	{
		$ajaxServer = "index.php?option=com_ajax&format=json&plugin=sunfw&context=update&&style_id={$this->styleID}&template_name={$this->templateName}&" .
			 JSession::getFormToken() . '=1&';

		$data = array(
			'url' => $ajaxServer,
			'modalTitle' => array(
				'framework' => JText::_('SUNFW_UPDATE_FRAMEWORK_TITLE'),
				'template' => JText::_('SUNFW_UPDATE_TEMPLATE_TITLE')
			)
		);

		return $data;
	}

	/**
	 * Get license data.
	 *
	 * @return  string
	 */
	protected function getLicense()
	{
		// Get parameters.
		$params = SunFwHelper::getExtensionParams('template', $this->template['name']);

		if (empty($params['token']))
		{
			return null;
		}

		// Look for license data in the temporary directory first.
		$cache = JFactory::getConfig()->get('tmp_path') . "/{$this->template['id']}/license.data";

		if (is_file($cache) && ( time() - filemtime($cache) < 24 * 60 * 60 ) && ( $license = file_get_contents($cache) ) != '')
		{
			return $license;
		}

		// Instantiate a HTTP client.
		$http = new JHttp();
		$link = SUNFW_GET_LICENSE_URL;

		// Build URL for requesting license data.
		$link .= '&identified_name=' . $this->template['id'];
		$link .= '&domain=' . JUri::getInstance()->toString(array(
			'host'
		));
		$link .= '&ip=' . $_SERVER['SERVER_ADDR'];
		$link .= '&token=' . $params['token'];

		// Send a request to JoomlaShine server to get license data.
		try
		{
			$license = $http->get($link);

			// Parse response.
			$license = json_decode($license->body);

			if ($license && $license->result == 'success')
			{
				// Cache license data to a local file.
				file_put_contents($cache, $license->message);

				return $license->message;
			}
			elseif (!$license || $license->result == 'failure')
			{
				if ($license)
				{
					$key = "SUNFW_LIGHTCART_{$license->error_code}";
					$msg = JText::_($key);

					if (strcasecmp($key, $msg) == 0)
					{
						$msg = $license->message;
					}
				}

				throw new Exception($license ? $msg : json_last_error_msg());
			}
		}
		catch (Exception $e)
		{
			// Reuse cache file if available.
			if (is_file($cache) && ( $license = file_get_contents($cache) ) != '')
			{
				// Refresh cache file after 1 day.
				touch($cache);

				return $license;
			}

			return null;
		}

		return null;
	}

	/**
	 * Save data to database
	 *
	 * @throws Exception
	 */
	public function saveStyleSettingsAction()
	{
		$styleTitle = $this->input->getString('style_title', '');
		$home = $this->input->getString('home', '');

		if (empty($styleTitle))
		{
			throw new Exception('Invalid Request');
		}

		// If style is set as default, clear current default style.
		if ($home != '0')
		{
			$query = $this->dbo->getQuery(true);

			$query->update('#__template_styles')
				->set('home = 0')
				->where('client_id = 0')
				->where('home = ' . $this->dbo->quote($home));

			// Execute query to save advanced data.
			try
			{
				$this->dbo->setQuery($query);

				if (!$this->dbo->execute())
				{
					throw new Exception($this->dbo->getErrorMsg());
				}
			}
			catch (Exception $e)
			{
				throw $e;
			}
		}

		// Save style title and assignment.
		$query = $this->dbo->getQuery(true);

		$query->update('#__template_styles')
			->set('title = ' . $this->dbo->quote($styleTitle))
			->set('home = ' . $this->dbo->quote($home))
			->where('id = ' . (int) $this->styleID);

		try
		{
			$this->dbo->setQuery($query);

			if (!$this->dbo->execute())
			{
				throw new Exception($this->dbo->getErrorMsg());
			}
		}
		catch (Exception $e)
		{
			throw $e;
		}

		$this->setResponse(array(
			'message' => JText::_('SUNFW_TEMPLATE_STYLE_SAVED_SUCCESSFULLY')
		));
	}

	/**
	 * Save data to database
	 *
	 * @throws Exception
	 */
	public function saveAsCopyAction()
	{
		// Detect disabled extension
		$extension = JTable::getInstance('Extension');

		if ($extension->load(
			array(
				'enabled' => 0,
				'type' => 'template',
				'element' => $this->templateName,
				'client_id' => 0
			)))
		{
			throw new Exception(JText::_('SUNFW_ERROR_SAVE_DISABLED_TEMPLATE'));
		}

		// Load 'template_styles' table object.
		JTable::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_templates/tables');

		$styleTbl = JTable::getInstance('Style', 'TemplatesTable');

		$styleTbl->load(0);

		$currentStyle = SunFwHelper::getTemplateStyle($this->styleID);

		if (!count($currentStyle))
		{
			throw new Exception(JText::_('SUNFW_ERROR_STYLE_IS_INVALID'));
		}

		$currentStyle = (array) $currentStyle;
		$currentStyle['id'] = 0;
		$currentStyle['home'] = 0;
		$currentStyle['title'] = $this->generateNewTitle(null, null, $currentStyle['title']);
		$currentStyle['assigned'] = '';

		if (!$styleTbl->bind($currentStyle))
		{
			throw new Exception($styleTbl->getError());
		}

		// Store the data.
		if (!$styleTbl->store())
		{
			throw new Exception($styleTbl->getError());
		}

		$currentSunFwStyle = SunFwHelper::getSunFwStyle($this->styleID);

		if (count($currentSunFwStyle))
		{
			$columns = array(
				'style_id',
				'template',
				'layout_builder_data',
				'appearance_data',
				'system_data',
				'mega_menu_data',
				'cookie_law_data',
				'social_share_data',
				'commenting_data',
				'custom_404_data'
			);

			$values = array(
				intval($styleTbl->id),
				$this->dbo->quote($this->templateName),
				$this->dbo->quote($currentSunFwStyle->layout_builder_data),
				$this->dbo->quote($currentSunFwStyle->appearance_data),
				$this->dbo->quote($currentSunFwStyle->system_data),
				$this->dbo->quote($currentSunFwStyle->mega_menu_data),
				$this->dbo->quote($currentSunFwStyle->cookie_law_data),
				$this->dbo->quote($currentSunFwStyle->social_share_data),
				$this->dbo->quote($currentSunFwStyle->commenting_data),
				$this->dbo->quote($currentSunFwStyle->custom_404_data)
			);

			$query = $this->dbo->getQuery(true)
				->insert($this->dbo->quoteName('#__sunfw_styles'))
				->columns($this->dbo->quoteName($columns))
				->values(implode(',', $values));

			$this->dbo->setQuery($query);
			$this->dbo->execute();
		}

		// Compile SCSS.
		$sufwrender = new SunFwScssrender();

		$sufwrender->compile($styleTbl->id, $this->templateName);
		$sufwrender->compile($styleTbl->id, $this->templateName, 'layout');

		$this->setResponse(array(
			'id' => $styleTbl->id
		));
	}

	/**
	 * Method to change the title.
	 *
	 * @param   integer  $category_id  The id of the category.
	 * @param   string   $alias        The alias.
	 * @param   string   $title        The title.
	 *
	 * @return  string  New title.
	 *
	 * @since   1.7.1
	 */
	protected function generateNewTitle($categoryId, $alias, $title)
	{
		JTable::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_templates/tables');

		$table = JTable::getInstance('Style', 'TemplatesTable');

		while ($table->load(array(
			'title' => $title
		)))
		{
			$title = \Joomla\String\StringHelper::increment($title);
		}

		return $title;
	}

	/**
	 * Method to load JSON settings file for template admin.
	 *
	 * @return  void
	 */
	public function loadJsonFileAction()
	{
		// Get requested JSON file.
		$file = $this->input->getString('file');

		if (strpos($file, JUri::root(true)) === 0)
		{
			$file = substr($file, strlen(JUri::root(true)));
		}

		if (empty($file) || !is_file($file = JPATH_ROOT . $file))
		{
			exit();
		}

		// Set response header.
		header('Content-Type: application/json');

		// Read and print JSON file content.
		readfile($file);

		exit();
	}

	/**
	 * Method to register a Trial license.
	 *
	 * @return  void
	 */
	public function tryProAction()
	{
		// Get parameters.
		$params = SunFwHelper::getExtensionParams('template', $this->template['name']);

		if (empty($params['token']))
		{
			throw new Exception(JText::_('SUNFW_ERROR_INVALID_TOKEN'));
		}

		// Instantiate a HTTP client.
		$http = new JHttp();
		$link = SUNFW_JOIN_TRIAL_URL;

		// Build URL for requesting license data.
		$link .= '&identified_name=' . $this->template['id'];
		$link .= '&domain=' . JUri::getInstance()->toString(array(
			'host'
		));
		$link .= '&ip=' . $_SERVER['SERVER_ADDR'];
		$link .= '&token=' . $params['token'];

		// Send a request to JoomlaShine server to register Trial license.
		$result = $http->get($link);

		// Parse response.
		$result = json_decode($result->body);

		if ($result && $result->result == 'success')
		{
			// Clear cached license data.
			( new SunFwAjaxUserAccount() )->clearLicenseAction();
		}
		elseif (!$result || $result->result == 'failure')
		{
			if ($result)
			{
				if ($result->error_code == 'API_ERROR_12')
				{
					$title = JText::_('SUNFW_SORRY_TRIAL_EXPIRED_TITLE');
				}
				else
				{
					$title = JText::_('SUNFW_SORRY_TRIAL_EDITION_TITLE');
				}

				$key = "SUNFW_LIGHTCART_{$result->error_code}";
				$message = JText::_($key);

				if (strcasecmp($key, $msg) == 0)
				{
					$message = $result->message;
				}
			}

			throw new Exception(
				$result ? json_encode(
					array(
						'title' => $title,
						'message' => $message,
						'button' => JText::_('SUNFW_SORRY_TRIAL_EDITION_BUTTON_TEXT')
					)) : json_last_error_msg());
		}
	}
}
