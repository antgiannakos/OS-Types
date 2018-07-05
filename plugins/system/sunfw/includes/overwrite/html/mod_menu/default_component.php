<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_menu
 *
 * @copyright   Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Note. It is important to remove spaces between elements.
$class = $item->anchor_css ? 'class="' . $item->anchor_css . '" ' : '';
$title = $item->anchor_title ? 'title="' . $item->anchor_title . '" ' : '';

if ($item->menu_image)
{
	$item->params->get('menu_text', 1) ?
	$linktype = '<img src="' . $item->menu_image . '" alt="' . $item->title . '" /><span class="image-title">' . $item->title . '</span> ' :
	$linktype = '<img src="' . $item->menu_image . '" alt="' . $item->title . '" />';
}
else
{
	$linktype = $item->title;
}

$nofollow = (int) $item->params->get('sunfw-no-follow', '0') ? ' rel="nofollow"' : '';


$link_icon = $item->params->get('sunfw-link-icon', '');

$link_description = $item->params->get('sunfw-link-description', '');

$description = '';
if ($link_description != '')
{
	$description = '<span class="description">'.$link_description.'</span>';
}

$icon = '';
if ($link_icon != '')
{
	$icon = '<i class="' . $link_icon . '"></i>';
}

switch ($item->browserNav)
{
	default:
	case 0:
?><a <?php echo $class; ?>href="<?php echo $item->flink; ?>" <?php echo $title . $nofollow; ?>><?php echo $icon.$linktype.$description; ?></a><?php
		break;
	case 1:
		// _blank
		$nofollow = empty($nofollow) ? ' rel="noopener noreferrer"' : ' rel="nofollow noopener noreferrer"';
?><a <?php echo $class; ?>href="<?php echo $item->flink; ?>" target="_blank" <?php echo $title . $nofollow; ?>><?php echo $icon.$linktype.$description; ?></a><?php
		break;
	case 2:
	// Use JavaScript "window.open"
?><a <?php echo $class; ?>href="<?php echo $item->flink; ?>" onclick="window.open(this.href,'targetWindow','toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes');return false;" <?php echo $title . $nofollow; ?>><?php echo $icon.$linktype.$description; ?></a>
<?php
		break;
}
