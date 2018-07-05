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

/**
 * Handle Ajax requests from advanced params pane.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwAjaxSystem extends SunFwAjax
{

	/**
	 * Get advanced data from database.
	 *
	 * @param   boolean  $return  Whether to return data or send response back immediately?
	 *
	 * @return  mixed
	 */
	public function getAction($return = false)
	{
		/**
		 * Get system data.
		 */
		$style = SunFwHelper::getSunFwStyle($this->styleID);

		/**
		 * Prepare response data.
		 */
		$data = array(
			'url' => $this->baseUrl,
			'data' => $style ? json_decode($style->system_data) : null,
			'settings' => SunFwHelper::findTemplateAdminJsonSettings(
				JPATH_ROOT . '/plugins/system/sunfw/assets/joomlashine/admin/js/system', 'settings.json', true),
			'textMapping' => array(
				'system' => JText::_('SUNFW_SYSTEM'),
				'save-system' => JText::_('SUNFW_SAVE_SYSTEM'),
				'fav-icon' => JText::_('SUNFW_ADVANCED_FAVICON'),
				'fav-icon-hint' => JText::_('SUNFW_ADVANCED_FAVICON_DESC'),
				'assets-compression' => JText::_('SUNFW_ADVANCED_ASSETS_COMPRESSION'),
				'compression-target' => JText::_('SUNFW_ADVANCED_COMPRESSION_TARGET'),
				'compression-target-hint' => JText::_('SUNFW_ADVANCED_COMPRESSION_TARGET_DESC'),
				'compress-css' => JText::_('SUNFW_ADVANCED_COMPRESS_CSS'),
				'compress-js' => JText::_('SUNFW_ADVANCED_COMPRESS_JS'),
				'max-compression-size' => JText::_('SUNFW_ADVANCED_COMPRESSION_MAX_SIZE'),
				'max-compression-size-hint' => JText::_('SUNFW_ADVANCED_COMPRESSION_MAX_SIZE_DESC'),
				'cache-directory' => JText::_('SUNFW_ADVANCED_CACHE_DIRECTORY'),
				'cache-directory-hint' => JText::_('SUNFW_ADVANCED_CACHE_DIRECTORY_DESC'),
				'verify' => JText::_('SUNFW_VERIFY'),
				'exclude-from-compression' => JText::_('SUNFW_ADVANCED_EXLUCDE_FROM_COMPRESSION'),
				'exclude-from-compression-hint' => JText::_('SUNFW_ADVANCED_EXLUCDE_FROM_COMPRESSION_DESC'),
				'minify-html' => JText::_('SUNFW_ADVANCED_MINIFY_HTML'),
				'minify-html-hint' => JText::_('SUNFW_ADVANCED_MINIFY_HTML_DESC'),
				'move-js-to-bottom' => JText::_('SUNFW_ADVANCED_MOVE_JS_TO_BOTTOM'),
				'move-js-to-bottom-hint' => JText::_('SUNFW_ADVANCED_MOVE_JS_TO_BOTTOM_DESC'),
				'custom-code' => JText::_('SUNFW_ADVANCED_CUSTOM_CODE'),
				'at-begin-of-head-tag' => JText::_('SUNFW_ADVANCED_CUSTOM_AFTER_OPENING_HEAD_TAG'),
				'at-begin-of-head-tag-hint' => JText::_('SUNFW_ADVANCED_CUSTOM_AFTER_OPENING_HEAD_TAG_DESC'),
				'at-end-of-head-tag' => JText::_('SUNFW_ADVANCED_CUSTOM_BEFORE_ENDING_HEAD_TAG'),
				'at-end-of-head-tag-hint' => JText::_('SUNFW_ADVANCED_CUSTOM_BEFORE_ENDING_HEAD_TAG_DESC'),
				'at-begin-of-body-tag' => JText::_('SUNFW_ADVANCED_CUSTOM_AFTER_OPENING_BODY_TAG'),
				'at-begin-of-body-tag-hint' => JText::_('SUNFW_ADVANCED_CUSTOM_AFTER_OPENING_BODY_TAG_DESC'),
				'at-end-of-body-tag' => JText::_('SUNFW_ADVANCED_CUSTOM_BEFORE_ENDING_BODY_TAG'),
				'at-end-of-body-tag-hint' => JText::_('SUNFW_ADVANCED_CUSTOM_BEFORE_ENDING_BODY_TAG_DESC'),
				'custom-files' => JText::_('SUNFW_ADVANCED_CUSTOM_FILES'),
				'custom-css-files' => JText::_('SUNFW_ADVANCED_CUSTOM_FIELS_CSS'),
				'custom-css-files-hint' => JText::_('SUNFW_ADVANCED_CUSTOM_FIELS_CSS_DESC'),
				'custom-js-files' => JText::_('SUNFW_ADVANCED_CUSTOM_FIELS_JS'),
				'custom-js-files-hint' => JText::_('SUNFW_ADVANCED_CUSTOM_FIELS_JS_DESC')
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

		// Build query to save advanced data.
		$style = SunFwHelper::getSunFwStyle($this->styleID);
		$query = $this->dbo->getQuery(true);

		if (count($style))
		{
			$query->update($this->dbo->quoteName('#__sunfw_styles'))
				->set($this->dbo->quoteName('system_data') . '=' . $this->dbo->quote($data))
				->where($this->dbo->quoteName('style_id') . '=' . intval($this->styleID))
				->where($this->dbo->quoteName('template') . '=' . $this->dbo->quote($this->templateName));
		}
		else
		{
			$columns = array(
				'style_id',
				'system_data',
				'template'
			);
			$values = array(
				intval($this->styleID),
				$this->dbo->quote($data),
				$this->dbo->quote($this->templateName)
			);

			$query->insert($this->dbo->quoteName('#__sunfw_styles'))
				->columns($this->dbo->quoteName($columns))
				->values(implode(',', $values));
		}

		// Execute query to save advanced data.
		try
		{
			$this->dbo->setQuery($query);

			if (!$this->dbo->execute())
			{
				throw new Exception($this->dbo->getErrorMsg());
			}

			if ($data['cacheDirectory'] != '')
			{
				// Generate path to cache directory
				if (!preg_match('#^(/|\\|[a-z]:)#i', $data['cacheDirectory']))
				{
					$cacheDirectory = JPATH_ROOT . '/' . rtrim($data['cacheDirectory'], '\\/');
				}
				else
				{
					$cacheDirectory = rtrim($data['cacheDirectory'], '\\/');
				}

				// Remove entire cache directory
				!is_dir($cacheDirectory . '/' . $this->templateName) or JFolder::delete($cacheDirectory . '/' . $this->templateName);
			}
		}
		catch (Exception $e)
		{
			throw $e;
		}

		$this->setResponse(array(
			'message' => JText::_('SUNFW_SYSTEM_CONFIG_SAVED_SUCCESSFULLY')
		));
	}

	public function verifyCacheFolderAction()
	{
		$folder = $this->input->getString('folder', '');

		if (empty($folder))
		{
			$this->setResponse(array(
				'pass' => false,
				'message' => JText::_('SUNFW_INVALID_REQUEST')
			));

			return;
		}

		if (!preg_match('#^(/|\\|[a-z]:)#i', $folder))
		{
			$folder = JPATH_ROOT . '/' . $folder;
		}

		// Check if directory exists?
		if (!is_dir($folder))
		{
			$this->setResponse(array(
				'pass' => false,
				'message' => JText::_('SUNFW_DIRECTORY_NOT_FOUND')
			));

			return;
		}

		// Check if directory is outside of document root?
		if (!realpath($folder) ||
			 ( realpath($_SERVER['DOCUMENT_ROOT']) && strpos(realpath($folder), realpath($_SERVER['DOCUMENT_ROOT'])) !== 0 ))
		{
			$this->setResponse(array(
				'pass' => false,
				'message' => JText::_('SUNFW_DIRECTORY_OUT_OF_ROOT')
			));

			return;
		}

		// Check if directory is writable
		$config = JFactory::getConfig();

		if (!$config->get('ftp_enable') and !is_writable($folder))
		{
			$this->setResponse(array(
				'pass' => false,
				'message' => JText::_('SUNFW_DIRECTORY_NOT_WRITABLE')
			));

			return;
		}

		$this->setResponse(array(
			'pass' => true,
			'message' => JText::_('SUNFW_DIRECTORY_READY')
		));
	}
}
