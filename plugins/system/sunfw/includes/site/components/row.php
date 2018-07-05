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

// Render columns in row.
if (@count($component['columns']))
{
	$columns = array();
	
	foreach ($component['columns'] as $i => $columnIndex)
	{
		$column = $layout['columns'][$columnIndex];
		
		// Prepare column width.
		$column['width']['lg'] = isset($column['width']['lg']) ? $column['width']['lg'] : 12;
		$column['width']['md'] = isset($column['width']['md']) ? $column['width']['md'] : $column['width']['lg'];
		$column['width']['sm'] = isset($column['width']['sm']) ? $column['width']['sm'] : $column['width']['md'];
		$column['width']['xs'] = isset($column['width']['xs']) ? $column['width']['xs'] : 12;
		
		$layout['columns'][$columnIndex]['width'] = $column['width'];
		
		// Render column.
		ob_start();
		
		SunFwSite::renderColumn($column);
		
		$column['html'] = trim(ob_get_contents());
		
		ob_end_clean();
		
		// Check if column has content?
		if ($column['html'] != '')
		{
			$columns[$i] = $column;
		}
	}
	
	// If all columns invisible, simply return.
	if (!count($columns))
	{
		return;
	}
	
	// Check if there is any column contains main body.
	$hasMainBody = -1;
	
	foreach ($columns as $i => $column)
	{
		foreach ($column['items'] as $itemIndex)
		{
			if ($layout['items'][$itemIndex]['type'] == 'page-content')
			{
				$hasMainBody = $i;
				
				break 2;
			}
		}
	}
	
	// Render row.
	$class = isset($component['settings']['class']) ? $component['settings']['class'] : '';
	
	if ($hasMainBody > -1)
	{
		$class .= ' sunfw-flex-component';
	}
	?>
<div id="<?php echo $component['id']; ?>"
	class="row <?php echo $class; ?>">
		<?php
	// Prepare column width.
	$allColumnsVisible = count($columns) == count($component['columns']) ? true : false;
	
	if (!$allColumnsVisible)
	{
		// Check if all columns have equal width.
		$screens = array(
			'lg' => true,
			'md' => true,
			'sm' => true,
			'xs' => true
		);
		
		$numColumns = count($component['columns']);
		$equalWidth = floor(12 / $numColumns);
		$remainSpan = 12 % $numColumns;
		
		foreach ($component['columns'] as $i => $columnIndex)
		{
			$column = $layout['columns'][$columnIndex];
			
			// Generate column width if equalized.
			$width = $equalWidth;
			
			if ($remainSpan && $i >= ( $numColumns - $remainSpan ))
			{
				// Remaining span will be splitted equally for columns in the right side.
				// E.g. if the row has 5 column then 2 remaining span will be splitted equally
				// for the last 2 columns, so the columns ratio will be: 2 - 2 - 2 - 3 - 3.
				$width += 1;
			}
			
			// Compare column width if equalized with defined column width.
			foreach ($screens as $screen => $equalized)
			{
				if ($equalized)
				{
					if ($column['width'][$screen] < 12 && $width != $column['width'][$screen])
					{
						$screens[$screen] = false;
					}
				}
			}
		}
		
		// If there is a column contains main body, expand only that column.
		if ($hasMainBody > -1)
		{
			foreach ($component['columns'] as $i => $columnIndex)
			{
				if (!isset($columns[$i]))
				{
					$columns[$hasMainBody]['width']['lg'] += $layout['columns'][$columnIndex]['width']['lg'];
					$columns[$hasMainBody]['width']['md'] += $layout['columns'][$columnIndex]['width']['md'];
					$columns[$hasMainBody]['width']['sm'] += $layout['columns'][$columnIndex]['width']['sm'];
					$columns[$hasMainBody]['width']['xs'] += $layout['columns'][$columnIndex]['width']['xs'];
				}
			}
		}
	}
	
	// Loop thru rendered columns to set width.
	$numColumns = count($columns);
	$equalWidth = floor(12 / $numColumns);
	$remainSpan = 12 % $numColumns;
	$colsInRow = array();
	
	foreach ($columns as $i => $column)
	{
		// If all columns visible or there is a column contains main body, use current width.
		if ($allColumnsVisible || $hasMainBody > -1)
		{
			$lg = $column['width']['lg'];
			$md = $column['width']['md'];
			$sm = $column['width']['sm'];
			$xs = $column['width']['xs'];
		}
		
		// Otherwise, re-calculate column width.
		else
		{
			// Expand sibling column, prefer column in the left side first.
			$span = array(
				'lg' => 0,
				'md' => 0,
				'sm' => 0,
				'xs' => 0
			);
			
			if (!isset($columns[$i + 1]) && !isset($columns[$i + 2]) && isset($component['columns'][$i + 1]))
			{
				$invisibleColumn = $layout['columns'][$component['columns'][$i + 1]];
				
				$span['lg'] += $invisibleColumn['width']['lg'];
				$span['md'] += $invisibleColumn['width']['md'];
				$span['sm'] += $invisibleColumn['width']['sm'];
				$span['xs'] += $invisibleColumn['width']['xs'];
			}
			
			if ($i > 0 && !isset($columns[$i - 1]))
			{
				$invisibleColumn = $layout['columns'][$component['columns'][$i - 1]];
				
				$span['lg'] += $invisibleColumn['width']['lg'];
				$span['md'] += $invisibleColumn['width']['md'];
				$span['sm'] += $invisibleColumn['width']['sm'];
				$span['xs'] += $invisibleColumn['width']['xs'];
			}
			
			foreach ($screens as $screen => $equalized)
			{
				// Do not alter column that is already at the maximum available width.
				${$screen} = $column['width'][$screen];
				
				if (${$screen} == 12)
				{
					continue;
				}
				
				// Otherwise, alter column width.
				if ($equalized)
				{
					// Calculate equalized width.
					${$screen} = $equalWidth;
					
					if ($remainSpan && $i >= ( $numColumns - $remainSpan ))
					{
						// Remaining span will be splitted equally for columns in the right side.
						// E.g. if the row has 5 column then 2 remaining span will be splitted equally
						// for the last 2 columns, so the columns ratio will be: 2 - 2 - 2 - 3 - 3.
						${$screen} += 1;
					}
				}
				else
				{
					// Take free span left by invisible column.
					${$screen} += $span[$screen];
				}
			}
		}
		
		// Prepare column class.
		$class = '';
		
		if (SunFwSite::getInstance()->responsive)
		{
			$class = "col-xs-{$xs} col-sm-{$sm} col-md-{$md} col-lg-{$lg}";
		}
		else
		{
			// If responsive is disabled, 'xs' = 'lg' on all screens.
			$class = "col-xs-{$lg}";
		}
		
		if (isset($column['settings']['class']) && $column['settings']['class'] != '')
		{
			$class .= ' ' . $column['settings']['class'];
		}
		
		// Prepare column visibility.
		$visible_in = isset($column['settings']['visible_in']) ? $column['settings']['visible_in'] : '';
		
		if (is_array($visible_in) && count($visible_in) > 0)
		{
			foreach ($visible_in as $v)
			{
				$class .= ' visible-' . $v;
			}
		}
		
		// Finalize column's HTML.
		$html = '<div id="' . $column['id'] . '" class="' . $class . '">' . $column['html'] . '</div>';
		
		// If there is a column contains main body,
		// all other columns will be rendered after that column.
		if ($hasMainBody > -1)
		{
			if ($i == $hasMainBody)
			{
				array_unshift($colsInRow, str_replace($class, "{$class} flex-md-unordered", $html));
			}
			elseif ($i < $hasMainBody)
			{
				$colsInRow[] = str_replace($class, "{$class} flex-xs-first", $html);
			}
			else
			{
				$colsInRow[] = $html;
			}
		}
		
		// Otherwise, render normally.
		else
		{
			$colsInRow[] = $html;
		}
	}
	
	echo implode("\n", $colsInRow);
	?>
	</div>
<?php
}
