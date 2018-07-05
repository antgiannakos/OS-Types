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
 * Custom form field for selecting icon.
 *
 * @package     SUN Framework
 * @subpackage  Form
 * @since       1.0.0
 */
class JFormFieldSunFwIcon extends JFormField
{

	public $type = 'SunFwIcon';

	public function getInput()
	{
		$value = ( $value = htmlspecialchars($this->value, ENT_COMPAT, 'UTF-8') ) != '' ? $value : '';
		$html = '<div class="sunfw-icon-selector input-prepend input-append">';
		$html .= '<div class="add-on">';
		$html .= '<span class="sunfw-preview-icon"><i class="' . $value . '"></i></span>';
		$html .= '</div>';
		$html .= '<input type="text" class="input-medium ' . ( isset($this->element['class']) ? $this->element['class'] : '' ) . '" name="' .
			 $this->name . '" id="' . $this->id . '" value="' . $value . '" readonly="readonly" />';
		$html .= '<input type="hidden" value="" class="sunfw-selected-icon" />';
		$html .= '<a href="#sunFwModalIcon" data-toggle="modal" data-name="' . $this->name . '" class="btn btn-default">...</a>';
		$html .= '<a href="javascript:void(0)" class="sunfw-clear-icon btn btn-default ' . ( $this->value ? '' : 'hidden' ) . '">x</a>';
		$html .= '</div>';
		
		if (!defined('JFormFieldSunFwIconInitialized'))
		{
			$this->addAssets();
			
			$fontAwesomes = $this->getFontAwesomeList();
			$allFontAwesomes = array();
			$tmpFontAwesomeCategories = array(
				'all-icons'
			);
			$fontAwesomeCategories = array();
			$cbFontAwesomeCategories = array();
			
			if (count($fontAwesomes))
			{
				$tmpFontAwesomeCategories = array_merge($tmpFontAwesomeCategories, array_keys($fontAwesomes));
				
				foreach ($tmpFontAwesomeCategories as $tmpFontAwesomeCategory)
				{
					$fontAwesomeCategories[$tmpFontAwesomeCategory] = ucfirst(str_replace('-', ' ', $tmpFontAwesomeCategory));
					$cbFontAwesomeCategories[] = array(
						'text' => ucfirst(str_replace('-', ' ', $tmpFontAwesomeCategory)),
						'value' => $tmpFontAwesomeCategory
					);
				}
				
				foreach ($fontAwesomes as $fontAwesome)
				{
					$allFontAwesomes = array_merge($allFontAwesomes, $fontAwesome);
				}
			}
			
			$fontAwesomeCategoriesGenericList = JHTML::_('select.genericList', $cbFontAwesomeCategories, '', 'class="sunfw_font_category inputbox"', 
				'value', 'text', 'all-icons');
			
			$script = ';var SunFwIconSelectorConfig = {
				icons: ' . json_encode($fontAwesomes) . ',
				categories: ' . json_encode($fontAwesomeCategories) . ',
				allIcons: ' . json_encode($allFontAwesomes) . '
			};';
			
			JFactory::getDocument()->addScriptDeclaration($script);
			
			$html .= '<div id="sunFwModalIcon" class="modal hide" tabindex="-1" role="dialog">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3>' . JText::_('SUNFW_ICON_SELECTOR') . '</h3>
				</div>
				<div class="modal-body">
					<div class="pull-left">
						' . $fontAwesomeCategoriesGenericList . '
					</div>
					<div class="pull-right">
						<input type="text" placeholder="Search..." value="" class="sunfw-quicksearch-icon"/>
					</div>
					<div class="sunfw-show-icon-container"></div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary select-icon-btn" type="button">' . JText::_('SUNFW_OK') . '</button>
					<button class="btn" data-dismiss="modal">' . JText::_('SUNFW_CANCEL') . '</button>
				</div>
			</div>';
			
			define('JFormFieldSunFwIconInitialized', 1);
		}
		
		return $html;
	}

	protected function getFontAwesomeList()
	{
		$path = JPATH_ROOT . '/plugins/system/sunfw/assets/3rd-party/font-awesome/font-list.json';
		
		if (file_exists($path))
		{
			return json_decode(file_get_contents($path), true);
		}
		
		return array();
	}

	protected function addAssets()
	{
		$doc = JFactory::getDocument();
		$plgPath = JUri::root(true) . '/plugins/system/sunfw';
		
		$doc->addStylesheet("{$plgPath}/assets/3rd-party/font-awesome/css/font-awesome.min.css");
		$doc->addStylesheet("{$plgPath}/includes/admin/fields/modal.css");
		$doc->addStylesheet("{$plgPath}/includes/admin/fields/sunfwicon.css");
		
		$doc->addScript("{$plgPath}/includes/admin/fields/sunfwicon.js");
	}
}
