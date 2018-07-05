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

// Import necessary libraries.
jimport('joomla.filesystem.file');
jimport('joomla.filesystem.folder');

/**
 * Installer class.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class PlgSystemSunFwInstallerScript
{

	/**
	 * Implement preflight hook.
	 *
	 * This step will be verify permission for install/update process.
	 *
	 * @param   string  $route      Route type: install, update or uninstall.
	 * @param   object  $installer  The installer object.
	 *
	 * @return  boolean
	 */
	public function preflight($route, $installer)
	{
		// Clean up obsolete files.
		if (JFolder::exists(JPATH_ROOT . '/plugins/system/sunfw'))
		{
			foreach (array(
				'1.3.1',
				'2.0.3'
			) as $update)
			{
				if (JFile::exists(JPATH_ROOT . "/plugins/system/sunfw/database/mysql/updates/{$update}.sql"))
				{
					JFile::delete(JPATH_ROOT . "/plugins/system/sunfw/database/mysql/updates/{$update}.sql");
				}
			}
		}

		// Get a database connector object.
		$dbo = JFactory::getDbo();

		// Check if the table `sunfw_styles` already exists?
		$tables = $dbo->setQuery('SHOW TABLES;')->loadColumn();

		if (in_array($dbo->getPrefix() . 'sunfw_styles', $tables))
		{
			// Prepare database updates.
			$source = $installer->getParent()->getPath('source');
			$updates = JFolder::files("{$source}/database/mysql/updates", '\.sql$');

			foreach ($updates as $update)
			{
				$update = "{$source}/database/mysql/updates/{$update}";

				if ($sql = file_get_contents($update))
				{
					if (preg_match_all('/ALTER TABLE `?[^\s]+_sunfw_styles`? ADD ([^\s]+)/i', $sql, $matches, PREG_SET_ORDER))
					{
						foreach ($matches as $match)
						{
							$column = trim($match[1], '`');

							if (!isset($columns))
							{
								$columns = $dbo->setQuery('SHOW COLUMNS FROM #__sunfw_styles;')->loadColumn();
							}

							if (in_array($column, $columns))
							{
								// Delete the database update file to prevent it from being imported by Joomla.
								JFile::delete($update);

								// Rename existing file in the target directory also.
								$update = str_replace($source, JPATH_ROOT . '/plugins/system/sunfw', $update);

								if (JFile::exists($update))
								{
									JFile::move($update, "{$update}.bak");
								}
							}
						}
					}
				}
			}

			// Get extension info of the plugin from #__extensions table.
			$info = $dbo->setQuery(
				$dbo->getQuery(true)
					->select('extension_id, manifest_cache')
					->from('#__extensions')
					->where("element = 'sunfw'")
					->where("type = 'plugin'")
					->where("folder = 'system'"))
				->loadObject();

			$manifest = json_decode($info->manifest_cache);

			// Update the plugin version in the #__schemas table.
			$dbo->setQuery(
				$dbo->getQuery(true)
					->update('#__schemas')
					->set('version_id = ' . $dbo->quote($manifest->version))
					->where('extension_id = ' . (int) $info->extension_id))
				->execute();
		}
	}

	/**
	 * Implement postflight hook.
	 *
	 * @param   string  $route      Route type: install, update or uninstall.
	 * @param   object  $installer  The installer object.
	 *
	 * @return  boolean
	 */
	public function postflight($route, $installer)
	{
		// Restore database update files at the target directory.
		if (JFolder::exists(JPATH_ROOT . '/plugins/system/sunfw'))
		{
			foreach (JFolder::files(JPATH_ROOT . '/plugins/system/sunfw/database/mysql/updates', '\.bak$') as $file)
			{
				$file = JPATH_ROOT . "/plugins/system/sunfw/database/mysql/updates/{$file}";

				JFile::move($file, substr($file, 0, -4));
			}
		}

		// Get a database connector object.
		$dbo = JFactory::getDbo();

		// Enable plugin by default.
		$dbo->setQuery(
			$dbo->getQuery(true)
				->update('#__extensions')
				->set(array(
				'enabled = 1',
				'protected = 1',
				'ordering = 0'
			))
				->where("element = 'sunfw'")
				->where("type = 'plugin'")
				->where("folder = 'system'"))
			->execute();
	}
}
