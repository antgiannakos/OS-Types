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
defined('_JEXEC') or die();

function modChrome_no($module, &$params, &$attribs)
{
	if ($module->content)
	{
		echo $module->content;
	}
}

function modChrome_well($module, &$params, &$attribs)
{
	$moduleTag = $params->get('module_tag', 'div');
	$bootstrapSize = (int) $params->get('bootstrap_size', 0);
	$moduleClass = $bootstrapSize != 0 ? ' span' . $bootstrapSize : '';
	$headerTag = htmlspecialchars($params->get('header_tag', 'h3'));
	$headerClass = htmlspecialchars($params->get('header_class', 'box-title'));
	
	if ($module->content)
	{
		echo '<' . $moduleTag . ' class="well ' . htmlspecialchars($params->get('moduleclass_sfx')) . $moduleClass . '">';
		
		if ($module->showtitle)
		{
			echo '<' . $headerTag . ' class="' . $headerClass . '">' . $module->title . '</' . $headerTag . '>';
		}
		
		echo $module->content;
		echo '</' . $moduleTag . '>';
	}
}

function modChrome_module_style_1($module, &$params, &$attribs)
{
	$moduleTag = $params->get('module_tag', 'div');
	$bootstrapSize = (int) $params->get('bootstrap_size', 0);
	$moduleClass = $bootstrapSize != 0 ? ' span' . $bootstrapSize : '';
	$headerTag = htmlspecialchars($params->get('header_tag', 'h3'));
	$headerClass = htmlspecialchars($params->get('header_class', ''));
	
	if ($module->content)
	{
		echo '<' . $moduleTag . ' class="module-style module-style-1 ' . htmlspecialchars($params->get('moduleclass_sfx')) . $moduleClass . '">';
		
		if ($module->showtitle)
		{
			echo '<div class="module-title"><' . $headerTag . ' class="box-title ' . $headerClass . '">' . $module->title . '</' . $headerTag .
				 '></div>';
		}
		
		echo '<div class="module-body">';
		echo $module->content;
		echo "</div>";
		
		echo '</' . $moduleTag . '>';
	}
}

function modChrome_module_style_2($module, &$params, &$attribs)
{
	$moduleTag = $params->get('module_tag', 'div');
	$bootstrapSize = (int) $params->get('bootstrap_size', 0);
	$moduleClass = $bootstrapSize != 0 ? ' span' . $bootstrapSize : '';
	$headerTag = htmlspecialchars($params->get('header_tag', 'h3'));
	$headerClass = htmlspecialchars($params->get('header_class', ''));
	
	if ($module->content)
	{
		echo '<' . $moduleTag . ' class="module-style module-style-2 ' . htmlspecialchars($params->get('moduleclass_sfx')) . $moduleClass . '">';
		
		if ($module->showtitle)
		{
			echo '<div class="module-title"><' . $headerTag . ' class="box-title ' . $headerClass . '">' . $module->title . '</' . $headerTag .
				 '></div>';
		}
		
		echo '<div class="module-body">';
		echo $module->content;
		echo "</div>";
		
		echo '</' . $moduleTag . '>';
	}
}

function modChrome_module_style_3($module, &$params, &$attribs)
{
	$moduleTag = $params->get('module_tag', 'div');
	$bootstrapSize = (int) $params->get('bootstrap_size', 0);
	$moduleClass = $bootstrapSize != 0 ? ' span' . $bootstrapSize : '';
	$headerTag = htmlspecialchars($params->get('header_tag', 'h3'));
	$headerClass = htmlspecialchars($params->get('header_class', ''));
	
	if ($module->content)
	{
		echo '<' . $moduleTag . ' class="module-style module-style-3 ' . htmlspecialchars($params->get('moduleclass_sfx')) . $moduleClass . '">';
		
		if ($module->showtitle)
		{
			echo '<div class="module-title"><' . $headerTag . ' class="box-title ' . $headerClass . '">' . $module->title . '</' . $headerTag .
				 '></div>';
		}
		
		echo '<div class="module-body">';
		echo $module->content;
		echo "</div>";
		
		echo '</' . $moduleTag . '>';
	}
}

function modChrome_module_style_4($module, &$params, &$attribs)
{
	$moduleTag = $params->get('module_tag', 'div');
	$bootstrapSize = (int) $params->get('bootstrap_size', 0);
	$moduleClass = $bootstrapSize != 0 ? ' span' . $bootstrapSize : '';
	$headerTag = htmlspecialchars($params->get('header_tag', 'h3'));
	$headerClass = htmlspecialchars($params->get('header_class', ''));
	
	if ($module->content)
	{
		echo '<' . $moduleTag . ' class="module-style module-style-4 ' . htmlspecialchars($params->get('moduleclass_sfx')) . $moduleClass . '">';
		
		if ($module->showtitle)
		{
			echo '<div class="module-title"><' . $headerTag . ' class="box-title ' . $headerClass . '">' . $module->title . '</' . $headerTag .
				 '></div>';
		}
		
		echo '<div class="module-body">';
		echo $module->content;
		echo "</div>";
		
		echo '</' . $moduleTag . '>';
	}
}