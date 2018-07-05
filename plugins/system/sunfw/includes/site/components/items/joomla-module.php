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

// Get module.
$module = isset($component['settings']['module']) ? $component['settings']['module'] : false;

// Get module style.
$module_style = isset($component['settings']['style']) ? $component['settings']['style'] : '';

// Prepare class attribute.
$class = isset($component['settings']['class']) ? $component['settings']['class'] . ' ' : '';
$module_class = 'module-style ' . $module_style;
$visible_in = isset($component['settings']['visible_in']) ? $component['settings']['visible_in'] : '';
$classVisible = '';

if (is_array($visible_in) && count($visible_in) > 0)
{
	foreach ($visible_in as $v)
	{
		$classVisible .= ' visible-' . $v;
	}
}

// Render module.
$html = '';

if ($module != false)
{
	$exp = explode(':', $module);
	
	if (count($exp) >= 2)
	{
		$id = (int) end($exp);
		
		if ($id)
		{
			$html = SunFwModule::render($id);
		}
	}
}

if ($html != '')
:
	$mTable = JTable::getInstance('Module', 'JTable');
	
	if ($mTable->load($id))
	{
		// Binding parameters to JRegistry object
		$mParams = new JRegistry($mTable->params);
		
		if ($mParams->get('style') != '0')
		{
			$module_class = 'module-style';
		}
	}
	?>
<div class="<?php echo $class . $module_class . $classVisible; ?>">
	<?php echo $html; ?>
</div>
<?php
endif;
