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

$class = isset($component['settings']['class']) ? $component['settings']['class'] : '';
$html = isset($component['settings']['html']) ? $component['settings']['html'] : '';

$visible_in = isset($component['settings']['visible_in']) ? $component['settings']['visible_in'] : '';

$classVisible = '';
if (is_array($visible_in) && count($visible_in) > 0)
{
	foreach ($visible_in as $k => $value)
	{
		$classVisible .= ' visible-' . $value;
	}
}
?>

<div class="<?php echo $class.$classVisible; ?>">
	<?php echo $html; ?>
</div>
