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

// If hide on front-page, check if the current page is front-page.
if (array_key_exists('show_on_front_page', $component['settings']) && !intval($component['settings']['show_on_front_page']))
{
	$app = JFactory::getApplication();
	$menu = $app->getMenu();
	$lang = JFactory::getLanguage();
	
	if ($menu->getActive() == $menu->getDefault($lang->getTag()))
	{
		return;
	}
}
?>
<jdoc:include type="message" />
<jdoc:include type="component" />
