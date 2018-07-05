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
 * Handle Ajax requests from user account pane.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwAjaxUserAccount extends SunFwAjax
{

	/**
	 * Get token key data.
	 *
	 * @param   boolean  $return  Whether to return data or send response back immediately?
	 *
	 * @return  mixed
	 */
	public function getAction($return = false)
	{
		// Query for existing user account.
		$this->dbo->setQuery(
			$this->dbo->getQuery(true)
				->select('element, params')
				->from('#__extensions')
				->where('type = "template"')
				->where('element LIKE "jsn_%"')
				->where('params LIKE "%username%"'));

		foreach ($this->dbo->loadObjectList() as $tpl)
		{
			if (( $params = json_decode($tpl->params) ) && !empty($params->username) && !empty($params->token))
			{
				$accounts[$params->username] = array(
					'label' => $params->username,
					'value' => $tpl->element
				);
			}
		}

		$accounts = isset($accounts) ? array_values($accounts) : array();

		// Get registered username.
		$params = SunFwHelper::getExtensionParams('template', $this->template['name']);

		/**
		 * Prepare response data.
		 */
		$data = array(
			'url' => $this->baseUrl,
			'accounts' => $accounts,
			'username' => empty($params['username']) ? '' : $params['username'],
			'textMapping' => array(
				'zrgW0DZN' => JText::_('SUNFW_YOU_ARE_REGISTERED_WITH_THE_FOLLOWING_ACCOUNT'),
				'pJhc7EKg' => JText::_('SUNFW_DOMAIN_IS_REGISTERED_AT_THE_FOLLOWING_LICENSE'),
				'TtfJrWpq' => JText::_('SUNFW_USER_DETAILS'),
				'yA1cSF2H' => JText::_('SUNFW_USERNAME'),
				'QvbkW3Vj' => JText::_('SUNFW_PASSWORD'),
				'qytsw2XQ' => JText::_('SUNFW_FORGOT_IT'),
				'Umvd0S3G' => JText::_('SUNFW_TOKEN_KEY'),
				'rhaHCKbF' => JText::_('SUNFW_PRODUCT_LICENSE'),
				'wvCGde5N' => JText::_('SUNFW_EDITION'),
				'gd2jjF1Y' => JText::_('SUNFW_EXPIRATION_DATE'),
				'RQNKkUt1' => JText::_('SUNFW_RELATED_TO'),
				'qnQa9DGM' => JText::_('SUNFW_NEVER'),
				'd5s3e9Dy' => JText::_('SUNFW_REFRESH_LICENSE'),
				'VXH67e2r' => JText::_('SUNFW_UNLINK_ACCOUNT')
			)
		);

		if ($return)
		{
			return $data;
		}

		$this->setResponse($data);
	}

	/**
	 * Copy token key from existing template.
	 */
	public function copyTokenFromAction()
	{
		// Get the template to copy token key from.
		$tpl = isset($_REQUEST['tpl']) ? $_REQUEST['tpl'] : false;

		if (!$tpl)
		{
			throw new Exception('Invalid Request');
		}

		// Get the parameters of the targeted template.
		$params = SunFwHelper::getExtensionParams('template', $tpl);

		// Store token key.
		SunFwHelper::updateExtensionParams(array(
			'username' => $params['username'],
			'token' => $params['token']
		), 'template', $this->template['name']);

		// Clear cached license data.
		$this->clearLicenseAction();

		// Send client information to JSN server.
		require_once JPATH_ROOT . '/plugins/system/sunfw/includes/client/client.php';

		try
		{
			SunFwClientInformation::postClientInformation($params['token']);
		}
		catch (Exception $e)
		{
			// Do nothing.
		}

		$this->setResponse(array(
			'message' => JText::_('SUNFW_TOKEN_IS_VALID'),
			'token' => $params['token']
		));
	}

	/**
	 * Get token key.
	 */
	public function getTokenKeyAction()
	{
		// Get customer information.
		$method = $this->input->getMethod();
		$username = $this->input->getUsername('username', '');
		$password = $this->input->$method->get('password', '', 'RAW');

		if ($username == '' || $password == '')
		{
			throw new Exception(JText::_('SUNFW_LIGHTCART_ERROR_TOKEN_ERR01'));
		}

		// Prepare data.
		$randCode = SunFwUtils::generateRandString();
		$domain = JURI::root();

		preg_match('@^(?:http://www\.|http://|www\.|http:|https://www\.|https://|www\.|https:)?([^/]+)@i', $domain, $domainFilter);

		$domain = $domainFilter[1];
		$secretKey = md5($randCode . $domain);
		$query = array();

		$query['rand_code'] = $randCode;
		$query['domain'] = $domain;
		$query['secret_key'] = $secretKey;
		$query['username'] = $username;
		$query['password'] = $password;

		// Get token key.
		try
		{
			$http = new JHttp();
			$data = $http->post(SUNFW_GET_TOKEN_URL, http_build_query($query, null, '&'));

			// JSON-decode the result.
			$result = json_decode($data->body);

			if (is_null($result))
			{
				throw new Exception(JText::_('SUNFW_ERROR_FAILED_TO_CONNECT_OUR_SERVER'));
			}

			if ((string) $result->result == 'error')
			{
				throw new Exception(JText::_('SUNFW_LIGHTCART_ERROR_' . $result->message));
			}

			// Store token key.
			SunFwHelper::updateExtensionParams(array(
				'username' => $username,
				'token' => $result->token
			), 'template', $this->template['name']);

			// Clear cached license data.
			$this->clearLicenseAction();

			// Send client information to JSN server.
			require_once JPATH_ROOT . '/plugins/system/sunfw/includes/client/client.php';

			try
			{
				SunFwClientInformation::postClientInformation($result->token);
			}
			catch (Exception $e)
			{
				// Do nothing.
			}

			$this->setResponse(array(
				'message' => JText::_('SUNFW_TOKEN_IS_VALID'),
				'token' => $result->token
			));
		}
		catch (Exception $e)
		{
			throw $e;
		}
	}

	/**
	 * Refresh license data.
	 *
	 * @return  void
	 */
	public function clearLicenseAction()
	{
		// Clear cached license data.
		$cache = JFactory::getConfig()->get('tmp_path') . "/{$this->template['id']}/license.data";

		if (is_file($cache))
		{
			unlink($cache);
		}
	}

	/**
	 * Unlink user account.
	 *
	 * @return  void
	 */
	public function unlinkAccountAction()
	{
		// Clear username and token data.
		SunFwHelper::updateExtensionParams(array(
			'username' => null,
			'token' => null
		), 'template', $this->template['name']);

		// Clear license data.
		$this->clearLicenseAction();
	}
}
