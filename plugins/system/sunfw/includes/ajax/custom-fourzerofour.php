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
 * Handle Ajax requests from custom 404 pane.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwAjaxCustomFourzerofour extends SunFwAjax
{

	/**
	 * Get custom 404 data from database.
	 *
	 * @param   boolean  $return  Whether to return data or send response back immediately?
	 *
	 * @return  mixed
	 */
	public function getAction($return = false)
	{
		// Get root URL.
		$root = JUri::root(true);

		/**
		 * Get custom 404 data.
		 */
		$style = SunFwHelper::getSunFwStyle($this->styleID);

		/**
		 * Prepare response data.
		 */
		$data = array(
			'url' => $this->baseUrl,
			'data' => $style ? json_decode($style->custom_404_data) : null,
			'settings' => SunFwHelper::findTemplateAdminJsonSettings(
				JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/custom-404', 'settings.json', true),
			'textMapping' => array(
				'custom-404' => JText::_('SUNFW_CUSTOM_404'),
				'save-custom-404' => JText::_('SUNFW_SAVE_CUSTOM_404'),
				'custom-404-settings' => JText::_('SUNFW_CUSTOM_404_SETTINGS'),
				'custom-404-not-enabled' => JText::_('SUNFW_CUSTOM_404_NOT_ENABLED_MESSAGE'),
				'enable-custom-404' => JText::_('SUNFW_ENABLE_CUSTOM_404'),
				'enable-custom-404-hint' => JText::_('SUNFW_ENABLE_CUSTOM_404_HINT'),
				'custom-404-type' => JText::_('SUNFW_CUSTOM_404_TYPE'),
				'custom-404-type-hint' => JText::_('SUNFW_CUSTOM_404_TYPE_HINT'),
				'custom-404-type-menu-item' => JText::_('SUNFW_CUSTOM_404_TYPE_MENU_ITEM'),
				'custom-404-type-article' => JText::_('SUNFW_CUSTOM_404_TYPE_ARTICLE'),
				'custom-404-menu-item' => JText::_('SUNFW_CUSTOM_404_SELECT_MENU_ITEM'),
				'custom-404-menu-item-hint' => JText::_('SUNFW_CUSTOM_404_SELECT_MENU_ITEM_HINT'),
				'custom-404-article' => JText::_('SUNFW_CUSTOM_404_SELECT_ARTICLE'),
				'custom-404-article-hint' => JText::_('SUNFW_CUSTOM_404_SELECT_ARTICLE_HINT'),
				'menu-item' => JText::_('SUNFW_MENU_ITEM'),
				'article' => JText::_('SUNFW_ARTICLE'),
				'preview' => JText::_('SUNFW_CUSTOM_404_PREVIEW_LABEL')
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

		// Build query to save style data.
		$style = SunFwHelper::getSunFwStyle($this->styleID);
		$query = $this->dbo->getQuery(true);

		if ($style)
		{
			$query->update($this->dbo->quoteName('#__sunfw_styles'))
				->set($this->dbo->quoteName('custom_404_data') . '=' . $this->dbo->quote($data))
				->where($this->dbo->quoteName('style_id') . '=' . intval($this->styleID))
				->where($this->dbo->quoteName('template') . '=' . $this->dbo->quote($this->templateName));
		}
		else
		{
			$columns = array(
				'style_id',
				'custom_404_data',
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

		// Execute query to save Custom 404 data.
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
			'message' => JText::_('SUNFW_CUSTOM_404_SAVED_SUCCESSFULLY')
		));
	}
}
