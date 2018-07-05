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

// No direct access to this file.
defined('_JEXEC') or die('Restricted access');

// Define neccessary constants.
require_once dirname(__FILE__) . '/sunfw.defines.php';

/**
 * Plugin class.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class PlgSystemSunFw extends JPlugin
{

	/**
	 * Joomla application instance.
	 *
	 * @var  JApplication
	 */
	protected $app;

	/**
	 * Joomla input instance.
	 *
	 * @var  JInput
	 */
	protected $input;

	/**
	 * Define prefix for all classes of our framework.
	 *
	 * @var  string
	 */
	protected static $prefix = 'SunFw';

	/**
	 * Constructor.
	 *
	 * @param   object  &$subject  The object to observe
	 * @param   array   $config    An optional associative array of configuration settings.
	 *                             Recognized key values include 'name', 'group', 'params', 'language'
	 *                             (this list is not meant to be comprehensive).
	 *
	 * @return  void
	 */
	public function __construct($subject, $option = array())
	{
		parent::__construct($subject, $option);

		// Register class auto-loader.
		spl_autoload_register(array(
			__CLASS__,
			'autoload'
		));

		// Load plugin language file.
		$this->loadLanguage();

		// Get Joomla's application instance.
		$this->app = JFactory::getApplication();

		// Get Joomla's input object.
		$this->input = $this->app->input;

		$this->option = $this->input->getCmd('option');
		$this->view = $this->input->getCmd('view');
		$this->task = $this->input->getCmd('task');
	}

	/**
	 * Implement onAfterInitialise event handler.
	 *
	 * @return  void
	 */
	public function onAfterInitialise()
	{
		if ($this->app->isClient('administrator'))
		{
			if ($this->option == 'com_installer')
			{
				// If there is no any template based on Sun Framework installed, uninstall the Sun Framework plugin.
				if (!$this->hasSunFwBasedTemplate())
				{
					// Get the extension ID of the Sun Framework plugin.
					$db = JFactory::getDbo();
					$qr = $db->getQuery(true)
						->select('extension_id')
						->from('#__extensions')
						->where("type = 'plugin'")
						->where("folder = 'system'")
						->where("element = 'sunfw'");

					if ($eid = $db->setQuery($qr)->loadResult())
					{
						// Unprotect the Sun Framework plugin first.
						$qr = $db->getQuery(true)
							->update('#__extensions')
							->set('protected = 0')
							->where("extension_id = {$eid}");

						if ($db->setQuery($qr)->execute())
						{
							// Get an installer object to uninstall the Sun Framework plugin.
							$installer = JInstaller::getInstance();

							return $installer->uninstall('plugin', $eid);
						}
					}
				}
			}

			// Load library for compliling SCSS to CSS
			include_once dirname(__FILE__) . '/libraries/3rd-party/scssphp/scss.inc.php';
		}
		elseif ($this->app->isClient('site'))
		{
			// Reorder the execution of onAfterRoute event handler if necessary.
			if (JPluginHelper::isEnabled('system', 'jsntplframework'))
			{
				$this->app->registerEvent('onAfterRoute', array(
					&$this,
					'onAfterRoute'
				));
			}
		}
	}

	/**
	 * Implement onContentPrepareForm event handler to initialize SunFw template admin.
	 *
	 * @param   object $context Form context.
	 * @param   object $data Form data.
	 * @return  void
	 */
	public function onContentPrepareForm($context, $data)
	{
		switch ($context->getName())
		{
			case 'com_templates.style':
				if (!empty($data))
				{
					// Read manifest to check if template depends on our framework.
					$templateName = is_object($data) ? $data->template : $data['template'];

					// If editing a style of a SunFw based template, initialize template admin.
					if (SunFwRecognization::detect($templateName))
					{
						SunFwAdmin::getInstance();
					}
				}
			break;

			case 'com_menus.item':
			case 'com_content.article':
				// Get the default site template.
				if ($this->app->isClient('administrator'))
				{
					$dbo = JFactory::getDbo()->setQuery('SELECT * FROM #__template_styles WHERE client_id = 0 AND home = 1;');
					$tpl = $dbo->loadObject();
				}
				else
				{
					$tpl = $this->app->getTemplate(true);
				}

				// If the default site template is a SunFw based template, load additional form.
				if (SunFwRecognization::detect($tpl->template))
				{
					if ($this->app->isClient('site'))
					{
						if (is_string($data->attribs))
						{
							$data->attribs = json_decode($data->attribs, true);
						}
					}
					// Register additional form path.
					JForm::addFormPath(JPATH_PLUGINS . '/system/sunfw/includes/admin/forms');

					// Load additional form fields.
					$context->loadFile($context->getName() == 'com_menus.item' ? 'menu' : 'article', false);

					// Get Joomla document object.
					$doc = JFactory::getDocument();

					// Generate base for assets URL.
					$base = JUri::root(true) . '/plugins/system/sunfw/assets';

					// Load React.
					$doc->addScript("{$base}/3rd-party/react/react.min.js");
					$doc->addScript("{$base}/3rd-party/react/react-dom.min.js");

					// Load Base64.
					$doc->addScript("{$base}/3rd-party/base64/base64.min.js");

					// Load Template Admin React app.
					$doc->addScript("{$base}/joomlashine/admin/js/helpers.js?v=" . SUNFW_VERSION);
					$doc->addScript("{$base}/joomlashine/admin/js/sunfw.js?v=" . SUNFW_VERSION);

					$this->renderExtraOptions = $tpl;
				}
			break;
		}
	}

	/**
	 * Implement onExtensionBeforeInstall event handler to fix table column duplication problem.
	 *
	 * @param   string            $method     Either 'install' or 'discover_install'.
	 * @param   SimpleXMLElement  $type       Extension type.
	 * @param   SimpleXMLElement  $manifest   Extension manifest data.
	 * @param   integer           $extension  Extension ID if installed.
	 *
	 * @return  void
	 */
	public function onExtensionBeforeInstall($method, $type, $manifest, $extension)
	{
		if ('plg_system_sunfw' == (string) $manifest->name)
		{
			// Rename all update files.
			foreach (JFolder::files(JPATH_ROOT . '/plugins/system/sunfw/database/mysql/updates', '\.sql$') as $file)
			{
				$file = JPATH_ROOT . "/plugins/system/sunfw/database/mysql/updates/{$file}";

				JFile::move($file, "{$file}.bak");
			}
		}
	}

	/**
	 * Implement onExtensionAfterInstall event handler to restore update files.
	 *
	 * @param   JInstaller  $installer  The Joomla installer object.
	 * @param   integer     $eid        ID of the installed extension.
	 *
	 * @return  void
	 */
	public function onExtensionAfterInstall($installer, $eid)
	{
		if ('plg_system_sunfw' == (string) $installer->manifest->name)
		{
			// Restore all update files.
			foreach (JFolder::files(JPATH_ROOT . '/plugins/system/sunfw/database/mysql/updates', '\.bak$') as $file)
			{
				$file = JPATH_ROOT . "/plugins/system/sunfw/database/mysql/updates/{$file}";

				JFile::move($file, substr($file, 0, -4));
			}
		}
	}

	/**
	 * Implement onExtensionAfterSave event handler to clone SunFw style data.
	 *
	 * @return  void
	 */
	public function onExtensionAfterSave($context, $table, $isNew)
	{
		$task = $this->app->input->getString('task', '');

		// If context is not com_templates.style return immediately
		if ($context !== 'com_templates.style' || $table->client_id || !$isNew || $task != 'duplicate')
		{
			return;
		}

		$session = JFactory::getSession();
		$dbo = JFactory::getDBO();

		// If session SUNFW_CLONE_STYLE_ID is not existed then created and assign value to it
		if ($session->has('SUNFW_CLONE_STYLE_ID') == false)
		{
			$sessionData = $session->get('SUNFW_CLONE_STYLE_ID', array());

			if (!count($sessionData))
			{
				$pks = $this->app->input->post->get('cid', array(), 'array');

				$session->set('SUNFW_CLONE_STYLE_ID', $pks);

				$sessionData = $session->get('SUNFW_CLONE_STYLE_ID', array());
			}
		}
		else
		{
			// If get session SUNFW_CLONE_STYLE_ID value if it is existed
			$sessionData = $session->get('SUNFW_CLONE_STYLE_ID', array());
		}

		// Check if clone style is a of style of Sun Framework based template
		if (!SunFwRecognization::detect($table->template))
		{
			unset($sessionData[0]);

			$sessionData = array_values($sessionData);

			$session->set('SUNFW_CLONE_STYLE_ID', $sessionData);

			$sessionData = $session->get('SUNFW_CLONE_STYLE_ID', array());

			if (!count($sessionData))
			{
				$session->clear('SUNFW_CLONE_STYLE_ID');
			}

			return;
		}

		$currentSunFwStyle = SunFwHelper::getSunFwStyle($sessionData[0]);

		if (count($currentSunFwStyle))
		{
			$columns = array(
				'style_id',
				'template',
				'layout_builder_data',
				'appearance_data',
				'system_data',
				'mega_menu_data',
				'cookie_law_data',
				'social_share_data',
				'commenting_data',
				'custom_404_data'
			);

			$values = array(
				intval($table->id),
				$dbo->quote($table->template),
				$dbo->quote($currentSunFwStyle->layout_builder_data),
				$dbo->quote($currentSunFwStyle->appearance_data),
				$dbo->quote($currentSunFwStyle->system_data),
				$dbo->quote($currentSunFwStyle->mega_menu_data),
				$dbo->quote($currentSunFwStyle->cookie_law_data),
				$dbo->quote($currentSunFwStyle->social_share_data),
				$dbo->quote($currentSunFwStyle->commenting_data),
				$dbo->quote($currentSunFwStyle->custom_404_data)
			);

			$query = $dbo->getQuery(true)
				->insert($dbo->quoteName('#__sunfw_styles'))
				->columns($dbo->quoteName($columns))
				->values(implode(',', $values));

			$dbo->setQuery($query);
			$dbo->execute();

			$sufwrender = new SunFwScssrender();
			$sufwrender->compile($table->id, $table->template);
			$sufwrender->compile($table->id, $table->template, "layout");
		}

		unset($sessionData[0]);

		$sessionData = array_values($sessionData);

		$session->set('SUNFW_CLONE_STYLE_ID', $sessionData);

		$sessionData = $session->get('SUNFW_CLONE_STYLE_ID', array());

		if (!count($sessionData))
		{
			$session->clear('SUNFW_CLONE_STYLE_ID');
		}
	}

	/**
	 * Implement onExtensionAfterDelete event handler to clean up SunFw style data.
	 *
	 * @return  void
	 */
	public function onExtensionAfterDelete($context, $table)
	{
		$task = $this->app->input->getString('task', '');

		// Simply return if context is not 'com_templates.style'
		if ($context !== 'com_templates.style' || $table->client_id || $task != 'delete')
		{
			return;
		}

		// Check if deleted style is a of style of Sun Framework based template
		if (!SunFwRecognization::detect($table->template))
		{
			return;
		}

		SunFwHelper::deleteOrphanStyle(array(
			$table->id
		));
	}

	/**
	 * Implement onAfterRoute event handler to load class overrides.
	 *
	 * @return  void
	 */
	public function onAfterRoute()
	{
		// Make sure this event handler is executed at last order if necessary.
		if (JPluginHelper::isEnabled('system', 'jsntplframework') && !isset($this->onAfterRouteReordered))
		{
			$this->onAfterRouteReordered = true;

			return;
		}

		// Instantiate Sun Framework's site renderer if necessary.
		if ($this->app->isClient('site') && SunFwRecognization::detect())
		{
			SunFwSite::getInstance();
		}
	}

	/**
	 * Implement onAfterRender event handler.
	 *
	 * @return  void
	 */
	public function onAfterRender()
	{
		if (isset($this->renderExtraOptions) && $this->renderExtraOptions)
		{
			// Get the current output buffer.
			$buffer = $this->app->getBody();

			// Define base Ajax URL.
			$ajaxBase = JRoute::_(
				"index.php?option=com_ajax&format=json&plugin=sunfw&template_name={$this->renderExtraOptions->template}&style_id={$this->renderExtraOptions->id}&" .
					 JSession::getFormToken() . '=1&context=admin&action=get', false);

			$buffer = str_replace('</body>',
				'<div id="sunfw-extra-options" data-render="ExtraOptions" data-url="' . $ajaxBase . '"></div></body>', $buffer);

			// Set new buffer.
			$this->app->setBody($buffer);
		}
	}

	/**
	 * Handle Ajax requests.
	 *
	 * @return  void
	 */
	public function onAjaxSunFw()
	{
		header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
		header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
		header("Cache-Control: no-store, no-cache, must-revalidate");
		header("Cache-Control: post-check=0, pre-check=0", false);
		header("Pragma: no-cache");

		SunFwAjax::execute();

		// Exit immediately to prevent Joomla from processing further.
		exit();
	}

	/**
	 * Method to check if current site has any SunFw based template.
	 *
	 * @return  boolean
	 */
	protected function hasSunFwBasedTemplate()
	{
		// Get all installed templates.
		$db = JFactory::getDbo();
		$qr = $db->getQuery(true)
			->select('element')
			->from('#__extensions')
			->where('type = "template"');

		if ($tpls = $db->setQuery($qr)->loadObjectList())
		{
			foreach ($tpls as $tpl)
			{
				if (SunFwRecognization::detect($tpl->element))
				{
					return true;
				}
			}
		}

		return false;
	}

	/**
	 * Class auto-loader.
	 *
	 * @param   string $class_name Name of class to load declaration file for.
	 *
	 * @return  mixed
	 */
	public static function autoload($class_name)
	{
		// Verify class prefix.
		if (0 !== strpos($class_name, self::$prefix))
		{
			return false;
		}

		// Generate file path from class name.
		$base = dirname(__FILE__) . '/includes';
		$path = strtolower(preg_replace('/([A-Z])/', '/\\1', substr($class_name, strlen(self::$prefix))));

		// Find class declaration file.
		$p1 = $path . '.php';
		$p2 = $path . '/' . basename($path) . '.php';

		while (true)
		{
			// Check if file exists in standard path.
			if (@is_file($base . $p1))
			{
				$exists = $p1;

				break;
			}

			// Check if file exists in alternative path.
			if (@is_file($base . $p2))
			{
				$exists = $p2;

				break;
			}

			// If there is no more alternative path, quit the loop.
			if (false === strrpos($p1, '/') || 0 === strrpos($p1, '/'))
			{
				break;
			}

			// Generate more alternative path.
			$p1 = preg_replace('#/([^/]+)$#', '-\\1', $p1);
			$p2 = dirname($p1) . '/' . substr(basename($p1), 0, -4) . '/' . basename($p1);
		}

		// If class declaration file is found, include it.
		if (isset($exists))
		{
			return include_once $base . $exists;
		}

		return false;
	}
}
