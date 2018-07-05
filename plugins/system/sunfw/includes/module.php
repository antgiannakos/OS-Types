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
 * General Module class.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwModule
{

	/**
	 * render Module
	 *
	 * @return string
	 */
	public static function render($mID)
	{
		$app = JFactory::getApplication();
		$now = JFactory::getDate()->toSql();

		$db = JFactory::getDbo();
		$nullDate = $db->getNullDate();

		$query = $db->getQuery(true);

		$query->select('m.id, m.title, m.module, m.position, m.ordering, m.content, m.showtitle, m.params, m.access')
			->from('#__modules AS m')
			->join('LEFT', '#__modules_menu AS mm ON mm.moduleid = m.id')
			->where('m.published = 1')
			->join('LEFT', '#__extensions AS e ON e.element = m.module AND e.client_id = m.client_id')
			->where('e.enabled = 1')
			->where('(m.publish_up = ' . $db->quote($nullDate) . ' OR m.publish_up <= ' . $db->quote($now) . ')')
			->where('(m.publish_down = ' . $db->quote($nullDate) . ' OR m.publish_down >= ' . $db->quote($now) . ')')
			->where('m.id=' . (int) $mID . ' AND m.client_id= ' . (int) $app->getClientId())
			->where('m.access IN (' . implode(', ', JFactory::getUser()->getAuthorisedViewLevels()) . ')')
			->where('(mm.menuid = ' . (int) $app->input->getInt('Itemid') . ' OR mm.menuid <= 0)');

		// Filter by language
		if ($app->isClient('site') && $app->getLanguageFilter())
		{
			$query->where('m.language IN (' . $db->quote(JFactory::getLanguage()->getTag()) . ', ' . $db->quote('*') . ')');
		}

		$db->setQuery($query);

		try
		{
			if (!( $module = $db->loadObject() ))
			{
				return;
			}
		}
		catch (RuntimeException $e)
		{
			return;
		}

		// Prepare module parameters.
		$params = new JRegistry();

		$params->loadString($module->params);

		$module->params = $params;

		// Prepare module class.
		$moduleclassSfx = $module->params->get('moduleclass_sfx', '');
		$header_class = $module->params->get('header_class', '');
		$icon = '';

		if (preg_match('/^(.+)?(fa fa-[^\s]+)(.+)?$/', $header_class, $match))
		{
			$header_class = $match[1] . ( empty($match[3]) ? '' : " $match[3]" );
			$icon = $match[2];
		}

		$html = '<div class="modulecontainer ' . trim($moduleclassSfx) . '">';

		$moduleHTML = JFactory::getDocument()->loadRenderer('module')->render($module, $params, $module->content);

		if (trim($moduleHTML) == '')
		{
			$html .= '<div class="alert alert-block">' . JText::sprintf('SUNFW_MODULE_HAS_NO_CONTENT', $module->title) . '</div>';
		}
		else
		{
			if ((int) $module->showtitle && $params->get('style', '0') == '0')
			{
				$html .= '<h3 class="module-title ' . $header_class . '">';

				if ($icon != '')
				{
					$html .= '<i class="' . $icon . '"></i>';
				}

				$html .= $module->title . '</h3>';
			}

			$html .= $moduleHTML;
		}

		$html .= '</div>';

		return $html;
	}
}