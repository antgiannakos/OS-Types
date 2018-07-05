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
class SunFwUtils
{

	public static function jsonValidate($string)
	{
		// decode the JSON data
		$result = json_decode($string);
		$error = '';
		// switch and check possible JSON errors
		switch (json_last_error())
		{
			case JSON_ERROR_NONE:
				$error = ''; // JSON is valid // No error has occurred
			break;
			case JSON_ERROR_DEPTH:
				$error = 'The maximum stack depth has been exceeded.';
			break;
			case JSON_ERROR_STATE_MISMATCH:
				$error = 'Invalid or malformed JSON.';
			break;
			case JSON_ERROR_CTRL_CHAR:
				$error = 'Control character error, possibly incorrectly encoded.';
			break;
			case JSON_ERROR_SYNTAX:
				$error = 'Syntax error, malformed JSON.';
			break;
			// PHP >= 5.3.3
			case JSON_ERROR_UTF8:
				$error = 'Malformed UTF-8 characters, possibly incorrectly encoded.';
			break;
			default:
				$error = 'Unknown JSON error occured.';
			break;
		}
		
		if ($error !== '')
		{
			// throw the Exception or exit // or whatever :)
			return false;
		}
		
		// everything is OK
		return true;
	}

	/**
	 * Check if SH404Sef is installed or not.
	 *
	 * @return  boolean
	 */
	public static function checkSH404SEF()
	{
		$db = JFactory::getDbo();
		$query = $db->getQuery(true);
		$query->clear();
		$query->select('COUNT(*)');
		$query->from('#__extensions');
		$query->where('type = ' . $db->quote('component') . ' AND element = ' . $db->quote('com_sh404sef'));
		$db->setQuery($query);
		return (int) $db->loadResult();
	}

	/**
	 * Format JSON string
	 * @param string $json JSON string
	 */
	public static function indentJSONString($json)
	{
		$result = '';
		$pos = 0;
		$strLen = strlen($json);
		$indentStr = "\t";
		$newLine = "\n";
		
		for ($i = 0; $i < $strLen; $i++)
		{
			// Grab the next character in the string.
			$char = $json[$i];
			
			// Are we inside a quoted string?
			if ($char == '"')
			{
				// search for the end of the string (keeping in mind of the escape sequences)
				if (!preg_match('`"(\\\\\\\\|\\\\"|.)*?"`s', $json, $m, null, $i))
					return $json;
				
				// add extracted string to the result and move ahead
				$result .= $m[0];
				$i += strLen($m[0]) - 1;
				continue;
			}
			else if ($char == '}' || $char == ']')
			{
				$result .= $newLine;
				$pos--;
				$result .= str_repeat($indentStr, $pos);
			}
			
			// Add the character to the result string.
			$result .= $char;
			
			// If the last character was the beginning of an element,
			// output a new line and indent the next line.
			if ($char == ',' || $char == '{' || $char == '[')
			{
				$result .= $newLine;
				if ($char == '{' || $char == '[')
				{
					$pos++;
				}
				
				$result .= str_repeat($indentStr, $pos);
			}
		}
		
		return $result;
	}

