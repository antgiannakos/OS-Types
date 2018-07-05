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

// Import necessary Joomla libraries.
jimport('joomla.filesystem.file');

/**
 * Handle Ajax requests from styles pane.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwAjaxStyles extends SunFwAjax
{

	/**
	 * Get style data from database.
	 *
	 * @param   boolean  $return  Whether to return data or send response back immediately?
	 *
	 * @return  mixed
	 */
	public function getAction($return = false)
	{
		// Get site URL.
		$root = JUri::root(true);

		/**
		 * Get styles editor's items.
		 */
		$items = SunFwHelper::findTemplateAdminJsonSettings(
			JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/styles/settings/items');

		// Allow 3rd-party to add their own items into styles editor.
		$items = array_merge($items, JEventDispatcher::getInstance()->trigger('SunFwGetStylesItems'));

		/**
		 * Get styles editor's groups.
		 */
		$groups = array_merge(
			array(
				'general' => JText::_('SUNFW_GENERAL_SETTINGS_BUTTON_TEXT'),
				'sections' => JText::_('SUNFW_SECTION_SETTINGS_BUTTON_TEXT'),
				'module' => JText::_('SUNFW_MODULE_SETTINGS_BUTTON_TEXT'),
				'menu' => JText::_('SUNFW_MENU_SETTINGS_BUTTON_TEXT')
			),
			// Allow 3rd-party to add additional screens into layout builder.
			JEventDispatcher::getInstance()->trigger('SunFwGetStylesGroups'));

		/**
		 * Get styles editor's style presets.
		 */
		$style = SunFwHelper::getSunFwStyle($this->styleID);
		$presets = SunFwHelper::findTemplateAdminJsonSettings(SunFwHelper::getStyleDirectories($this->templateName, false, $style),
			'*.json', false, 'SUNFW_PREBUILD_STYLE_');

		// Allow 3rd-party to add their own style presets into styles editor.
		$presets = array_merge($presets, JEventDispatcher::getInstance()->trigger('SunFwGetStylePresets'));

		/**
		 * Get custom input components.
		 */
		$inputs = array();
		$path = JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/styles/inputs';
		$vd = 'v=' . SUNFW_VERSION . '&d=' . SUNFW_RELEASED_DATE;

		foreach (glob("{$path}/*.js") as $input)
		{
			$inputs[substr(basename($input), 0, -3)] = $root . str_replace(JPATH_ROOT, '', $input) . "?{$vd}";
		}

		// Allow 3rd-party to add their own custom inputs into styles editor.
		$inputs = array_merge($inputs, JEventDispatcher::getInstance()->trigger('SunFwGetStylesInputs'));

		/**
		 * Synchronize color values for editing.
		 */
		$style = SunFwHelper::getStyleData($style, $this->templateName);
		$style = SunFwHelper::synchronizeColorValues($style, $style, null, true);

		/**
		 * Prepare response data.
		 */
		$data = array(
			'url' => $this->baseUrl,
			'data' => (object) $style,
			'items' => $items,
			'inputs' => $inputs,
			'groups' => $groups,
			'presets' => $presets,
			'settings' => SunFwHelper::findTemplateAdminJsonSettings(
				JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/styles/settings', 'page.json', true),
			'textMapping' => array(
				'style-editor' => JText::_('SUNFW_STYLE_EDITOR'),
				'load-style-preset' => JText::_('SUNFW_PREBUILT_STYLES'),
				'save-style' => JText::_('SUNFW_SAVE_STYLE'),
				'save-style-preset' => JText::_('SUNFW_SAVE_PREBUILT_STYLE'),
				'style-preset-name' => JText::_('SUNFW_PREBUILT_STYLE_NAME'),
				'general-settings-button' => JText::_('SUNFW_GENERAL_SETTINGS_BUTTON_TEXT'),
				'section-settings-button' => JText::_('SUNFW_SECTION_SETTINGS_BUTTON_TEXT'),
				'module-settings-button' => JText::_('SUNFW_MODULE_SETTINGS_BUTTON_TEXT'),
				'menu-settings-button' => JText::_('SUNFW_MENU_SETTINGS_BUTTON_TEXT'),
				'no-section-found' => JText::_('SUNFW_NO_SECTION_FOUND'),
				'no-menu-found' => JText::_('SUNFW_NO_MENU_FOUND'),
				'universal-settings' => JText::_('SUNFW_UNIVERSAL_SETTINGS'),
				'individual-settings' => JText::_('SUNFW_INDIVIDUAL_SETTINGS'),
				'outer-page' => JText::_('SUNFW_OUTER_PAGE'),
				'inner-page' => JText::_('SUNFW_INNER_PAGE'),
				'section-title' => JText::_('SUNFW_SECTION_TITLE'),
				'module-style' => JText::_('SUNFW_MODULE_STYLE'),
				'menu-title' => JText::_('SUNFW_MENU_TITLE'),
				'main-color' => JText::_('SUNFW_MAIN_COLOR'),
				'sub-color' => JText::_('SUNFW_SUB_COLOR'),
				'normal-state' => JText::_('SUNFW_TEXT_NORMAL_STATE'),
				'hover-state' => JText::_('SUNFW_TEXT_HOVER_STATE'),
				'hover-active-state' => JText::_('SUNFW_TEXT_HOVER_ACTIVE_STATE'),
				'normal-color' => JText::_('SUNFW_TEXT_NORMAL_COLOR'),
				'hover-color' => JText::_('SUNFW_TEXT_HOVER_COLOR'),
				'use-custom-settings' => JText::_('SUNFW_TEXT_USE_CUSTOM_SETTINGS'),
				'new-style' => JText::_('SUNFW_NEW_STYLE'),
				'no-pre-style' => JText::_('SUNFW_NO_PRE_STYLE'),
				'dropdown-width' => JText::_('SUNFW_DROPDOWN_WIDTH'),
				'style-outer-page-background-color-hint' => JText::_('SUNFW_STYLE_OUTER_PAGE_BACKGROUND_COLOR_HINT'),
				'style-outer-page-background-image-hint' => JText::_('SUNFW_STYLE_OUTER_PAGE_BACKGROUND_IMAGE_HINT'),
				'style-outer-page-background-image-setting-hint' => JText::_('SUNFW_STYLE_OUTER_PAGE_BACKGROUND_IMAGE_SETTING_HINT'),
				'style-inner-page-background-color-hint' => JText::_('SUNFW_STYLE_INNER_PAGE_BACKGROUND_COLOR_HINT'),
				'style-inner-page-border-settings-hint' => JText::_('SUNFW_STYLE_INNER_PAGE_BORDER_SETTINGS_HINT'),
				'style-inner-page-box-shadow-settings-hint' => JText::_('SUNFW_STYLE_INNER_PAGE_BOX_SHADOW_SETTINGS_HINT'),
				'style-main-color-hint' => JText::_('SUNFW_STYLE_MAIN_COLOR_HINT'),
				'style-sub-color-hint' => JText::_('SUNFW_STYLE_SUB_COLOR_HINT'),
				'style-heading-color-hint' => JText::_('SUNFW_STYLE_HEADING_COLOR_HINT'),
				'style-heading-font-type-hint' => JText::_('SUNFW_STYLE_HEADING_FONT_TYPE_HINT'),
				'style-heading-font-family-hint' => JText::_('SUNFW_STYLE_HEADING_FONT_FAMILY_HINT'),
				'style-heading-font-file-hint' => JText::_('SUNFW_STYLE_HEADING_FONT_FILE_HINT'),
				'style-heading-font-weight-hint' => JText::_('SUNFW_STYLE_HEADING_FONT_WEIGHT_HINT'),
				'style-heading-font-style-hint' => JText::_('SUNFW_STYLE_HEADING_FONT_STYLE_HINT'),
				'style-heading-text-transform-hint' => JText::_('SUNFW_STYLE_HEADING_TEXT_TRANSFORM_HINT'),
				'style-heading-text-shadow-hint' => JText::_('SUNFW_STYLE_HEADING_TEXT_SHADOW_HINT'),
				'style-heading-base-size-hint' => JText::_('SUNFW_STYLE_HEADING_BASE_SIZE_HINT'),
				'style-heading-line-height-hint' => JText::_('SUNFW_STYLE_HEADING_LINE_HEIGHT_HINT'),
				'style-heading-letter-spacing-hint' => JText::_('SUNFW_STYLE_HEADING_LETTER_SPACING_HINT'),
				'style-heading-font-family-google-hint' => JText::_('SUNFW_STYLE_HEADING_FONT_FAMILY_GOOGLE_HINT'),
				'style-content-color-hint' => JText::_('SUNFW_STYLE_CONTENT_COLOR_HINT'),
				'style-content-font-type-hint' => JText::_('SUNFW_STYLE_CONTENT_FONT_TYPE_HINT'),
				'style-content-font-family-hint' => JText::_('SUNFW_STYLE_CONTENT_FONT_FAMILY_HINT'),
				'style-content-google-font-family-hint' => JText::_('SUNFW_STYLE_CONTENT_GOOGLE_FONT_FAMILY_HINT'),
				'style-content-font-file-hint' => JText::_('SUNFW_STYLE_CONTENT_FONT_FILE_HINT'),
				'style-content-font-weight-file' => JText::_('SUNFW_STYLE_CONTENT_FONT_WEIGHT_FILE'),
				'style-content-font-size-file' => JText::_('SUNFW_STYLE_CONTENT_FONT_SIZE_FILE'),
				'style-content-line-height-file' => JText::_('SUNFW_STYLE_CONTENT_LINE_HEIGHT_FILE'),
				'style-default-button-padding-hint' => JText::_('SUNFW_STYLE_DEFAULT_BUTTON_PADDING_HINT'),
				'style-default-button-background-color-hint' => JText::_('SUNFW_STYLE_DEFAULT_BUTTON_BACKGROUND_COLOR_HINT'),
				'style-default-button-border-hint' => JText::_('SUNFW_STYLE_DEFAULT_BUTTON_BORDER_HINT'),
				'style-default-button-border-radius-hint' => JText::_('SUNFW_STYLE_DEFAULT_BUTTON_BORDER_RADIUS_HINT'),
				'style-default-button-box-shadow-hint' => JText::_('SUNFW_STYLE_DEFAULT_BUTTON_BOX_SHADOW_HINT'),
				'style-default-button-text-color-hint' => JText::_('SUNFW_STYLE_DEFAULT_BUTTON_TEXT_COLOR_HINT'),
				'style-default-button-font-weight-hint' => JText::_('SUNFW_STYLE_DEFAULT_BUTTON_FONT_WEIGHT_HINT'),
				'style-default-button-font-style-hint' => JText::_('SUNFW_STYLE_DEFAULT_BUTTON_FONT_STYLE_HINT'),
				'style-default-button-text-transform-hint' => JText::_('SUNFW_STYLE_DEFAULT_BUTTON_TEXT_TRANSFORM_HINT'),
				'style-default-button-text-shadow-hint' => JText::_('SUNFW_STYLE_DEFAULT_BUTTON_TEXT_SHADOW_HINT'),
				'style-default-button-font-size-hint' => JText::_('SUNFW_STYLE_DEFAULT_BUTTON_FONT_SIZE_HINT'),
				'style-default-button-letter-spacing-hint' => JText::_('SUNFW_STYLE_DEFAULT_BUTTON_LETTER_SPACING_HINT'),
				'style-default-button-background-color-hover-hint' => JText::_('SUNFW_STYLE_DEFAULT_BUTTON_BACKGROUND_COLOR_HOVER_HINT'),
				'style-default-button-border-color-hover-hint' => JText::_('SUNFW_STYLE_DEFAULT_BUTTON_BORDER_COLOR_HOVER_HINT'),
				'style-default-button-text-color-hover-hint' => JText::_('SUNFW_STYLE_DEFAULT_BUTTON_TEXT_COLOR_HOVER_HINT'),
				'style-primary-button-background-color-hint' => JText::_('SUNFW_STYLE_PRIMARY_BUTTON_BACKGROUND_COLOR_HINT'),
				'style-primary-button-border-hint' => JText::_('SUNFW_STYLE_PRIMARY_BUTTON_BORDER_HINT'),
				'style-primary-button-box-shadow-hint' => JText::_('SUNFW_STYLE_PRIMARY_BUTTON_BOX_SHADOW_HINT'),
				'style-primary-button-text-color-hint' => JText::_('SUNFW_STYLE_PRIMARY_BUTTON_TEXT_COLOR_HINT'),
				'style-primary-button-text-shadow-hint' => JText::_('SUNFW_STYLE_PRIMARY_BUTTON_TEXT_SHADOW_HINT'),
				'style-primary-button-border-color-hover-hint' => JText::_('SUNFW_STYLE_PRIMARY_BUTTON_BORDER_COLOR_HOVER_HINT'),
				'style-primary-button-text-color-hover-hint' => JText::_('SUNFW_STYLE_PRIMARY_BUTTON_TEXT_COLOR_HOVER_HINT'),
				'style-primary-button-background-color-hover-hint' => JText::_('SUNFW_STYLE_PRIMARY_BUTTON_BACKGROUND_COLOR_HOVER_HINT'),
				'style-link-normal-color-hint' => JText::_('SUNFW_STYLE_LINK_NORMAL_COLOR_HINT'),
				'style-link-hover-color-hint' => JText::_('SUNFW_STYLE_LINK_HOVER_COLOR_HINT'),
				'style-section-background-color-hint' => JText::_('SUNFW_STYLE_SECTION_BACKGROUND_COLOR_HINT'),
				'style-section-background-image-hint' => JText::_('SUNFW_STYLE_SECTION_BACKGROUND_IMAGE_HINT'),
				'style-section-background-image-settings-hint' => JText::_('SUNFW_STYLE_SECTION_BACKGROUND_IMAGE_SETTINGS_HINT'),
				'style-section-border-hint' => JText::_('SUNFW_STYLE_SECTION_BORDER_HINT'),
				'style-section-heading-color-hint' => JText::_('SUNFW_STYLE_SECTION_HEADING_COLOR_HINT'),
				'style-section-heading-font-weight-hint' => JText::_('SUNFW_STYLE_SECTION_HEADING_FONT_WEIGHT_HINT'),
				'style-section-heading-text-transform-hint' => JText::_('SUNFW_STYLE_SECTION_HEADING_TEXT_TRANSFORM_HINT'),
				'style-section-heading-text-shadow-hint' => JText::_('SUNFW_STYLE_SECTION_HEADING_TEXT_SHADOW_HINT'),
				'style-section-heading-base-size-hint' => JText::_('SUNFW_STYLE_SECTION_HEADING_BASE_SIZE_HINT'),
				'style-section-heading-line-height-hint' => JText::_('SUNFW_STYLE_SECTION_HEADING_LINE_HEIGHT_HINT'),
				'style-section-heading-letter-spacing-hint' => JText::_('SUNFW_STYLE_SECTION_HEADING_LETTER_SPACING_HINT'),
				'style-use-custom-settings-hint' => JText::_('SUNFW_STYLE_USE_CUSTOM_SETTINGS_HINT'),
				'style-section-content-color-hint' => JText::_('SUNFW_STYLE_SECTION_CONTENT_COLOR_HINT'),
				'style-section-content-font-size-hint' => JText::_('SUNFW_STYLE_SECTION_CONTENT_FONT_SIZE_HINT'),
				'style-section-content-line-height-hint' => JText::_('SUNFW_STYLE_SECTION_CONTENT_LINE_HEIGHT_HINT'),
				'style-module-padding-hint' => JText::_('SUNFW_STYLE_MODULE_PADDING_HINT'),
				'style-module-background-color-hint' => JText::_('SUNFW_STYLE_MODULE_BACKGROUND_COLOR_HINT'),
				'style-module-background-image-hint' => JText::_('SUNFW_STYLE_MODULE_BACKGROUND_IMAGE_HINT'),
				'style-module-background-image-settings-hint' => JText::_('SUNFW_STYLE_MODULE_BACKGROUND_IMAGE_SETTINGS_HINT'),
				'style-module-border-hint' => JText::_('SUNFW_STYLE_MODULE_BORDER_HINT'),
				'style-module-title-background-color-hint' => JText::_('SUNFW_STYLE_MODULE_TITLE_BACKGROUND_COLOR_HINT'),
				'style-module-title-text-color-hint' => JText::_('SUNFW_STYLE_MODULE_TITLE_TEXT_COLOR_HINT'),
				'style-module-title-font-weight-hint' => JText::_('SUNFW_STYLE_MODULE_TITLE_FONT_WEIGHT_HINT'),
				'style-module-title-text-transform-hint' => JText::_('SUNFW_STYLE_MODULE_TITLE_TEXT_TRANSFORM_HINT'),
				'style-module-title-font-size-hint' => JText::_('SUNFW_STYLE_MODULE_TITLE_FONT_SIZE_HINT'),
				'style-module-title-icon-size-hint' => JText::_('SUNFW_STYLE_MODULE_TITLE_ICON_SIZE_HINT'),
				'style-module-title-icon-color-hint' => JText::_('SUNFW_STYLE_MODULE_TITLE_ICON_COLOR_HINT'),
				'style-module-content-color-hint' => JText::_('SUNFW_STYLE_MODULE_CONTENT_COLOR_HINT'),
				'style-module-content-font-size-hint' => JText::_('SUNFW_STYLE_MODULE_CONTENT_FONT_SIZE_HINT'),
				'style-menu-font-type-hint' => JText::_('SUNFW_STYLE_MENU_FONT_TYPE_HINT'),
				'style-menu-font-family-hint' => JText::_('SUNFW_STYLE_MENU_FONT_FAMILY_HINT'),
				'style-menu-google-font-family-hint' => JText::_('SUNFW_STYLE_MENU_GOOGLE_FONT_FAMILY_HINT'),
				'style-menu-font-file-hint' => JText::_('SUNFW_STYLE_MENU_FONT_FILE_HINT'),
				'style-menu-font-size-hint' => JText::_('SUNFW_STYLE_MENU_FONT_SIZE_HINT'),
				'style-menu-text-transform-hint' => JText::_('SUNFW_STYLE_MENU_TEXT_TRANSFORM_HINT'),
				'style-menu-background-color-hint' => JText::_('SUNFW_STYLE_MENU_BACKGROUND_COLOR_HINT'),
				'style-menu-link-color-hint' => JText::_('SUNFW_STYLE_MENU_LINK_COLOR_HINT'),
				'style-menu-background-color-hover-hint' => JText::_('SUNFW_STYLE_MENU_BACKGROUND_COLOR_HOVER_HINT'),
				'style-menu-link-color-hover-hint' => JText::_('SUNFW_STYLE_MENU_LINK_COLOR_HOVER_HINT'),
				'default-button' => JText::_('SUNFW_DEFAULT_BUTTON'),
				'primary-button' => JText::_('SUNFW_PRIMARY_BUTTON')
			)
		);

		if ($return)
		{
			return $data;
		}

		$this->setResponse($data);
	}

	/**
	 * Save style data to database.
	 *
	 * @return  void
	 */
	public function saveAction()
	{
		// Prepare input data.
		$data = $this->input->get('data', '', 'raw');

		if (empty($data))
		{
			throw new Exception('Invalid Request');
		}

		// Prepare values for color related options.
		$data = SunFwHelper::synchronizeColorValues($data, $data);

		// Prepare some values for backward compatible.
		if (isset($data['general']) && isset($data['general']['content']))
		{
			if (isset($data['general']['content']['color']) && !isset($data['general']['content']['text-color']))
			{
				$data['general']['content']['text-color'] = $data['general']['content']['color'];
			}
		}

		// Synchronize color values with layout and mega menu.
		$style = SunFwHelper::getSunFwStyle($this->styleID);

		if ($style)
		{
			$style->appearance_data = SunFwHelper::getStyleData($style, $this->templateName);

			$style->layout_builder_data = SunFwHelper::getLayoutData($style, $this->templateName);
			$style->layout_builder_data = SunFwHelper::synchronizeColorValues($style->appearance_data, $style->layout_builder_data, null,
				true);
			$style->layout_builder_data = SunFwHelper::synchronizeColorValues($data, $style->layout_builder_data);
			$style->layout_builder_data = json_encode($style->layout_builder_data);

			$style->mega_menu_data = SunFwHelper::synchronizeColorValues($style->appearance_data, $style->mega_menu_data, null, true);
			$style->mega_menu_data = SunFwHelper::synchronizeColorValues($data, $style->mega_menu_data);
			$style->mega_menu_data = json_encode($style->mega_menu_data);
		}

		// Build query to save style data.
		$data = json_encode($data);
		$query = $this->dbo->getQuery(true);

		if ($style)
		{
			$query->update($this->dbo->quoteName('#__sunfw_styles'))
				->set($this->dbo->quoteName('appearance_data') . '=' . $this->dbo->quote($data))
				->set($this->dbo->quoteName('layout_builder_data') . '=' . $this->dbo->quote($style->layout_builder_data))
				->set($this->dbo->quoteName('mega_menu_data') . '=' . $this->dbo->quote($style->mega_menu_data))
				->where($this->dbo->quoteName('style_id') . '=' . intval($this->styleID))
				->where($this->dbo->quoteName('template') . '=' . $this->dbo->quote($this->templateName));
		}
		else
		{
			$columns = array(
				'style_id',
				'template',
				'appearance_data'
			);
			$values = array(
				intval($this->styleID),
				$this->dbo->quote($this->templateName),
				$this->dbo->quote($data)
			);

			$query->insert($this->dbo->quoteName('#__sunfw_styles'))
				->columns($this->dbo->quoteName($columns))
				->values(implode(', ', $values));
		}

		// Execute query to save style data.
		try
		{
			$this->dbo->setQuery($query);

			if (!$this->dbo->execute())
			{
				throw new Exception($this->dbo->getErrorMsg());
			}
			else
			{
				$sufwrender = new SunFwScssrender();

				if ($style)
				{
					$sufwrender->compile($this->styleID, $this->templateName, 'layout');
				}

				$sufwrender->compile($this->styleID, $this->templateName, 'appearance');
			}
		}
		catch (Exception $e)
		{
			throw $e;
		}

		$this->setResponse(array(
			'message' => JText::_('SUNFW_STYLES_SAVED_SUCCESSFULLY')
		));
	}

	/**
	 * Save lstyle data as style preset.
	 *
	 * @throws  Exception
	 */
	public function saveAsAction()
	{
		// Prepare input data.
		$data = $this->input->get('data', '', 'raw');
		$name = $this->input->getString('style_name', '');
		$style = SunFwHelper::getSunFwStyle($this->styleID);

		if (empty($data) || empty($name))
		{
			throw new Exception('Invalid Request');
		}

		// Get a writtable directory to save style preset.
		$directory = SunFwHelper::getWritableDirectory(SunFwHelper::getStyleDirectories($this->templateName, true, $style));

		if (!$directory)
		{
			throw new Exception(JText::sprintf('SUNFW_NOT_FOUND_WRITABLE_DIRECTORY', implode("\n\n", $directories)));
		}

		// Write style data to style preset file.
		$file = "{$directory}/" . preg_replace('/[^a-zA-Z0-9\-_]+/', '_', $name) . '.json';

		if (!JFile::write($file, $data))
		{
			throw new Exception(JText::sprintf('SUNFW_ERROR_FAILED_TO_SAVE_FILENAME', $file));
		}

		// Set response data.
		$name = substr(basename($file), 0, -5);

		$this->setResponse(array(
			'name' => $name,
			'message' => JText::_('SUNFW_STYLE_PRESET_SAVED_SUCCESSFULLY')
		));
	}

	/**
	 * Method to get list of Google fonts.
	 *
	 * @return  void
	 */
	public function getGoogleFontsAction()
	{
		// Get dynamic list of Google fonts.
		$link = 'https://www.googleapis.com/webfonts/v1/webfonts?key=AIzaSyCHuPGfMBxIWzmUz_CeqAJ7_X8INFG8h5Q';
		$http = new JHttp();
		$data = $http->get($link);

		if ($data = json_decode($data->body, true))
		{
			if (!isset($data['error']))
			{
				$this->setResponse($data);
			}
			else
			{
				// Get list of Google fonts from static file.
				if (is_file(SUNFW_PATH . '/googlefonts/googlefonts.json'))
				{
					$this->setResponse(json_decode(JFile::read(SUNFW_PATH . '/googlefonts/googlefonts.json'), true));
				}
				else
				{
					throw new Exception(JText::_('SUNFW_FAILED_TO_GET_GOOGLE_FONTS_LIST'));
				}
			}
		}
	}

	/**
	 * Method to get list of module styles.
	 *
	 * @return  void
	 */
	public function getModuleStylesAction()
	{
		// Get default module styles.
		$defaultModuleStyles = SunFwHelper::getDefaultModuleStyle($this->styleID);

		if (!count($defaultModuleStyles))
		{
			throw new Exception(JText::_('SWNFW_HAS_NO_DEFAULT_MODULE_STYLE'));
		}

		if (( isset($defaultModuleStyles['appearance']) && !isset($defaultModuleStyles['appearance']['modules']) ) ||
			 ( !isset($defaultModuleStyles['appearance']) && !isset($defaultModuleStyles['module']) ))
		{
			throw new Exception(JText::_('SWNFW_HAS_NO_DEFAULT_MODULE_STYLE'));
		}

		$this->setResponse(
			array_keys(
				isset($defaultModuleStyles['appearance']) ? $defaultModuleStyles['appearance']['modules'] : $defaultModuleStyles['module']));
	}

	/**
	 * Remove prebuilt layout.
	 *
	 * @return  void
	 */
	public function removeAction()
	{
		// Prepare input data.
		$styleName = $this->input->getString('style_name', '');

		$style = SunFwHelper::getSunFwStyle($this->styleID);
		if (empty($styleName))
		{
			throw new Exception('Invalid Request');
		}

		// Find prebuilt layout file.
		foreach (SunFwHelper::getStyleDirectories($this->templateName, false, $style) as $dir)
		{
			if (is_file($file = "{$dir}/{$styleName}.json"))
			{
				if (!JFile::delete($file))
				{
					throw new Exception(JText::sprintf('SUNFW_FAILED_TO_REMOVE_FILE', $file));
				}
			}
		}
	}
}
