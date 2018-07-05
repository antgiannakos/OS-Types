<?php
/**
 * @version    $Id$
 * @package    SUN Framework
 * @author     JoomlaShine Team <support@joomlashine.com>
 * @copyright  Copyright (C) 2016 JoomlaShine.com. All Rights Reserved.
 * @license    GNU/GPL v2 or later http://www.gnu.org/licenses/gpl-2.0.html
 *
 * Websites: http://www.joomlashine.com
 * Technical Support:  Feedback - http://www.joomlashine.com/contact-us/get-support.html
 */

/**
 * Autoload class file of SunFw Framework.
 *
 * @param   string  $className  Name of class needs to be loaded.
 *
 * @return  boolean
 */
function sunFwLoader ($className)
{
	if (strpos($className, 'SunFw') === 0)
	{
		$path  = strtolower(preg_replace('/([A-Z])/', '/\\1', substr($className, 5)));
		$fullPath = JSN_PATH_SUNFW_FRAMEWORK_LIBRARIES_INSTALLER . '/' . $path . '.php';

		if (is_file($fullPath))
		{
			include_once $fullPath;
			return true;
		}

		return false;
	}
}

// Register sunFwLoader for autoloading
spl_autoload_register('sunFwLoader');
