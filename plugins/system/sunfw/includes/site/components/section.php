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

// Render rows in section.
if (@count($component['rows']))
{
	$rows = array();
	foreach ($component['rows'] as $rowIndex)
	{
		$html = '';
		// Render row.
		ob_start();
		
		SunFwSite::renderRow($layout['rows'][$rowIndex]);
		
		$html = trim(ob_get_contents());
		
		ob_end_clean();
		
		// Check if row has content?
		if ($html != '')
		{
			$rows[$rowIndex] = $html;
		}
	}
	
	if (count($rows))
	{
		// Check if layout viewer is enabled?
		$layoutViewer = '';
		
		if (SunFwSite::getInstance()->layoutViewer)
		{
			$layoutViewer = ' ' . implode(' ', 
				array(
					'layout-element="section"',
					'layout-element-type="' . JText::_('SUNFW_SECTION') . '"',
					'layout-element-name="' . $component['settings']['name'] . '"'
				));
		}
		
		if (isset($component['settings']['enable_sticky']) && $component['settings']['enable_sticky'] == 1)
		{
			$classSticky = ' sunfw-sticky ';
		}
		else
		{
			$classSticky = '';
		}
		
		$section_items_html = '<div id="sunfw_' . $component['id'] . '" class="sunfw-section ' . $classSticky .
			 ( isset($component['settings']['class']) ? $component['settings']['class'] : '' ) . '"' . $layoutViewer . '>';
		$section_items_html .= '<div class="' . ( isset($component['settings']['full_width']) ? 'container-fluid' : 'container' ) . '">';
		foreach ($rows as $row)
		{
			$section_items_html .= $row;
		}
		$section_items_html .= '</div></div>';
		
		echo $section_items_html;
	}
}
?>
