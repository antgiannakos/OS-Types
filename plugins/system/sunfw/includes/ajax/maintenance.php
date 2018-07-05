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
 * Handle Ajax requests from data maintenance pane.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwAjaxMaintenance extends SunFwAjax
{

	/**
	 * Get maintenance data.
	 *
	 * @param   boolean  $return  Whether to return data or send response back immediately?
	 *
	 * @return  mixed
	 */
	public function getAction($return = false)
	{
		/**
		 * Prepare response data.
		 */
		$data = array(
			'url' => $this->baseUrl,
			'description' => JText::_('SUNFW_EXPORT_IMPORT_DESC'),
			'importLabel' => JText::_('SUNFW_ADVANCED_IMPORT'),
			'exportLabel' => JText::_('SUNFW_ADVANCED_EXPORT')
		);
		
		if ($return)
		{
			return $data;
		}
		
		$this->setResponse($data);
	}

	/**
	 * export template parameters
	 *
	 * @return  void
	 */
	public function exportAction()
	{
		// Get database and query object
		$db = JFactory::getDbo();
		$q = $db->getQuery(true);
		
		// Build query to get template style parameters
		$q->select('*');
		$q->from('#__sunfw_styles');
		$q->where('template = ' . $q->quote($this->templateName), 'AND');
		$q->where('style_id = ' . (int) $this->styleID);
		try
		{
			$db->setQuery($q);
			
			if (!( $params = $db->loadObject() ))
			{
				throw new Exception($db->getErrorMsg());
			}
		}
		catch (Exception $e)
		{
			$params = $e->getMessage();
		}
		
		$params = json_encode($params);
		
		// Force user to download backup
		header('Content-Type: application/json');
		header('Content-Length: ' . strlen($params));
		header(
			'Content-Disposition: attachment; filename=' .
				 str_replace(' ', '_', JText::sprintf('SUNFW_ADVANCED_EXPORTED_FILE_NAME', JText::_($this->templateName))) . '.json');
		header('Cache-Control: no-cache, must-revalidate, max-age=60');
		header('Expires: Sat, 01 Jan 2000 12:00:00 GMT');
		
		echo $params;
		
		// Exit immediately
		exit();
	}

	/**
	 * Import template parameters
	 *
	 * @return  void
	 */
	public function importAction()
	{
		// Check if we have backup file uploaded
		$backupFile = $this->input->files->get('sunfw-advanced-backup-upload', null, 'raw');
		
		if ($backupFile == null)
		{
			throw new Exception(JText::sprintf('SUNFW_UPLOAD_FAIL', ''));
		}
		
		// Check if file is uploaded successful
		if ($backupFile['error'] != 0)
		{
			throw new Exception(JText::sprintf('SUNFW_UPLOAD_FAIL', $backupFile['error']));
		}
		
		if (!is_file($backupFile['tmp_name']))
		{
			throw new Exception(JText::_('SUNFW_ADVANCED_RESTORE_PARAMS_PACKAGE_FILE_NOT_FOUND'));
		}
		
		if (!SunFwUtils::check_upload($backupFile['tmp_name']) || !SunFwUtils::check_xss($backupFile['tmp_name']))
		{
			JFile::delete($backupFile['tmp_name']);
			
			throw new Exception(JText::_('SUNFW_ADVANCED_RESTORE_PARAMS_INSTALLER_PACKAGE_SAVING_FAILED'));
		}
		
		// Read template parameters in uploaded file
		$params = file_get_contents($backupFile['tmp_name']);
		
		if (!$params)
		{
			throw new Exception(JText::_('SUNFW_ADVANCED_RESTORE_PARAMS_READ_FILE_FAIL'));
		}
		
		if (substr($params, 0, 1) != '{' || substr($params, -1) != '}')
		{
			throw new Exception(JText::_('SUNFW_ADVANCED_RESTORE_PARAMS_INVALID_BACKUP'));
		}
		
		$params = json_decode($params, true);
		
		unset($params['id']);
		
		$params = (object) $params;
		
		$params->id = null;
		$params->style_id = $this->styleID;
		$params->template = $this->templateName;
		
		try
		{
			$sunFwStyle = SunFwHelper::getOnlySunFwStyle($this->styleID);
			
			if (count($sunFwStyle))
			{
				$result = $this->dbo->updateObject('#__sunfw_styles', $params, 'style_id');
			}
			else
			{
				$result = $this->dbo->insertObject('#__sunfw_styles', $params, 'style_id');
			}
			
			// Re-compile Sass.
			$sufwrender = new SunFwScssrender();
			
			$sufwrender->compile($this->styleID, $this->templateName);
			$sufwrender->compile($this->styleID, $this->templateName, 'layout');
		}
		catch (Exception $e)
		{
			throw $e;
		}
		
		$this->setResponse(JText::_('SUNFW_ADVANCED_RESTORE_PARAMS_SUCCESS'));
	}
}
