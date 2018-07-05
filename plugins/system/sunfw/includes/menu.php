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

/**
 * General Menu class.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwMenu
{

	/**
	 * Prepare parameters before using
	 *
	 * @return array
	 */
	public static function prepareSettings($settings)
	{
		$rsettings = array(
			'mobiletarget' => isset($settings['settings']['menu-mobile-target']) ? $settings['settings']['menu-mobile-target'] : '0',
			'showicon' => isset($settings['settings']['menu-show-icon']) ? $settings['settings']['menu-show-icon'] : '0',
			'showdescription' => isset($settings['settings']['menu-show-description']) ? $settings['settings']['menu-show-description'] : '0',
			'showsubmenu' => isset($settings['settings']['menu-show-submenu']) ? $settings['settings']['menu-show-submenu'] : '0',
			'subeffect' => isset($settings['settings']['menu-sub-effect']) ? $settings['settings']['menu-sub-effect'] : '0',
			'base' => isset($settings['settings']['menu-item']) ? $settings['settings']['menu-item'] : '',
			'start' => isset($settings['settings']['menu-start-level']) ? $settings['settings']['menu-start-level'] : '1',
			'end' => isset($settings['settings']['menu-end-level']) ? $settings['settings']['menu-end-level'] : '0',
			'identificationcode' => isset($settings['settings']['identification_code']) ? $settings['settings']['identification_code'] : $settings['id']
		);

		return $rsettings;
	}

	/**
	 * render Menu
	 *
	 * @return string
	 */
	public static function render($menuType, $id, $settings)
	{
		if ($menuType == '')
		{
			return '';
		}

		$rsettings = self::prepareSettings($settings);

		$html = '';
		$items = self::getMenuList($menuType, $rsettings);

		$html .= self::beginMenu($id, $rsettings['mobiletarget'], $rsettings['showsubmenu'], $rsettings['subeffect']);

		if (count($items))
		{
			$html .= self::middleMenu($items, $menuType, $rsettings['showicon'], $rsettings['showdescription']);
		}

		$html .= self::endMenu();

		return $html;
	}

	/**
	 * Get a list of the menu items.
	 *
	 * @param   \Joomla\Registry\Registry  &$params  The module options.
	 *
	 * @return  array
	 *
	 * @since   1.5
	 */
	public static function getMenuList($menuType, $settings)
	{
		$menu = JFactory::getApplication()->getMenu();
		$base = self::getActive();
		$user = JFactory::getUser();
		$levels = $user->getAuthorisedViewLevels();

		asort($levels);

		if ($settings['base'] != '')
		{
			$tmpBase = $menu->getItem((int) $settings['base']);

			if (count((array) $tmpBase))
			{
				$base = $tmpBase;
			}
		}

		$path = $base->tree;

		// Prepare menu items.
		$start = (int) $settings['start'];
		$end = (int) $settings['end'];
		$showAll = '1';
		$lastitem = 0;
		$hidden_parents = array();

		$attributes[] = 'menutype';
		$values[] = $menuType;

		$items = $menu->getItems($attributes, $values);

		if ($items)
		{
			foreach ($items as $i => $item)
			{
				if (( $start && $start > $item->level ) || ( $end && $item->level > $end ) ||
					 ( !$showAll && $item->level > 1 && !in_array($item->parent_id, $path) ) ||
					 ( $start > 1 && !in_array($item->tree[$start - 2], $path) ))
				{
					unset($items[$i]);

					continue;
				}

				// Exclude item with menu item option set to exclude from menu modules
				if (( $item->params->get('menu_show', 1) == 0 ) || in_array($item->parent_id, $hidden_parents))
				{
					$hidden_parents[] = $item->id;

					unset($items[$i]);

					continue;
				}

				if ((int) $settings['showsubmenu'] == 0 && $item->level > 1)
				{
					$hidden_parents[] = $item->id;

					unset($items[$i]);

					continue;
				}

				$item->deeper = false;
				$item->shallower = false;
				$item->level_diff = 0;

				if (isset($items[$lastitem]))
				{
					$items[$lastitem]->deeper = ( $item->level > $items[$lastitem]->level );
					$items[$lastitem]->shallower = ( $item->level < $items[$lastitem]->level );
					$items[$lastitem]->level_diff = ( $items[$lastitem]->level - $item->level );
				}

				$item->parent = (boolean) $menu->getItems('parent_id', (int) $item->id, true);

				$lastitem = $i;
				$item->active = false;
				$item->flink = $item->link;

				// Reverted back for CMS version 2.5.6
				switch ($item->type)
				{
					case 'separator':
					case 'heading':
						// No further action needed.
						continue;
					break;

					case 'url':
						if (( strpos($item->link, 'index.php?') === 0 ) && ( strpos($item->link, 'Itemid=') === false ))
						{
							// If this is an internal Joomla link, ensure the Itemid is set.
							$item->flink = $item->link . '&Itemid=' . $item->id;
						}
					break;

					case 'alias':
						$item->flink = 'index.php?Itemid=' . $item->params->get('aliasoptions');
					break;

					default:
						$item->flink = 'index.php?Itemid=' . $item->id;
					break;
				}

				if (strcasecmp(substr($item->flink, 0, 4), 'http') && ( strpos($item->flink, 'index.php?') !== false ))
				{
					$item->flink = JRoute::_($item->flink, true, $item->params->get('secure'));
				}
				else
				{
					$item->flink = JRoute::_($item->flink);
				}

				// We prevent the double encoding because for some reason the $item is shared for menu modules
				// and we get double encoding when the cause of that is found the argument should be removed.
				$item->title = htmlspecialchars($item->title, ENT_COMPAT, 'UTF-8', false);
				$item->anchor_css = htmlspecialchars($item->params->get('menu-anchor_css', ''), ENT_COMPAT, 'UTF-8', false);
				$item->anchor_title = htmlspecialchars($item->params->get('menu-anchor_title', ''), ENT_COMPAT, 'UTF-8', false);
				$item->menu_image = $item->params->get('menu_image', '') ? htmlspecialchars($item->params->get('menu_image', ''),
					ENT_COMPAT, 'UTF-8', false) : '';
			}

			if (isset($items[$lastitem]))
			{
				$items[$lastitem]->deeper = ( ( $start ? $start : 1 ) > $items[$lastitem]->level );
				$items[$lastitem]->shallower = ( ( $start ? $start : 1 ) < $items[$lastitem]->level );
				$items[$lastitem]->level_diff = ( $items[$lastitem]->level - ( $start ? $start : 1 ) );
			}
		}

		return $items;
	}

	/**
	 * Get active menu
	 *
	 * @return object
	 */
	public static function getActive()
	{
		$menu = JFactory::getApplication()->getMenu('site');
		$lang = JFactory::getLanguage();

		// Look for the home menu
		if (JLanguageMultilang::isEnabled())
		{
			$home = $menu->getDefault($lang->getTag());
		}
		else
		{
			$home = $menu->getDefault();
		}

		return $menu->getActive() ? $menu->getActive() : $home;
	}

	/**
	 * Render begin of Menu HTML
	 *
	 * @return string
	 */
	public static function beginMenu($id, $mobile_target, $showsubmenu, $subeffect)
	{
		$rand = strtolower(SunFwUtils::generateRandString());

		switch ($subeffect)
		{
			case 2:
				$classsubeffect = ' sunfwMenuFading';
			break;

			case 3:
				$classsubeffect = ' sunfwMenuSlide';
			break;

			default:
				$classsubeffect = ' sunfwMenuNoneEffect';
			break;
		}

		if ($mobile_target == 1)
		{
			return '<nav class="navbar navbar-default sunfw-menu-head' . $classsubeffect .
				 '" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed btn btn-danger" data-toggle="collapse" data-target="#menu_' .
				 $id . '" aria-expanded="false">
						<i aria-hidden="true" class="fa fa-bars"></i>
					</button>
				</div>
				<div class="collapse navbar-collapse sunfw-menu" id="menu_' . $id .
				 '"><ul class="nav navbar-nav sunfw-tpl-menu">';
		}
		else
		{
			return '<nav class="navbar navbar-default sunfw-menu-head' . $classsubeffect . ' noMobileTagert" role="navigation">
				<div class="collapse navbar-collapse sunfw-menu" id="menu_' . $id .
				 '"><ul class="nav navbar-nav sunfw-tpl-menu">';
		}
	}

	/**
	 * Render end of Menu HTML
	 *
	 * @return string
	 */
	public static function endMenu($inherit = false)
	{
		return '</ul></div></nav>';
	}

	/**
	 * Render middle of Menu HTML
	 *
	 * @return string
	 */
	public static function middleMenu($items, $menuType, $showicon, $showdescription)
	{
		$html = '';
		$active = self::getActive();
		$path = $active->tree;
		$activeID = $active->id;
		$menuCount = count($items);

		$count = 1;
		$flag = false;
		$megamenuID = array();

		foreach ($items as $i => &$item)
		{
			if (in_array($item->parent_id, $megamenuID))
			{
				$megamenuID = array_merge(array(
					(int) $item->id
				), $megamenuID);

				continue;
			}

			// Render mega menu if has.
			$megamenu = trim(self::renderMegaMenu($item->id));

			// Prepare class for menu item.
			$class = 'item-' . $item->id;

			if (( $item->id == $activeID ) or ( $item->type == 'alias' and $item->params->get('aliasoptions') == $activeID ))
			{
				$class .= ' current';
			}

			if (in_array($item->id, $path))
			{
				$class .= ' active';
			}
			elseif ($item->type == 'alias')
			{
				$aliasToId = $item->params->get('aliasoptions');

				if (count($path) > 0 && $aliasToId == $path[count($path) - 1])
				{
					$class .= ' active';
				}
				elseif (in_array($aliasToId, $path))
				{
					$class .= ' alias-parent-active';
				}
			}

			if ($item->type == 'separator')
			{
				$class .= ' divider';
			}

			if (!empty($megamenu) || $item->deeper)
			{
				$class .= ' parent dropdown-submenu';
			}

			// Icon menu
			if ($item->anchor_css)
			{
				//$class .= ' ' . $item->anchor_css;
			}

			if (!empty($class))
			{
				$class = ' class="' . trim($class) . '"';
			}

			$html .= '<li' . $class . '>';

			$flag = false;

			$item->title = html_entity_decode($item->title);

			// Render the menu item.
			switch ($item->type)
			{
				case 'separator':
					$html .= self::renderSeparatorItemLayout($item, $activeID, $showicon, $showdescription, $megamenu);
				break;

				case 'url':
					$html .= self::renderUrlItemLayout($item, $activeID, $showicon, $showdescription, $megamenu);
				break;

				case 'component':
					$html .= self::renderComponentItemLayout($item, $activeID, $showicon, $showdescription, $megamenu);
				break;

				case 'heading':
					$html .= self::renderHeadingItemLayout($item, $activeID, $showicon, $showdescription, $megamenu);
				break;

				default:
					$html .= self::renderUrlItemLayout($item, $activeID, $showicon, $showdescription);
				break;
			}

			// Check if item has mega menu.
			if (!empty($megamenu))
			{
				// Render sub-menu if needed.
				if (false !== strpos($megamenu, '%SUB-MENU%'))
				{
					// Get sub-menu items.
					$subMegaMenuItems = self::getSubMegaMenuList($item->id, $menuType);

					if (count($subMegaMenuItems))
					{
						$subMegaMenu = self::middleMegaMenu($subMegaMenuItems, $item->id);
						$megamenu = str_replace('%SUB-MENU%', '<ul class="sub-menu nav menu">' . $subMegaMenu . '</ul>', $megamenu);
					}
					else
					{
						$megamenu = str_replace('%SUB-MENU%', '', $megamenu);
					}
				}

				$html .= $megamenu . '</li>';

				$megamenuID = array_merge(array(
					(int) $item->id
				), $megamenuID);
			}

			// Prepare next HTML tag.
			else
			{
				if ($item->deeper)
				{
					// The next item is deeper. child.
					$html .= '<ul class="dropdown-menu">';

					$flag = true;
				}
				elseif ($item->shallower)
				{
					// The next item is shallower.
					$html .= '</li>';
					$html .= str_repeat('</ul></li>', $item->level_diff);
				}
				else
				{
					// The next item is on the same level.
					$html .= '</li>';
				}
			}

			$count++;
		}

		return $html;
	}

	/**
	 * Render component item layout.
	 *
	 * @param   object  $item             Item data.
	 * @param   int     $activeID         ID of active item.
	 * @param   bool    $showicon         Whether to show icon.
	 * @param   bool    $showdescription  Whether to show description.
	 * @param   string  $megamenu         Rendered mega menu belongs to item if has.
	 *
	 * @return  string
	 */
	public static function renderComponentItemLayout($item, $activeID, $showicon = 0, $showdescription = 0, $megamenu = '')
	{
		$html = '';
		$caret = '';
		$class = '';
		$nofollow = (int) $item->params->get('sunfw-no-follow', '0') ? ' rel="nofollow"' : '';
		$link_icon = $item->params->get('sunfw-link-icon', '');
		$link_description = $item->params->get('sunfw-link-description', '');

		if ($item->anchor_css)
		{
			$class .= $item->anchor_css;
		}

		$title = $item->anchor_title ? 'title="' . $item->anchor_title . '" ' : '';

		if ($item->id == $activeID)
		{
			$class .= ' current';
		}

		$class .= ' clearfix';

		if (!empty($megamenu) || $item->deeper)
		{
			$class .= ' dropdown-toggle';
			$caret = '<span class="caret"></span>';
		}

		if (!empty($class))
		{
			$class = 'class="' . trim($class) . '" ';
		}

		if ($item->menu_image)
		{
			$item->params->get('menu_text', 1) ? $linktype = '<img src="' . $item->menu_image . '" alt="' . $item->title .
				 '" /><span class="image-title">' . $item->title . '</span> ' : $linktype = '<img src="' . $item->menu_image . '" alt="' .
				 $item->title . '" />';
		}
		else
		{
			$linktype = $item->title;
		}

		if ($showdescription != 0 && $link_description != '')
		{
			$linktype = '<span data-title="' . $item->title . '"><span class="menutitle">' . $linktype . '</span>';
			$linktype .= '<span class="menudescription">' . $link_description . '</span>';
			$linktype .= '</span>';
		}
		else
		{
			$linktype = '<span data-title="' . $item->title . '"><span class="menutitle">' . $linktype . '</span></span>';
		}

		$icon = '';

		if ($link_icon != '' && $showicon != 0)
		{
			$icon = '<i class="' . $link_icon . '"></i>';
		}

		switch ($item->browserNav)
		{
			default:
			case 0:
				$html = '<a ' . $class . 'href="' . $item->flink . '" ' . $title . $nofollow . '>' . $icon . $linktype . $caret . '</a>';
			break;

			case 1:
				$nofollow = empty($nofollow) ? ' rel="noopener noreferrer"' : ' rel="nofollow noopener noreferrer"';

				$html = '<a ' . $class . 'href="' . $item->flink . '" target="_blank" ' . $title . $nofollow . '>' . $icon . $linktype .
					 $caret . '</a>';
			break;

			case 2:
				$html = '<a ' . $class . 'href="' . $item->flink .
					 '" onclick="window.open(this.href,\'targetWindow\',\'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes\');return false;" ' .
					 $title . $nofollow . '>' . $icon . $linktype . $caret . '</a>';
			break;
		}

		return $html;
	}

	/**
	 * Render separator item layout.
	 *
	 * @param   object  $item             Item data.
	 * @param   int     $activeID         ID of active item.
	 * @param   bool    $showicon         Whether to show icon.
	 * @param   bool    $showdescription  Whether to show description.
	 * @param   string  $megamenu         Rendered mega menu belongs to item if has.
	 *
	 * @return  string
	 */
	public static function renderSeparatorItemLayout($item, $activeID, $showicon = 0, $showdescription = 0, $megamenu = '')
	{
		$html = '';
		$caret = '';
		$title = $item->anchor_title ? ' title="' . $item->anchor_title . '" ' : '';
		$link_icon = $item->params->get('sunfw-link-icon', '');
		$link_description = $item->params->get('sunfw-link-description', '');

		if ($item->menu_image)
		{
			$item->params->get('menu_text', 1) ? $linktype = '<img src="' . $item->menu_image . '" alt="' . $item->title .
				 '" /><span class="image-title">' . $item->title . '</span> ' : $linktype = '<img src="' . $item->menu_image . '" alt="' .
				 $item->title . '" />';
		}
		else
		{
			$linktype = $item->title;
		}

		if ($link_description != '' && $showdescription != 0)
		{
			$linktype = '<span data-title="' . $item->title . '"><span class="menutitle">' . $linktype . '</span>';
			$linktype .= '<span class="menudescription">' . $link_description . '</span>';
			$linktype .= '</span>';
		}
		else
		{
			$linktype = '<span data-title="' . $item->title . '"><span class="menutitle">' . $linktype . '</span></span>';
		}

		$icon = '';

		if ($link_icon != '' && $showicon != 0)
		{
			$icon = '<i class="' . $link_icon . '"></i>';
		}

		$params = ' ';

		if (!empty($megamenu) || $item->deeper)
		{
			$params = ' class="dropdown-toggle" data-toggle="dropdown" ';
			$caret = '<span class="caret"></span>';
		}

		$html .= '<a' . $params . 'href="javascript: void(0)">' . $icon . $linktype . $caret . '</a>';

		return $html;
	}

	/**
	 * Render URL item layout.
	 *
	 * @param   object  $item             Item data.
	 * @param   int     $activeID         ID of active item.
	 * @param   bool    $showicon         Whether to show icon.
	 * @param   bool    $showdescription  Whether to show description.
	 * @param   string  $megamenu         Rendered mega menu belongs to item if has.
	 *
	 * @return  string
	 */
	public static function renderUrlItemLayout($item, $activeID, $showicon = 0, $showdescription = 0, $megamenu = '')
	{
		$html = '';
		$class = '';
		$caret = '';
		$title = $item->anchor_title ? 'title="' . $item->anchor_title . '" ' : '';

		$nofollow = (int) $item->params->get('sunfw-no-follow', '0') ? ' rel="nofollow"' : '';
		$link_icon = $item->params->get('sunfw-link-icon', '');
		$link_description = $item->params->get('sunfw-link-description', '');

		if ($item->anchor_css)
		{
			$class .= $item->anchor_css;
		}

		if ($item->id == $activeID)
		{
			$class .= ' current';
		}

		$class .= ' clearfix';

		if (!empty($megamenu) || $item->deeper)
		{
			$class .= ' dropdown-toggle';
			$caret = '<span class="caret"></span>';
		}

		if (!empty($class))
		{
			$class = 'class="' . trim($class) . '" ';
		}

		if ($item->menu_image)
		{
			$item->params->get('menu_text', 1) ? $linktype = '<img src="' . $item->menu_image . '" alt="' . $item->title .
				 '" /><span class="image-title">' . $item->title . '</span> ' : $linktype = '<img src="' . $item->menu_image . '" alt="' .
				 $item->title . '" />';
		}
		else
		{
			$linktype = $item->title;
		}

		$flink = $item->flink;

		$flink = JFilterOutput::ampReplace(htmlspecialchars($flink, ENT_COMPAT, 'UTF-8', false));

		if ($link_description != '' && $showdescription != 0)
		{
			$linktype = '<span data-title="' . $item->title . '"><span class="menutitle">' . $linktype . '</span>';
			$linktype .= '<span class="menudescription">' . $link_description . '</span>';
			$linktype .= '</span>';
		}
		else
		{
			$linktype = '<span data-title="' . $item->title . '"><span class="menutitle">' . $linktype . '</span></span>';
		}

		$icon = '';

		if ($link_icon != '' && $showicon != 0)
		{
			$icon = '<i class="' . $link_icon . '"></i>';
		}

		switch ($item->browserNav)
		{
			default:
			case 0:
				$html .= '<a ' . $class . 'href="' . $flink . '" ' . $title . $nofollow . '>' . $icon . $linktype . $caret . '</a>';
			break;

			case 1:
				$nofollow = empty($nofollow) ? ' rel="noopener noreferrer"' : ' rel="nofollow noopener noreferrer"';

				$html .= '<a ' . $class . 'href="' . $flink . '" target="_blank" ' . $title . $nofollow . '>' . $icon . $linktype . $caret .
					 '</a>';
			break;

			case 2:
				$options = 'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes';
				$html .= '<a ' . $class . 'href="' . $flink . '" onclick="window.open(this.href,\'targetWindow\',\'' . $options .
					 '\');return false;" ' . $title . $nofollow . '>' . $icon . $linktype . $caret . '</a>';
			break;
		}

		return $html;
	}

	/**
	 * render Heading item layout
	 * @param object $item
	 *
	 * @return string
	 */
	public static function renderHeadingItemLayout($item, $activeID, $showicon = 0, $showdescription = 0, $megamenu = '')
	{
		$html = '';
		$link_desc = '';
		$caret = '';
		$title = $item->anchor_title ? 'title="' . $item->anchor_title . '" ' : '';

		$link_icon = $item->params->get('sunfw-link-icon', '');
		$link_description = $item->params->get('sunfw-link-description', '');

		if (!empty($megamenu) || $item->deeper)
		{
			$caret = '<span class="caret"></span>';
		}

		if ($item->menu_image)
		{
			$item->params->get('menu_text', 1) ? $linktype = '<img src="' . $item->menu_image . '" alt="' . $item->title .
				 '" /><span class="image-title">' . $item->title . '</span> ' : $linktype = '<img src="' . $item->menu_image . '" alt="' .
				 $item->title . '" />';
		}
		else
		{
			$linktype = $item->title;
		}

		$icon = '';

		if ($link_icon != '' && $showicon != 0)
		{
			$icon = '<i class="' . $link_icon . '"></i>';
		}
		if ($link_description != '' && $showdescription != 0)
		{
			$link_desc .= '<span class="menudescription">' . $link_description . '</span>';
		}

		$html .= '<span class="nav-header ' . $item->anchor_css . '" ' . $title . '>' . $icon . '<span class="heading-data-title">' . $linktype . $link_desc . '</span>' . $caret . '</span>';

		return $html;
	}

	/**
	 * Render mega menu.
	 *
	 * @param   int  $root  ID of root item to render mega menu for.
	 *
	 * @return  string
	 */
	public static function renderMegaMenu($root)
	{
		// Get mega menu data.
		static $megamenu;

		if (!isset($megamenu))
		{
			$megamenu = SunFwSite::getInstance()->megamenu;
		}

		// Make sure mega menu is enabled and has data.
		if (!@count($megamenu) || !@count($megamenu['megamenu'][$root]['rows']))
		{
			return;
		}

		// Start rendering mega menu.
		$megaMenuHtml = '';

		// Store current menu item ID.
		$itemID = $root;

		// Get megamenu data.
		$options = & $megamenu['options'];
		$rows = & $megamenu['rows'];
		$columns = & $megamenu['columns'];
		$blocks = & $megamenu['blocks'];
		$items = & $megamenu['items'];
		$root = & $megamenu['megamenu'][$root];

		// Add megamenu to root item.
		$scripts[] = '$("ul.sunfw-tpl-menu li.item-' . $itemID . '").addClass("megamenu").removeClass("dropdown-submenu");';

		// Add align to root item.
		if (isset($root['settings']['align']) && $root['settings']['align'] != '')
		{
			$scripts[] = '$("ul.sunfw-tpl-menu li.item-' . $itemID . '").addClass("' . $root['settings']['align'] . '")';
		}

		// Add full width to root item.
		if (!isset($root['settings']['full']) || $root['settings']['full'] == 'null')
		{
			$scripts[] = '$("ul.sunfw-tpl-menu li.item-' . $itemID . '").addClass("full-width")';
		}

		// Add script declaration to document.
		JFactory::getDocument()->addScriptDeclaration(
			'
			jQuery(function($) {
				$(document).ready(function() {
					' . implode("\n\t\t\t\t\t", $scripts) . '
				});
			});
		');

		// Prepare mega menu width.
		$styleWidth = '';

		if (!empty($root['settings']['width']) && isset($root['settings']['full']) && $root['settings']['full'] == 1)
		{
			$styleWidth .= "width:{$root['settings']['width']}px";
		}
		elseif (!isset($root['settings']['full']) || $root['settings']['full'] == 'null')
		{
			$styleWidth .= 'width:100%';
		}

		$styleWidth = empty($styleWidth) ? '' : ' style="' . $styleWidth . '"';

		// Prepare megamenu padding.
		$styles = array();

		if (@is_array($root['settings']['padding']))
		{
			foreach ($root['settings']['padding'] as $k => $v)
			{
				if (!empty($v) || $v == '0')
				{
					$styles[] = "padding-{$k}:{$v}px";
				}
			}
		}

		// Prepare megamenu background.
		if (!empty($root['settings']['backgroundColor']))
		{
			$styles[] = "background-color:{$root['settings']['backgroundColor']}";
		}

		if (!empty($root['settings']['backgroundImage']))
		{
			// Prepare background image.
			if (!preg_match('#^(https?:)?//#', $root['settings']['backgroundImage']))
			{
				$root['settings']['backgroundImage'] = JUri::root() . ltrim($root['settings']['backgroundImage']);
			}

			$styles[] = "background-image:url({$root['settings']['backgroundImage']})";

			if (@is_array($root['settings']['backgroundImageSettings']))
			{
				foreach ($root['settings']['backgroundImageSettings'] as $k => $v)
				{
					if (!empty($v))
					{
						$styles[] = "background-{$k}:{$v}";
					}
				}
			}
		}

		// Prepare megamenu border.
		if (@is_array($root['settings']['border']))
		{
			if (isset($root['settings']['border']['universal']) && intval($root['settings']['border']['universal']))
			{
				foreach (array(
					'width',
					'style',
					'color'
				) as $k)
				{
					$v = $root['settings']['border'][$k];

					if (!empty($v))
					{
						$styles[] = "border-{$k}:{$v}" . ( $k == 'width' ? 'px' : '' );
					}
				}
			}
			else
			{
				foreach (array(
					'top',
					'right',
					'bottom',
					'left'
				) as $p)
				{
					foreach (array(
						'width',
						'style',
						'color'
					) as $k)
					{
						$v = $root['settings']['border']["{$p}-{$k}"];

						if (!empty($v))
						{
							$styles[] = "border-{$p}-{$k}:{$v}" . ( $k == 'width' ? 'px' : '' );
						}
					}
				}
			}
		}

		// Loop rows to render HTML.
		unset($scripts);

		$megaMenuHtml .= '
			<ul class="sunfw-megamenu-sub-menu"' . $styleWidth . '>
				<div class="grid" style="' . implode(';', $styles) . '">
					<div class="sunfw-mega-menu">';

		foreach ($root['rows'] as $rowIndex)
		{
			// Make sure row is enabled and has data.
			$row = isset($rows[$rowIndex]) ? $rows[$rowIndex] : null;

			if (!$row || !@count($row['columns']) || ( @isset($row['settings']['disabled']) && intval($row['settings']['disabled']) ))
			{
				continue;
			}

			// Render row style.
			$rowID = "sunfw_menu_{$row['id']}";

			if (@is_array($row['settings']['padding']))
			{
				foreach ($row['settings']['padding'] as $k => $v)
				{
					if (!empty($v) || $v == '0')
					{
						$scripts[] = '$("#' . $rowID . '").css("padding-' . $k . '", "' . $v . 'px");';
					}
				}
			}

			if (@is_array($row['settings']['margin']))
			{
				foreach ($row['settings']['margin'] as $k => $v)
				{
					if (!empty($v) || $v == '0')
					{
						$scripts[] = '$("#' . $rowID . '").css("margin-' . $k . '", "' . $v . 'px");';
					}
				}
			}

			// Loop thru columns to render HTML.
			$megaMenuHtml .= '
						<div id="' . $rowID . '" class="row">';

			foreach ($row['columns'] as $columnIndex)
			{
				// Make sure column is enabled and has data.
				$column = isset($columns[$columnIndex]) ? $columns[$columnIndex] : null;

				if (!$column || !@count($column['blocks']) ||
					 ( @isset($column['settings']['disabled']) && intval($column['settings']['disabled']) ))
				{
					continue;
				}

				// Render column style.
				$columnID = "sunfw_menu_{$column['id']}";

				if (@is_array($column['settings']['padding']))
				{
					foreach ($column['settings']['padding'] as $k => $v)
					{
						if (!empty($v) || $v == '0')
						{
							$scripts[] = '$("#' . $columnID . '").css("padding-' . $k . '", "' . $v . 'px");';
						}
					}
				}

				if (@is_array($column['settings']['margin']))
				{
					foreach ($column['settings']['margin'] as $k => $v)
					{
						if (!empty($v) || $v == '0')
						{
							$scripts[] = '$("#' . $columnID . '").css("margin-' . $k . '", "' . $v . 'px");';
						}
					}
				}

				// Loop thru blocks to render HTML.
				$megaMenuHtml .= '
							<div id="' . $columnID . '" class="col-xs-' . $column['width'] .
					 ( @isset($column['settings']['class']) ? ' ' . $column['settings']['class'] : '' ) . '">';

				foreach ($column['blocks'] as $blockIndex)
				{
					// Make sure block is enabled and has data.
					$block = isset($blocks[$blockIndex]) ? $blocks[$blockIndex] : null;

					if (!$block || !@count($block['items']) ||
						 ( @isset($block['settings']['disabled']) && intval($block['settings']['disabled']) ))
					{
						continue;
					}

					// Loop thru items to render HTML.
					$megaMenuHtml .= '
								<div class="sunfw-block">';

					foreach ($block['items'] as $itemIndex)
					{
						// Make sure item is enabled and has data.
						$item = isset($items[$itemIndex]) ? $items[$itemIndex] : null;

						if (!$item || !isset($item['type']) ||
							 ( @isset($item['settings']['disabled']) && intval($item['settings']['disabled']) ))
						{
							continue;
						}

						$megaMenuHtml .= '
									<div class="sunfw-item">';

						// Render item.
						if ($item['type'] == 'sub-menu')
						{
							$megaMenuHtml .= '%SUB-MENU%';
						}
						else
						{
							ob_start();

							SunFwSite::renderItem($item);

							$megaMenuHtml .= ob_get_contents();

							ob_end_clean();
						}

						$megaMenuHtml .= '
									</div>';
					}

					$megaMenuHtml .= '
								</div>';
				}

				$megaMenuHtml .= '
							</div>';
			}

			$megaMenuHtml .= '
						</div>';
		}

		// Add script declaration to document.
		if (isset($scripts))
		{
			JFactory::getDocument()->addScriptDeclaration(
				'
				jQuery(function($) {
					$(document).ready(function() {
						' . implode("\n\t\t\t\t\t\t", $scripts) . '
					});
				});
			');
		}

		$megaMenuHtml .= '
					</div>
				</div>
			</ul>';

		return $megaMenuHtml;
	}

	/**
	 * Get a list of the mega menu items.
	 *
	 * @param   \Joomla\Registry\Registry  &$params  The module options.
	 *
	 * @return  array
	 *
	 * @since   1.5
	 */
	public static function getSubMegaMenuList($parentID, $menuType)
	{
		$parentIDs = array();
		$parentIDs[] = $parentID;

		$menu = JFactory::getApplication()->getMenu();
		$base = self::getActive();
		$user = JFactory::getUser();
		$levels = $user->getAuthorisedViewLevels();

		asort($levels);

		$path = $base->tree;
		$start = 1;
		$end = 0;
		$showAll = '1';
		$lastitem = 0;
		$hidden_parents = array();

		$attributes[] = 'menutype';
		$values[] = $menuType;

		$items = $menu->getItems($attributes, $values);

		if ($items)
		{
			foreach ($items as $i => $item)
			{
				if (( $start && $start > $item->level ) || ( $end && $item->level > $end ) ||
					 ( !$showAll && $item->level > 1 && !in_array($item->parent_id, $path) ) ||
					 ( $start > 1 && !in_array($item->tree[$start - 2], $path) ))
				{
					unset($items[$i]);

					continue;
				}

				if (!in_array($item->parent_id, $parentIDs))
				{
					unset($items[$i]);

					continue;
				}

				$parentIDs = array_merge(array(
					(int) $item->id
				), $parentIDs);

				// Exclude item with menu item option set to exclude from menu modules
				if (( $item->params->get('menu_show', 1) == 0 ) || in_array($item->parent_id, $hidden_parents))
				{
					$hidden_parents[] = $item->id;

					unset($items[$i]);

					continue;
				}

				$item->deeper = false;
				$item->shallower = false;
				$item->level_diff = 0;

				if (isset($items[$lastitem]))
				{
					$items[$lastitem]->deeper = ( $item->level > $items[$lastitem]->level );
					$items[$lastitem]->shallower = ( $item->level < $items[$lastitem]->level );
					$items[$lastitem]->level_diff = ( $items[$lastitem]->level - $item->level );
				}

				$item->parent = (boolean) $menu->getItems('parent_id', (int) $item->id, true);

				$lastitem = $i;
				$item->active = false;
				$item->flink = $item->link;

				// Reverted back for CMS version 2.5.6
				switch ($item->type)
				{
					case 'separator':
					case 'heading':
						// No further action needed.
						continue;
					break;

					case 'url':
						if (( strpos($item->link, 'index.php?') === 0 ) && ( strpos($item->link, 'Itemid=') === false ))
						{
							// If this is an internal Joomla link, ensure the Itemid is set.
							$item->flink = $item->link . '&Itemid=' . $item->id;
						}
					break;

					case 'alias':
						$item->flink = 'index.php?Itemid=' . $item->params->get('aliasoptions');
					break;

					default:
						$item->flink = 'index.php?Itemid=' . $item->id;
					break;
				}

				if (strcasecmp(substr($item->flink, 0, 4), 'http') && ( strpos($item->flink, 'index.php?') !== false ))
				{
					$item->flink = JRoute::_($item->flink, true, $item->params->get('secure'));
				}
				else
				{
					$item->flink = JRoute::_($item->flink);
				}

				// We prevent the double encoding because for some reason the $item is shared for menu modules
				// and we get double encoding when the cause of that is found the argument should be removed.
				$item->title = htmlspecialchars($item->title, ENT_COMPAT, 'UTF-8', false);
				$item->anchor_css = htmlspecialchars($item->params->get('menu-anchor_css', ''), ENT_COMPAT, 'UTF-8', false);
				$item->anchor_title = htmlspecialchars($item->params->get('menu-anchor_title', ''), ENT_COMPAT, 'UTF-8', false);
				$item->menu_image = $item->params->get('menu_image', '') ? htmlspecialchars($item->params->get('menu_image', ''),
					ENT_COMPAT, 'UTF-8', false) : '';
			}

			if (isset($items[$lastitem]))
			{
				$items[$lastitem]->deeper = ( ( $start ? $start : 1 ) > $items[$lastitem]->level );
				$items[$lastitem]->shallower = ( ( $start ? $start : 1 ) < $items[$lastitem]->level );
				$items[$lastitem]->level_diff = ( $items[$lastitem]->level - ( $start ? $start : 1 ) );
			}
		}

		return $items;
	}

	/**
	 * Render MegaMenu middle of Menu HTML
	 *
	 * @return string
	 */
	public static function middleMegaMenu($items, $parentID)
	{
		$html = '';
		$active = self::getActive();
		$path = $active->tree;
		$activeID = $active->id;
		$menuCount = count($items);
		$count = 1;
		$flag = false;

		foreach ($items as $i => &$item)
		{
			$class = 'item-' . $item->id;

			if (( $item->id == $activeID ) or ( $item->type == 'alias' and $item->params->get('aliasoptions') == $activeID ))
			{
				$class .= ' current';
			}

			if (in_array($item->id, $path))
			{
				$class .= ' active';
			}
			elseif ($item->type == 'alias')
			{
				$aliasToId = $item->params->get('aliasoptions');

				if (count($path) > 0 && $aliasToId == $path[count($path) - 1])
				{
					$class .= ' active';
				}
				elseif (in_array($aliasToId, $path))
				{
					$class .= ' alias-parent-active';
				}
			}

			if ($item->type == 'separator')
			{
				$class .= ' divider';
			}

			if ($item->deeper)
			{
				$class .= ' parent dropdown-submenu';
			}

			if ($item->shallower || $count == $menuCount)
			{
				$class .= ' last';
			}

			if (( $count == 1 ) || ( $flag == true ))
			{
				$class .= ' first';
			}

			// Icon menu
			if ($item->anchor_css)
			{
				//$class .= ' ' . $item->anchor_css;
			}

			if (!empty($class))
			{
				$class = ' class="' . trim($class) . '"';
			}

			$html .= '<li' . $class . '>';

			$flag = false;

			$item->title = html_entity_decode($item->title);

			// Render the menu item.
			switch ($item->type)
			{
				case 'separator':
					$html .= self::renderSeparatorItemLayout($item, $activeID);
				break;

				case 'url':
					$html .= self::renderUrlItemLayout($item, $activeID);
				break;

				case 'component':
					$html .= self::renderComponentItemLayout($item, $activeID);
				break;

				case 'heading':
					$html .= self::renderHeadingItemLayout($item, $activeID);
				break;

				default:
					$html .= self::renderUrlItemLayout($item, $activeID);
				break;
			}

			if ($item->deeper)
			{
				// The next item is deeper. child.
				$html .= '<ul class="dropdown-menu">';
				$flag = true;
			}
			elseif ($item->shallower && $item->parent_id != $parentID)
			{
				// The next item is shallower.
				$html .= '</li>';
				$html .= str_repeat('</ul></li>', 1);
			}
			else
			{
				// The next item is on the same level.
				$html .= '</li>';
			}

			$count++;
		}

		return $html;
	}
}
