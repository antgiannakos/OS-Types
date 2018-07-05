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

// Import necessary Joomla libraries.
jimport('joomla.filesystem.folder');
jimport('joomla.filesystem.file');
jimport('joomla.filesystem.path');
jimport('joomla.installer.helper');

/**
 * Handle Ajax requests from update modal.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwAjaxUpdate extends SunFwAjax
{

	/**
	 * Checking template version for auto update
	 *
	 * @return  void
	 */
	public function checkUpdateAction()
	{
		$response = array();

		// Check Sun Framework update status.
		try
		{
			$frameworkInfo = SunFwApiLightcart::getProductDetails('cat_template', SUNFW_ID);

			$response['framework'] = array(
				'currentVersion' => SUNFW_VERSION,
				'newVersion' => $frameworkInfo->version,
				'hasUpdate' => version_compare($frameworkInfo->version, SUNFW_VERSION, '>'),
				'message' => JText::_('PLG_SYSTEM_SUNFW_UPDATE_AVAILABLE') . ': ' . JText::_('PLG_SYSTEM_SUNFW')
			);
		}
		catch (Exception $ex)
		{
			$response['framework'] = array(
				'currentVersion' => SUNFW_VERSION,
				'newVersion' => SUNFW_VERSION,
				'hasUpdate' => false
			);
		}

		// Check template update status.
		try
		{
			$templateVersion = SunFwHelper::getTemplateVersion($this->template['name']);
			$templateInfo = SunFwApiLightcart::getProductDetails('cat_template', $this->template['id']);

			$response['template'] = array(
				'currentVersion' => $templateVersion,
				'newVersion' => $templateInfo->version,
				'hasUpdate' => version_compare($templateInfo->version, $templateVersion, '>'),
				'message' => JText::_('PLG_SYSTEM_SUNFW_UPDATE_AVAILABLE') . ': ' . strtoupper(
					str_replace('_', ' ', str_replace('pro', '', $this->template['name']))) .
					 ( isset($templateInfo->edition) ? ' ' . $templateInfo->edition : '' )
			);
		}
		catch (Exception $ex)
		{
			$response['template'] = array(
				'currentVersion' => $templateVersion,
				'newVersion' => $templateVersion,
				'hasUpdate' => false
			);
		}

		$this->setResponse($response);
	}

	/**
	 * Authentication action before update
	 *
	 * @return  void
	 */
	public function confirmAction()
	{
		$target = $this->input->getString('target', '');

		if ($target == 'framework')
		{
			// Check if template has update also.
			$this->checkUpdateAction();

			$result = $this->getResponse();

			return $this->render('framework_confirm',
				array(
					'manifest' => SunFwHelper::getManifestCache('sunfw', 'plugin', 'system'),
					'template' => $this->template['name'],
					'templateHasUpdate' => $result['template']['hasUpdate']
				));
		}

		// Retrieve version data.
		$versionData = SunFWHelper::getVersionData();

		// Find template information by identify name.
		foreach ($versionData['items'] as $item)
		{
			if ($item['identified_name'] == $this->template['id'])
			{
				if (( isset($item['edition']) && !empty($item['edition']) ) ||
					 ( @is_array($item['editions']) && count($item['editions']) == 1 ))
				{
					$template = @is_array($item['editions']) ? $item['editions'][0] : $item;

					// Render login view.
					$this->render('confirm',
						array(
							'template' => $this->template,
							'authenticate' => $template['authentication']
						));
				}
				else
				{
					foreach ($item['editions'] as $template)
					{
						$edition = trim($template['edition']);

						if (str_replace('PRO ', '', $this->template['edition']) == str_replace('PRO ', '', $edition))
						{
							// Render login view.
							$this->render('confirm',
								array(
									'template' => $this->template,
									'authenticate' => $template['authentication']
								));

							break;
						}
					}
				}

				break;
			}
		}
	}

	/**
	 * Render UI for install update screen
	 *
	 * @return  void
	 */
	public function installAction()
	{
		$token = JSession::getFormToken();
		$target = $this->input->getString('target');

		if ($target == 'framework')
		{
			return $this->render('framework_install',
				array(
					'manifest' => SunFwHelper::getManifestCache('sunfw', 'plugin', 'system'),
					'token' => $token
				));
		}

		$this->render('install', array(
			'template' => $this->templateName,
			'styleID' => $this->styleID,
			'token' => $token
		));
	}

	/**
	 * Download update package for template
	 *
	 * @return  void
	 */
	public function downloadAction()
	{
		try
		{
			SunFwHelper::isDisabledFunction('set_time_limit') or set_time_limit(0);

			// Store customer's username to session.
			$this->app->setUserState('sunfw.installer.customer.username', '');

			// Get parameters.
			$params = SunFwHelper::getExtensionParams('template', $this->template['name']);

			if (count($params))
			{
				if (empty($params['token']))
				{
					throw new Exception(JText::_('SUNFW_ERROR_INVALID_TOKEN'));
				}

				// Download package file
				SunFwApiLightcart::downloadTemplateUpdate($this->template['id'], $params['token']);
			}
		}
		catch (Exception $e)
		{
			throw $e;
		}
	}

	/**
	 * Check files modification state based on checksum.
	 * Files that are not being updated will be ignored.
	 *
	 * @return  void
	 */
	public function checkBeforeUpdateAction()
	{
		$packageFile = JFactory::getConfig()->get('tmp_path') . '/sunfw-' . $this->template['id'] . '.zip';

		// Check if downloaded template package existen
		if (!is_readable($packageFile))
		{
			throw new Exception(JText::_('SUNFW_ERROR_DOWNLOAD_PACKAGE_FILE_NOT_FOUND'));
		}

		// Get list of modified files that are being updated
		$modifiedFiles = SunFwHelper::getModifiedFilesBeingUpdated($this->template['name'], $packageFile);
		$hasModification = count($modifiedFiles);

		// Backup modified files that are being updated
		if ($hasModification)
		{
			SunFwIntegrity::backup($this->template);
		}

		$this->setResponse(array(
			'hasModification' => (boolean) $hasModification
		));
	}

	/**
	 * Download Framework
	 * @throws Exception
	 */
	public function downloadFrameworkAction()
	{
		SunFwHelper::isDisabledFunction('set_time_limit') or set_time_limit(0);

		// Download package file
		try
		{
			SunFwApiLightcart::downloadPackage(SUNFW_ID);
		}
		catch (Exception $e)
		{
			throw $e;
		}
	}

	/**
	 * Install Framework
	 * @throws Exception
	 * @throws Ambigous <JException, boolean>
	 */
	public function installFrameworkAction()
	{
		$packageFile = JFactory::getConfig()->get('tmp_path') . '/sunfw-' . SUNFW_ID . '.zip';

		// Checking downloaded template package
		if (!is_file($packageFile))
		{
			throw new Exception(JText::_('SUNFW_ERROR_DOWNLOAD_PACKAGE_FILE_NOT_FOUND'));
		}

		// Turn off debug mode to catch install error
		$conf = JFactory::getConfig();
		$conf->set('debug', 0);

		$unpackedInfo = JInstallerHelper::unpack($packageFile);
		$installer = new JInstaller();
		$installer->setUpgrade(true);
		$installResult = $installer->install($unpackedInfo['dir']);

		// Clean up temporary data
		JInstallerHelper::cleanupInstall($packageFile, $unpackedInfo['dir']);

		// Clean up compressed files
		$this->_cleanCache();

		// Send error if install is failure
		if (class_exists('JError'))
		{
			$error = JError::getError();
			if (!empty($error))
			{
				throw $error;
			}
		}
	}

	/**
	 * Start process to install template update
	 *
	 * @return  void
	 */
	public function installPackageAction()
	{
		// Initialize variables
		$joomlaConfig = JFactory::getConfig();
		$packageFile = $joomlaConfig->get('tmp_path') . '/sunfw-' . $this->template['id'] . '.zip';
		$packagePath = substr($packageFile, 0, -4);
		$templatePath = JPATH_ROOT . '/templates/' . $this->template['name'];

		// Checking downloaded template package
		if (!is_file($packageFile))
		{
			throw new Exception(JText::_('SUNFW_ERROR_DOWNLOAD_PACKAGE_FILE_NOT_FOUND'));
		}

		$manifest = $packagePath . '/template/templateDetails.xml';

		if (!file_exists($manifest))
		{
			$manifest = $packagePath . '/templateDetails.xml';
		}

		// Check if template is copied to another name
		if ($xml = simplexml_load_file($manifest))
		{
			if (strcasecmp($this->template['name'], trim((string) $xml->name)) != 0)
			{
				// Update templateDetails.xml with new name
				$content = str_replace((string) $xml->name, $this->template['name'], file_get_contents($manifest));

				JFile::write($manifest, $content);
			}
		}

		// Get list of files to be updated
		try
		{
			$update = SunFwHelper::getFilesBeingUpdated($this->template['name'], $packageFile);

			if (!$update)
			{
				throw new Exception(JText::_('SUNFW_ERROR_FAILED_TO_GET_FILES_BEING_UPDATED'));
			}
		}
		catch (Exception $e)
		{
			throw $e;
		}

		// Include template checksum and manifest files
		in_array('template.checksum', $update['edit']) || ( $update['edit'][] = 'template.checksum' );
		in_array('templateDetails.xml', $update['edit']) || ( $update['edit'][] = 'templateDetails.xml' );

		// Update the template
		foreach ($update as $action => $files)
		{
			foreach ($files as $file)
			{
				if ($action != 'add')
				{
					if ($file != 'templateDetails.xml')
					{
						JFile::delete($templatePath . '/' . $file);
					}
				}

				if ($action != 'delete' and JFolder::create(dirname($templatePath . '/' . $file)))
				{
					if ($file == 'templateDetails.xml')
					{
						// Re-create all module positions manually created by user.
						$currentManifestPath = $templatePath . '/templateDetails.xml';
						$currentManifest = simplexml_load_file($currentManifestPath);
						$currentPositions = array();

						foreach ($currentManifest->xpath('positions/position') as $pos)
						{
							$currentPositions[] = (string) $pos;
						}

						JFile::delete($templatePath . '/' . $file);

						if (file_exists($packagePath . '/template/' . $file))
						{
							JFile::copy($packagePath . '/template/' . $file, $templatePath . '/' . $file);
						}
						else
						{
							JFile::copy($packagePath . '/' . $file, $templatePath . '/' . $file);
						}

						$this->_reUpdatePosition($currentManifestPath, $currentPositions);
					}
					else
					{
						if (file_exists($packagePath . '/template/' . $file))
						{
							JFile::copy($packagePath . '/template/' . $file, $templatePath . '/' . $file);
						}
						else
						{
							JFile::copy($packagePath . '/' . $file, $templatePath . '/' . $file);
						}
					}
				}
			}
		}

		// Move backup file to template directory
		$source = $joomlaConfig->get('tmp_path') . '/' . $this->template['name'] . '_modified_files.zip';
		$target = $templatePath . '/backups/' . date('y-m-d_H-i-s') . '_modified_files.zip';

		if (is_readable($source))
		{
			JFile::copy($source, $target);

			// Remove backup file in temporary directory
			filesize($source) != filesize($target) or JFile::delete($source);
		}

		// Clean up temporary data
		JInstallerHelper::cleanupInstall($packageFile, $packagePath);

		// Check if update success
		$messages = JFactory::getApplication()->getMessageQueue();

		if (class_exists('JError'))
		{
			$messages = array_merge(JError::getErrors(), $messages);
		}

		foreach ($messages as $message)
		{
			if (( is_array($message) && @$message['type'] == 'error' ) ||
				 ( is_object($message) && ( !method_exists($message, 'get') || $message->get('level') == E_ERROR ) ))
			{
				$msg = str_replace(JPATH_ROOT, '', is_array($message) ? $message['message'] : $message->getMessage());
				$errors[$msg] = 1;
			}
		}

		if (@count($errors))
		{
			throw new Exception('<ul><li>' . implode('</li><li>', array_keys($errors)) . '</li></ul>');
		}

		// Update template version in manifest cache
		$manifest = SunFwHelper::getManifest($this->template['name'], 'template', null, true);
		$template = JTable::getInstance('extension');

		$template->load(array(
			'type' => 'template',
			'element' => $this->template['name']
		));

		if ($template->extension_id)
		{
			// Decode manifest cache
			$template->manifest_cache = json_decode($template->manifest_cache);

			// Set new template version
			$template->manifest_cache->version = (string) $manifest->version;

			// Re-encode manifest cache
			$template->manifest_cache = json_encode($template->manifest_cache);

			// Store new data
			$template->store();
		}

		// Clear backup state
		JFactory::getApplication()->setUserState('sunfw-backup-done', 0);

		// Clean up compressed files
		$this->_cleanCache();

		require_once JPATH_ROOT . '/plugins/system/sunfw/includes/client/client.php';

		// Post client information
		$params = SunFwHelper::getExtensionParams('template', $this->template['name']);

		if (!empty($params['token']))
		{
			SunFwClientInformation::postClientInformation($params['token']);
		}
	}

	private function _cleanCache()
	{
		$this->styleID = $this->input->getInt('style_id', 0);

		$style = SunFwHelper::getSunFwStyle($this->styleID);

		if (count($style))
		{
			if ($style->system_data != '')
			{
				if (SunFwUtils::jsonValidate($style->system_data) != false)
				{
					$systemData = json_decode($style->system_data);

					if (isset($systemData->cacheDirectory))
					{
						if ($systemData->cacheDirectory != '')
						{
							// Generate path to cache directory
							if (!preg_match('#^(/|\\|[a-z]:)#i', $systemData->cacheDirectory))
							{
								$cacheDirectory = JPATH_ROOT . '/' . rtrim($systemData->cacheDirectory, '\\/');
							}
							else
							{
								$cacheDirectory = rtrim($systemData->cacheDirectory, '\\/');
							}
							// Remove entire cache directory
							!is_dir($cacheDirectory . '/' . $this->template['name']) or
								 JFolder::delete($cacheDirectory . '/' . $this->template['name']);
						}
					}
				}
			}
		}
	}

	/**
	 * Reinsert all modules that created by User
	 *
	 * @param string $manifestPath	The manifest path
	 * @param array $positions		The custom position
	 * @throws Exception
	 * @return boolean
	 */
	private function _reUpdatePosition($manifestPath, $positions)
	{
		// Prepare template's manifest file.
		$file = JPath::clean($manifestPath);

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

		// Parse XML data from manifest file.
		$manifest = simplexml_load_file($file);

		foreach ($manifest->xpath('positions/position') as $pos)
		{
			if (in_array((string) $pos, $positions))
			{
				//throw new Exception( JText::_('SUNFW_POSITION_IS_EXISTED') );
				$positions = array_diff($positions, array(
					(string) $pos
				));
			}
		}

		if (count($positions))
		{
			foreach ($positions as $position)
			{
				$manifest->positions->addChild('position', $position);
			}
		}

		$manifest = $manifest->asXML();

		if (!JFile::write($file, $manifest))
		{
			throw new Exception(JText::sprintf('SUNFW_ERROR_FAILED_TO_SAVE_FILENAME', 'templateDetails.xml'));
		}

		return true;
	}

	/**
	 * Compile CSS
	 * @throws Exception
	 */
	public function compileCssAction()
	{
		try
		{
			$sufwrender = new SunFwScssrender();
			$sufwrender->compile($this->styleID, $this->templateName);
			$sufwrender->compile($this->styleID, $this->templateName, "layout");
		}
		catch (Exception $e)
		{
			//throw $e;
		}

		return true;
	}
}
