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

// Import necessary libraries.
jimport('joomla.filesystem.file');
jimport('joomla.filesystem.folder');

/**
 * Template administration class.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwAdmin
{

	/**
	 * A singleton instance of the class.
	 *
	 * @var  SunFwAdmin
	 */
	private static $instance;

	/**
	 * Joomla application instance.
	 *
	 * @var  JApplicationAdministrator
	 */
	protected $app;

	/**
	 * Joomla document instance.
	 *
	 * @var  JDocumentHTML
	 */
	protected $doc;

	/**
	 * Editing template style.
	 *
	 * @var  object
	 */
	public $style;

	/**
	 * Editing template.
	 *
	 * @var  string
	 */
	public $template;

	/**
	 * Editing template.
	 *
	 * @var  string
	 */
	public $templateInfo;

	/**
	 * The controller for Joomla's template style screen.
	 *
	 * @var  TemplatesControllerStyle
	 */
	protected $controller;

	/**
	 * The view for Joomla's template style screen.
	 *
	 * @var  TemplatesViewStyle
	 */
	protected $view;

	/**
	 * Template manifest Cache
	 */
	protected $templateManifestCache;

	/**
	 * Editing template.
	 *
	 * @var  string
	 */
	public $templateVersion;

	/**
	 * Original template admin form
	 * @var JForm
	 */
	protected $templateForm;

	/**
	 * Instantiate a singleton of the class then return.
	 *
	 * @return  SunFwAdmin
	 */
	public static function getInstance()
	{
		// Instantiate a singleton of the class if not already exists.
		if (!isset(self::$instance))
		{
			self::$instance = new self();
		}

		return self::$instance;
	}

	/**
	 * Constructor method.
	 *
	 * @return  void
	 */
	public function __construct()
	{
		// Check system requirements.
		$resultCheckSystemRequirements = SunFwUtils::checkSystemRequirements();

		if (count($resultCheckSystemRequirements))
		{
			$msgSystemRequirement = implode('<br />', $resultCheckSystemRequirements);

			$this->app->enqueueMessage($msgSystemRequirement, 'warning');
			$this->app->redirect('index.php?option=com_templates');

			return;
		}

		// Check browser requirements.
		$resultCheckBrowserRequirements = SunFwUtils::checkBrowserRequirements();

		if (count($resultCheckBrowserRequirements))
		{
			$msgBrowserRequirement = implode('<br />', $resultCheckBrowserRequirements);

			$this->app->enqueueMessage($msgBrowserRequirement, 'warning');
			$this->app->redirect('index.php?option=com_templates');

			return;
		}

		// Make sure the table `sunfw_styles` exists.
		$dbo = JFactory::getDbo();
		$tables = $dbo->setQuery('SHOW TABLES;')->loadColumn();

		if (!in_array($dbo->getPrefix() . 'sunfw_styles', $tables))
		{
			// Manually create the table.
			$dbo->setQuery(file_get_contents(SUNFW_PATH . '/database/mysql/install.mysql.sql'))->execute();
		}
		else
		{
			// Make sure all extra columns exists.
			$columns = $dbo->setQuery('SHOW COLUMNS FROM #__sunfw_styles;')->loadColumn();
			$updates = JFolder::files(SUNFW_PATH . '/database/mysql/updates', '\.sql$');

			foreach ($updates as $update)
			{
				$update = SUNFW_PATH . "/database/mysql/updates/{$update}";

				if ($sql = file_get_contents($update))
				{
					if (preg_match_all('/ALTER TABLE `?[^\s]+_sunfw_styles`? ADD ([^\s]+)/i', $sql, $matches, PREG_SET_ORDER))
					{
						foreach ($matches as $match)
						{
							$column = trim($match[1], '`');

							if (!in_array($column, $columns))
							{
								$dbo->setQuery($sql)->execute();
							}
						}
					}
				}
			}
		}

		// Get Joomla application instance.
		$this->app = JFactory::getApplication();

		// Get Joomla document instance.
		$this->doc = JFactory::getDocument();

		// Get editing template style.
		$this->style = SunFwHelper::getTemplateStyle($this->app->input->getInt('id'));

		// Get editing template.
		$this->template = strtolower(trim($this->style->template));

		// Get template info.
		$this->templateInfo = SunFwRecognization::detect($this->template);

		// Get the controller for template style screen.
		$this->controller = JControllerLegacy::getInstance('Templates');

		// Get template manifest cache.
		$this->templateManifestCache = SunFwHelper::getManifestCache($this->template);

		// Get template data.
		$this->templateVersion = SunFwHelper::getTemplateVersion($this->template);
		$this->templateForm = JForm::getInstance('com_templates.style', 'style',
			array(
				'control' => 'jform',
				'load_data' => true
			));
		$this->sunfwParams = SunFwHelper::getExtensionParams('plugin', 'sunfw', 'system');

		// Register event to load assets for template administration.
		$this->app->registerEvent('onBeforeRender', array(
			&$this,
			'loadAssets'
		));

		// Register event to render template administration screen.
		$this->app->registerEvent('onAfterRender', array(
			&$this,
			'renderHtml'
		));

		// Validate License
		SunFwValidatelicense::validate($this->template, 'assets/joomlashine/admin/js/helpers.js');
	}

	/**
	 * Load assets for template administration screen.
	 *
	 * @return  void
	 */
	public function loadAssets()
	{
		// Remove all loaded assets except jQuery.
		$this->doc->_styleSheets = $this->doc->_style = $this->doc->_scripts = $this->doc->_script = array();

		// Generate base for assets URL.
		$base = JUri::root(true) . '/plugins/system/sunfw/assets';
		$vd = 'v=' . SUNFW_VERSION . '&d=' . SUNFW_RELEASED_DATE;

		// Load Bootstrap.
		$this->doc->addStylesheet("{$base}/3rd-party/bootstrap/bootstrap.min.css");

		$this->doc->addScript(JUri::root(true) . '/media/jui/js/jquery.min.js');
		$this->doc->addScript("{$base}/3rd-party/popper/popper.min.js");
		$this->doc->addScript("{$base}/3rd-party/bootstrap/bootstrap.min.js");

		// Load Font Awesome.
		$this->doc->addStylesheet("{$base}/3rd-party/font-awesome/css/font-awesome.min.css");

		// Load stylesheets for Template Admin.
		$this->doc->addStylesheet("{$base}/joomlashine/admin/css/style.css?{$vd}");
		$this->doc->addStylesheet("{$base}/joomlashine/admin/css/custom.css?{$vd}");

		// Load Noty.
		$this->doc->addStylesheet("{$base}/3rd-party/noty/animate.css");
		$this->doc->addScript("{$base}/3rd-party/noty/jquery.noty.js");

		// Load Bootbox.
		$this->doc->addScript("{$base}/3rd-party/bootbox/bootbox.min.js");

		// Load Interact.
		$this->doc->addScript("{$base}/3rd-party/interact/interact.min.js");

		// Load React.
		$this->doc->addScript("{$base}/3rd-party/react/react.min.js");
		$this->doc->addScript("{$base}/3rd-party/react/react-dom.min.js");

		// Load Base64.
		$this->doc->addScript("{$base}/3rd-party/base64/base64.min.js");

		// Load Template Admin React app.
		$this->doc->addScript("{$base}/joomlashine/admin/js/helpers.js?{$vd}");
		$this->doc->addScript("{$base}/joomlashine/admin/js/sunfw.js?{$vd}");
	}

	/**
	 * Render HTML for template administration screen.
	 *
	 * @return  void
	 */
	public function renderHtml()
	{
		// Define base Ajax URL.
		$ajaxBase = JUri::root(true) .
			 "/administrator/index.php?option=com_ajax&format=json&plugin=sunfw&template_name={$this->template}&style_id=" .
			 $this->app->input->getInt('id') . '&' . JSession::getFormToken() . '=1&context=admin&action=get';

		// Generate HTML output.
		ob_start();

		// @formatter:off
		?>
		<form id="style-form" method="post" name="adminForm" onSubmit="return false;" action="<?php
			echo JRoute::_('index.php?option=com_templates&layout=edit&id=' . $this->app->input->getInt('id'));
		?>">
			<div id="template-admin" class="sunfw-template-admin" data-render="TemplateAdmin" data-url="<?php
				echo $ajaxBase;
			?>"></div>
			<div id="template-admin-form" class="hidden">
				<div class="form-group">
					<input type="text" name="style_title" value="<?php echo $this->style->title; ?>" placeholder="<?php
						echo JText::_('SUNFW_STYLE_NAME');
					?>" />
					<?php
					$home = $this->templateForm->getInput('home');
					$home = str_replace('id="jform_home" name=""', 'name="home"', $home);
					$home = preg_replace('#<input type="hidden"[^>]+/>#', '', $home);

					echo $home;
					?>
				</div>
			</div>
			<input type="hidden" name="task" value="" />
			<input type="hidden" id="jsn-tpl-root" value="<?php echo Juri::root(); ?>" />
			<input type="hidden" id="jsn-tpl-name" value="<?php echo $this->template; ?>" />
			<input type="hidden" id="jsn-tpl-token" value="<?php echo JSession::getFormToken(); ?>" />
			<input type="hidden" id="jsn-style-id" value="<?php echo $this->app->input->getInt('id'); ?>" />
			<?php echo JHtml::_('form.token'); ?>
		</form>
		<form id="sunfw-maintenance-form" method="post" enctype="multipart/form-data" target="sunfw-hidden-iframe" class="hidden">
			<input type="file" name="sunfw-advanced-backup-upload" />
		</form>
		<iframe id="sunfw-hidden-iframe" name="sunfw-hidden-iframe" class="hidden" src="about:blank"></iframe>
		<div id="sunfw-loading" class="jsn-loading">
			<div class="loader">
				<img src="<?php echo JUri::root(true); ?>/plugins/system/sunfw/assets/images/logo-loading.svg">
				<div class="circle"></div>
				<div class="circle"></div>
				<div class="circle"></div>
				<div class="circle"></div>
				<div class="circle"></div>
			</div>
		</div>
		<script type="text/javascript">
			// Remove all unnecessary elements.
			var form = document.getElementById('style-form'), removeAllPrevSiblings = function(elm) {
				while (elm.previousElementSibling) {
					elm.parentNode.removeChild(elm.previousElementSibling);
				}
			};

			if (form) {
				removeAllPrevSiblings(form);

				while (form.parentNode != document.body) {
					form = form.parentNode;
				}

				removeAllPrevSiblings(form);
			}

			// Handle 'onBeforeUnload' event.
			window.onbeforeunload = function() {
				var hasChange = document.querySelector('#template-admin a.toggle-pane.changed');

				if (hasChange) {
					return '<?php echo JText::_('SUNFW_CONFIRM_LEAVE_PAGE'); ?>'
				}
			}

			// Fix compatibility problem with MooTools loaded by the admin bar of JSN PowerAdmin.
			if (window.MooTools !== undefined) {
				Element.implement({
					hide: function() {
						return this;
					},
					show: function(v) {
						return this;
					},
					slide: function(v) {
						return this;
					}
				});
			}
		</script>
		<?php
		// @formatter:on

		$body = ob_get_contents();

		ob_end_clean();

		// Parse current response body
		list($header, $tmp) = explode('<!-- Header -->', $this->app->getBody(), 2);
		list($tmp, $footer) = explode('</body>', $tmp, 2);

		// Remove all unnecessary stylesheets and scrips.
		$patterns = array(
			'#<link[^>]+href="([^"]+)"[^>]+rel="stylesheet"[^>]+/>#',
			'#<script[^>]+src="([^"]+)"[^>]*></script>#'
		);

		foreach ($patterns as $pattern)
		{
			if (preg_match_all($pattern, $header, $matches, PREG_SET_ORDER))
			{
				foreach ($matches as $match)
				{
					if (!preg_match('#(/media/jui/js/jquery\.min\.js|/plugins/system/sunfw/assets/)#', $match[1]))
					{
						$header = str_replace($match[0], '', $header);
					}
				}
			}
		}

		// Remove all Joomla's inline script from document head.
		$tmp = preg_split('#<script( type="text/javascript")?>#', $header);
		$header = $tmp[0];

		for ($i = 1, $n = count($tmp); $i < $n; $i++)
		{
			$header .= current(array_reverse(explode('</script>', $tmp[$i], 2)));
		}

		// Update response body.
		$this->app->setBody("{$header}\n{$body}\n</body>{$footer}");
	}

	/**
	 * Render HTML for a config tab using definition from XML file.
	 *
	 * @param   string  $name         Form name.
	 * @param   string  $config_file  XML file that defines a form.
	 *
	 * @return  string
	 */
	protected function renderTab($name, $config_file)
	{
		// Instantiate a JForm object.
		$form = new JForm($name);

		// Add path to our custom fields.
		$form->addFieldPath(dirname(__FILE__) . '/admin/fields');

		// Then, load config from the XML file.
		$form->loadFile($config_file);

		// Get all fieldsets.
		$fieldsets = $form->getFieldsets();

		// Then, loop thru fieldsets to render HTML.
		$html = array();

		foreach (array_keys($fieldsets) as $fieldset)
		{
			$html[] = $form->renderFieldset($fieldset);
		}

		return implode("\n", $html);
	}
}
