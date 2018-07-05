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
 * Handle Ajax requests from menu assignment pane.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwAjaxAssignment extends SunFwAjax
{

	/**
	 * Get menu assignment data from database.
	 *
	 * @param   boolean  $return  Whether to return data or send response back immediately?
	 *
	 * @return  mixed
	 */
	public function getAction($return = false)
	{
		// Load 'MenusHelper' class if needed.
		if (!class_exists('MenusHelper'))
		{
			require_once JPATH_ADMINISTRATOR . '/components/com_menus/helpers/menus.php';
		}
		
		/**
		 * Prepare response data.
		 */
		$data = array(
			'url' => $this->baseUrl,
			'userId' => (string) JFactory::getUser()->id,
			'styleId' => (string) $this->styleID,
			'menus' => MenusHelper::getMenuLinks(),
			'textMapping' => array(
				'menu-assignment' => JText::_('SUNFW_MENU_ASSIGNMENT'),
				'save-menu-assignment' => JText::_('SUNFW_SAVE_ASSIGNMENT')
			)
		);
		
		if ($return)
		{
			return $data;
		}
		
		$this->setResponse($data);
	}

	/**
	 * Save data to database
	 *
	 * @throws Exception
	 */
	public function saveAction()
	{
		// Prepare input data.
		$data = $this->input->get('data', '', 'raw');
		
		if (empty($data))
		{
			throw new Exception('Invalid Request');
		}
		
		$data = json_decode($data, true);
		$data = $data['items'];
		
		// Detect disabled extension
		$extension = JTable::getInstance('Extension');
		
		if ($extension->load(array(
			'enabled' => 0,
			'type' => 'template',
			'element' => $this->templateName,
			'client_id' => 0
		)))
		{
			throw new Exception(JText::_('SUNFW_ERROR_SAVE_DISABLED_TEMPLATE'));
		}
		
		$user = JFactory::getUser();
		
		if ($user->authorise('core.edit', 'com_menus') && is_array($data))
		{
			$data = Joomla\Utilities\ArrayHelper::toInteger($data);
			
			// Update style to menu assignments.
			if (count($data))
			{
				$query = $this->dbo->getQuery(true)
					->update('#__menu')
					->set('template_style_id = ' . (int) $this->styleID)
					->where('id IN (' . implode(',', $data) . ')')
					->where('template_style_id != ' . (int) $this->styleID)
					->where('checked_out IN (0,' . (int) $user->id . ')');
				
				$this->dbo->setQuery($query);
				
				try
				{
					$this->dbo->execute();
				}
				catch (Exception $e)
				{
					throw $e;
				}
			}
			
			// Clean all removed assignments.
			$query = $this->dbo->getQuery(true)
				->update('#__menu')
				->set('template_style_id = 0')
				->where('template_style_id = ' . (int) $this->styleID)
				->where('checked_out IN (0,' . (int) $user->id . ')');
			
			if (count($data))
			{
				$query->where('id NOT IN (' . implode(',', $data) . ')');
			}
			
			$this->dbo->setQuery($query);
			
			try
			{
				$this->dbo->execute();
			}
			catch (Exception $e)
			{
				throw $e;
			}
		}
		
		$this->setResponse(array(
			'message' => JText::_('SUNFW_MENU_ASSIGNMENT_SAVED_SUCCESSFULLY')
		));
	}
}
