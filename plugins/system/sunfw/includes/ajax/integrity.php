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

// Import necessary Joomla libraries
jimport('joomla.filesystem.folder');
jimport('joomla.filesystem.file');

/**
 * Template update widget
 *
 * @package     SUN Framework
 * @subpackage  Template
 * @since       1.0.0
 */
class SunFwAjaxIntegrity extends SunFwAjax
{

	/**
	 * Create a backup of modified files then force user to download it.
	 *
	 * @return  void
	 */
	public function downloadAction()
	{
		// Import necessary library
		jimport('joomla.filesystem.file');
		
		if ($isUpdate = ( $this->input->getCmd('type') == 'update' ))
		{
			if (is_readable(JFactory::getConfig()->get('tmp_path') . '/sunfw-' . $this->template['id'] . '.zip'))
			{
				$backupPath = SunFwIntegrity::backup($this->template);
			}
			else
			{
				$backupPath = SunFwHelper::findLatestBackup($this->template['name']);
			}
		}
		else
		{
			$backupPath = SunFwIntegrity::backup($this->template);
		}
		
		if ((string) $backupPath == '')
		{
			// Exit immediately
			exit();
		}
		// Get path to backup file
		//$path = $this->getResponse();
		$path = $backupPath;
		
		// Force user to download backup file
		header('Content-Type: application/octet-stream');
		header('Content-Length: ' . filesize($path));
		header('Content-Disposition: attachment; filename=' . basename($path));
		header('Cache-Control: no-cache, must-revalidate, max-age=60');
		header('Expires: Sat, 01 Jan 2000 12:00:00 GMT');
		
		echo file_get_contents($path);
		
		// Exit immediately
		exit();
	}
}
