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
 * Custom form field for selecting media file.
 *
 * @package     SUN Framework
 * @subpackage  Form
 * @since       1.0.0
 */
class JFormFieldSunFwMedia extends JFormField
{

	public $type = 'SunFwMedia';

	public function getInput()
	{
		$value = ( $value = htmlspecialchars($this->value, ENT_COMPAT, 'UTF-8') ) != '' ? $value : '';
		$html = '<div class="sunfw-media-selector input-append">';
		$html .= '<input type="text" class="input-medium ' . ( isset($this->element['class']) ? $this->element['class'] : '' ) . '" name="' .
			 $this->name . '" id="' . $this->id . '" value="' . $value . '" readonly="readonly" />';
		$html .= '<a href="#sunFwModalMedia" data-toggle="modal" data-name="' . $this->name . '" class="btn btn-default">...</a>';
		$html .= '<a href="javascript:void(0)" class="sunfw-clear-media btn btn-default ' . ( $this->value ? '' : 'hidden' ) . '">x</a>';
		$html .= '</div>';

		if (!defined('JFormFieldSunFwMediaInitialized'))
		{
			$this->addAssets();

			$html .= '<div id="sunFwModalMedia" class="modal hide" tabindex="-1" role="dialog">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3>' . JText::_('SUNFW_MEDIA_SELECTOR') . '</h3>
				</div>
				<div class="modal-body">
					<iframe src="about:blank"></iframe>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" type="button" data-dismiss="modal">' . JText::_('SUNFW_OK') . '</button>
					<button class="btn" type="button" data-dismiss="modal">' . JText::_('SUNFW_CANCEL') . '</button>
				</div>
			</div>';

			define('JFormFieldSunFwMediaInitialized', 1);
		}

		return $html;
	}

	protected function addAssets()
	{
		// Get Joomla document object.
		$doc = JFactory::getDocument();

		// Get path to plugin folder.
		$plgPath = JUri::root(true) . '/plugins/system/sunfw';

		// Load modal stylesheet.
		$doc->addStylesheet("{$plgPath}/includes/admin/fields/modal.css");

		// Load media selector script.
		$doc->addScript("{$plgPath}/includes/admin/fields/sunfwmedia.js");

		// Get link to media selector widget.
		$link = 'index.php?option=com_ajax&format=html&plugin=sunfw&context=media-selector&type=image&folder=images&handler=SunFwSelectImage&' .
			 JSession::getFormToken() . '=1';

		// Add script initialization.
		$script = ';var SunFwMediaSelectorConfig = {url: "' . JRoute::_($link, false) . '"};';

		$doc->addScriptDeclaration($script);
	}
}
