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
 * Handle Ajax requests from cookie consent pane.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwAjaxCookieLaw extends SunFwAjax
{

	/**
	 * Get cookie consent data from database.
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
		 * Get cookie consent data.
		 */
		$style = SunFwHelper::getSunFwStyle($this->styleID);

		/**
		 * Get custom input components.
		 */
		$inputs = array();
		$path = JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/cookie-law/inputs';
		$vd = 'v=' . SUNFW_VERSION . '&d=' . SUNFW_RELEASED_DATE;

		foreach (glob("{$path}/*.js") as $input)
		{
			$inputs[substr(basename($input), 0, -3)] = $root . str_replace(JPATH_ROOT, '', $input) . "?{$vd}";
		}

		/**
		 * Prepare response data.
		 */
		$data = array(
			'url' => $this->baseUrl,
			'data' => $style ? json_decode($style->cookie_law_data) : null,
			'inputs' => $inputs,
			'settings' => SunFwHelper::findTemplateAdminJsonSettings(
				JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/cookie-law', 'settings.json', true),
			'textMapping' => array(
				'cookie-law' => JText::_('SUNFW_COOKIE_LAW'),
				'save-cookie-law' => JText::_('SUNFW_SAVE_COOKIE_LAW'),
				'cookie-law-settings' => JText::_('SUNFW_COOKIE_LAW_SETTINGS'),
				'cookie-law-not-enabled' => JText::_('SUNFW_COOKIE_LAW_NOT_ENABLED'),
				'enable-cookie-consent' => JText::_('SUNFW_ENABLE_COOKIE_CONSENT'),
				'enable-cookie-consent-hint' => JText::_('SUNFW_COOKIE_LAW_ENABLE_COOKIE_CONSENT_HINT'),
				'style' => JText::_('SUNFW_STYLE'),
				'dark' => JText::_('SUNFW_DARK_STYLE'),
				'light' => JText::_('SUNFW_LIGHT_STYLE'),
				'cookie-law-style-hint' => JText::_('SUNFW_COOKIE_LAW_STYLE_HINT'),
				'banner-placement' => JText::_('SUNFW_BANNER_PLACEMENT'),
				'floating' => JText::_('SUNFW_FLOATING'),
				'floating-right' => JText::_('SUNFW_FLOATING_RIGHT'),
				'floating-left' => JText::_('SUNFW_FLOATING_LEFT'),
				'static' => JText::_('SUNFW_STATIC'),
				'cookie-law-banner-placement-hint' => JText::_('SUNFW_COOKIE_LAW_BANNER_PLACEMENT_HINT'),
				'message' => JText::_('SUNFW_MESSAGE'),
				'article' => JText::_('SUNFW_ARTICLE'),
				'cookie-law-message-hint' => JText::_('SUNFW_COOKIE_LAW_MESSAGE_HINT'),
				'cookie-law-default-message' => JText::_('SUNFW_COOKIE_LAW_DEFAULT_MESSAGE'),
				'cookie-law-article-message' => JText::_('SUNFW_COOKIE_LAW_ARTICLE_MESSAGE'),
				'cookie-law-select-article' => JText::_('SUNFW_COOKIE_LAW_SELECT_ARTICLE'),
				'read-more-button-text' => JText::_('SUNFW_READ_MORE_BUTTON_TEXT'),
				'cookie-policy-link' => JText::_('SUNFW_COOKIE_POLICY_LINK'),
				'accept-button-text' => JText::_('SUNFW_ACCEPT_BUTTON_TEXT'),
				'accept-script' => JText::_('SUNFW_ACCEPT_SCRIPT'),
				'set-script' => JText::_('SUNFW_SET_SCRIPT'),
				'cookie-law-read-more-button-text-hint' => JText::_('SUNFW_COOKIE_LAW_READ_MORE_BUTTON_TEXT_HINT'),
				'cookie-law-cookie-policy-link-hint' => JText::_('SUNFW_COOKIE_LAW_COOKIE_POLICY_LINK_HINT'),
				'cookie-law-accept-button-text-hint' => JText::_('SUNFW_COOKIE_LAW_ACCEPT_BUTTON_TEXT_HINT'),
				'cookie-law-accept-script-hint' => JText::_('SUNFW_ACCEPT_SCRIPT_HINT')
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
				->set($this->dbo->quoteName('cookie_law_data') . '=' . $this->dbo->quote($data))
				->where($this->dbo->quoteName('style_id') . '=' . intval($this->styleID))
				->where($this->dbo->quoteName('template') . '=' . $this->dbo->quote($this->templateName));
		}
		else
		{
			$columns = array(
				'style_id',
				'cookie_law_data',
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

		// Execute query to save cookie consent data.
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
			'message' => JText::_('SUNFW_COOKIE_LAW_SAVED_SUCCESSFULLY')
		));
	}
}
