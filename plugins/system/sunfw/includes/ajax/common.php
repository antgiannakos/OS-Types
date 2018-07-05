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
 * Handle common Ajax requests from template admin.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwAjaxCommon extends SunFwAjax
{

	/**
	 * Get module position from template's manifest file.
	 *
	 * @return  void
	 */
	public function getTemplatePositionAction()
	{
		$manifest = SunFwHelper::getManifest($this->templateName);

		// Get module positions.
		$positions = array();

		foreach ($manifest->xpath('positions/position') as $position)
		{
			$positions[] = array(
				'name' => (string) $position,
				'value' => (string) $position
			);
		}

		$this->setResponse($positions);
	}

	/**
	 * Save a new module position to template's mainifest file.
	 *
	 * @throws  Exception
	 */
	public function saveTemplatePositionAction()
	{
		// Prepare input data.
		$position = $this->input->getString('position', '');

		if (empty($position))
		{
			throw new Exception('Invalid Request');
		}

		// Prepare template's XML manifest data.
		$manifest = SunFwHelper::getManifest($this->templateName, 'template', null, true);

		foreach ($manifest->xpath('positions/position') as $pos)
		{
			if ((string) $pos == $position)
			{
				throw new Exception(JText::_('SUNFW_POSITION_IS_EXISTED'));
			}
		}

		// Add new position then save updated XML data to manifest file.
		$manifest->positions->addChild('position', $position);

		try
		{
			SunFwHelper::updateManifest($this->templateName, $manifest);
		}
		catch (Exception $e)
		{
			throw $e;
		}

		$this->setResponse(array(
			'message' => JText::_('SUNFW_SAVED_SUCCESSFULLY')
		));
	}

	/**
	 * Get all available menu items.
	 *
	 * @return  void
	 */
	public function getMenuItemsAction()
	{
		foreach (SunFwHelper::getAllAvailableMenus(true, 10) as $menu)
		{
			$menus[$menu->value] = $menu;
		}

		$this->setResponse(is_array($menus) ? $menus : array());
	}

	/**
	 * Get menu type.
	 *
	 * @return  void
	 */
	public function getMenuTypeAction()
	{
		// Get all available menus.
		$menus = SunFwHelper::getAllAvailableMenus();

		$this->setResponse(is_array($menus) ? $menus : array());
	}

	/**
	 * Get Module style .
	 *
	 * @return  void
	 */
	public function getModuleStyleAction()
	{
		$moduleStyle = array();
		$defaultModuleStyles = SunFwHelper::getDefaultModuleStyle($this->styleID);

		if (count($defaultModuleStyles))
		{
			foreach ($defaultModuleStyles['appearance']['modules'] as $key => $value)
			{
				$tmp = array();
				$tmp['text'] = ucfirst(str_replace('-', ' ', $key));
				$tmp['value'] = $key;

				$moduleStyle[] = $tmp;
			}
		}

		$this->setResponse(is_array($moduleStyle) ? $moduleStyle : array());
	}

	/**
	 * Get an article.
	 *
	 * @return  void
	 */
	public function getArticleAction()
	{
		// Get default language if multi-language is enabled.
		$lang = '';

		jimport('');

		if (JLanguageMultilang::isEnabled())
		{
			$lang = JComponentHelper::getParams('com_languages')->get('site', 'en-GB');
		}

		// Get requested article.
		$id = $this->input->getInt('articleId');

		if (!$id)
		{
			throw new Exception('Invalid Request');
		}

		$article = SunFwSiteHelper::getArticle($id, $lang);

		$this->setResponse($article);
	}

	/**
	 * Get all available content categories.
	 *
	 * @return  void
	 */
	public function getContentCategoryAction()
	{
		// Get request variables.
		$extension = $this->input->getCmd('extension', 'com_content');
		$state = $this->input->getString('state', '1');
		$lang = $this->input->getString('lang', '');

		// Get list of content category.
		$categories = JHtml::_('category.options', $extension,
			array(
				'filter.published' => empty($state) ? null : explode(',', $state),
				'filter.language' => empty($lang) ? null : explode(',', $lang)
			));

		array_unshift($categories, JHtml::_('select.option', 'all', JText::_('SUNFW_ALL')));

		$this->setResponse($categories);
	}

	/**
	 * Get banner data.
	 *
	 * @return  void
	 */
	public function getBannerAction()
	{
		// Get request variable.
		$category = isset($_REQUEST['type']) ? $_REQUEST['type'] : null;

		if (empty($category))
		{
			return;
		}

		// Get parameters.
		$params = SunFwHelper::getExtensionParams('template', $this->template['name']);

		if (empty($params['token']))
		{
			return;
		}

		// Look for banner data in the temporary directory first.
		$cache = JFactory::getConfig()->get('tmp_path') . "/{$this->template['id']}/banner-{$category}.html";

		if (is_file($cache) && ( time() - filemtime($cache) < 60 * 60 ) && ( $banner = file_get_contents($cache) ) != '')
		{
			return $this->setResponse(json_decode($banner));
		}

		// Instantiate a HTTP client.
		$http = new JHttp();
		$link = SUNFW_GET_BANNER_URL;

		// Build URL for requesting banner data.
		$link .= '&category_alias=' . ( $category == 'layout-footer' ? 'jsn-sunfw' : 'jsnsunfw' ) . "-{$category}";
		$link .= '&token=' . $params['token'];

		// Send a request to JoomlaShine server to get banner data.
		try
		{
			$banner = $http->get($link);

			// Cache license data to a local file.
			file_put_contents($cache, $banner->body);

			$this->setResponse(json_decode($banner->body));
		}
		catch (Exception $e)
		{
			// Reuse cache file if available.
			if (is_file($cache) && ( $banner = file_get_contents($cache) ) != '')
			{
				// Refresh cache file after 1 hour.
				touch($cache);

				$this->setResponse(json_decode($banner));
			}
		}
	}

	/**
	 * Save plugin parameters
	 *
	 * @return  void
	 */
	public function savePluginParamsAction()
	{
		// Get request parameters.
		$params = isset($_REQUEST['params']) ? $_REQUEST['params'] : null;

		if (empty($params))
		{
			throw new Exception('Invalid Request');
		}

		// Update plugin params.
		SunFwHelper::updateExtensionParams($params, 'plugin', 'sunfw', 'system');
	}
}
