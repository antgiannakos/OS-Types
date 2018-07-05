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
 * General ScssCompile class.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */

use Leafo\ScssPhp\Compiler;

class SunFwScsscompile
{

	/**
	 * @var URL Path
	 * @since 1.0.0
	 */
	private $path;

	/**
	 * @var Scss format
	 * @since 1.0.0
	 */
	private $format = 'Leafo\ScssPhp\Formatter\Expanded';

	/**
	 * @var Scss vars
	 * @since 1.0.0
	 */
	private $vars;

	/**
	 * @var Scss content
	 * @since 1.0.0
	 */
	private $content;

	/**
	 * @var css file
	 * @since 1.0.0
	 */
	private $css;

	/**
	 * @var
	 * @since version
	 */
	private $scss;

	public function __construct()
	{
		$this->scss = new Compiler();
	}

	/**
	 * @return mixed
	 */
	public function getCss()
	{
		return $this->css;
	}

	/**
	 * @param mixed $css
	 */
	public function setCss($css)
	{
		$this->css = $css;
	}

	/**
	 * @return mixed
	 */
	public function getPath()
	{
		return $this->path;
	}

	/**
	 * @param mixed $path
	 */
	public function setPath($path)
	{
		$this->path = $path;
	}

	/**
	 * @return mixed
	 */
	public function getFormat()
	{
		return $this->format;
	}

	/**
	 * @param mixed $format
	 */
	public function setFormat($format)
	{
		$this->format = $format;
	}

	/**
	 * @return mixed
	 */
	public function getVars()
	{
		return $this->vars;
	}

	/**
	 * @param mixed $vars
	 */
	public function setVars($vars)
	{
		$this->vars = $vars;
	}

	/**
	 * @return mixed
	 */
	public function getContent()
	{
		return $this->content;
	}

	/**
	 * @param mixed $content
	 */
	public function setContent($content)
	{
		$this->content = $content;
	}

	/**
	 * @param $name
	 * @param callable $callable
	 * @param array $prototype
	 *
	 *
	 * @since version
	 */
	public function registerFunction($name, callable $callable, $prototype = array())
	{
		$this->scss->registerFunction($name, $callable, $prototype);
	}

	/**
	 * @param $name
	 *
	 *
	 * @since version
	 */
	public function unregisterFunction($name)
	{
		$this->scss->unregisterFunction($name);
	}

	/**
	 * compile scss
	 *
	 * @param string $templateName
	 * @param string $compiledFileName
	 * @throws Exception
	 */
	public function scssCompile($templateName, $compiledFileName)
	{
		try
		{
			if ($this->getPath())
				$this->scss->setImportPaths($this->getPath());
			if ($this->getFormat())
				$this->scss->setFormatter($this->getFormat());
			if ($this->getVars())
				$this->scss->setVariables($this->getVars());
			
			$string_css = $this->scss->compile($this->getContent());
			
			$this->saveCssFile($templateName, $compiledFileName, $string_css);
		}
		catch (Exception $e)
		{
			throw new Exception($e->getMessage());
		}
	}

	/**
	 * @param $templateName
	 * @param $compiledFileName
	 * @param $string_css
	 *
	 * @return bool
	 *
	 * @since version
	 * @throws Exception
	 */
	private function saveCssFile($templateName, $compiledFileName, $string_css)
	{
		$file = JPath::clean(JPATH_SITE . "/templates/{$templateName}/" . $compiledFileName . ".css");
		
		if (!JFile::exists($file))
		{
			$content = '';
			$rw = JFile::write($file, $content);
			
			if (!$rw)
			{
				return true;
			}
		}
		
		if (!is_writable($file))
		{
			// Try to change ownership of the file.
			$user = get_current_user();
			
			chown($file, $user);
			
			if (!JPath::setPermissions($file, '0644'))
			{
				throw new Exception(JText::sprintf('SUNFW_FILE_NOT_WRITABLE', $compiledFileName . ".css"));
			}
			
			if (!JPath::isOwner($file))
			{
				throw new Exception(JText::_('SUNFW_CHECK_FILE_OWNERSHIP'));
			}
		}
		
		if (!JFile::write($file, $string_css))
		{
			throw new Exception(JText::sprintf('SUNFW_ERROR_FAILED_TO_SAVE_FILENAME', '*.css'));
		}
		
		return true;
	}
}