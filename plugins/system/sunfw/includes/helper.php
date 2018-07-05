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

// Import necessary library.
jimport('joomla.filesystem.file');

/**
 * General helper class.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwHelper
{

	protected static $templateData;

	protected static $versionData;

	/**
	 * Get manifest data from the database.
	 *
	 * @param   string   $element  Extension's element name.
	 * @param   string   $type     Either 'component', 'module', 'plugin' or 'template'.
	 * @param   string   $group    Plugin group, only needed if $type is 'plugin'.
	 * @param   boolean  $refresh  Refresh manifest data if already parsed before.
	 *
	 * @return  array
	 */
	public static function getManifestCache($element, $type = 'template', $group = null, $refresh = false)
	{
		// Get registry instance of our framework.
		$registry = JRegistry::getInstance('SunFw');
		$key = $type . ( $type == 'plugin' ? ".{$group}" : '' ) . ".{$element}.manifest_cache";

		if (!$registry->exists($key) || $refresh)
		{
			$dbo = JFactory::getDbo();
			$qry = $dbo->getQuery(true)
				->select('manifest_cache')
				->from('#__extensions')
				->where('type = ' . $dbo->quote($type))
				->where('element = ' . $dbo->quote($element));

			if ($type == 'plugin')
			{
				$qry->where('folder = ' . $dbo->quote($group));
			}

			$dbo->setQuery($qry);

			$registry->set($key, json_decode($dbo->loadResult()));
		}

		return $registry->get($key);
	}

	/**
	 * Get extension data from manifest file.
	 *
	 * @param   string   $element  Extension's element name.
	 * @param   string   $type     Either 'component', 'module', 'plugin' or 'template'.
	 * @param   string   $group    Plugin group, only needed if $type is 'plugin'.
	 * @param   boolean  $refresh  Refresh manifest data if already parsed before.
	 *
	 * @return  SimpleXMLElement
	 */
	public static function getManifest($element, $type = 'template', $group = null, $refresh = false)
	{
		// Get registry instance of our framework.
		$registry = JRegistry::getInstance('SunFw');
		$key = $type . ( $type == 'plugin' ? ".{$group}" : '' ) . ".{$element}.manifest";

		if (!$registry->exists($key) || $refresh)
		{
			// Generate path to manifest file.
			switch ($type)
			{
				case 'component':
					$manifest = JPATH_ADMINISTRATOR . "/components/{$element}/" . substr($element, 4) . '.xml';
				break;

				case 'module':
					$manifest = JPATH_SITE . "/modules/{$element}/{$element}.xml";
				break;

				case 'plugin':
					$manifest = JPATH_SITE . "/plugins/{$group}/{$element}/{$element}.xml";
				break;

				case 'template':
					$manifest = JPATH_SITE . "/templates/{$element}/templateDetails.xml";
				break;
			}

			if (empty($manifest) || !is_file($manifest))
			{
				$manifest = simplexml_load_string(
					'<?xml version="1.0" encoding="utf-8"?>
					<extension type="' . $type . '"' .
						 ( $type == 'plugin' ? ' group="' . $group . '"' : '' ) . '></extension>
				');
			}
			else
			{
				$manifest = simplexml_load_file($manifest);
			}

			// Store manifest data to our framework's registry instance.
			$registry->set($key, $manifest);
		}

		return $registry->get($key);
	}

	/**
	 * Get Template Home By Name
	 *
	 * @param string $template	Template name
	 *
	 * @return (object)
	 */
	public static function getTemplateStyleByName($template)
	{
		static $styles;

		if (!isset($styles) || !isset($styles[$template]))
		{
			$db = JFactory::getDbo();
			$q = $db->getQuery(true);

			$q->select('*')
				->from($db->quoteName('#__template_styles'))
				->where('client_id = 0 AND home = 1')
				->where('template = ' . $db->quote($template));

			$db->setQuery($q);

			try
			{
				$styles[$template] = $db->loadObject();
			}
			catch (Exception $e)
			{
				return false;
			}
		}

		return $styles[$template];
	}

	/**
	 * Get template style from database.
	 *
	 * @param   int  $id  The style id.
	 *
	 * @return  mixed  An object on success, boolean FALSE otherwise.
	 */
	public static function getTemplateStyle($id)
	{
		$db = JFactory::getDbo();
		$q = $db->getQuery(true);

		$q->select('*')
			->from($db->quoteName('#__template_styles'))
			->where($db->quoteName('id') . '=' . intval($id));

		$db->setQuery($q);

		try
		{
			$result = $db->loadObject();
		}
		catch (Exception $e)
		{
			return false;
		}

		return $result;
	}

	/**
	 * Get template framework parameters from database.
	 *
	 * @param   int  $id  The style id.
	 *
	 * @return  mixed  An object on success, boolean FALSE otherwise.
	 */
	public static function getSunFwStyle($id)
	{
		$db = JFactory::getDbo();
		$q = $db->getQuery(true);

		$q->select('ss.*')
			->from('#__sunfw_styles AS ss')
			->join('INNER', '#__template_styles AS ts ON ts.id = ss.style_id')
			->where('ts.id = ' . intval($id));

		$db->setQuery($q);

		try
		{
			$result = $db->loadObject();
		}
		catch (Exception $e)
		{
			return false;
		}

		return $result;
	}

	/**
	 * Get list of directory to look for prebuilt layouts.
	 *
	 * @param   string   $template  The template to get prebuilt layout directories for.
	 * @param   boolean  $saving    Whether or not to get directories for saving prebuilt layout?
	 *
	 * @return  array
	 */
	public static function getLayoutDirectories($template, $saving = false)
	{
		// Define default directories to look for prebuilt layouts.
		$directories = array(
			JPATH_SITE . "/templates/{$template}/layouts",
			JPATH_SITE . "/media/{$template}/layouts"
		);

		// If not saving a prebuilt layout, prepend the 'layouts' directory in framework to the list.
		if (!$saving)
		{
			array_unshift($directories, SUNFW_PATH . '/layouts');
		}

		return $directories;
	}

	/**
	 * Get list of directory to look for prebuilt styles.
	 *
	 * @param   string   $template  The template to get prebuilt style directories for.
	 * @param   boolean  $saving    Whether or not to get directories for saving prebuilt style?
	 *
	 * @return  array
	 */
	public static function getStyleDirectories($template, $saving = false, $style = array())
	{
		// Define default directories to look for prebuilt styles.
		$niche = '';
		$directories = array();

		if (count($style))
		{
			if ($style->system_data != '')
			{
				$systemData = json_decode($style->system_data, true);
				if (isset($systemData['niche-style']) && $systemData['niche-style'] != '')
				{
					$niche = $systemData['niche-style'];
				}
			}
		}

		if ($niche != '')
		{
			$directories[] = JPATH_SITE . "/templates/{$template}/niches/{$niche}/styles";
		}
		else
		{
			$directories[] = JPATH_SITE . "/templates/{$template}/styles";
			$directories[] = JPATH_SITE . "/media/{$template}/styles";
		}

		// If not saving a prebuilt style, prepend the 'styles' directory in framework to the list.
		if (!$saving && $niche == '')
		{
			array_unshift($directories, SUNFW_PATH . '/styles');
		}

		return $directories;
	}

	/**
	 * Get writable directory.
	 *
	 * @param   array  $directories  List of directory to search for writable one.
	 *
	 * @return  string  The first writable directory in the provided list.
	 *                  Boolean FALSE will be returned if no any directory is writable.
	 */
	public static function getWritableDirectory($directories)
	{
		foreach ((array) $directories as $directory)
		{
			// If directory not exists, create it.
			if (!JFolder::exists($directory))
			{
				if (!JFolder::create($directory))
				{
					continue;
				}
			}

			// If the directory is not writable, try to alter it.
			if (!is_writable($directory))
			{
				// Try to change ownership of the directory.
				$user = get_current_user();

				chown($directory, $user);

				if (!JPath::setPermissions($directory, '0644'))
				{
					continue;
				}

				if (!JPath::isOwner($directory))
				{
					continue;
				}
			}

			return $directory;
		}

		return false;
	}

	/**
	 * Get all available menus and languages.
	 *
	 * @param   boolean  $include_items  Whether or not to get items for every menu?
	 * @param   boolean  $level          The number of level of menu items in the tree to retrieve.
	 *
	 * @return  array
	 */
	public static function getAllAvailableMenus($include_items = false, $level = 1)
	{
		$languageExisting = self::getExistingLanguageList();

		// Get Joomla's database object.
		$dbo = JFactory::getDbo();

		// Get list of menu type.
		$query = $dbo->getQuery(true);
		$query->select('menutype as value, title as text')
			->from($dbo->quoteName('#__menu_types'))
			->order('title');

		$dbo->setQuery($query);

		$menus = $dbo->loadObjectList();

		// Get list of published menu.
		$query = $dbo->getQuery(true);
		$query->select('menutype, language')
			->from($dbo->quoteName('#__menu'))
			->where($dbo->quoteName('published') . ' = 1')
			->group('menutype');

		$dbo->setQuery($query);

		$menuLangs = $dbo->loadAssocList('menutype');

		// Get home menu.
		$query = $dbo->getQuery(true);
		$query->select('menutype, language')
			->from($dbo->quoteName('#__menu'))
			->where($dbo->quoteName('home') . ' = 1')
			->where($dbo->quoteName('published') . ' = 1');

		$dbo->setQuery($query);

		$homeLangs = $dbo->loadAssocList('menutype');

		// Prepare return data.
		if (is_array($menuLangs) && is_array($homeLangs))
		{
			array_unshift($menuLangs, $homeLangs);

			$menuLangs = array_unique($menuLangs, SORT_REGULAR);
		}

		if (is_array($menus) && is_array($menuLangs))
		{
			foreach ($menus as & $menu)
			{
				$menu->text = $menu->text . ' [' . $menu->value . ']';
				$menu->language = isset($menuLangs[$menu->value]) ? $menuLangs[$menu->value]['language'] : '*';
				$menu->language_text = isset($languageExisting[$menu->language]) ? $languageExisting[$menu->language]['text'] : $menu->language;

				if ($include_items)
				{
					// Get all items for the current menu.
					$query = $dbo->getQuery(true);
					$query->select('id, title, level')
						->from($dbo->quoteName('#__menu'))
						->where($dbo->quoteName('menutype') . ' = ' . $dbo->quote($menu->value))
						->where($dbo->quoteName('level') . ' <= ' . intval($level))
						->where($dbo->quoteName('published') . ' = 1')
						->order('lft');

					$dbo->setQuery($query);

					$menu->items = $dbo->loadObjectList();
				}
			}
		}
		return $menus;
	}

	/**
	 * Get Default module style
	 *
	 * @param int $styleID
	 *
	 * @return array
	 */
	public static function getDefaultModuleStyle($styleID)
	{
		$style = self::getTemplateStyle($styleID);
		$file = JPath::clean(JPATH_SITE . "/templates/{$style->template}/module-styles/default_styles.json");
		$result = array();

		if (JFile::exists($file))
		{
			$content = file_get_contents($file);
			$content = trim($content);
			$result = json_decode($content, true);
		}

		return $result;
	}

	/**
	 * Return the template Identied Name
	 *
	 * @param   string  $name  The template name
	 *
	 * @return  string
	 */
	public static function getTemplateIdentifiedName($name)
	{
		if ($details = SunFwRecognization::detect($name))
		{
			return strtolower("tpl_{$details->name}");
		}

		// Backward compatible
		$manifest = self::getManifest($name);

		if (isset($manifest->identifiedName))
		{
			return (string) $manifest->identifiedName;
		}
	}

	/**
	 * Get template version.
	 *
	 * @param   string  $template  Name of template directory.
	 *
	 * @return  string
	 */
	public static function getTemplateVersion($template)
	{
		if (class_exists('SunFwRecognization') and $details = SunFwRecognization::detect($template))
		{
			return $details->version;
		}

		// Backward compatible
		$version = self::getManifestCache($template);
		$version = $version->version;

		return $version;
	}

	/**
	 * Retrieve edition of the template that determined by name
	 *
	 * @param   string  $name  The template name to retrieve edition
	 * @return  string
	 */
	public static function getTemplateEdition($name)
	{
		if (class_exists('SunFwRecognization') and $details = SunFwRecognization::detect($name))
		{
			return $details->edition;
		}

		// Backward compatible
		$registry = JRegistry::getInstance('SunFw');

		if ($registry->exists('template.edition'))
		{
			return $registry->get('template.edition');
		}

		$manifest = self::getManifest($name);
		$edition = isset($manifest->edition) ? (string) $manifest->edition : 'FREE';

		$registry->set('template.edition', $edition);

		return $edition;
	}

	/**
	 * Download templates information data from JoomlaShine server
	 *
	 * @return  object
	 */
	public static function getVersionData()
	{
		if (empty(self::$versionData))
		{
			$http = new JHttp();
			$data = $http->get(SUNFW_VERSIONING_URL . '?category=cat_template');

			self::$versionData = json_decode($data->body, true);
		}

		// Return result
		return self::$versionData;
	}

	/**
	 * Check Open SSL
	 * @return boolean
	 */
	public static function isDisabledOpenSSL()
	{
		if (!function_exists("extension_loaded") || !extension_loaded("openssl"))
		{
			return true;
		}
		return false;
	}

	/**
	 * Retrieve current version of Joomla
	 *
	 * @return  string
	 */
	public static function getJoomlaVersion($size = null, $includeDot = true)
	{
		$joomlaVersion = new JVersion();
		$versionPieces = explode('.', $joomlaVersion->getShortVersion());

		if (is_numeric($size) && $size > 0 && $size < count($versionPieces))
		{
			$versionPieces = array_slice($versionPieces, 0, $size);
		}

		return implode($includeDot === true ? '.' : '', $versionPieces);
	}

	/**
	 *
	 * @return boolean [description]
	 */
	public static function isDisabledFunction($name)
	{
		return !( function_exists($name) and !ini_get('safe_mode') );
	}

	/**
	 * List all modified files that are being updated.
	 *
	 * @param   string  $template  The template name
	 * @param   string  $path      Path to downloaded template update package
	 *
	 * @return  mixed
	 */
	public static function getModifiedFilesBeingUpdated($template, $path)
	{
		$modifiedFiles = array();

		// Get list of files being updated
		if ($filesBeingUpdated = self::getFilesBeingUpdated($template, $path))
		{
			// Merge difference type of modification
			$filesBeingUpdated = call_user_func_array('array_merge', $filesBeingUpdated);

			// Now check if any file being updated is manually modified by user
			foreach (self::getModifiedFiles($template) as $k => $v)
			{
				if ($k != 'delete')
				{
					foreach ($v as $file)
					{
						if (in_array($file, $filesBeingUpdated))
						{
							$modifiedFiles[] = $file;
						}
					}
				}
			}
		}

		return $modifiedFiles;
	}

	/**
	 * List all files that are being updated.
	 *
	 * @param   string  $template  The template name
	 * @param   string  $path      Path to downloaded template update package
	 *
	 * @return  mixed
	 */
	public static function getFilesBeingUpdated($template, $path)
	{
		jimport('joomla.filesystem.archive');

		// Extract template update package
		$file = $path;
		$path = dirname($file) . '/' . substr(basename($file), 0, -4);

		if (!JArchive::extract($file, $path))
		{
			throw new Exception(JText::_('SUNFW_ERROR_DOWNLOAD_PACKAGE_FILE_NOT_FOUND'));
		}

		// Read checksum file included in update package
		$checksumFile = $path . '/template/template.checksum';

		// Backward compatible
		if (!file_exists($checksumFile))
		{
			$checksumFile = $path . '/template.checksum';
		}

		if (!is_readable($checksumFile))
		{
			return false;
		}

		$files = file_get_contents($checksumFile);
		$newHash = array();

		// Parse all hash data from checksum file
		foreach (explode("\n", $files) as $line)
		{
			$line = trim($line);

			if (!empty($line) and strpos($line, "\t") !== false)
			{
				list($path, $hash) = explode("\t", $line);
				$newHash[$path] = $hash;
			}
		}

		// Read checksum file of currently installed template
		$checksumFile = JPATH_SITE . "/templates/{$template}/template.checksum";

		if (is_readable($checksumFile))
		{
			$files = file_get_contents($checksumFile);
			$oldHash = array();

			// Parse all hash data from checksum file
			foreach (explode("\n", $files) as $line)
			{
				$line = trim($line);

				if (!empty($line) and strpos($line, "\t") !== false)
				{
					list($path, $hash) = explode("\t", $line);
					$oldHash[$path] = $hash;
				}
			}

			// Preset some arrays
			$addedFiles = array();
			$changedFiles = array();
			$removedFiles = array();

			foreach ($oldHash as $path => $checkum)
			{
				// Check if file is removed
				if (!isset($newHash[$path]))
				{
					$removedFiles[] = $path;
				}

				// Check if file is changed
				elseif (isset($newHash[$path]) && $checkum != $newHash[$path])
				{
					$changedFiles[] = $path;
				}
			}

			foreach ($newHash as $path => $checkum)
			{
				// Check if file is newly added
				if (!isset($oldHash[$path]))
				{
					$addedFiles[] = $path;
				}
			}

			return array(
				'add' => $addedFiles,
				'edit' => $changedFiles,
				'delete' => $removedFiles
			);
		}

		return array(
			'edit' => array_keys($newHash)
		);
	}

	/**
	 * List all modified files of the template
	 *
	 * @param   string  $template  The template name
	 *
	 * @return  mixed
	 */
	public static function getModifiedFiles($template)
	{
		jimport('joomla.filesystem.folder');

		// Find all files in template folder
		$templatePath = JPATH_SITE . "/templates/{$template}";
		$currentFiles = JFolder::files($templatePath, '.', true, true);

		// Define pattern of file to be excluded
		$exclude = '#(/*backups?/|template\.checksum|template\.defines\.php|templateDetails\.xml|editions\.json|\.svn|CVS|language)#';

		foreach ($currentFiles as $k => $file)
		{
			// Fine-tune file path
			$file = str_replace(DIRECTORY_SEPARATOR, '/', str_replace('\\', '/', $file));
			$file = ltrim(substr($file, strlen($templatePath)), '/');

			if (preg_match($exclude, $file))
			{
				unset($currentFiles[$k]);
			}
			else
			{
				$currentFiles[$k] = $file;
			}
		}

		// Read checksum file.
		$checksumFile = $templatePath . '/template.checksum';

		if (is_file($checksumFile))
		{
			$files = file_get_contents($checksumFile);
			$hashTable = array();

			// Parse all hash data from checksum file
			foreach (explode("\n", $files) as $line)
			{
				$line = trim($line);

				if (!empty($line) and strpos($line, "\t") !== false)
				{
					list($path, $hash) = explode("\t", $line);
					$hashTable[$path] = $hash;
				}
			}

			// Check state of current files
			$addedFiles = array();
			$changedFiles = array();
			$deletedFiles = array();
			$originalFiles = array();

			foreach ($currentFiles as $file)
			{
				if (JFile::exists($file))
				{
					$fileMd5 = md5_file($file);

					// Checking file is added
					if (!isset($hashTable[$file]))
					{
						$addedFiles[] = $file;
					}

					// Checking file is changed
					elseif (isset($hashTable[$file]) && $fileMd5 != $hashTable[$file])
					{
						$changedFiles[] = $file;
					}

					// Checking file is original
					elseif (isset($hashTable[$file]) && $fileMd5 == $hashTable[$file])
					{
						$originalFiles[] = $file;
					}
				}
			}

			$templateFiles = array_merge($addedFiles, $changedFiles, $originalFiles);
			$templateFiles = array_unique($templateFiles);

			// Find all deleted files
			foreach (array_keys($hashTable) as $item)
			{
				if (!preg_match($exclude, $item))
				{
					if (!in_array($item, $templateFiles))
					{
						$deletedFiles[] = $item;
					}
				}
			}

			return array(
				'add' => $addedFiles,
				'edit' => $changedFiles,
				'delete' => $deletedFiles
			);
		}

		return array(
			'edit' => array_values($currentFiles)
		);
	}

	/**
	 * Find latest backup file
	 *
	 * @param   string  $template  Name of template to find backup files
	 *
	 * @return  array
	 */
	public static function findLatestBackup($template)
	{
		$templatePath = JPATH_ROOT . '/templates/' . $template . '/backups';
		$backupFile = null;

		$zipFiles = glob($templatePath . '/*_modified_files.zip');

		if ($zipFiles !== false)
		{
			foreach ($zipFiles as $file)
			{
				if ($backupFile == null or filemtime($backupFile) < filemtime($file))
				{
					$backupFile = $file;
				}
			}
		}

		return $backupFile;
	}

	/**
	 * Get sample data definition for a template.
	 *
	 * @param   string  $id  Template's identified name at JoomlaShine.
	 *
	 * @return  array
	 */
	public static function getSampleDataList($template)
	{
		static $samples;

		// Get template info.
		$template = SunFwRecognization::detect($template);

		if (!isset($samples) || !isset($samples[$template->id]))
		{
			// Look for sample data definition file in temporary directory first.
			$define = JFactory::getConfig()->get('tmp_path') . "/{$template->id}/sample-data.json";

			if (is_file($define) && ( time() - filemtime($define) < 3600 ) && ( $data = json_decode(file_get_contents($define), true) ))
			{
				$samples[$template->id] = $data;
			}
			else
			{
				// Get sample data definition from server.
				try
				{
					$http = new JHttp();
					$data = $http->get("https://www.joomlashine.com/sunfwdata/sampledata/templates/{$template->id}.json");

					if ($samples[$template->id] = json_decode($data->body, true))
					{
						// Create a temporary file to hold sample data definition.
						JFile::write($define, $data->body);
					}
				}
				catch (Exception $e)
				{
					return array();
				}
			}
		}

		return $samples[$template->id] ? $samples[$template->id] : array();
	}

	/**
	 * Check if an extension is installed.
	 *
	 * @param   string  $name  The name of extension.
	 * @param   string  $type  Either 'component', 'module' or 'plugin'.
	 *
	 * @return  boolean
	 */
	public static function isExtensionInstalled($name, $type = 'component')
	{
		$installedExtensions = self::findInstalledExtensions();

		// Check if plugin folder is not included in type?
		if ('plugin' == $type)
		{
			foreach ($installedExtensions as $_type => $exts)
			{
				if (0 === strpos($_type, 'plugin') && isset($installedExtensions[$_type][$name]))
				{
					return true;
				}
			}
		}

		// Check if extension of the specified type is installed?
		if (isset($installedExtensions[$type]) && isset($installedExtensions[$type][$name]))
		{
			// Make sure extension exists in file system also.
			if ('component' == $type)
			{
				return ( @is_dir(JPATH_ADMINISTRATOR . '/components/' . $name) && @is_dir(JPATH_ROOT . '/components/' . $name) );
			}
			elseif ('module' == $type)
			{
				return ( @is_dir(JPATH_ADMINISTRATOR . '/modules/' . $name) || @is_dir(JPATH_ROOT . '/modules/' . $name) );
			}
			elseif (0 === strpos($type, 'plugin-'))
			{
				@list($type, $group) = explode('-', $type, 2);

				return @is_dir(JPATH_ROOT . '/plugins/' . $group . '/' . $name);
			}
		}

		return false;
	}

	/**
	 * Fetch all installed extensions from the Joomla database.
	 *
	 * @return  array
	 */
	public static function findInstalledExtensions()
	{
		$registry = JRegistry::getInstance('SunFw');

		$installedExtensions = $registry->get('extensions.installed', array());

		if (!count($installedExtensions))
		{
			$db = JFactory::getDbo();
			$q = $db->getQuery(true);

			$q->select('type, element, folder, manifest_cache')
				->from('#__extensions')
				->where('type IN ("component", "plugin", "module")');

			$db->setQuery($q);

			foreach ($db->loadObjectList() as $extension)
			{
				if ('plugin' == $extension->type)
				{
					$installedExtensions["plugin-{$extension->folder}"][$extension->element] = json_decode($extension->manifest_cache);
				}
				else
				{
					$installedExtensions[$extension->type][$extension->element] = json_decode($extension->manifest_cache);
				}
			}

			$registry->set('extensions.installed', $installedExtensions);
		}

		return $installedExtensions;
	}

	/**
	 * Get extension parameters stored in the 'extensions' table.
	 *
	 * @param   string  $type     Either 'component', 'module', 'plugin' or 'template'.
	 * @param   string  $element  Extension's element name.
	 * @param   string  $group    Plugin group, required for 'plugin'.
	 *
	 * @return  array
	 */
	public static function getExtensionParams($type, $element, $group = '')
	{
		$dbo = JFactory::getDbo();
		$q = $dbo->getQuery(true);

		$q->select('params')
			->from('#__extensions')
			->where('type = ' . $q->quote($type))
			->where('element = ' . $q->quote($element));

		if ('plugin' == $type)
		{
			$q->where('folder = ' . $q->quote($group));
		}

		$dbo->setQuery($q);

		if (!( $params = json_decode($dbo->loadResult(), true) ))
		{
			$params = array();
		}

		return $params;
	}

	/**
	 * Update extension parameters stored in the 'extensions' table.
	 *
	 * @param   array   $params   Array of parameters.
	 * @param   string  $type     Either 'component', 'module', 'plugin' or 'template'.
	 * @param   string  $element  Extension's element name.
	 * @param   string  $group    Plugin group, required for 'plugin'.
	 *
	 * @return  array
	 */
	public static function updateExtensionParams($params, $type, $element, $group = '')
	{
		// Get current extension params.
		$curParams = self::getExtensionParams($type, $element, $group);

		// Then merge with new params.
		$params = array_merge($curParams, $params);

		// Store to database.
		$dbo = JFactory::getDbo();
		$q = $dbo->getQuery(true);

		$q->update('#__extensions')
			->set('params = ' . $q->quote(json_encode($params)))
			->where('type = ' . $q->quote($type))
			->where('element = ' . $q->quote($element));

		if ('plugin' == $type)
		{
			$q->where('folder = ' . $q->quote($group));
		}

		$dbo->setQuery($q);

		$dbo->execute();

		return $params;
	}

	/**
	 * Write manifest data to templateDetails.xml file.
	 *
	 * @param   string   $template  The template to write manifest for.
	 * @param   mixed    $xml       XML data to write to templateDetails.xml file.
	 *
	 * @return  boolean
	 */
	public static function updateManifest($template, $xml)
	{
		// Generate path to templateDetails.xml file.
		$file = JPath::clean(JPATH_SITE . "/templates/{$template}/templateDetails.xml");

		// Prepare template's manifest file for writting if requested.
		if (!is_writable($file))
		{
			// Try to change ownership of the file.
			$user = get_current_user();

			chown($file, $user);

			if (!JPath::setPermissions($file, '0644'))
			{
				throw new Exception(JText::sprintf('SUNFW_FILE_NOT_WRITABLE', 'templateDetails.xml'));
			}

			if (!JPath::isOwner($file))
			{
				throw new Exception(JText::_('SUNFW_CHECK_FILE_OWNERSHIP'));
			}
		}

		// Prepare XML data.
		if (is_object($xml) && is_a($xml, 'SimpleXMLElement'))
		{
			$xml = dom_import_simplexml($xml)->ownerDocument;

			$xml->formatOutput = true;

			$xml = $xml->saveXML();
		}

		if (!is_string($xml))
		{
			throw new Exception(JText::_('SUNFW_INVALID_XML_DATA_FOR_MANIFEST_FILE'));
		}

		if (!JFile::write($file, $xml))
		{
			throw new Exception(JText::sprintf('SUNFW_ERROR_FAILED_TO_SAVE_FILENAME', 'templateDetails.xml'));
		}
	}

	/**
	 * Get layout data.
	 *
	 * @param   object  $style     Template style data.
	 * @param   string  $template  Name of template folder.
	 *
	 * @return  array
	 */
	public static function getLayoutData($style, $template)
	{
		$layout = array();

		if ($style && !empty($style->layout_builder_data))
		{
			$layout = json_decode($style->layout_builder_data, true);
		}

		if (!$layout || !count($layout))
		{
			// Look for default layout.
			$manifest = self::getManifest($template);
			$default = ( isset($manifest->defaultLayout) ? (string) $manifest->defaultLayout : 'Default' );
			$layoutFile = '';

			// Get path to layout file.
			foreach (self::getLayoutDirectories($template) as $dir)
			{
				if (is_file("{$dir}/{$default}.json"))
				{
					$layoutFile = "{$dir}/{$default}.json";
				}
			}

			if (!empty($layoutFile))
			{
				$layout = json_decode(file_get_contents($layoutFile), true);

				// Set applied layout.
				$layout['appliedLayout'] = $default;
			}
		}

		return $layout;
	}

	/**
	 * Get style data.
	 *
	 * @param   object  $style     Template style data.
	 * @param   string  $template  Name of template folder.
	 *
	 * @return  array
	 */
	public static function getStyleData($style, $template)
	{
		$data = array();

		if ($style && !empty($style->appearance_data))
		{
			$data = json_decode($style->appearance_data, true);
		}

		if (!$data || !count($data))
		{
			// Look for default style.
			$manifest = self::getManifest($template);
			$default = ( isset($manifest->defaultStyle) ? (string) $manifest->defaultStyle : 'Default' );
			$styleFile = '';

			// Get path to style file.
			foreach (self::getStyleDirectories($template) as $dir)
			{
				if (is_file("{$dir}/{$default}.json"))
				{
					$styleFile = "{$dir}/{$default}.json";
				}
			}

			if (empty($styleFile) && is_file(SUNFW_PATH . '/styles/default.json'))
			{
				$default = 'default';
				$styleFile = SUNFW_PATH . '/styles/default.json';
			}

			if (!empty($styleFile))
			{
				$data = json_decode(file_get_contents($styleFile), true);

				// Set applied style.
				$data['appliedStyle'] = $default;
			}
		}

		// Backward compatible.
		if ($data && isset($data['appearance']))
		{
			$data = $data['appearance'];
		}

		return $data;
	}

	/**
	 * Get active niche style for the current page.
	 *
	 * @return  string
	 */
	public static function getActiveNicheStyle()
	{
		static $niche;

		if (!isset($niche))
		{
			// Get active template.
			$template = JFactory::getApplication()->getTemplate(true);

			if (!isset($template->id))
			{
				$tmpTemplate = self::getTemplateStyleByName($template->template);
				$template->id = $tmpTemplate->id;
			}

			// Get current style.
			$style = self::getSunFwStyle($template->id);

			if (!empty($style->system_data) && ( $data = json_decode($style->system_data, true) ))
			{
				if (isset($data['niche-style']) && !empty($data['niche-style']))
				{
					$niche = $data['niche-style'];
				}
			}
		}

		return $niche ? $niche : '';
	}

	/**
	 * Make a nested path , creating directories down the path
	 * recursion !!
	 *
	 * @param   string  $path  Path to create directories
	 *
	 * @return  void
	 */
	public static function makePath($path)
	{
		// Check if directory already exists
		if (is_dir($path) or empty($path))
		{
			return true;
		}

		// Ensure a file does not already exist with the same name
		$path = str_replace(array(
			'/',
			'\\'
		), DIRECTORY_SEPARATOR, $path);

		if (is_file($path))
		{
			trigger_error('A file with the same name already exists', E_USER_WARNING);
			return false;
		}

		// Crawl up the directory tree
		$nextPath = substr($path, 0, strrpos($path, DIRECTORY_SEPARATOR));

		if (self::makePath($nextPath))
		{
			if (!is_dir($path))
			{
				return JFolder::create($path);
			}
		}

		return false;
	}

	/**
	 * Get template Parameters
	 *
	 * @param string $templateName		the template name
	 * @return Ambigous <multitype:, mixed>|multitype:
	 */
	public static function getTemplateParams($templateName)
	{
		static $templateParams;

		if (!isset($templateParams))
		{
			$dbo = JFactory::getDbo();
			$q = $dbo->getQuery(true);
			$q->select('params')
				->from('#__extensions')
				->where('type = ' . $q->quote('template'))
				->where('element = ' . $q->quote($templateName));
			$dbo->setQuery($q);

			try
			{
				if (!( $params = json_decode($dbo->loadResult(), true) ))
				{
					$params = array();
				}

				$templateParams = $params;
			}
			catch (Exception $e)
			{
				$templateParams = array();
			}
		}
		return $templateParams ? $templateParams : array();
	}

	/**
	 * Delete Orphan Style
	 *
	 * @return boolean
	 */
	/*public static function deleteOrphanStyle()
	 {
	 $app = JFactory::getApplication();
	 if (!$app->isClient('administrator'))
	 {
	 return false;
	 }

	 $user = JFactory::getUser();
	 if (!$user->authorise('core.admin'))
	 {
	 return false;
	 }

	 $db = JFactory::getDbo();
	 $query	= $db->getQuery(true);
	 $query->select('id');
	 $query->from($db->quoteName('#__template_styles'));
	 $db->setQuery($query);
	 $templateIDs = $db->loadColumn();


	 if (!count($templateIDs)) return false;

	 $q	= $db->getQuery(true);
	 $q->select('style_id');
	 $q->from($db->quoteName('#__sunfw_styles'));
	 $db->setQuery($q);
	 $styleIDs = $db->loadColumn();

	 if (!count($styleIDs)) return false;

	 //get style ids not in template ids
	 $check = array_diff($styleIDs,$templateIDs);

	 if (count($check))
	 {
	 self::deleteOrphanCssFile($check);

	 $commaSeparated = implode(",", $check);

	 if ($commaSeparated != '')
	 {
	 $query = $db->getQuery(true);

	 $conditions = array(
	 $db->quoteName('style_id') . ' IN (' . $commaSeparated . ")"
	 );

	 $query->delete($db->quoteName('#__sunfw_styles'));
	 $query->where($conditions);
	 $db->setQuery($query);

	 try
	 {
	 $result = $db->execute();
	 }
	 catch (Exception $e)
	 {
	 return false;
	 }
	 }
	 }

	 return true;
	 }*/

	/**
	 * Delete Orpan CssFile
	 *
	 * @param array $styleIDs the style ID
	 */
	public static function deleteOrphanCssFile($styleIDs)
	{
		$fileName = array(
			'general',
			'layout',
			'modules',
			'menu',
			'sections'
		);

		//getTemplateStyle
		if (count($styleIDs))
		{
			foreach ($styleIDs as $styleID)
			{
				$templateStyle = self::getOnlySunFwStyle($styleID);

				if (count($templateStyle))
				{
					$templateName = $templateStyle->template;
					$path = JPATH_ROOT . '/templates/' . $templateName . '/css/core/';

					foreach ($fileName as $file)
					{
						$filePath = $path . $file . '_' . md5($styleID) . '.css';

						if (JFile::exists($filePath))
						{
							JFile::delete($filePath);
						}
					}
				}
			}
		}
	}

	/**
	 * Get template framework parameters from database.
	 *
	 * @param   string  $id  The template name.
	 *
	 * @return  mixed  An object on success, boolean FALSE otherwise.
	 */
	public static function getSunFwStyleListByName($templateName)
	{
		$db = JFactory::getDbo();
		$q = $db->getQuery(true);

		$q->select('*')
			->from($db->quoteName('#__sunfw_styles'))
			->where($db->quoteName('template') . '=' . $db->quote($templateName));

		$db->setQuery($q);

		try
		{
			$result = $db->loadObjectList();
		}
		catch (Exception $e)
		{
			return false;
		}

		return $result;
	}

	/**
	 * Delete Orphan Style
	 *
	 * @return boolean
	 */
	public static function deleteOrphanStyle($styleIDs)
	{
		//get style ids not in template ids
		$check = $styleIDs;
		$db = JFactory::getDbo();

		if (count($check))
		{
			self::deleteOrphanCssFile($check);

			$commaSeparated = implode(",", $check);

			if ($commaSeparated != '')
			{
				$query = $db->getQuery(true);

				$conditions = array(
					$db->quoteName('style_id') . ' IN (' . $commaSeparated . ")"
				);

				$query->delete($db->quoteName('#__sunfw_styles'));
				$query->where($conditions);
				$db->setQuery($query);

				try
				{
					$result = $db->execute();
				}
				catch (Exception $e)
				{
					return false;
				}
			}
		}

		return true;
	}

	/**
	 * Get template framework parameters from database.
	 *
	 * @param   int  $id  The style id.
	 *
	 * @return  mixed  An object on success, boolean FALSE otherwise.
	 */
	public static function getOnlySunFwStyle($id)
	{
		$db = JFactory::getDbo();
		$q = $db->getQuery(true);

		$q->select('*')
			->from($db->quoteName('#__sunfw_styles'))
			->where($db->quoteName('style_id') . '=' . intval($id));

		$db->setQuery($q);

		try
		{
			$result = $db->loadObject();
		}
		catch (Exception $e)
		{
			return false;
		}

		return $result;
	}

	/**
	 * Get Joomla's menu list
	 *
	 *  @return array
	 */
	public static function getExistingLanguageList()
	{
		$result = array();
		$languages = JHtml::_('contentlanguage.existing');

		if (count($languages))
		{
			foreach ($languages as $language)
			{
				$result[$language->value] = (array) $language;
			}
		}

		return $result;
	}

	/**
	 * Synchorinize color values with main and sub color defined in styles data.
	 *
	 * @param   mixed    $src       Either ID of a template style or styles data.
	 * @param   array    $data      Data for synchronizing color values.
	 * @param   string   $template  Template being edited.
	 * @param   boolean  $edit      Whether synchronize color values for editing.
	 *
	 * @return  array
	 */
	public static function synchronizeColorValues($src, $data, $template = null, $edit = false)
	{
		// Prepare data array.
		if (is_string($data))
		{
			$data = json_decode($data, true);
		}

		if (!is_array($data))
		{
			return;
		}

		// Get value of main and sub color.
		$colors = array();

		if (is_integer($src) || ( is_string($src) && preg_match('/^\d+$/', $src) ))
		{
			$src = self::getStyleData(self::getSunFwStyle((int) $src), $template);

			if (!$src)
			{
				return $data;
			}
		}
		elseif (is_string($src))
		{
			$src = json_decode($src, true);
		}

		if (!is_array($src) || !is_array($src['general']) || !isset($src['general']['color']))
		{
			return $data;
		}

		$colors['main'] = $src['general']['color']['main-color'];
		$colors['sub'] = $src['general']['color']['sub-color'];

		// Loop thru data array to set values for color related parameters.
		foreach ($data as $k => $v)
		{
			if (in_array($k, array(
				'main-color',
				'sub-color'
			)))
			{
				continue;
			}

			if (is_array($v))
			{
				$data[$k] = self::synchronizeColorValues($src, $v, $template, $edit);
			}
			elseif (preg_match('/(bg|color|border|background|bg[-_]*color|border[-_]*color|background[-_]*color)/i', $k))
			{
				switch ($v)
				{
					case 'main':
						$data[$k] = $colors['main'];
					break;

					case 'sub':
						$data[$k] = $colors['sub'];
					break;

					default:
						if ($edit)
						{
							if ($v == $colors['main'])
							{
								$data[$k] = 'main';
							}
							elseif ($v == $colors['sub'])
							{
								$data[$k] = 'sub';
							}
						}
					break;
				}
			}
		}

		return $data;
	}

	/**
	 * Get list of template admin's JSON settings file in a directory.
	 *
	 * @param   mixed    $paths   Either a directory or list of directory to scan for JSON file.
	 * @param   string   $filter  A string to filter JSON file in directory.
	 * @param   boolean  $single  Whether to return only single URL?
	 *
	 * @return  array
	 */
	public static function findTemplateAdminJsonSettings($paths, $filter = '*.json', $single = false, $lang_prefix = 'SUNFW_ITEM_')
	{
		// Get items only if not already available.
		static $items;

		$key = implode('|', (array) $paths) . "|$filter";

		if (!isset($items) || !isset($items[$key]))
		{
			// Get base URL.
			$base_url = JUri::root(true);

			// Prepare data store.
			if (!isset($items))
			{
				$items = array();
			}

			$items[$key] = array();

			foreach ((array) $paths as $path)
			{
				foreach (glob("{$path}/{$filter}") as $file)
				{
					$name = substr(basename($file), 0, -5);
					$text = $lang_prefix . strtoupper(str_replace('-', '_', $name));
					$icon = $text . '_ICON';
					$file = str_replace(JPATH_ROOT, '', preg_replace('#[\\/]#', DIRECTORY_SEPARATOR, $file));

					if (DIRECTORY_SEPARATOR != '/')
					{
						$file = str_replace(DIRECTORY_SEPARATOR, '/', $file);
					}

					if ($text == JText::_($text))
					{
						// Generate display name from file name.
						$text = trim(preg_replace('/([A-Z])/', ' \\1', $name));

						if (preg_match('/[^a-zA-Z0-9]/', $text))
						{
							$text = preg_replace('/[^a-zA-Z0-9]+/', ' ', $text);
						}

						$text = ucwords($text);
					}

					if ($icon == JText::_($icon))
					{
						$icon = '';
					}

					$items[$key][$name] = array(
						'label' => JText::_($text),
						'icon' => empty($icon) ? '' : JText::_($icon),
						'settings' => "{$base_url}{$file}?v=" . SUNFW_VERSION . '&d=' . SUNFW_RELEASED_DATE
					);
				}
			}
		}

		if ($single)
		{
			$item = end($items[$key]);

			return $item ? $item['settings'] : null;
		}

		return $items[$key];
	}

	/**
	 * Get JSN Brand settings for template.
	 *
	 * @param   string  $setting  Setting to get value for.
	 * @param   mixed   $default  Default setting value.
	 *
	 * @return  mixed
	 */
	public static function getBrandSetting($setting, $default = false)
	{
		static $settings;

		if (!isset($settings))
		{
			$settings = array();

			if (JPluginHelper::importPlugin('system', 'jsnbrand'))
			{
				$dispatcher = JEventDispatcher::getInstance();

				$settings['showTplUpgradeButton'] = $dispatcher->trigger('showTplUpgradeButton');
				$settings['showTplUpgradeButton'] = (int) $settings['showTplUpgradeButton'][0];

				$settings['showTplChangelog'] = $dispatcher->trigger('showTplChangelog');
				$settings['showTplChangelog'] = (int) $settings['showTplChangelog'][0];

				$settings['showTplThumbnailLink'] = $dispatcher->trigger('showTplThumbnailLink');
				$settings['showTplThumbnailLink'] = (int) $settings['showTplThumbnailLink'][0];

				$settings['showTplCopyrightContent'] = $dispatcher->trigger('showTplCopyrightContent');
				$settings['showTplCopyrightContent'] = (int) $settings['showTplCopyrightContent'][0];

				$settings['replaceTplFooterContent'] = $dispatcher->trigger('replaceTplFooterContent');
				$settings['replaceTplFooterContent'] = (int) $settings['replaceTplFooterContent'][0];

				$settings['getTplFooterContent'] = $dispatcher->trigger('getTplFooterContent');
				$settings['getTplFooterContent'] = (string) $settings['getTplFooterContent'][0];

				$settings['replaceTplGettingStartedContent'] = $dispatcher->trigger('replaceTplGettingStartedContent');
				$settings['replaceTplGettingStartedContent'] = (int) $settings['replaceTplGettingStartedContent'][0];

				$settings['getTplGettingStartedContent'] = $dispatcher->trigger('getTplGettingStartedContent');
				$settings['getTplGettingStartedContent'] = (string) $settings['getTplGettingStartedContent'][0];
			}
		}

		return isset($settings[$setting]) ? $settings[$setting] : $default;
	}
}
