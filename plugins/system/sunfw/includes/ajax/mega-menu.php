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
 * Handle Ajax requests from mega menu pane.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwAjaxMegaMenu extends SunFwAjax
{

	/**
	 * Get mega menu data from database.
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
		 * Get mega menu's items.
		 */
		$items = array(
			'image' => '',
			'sub-menu' => '',
			'module-position' => '',
			'joomla-module' => '',
			'custom-html' => ''
		);

		// Get path to mega menu item's setting files.
		$_items = SunFwHelper::findTemplateAdminJsonSettings(
			JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/mega-menu/settings/items');

		foreach ($_items as $k => $v)
		{
			$items[$k] = $v;
		}

		// Allow 3rd-party to add their own items into styles editor.
		$items = array_merge($items, JEventDispatcher::getInstance()->trigger('SunFwGetMegaMenuItems'));

		/**
		 * Get all Joomla menus.
		 */
		$menus = array();

		foreach (SunFwHelper::getAllAvailableMenus(true) as $menu)
		{
			$menus[$menu->value] = $menu;
		}

		// Allow 3rd-party to add their own menu-a-like items into mega menu.
		$menus = array_merge($menus, JEventDispatcher::getInstance()->trigger('SunFwGetMegaMenuMenus'));

		/**
		 * Get custom input components.
		 */
		$inputs = array();
		$path = JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/mega-menu/inputs';
		$vd = 'v=' . SUNFW_VERSION . '&d=' . SUNFW_RELEASED_DATE;

		foreach (glob("{$path}/*.js") as $input)
		{
			$inputs[substr(basename($input), 0, -3)] = $root . str_replace(JPATH_ROOT, '', $input) . "?{$vd}";
		}

		// Allow 3rd-party to add their own custom inputs into mega menu.
		$inputs = array_merge($inputs, JEventDispatcher::getInstance()->trigger('SunFwGetMegaMenuInputs'));

		/**
		 * Synchronize color values for editing.
		 */
		if ($style = SunFwHelper::getSunFwStyle($this->styleID))
		{
			$style = SunFwHelper::synchronizeColorValues($this->styleID, $style->mega_menu_data, $this->templateName, true);
		}

		/**
		 * Prepare response data.
		 */
		$data = array(
			'url' => $this->baseUrl,
			'data' => (object) $style,
			'grid' => 12,
			'items' => $items,
			'menus' => $menus,
			'inputs' => $inputs,
			'settings' => SunFwHelper::findTemplateAdminJsonSettings(
				JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/mega-menu/settings', 'root.json', true),
			'textMapping' => array(
				'mega-menu' => JText::_('SUNFW_MEGAMENU'),
				'save-mega-menu' => JText::_('SUNFW_SAVE_MEGAMENU'),
				'megamenu-is-not-activated' => JText::_('SUNFW_MENU_BUILDER_MEGAMENU_IS_NOT_ACTIVATED'),
				'empty-menu-message' => JText::_('SUNFW_MENU_BUILDER_EMPTY_MESSAGE'),
				'language-*' => JText::_('SUNFW_LANGUAGE_ALL'),
				'fixed-width' => JText::_('SUNFW_FIXED_WIDTH'),
				'submenu-width' => JText::_('SUNFW_SUBMENU_LAYOUT_WIDTH'),
				'submenu-align' => JText::_('SUNFW_SUBMENU_ALIGN'),
				'submenu-icon' => JText::_('SUNFW_SUBMENU_ICON'),
				'submenu-desc' => JText::_('SUNFW_SUBMENU_DESC'),
				'megamenu-fixed-width-hint' => JText::_('SUNFW_MEGAMENU_FIXED_WIDTH_HINT'),
				'megamenu-submenu-width-hint' => JText::_('SUNFW_MEGAMENU_SUBMENU_WIDTH_HINT'),
				'megamenu-submenu-align-hint' => JText::_('SUNFW_MEGAMENU_SUBMENU_ALIGN_HINT'),
				'megamenu-padding-hint' => JText::_('SUNFW_MEGAMENU_PADDING_HINT'),
				'megamenu-background-color-hint' => JText::_('SUNFW_MEGAMENU_BACKGROUND_COLOR_HINT'),
				'megamenu-background-image-hint' => JText::_('SUNFW_MEGAMENU_BACKGROUND_IMAGE_HINT'),
				'megamenu-background-image-settings-hint' => JText::_('SUNFW_MEGAMENU_BACKGROUND_IMAGE_SETTINGS_HINT'),
				'megamenu-border-hint' => JText::_('SUNFW_MEGAMENU_BORDER_HINT'),
				'megamenu-image-name-hint' => JText::_('SUNFW_MEGAMENU_IMAGE_NAME_HINT'),
				'megamenu-image-image-hint' => JText::_('SUNFW_MEGAMENU_IMAGE_IMAGE_HINT'),
				'megamenu-image-alt-text-hint' => JText::_('SUNFW_MEGAMENU_IMAGE_ALT_TEXT_HINT'),
				'megamenu-image-custom-classes-hint' => JText::_('SUNFW_MEGAMENU_IMAGE_CUSTOM_CLASSES_HINT'),
				'megamenu-submenu-name-hint' => JText::_('SUNFW_MEGAMENU_SUBMENU_NAME_HINT'),
				'megamenu-module-position-name-hint' => JText::_('SUNFW_MEGAMENU_MODULE_POSITION_NAME_HINT'),
				'megamenu-module-position-position-hint' => JText::_('SUNFW_MEGAMENU_MODULE_POSITION_POSITION_HINT'),
				'megamenu-module-position-custom-classes-hint' => JText::_('SUNFW_MEGAMENU_MODULE_POSITION_CUSTOM_CLASSES_HINT'),
				'megamenu-module-name-hint' => JText::_('SUNFW_MEGAMENU_MODULE_NAME_HINT'),
				'megamenu-module-module-hint' => JText::_('SUNFW_MEGAMENU_MODULE_MODULE_HINT'),
				'megamenu-module-custom-classes-hint' => JText::_('SUNFW_MEGAMENU_MODULE_CUSTOM_CLASSES_HINT'),
				'megamenu-custom-html-name-hint' => JText::_('SUNFW_MEGAMENU_CUSTOM_HTML_NAME_HINT'),
				'megamenu-custom-html-content-hint' => JText::_('SUNFW_MEGAMENU_CUSTOM_HTML_CONTENT_HINT'),
				'megamenu-custom-html-custom-classes-hint' => JText::_('SUNFW_MEGAMENU_CUSTOM_HTML_CUSTOM_CLASSES_HINT'),
				'item-navigation' => JText::_('SUNFW_CONTAINER_SETTINGS'),
				'container-settings' => JText::_('SUNFW_CONTAINER_SETTINGS'),
				'block-settings' => JText::_('SUNFW_BLOCK_SETTINGS'),
				'menu-builder' => JText::_('SUNFW_MENU_BUILDER'),
				'save-menu' => JText::_('SUNFW_SAVE_MENU')
			)
		);

		if ($return)
		{
			return $data;
		}

		$this->setResponse($data);
	}

	/**
	 * Save mega menu data to database.
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

		// Build query to save mega menu data.
		$data = json_encode($data);
		$style = SunFwHelper::getSunFwStyle($this->styleID);
		$query = $this->dbo->getQuery(true);

		if ($style)
		{
			$query->update($this->dbo->quoteName('#__sunfw_styles'))
				->set($this->dbo->quoteName('mega_menu_data') . '=' . $this->dbo->quote($data))
				->where($this->dbo->quoteName('style_id') . '=' . intval($this->styleID))
				->where($this->dbo->quoteName('template') . '=' . $this->dbo->quote($this->templateName));
		}
		else
		{
			$columns = array(
				'style_id',
				'template',
				'mega_menu_data'
			);
			$values = array(
				intval($this->styleID),
				$this->dbo->quote($this->templateName),
				$this->dbo->quote($data)
			);

			$query->insert($this->dbo->quoteName('#__sunfw_styles'))
				->columns($this->dbo->quoteName($columns))
				->values(implode(',', $values));
		}

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

		$this->setResponse(array(
			'message' => JText::_('SUNFW_MEGA_MENU_SAVED_SUCCESSFULLY')
		));
	}
}
