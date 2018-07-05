<?php
/**
 * @version   $Id$
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
 * General ScssRender class.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwScssrender
{

	/**
	 * @var array
	 * @since version
	 */
	private $_scssVars = array();

	/**
	 * @param $styleID
	 * @param $templateName
	 * @param string $s
	 *
	 *
	 * @since version
	 * @throws Exception
	 */
	public function convertSubParams($params, $key)
	{
		$arr = array();
		
		foreach ($params as $k => $v)
		{
			$arr[$key . $k] = $v;
		}
		
		return $arr;
	}

	public function padding($array)
	{
		$arr = array(
			'top' => 'false',
			'bottom' => 'false',
			'right' => 'false',
			'left' => 'false'
		);
		if (is_array($array))
		{
			return array_merge($arr, array_filter($array, 'strlen'));
		}
		else
		{
			return $arr;
		}
	}

	public function bgImageSetting($array)
	{
		$arr = array(
			'repeat' => 'false',
			'attachment' => 'false',
			'size' => 'false',
			'position' => 'false'
		);
		if (is_array($array))
		{
			return array_merge($arr, array_filter($array, 'strlen'));
		}
		else
		{
			return $arr;
		}
	}

	public function border($array)
	{
		$arr = array(
			'universal' => 0,
			'width' => 'false',
			'style' => 'false',
			'color' => 'false',
			'top-width' => 'false',
			'top-style' => 'false',
			'top-color' => 'false',
			'right-width' => 'false',
			'right-style' => 'false',
			'right-color' => 'false',
			'bottom-width' => 'false',
			'bottom-style' => 'false',
			'bottom-color' => 'false',
			'left-width' => 'false',
			'left-style' => 'false',
			'left-color' => 'false'
		
		);
		if (is_array($array))
		{
			return array_merge($arr, array_filter($array, 'strlen'));
		}
		else
		{
			return $arr;
		}
	}

	public function borderRadius($array)
	{
		$arr = array(
			'top-left' => 'false',
			'top-right' => 'false',
			'bottom-right' => 'false',
			'bottom-left' => 'false'
		);
		if (is_array($array))
		{
			return array_merge($arr, array_filter($array, 'strlen'));
		}
		else
		{
			return $arr;
		}
	}

	public function boxShadow($array)
	{
		$arr = array(
			'h-shadow' => 0,
			'v-shadow' => 0,
			'blur' => 0,
			'spread' => 0,
			'color' => 'false',
			'inset' => 'false'
		);
		if (is_array($array))
		{
			return array_merge($arr, array_filter($array, 'strlen'));
		}
		else
		{
			return $arr;
		}
	}

	public function textShadow($array)
	{
		$arr = array(
			'h-shadow' => 0,
			'v-shadow' => 0,
			'blur' => 0,
			'color' => 'false'
		);
		if (is_array($array))
		{
			return array_merge($arr, array_filter($array, 'strlen'));
		}
		else
		{
			return $arr;
		}
	}

	public function sectionParams($array, $type)
	{
		switch ($type)
		{
			case 'heading':
				$arr = array(
					'custom' => 0,
					'headings-color' => 'false',
					'headings-text-transform' => 'false',
					'headings-text-shadow-h-shadow' => 0,
					'headings-text-shadow-v-shadow' => 0,
					'headings-text-shadow-blur' => 0,
					'headings-text-shadow-color' => 'false',
					'headings-base-size' => 'false',
					'headings-line-height' => 'false',
					'headings-letter-spacing' => 'false',
					'headings-font-weight' => 'false'
				);
			break;
			case 'content':
				$arr = array(
					'custom' => 0,
					'text-color' => 'false',
					'font-size-base' => 'false',
					'line-height' => 'false'
				);
			break;
			case 'link':
				$arr = array(
					'custom' => 0,
					'link-color' => 'false',
					'link-color-hover' => 'false'
				);
			break;
			case 'section':
				$arr = array(
					'background-color' => 'false',
					'background-image' => 'false',
					'background-image-settings-repeat' => 'false',
					'background-image-settings-attachment' => 'false',
					'background-image-settings-size' => 'false',
					'background-image-settings-position' => 'false',
					'border-universal' => 'false',
					'border-width' => 'false',
					'border-style' => 'false',
					'border-color' => 'false',
					'border-top-width' => 'false',
					'border-top-style' => 'false',
					'border-top-color' => 'false',
					'border-right-width' => 'false',
					'border-right-style' => 'false',
					'border-right-color' => 'false',
					'border-bottom-width' => 'false',
					'border-bottom-style' => 'false',
					'border-bottom-color' => 'false',
					'border-left-width' => 'false',
					'border-left-style' => 'false',
					'border-left-color' => 'false'
				);
			break;
			case 'buttonDefault':
				$arr = array(
					'btn-default-padding-top' => 'false',
					'btn-default-padding-bottom' => 'false',
					'btn-default-padding-right' => 'false',
					'btn-default-padding-left' => 'false',
					'btn-default-bg' => 'false',
					'btn-default-border-all-universal' => 'false',
					'btn-default-border-all-width' => 'false',
					'btn-default-border-all-style' => 'false',
					'btn-default-border-all-color' => 'false',
					'btn-default-border-all-top-width' => 'false',
					'btn-default-border-all-top-style' => 'false',
					'btn-default-border-all-top-color' => 'false',
					'btn-default-border-all-right-width' => 'false',
					'btn-default-border-all-right-style' => 'false',
					'btn-default-border-all-right-color' => 'false',
					'btn-default-border-all-bottom-width' => 'false',
					'btn-default-border-all-bottom-style' => 'false',
					'btn-default-border-all-bottom-color' => 'false',
					'btn-default-border-all-left-width' => 'false',
					'btn-default-border-all-left-style' => 'false',
					'btn-default-border-all-left-color' => 'false',
					'btn-default-radius-top-left' => 'false',
					'btn-default-radius-top-right' => 'false',
					'btn-default-radius-bottom-right' => 'false',
					'btn-default-radius-bottom-left' => 'false',
					'btn-default-box-shadow-h-shadow' => 'false',
					'btn-default-box-shadow-v-shadow' => 'false',
					'btn-default-box-shadow-blur' => 'false',
					'btn-default-box-shadow-spread' => 'false',
					'btn-default-box-shadow-color' => 'false',
					'btn-default-box-shadow-inset' => 'false',
					'btn-default-color' => 'false',
					'btn-default-font-weight' => 'false',
					'btn-default-font-style' => 'false',
					'btn-default-text-transform' => 'false',
					'btn-default-text-shadow-h-shadow' => 'false',
					'btn-default-text-shadow-v-shadow' => 'false',
					'btn-default-text-shadow-blur' => 'false',
					'btn-default-text-shadow-color' => 'false',
					'btn-default-base-size' => 'false',
					'btn-default-letter-spacing' => 'false',
					'btn-default-bg-hover' => 'false',
					'btn-default-border-hover' => 'false',
					'btn-default-color-hover' => 'false',
					'custom' => 'false'
				);
			break;
			case 'buttonPrimary':
				$arr = array(
					'btn-primary-bg' => 'false',
					'btn-primary-border-all-universal' => 'false',
					'btn-primary-border-all-width' => 'false',
					'btn-primary-border-all-style' => 'false',
					'btn-primary-border-all-color' => 'false',
					'btn-primary-border-all-top-width' => 'false',
					'btn-primary-border-all-top-style' => 'false',
					'btn-primary-border-all-top-color' => 'false',
					'btn-primary-border-all-right-width' => 'false',
					'btn-primary-border-all-right-style' => 'false',
					'btn-primary-border-all-right-color' => 'false',
					'btn-primary-border-all-bottom-width' => 'false',
					'btn-primary-border-all-bottom-style' => 'false',
					'btn-primary-border-all-bottom-color' => 'false',
					'btn-primary-border-all-left-width' => 'false',
					'btn-primary-border-all-left-style' => 'false',
					'btn-primary-border-all-left-color' => 'false',
					'btn-primary-box-shadow-h-shadow' => 'false',
					'btn-primary-box-shadow-v-shadow' => 'false',
					'btn-primary-box-shadow-blur' => 'false',
					'btn-primary-box-shadow-spread' => 'false',
					'btn-primary-box-shadow-color' => 'false',
					'btn-primary-box-shadow-inset' => 'false',
					'btn-primary-color' => 'false',
					'btn-primary-text-shadow-h-shadow' => 'false',
					'btn-primary-text-shadow-v-shadow' => 'false',
					'btn-primary-text-shadow-blur' => 'false',
					'btn-primary-text-shadow-color' => 'false',
					'btn-primary-bg-hover' => 'false',
					'btn-primary-border-hover' => 'false',
					'btn-primary-color-hover' => 'false',
					'custom' => 'false'
				);
			break;
		}
		if (is_array($array))
		{
			$array_intersect = array_intersect_key($array, $arr);
			return array_merge($arr, array_filter($array_intersect, 'strlen'));
		}
		else
		{
			return $arr;
		}
	}

	public function moduleParams($array, $type)
	{
		switch ($type)
		{
			case 'title':
				$arr = array(
					'bg-color' => 'false',
					'text-color' => 'false',
					'text-transform' => 'false',
					'font-size' => 'false',
					'text-icon-size' => 'false',
					'text-icon-color' => 'false',
					'font-weight' => 'false'
				);
			break;
			case 'content':
				$arr = array(
					'color' => 'false',
					'font-size' => 'false'
				);
			break;
			case 'link':
				$arr = array(
					'link-color' => 'false',
					'link-hover-color' => 'false'
				);
			break;
			case 'module':
				$arr = array(
					'padding-top' => 'false',
					'padding-bottom' => 'false',
					'padding-right' => 'false',
					'padding-left' => 'false',
					'background-color' => 'false',
					'background-image' => 'false',
					'background-image-settings-repeat' => 'false',
					'background-image-settings-attachment' => 'false',
					'background-image-settings-size' => 'false',
					'background-image-settings-position' => 'false',
					'border-universal' => 'false',
					'border-width' => 'false',
					'border-style' => 'false',
					'border-color' => 'false',
					'border-top-width' => 'false',
					'border-top-style' => 'false',
					'border-top-color' => 'false',
					'border-right-width' => 'false',
					'border-right-style' => 'false',
					'border-right-color' => 'false',
					'border-bottom-width' => 'false',
					'border-bottom-style' => 'false',
					'border-bottom-color' => 'false',
					'border-left-width' => 'false',
					'border-left-style' => 'false',
					'border-left-color' => 'false'
				);
			break;
		}
		if (is_array($array))
		{
			$array_intersect = array_intersect_key($array, $arr);
			return array_merge($arr, array_filter($array_intersect, 'strlen'));
		}
		else
		{
			return $arr;
		}
	}

	public function menuParams($array, $type)
	{
		switch ($type)
		{
			case 'menuroot':
				$arr = array(
					'font-size' => 'false',
					'text-transform' => 'false',
					'background-color' => 'false',
					'color' => 'false',
					'background-color-hover' => 'false',
					'link-color-hover' => 'false',
					'font-type' => 'false',
					'standard-font-family' => 'false',
					'google-font-family' => 'false',
					'google-font-variant' => 'false',
					'google-font-style' => 'false',
					'custom-font-file' => 'false'
				);
			break;
			case 'menudropdown':
				$arr = array(
					'font-size' => 'false',
					'text-transform' => 'false',
					'background-color' => 'false',
					'color' => 'false',
					'background-color-hover' => 'false',
					'link-color-hover' => 'false',
					'width-dropdown' => 'false'
				);
			break;
		}
		if (is_array($array))
		{
			$array_intersect = array_intersect_key($array, $arr);
			return array_merge($arr, array_filter($array_intersect, 'strlen'));
		}
		else
		{
			return $arr;
		}
	}

	public function flatten($array, $prefix = '')
	{
		$result = array();
		foreach ($array as $key => $value)
		{
			if (is_array($value))
			{
				$result = $result + $this->flatten($value, $prefix . $key . '-');
			}
			else
			{
				$result[$prefix . $key] = $value;
			}
		}
		return $result;
	}

	public function compile($styleID, $templateName, $s = "appearance")
	{
		$genaralPathRoot = $sectionPathRoot = $modulePathRoot = JURI::root() . '/';
		
		$urlPattern = '/^(http|https)/';
		
		$style = SunFwHelper::getSunFwStyle($styleID);
		if (!count($style))
			return false;
		
		if ($s == "appearance")
		{
			
			$appearanceData = json_decode($style->appearance_data, true);
			
			try
			{
				
				// Compile General Style
				if (isset($appearanceData['general']))
				{
					$genaral = $this->_prevarUse($appearanceData['general']);
					
					$scss_genaral_content = 'body {';
					
					if (isset($genaral['page']['outer-background-image']) && $genaral['page']['outer-background-image'] != '')
					{
						
						preg_match($urlPattern, $genaral['page']['outer-background-image'], $m);
						
						if (count($m))
						{
							$genaralPathRoot = '';
						}
						else
						{
							$genaralPathRoot = '../../../../';
						}
						
						$scss_genaral_content .= "background-image: url('" . $genaralPathRoot . $genaral['page']['outer-background-image'] . "');";
					}
					
					// Style background
					if (isset($genaral['page']['outer-background-image-settings']))
					{
						
						$outerBgImg = $genaral['page']['outer-background-image-settings'];
						
						if (isset($outerBgImg['repeat']) && $outerBgImg['repeat'] != '')
						{
							$scss_genaral_content .= "background-repeat: " . $outerBgImg['repeat'] . ";";
						}
						
						if (isset($outerBgImg['size']) && $outerBgImg['size'] != '')
						{
							$scss_genaral_content .= "background-size: " . $outerBgImg['size'] . ";";
						}
						
						if (isset($outerBgImg['attachment']) && $outerBgImg['attachment'])
						{
							$scss_genaral_content .= "background-attachment: " . $outerBgImg['attachment'] . ";";
						}
						
						if (isset($outerBgImg['position']) && $outerBgImg['position'] != '')
						{
							$scss_genaral_content .= "background-position: " . $outerBgImg['position'] . ";";
						}
					}
					
					$scss_genaral_content .= "}";
					
					// Style border
					$cssInnerBorder = '.sunfw-content.boxLayout {';
					
					if (isset($genaral['page-inner']['inner-border']))
					{
						
						$innerBorder = $genaral['page-inner']['inner-border'];
						
						// Check universal
						if (isset($innerBorder['universal']) && intval($innerBorder['universal']))
						{
							
							if (isset($innerBorder['width']) && is_numeric($innerBorder['width']))
							{
								$cssInnerBorder .= 'border-width: ' . $innerBorder['width'] . 'px;';
							}
							
							if (isset($innerBorder['style']))
							{
								$cssInnerBorder .= 'border-style: ' . $innerBorder['style'] . ';';
							}
							
							if (isset($innerBorder['color']))
							{
								$cssInnerBorder .= 'border-color: ' . $innerBorder['color'] . ';';
							}
						}
						else
						{
							
							// Border Top
							if (isset($innerBorder['top-width']) && is_numeric($innerBorder['top-width']))
							{
								
								$cssInnerBorder .= 'border-top-width: ' . $innerBorder['top-width'] . 'px;';
							}
							
							if (isset($innerBorder['top-style']) && $innerBorder['top-style'] != '')
							{
								$cssInnerBorder .= 'border-top-style: ' . $innerBorder['top-style'] . ';';
							}
							
							if (isset($innerBorder['top-color']) && $innerBorder['top-color'] != '')
							{
								$cssInnerBorder .= 'border-top-color: ' . $innerBorder['top-color'] . ';';
							}
							
							// Border left
							if (isset($innerBorder['left-width']) && is_numeric($innerBorder['left-width']))
							{
								$cssInnerBorder .= 'border-left-width: ' . $innerBorder['left-width'] . 'px;';
							}
							
							if (isset($innerBorder['left-style']) && $innerBorder['left-style'] != '')
							{
								$cssInnerBorder .= 'border-left-style: ' . $innerBorder['left-style'] . ';';
							}
							
							if (isset($innerBorder['left-color']) && $innerBorder['left-color'] != '')
							{
								$cssInnerBorder .= 'border-left-color: ' . $innerBorder['left-color'] . ';';
							}
							
							// Border bottom
							if (isset($innerBorder['bottom-width']) && is_numeric($innerBorder['bottom-width']))
							{
								$cssInnerBorder .= 'border-bottom-width: ' . $innerBorder['bottom-width'] . 'px;';
							}
							
							if (isset($innerBorder['bottom-style']) && $innerBorder['bottom-style'] != '')
							{
								$cssInnerBorder .= 'border-bottom-style: ' . $innerBorder['bottom-style'] . ';';
							}
							
							if (isset($innerBorder['bottom-color']) && $innerBorder['bottom-color'] != '')
							{
								$cssInnerBorder .= 'border-bottom-color: ' . $innerBorder['bottom-color'] . ';';
							}
							
							// Border right
							if (isset($innerBorder['right-width']) && is_numeric($innerBorder['right-width']))
							{
								$cssInnerBorder .= 'border-right-width: ' . $innerBorder['right-width'] . 'px;';
							}
							
							if (isset($innerBorder['right-style']) && $innerBorder['right-style'] != '')
							{
								$cssInnerBorder .= 'border-right-style: ' . $innerBorder['right-style'] . ';';
							}
							
							if (isset($innerBorder['right-color']) && $innerBorder['right-color'] != '')
							{
								$cssInnerBorder .= 'border-right-color: ' . $innerBorder['right-color'] . ';';
							}
						}
					}
					
					$cssInnerBorder .= '}';
					
					// Heading Text Shadow
					if (isset($genaral['heading']['headings-text-shadow']) && is_array($genaral['heading']['headings-text-shadow']))
					{
						
						$headTextShadow = $genaral['heading']['headings-text-shadow'];
						
						foreach ($headTextShadow as $k => $v)
						{
							$genaral['heading']['headings-text-shadow-' . $k] = $v;
						}
					}
					
					// Heading Font Google
					if (isset($genaral['heading']['headings-google-font-family']) && is_array($genaral['heading']['headings-google-font-family']))
					{
						
						$headGoogleFont = $genaral['heading']['headings-google-font-family'];
						
						foreach ($headGoogleFont as $k => $v)
						{
							$genaral['heading']['headings-google-font-' . $k] = $v;
						}
					}
					
					// Heading Font Custom
					if (isset($genaral['heading']['headings-font-type']) && $genaral['heading']['headings-font-type'] == 'custom' &&
						 isset($genaral['heading']['headings-custom-font-file']))
					{
						
						$headCustomFont = basename($genaral['heading']['headings-custom-font-file']);
						$headCFNameFile = explode('.', $headCustomFont);
						$headCFName = $headCFNameFile[0];
						
						if (isset($headCFName) && $headCFName != '')
						{
							$genaral['heading']['headings-custom-font-family'] = $headCFName;
						}
						
						$scss_genaral_content .= '@font-face {
													font-family: ' . $headCFName . ';
													src: url(' . JURI::root() . $genaral["heading"]["headings-custom-font-file"] . ');
													font-weight: normal;
												}';
					}
					
					// Content Font
					if (isset($genaral['content']['content-google-font-family']) && is_array($genaral['content']['content-google-font-family']) &&
						 $genaral['content']['content-font-type'] != 'standard' && $genaral['content']['content-font-type'] != 'custom')
					{
						
						$contentGoogleFont = $genaral['content']['content-google-font-family'];
						foreach ($contentGoogleFont as $k => $v)
						{
							$genaral['content']['content-google-font-' . $k] = $v;
						}
						
						// Check italic
						if (strpos($genaral['content']['content-google-font-variant'], 'italic'))
						{
							$genaral['content']['content-google-font-variant'] = (int) $genaral['content']['content-google-font-variant'];
							$genaral['content']['content-google-font-style'] = 'italic';
						}
						else
						{
							$genaral['content']['content-google-font-style'] = 'false';
						}
					}
					
					// Content Font Custom
					if (isset($genaral['content']['content-font-type']) && $genaral['content']['content-font-type'] == 'custom' &&
						 isset($genaral['content']['content-custom-font-file']))
					{
						
						$contentCustomFont = basename($genaral['content']['content-custom-font-file']);
						$contentCFNameFile = explode('.', $contentCustomFont);
						$contentCFName = $contentCFNameFile[0];
						
						if (isset($contentCFName) && $contentCFName != '')
						{
							$genaral['content']['content-custom-font-family'] = $contentCFName;
						}
						
						$scss_genaral_content .= '@font-face {
													font-family: ' . $contentCFName . ';
													src: url(' . JURI::root() . $genaral["content"]["content-custom-font-file"] . ');
													font-weight: normal;
												}';
					}
					
					if (isset($genaral['default-button']))
					{
						
						if (is_array($genaral['default-button']['btn-default-padding']))
						{
							
							$btnDefautPadding = $genaral['default-button']['btn-default-padding'];
							
							$arrBtnDefautPadding = $this->convertSubParams($btnDefautPadding, 'btn-default-padding-');
							
							$genaral['default-button'] = array_merge($genaral['default-button'], $arrBtnDefautPadding);
						}
						
						if (is_array($genaral['default-button']['btn-default-box-shadow']))
						{
							
							$btnDefautBSD = $genaral['default-button']['btn-default-box-shadow'];
							
							$arrBtnDefautBSD = $this->convertSubParams($btnDefautBSD, 'btn-default-box-shadow-');
							
							$genaral['default-button'] = array_merge($genaral['default-button'], $arrBtnDefautBSD);
						}
						
						if (is_array($genaral['default-button']['btn-default-text-shadow']))
						{
							
							$btnDefautTBSD = $genaral['default-button']['btn-default-text-shadow'];
							
							$arrBtnDefautTBSD = $this->convertSubParams($btnDefautTBSD, 'btn-default-text-');
							
							$genaral['default-button'] = array_merge($genaral['default-button'], $arrBtnDefautTBSD);
						}
						
						if (is_array($genaral['default-button']['btn-default-border-all']))
						{
							
							$btnDefautBorder = $genaral['default-button']['btn-default-border-all'];
							
							$arrBtnDefautBorder = $this->convertSubParams($btnDefautBorder, 'default-button-border-');
							
							$genaral['default-button'] = array_merge($genaral['default-button'], $arrBtnDefautBorder);
						}
						
						if (is_array($genaral['default-button']['btn-default-radius']))
						{
							
							$btnRadius = $genaral['default-button']['btn-default-radius'];
							
							foreach ($btnRadius as $k => $v)
							{
								
								$genaral['default-button']['button-radius-' . $k] = $v;
							}
						}
					}
					
					if (isset($genaral['primary-button']))
					{
						
						if (is_array($genaral['primary-button']['btn-primary-border-all']))
						{
							
							$btnPrimaryBorder = $genaral['primary-button']['btn-primary-border-all'];
							
							$arrBtnPrimaryBorder = $this->convertSubParams($btnPrimaryBorder, 'primary-button-border-');
							
							$genaral['primary-button'] = array_merge($genaral['primary-button'], $arrBtnPrimaryBorder);
						}
						
						if (is_array($genaral['primary-button']['btn-primary-box-shadow']))
						{
							
							$btnPrimaryBSD = $genaral['primary-button']['btn-primary-box-shadow'];
							
							$arrBtnPrimaryBSD = $this->convertSubParams($btnPrimaryBSD, 'btn-primary-box-shadow-');
							
							$genaral['primary-button'] = array_merge($genaral['primary-button'], $arrBtnPrimaryBSD);
						}
						
						if (is_array($genaral['primary-button']['btn-primary-text-shadow']))
						{
							
							$btnPrimaryTBSD = $genaral['primary-button']['btn-primary-text-shadow'];
							
							$arrBtnPrimaryBSD = $this->convertSubParams($btnPrimaryTBSD, 'btn-primary-text-');
							
							$genaral['primary-button'] = array_merge($genaral['primary-button'], $arrBtnPrimaryBSD);
						}
					}
					
					// style boxshadow
					if (isset($genaral['page-inner']['inner-box-shadow']))
					{
						
						$innerBSD = $genaral['page-inner']['inner-box-shadow'];
						if (is_array($innerBSD))
						{
							foreach ($innerBSD as $k => $v)
							{
								
								$genaral['page-inner']['inner-bsd-' . $k] = $v;
							}
						}
					}
					
					$this->compileScss($genaral, 'general', $templateName, $scss_genaral_content . $cssInnerBorder, $styleID);
					
					//Compile Color
					if (isset($appearanceData['general']['color']))
					{
						$color = $this->_prevarUse($appearanceData['general']['color']);
						$this->compileColor($color, 'color', $templateName, $styleID);
					}
				}
				
				// Compile Sections Style
				if (isset($appearanceData['sections']))
				{
					
					$sections = $appearanceData['sections'];
					
					$scss_content = '';
					
					// Section
					foreach ($sections as $key => $section)
					{
						
						$scss_content .= "#sunfw_" . $key . "{";
						
						// Container
						if (isset($section['container']))
						{
							$container = $this->_prevarUse($section['container']);
							
							if (isset($container['background-image']) && $container['background-image'] != 'false')
							{
								
								preg_match($urlPattern, $container['background-image'], $m);
								if (count($m))
								{
									$sectionPathRoot = '';
								}
								else
								{
									$sectionPathRoot = '../../../../';
								}
								$container['background-image'] = "'" . $sectionPathRoot . $container['background-image'] . "'";
							}
							
							if (isset($container['background-image-settings']))
							{
								$container['background-image-settings'] = $this->bgImageSetting($container['background-image-settings']);
							}
							
							if (isset($container['border']))
							{
								$container['border'] = $this->border($container['border']);
							}
							
							$container = $this->flatten($container);
							
							$container = $this->sectionParams($container, 'section');
							
							if ($container)
								$scss_content .= "@include section(" . implode(",", $container) . ");";
						}
						
						// Heading
						if (isset($section['heading']))
						{
							$heading = $this->_prevarUse($section['heading']);
							$heading = $this->sectionParams($this->flatten($heading), 'heading');
							if ($heading)
								$scss_content .= "@include section-heading(" . implode(",", $heading) . ");";
						}
						
						// Content
						if (isset($section['content']))
						{
							$content = $this->_prevarUse($section['content']);
							$content = $this->sectionParams($content, 'content');
							if ($content)
								$scss_content .= "@include content-section(" . implode(",", $content) . ");";
						}
						
						// Link
						if (isset($section['link']))
						{
							$link = $this->_prevarUse($section['link']);
							$link = $this->sectionParams($link, 'link');
							if ($link)
								$scss_content .= "@include section-link(" . implode(",", $link) . ");";
						}
						
						//  Default button
						if (isset($section['default-button']))
						{
							
							$default_button = $this->_prevarUse($section['default-button']);
							
							if (isset($default_button['btn-default-padding']))
							{
								$default_button['btn-default-padding'] = $this->padding($default_button['btn-default-padding']);
							}
							if (isset($default_button['btn-default-border-all']))
							{
								$default_button['btn-default-border-all'] = $this->border($default_button['btn-default-border-all']);
							}
							if (isset($default_button['btn-default-radius']))
							{
								$default_button['btn-default-radius'] = $this->borderRadius($default_button['btn-default-radius']);
							}
							if (isset($default_button['btn-default-box-shadow']))
							{
								$default_button['btn-default-box-shadow'] = $this->boxShadow($default_button['btn-default-box-shadow']);
							}
							if (isset($default_button['btn-default-text-shadow']))
							{
								$default_button['btn-default-text-shadow'] = $this->textShadow($default_button['btn-default-text-shadow']);
							}
							
							$default_button = $this->flatten($default_button);
							
							$default_button = $this->sectionParams($default_button, 'buttonDefault');
							
							if ($default_button)
							{
								$scss_content .= "@include btn-section-default(" . implode(",", $default_button) . ");";
							}
						}
						
						// Primary button
						if (isset($section['primary-button']))
						{
							
							$primary_button = $this->_prevarUse($section['primary-button']);
							
							if (isset($primary_button['btn-primary-border-all']))
							{
								$primary_button['btn-primary-border-all'] = $this->border($primary_button['btn-primary-border-all']);
							}
							if (isset($primary_button['btn-primary-box-shadow']))
							{
								$primary_button['btn-primary-box-shadow'] = $this->boxShadow($primary_button['btn-primary-box-shadow']);
							}
							if (isset($primary_button['btn-primary-text-shadow']))
							{
								$primary_button['btn-primary-text-shadow'] = $this->textShadow($primary_button['btn-primary-text-shadow']);
							}
							
							$primary_button = $this->flatten($primary_button);
							
							$primary_button = $this->sectionParams($primary_button, 'buttonPrimary');
							
							if ($primary_button)
							{
								$scss_content .= "@include btn-section-primary(" . implode(",", $primary_button) . ");";
							}
						}
						$scss_content .= "}";
					}
					
					$this->compileScss(array(), 'sections', $templateName, $scss_content, $styleID);
				}
				
				// Compile Module Style
				if (isset($appearanceData['module']))
				{
					$modules = $appearanceData['module'];
					$scss_content = '';
					
					foreach ($modules as $key => $module_style)
					{
						
						if (empty($module_style))
							continue;
						
						$scss_content .= "body#sunfw-master ." . $key . "{";
						
						// Module container
						if (isset($module_style['container']))
						{
							
							$module_container = $this->_prevarUse($module_style['container']);
							
							if (isset($module_container['padding']))
							{
								$module_container['padding'] = $this->padding($module_container['padding']);
							}
							
							if (isset($module_container['background-image']) && $module_container['background-image'] != 'false')
							{
								preg_match($urlPattern, $module_container['background-image'], $m);
								
								if (count($m))
								{
									$modulePathRoot = '';
								}
								else
								{
									$modulePathRoot = '../../../../';
								}
								
								$module_container['background-image'] = "'" . $modulePathRoot . $module_container['background-image'] . "'";
							}
							
							if (isset($module_container['background-image-settings']))
							{
								$module_container['background-image-settings'] = $this->bgImageSetting($module_container['background-image-settings']);
							}
							
							if (isset($module_container['border']))
							{
								$module_container['border'] = $this->border($module_container['border']);
							}
							
							$module_container = $this->flatten($module_container);
							
							$module_container = $this->moduleParams($module_container, 'module');
							
							if ($module_container)
								$scss_content .= "@include module-container(" . implode(",", $module_container) . ");";
						}
						
						// Module title
						if (isset($module_style['title']))
						{
							
							$module_title = $this->_prevarUse($module_style['title']);
							
							$module_title = $this->moduleParams($module_title, 'title');
							
							if ($module_title)
								$scss_content .= "@include module-title(" . implode(",", $module_title) . ");";
						}
						
						$scss_content .= ".module-body, .custom {";
						
						// Module content
						if (isset($module_style['content']))
						{
							
							$module_content = $this->_prevarUse($module_style['content']);
							
							$module_content = $this->moduleParams($module_content, 'content');
							
							if ($module_content)
								$scss_content .= "@include module-content(" . implode(",", $module_content) . ");";
						}
						
						// Module link
						if (isset($module_style['link']))
						{
							
							$module_link = $this->_prevarUse($module_style['link']);
							
							$module_link = $this->moduleParams($module_link, 'link');
							
							if ($module_link)
								$scss_content .= "@include link(" . implode(",", $module_link) . ");";
						}
						
						$scss_content .= "}";
						
						// Module default button
						if (isset($module_style['default-button']))
						{
							
							$module_default_button = $this->_prevarUse($module_style['default-button']);
							
							if (isset($module_default_button['btn-default-padding']))
							{
								$module_default_button['btn-default-padding'] = $this->padding($module_default_button['btn-default-padding']);
							}
							if (isset($module_default_button['btn-default-border-all']))
							{
								$module_default_button['btn-default-border-all'] = $this->border($module_default_button['btn-default-border-all']);
							}
							if (isset($module_default_button['btn-default-radius']))
							{
								$module_default_button['btn-default-radius'] = $this->borderRadius($module_default_button['btn-default-radius']);
							}
							if (isset($module_default_button['btn-default-box-shadow']))
							{
								$module_default_button['btn-default-box-shadow'] = $this->boxShadow($module_default_button['btn-default-box-shadow']);
							}
							if (isset($module_default_button['btn-default-text-shadow']))
							{
								$module_default_button['btn-default-text-shadow'] = $this->textShadow(
									$module_default_button['btn-default-text-shadow']);
							}
							
							$module_default_button = $this->flatten($module_default_button);
							
							$module_default_button = $this->sectionParams($module_default_button, 'buttonDefault');
							
							if ($module_default_button)
							{
								$scss_content .= "@include btn-module-default(" . implode(",", $module_default_button) . ");";
							}
						}
						
						//Module primary button
						if (isset($module_style['primary-button']))
						{
							
							$module_primary_button = $this->_prevarUse($module_style['primary-button']);
							
							if (isset($module_primary_button['btn-primary-border-all']))
							{
								$module_primary_button['btn-primary-border-all'] = $this->border($module_primary_button['btn-primary-border-all']);
							}
							if (isset($module_primary_button['btn-primary-box-shadow']))
							{
								$module_primary_button['btn-primary-box-shadow'] = $this->boxShadow($module_primary_button['btn-primary-box-shadow']);
							}
							if (isset($module_primary_button['btn-primary-text-shadow']))
							{
								$module_primary_button['btn-primary-text-shadow'] = $this->textShadow(
									$module_primary_button['btn-primary-text-shadow']);
							}
							
							$module_primary_button = $this->flatten($module_primary_button);
							
							$module_primary_button = $this->sectionParams($module_primary_button, 'buttonPrimary');
							
							if ($module_primary_button)
							{
								$scss_content .= "@include btn-module-primary(" . implode(",", $module_primary_button) . ");";
							}
						}
						
						$scss_content .= "}";
					}
					
					$this->compileScss(array(), 'modules', $templateName, $scss_content, $styleID);
				}
				
				// Compile Menu Style
				if (isset($appearanceData['menu']))
				{
					//$menu = $this->_prevarUse($appearanceData['menu']);
					$menus = $appearanceData['menu'];
					$scss_content = '';
					
					// Menu
					foreach ($menus as $key => $menu)
					{
						
						$scss_content .= "#menu_" . $key . "{";
						
						// Root Menu
						if (isset($menu['root']))
						{
							
							$root = $this->_prevarUse($menu['root']);
							
							// Menu Font Google
							if (isset($root['google-font-family']) && is_array($root['google-font-family']))
							{
								
								$rootGoogleFont = $root['google-font-family'];
								
								foreach ($rootGoogleFont as $k => $v)
								{
									$root['google-font-' . $k] = $v;
								}
								
								// Check italic
								if (strpos($root['google-font-variant'], 'italic'))
								{
									$root['google-font-variant'] = (int) $root['google-font-variant'];
									$root['google-font-style'] = 'italic';
								}
								else
								{
									$root['google-font-style'] = 'false';
								}
							}
							
							// Menu Font Custom
							$menuCFName = 'false';
							if (isset($root['custom-font-file']) && $root['font-type'] == 'custom')
							{
								
								$menuCustomFont = basename($root['custom-font-file']);
								$menuCFNameFile = explode('.', $menuCustomFont);
								$menuCFName = $menuCFNameFile[0];
								
								$scss_content .= '@font-face {
													font-family: ' . $menuCFName . ';
													src: url(' . JURI::root() . $root['custom-font-file'] . ');
													font-weight: normal;
												}';
							}
							
							$root = $this->menuParams($root, 'menuroot');
							
							$menuSF = str_replace(',', 'sunfwdbquotes', $root['standard-font-family']);
							$root['standard-font-family'] = $menuSF;
							
							$menuGF = explode(':', $root['google-font-family']);
							
							$root['google-font-family'] = "'" . $menuGF[0] . "'";
							
							$root['custom-font-file'] = $menuCFName;
							
							if ($root)
								$scss_content .= '@include menu-root(' . implode(",", $root) . ');';
						}
						
						// Dropdown Menu
						if (isset($menu['dropdown']))
						{
							
							$dropdown = $this->_prevarUse($menu['dropdown']);
							$dropdown = $this->menuParams($dropdown, 'menudropdown');
							if ($dropdown)
								$scss_content .= "@include menu-dropdown(" . implode(",", $dropdown) . ");";
						}
						
						$scss_content .= "}";
					}
					$this->compileScss(array(), 'menu', $templateName, $scss_content, $styleID);
				}
			}
			catch (Exception $e)
			{
				throw new Exception($e);
			}
		}
		elseif ($s == "layout")
		{
			
			// Define supported CSS properties.
			$css_properties = array(
				'padding-left',
				'padding-right',
				'padding-bottom',
				'padding-top',
				'margin-left',
				'margin-right',
				'margin-bottom',
				'margin-top'
			);
			
			$data_layout = json_decode($style->layout_builder_data, true);
			
			// Get scss content.
			
			$scss_content = file_get_contents(SUNFW_PATH . "/includes/scss/_layout.scss");
			
			// Check if boxed layout is enabled?
			$boxed_layout = isset($data_layout['settings']['enable_boxed_layout']) ? $data_layout['settings']['enable_boxed_layout'] : false;
			
			$width_boxed_layout = !empty($data_layout['settings']['width_boxed_layout']) ? $data_layout['settings']['width_boxed_layout'] : 960;
			
			// Get width boxed layout
			if ($boxed_layout && $width_boxed_layout >= 768)
			{
				$scss_content .= '.sunfw-content { @include boxed-layout( ' . $width_boxed_layout . 'px); }';
			}
			
			// Get margin of page
			if (isset($data_layout['settings']['margin']))
			{
				if (is_array($data_layout['settings']['margin']))
				{
					
					$page_margin = $data_layout['settings']['margin'];
					$scss_content .= '.sunfw-content {';
					foreach ($page_margin as $key => $value)
					{
						$scss_content .= 'margin-' . $key . ': ' . $value . 'px;';
					}
					$scss_content .= '}';
				}
			}
			// Get all sections.
			$data_layout_sections = isset($data_layout['sections']) ? $data_layout['sections'] : array();
			
			// Generate CSS rules for all sections.
			foreach ($data_layout_sections as $key => $section)
			{
				if (!empty($section) && is_array($section))
				{
					$scss_content .= '#sunfw_' . $section['id'] . '{';
					
					// Get section settings.
					if (is_array($section['settings']))
					{
						$settings = $this->flatten($section['settings']);
						foreach ($settings as $key => $setting)
						{
							if (in_array($key, $css_properties) && $setting != '')
							{
								$scss_content .= $key . ': ' . $setting . 'px;';
							}
						}
					}
					$scss_content .= '}';
				}
			}
			
			//Get all rows
			$data_layout_columns = isset($data_layout['rows']) ? $data_layout['rows'] : array();
			foreach ($data_layout_columns as $key => $row)
			{
				if (!empty($row) && is_array($row))
				{
					$scss_content .= '#' . $row['id'] . '{';
					
					// Get row settings.
					if (is_array($row['settings']))
					{
						$settings = $this->flatten($row['settings']);
						foreach ($settings as $key => $setting)
						{
							if (in_array($key, $css_properties) && $setting != '')
							{
								$scss_content .= $key . ': ' . $setting . 'px;';
							}
						}
					}
					
					$scss_content .= '}';
				}
			}
			// Generate CSS rules for all rows.
			
			//Get all columns
			$data_layout_columns = isset($data_layout['columns']) ? $data_layout['columns'] : array();
			
			// Generate CSS rules for all column.
			foreach ($data_layout_columns as $key => $column)
			{
				if (!empty($column) && is_array($column))
				{
					$scss_content .= '#' . $column['id'] . '{';
					
					// Get column settings.
					if (is_array($column['settings']))
					{
						$settings = $this->flatten($column['settings']);
						foreach ($settings as $key => $setting)
						{
							if (in_array($key, $css_properties) && $setting != '')
							{
								$scss_content .= $key . ': ' . $setting . 'px;';
							}
						}
					}
					
					$scss_content .= '}';
				}
			}
			
			$this->compileScss(array(), 'layout', $templateName, $scss_content, $styleID);
		}
	}

	/**
	 * @param array $vars
	 * @param $file_name
	 * @param $templateName
	 * @param string $scss_content
	 *
	 * @return mixed
	 *
	 * @since version
	 * @throws Exception
	 */
	public function compileScss($vars = array(), $file_name, $templateName, $scss_content = '', $styleID)
	{
		try
		{
			
			//  handles variables
			$this->_scssVars = array();
			$this->_convertScssVar($vars);
			
			// Check empty var data
			foreach ($this->_scssVars as $key => $value)
			{
				if ($this->_scssVars[$key] == '')
				{
					$this->_scssVars[$key] = 'false';
				}
			}
			$scss = new SunFwScsscompile();
			$content = file_get_contents(SUNFW_PATH . "/includes/scss/_" . $file_name . ".scss") . $scss_content;
			
			$scss->setPath(SUNFW_PATH . "/includes/scss/");
			$scss->setVars($this->_scssVars);
			$scss->setContent($content);
			$scss->scssCompile($templateName, "css/core/" . $file_name . '_' . md5($styleID));
			
			// Check overwrite sass General in template
			if ($file_name == 'general' && file_exists(JPATH_SITE . "/templates/{$templateName}/scss/_general.scss"))
			{
				$generalOverwrite = file_get_contents(JPATH_SITE . "/templates/{$templateName}/scss/_general.scss");
				$scss->setContent($generalOverwrite);
				$scss->scssCompile($templateName, "css/core/general_overwrite_" . md5($styleID));
			}
			
			return json_encode(array(
				'type' => "success"
			));
		}
		catch (Exception $e)
		{
			throw new Exception($e);
		}
	}

	public function compileColor($vars = array(), $file_name, $templateName, $styleID)
	{
		try
		{
			//  handles variables
			$this->_scssVars = array();
			$this->_convertScssVar($vars);
			
			// Check empty var data
			foreach ($this->_scssVars as $key => $value)
			{
				if ($this->_scssVars[$key] == '')
				{
					$this->_scssVars[$key] = 'false';
				}
			}
			
			$scss = new SunFwScsscompile();
			$sunFwStyle = SunFwHelper::getOnlySunFwStyle($styleID);
			$systemData = json_decode($sunFwStyle->system_data, true);

			if (file_exists(JPATH_SITE . "/templates/{$templateName}/scss/" . $file_name . ".scss"))
			{
				$content = file_get_contents(JPATH_SITE . "/templates/{$templateName}/scss/" . $file_name . ".scss");
				$scss->setPath(JPATH_SITE . "/templates/{$templateName}/scss/");
				$scss->setVars($this->_scssVars);
				$scss->setContent($content);
				$scss->scssCompile($templateName, "css/" . $file_name . '_' . md5($styleID));
			}

			if (isset($systemData['niche-style']) && $systemData['niche-style'] != '')
			{
				$niche = $systemData['niche-style'];
				if (file_exists(JPATH_SITE . "/templates/{$templateName}/niches/{$niche}/scss/" . $file_name . ".scss"))
				{
					$content = file_get_contents(JPATH_SITE . "/templates/{$templateName}/niches/{$niche}/scss/" . $file_name . ".scss");
					$scss->setPath(JPATH_SITE . "/templates/{$templateName}/niches/{$niche}/scss/");
					$scss->setVars($this->_scssVars);
					$scss->setContent($content);
					$scss->scssCompile($templateName, "niches/{$niche}/css/" . $file_name . '_' . md5($styleID));
				}
			}
			
			return json_encode(array(
				'type' => "success"
			));
		}
		catch (Exception $e)
		{
			throw new Exception($e);
		}
	}

	/**
	 * @param $data
	 *
	 *
	 * @since version
	 */
	private function _convertScssVar($data)
	{
		foreach ($data as $key => $value)
		{
			if (is_array($value))
			{
				$this->_convertScssVar($value);
			}
			else
			{
				$this->_scssVars[$key] = trim($value);
			}
		}
	}

	/**
	 * @param $data
	 *
	 * @return array|bool
	 *
	 * @since version
	 */
	public function _prevarUse($data)
	{
		if (!isset($data))
			return false;
		
		$new_data = array();
		
		foreach ($data as $key => $value)
		{
			if ($value == '')
			{
				$new_data[$key] = 'false';
			}
			else
			{
				$new_data[$key] = $value;
			}
		}
		
		return $new_data;
	}

	public function resortArray($source, $key)
	{
		if (isset($source[$key]))
		{
			$tmpWidthDropDown = $source[$key];
			unset($source[$key]);
		}
		else
		{
			$tmpWidthDropDown = '';
		}
		$tmpArray[$key] = $tmpWidthDropDown;
		
		array_push($source, $tmpArray[$key]);
		
		return $source;
	}
}