	/**
	 * Check item menu is the last menu
	 *
	 */
	public static function isLastMenu($item)
	{
		if (isset($item->tree[0]) && isset($item->tree[1]))
		{
			$db = JFactory::getDbo();
			$q = $db->getQuery(true);
			
			$q->select('lft, rgt');
			$q->from('#__menu');
			$q->where('id = ' . (int) $item->tree[0], 'OR');
			$q->where('id = ' . (int) $item->tree[1]);
			
			$db->setQuery($q);
			
			$results = $db->loadObjectList();
			
			if ($results[1]->rgt == ( (int) $results[0]->rgt - 1 ) && $item->deeper)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}

	/**
	 * generate a randon string
	 * @return string
	 */
	public static function generateRandString()
	{
		$length = 4;
		$chars = 'abcdefghijklmnopqrstuvwxyz';
		$chars_length = ( strlen($chars) - 1 );
		$string = $chars{rand(0, $chars_length)};
		for ($i = 1; $i < $length; $i = strlen($string))
		{
			$r = $chars{rand(0, $chars_length)};
			if ($r != $string{$i - 1})
			{
				$string .= $r;
			}
		}
		
		$fullString = dechex(time() + mt_rand(0, 10000000)) . $string;
		$result = strtoupper(substr($fullString, 2, 10));
		return $result;
	}

	/**
	 * Check System Minimum Requirements
	 *
	 * @return multitype:Ambigous <string, string, mixed>
	 */
	public static function checkSystemRequirements()
	{
		$msg = array();
		$requirementFile = SUNFW_PATH . '/requirements.json';
		
		if (file_exists($requirementFile))
		{
			$content = file_get_contents($requirementFile);
			$content = json_decode($content, true);
			
			if (count($content) && isset($content['system']))
			{
				//check PHP
				if (isset($content['system']['php']))
				{
					if (version_compare(PHP_VERSION, $content['system']['php']['minimum_version']) < 0)
					{
						$msg[] = JText::sprintf('SUNFW_SYSTEM_REQUIRMENT_PHP', $content['system']['php']['minimum_version']);
					}
				}
			}
		}
		return $msg;
	}

	/**
	 * Check Browser Minimum Requirements
	 *
	 * @return multitype:Ambigous <string, string, mixed>
	 */
	public static function checkBrowserRequirements()
	{
		$jbrowser = JBrowser::getInstance();
		$version = $jbrowser->getVersion();
		$browser = $jbrowser->getBrowser();
		$agent = $jbrowser->getAgentString();
		
		if ($browser == 'mozilla')
		{
			// fix bug for JBrowser
			if (preg_match('|Firefox[/ ]([0-9.]+)|', $agent, $tmpVersion))
			{
				$browser = 'firefox';
				list($majorVersion, $minorVersion) = explode('.', $tmpVersion[1]);
				$version = $majorVersion . '.' . $minorVersion;
			}
		}
		elseif ($browser == 'chrome')
		{
			// Fix for joomla 3.5
			if (preg_match('|OPR[/ ]([0-9.]+)|', $agent, $tmpVersion))
			{
				$browser = 'opera';
				list($majorVersion, $minorVersion) = explode('.', $tmpVersion[1]);
				$version = $majorVersion . '.' . $minorVersion;
			}
			elseif (preg_match('|Edge[/ ]([0-9.]+)|', $agent, $tmpVersion))
			{
				$browser = 'edge';
				list($majorVersion, $minorVersion) = explode('.', $tmpVersion[1]);
				$version = $majorVersion . '.' . $minorVersion;
				
				return array();
			}
		}
		
		$msg = array();
		$requirementFile = SUNFW_PATH . '/requirements.json';
		
		if (file_exists($requirementFile))
		{
			$content = file_get_contents($requirementFile);
			$content = json_decode($content, true);
			if (count($content) && isset($content['browsers']))
			{
				if (isset($content['browsers'][$browser]))
				{
					$minimumVersion = $content['browsers'][$browser]['minimum_version'];
					if (version_compare($version, $minimumVersion) < 0)
					{
						$msg[] = JText::_('SUNFW_SYSTEM_REQUIRMENT_BROWSER');
					}
				}
			}
		}
		
		return $msg;
	}

	/**
	 * Method to check an uploaded file for potential security risks.
	 *
	 * @param   array  $file     An uploaded file descriptor as stored in $_FILES.
	 * @param   array  $options  Verification options.
	 *
	 * @return  boolean
	 */
	public static function check_upload($file, $options = array())
	{
		// Prepare options.
		$options = array_merge($options, 
			array(
				'null_byte' => true, // Check for null byte in file name.
				'forbidden_extensions' => array( // Check if file extension contains forbidden string (e.g. php matched .php, .xxx.php, .php.xxx and so on).
					'php',
					'phps',
					'php5',
					'php3',
					'php4',
					'inc',
					'pl',
					'cgi',
					'fcgi',
					'java',
					'jar',
					'py'
				),
				'php_tag_in_content' => true, // Check if file content contains <?php tag.
				'shorttag_in_content' => true, // Check if file content contains short open tag.
				'shorttag_extensions' => array( // File extensions that need to check if file content contains short open tag.
					'inc',
					'phps',
					'class',
					'php3',
					'php4',
					'php5',
					'txt',
					'dat',
					'tpl',
					'tmpl'
				),
				'fobidden_ext_in_content' => true, // Check if file content contains forbidden extensions.
				'fobidden_ext_extensions' => array( // File extensions that need to check if file content contains forbidden extensions.
					'zip',
					'rar',
					'tar',
					'gz',
					'tgz',
					'bz2',
					'tbz'
				)
			));
		
		// Check file name.
		$temp_name = is_array($file) ? $file['tmp_name'] : $file;
		$intended_name = is_array($file) ? $file['name'] : $file;
		
		// Check for null byte in file name.
		if ($options['null_byte'] && strstr($intended_name, "\x00"))
		{
			return false;
		}
		
		// Check if file extension contains forbidden string (e.g. php matched .php, .xxx.php, .php.xxx and so on).
		if (!empty($options['forbidden_extensions']))
		{
			$exts = explode('.', $intended_name);
			$exts = array_reverse($exts);
			
			array_pop($exts);
			
			$exts = array_map('strtolower', $exts);
			
			foreach ($options['forbidden_extensions'] as $ext)
			{
				if (in_array($ext, $exts))
				{
					return false;
				}
			}
		}
		
		// Check file content.
		if ($options['php_tag_in_content'] || $options['shorttag_in_content'] ||
			 ( $options['fobidden_ext_in_content'] && !empty($options['forbidden_extensions']) ))
		{
			$data = file_get_contents($temp_name);
			
			// Check if file content contains <?php tag.
			if ($options['php_tag_in_content'] && stristr($data, '<?php'))
			{
				return false;
			}
			
			// Check if file content contains short open tag.
			if ($options['shorttag_in_content'])
			{
				$suspicious_exts = $options['shorttag_extensions'];
				
				if (empty($suspicious_exts))
				{
					$suspicious_exts = array(
						'inc',
						'phps',
						'class',
						'php3',
						'php4',
						'txt',
						'dat',
						'tpl',
						'tmpl'
					);
				}
				
				// Check if file extension is in the list that need to check file content for short open tag.
				$found = false;
				
				foreach ($suspicious_exts as $ext)
				{
					if (in_array($ext, $exts))
					{
						$found = true;
						
						break;
					}
				}
			}
			
			// Check if file content contains forbidden extensions.
			if ($options['fobidden_ext_in_content'] && !empty($options['forbidden_extensions']))
			{
				$suspicious_exts = $options['fobidden_ext_extensions'];
				
				if (empty($suspicious_exts))
				{
					$suspicious_exts = array(
						'zip',
						'rar',
						'tar',
						'gz',
						'tgz',
						'bz2',
						'tbz'
					);
				}
				
				// Check if file extension is in the list that need to check file content for forbidden extensions.
				$found = false;
				
				foreach ($suspicious_exts as $ext)
				{
					if (in_array($ext, $exts))
					{
						$found = true;
						
						break;
					}
				}
				
				if ($found)
				{
					foreach ($options['forbidden_extensions'] as $ext)
					{
						if (strstr($data, '.' . $ext))
						{
							return false;
						}
					}
				}
			}
			
			// Make sure any string, that need to be check in file content, does not truncated due to read boundary.
			$data = substr($data, -10);
		}
		
		return true;
	}

	/**
	 * Method to check a file for potential XSS content.
	 *
	 * @param   string  $file  Absolute path to the file needs to be checked.
	 *
	 * @return  boolean
	 */
	public static function check_xss($file)
	{
		// Make sure the specified file does not contain unwanted tags.
		$xss_check = file_get_contents(is_array($file) ? $file['tmp_name'] : $file);
		$xss_check = substr($xss_check, -1, 256);
		
		$html_tags = array(
			'abbr',
			'acronym',
			'address',
			'applet',
			'area',
			'audioscope',
			'base',
			'basefont',
			'bdo',
			'bgsound',
			'big',
			'blackface',
			'blink',
			'blockquote',
			'body',
			'bq',
			'br',
			'button',
			'caption',
			'center',
			'cite',
			'code',
			'col',
			'colgroup',
			'comment',
			'custom',
			'dd',
			'del',
			'dfn',
			'dir',
			'div',
			'dl',
			'dt',
			'em',
			'embed',
			'fieldset',
			'fn',
			'font',
			'form',
			'frame',
			'frameset',
			'h1',
			'h2',
			'h3',
			'h4',
			'h5',
			'h6',
			'head',
			'hr',
			'html',
			'iframe',
			'ilayer',
			'img',
			'input',
			'ins',
			'isindex',
			'keygen',
			'kbd',
			'label',
			'layer',
			'legend',
			'li',
			'limittext',
			'link',
			'listing',
			'map',
			'marquee',
			'menu',
			'meta',
			'multicol',
			'nobr',
			'noembed',
			'noframes',
			'noscript',
			'nosmartquotes',
			'object',
			'ol',
			'optgroup',
			'option',
			'param',
			'plaintext',
			'pre',
			'rt',
			'ruby',
			's',
			'samp',
			'script',
			'select',
			'server',
			'shadow',
			'sidebar',
			'small',
			'spacer',
			'span',
			'strike',
			'strong',
			'style',
			'sub',
			'sup',
			'table',
			'tbody',
			'td',
			'textarea',
			'tfoot',
			'th',
			'thead',
			'title',
			'tr',
			'tt',
			'ul',
			'var',
			'wbr',
			'xml',
			'xmp',
			'!DOCTYPE',
			'!--'
		);
		
		foreach ($html_tags as $tag)
		{
			// A tag is '<tagname ', so we need to add < and a space or '<tagname>'.
			if (stristr($xss_check, '<' . $tag . ' ') || stristr($xss_check, '<' . $tag . '>'))
			{
				return false;
			}
		}
		
		return true;
	}
}
