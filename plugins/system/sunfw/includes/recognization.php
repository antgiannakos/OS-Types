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

// Import necessary Joomla libraries
jimport('joomla.filesystem.folder');
jimport('joomla.filesystem.file');

/**
 * Class to recognize whether a template is made by JoomlaShine or not.
 *
 * @package  SUN Framework
 * @subpackage  Recognization
 * @since       2.0.8
 */
class SunFwRecognization
{

	/**
	 * Template information.
	 *
	 * @var  array
	 */
	protected static $templateDetails = array();

	/**
	 * Detect if a template is made by JoomlaShine or not.
	 *
	 * @param   string  $template  Template folder name. If leave empty then active template will be detected.
	 *
	 * @return  mixed  An object containing template name, edition and version if JoomlaShine template detected or boolean FALSE otherwise.
	 */
	public static function detect($template = null)
	{
		if (empty($template))
		{
			$template = JFactory::getApplication()->getTemplate();
		}
		
		if (!isset(self::$templateDetails[$template]))
		{
			// Parse templateDetails.xml file for necessary information
			if ($xml = @simplexml_load_file(JPATH_SITE . "/templates/{$template}/templateDetails.xml"))
			{
				if (isset($xml->group) and (string) $xml->group == 'sunfw' and isset($xml->identifiedName))
				{
					$name = str_replace('tpl_', '', (string) $xml->identifiedName);
					
					self::store($template, $name, isset($xml->edition) ? (string) $xml->edition : 'free', (string) $xml->version, 
						(string) $xml->identifiedName);
				}
			}
		}
		
		return isset(self::$templateDetails[$template]) ? self::$templateDetails[$template] : false;
	}

	/**
	 * Store template information.
	 *
	 * @param   string  $template        Template folder name.
	 * @param   string  $name            Template name.
	 * @param   string  $edition         Template edition.
	 * @param   string  $version         Template version.
	 * @param   string  $identifiedName  Identified name at JoomlaShine.
	 *
	 * @return  void
	 */
	protected static function store($template, $name, $edition, $version, $identifiedName)
	{
		$title = 'JSN ' . ucwords(preg_replace('/[^a-zA-Z0-9\s]+/', ' ', $name));
		$edition = strtoupper(trim($edition, '_'));
		
		// Store template information.
		self::$templateDetails[$template] = (object) array(
			'id' => $identifiedName,
			'name' => $name,
			'title' => $title,
			'edition' => $edition,
			'version' => $version,
			'template' => $template
		);
	}
}
