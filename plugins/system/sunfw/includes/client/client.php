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

// No direct access to this file.
defined('_JEXEC') or die('Restricted access');

// Prevent this file from being included twice
if (class_exists('SunFwClientInformation'))
{
	return;
}

/**
 * Class containing compatibility relation between framework and extension.
 *
 * @package  SUN Framework
 * @since    1.1.0
 */
class SunFwClientInformation
{

	/**
	 * Method to post client information
	 *
	 * @return void
	 *
	 */
	public static function postClientInformation($token)
	{
		$app = JFactory::getApplication();
		if (!$app->isClient('administrator'))
		{
			return false;
		}
		
		$user = JFactory::getUser();
		if (!$user->authorise('core.admin'))
		{
			return false;
		}
		
		$framework = JTable::getInstance('Extension');
		$framework->load(array(
			'element' => 'sunfw',
			'type' => 'plugin',
			'folder' => 'system'
		));
		
		// Check if JoomlaShine extension framework is disabled?
		if (!$framework->extension_id or !$framework->enabled)
		{
			return false;
		}
		
		// array informations will be post
		$dataInformations = array();
		
		// system information
		$dataInformations['systemInfo'] = self::getSystemInfo();
		
		// php information
		$dataInformations['phpInfo'] = self::getPhpSettings();
		
		// user information
		$dataInformations['userInfo'] = self::getUserInfo();
		
		// list ext jsn installed
		$dataInformations['installedTplList'] = self::getInstalledTemplateList();
		
		$secret_key = md5($dataInformations['userInfo']['domain'] . $dataInformations['userInfo']['server_ip']);
		
		// Prepare data to send data to JSN server.
		$parts = parse_url(SUNFW_POST_CLIENT_INFORMATION_URL);
		$secure = ( $parts['scheme'] == 'https' ) ? true : false;
		$post = implode('&', 
			array(
				'client_information=' . urlencode(json_encode($dataInformations)),
				"secret_key={$secret_key}",
				"token={$token}"
			));
		
		$fp = fsockopen(( $secure ? 'ssl://' : '' ) . $parts['host'], isset($parts['port']) ? $parts['port'] : ( $secure ? 443 : 80 ), $errno, 
			$errstr, 5);
		
		if ($fp)
		{
			// Create request.
			$request = "POST {$parts['path']}" . ( empty($parts['query']) ? '' : "?{$parts['query']}" ) . " HTTP/1.0\r\n";
			$request .= "Host: {$parts['host']}\r\n";
			$request .= "Connection: Close\r\n";
			$request .= "Content-Type: application/x-www-form-urlencoded\r\n";
			$request .= 'Content-Length: ' . strlen($post) . "\r\n\r\n";
			$request .= $post;
			
			// Send request.
			fwrite($fp, $request);
			
			// If debug is needed, uncomment the following 8 lines to dump response from server.
			/*$response = '';
			 
			 while ( ! feof($fp) )
			 {
			 $response .= fgets($fp, 1024);
			 }
			 
			 var_dump($response);*/
			
			// Close socket connection.
			fclose($fp);
		}
	}

	/**
	 * Method to get the php settings
	 *
	 * @return array some php settings
	 *
	 */
	public static function getPhpSettings()
	{
		$phpSettings = array();
		
		$phpSettings['php_built_on'] = php_uname();
		$phpSettings['php_version'] = phpversion();
		
		return $phpSettings;
	}

	/**
	 * Method to get the system information
	 *
	 * @return  array system information values
	 *
	 */
	public static function getSystemInfo()
	{
		$version = new JVersion();
		$platform = new JPlatform();
		$db = JFactory::getDbo();
		
		$sysInfo = array();
		$sysInfo['database_version'] = $db->getVersion();
		$sysInfo['database_collation'] = $db->getCollation();
		$sysInfo['web_server'] = isset($_SERVER['SERVER_SOFTWARE']) ? $_SERVER['SERVER_SOFTWARE'] : getenv('SERVER_SOFTWARE');
		$sysInfo['server_api'] = php_sapi_name();
		$sysInfo['joomla_version'] = $version->getLongVersion();
		$sysInfo['joomla_platform_version'] = $platform->getLongVersion();
		
		return $sysInfo;
	}

	/**
	 * Method to get the user information
	 *
	 * @return  array user information values
	 *
	 */
	public static function getUserInfo()
	{
		$app = JFactory::getApplication();
		$user = JFactory::getUser();
		$customerUsername = $app->getUserState('sunfw.installer.customer.username', '');
		$userInfo = array();
		
		$userInfo['domain'] = JURI::root();
		$userInfo['server_ip'] = self::getServerAddress();
		if ($customerUsername != '')
		{
			$userInfo['client_customer_username'] = $customerUsername;
		}
		
		return $userInfo;
	}

	/**
	 * Method to get list extension install
	 *
	 * @return  array list extension install
	 *
	 */
	public static function getInstalledTemplateList()
	{
		// list ext jsn installed
		$installedTemplateList = array();
		
		$db = JFactory::getDbo();
		$q = $db->getQuery(true);
		
		// Build query
		$q->select('*');
		$q->from($db->quoteName('#__extensions'));
		$q->where($db->quoteName('client_id') . " = 0");
		$q->where($db->quoteName('type') . " = 'template'");
		$q->where($db->quoteName('element') . " like '%jsn_%'");
		
		// Execute query
		$db->setQuery($q);
		try
		{
			$templates = $db->loadObjectList();
		}
		catch (Exception $e)
		{
			return $installedTemplateList;
		}
		
		if (count($templates))
		{
			foreach ($templates as $template)
			{
				$packagePath = JPATH_ROOT . '/templates/' . $template->element;
				
				// Check if template is copied to another name
				if ($xml = simplexml_load_file($packagePath . '/templateDetails.xml'))
				{
					$installedTemplateList[$template->element]['version'] = (string) $xml->version;
					$installedTemplateList[$template->element]['edition'] = (string) $xml->edition;
					$installedTemplateList[$template->element]['identifiedName'] = (string) $xml->identifiedName;
					$installedTemplateList[$template->element]['name'] = strtoupper(str_replace('_', ' ', $template->element));
				}
			}
		}
		
		return $installedTemplateList;
	}

	/**
	 * Method to get server address
	 *
	 * @return  string
	 *
	 */
	public static function getServerAddress()
	{
		if (array_key_exists('SERVER_ADDR', $_SERVER))
		{
			if ($_SERVER['SERVER_ADDR'] == '::1')
			{
				if (array_key_exists('SERVER_NAME', $_SERVER))
				{
					return gethostbyname($_SERVER['SERVER_NAME']);
				}
				else
				{
					// Running CLI
					if (stristr(PHP_OS, 'WIN'))
					{
						return gethostbyname(php_uname("n"));
					}
					else
					{
						$ifconfig = shell_exec('/sbin/ifconfig eth0');
						preg_match('/addr:([\d\.]+)/', $ifconfig, $match);
						return $match[1];
					}
				}
			}
			return $_SERVER['SERVER_ADDR'];
		}
		elseif (array_key_exists('LOCAL_ADDR', $_SERVER))
		{
			return $_SERVER['LOCAL_ADDR'];
		}
		elseif (array_key_exists('SERVER_NAME', $_SERVER))
		{
			return gethostbyname($_SERVER['SERVER_NAME']);
		}
		else
		{
			// Running CLI
			if (stristr(PHP_OS, 'WIN'))
			{
				return gethostbyname(php_uname("n"));
			}
			else
			{
				return '';
			}
		}

		return '';
	}
}
