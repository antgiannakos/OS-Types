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
 * Handle Ajax requests from commenting pane.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwAjaxCommenting extends SunFwAjax
{

	/**
	 * Get commenting data from database.
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
		 * Get commenting data.
		 */
		$style = SunFwHelper::getSunFwStyle($this->styleID);

		/**
		 * Prepare response data.
		 */
		$data = array(
			'url' => $this->baseUrl,
			'data' => $style ? json_decode($style->commenting_data) : null,
			'settings' => SunFwHelper::findTemplateAdminJsonSettings(
				JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/commenting', 'settings.json', true),
			'textMapping' => array(
				'assignment' => JText::_('SUNFW_MENU_ASSIGNMENT'),
				'save-assignment' => JText::_('SUNFW_SAVE_ASSIGNMENT'),
				'commenting' => JText::_('SUNFW_COMMENTING'),
				'save-commenting' => JText::_('SUNFW_SAVE_COMMENTING'),
				'commenting-content-title' => JText::_('SUNFW_COMMENTING_PREVIEW_TITLE'),
				'commenting-not-enabled' => JText::_('SUNFW_COMMENTING_NOT_ENABLED_MESSAGE'),
				'commenting-settings' => JText::_('SUNFW_COMMENTING_SETTINGS'),
				'enable-commenting' => JText::_('SUNFW_ENABLE_COMMENTING'),
				'enable-commenting-hint' => JText::_('SUNFW_ENABLE_COMMENTING_HINT'),
				'commenting-type' => JText::_('SUNFW_COMMENTING_TYPE'),
				'commenting-type-hint' => JText::_('SUNFW_COMMENTING_TYPE_HINT'),
				'commenting-disqus-subdomain' => JText::_('SUNFW_COMMENTING_DISQUS_SUBDOMAIN'),
				'commenting-disqus-subdomain-hint' => JText::_('SUNFW_COMMENTING_DISQUS_SUBDOMAIN_HINT'),
				'commenting-facebook-app-id' => JText::_('SUNFW_COMMENTING_FACEBOOK_APP_ID'),
				'commenting-facebook-app-id-hint' => JText::_('SUNFW_COMMENTING_FACEBOOK_APP_ID_HINT'),
				'commenting-intensedebate-site-account' => JText::_('SUNFW_COMMENTING_INTENSEDEBATE_SITE_ACCOUNT'),
				'commenting-intensedebate-site-account-hint' => JText::_('SUNFW_COMMENTING_INTENSEDEBATE_SITE_ACCOUNT_HINT'),
				'commenting-google-comments-box-width' => JText::_('SUNFW_COMMENTING_GOOGLE_COMMENTS_BOX_WIDTH'),
				'commenting-google-comments-box-width-hint' => JText::_('SUNFW_COMMENTING_GOOGLE_COMMENTS_BOX_WIDTH_HINT'),
				'commenting-show-text' => JText::_('SUNFW_COMMENTING_SHOW_TEXT'),
				'commenting-show-text-hint' => JText::_('SUNFW_COMMENTING_SHOW_TEXT_HINT'),
				'commenting-show-counter' => JText::_('SUNFW_COMMENTING_SHOW_COUNTER'),
				'commenting-show-counter-hint' => JText::_('SUNFW_COMMENTING_SHOW_COUNTER_HINT'),
				'commenting-category' => JText::_('SUNFW_COMMENTING_CATEGORY'),
				'commenting-category-hint' => JText::_('SUNFW_COMMENTING_CATEGORY_HINT')
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
				->set($this->dbo->quoteName('commenting_data') . '=' . $this->dbo->quote($data))
				->where($this->dbo->quoteName('style_id') . '=' . intval($this->styleID))
				->where($this->dbo->quoteName('template') . '=' . $this->dbo->quote($this->templateName));
		}
		else
		{
			$columns = array(
				'style_id',
				'template',
				'commenting_data'
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

		// Execute query to save commenting data.
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
			'message' => JText::_('SUNFW_COMMENTING_SAVED_SUCCESSFULLY')
		));
	}
}
