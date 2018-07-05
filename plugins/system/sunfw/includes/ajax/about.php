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
 * Handle Ajax requests from about pane.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwAjaxAbout extends SunFwAjax
{

	/**
	 * Get data for about pane.
	 *
	 * @param   boolean  $return  Whether to return data or send response back immediately?
	 *
	 * @return  mixed
	 */
	public function getAction($return = false)
	{
		// Get root URL.
		$root = JUri::root(true);
		
		// Get template manifest.
		$templateManifest = SunFwHelper::getManifest($this->templateName);
		
		/**
		 * Prepare response data.
		 */
		$data = array(
			'frameworkThumb' => "{$root}/plugins/system/sunfw/assets/images/sunfw_preview.png",
			'frameworkRelease' => date('M d, Y', strtotime(SUNFW_RELEASED_DATE)),
			'templateThumb' => "{$root}/templates/{$this->templateName}/template_preview.png",
			'templateRelease' => date('M d, Y', strtotime($templateManifest->creationDate)),
			'enableThumbnailLink' => SunFwHelper::getBrandSetting('showTplThumbnailLink', 1),
			'showCopyright' => SunFwHelper::getBrandSetting('showTplCopyrightContent', 1),
			'textMapping' => array(
				'framework' => JText::_('SUNFW_FRAMEWORK'),
				'template' => JText::_('SUNFW_TEMPLATE'),
				'version' => JText::_('SUNFW_VERSION'),
				'update-available' => JText::_('SUNFW_FRAMEWORK_UPDATE_AVAILABEL'),
				'latest-version' => JText::_('SUNFW_FRAMEWORK_LATEST_VERSION'),
				'release-date' => JText::_('SUNFW_TEMPLATE_RELEASED_DATE'),
				'copyright-by' => JText::_('SUNFW_COPYRIGHT')
			)
		);
		
		if ($return)
		{
			return $data;
		}
		
		$this->setResponse($data);
	}
}
