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
 * Custom form field for selecting gallery images.
 *
 * @package     SUN Framework
 * @subpackage  Form
 * @since       1.0.0
 */
class JFormFieldSunFwGallery extends JFormField
{

	public $type = 'SunFwGallery';

	public function getInput()
	{
		// Get current gallery images.
		$images = empty($this->value) ? array() : $this->value;

		$html = '<div class="sunfw-gallery-selector ' . ( isset($this->element['class']) ? (string) $this->element['class'] : '' ) . '">';
		$html .= '<div class="row image-thumbs ' . ( count($images) ? '' : 'hide' ) . '">';

		foreach ($images as $image)
		{
			$html .= '<div class="image-thumb">';
			$html .= '<span class="thumbnail">';
			$html .= '<img src="' . JUri::root(true) . '/' . $image . '" />';
			$html .= '</span>';
			$html .= '<a class="remove-image" href="#"><i class="icon-trash"></i></a>';
			$html .= '<input type="hidden" name="' . $this->name . '[]" value="' . $image . '" />';
			$html .= '</div>';
		}

		$html .= '</div>';
		$html .= '<a href="#sunFwModalGallery" data-toggle="modal" data-name="' . $this->name . '" class="btn btn-default">' .
			 JText::_('SUNFW_SELECT_IMAGE') . '</a>';
		$html .= '</div>';

		if (!defined('JFormFieldSunFwGalleryInitialized'))
		{
			$this->addAssets();

			$html .= '<div id="sunFwModalGallery" class="modal hide" tabindex="-1" role="dialog">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3>' . JText::_('SUNFW_SELECT_IMAGE') . '</h3>
				</div>
				<div class="modal-body">
					<iframe src="about:blank"></iframe>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary" type="button" data-dismiss="modal">' . JText::_('SUNFW_OK') . '</button>
					<button class="btn" type="button" data-dismiss="modal">' . JText::_('SUNFW_CANCEL') . '</button>
				</div>
			</div>
			<script type="text/html" id="sunFwTemplateGallery">
				<div class="image-thumb">
					<span class="thumbnail">
						<img src="' . JUri::root(true) . '/{image}" />
					</span>
					<a class="remove-image" href="#"><i class="icon-trash"></i></a>
					<input type="hidden" name="{name}[]" value="{image}" />
				</div>
			</script>';

			define('JFormFieldSunFwGalleryInitialized', 1);
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

		// Load gallery selector stylesheet.
		$doc->addStylesheet("{$plgPath}/includes/admin/fields/sunfwgallery.css");

		// Load gallery selector script.
		$doc->addScript("{$plgPath}/includes/admin/fields/sunfwgallery.js");

		// Get link to media selector widget.
		$link = 'index.php?option=com_ajax&format=html&plugin=sunfw&context=media-selector&type=image&folder=images&handler=SunFwSelectImage&' .
			 JSession::getFormToken() . '=1';

		// Add script initialization.
		$script = ';var SunFwGallerySelectorConfig = {
			url: "' . JRoute::_($link, false) . '",
			root: "' . JUri::root(true) . '"
		};';

		$doc->addScriptDeclaration($script);
	}
}
