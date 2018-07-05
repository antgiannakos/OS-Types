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

/**
 * General Utils class.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwValidatelicense
{

	public static function validate($templateName, $filePath, $mimetype = 'text/javascript')
	{
		$valid = false;
		
		if (!in_array('curl', get_loaded_extensions()))
		{
			//"CURL is not available on your web server";
			return false;
		}
		
		//require PHP version >= 5.5.0
		if (version_compare(PHP_VERSION, '5.5.0', '<'))
		{
			return false;
		}
		
		if (!class_exists('CURLFile'))
		{
			return false;
		}
		// Get parameters.
		$params = SunFwHelper::getExtensionParams('template', $templateName);
		$today = JFactory::getDate('now')->format('Y-m-d');
		$validatedDate = '';
		
		if (isset($params['validated_date']))
		{
			$validatedDate = $params['validated_date'];
		}
		
		if ($validatedDate == '')
		{
			$valid = true;
		}
		else
		{
			$validatedDate = date('Y-m-d', strtotime($validatedDate));
			//Current date and time + 1 week;
			$plus1WeekTime = date('Y-m-d', strtotime('+7 day', strtotime($validatedDate))); // Current date and time, + 1 week.
			
			if (strtotime($today) >= strtotime($plus1WeekTime))
			{
				$valid = true;
			}
		}
		
		$validatedFile = JPATH_ROOT . '/plugins/system/sunfw/' . (string) $filePath;
		
		if (!file_exists($validatedFile))
		{
			$valid = false;
		}
		
		if ($valid)
		{
			$fields = array();
			$fields['identified_name'] = (string) SunFwHelper::getTemplateIdentifiedName($templateName);
			$fields['domain'] = (string) JUri::getInstance()->toString(array(
				'host'
			));
			$fields['ip'] = (string) self::getServerAddress();
			$fields['token'] = (string) $params['token'];
			$fields['file_path'] = (string) $filePath;
			$fields['file_checksum'] = (string) md5_file($validatedFile);
			$fields['sunfw_version'] = (string) SUNFW_VERSION;
			
			// Create a CURLFile object
			$cfile = new CURLFile($validatedFile, $mimetype, basename($validatedFile));
			$fields['file_content'] = $cfile;
			
			//open connection
			$ch = curl_init();
			//set the url, number of POST vars, POST data
			curl_setopt($ch, CURLOPT_URL, SUNFW_VALIDATE_LICENSE_URL);
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)");
			curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
			curl_setopt($ch, CURLOPT_TIMEOUT, 60);
			//execute post
			$result = curl_exec($ch);
			
			//close connection
			curl_close($ch);
			
			if (!$result)
			{
				return false;
			}
			
			// Update the last validation
			SunFwHelper::updateExtensionParams(array(
				'validated_date' => $today
			), 'template', $templateName);
		}
		
		return true;
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
				$ifconfig = shell_exec('/sbin/ifconfig eth0');
				preg_match('/addr:([\d\.]+)/', $ifconfig, $match);
				return $match[1];
			}
		}
		
		return '';
	}
}
