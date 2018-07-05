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

// Render items in column.
$items_html = '';

if (@count($component['items']))
{
	foreach ($component['items'] as $itemIndex)
	{
		ob_start();
		
		SunFwSite::renderItem($layout['items'][$itemIndex]);
		
		$item_html = trim(ob_get_contents());
		
		ob_end_clean();
		
		if ($item_html != '')
		{
			$items_html .= '
				<div class="layout-item sunfw-item-' . $layout['items'][$itemIndex]['type'] . '">
					' . $item_html . '
				</div>
			';
		}
	}
}

echo $items_html;
