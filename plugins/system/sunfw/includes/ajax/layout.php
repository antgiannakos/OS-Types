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

// Import necessary libraries.
jimport('joomla.filesystem.folder');
jimport('joomla.filesystem.file');
jimport('joomla.filesystem.path');

/**
 * Handle Ajax requests from layout pane.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwAjaxLayout extends SunFwAjax
{

	/**
	 * Get layout data from database.
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
		 * Get layout builder's items.
		 */
		$items = array(
			'logo' => '',
			'menu' => '',
			'module-position' => '',
			'joomla-module' => '',
			'page-content' => '',
			'social-icon' => '',
			'custom-html' => '',
			'flexible-space' => ''
		);

		// Get path to layout builder item's setting files.
		$_items = SunFwHelper::findTemplateAdminJsonSettings(
			JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/layout/settings/items');

		foreach ($_items as $k => $v)
		{
			$items[$k] = $v;
		}

		// Allow 3rd-party to add their own items into layout builder.
		$items = array_merge($items, JEventDispatcher::getInstance()->trigger('SunFwGetLayoutItems'));

		/**
		 * Get layout builder's screens.
		 */
		$screens = array_merge(
			array(
				'lg' => JText::_('SUNFW_DESKTOP'),
				'md' => JText::_('SUNFW_LATOP'),
				'sm' => JText::_('SUNFW_TABLET'),
				'xs' => JText::_('SUNFW_SMARTPHONE')
			),
			// Allow 3rd-party to add additional screens into layout builder.
			JEventDispatcher::getInstance()->trigger('SunFwGetLayoutScreens'));

		/**
		 * Get layout builder's offcanvas.
		 */
		$offcanvas = array_merge(
			array(
				'top' => array(
					'label' => JText::_('SUNFW_OFFCANVAS_TOP'),
					'settings' => SunFwHelper::findTemplateAdminJsonSettings(
						JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/layout/settings/items', 'offcanvas-top.json', true)
				),
				'right' => array(
					'label' => JText::_('SUNFW_OFFCANVAS_RIGHT'),
					'settings' => SunFwHelper::findTemplateAdminJsonSettings(
						JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/layout/settings/items', 'offcanvas-right.json',
						true)
				),
				'bottom' => array(
					'label' => JText::_('SUNFW_OFFCANVAS_BOTTOM'),
					'settings' => SunFwHelper::findTemplateAdminJsonSettings(
						JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/layout/settings/items', 'offcanvas-bottom.json',
						true)
				),
				'left' => array(
					'label' => JText::_('SUNFW_OFFCANVAS_LEFT'),
					'settings' => SunFwHelper::findTemplateAdminJsonSettings(
						JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/layout/settings/items', 'offcanvas-left.json', true)
				)
			),
			// Allow 3rd-party to add additional offcanvas into layout builder.
			JEventDispatcher::getInstance()->trigger('SunFwGetLayoutOffcanvas'));

		/**
		 * Get layout builder's prebuilt layouts.
		 */
		$prebuilds = SunFwHelper::findTemplateAdminJsonSettings(SunFwHelper::getLayoutDirectories($this->templateName), '*.json', false,
			'SUNFW_PREBUILD_LAYOUT_');

		// Allow 3rd-party to add their own prebuilt layouts into layout builder.
		$prebuilds = array_merge($prebuilds, JEventDispatcher::getInstance()->trigger('SunFwGetLayoutPrebuilds'));

		/**
		 * Get custom input components.
		 */
		$inputs = array();
		$path = JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/layout/inputs';
		$vd = 'v=' . SUNFW_VERSION . '&d=' . SUNFW_RELEASED_DATE;

		foreach (glob("{$path}/*.js") as $input)
		{
			$inputs[substr(basename($input), 0, -3)] = $root . str_replace(JPATH_ROOT, '', $input) . "?{$vd}";
		}

		// Allow 3rd-party to add their own custom inputs into layout builder.
		$inputs = array_merge($inputs, JEventDispatcher::getInstance()->trigger('SunFwGetLayoutInputs'));

		/**
		 * Synchronize color values for editing.
		 */
		$layout = SunFwHelper::getLayoutData(SunFwHelper::getSunFwStyle($this->styleID), $this->templateName);
		$layout = SunFwHelper::synchronizeColorValues($this->styleID, $layout, $this->templateName, true);

		/**
		 * Prepare response data.
		 */
		$data = array(
			'url' => $this->baseUrl,
			'data' => (object) $layout,
			'grid' => 12,
			'items' => $items,
			'inputs' => $inputs,
			'screens' => $screens,
			'offcanvas' => $offcanvas,
			'prebuilds' => $prebuilds,
			'settings' => SunFwHelper::findTemplateAdminJsonSettings(
				JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/layout/settings', 'page.json', true),
			'textMapping' => array(
				'layout' => JText::_('SUNFW_LAYOUT'),
				'layout-builder' => JText::_('SUNFW_LAYOUT_BUILDER'),
				'empty-layout-message' => JText::_('SUNFW_LAYOUT_BUILDER_EMPTY_MESSAGE'),
				'or' => JText::_('SUNFW_OR'),
				'select-predefined-layout' => JText::_('SUNFW_SELECT_PREDEFINED_LAYOUT'),
				'layout-page' => JText::_('SUNFW_LAYOUT_PAGE'),
				'layout-section' => JText::_('SUNFW_LAYOUT_SECTION'),
				'item-row' => JText::_('SUNFW_LAYOUT_ROW'),
				'item-column' => JText::_('SUNFW_LAYOUT_COLUMN'),
				'page-settings' => JText::_('SUNFW_PAGE_SETTINGS'),
				'section-settings' => JText::_('SUNFW_SECTION_SETTINGS'),
				'offcanvas-settings' => JText::_('SUNFW_OFFCANVAS_SETTINGS'),
				'row-settings' => JText::_('SUNFW_ROW_SETTINGS'),
				'column-settings' => JText::_('SUNFW_COLUMN_SETTINGS'),
				'item-settings' => JText::_('SUNFW_ITEM_SETTINGS'),
				'enable-responsive' => JText::_('SUNFW_ENABLE_RESPONSIVE'),
				'desktop-switcher' => JText::_('SUNFW_SHOW_DESKTOP_SWITCHER'),
				'boxed-layout' => JText::_('SUNFW_ENABLE_BOXED_LAYOUT'),
				'boxed-layout-width' => JText::_('SUNFW_BOXED_LAYOUT_WIDTH'),
				'boxed-layout-min-width' => JText::_('SUNFW_MINIMUM_WIDTH_FOR_BOX_LAYOUT_IS_767'),
				'show-go-to-top' => JText::_('SUNFW_SHOW_GO_TO_TOP'),
				'load-prebuilt-layout' => JText::_('SUNFW_LOAD_PREBUILT_LAYOUT'),
				'save-prebuilt-layout' => JText::_('SUNFW_SAVE_PREBUILT_LAYOUT'),
				'prebuilt-layout-name' => JText::_('SUNFW_PREBUILT_LAYOUT_NAME'),
				'new-layout' => JText::_('SUNFW_NEW_LAYOUT'),
				'save-layout' => JText::_('SUNFW_SAVE_LAYOUT'),
				'no-pre-layout' => JText::_('SUNFW_NO_PRE_LAYOUT'),
				'mobile-screen-can-have-only-2-columns-per-row' => JText::_('SUNFW_MOBILE_SCREEN_LIMITATION_REACHED'),
				'clone-label' => JText::_('SUNFW_CLONE_LABEL'),
				'duplicate-id' => JText::_('SUNFW_DUPLICATE_ID'),
				'one-time-item' => JText::_('SUNFW_ONE_TIME_ITEM_NOTICE'),
				'clone-item-error' => JText::_('SUNFW_CLONE_ITEM_ERROR_MESSAGE'),
				'used-one-time-item' => JText::_('SUNFW_USED_ONE_TIME_ITEM'),
				'enable-responsive-hint' => JText::_('SUNFW_ENABLE_RESPONSIVE_HIT'),
				'show-desktop-switcher-hint' => JText::_('SUNFW_SHOW_DESKTOP_SWITCHER_HINT'),
				'enable-boxed-layout-hint' => JText::_('SUNFW_ENABLE_BOXED_LAYOUT_HINT'),
				'margin-hint' => JText::_('SUNFW_MARGIN_HINT'),
				'show-go-to-top-hint' => JText::_('SUNFW_SHOW_GO_TO_TOP_HINT'),
				'go-to-top-icon-hint' => JText::_('SUNFW_GO_TO_TOP_ICON_HINT'),
				'go-to-top-text-hint' => JText::_('SUNFW_GO_TO_TOP_TEXT_HINT'),
				'go-to-top-text-color-hint' => JText::_('SUNFW_GO_TO_TOP_TEXT_COLOR_HINT'),
				'go-to-top-background-color-hint' => JText::_('SUNFW_GO_TO_TOP_TEXT_BACKGROUND_HINT'),
				'go-to-top-position-hint' => JText::_('SUNFW_GO_TO_TOP_POSITION_HINT'),
				'layout-section-name-hint' => JText::_('SUNFW_LAYOUT_SECTION_NAME_HINT'),
				'layout-section-enable-full-width-hint' => JText::_('SUNFW_LAYOUT_SECTION_ENABLE_FULL_WIDTH_HINT'),
				'layout-section-enable-sticky-hint' => JText::_('SUNFW_LAYOUT_SECTION_ENABLE_STICKY_HINT'),
				'layout-section-margin-hint' => JText::_('SUNFW_LAYOUT_SECTION_MARGIN_HINT'),
				'layout-section-padding-hint' => JText::_('SUNFW_LAYOUT_SECTION_PADDING_HINT'),
				'layout-section-custom-classes-hint' => JText::_('SUNFW_LAYOUT_SECTION_CUSTOM_CLASSES_HINT'),
				'layout-row-margin-hint' => JText::_('SUNFW_LAYOUT_ROW_MARGIN_HINT'),
				'layout-row-padding-hint' => JText::_('SUNFW_LAYOUT_ROW_PADDING_HINT'),
				'layout-row-custom-classes-hint' => JText::_('SUNFW_LAYOUT_ROW_CUSTOM_CLASSES_HINT'),
				'layout-column-margin-hint' => JText::_('SUNFW_LAYOUT_COLUMN_MARGIN_HINT'),
				'layout-column-padding-hint' => JText::_('SUNFW_LAYOUT_COLUMN_PADDING_HINT'),
				'layout-column-display-in-layouts-hint' => JText::_('SUNFW_LAYOUT_COLUMN_DISPLAY_IN_LAYOUTS_HINT'),
				'layout-column-custom-classes-hint' => JText::_('SUNFW_LAYOUT_COLUMN_CUSTOM_CLASSES_HINT'),
				'layout-logo-name-hint' => JText::_('SUNFW_LAYOUT_LOGO_NAME_HINT'),
				'layout-logo-hint' => JText::_('SUNFW_LAYOUT_LOGO_HINT'),
				'layout-mobile-logo-hint' => JText::_('SUNFW_LAYOUT_MOBILE_LOGO_HINT'),
				'layout-logo-alt-text-hint' => JText::_('SUNFW_LAYOUT_LOGO_ALT_TEXT_HINT'),
				'layout-logo-link-hint' => JText::_('SUNFW_LAYOUT_LOGO_LINK_HINT'),
				'layout-logo-display-in-layout-hint' => JText::_('SUNFW_LAYOUT_LOGO_DISPLAY_IN_LAYOUT_HINT'),
				'layout-logo-custom-classes-hint' => JText::_('SUNFW_LAYOUT_LOGO_CUSTOM_CLASSES_HINT'),
				'layout-menu-name-hint' => JText::_('SUNFW_LAYOUT_MENU_NAME_HINT'),
				'layout-menu-hint' => JText::_('SUNFW_LAYOUT_MENU_HINT'),
				'layout-menu-base-item-hint' => JText::_('SUNFW_LAYOUT_MENU_BASE_ITEM_HINT'),
				'layout-menu-start-level-item-hint' => JText::_('SUNFW_LAYOUT_MENU_START_LEVEL_ITEM_HINT'),
				'layout-menu-end-level-hint' => JText::_('SUNFW_LAYOUT_MENU_END_LEVEL_HINT'),
				'layout-menu-show-icon-hint' => JText::_('SUNFW_LAYOUT_MENU_SHOW_ICON_HINT'),
				'layout-menu-show-description-hint' => JText::_('SUNFW_LAYOUT_MENU_SHOW_DESCRIPTION_HINT'),
				'layout-menu-show-submenu-hint' => JText::_('SUNFW_LAYOUT_MENU_SHOW_SUBMENU_HINT'),
				'layout-menu-sub-effect-hint' => JText::_('SUNFW_LAYOUT_MENU_SUB_EFFECT_HINT'),
				'layout-menu-mobile-target-hint' => JText::_('SUNFW_LAYOUT_MENU_MOBILE_TARGET_HINT'),
				'layout-menu-display-in-layout-hint' => JText::_('SUNFW_LAYOUT_MENU_DISPLAY_IN_LAYOUT_HINT'),
				'layout-menu-custom-classes-hint' => JText::_('SUNFW_LAYOUT_MENU_CUSTOM_CLASSES_HINT'),
				'layout-module-position-name-hint' => JText::_('SUNFW_LAYOUT_MODULE_POSITION_NAME_HINT'),
				'layout-module-position-position-hint' => JText::_('SUNFW_LAYOUT_MODULE_POSITION_POSITION_HINT'),
				'layout-module-position-display-in-layout-hint' => JText::_('SUNFW_LAYOUT_MODULE_POSITION_DISPLAY_IN_LAYOUT_HINT'),
				'layout-module-position-custom-classes-hint' => JText::_('SUNFW_LAYOUT_MODULE_POSITION_CUSTOM_CLASSES_HINT'),
				'layout-joomla-module-name-hint' => JText::_('SUNFW_LAYOUT_JOOMLA_MODULE_NAME_HINT'),
				'layout-joomla-module-selector-hint' => JText::_('SUNFW_LAYOUT_JOOMLA_MODULE_PICKER_HINT'),
				'layout-joomla-module-display-in-layout-hint' => JText::_('SUNFW_LAYOUT_JOOMLA_MODULE_DISPLAY_IN_LAYOUT_HINT'),
				'layout-joomla-module-custom-classes-hint' => JText::_('SUNFW_LAYOUT_JOOMLA_MODULE_CUSTOM_CLASSES_HINT'),
				'layout-page-content-show-on-front-page' => JText::_('SUNFW_LAYOUT_PAGE_CONTENT_SHOW_ON_FRONT_PAGE'),
				'layout-social-icon-name-hint' => JText::_('SUNFW_LAYOUT_SOCIAL_ICON_NAME_HINT'),
				'layout-social-icon-icons-hint' => JText::_('SUNFW_LAYOUT_SOCIAL_ICON_ICONS_HINT'),
				'layout-social-icon-color-hint' => JText::_('SUNFW_LAYOUT_SOCIAL_ICON_COLOR_HINT'),
				'layout-social-icon-size-hint' => JText::_('SUNFW_LAYOUT_SOCIAL_ICON_SIZE_HINT'),
				'layout-social-icon-link-target-hint' => JText::_('SUNFW_LAYOUT_SOCIAL_ICON_LINK_TARGET_HINT'),
				'layout-social-icon-display-in-layout-hint' => JText::_('SUNFW_LAYOUT_SOCIAL_ICON_DISPLAY_IN_LAYOUT_HINT'),
				'layout-social-icon-custom-classes-hint' => JText::_('SUNFW_LAYOUT_SOCIAL_ICON_CUSTOM_CLASSES_HINT'),
				'layout-custom-html-name-hint' => JText::_('SUNFW_LAYOUT_CUSTOM_HTML_NAME_HINT'),
				'layout-custom-html-content-hint' => JText::_('SUNFW_LAYOUT_CUSTOM_HTML_CONTENT_HINT'),
				'layout-custom-html-display-in-layout-hint' => JText::_('SUNFW_LAYOUT_CUSTOM_HTML_DISPLAY_IN_LAYOUT_HINT'),
				'layout-custom-html-custom-classes-hint' => JText::_('SUNFW_LAYOUT_CUSTOM_HTML_CUSTOM_CLASSES_HINT'),
				'layout-flexible-space-name-hint' => JText::_('SUNFW_LAYOUT_FLEXIBLE_SPACE_NAME_HINT'),
				'layout-flexible-space-display-in-layout-hint' => JText::_('SUNFW_LAYOUT_FLEXIBLE_SPACE_DISPLAY_IN_LAYOUT_HINT'),
				'layout-flexible-space-custom-classes-hint' => JText::_('SUNFW_LAYOUT_FLEXIBLE_SPACE_CUSTOM_CLASSES_HINT'),
				'base-item' => JText::_('SUNFW_TEXT_BASE_ITEM'),
				'start-level' => JText::_('SUNFW_TEXT_START_LEVEL'),
				'end-level' => JText::_('SUNFW_TEXT_END_LEVEL'),
				'show-sub-menu-items' => JText::_('SUNFW_TEXT_SHOW_SUB_MENU_ITEMS'),
				'menu-sub-effect' => JText::_('SUNFW_TEXT_MENU_SUB_EFFECT'),
				'enable-sticky' => JText::_('SUNFW_TEXT_ENABLE_STICKY'),
				'mobile-target' => JText::_('SUNFW_TEXT_MOBILE_TARGET'),
				'show-icon' => JText::_('SUNFW_SHOW_ICON'),
				'show-description' => JText::_('SUNFW_SHOW_DESCRIPTION'),
				'show-submenu' => JText::_('SUNFW_SHOW_SUBMENU'),
				'preview-layout' => JText::_('SUNFW_PREVIEW_LAYOUT'),
				'view-modules' => JText::_('SUNFW_VIEW_MODULES'),
				'show-offcanvas-toggle' => JText::_('SUNFW_OFFCANVAS_SHOW_TOGGLE'),
				'show-offcanvas-toggle-hint' => JText::_('SUNFW_OFFCANVAS_SHOW_TOGGLE_HINT'),
				'toggle-position' => JText::_('SUNFW_TOGGLE_POSITION'),
				'open-on-hover' => JText::_('SUNFW_OPEN_ON_HOVER'),
				'enable-full-width' => JText::_('SUNFW_ENABLE_FULL_WIDTH'),
				'display-in-layout' => JText::_('SUNFW_DISPLAY_IN_LAYOUT'),
				'show-on-front-page' => JText::_('SUNFW_SHOW_ON_FRONT_PAGE'),
				'mobile-logo' => JText::_('SUNFW_MOBILE_LOGO'),
				'logo-alt-text' => JText::_('SUNFW_LOGO_ALT_TEXT'),
				'logo-link' => JText::_('SUNFW_LOGO_LINK'),
				'full_width' => JText::_('SUNFW_FULL_WIDTH'),
				'desktop_and_mobile' => JText::_('SUNFW_DESKTOP_AND_MOBILE'),
				'show-branding-link' => JText::_('SUNFW_SHOW_BRANDING_LINK'),
				'show-branding-link-hint' => JText::_('SUNFW_SHOW_BRANDING_LINK_DESC'),
				'branding-link-text' => JText::_('SUNFW_BRANDING_LINK_TEXT'),
				'branding-link-text-hint' => JText::_('SUNFW_BRANDING_LINK_TEXT_DESC'),
				'enable-responsive-to-switch-device' => JText::_('SUNFW_ENABLE_RESPONSIVE_TO_SWITCH_DEVICE')
			)
		);

		if ($return)
		{
			return $data;
		}

		$this->setResponse($data);
	}

	/**
	 * Save layout builder data to database.
	 *
	 * @throws  Exception
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
		$data = SunFwHelper::synchronizeColorValues($this->styleID, $data, $this->templateName);

		// Build query to save layout builder data.
		$data = json_encode($data);
		$style = SunFwHelper::getSunFwStyle($this->styleID);
		$query = $this->dbo->getQuery(true);

		if ($style)
		{
			$query->update($this->dbo->quoteName('#__sunfw_styles'))
				->set($this->dbo->quoteName('layout_builder_data') . '=' . $this->dbo->quote($data))
				->where($this->dbo->quoteName('style_id') . '=' . intval($this->styleID))
				->where($this->dbo->quoteName('template') . '=' . $this->dbo->quote($this->templateName));
		}
		else
		{
			$columns = array(
				'style_id',
				'layout_builder_data',
				'template'
			);
			$values = array(
				intval($this->styleID),
				$this->dbo->quote($data),
				$this->dbo->quote($this->templateName)
			);

			$query->insert($this->dbo->quoteName('#__sunfw_styles'))
				->columns($this->dbo->quoteName($columns))
				->values(implode(', ', $values));
		}

		// Execute query to save layout builder data.
		try
		{
			$this->dbo->setQuery($query);

			if (!$this->dbo->execute())
			{
				throw new Exception($this->dbo->getErrorMsg());
			}
			else
			{
				$this->processAppearanceData();

				$sufwrender = new SunFwScssrender();

				$sufwrender->compile($this->styleID, $this->templateName, 'layout');
				$sufwrender->compile($this->styleID, $this->templateName);
			}
		}
		catch (Exception $e)
		{
			throw $e;
		}

		$this->setResponse(array(
			'message' => JText::_('SUNFW_LAYOUT_SAVED_SUCCESSFULLY')
		));
	}

	/**
	 * Save layout builder data as prebuilt layout.
	 *
	 * @throws  Exception
	 */
	public function saveAsAction()
	{
		// Prepare input data.
		$data = $this->input->get('data', '', 'raw');
		$name = $this->input->getString('layout_name', '');
		$setAsDefault = $this->input->getInt('default_layout', 0);

		if (empty($data) || empty($name))
		{
			throw new Exception('Invalid Request');
		}

		// Get a writtable directory to save prebuilt layout.
		$directory = SunFwHelper::getWritableDirectory(SunFwHelper::getLayoutDirectories($this->templateName, true));

		if (!$directory)
		{
			throw new Exception(JText::sprintf('SUNFW_NOT_FOUND_WRITABLE_DIRECTORY', implode("\n\n", $directories)));
		}

		// Write layout builder data to prebuilt layout file.
		$file = "{$directory}/" . preg_replace('/[^a-zA-Z0-9\-_]+/', '_', $name) . '.json';

		if (!JFile::write($file, $data))
		{
			throw new Exception(JText::sprintf('SUNFW_ERROR_FAILED_TO_SAVE_FILENAME', $file));
		}

		// Set default layout if requested.
		$name = substr(basename($file), 0, -5);

		if ($setAsDefault)
		{
			$this->setDefaultLayoutAction($name);
		}

		$this->setResponse(array(
			'name' => $name,
			'message' => JText::_('SUNFW_PREBUILD_LAYOUT_SAVED_SUCCESSFULLY')
		));
	}

	/**
	 * Remove prebuilt layout.
	 *
	 * @return  void
	 */
	public function removeAction()
	{
		// Prepare input data.
		$layout = $this->input->getString('layout_name');

		if (empty($layout))
		{
			throw new Exception('Invalid Request');
		}

		// Find prebuilt layout file.
		foreach (SunFwHelper::getLayoutDirectories($this->templateName) as $dir)
		{
			if (is_file($file = "{$dir}/{$layout}.json"))
			{
				if (!JFile::delete($file))
				{
					throw new Exception(JText::sprintf('SUNFW_FAILED_TO_REMOVE_FILE', $file));
				}
			}
		}
	}

	/**
	 * Set default layout.
	 *
	 * @param   string  $layout  File name without extension of the layout to set as default.
	 *
	 * @return  void
	 */
	public function setDefaultLayoutAction($layout = '')
	{
		// Prepare input data.
		$layout = empty($layout) ? $this->input->getString('layout_name', '') : $layout;

		if (empty($layout))
		{
			throw new Exception('Invalid Request');
		}

		// Prepare template's XML manifest data.
		$manifest = SunFwHelper::getManifest($this->templateName, 'template', null, true);

		if (!isset($manifest->defaultLayout))
		{
			$manifest->addChild('defaultLayout', $layout);
		}
		else
		{
			$manifest->defaultLayout = $layout;
		}

		// Save updated XML data to manifest file.
		try
		{
			SunFwHelper::updateManifest($this->templateName, $manifest);
		}
		catch (Exception $e)
		{
			throw $e;
		}
	}

	/**
	 * Change section ID in appearance data.
	 *
	 * @throws  Exception
	 */
	public function changeSectionIDForTemplateAction()
	{
		// Prepare input data.
		$old = $this->input->getString('old_data', '');
		$new = $this->input->getString('new_data', '');

		if (empty($new) || empty($old))
		{
			throw new Exception('Invalid Request');
		}

		if ($new == $old)
		{
			throw new Exception('Old value is equal new value');
		}

		// Build query to save layout builder data.
		$style = SunFwHelper::getSunFwStyle($this->styleID);
		$query = $this->dbo->getQuery(true);
		if (count($style))
		{

			$this->changeSectionIDForCustomCssFiles($style, $old, $new);

			if ($style->appearance_data != '')
			{
				$appearanceData = json_decode($style->appearance_data, true);

				if (count($appearanceData))
				{
					if (!isset($appearanceData['sections']))
					{
						$this->setResponse(array(
							'message' => JText::_('SUNFW_SAVED_SUCCESSFULLY')
						));
						return;
					}

					$isUpdate = false;
					$sections = $appearanceData['sections'];

					foreach ($sections as $key => $item)
					{
						if ($key == $old)
						{
							$isUpdate = true;
							$sections[$new] = $item;
							unset($sections[$old]);
							break;
						}
					}

					if ($isUpdate)
					{
						$appearanceData['sections'] = $sections;
						$tmpAppearanceData = $appearanceData;
						$query->update($this->dbo->quoteName('#__sunfw_styles'))
							->set($this->dbo->quoteName('appearance_data') . '=' . $this->dbo->quote(json_encode($tmpAppearanceData)))
							->where($this->dbo->quoteName('style_id') . '=' . intval($this->styleID))
							->where($this->dbo->quoteName('template') . '=' . $this->dbo->quote($this->templateName));
						// Execute query to save layout builder data.
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
				}
			}
		}

		$this->setResponse(array(
			'message' => JText::_('SUNFW_SAVED_SUCCESSFULLY')
		));
		return;
	}

	/**
	 * Delete section ID in appearance data.
	 *
	 * @throws  Exception
	 */
	public function deleteSectionIDInAppearanceAction()
	{
		// Prepare input data.
		$sid = $this->input->getString('section_id', '');

		if (empty($sid))
		{
			throw new Exception('Invalid Request');
		}

		// Build query to save layout builder data.
		$style = SunFwHelper::getSunFwStyle($this->styleID);
		$query = $this->dbo->getQuery(true);

		if (count($style))
		{
			if ($style->appearance_data != '')
			{
				$appearanceData = json_decode($style->appearance_data, true);
				if (count($appearanceData))
				{
					$appearanceData = $appearanceData['appearance'];
					if (count($appearanceData))
					{
						if (!isset($appearanceData['sections']))
						{
							$this->setResponse(
								array(
									'message' => JText::_('SUNFW_LAYOUT_BUILDER_SECTION_IS_NOT_EXISTED')
								));
							return;
						}

						$isDelete = false;
						$sections = $appearanceData['sections'];

						foreach ($sections as $key => $item)
						{
							if ($key == $sid)
							{
								$isDelete = true;
								unset($sections[$key]);
								break;
							}
						}

						if ($isDelete)
						{
							$appearanceData['sections'] = $sections;
							$tmpAppearanceData['appearance'] = $appearanceData;

							$query->update($this->dbo->quoteName('#__sunfw_styles'))
								->set($this->dbo->quoteName('appearance_data') . '=' . $this->dbo->quote(json_encode($tmpAppearanceData)))
								->where($this->dbo->quoteName('style_id') . '=' . intval($this->styleID))
								->where($this->dbo->quoteName('template') . '=' . $this->dbo->quote($this->templateName));
							// Execute query to save layout builder data.
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
					}
				}
			}
		}

		$this->setResponse(array(
			'message' => JText::_('SUNFW_SAVED_SUCCESSFULLY')
		));
		return;
	}

	/**
	 * Proccess Appearance data
	 *
	 * @throws Exception
	 * @return boolean
	 */
	public function processAppearanceData()
	{
		// Prepare styles data according to recent changes in layout data.
		$style = SunFwHelper::getSunFwStyle($this->styleID);
		$layoutBuilderSectionsID = array();
		$query = $this->dbo->getQuery(true);

		if (count($style))
		{
			$layoutBuilderData = $style->layout_builder_data;
			$appearanceData = $style->appearance_data;

			if ($layoutBuilderData != '' && $appearanceData != '')
			{
				$layoutBuilderData = json_decode($layoutBuilderData, true);
				$appearanceData = json_decode($appearanceData, true);

				if (count($layoutBuilderData) && count($appearanceData))
				{
					foreach ($layoutBuilderData['sections'] as $section)
					{
						if ($section != null && is_array($section))
						{
							$layoutBuilderSectionsID[] = $section['id'];
						}
					}

					if (!count($layoutBuilderSectionsID))
					{
						if (isset($appearanceData['appearance']['sections']))
						{
							unset($appearanceData['appearance']['sections']);
						}
					}
					else
					{

						if (isset($appearanceData['appearance']['sections']))
						{
							foreach ($appearanceData['appearance']['sections'] as $key => $item)
							{
								if (!in_array($key, $layoutBuilderSectionsID))
								{
									unset($appearanceData['appearance']['sections'][$key]);
								}
							}

							if (!count($appearanceData['appearance']['sections']))
							{
								unset($appearanceData['appearance']['sections']);
							}
						}
					}

					$query = $this->dbo->getQuery(true)
						->update($this->dbo->quoteName('#__sunfw_styles'))
						->set($this->dbo->quoteName('appearance_data') . '=' . $this->dbo->quote(json_encode($appearanceData)))
						->where($this->dbo->quoteName('style_id') . '=' . intval($this->styleID))
						->where($this->dbo->quoteName('template') . '=' . $this->dbo->quote($this->templateName));

					// Execute query to save appearance data.
					try
					{
						$this->dbo->setQuery($query);

						if (!$this->dbo->execute())
						{
							throw new Exception($this->dbo->getErrorMsg());
						}

						return true;
					}
					catch (Exception $e)
					{
						return false;
					}
				}
			}
		}
	}

	/**
	 * Auto Change section ID form Customer Css Files
	 *
	 * @param object $style
	 * @param string $this->templateName	the template name
	 * @param unknown $old			the old ID
	 * @param unknown $new			the new ID
	 * @return boolean
	 */
	public function changeSectionIDForCustomCssFiles($style, $old, $new)
	{
		if ($old == $new)
			return true;

		$files = array();
		$custom = JPATH_ROOT . '/templates/' . $this->templateName . '/css/custom/custom.css';

		if (JFile::exists($custom))
		{
			$files[] = $custom;
		}

		if (count($style))
		{
			$systemData = $style->system_data;
			if ($systemData != '')
			{
				$systemData = json_decode($systemData, true);
				if (count($systemData))
				{
					if (isset($systemData['niche-style']))
					{
						if ($systemData['niche-style'] != '')
						{
							$niche = JPATH_ROOT . '/templates/' . $this->templateName . '/niches/' . $systemData['niche-style'] . '/scss';
							if (JFolder::exists($niche))
							{
								$nicheFiles = glob($niche . '/*.scss');
								if (count($nicheFiles))
								{
									$files = array_merge($files, $nicheFiles);
								}
							}
						}
					}
				}
			}
		}

		if (count($files))
		{
			foreach ($files as $file)
			{
				if (JFile::exists($file))
				{
					if (!is_writable($file))
					{
						// Try to change ownership of the file.
						$user = get_current_user();

						chown($file, $user);

						if (!JPath::setPermissions($file, '0644'))
						{
							continue;
						}

						if (!JPath::isOwner($file))
						{
							continue;
						}
					}

					$content = file_get_contents($file);
					$content = preg_replace('#' . $old . '#', $new, $content);

					if (!JFile::write($file, $content))
					{
						continue;
					}
				}
			}
		}

		return true;
	}
}
