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

// Import necessary Joomla libraries
jimport('joomla.filesystem.folder');
jimport('joomla.filesystem.file');

/**
 * Integrity checking, backup and download widget.
 *
 * @package     SUN Framework
 * @subpackage  Template
 * @since       1.0.0
 */
class SunFwIntegrity
{

	/**
	 * Backup all modified files
	 * $template Array Template
	 * @return  void
	 */
	public static function backup($template)
	{
		// Initialize variables
		$app = JFactory::getApplication();
		$joomlaConfig = JFactory::getConfig();
		$packageFile = $joomlaConfig->get('tmp_path') . '/sunfw-' . $template['id'] . '.zip';
		$templatePath = JPATH_ROOT . '/templates/' . $template['name'];
		$backupPath = $joomlaConfig->get('tmp_path') . '/' . $template['name'] . '_modified_files.zip';
		
		if (is_readable($packageFile))
		{
			$modifiedFiles = SunFwHelper::getModifiedFilesBeingUpdated($template['name'], $packageFile);
		}
		else
		{
			$modifiedFiles = SunFwHelper::getModifiedFiles($template['name']);
			$modifiedFiles = array_merge($modifiedFiles['add'], $modifiedFiles['edit']);
		}
		
		// Check if backup was done before
		if (!$app->getUserState('sunfw-backup-done') or !is_file($backupPath))
		{
			// Read all modified files
			foreach ($modifiedFiles as $file)
			{
				// Create array of file name and content for making archive later
				$files[] = array(
					'name' => $file,
					'data' => file_get_contents("{$templatePath}/{$file}")
				);
			}
			
			// Create backup archive
			$archiver = new SunFwArchiveZip();
			$archiver->create($backupPath, $files);
			
			// State that backup is created
			$app->setUserState('sunfw-backup-done', 1);
		}
		
		return $backupPath;
	}
}
