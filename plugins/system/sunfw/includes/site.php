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

/**
 * Template rendering class.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwSite
{

	/**
	 * A singleton instance of the class.
	 *
	 * @var  SunFwSite
	 */
	private static $instance;

	/**
	 * Joomla's application instance.
	 *
	 * @var  JApplicationSite
	 */
	protected $app;

	/**
	 * Joomla's document object.
	 *
	 * @var  JDocumentHTML
	 */
	protected $doc;

	/**
	 * Template details.
	 *
	 * @var  object
	 */
	protected $tpl;

	/**
	 * Template name.
	 *
	 * @var  string
	 */
	protected $template;

	/**
	 * Page type, either 'index', 'component' or 'error'.
	 *
	 * @var  string
	 */
	protected $page;

	/**
	 * Current style.
	 *
	 * @var  object
	 */
	protected $style;

	/**
	 * Layout builder data.
	 *
	 * @var  array
	 */
	protected $layout = array();

	/**
	 * Mega menu data.
	 *
	 * @var  array
	 */
	protected $megamenu = array();

	/**
	 * Flag that states whether layout viewer is enabled.
	 *
	 * @var  boolean
	 */
	protected $layoutViewer = false;

	/**
	 * Constructor method.
	 *
	 * @return  void
	 */
	public function __construct()
	{
		// Check system requirements first.
		$resultCheckSystemRequirements = SunFwUtils::checkSystemRequirements();

		if (count($resultCheckSystemRequirements))
		{
			die(implode('<br />', $resultCheckSystemRequirements));
		}

		// Initialize class overrides.
		SunFwOverwrite::initialize();

		// Get Joomla's application instance.
		$this->app = JFactory::getApplication();

		// Get Joomla's document object.
		$this->doc = JFactory::getDocument();

		// Get active template.
		$this->tpl = $this->app->getTemplate(true);
		$this->template = $this->tpl->template;

		if (!isset($this->tpl->id))
		{
			$tmpTemplate = SunFwHelper::getTemplateStyleByName($this->template);
			$this->tpl->id = $tmpTemplate->id;
		}

		// Get current style.
		$this->style = SunFwHelper::getSunFwStyle($this->tpl->id);

		// Get layout data.
		$this->layout = SunFwHelper::getLayoutData($this->style, $this->template);

		// Get appearance data.
		$this->appearance = SunFwHelper::getStyleData($this->style, $this->template);

		// Parse other template style data.
		foreach ((array) $this->style as $key => $value)
		{
			if (substr($key, -5) != '_data')
			{
				continue;
			}

			if (!in_array($key, array(
				'layout_builder_data',
				'appearance_data'
			)))
			{
				$this->{$key} = json_decode($value, true);
			}
		}

		// Get mega menu data.
		if (isset($this->mega_menu_data))
		{
			$this->megamenu = & $this->mega_menu_data;
		}

		// Register necessary event handlers.
		$this->app->registerEvent('onBeforeRender', array(
			'SunFwCookielaw',
			'loadCookie'
		));

		$this->app->registerEvent('onBeforeCompileHead', array(
			&$this,
			'optimizeAssets'
		));

		$this->app->registerEvent('onAfterRender', array(
			&$this,
			'finalizeOutput'
		));

		$this->app->registerEvent('onContentBeforeDisplay', array(
			&$this,
			'renderSocialShare'
		));
		$this->app->registerEvent('onContentAfterDisplay', array(
			&$this,
			'renderSocialShare'
		));

		$this->app->registerEvent('onContentBeforeDisplay', array(
			&$this,
			'renderCommenting'
		));
		$this->app->registerEvent('onContentAfterDisplay', array(
			&$this,
			'renderCommenting'
		));
	}

	/**
	 * Method to provide access to JDocument instance's variables the way standard Joomla template does.
	 *
	 * @param   string $name Variable name to get value for.$this
	 *
	 * @return  mixed
	 */
	public function __get($name)
	{
		if (isset($this->{$name}))
		{
			return $this->{$name};
		}
		elseif (isset($this->doc->{$name}))
		{
			return $this->doc->{$name};
		}
		elseif (isset($this->app->{$name}))
		{
			return $this->app->{$name};
		}

		return null;
	}

	/**
	 * Instantiate a singleton of the class then return.
	 *
	 * @return  SunFwSite
	 */
	public static function &getInstance()
	{
		// Instantiate a singleton of the class if not already exists.
		if (!isset(self::$instance))
		{
			self::$instance = new self();
		}

		return self::$instance;
	}

	/**
	 * Render HTML for the template.
	 *
	 * @param   string     $page  Page type to render, either 'index', 'component' or 'error'.
	 * @param   JDocument  $doc   The current Joomla document object that handles rendering output.
	 *
	 * @return  void
	 */
	public function render($page = 'index', $doc = null)
	{
		// If Joomla document object, use it.
		if ($doc)
		{
			$this->doc = $doc;
		}

		// Set page template.
		$this->page = $page;

		// Load template assets.
		$this->loadAssets();

		// Prepare template parameters.
		SunFwSiteHelper::prepare($this);

		// Check if responsive is enabled?
		$this->responsive = !empty($this->layout['settings']['enable_responsive']) ? intval($this->layout['settings']['enable_responsive']) : false;

		if (!is_null($this->isMobileSwicher))
		{
			$this->responsive = $this->isMobileSwicher;
		}

		// Render template layout.
		$this->renderLayout();
	}

	/**
	 * Load template assets.
	 *
	 * @return  void
	 */
	public function loadAssets()
	{
		// Get Style ID.
		$styleID = isset($this->style->style_id) ? md5($this->style->style_id) : '';

		// Get active niche style.
		$niche = SunFwHelper::getActiveNicheStyle();

		// Output as HTML5.
		if (method_exists($this->doc, 'setHtml5'))
		{
			$this->doc->setHtml5(true);
		}

		// Load Bootstrap.
		$this->doc->addStylesheet($this->baseurl . "/templates/{$this->template}/css/bootstrap.css");

		// Load Bootstrap.
		$this->doc->addStylesheet($this->baseurl . "/plugins/system/sunfw/assets/3rd-party/bootstrap/flexbt4_custom.css");

		// Load Font Awesome.
		$this->doc->addStylesheet($this->baseurl . "/plugins/system/sunfw/assets/3rd-party/font-awesome/css/font-awesome.min.css");

		// Load template script bootstrap if available.
		if (file_exists(JPATH_ROOT . "/templates/{$this->template}/assets/bootstrap-sass/assets/javascripts/bootstrap.min.js"))
		{
			JHtml::_('jquery.framework');

			$this->doc->addScript(
				$this->baseurl . "/templates/{$this->template}/assets/bootstrap-sass/assets/javascripts/bootstrap.min.js");
		}

		// Load Javascript files.
		$this->doc->addScript($this->baseurl . '/plugins/system/sunfw/assets/joomlashine/site/js/utils.js');

		// Load template script if available.
		if (file_exists(JPATH_ROOT . "/templates/{$this->template}/js/template.js"))
		{
			$this->doc->addScript($this->baseurl . "/templates/{$this->template}/js/template.js");
		}

		if (file_exists(JPATH_ROOT . "/templates/{$this->template}/niches/{$niche}/js/template.js"))
		{
			$this->doc->addScript($this->baseurl . "/templates/{$this->template}/niches/{$niche}/js/template.js");
		}

		// Load template stylesheet if available.
		if (file_exists(JPATH_ROOT . "/templates/{$this->template}/css/template.css"))
		{
			$this->doc->addStylesheet($this->baseurl . "/templates/{$this->template}/css/template.css");
		}

		if (file_exists(JPATH_ROOT . "/templates/{$this->template}/css/color_{$styleID}.css"))
		{
			$this->doc->addStylesheet($this->baseurl . "/templates/{$this->template}/css/color_{$styleID}.css");
		}

		if (file_exists(JPATH_ROOT . "/templates/{$this->template}/niches/{$niche}/css/template.css"))
		{
			$this->doc->addStylesheet($this->baseurl . "/templates/{$this->template}/niches/{$niche}/css/template.css");
		}

		if (file_exists(JPATH_ROOT . "/templates/{$this->template}/niches/{$niche}/css/color_{$styleID}.css"))
		{
			$this->doc->addStylesheet($this->baseurl . "/templates/{$this->template}/niches/{$niche}/css/color_{$styleID}.css");
		}

		if (file_exists(JPATH_ROOT . "/templates/{$this->template}/css/core/layout_{$styleID}.css"))
		{
			$this->doc->addStylesheet($this->baseurl . "/templates/{$this->template}/css/core/layout_{$styleID}.css");
		}

		if (file_exists(JPATH_ROOT . "/templates/{$this->template}/css/core/general_{$styleID}.css"))
		{
			$this->doc->addStylesheet($this->baseurl . "/templates/{$this->template}/css/core/general_{$styleID}.css");
		}

		if (file_exists(JPATH_ROOT . "/templates/{$this->template}/css/core/general_overwrite_{$styleID}.css"))
		{
			$this->doc->addStylesheet($this->baseurl . "/templates/{$this->template}/css/core/general_overwrite_{$styleID}.css");
		}

		if (file_exists(JPATH_ROOT . "/templates/{$this->template}/css/core/sections_{$styleID}.css"))
		{
			$this->doc->addStylesheet($this->baseurl . "/templates/{$this->template}/css/core/sections_{$styleID}.css");
		}

		if (file_exists(JPATH_ROOT . "/templates/{$this->template}/css/core/modules_{$styleID}.css"))
		{
			$this->doc->addStylesheet($this->baseurl . "/templates/{$this->template}/css/core/modules_{$styleID}.css");
		}

		if (file_exists(JPATH_ROOT . "/templates/{$this->template}/css/core/menu_{$styleID}.css"))
		{
			$this->doc->addStylesheet($this->baseurl . "/templates/{$this->template}/css/core/menu_{$styleID}.css");
		}

		// Fix compatibility problem with MooTools loaded by JSN PowerAdmin.
		$this->doc->addScriptDeclaration(
			'
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
		');

		// Init layout viewer if URL contains 'suntp=1' in query string.
		if ($this->app->input->getBool('suntp'))
		{
			// If request URI contains only 'Itemid', get real menu item link.
			$Itemid = $this->app->input->getInt('Itemid');

			if ($Itemid && !$this->app->input->getCmd('option'))
			{
				$dbo = JFactory::getDbo();
				$qry = $dbo->getQuery(true)
					->select('link')
					->from('#__menu')
					->where("id = {$Itemid}");

				$dbo->setQuery($qry);

				if ($link = $dbo->loadResult())
				{
					$link .= ( strpos($link, '?') === false ? '?' : '&' ) . "Itemid={$Itemid}&suntp=1";

					if ($this->app->input->getInt('showhint'))
					{
						$link .= '&showhint=1';
					}

					// Redirect to the real menu item link.
					$this->app->redirect($link);
				}
			}

			// Set a flag to state that layout viewer is enabled.
			$this->layoutViewer = true;

			// Load layout viewer assets.
			$this->doc->addStylesheet($this->baseurl . '/plugins/system/sunfw/assets/joomlashine/site/css/layout-viewer.css');
			$this->doc->addScript($this->baseurl . '/plugins/system/sunfw/assets/joomlashine/site/js/layout-viewer.js');

			$this->doc->addScriptDeclaration(
				'
				sunfw = window.sunfw || {};
				sunfw.layout_viewer = ' . json_encode(
					array(
						'show-layout' => JText::_('SUNFW_LAYOUT_VIEWER_LABEL_SHOW'),
						'hide-layout' => JText::_('SUNFW_LAYOUT_VIEWER_LABEL_HIDE')
					)) . ';
			');
		}
	}

	/**
	 * Render template layout.
	 *
	 * @return  void
	 */
	public function renderLayout()
	{
		// Generate path to the requested page template.
		$template = SUNFW_PATH . '/includes/site/pages/' . $this->page . '.php';

		// Load page template.
		if (@is_file($template))
		{
			include $template;
		}
	}

	/**
	 * Render template component.
	 *
	 * @param   string  $type       Either 'offcanvas', 'section', 'row', 'column' or 'item'.
	 * @param   array   $component  The component data array.
	 * @param   string  $position   If rendering an offcanvas, can be either 'top', 'right', 'bottom' or 'left'.
	 *
	 * @return  void
	 */
	protected function renderComponent($type, $component, $position = null)
	{
		// Only render if component is not disabled.
		if (isset($component['settings']['disabled']) && $component['settings']['disabled'])
		{
			return;
		}

		// Generate path to the template file that renders HTML for the component type.
		if ($type != 'item')
		{
			$template = SUNFW_PATH . '/includes/site/components/' . $type . '.php';
		}
		else
		{
			// Make sure item has type.
			if (!isset($component['type']))
			{
				return;
			}

			$template = SUNFW_PATH . '/includes/site/components/items/' . $component['type'] . '.php';
		}

		// Shorten access to layout builder data.
		$layout = & $this->layout;

		// Load component template.
		if (@is_file($template))
		{
			include $template;
		}
	}

	/**
	 * Render a section.
	 *
	 * @param   array $section The section data.
	 *
	 * @return  void
	 */
	public static function renderSection($section)
	{
		self::getInstance()->renderComponent('section', $section);
	}

	/**
	 * Render a row.
	 *
	 * @param   array $row The row data.
	 *
	 * @return  void
	 */
	public static function renderRow($row)
	{
		self::getInstance()->renderComponent('row', $row);
	}

	/**
	 * Render a column.
	 *
	 * @param   array $column The column data.
	 *
	 * @return  void
	 */
	public static function renderColumn($column)
	{
		self::getInstance()->renderComponent('column', $column);
	}

	/**
	 * Render an item.
	 *
	 * @param   array $item The item data.
	 *
	 * @return  void
	 */
	public static function renderItem($item)
	{
		// Grab rendered content.
		ob_start();

		self::getInstance()->renderComponent('item', $item);

		$html = ob_get_contents();

		ob_end_clean();

		// Check if layout viewer is enabled?
		if (!empty($html) && self::getInstance()->layoutViewer)
		{
			$layoutViewer = ' ' . implode(' ',
				array(
					'layout-element="item"',
					'layout-element-type="' . JText::_('SUNFW_ITEM') . '"',
					'layout-element-name="' . $item['settings']['name'] . '"'
				));

			$html = '<div' . $layoutViewer . '>' . $html . '</div>';
		}

		echo $html;
	}

	/**
	 * Render an offcanvas.
	 *
	 * @param   array   $offcanvas  The offcanvas data array.
	 * @param   string  $position   Either 'top', 'right', 'bottom' or 'left'.
	 *
	 * @return  void
	 */
	public static function renderOffcanvas($offcanvas, $position)
	{
		self::getInstance()->renderComponent('offcanvas', $offcanvas, $position);
	}

	/**
	 * Render back-link to JoomlaShine.
	 *
	 * @return  void
	 */
	public static function renderBrandingLink()
	{
		// Get settings.
		$renderer = self::getInstance();

		if (!empty($renderer->layout['settings']) && array_key_exists('show_branding_link', $renderer->layout['settings']) &&
			 empty($renderer->layout['settings']['show_branding_link']))
		{
			return;
		}

		// Backward compatible.
		elseif (!empty($renderer->system_data) && array_key_exists('showBrandingLink', $renderer->system_data) &&
			 empty($renderer->system_data['showBrandingLink']) && ( empty($renderer->layout['settings']) ||
			 !array_key_exists('show_branding_link', $renderer->layout['settings']) ||
			 empty($renderer->layout['settings']['show_branding_link']) ))
		{
			return;
		}

		if (!empty($renderer->layout['settings']) && !empty($renderer->layout['settings']['branding_link_text']))
		{
			$backLink = $renderer->layout['settings']['branding_link_text'];
		}
		else
		{
			// Get back-link from plugin params.
			$params = SunFwHelper::getExtensionParams('plugin', 'sunfw', 'system');

			if (empty($params['branding-link']))
			{
				// Define back-links.
				$backLinks = array(
					'Template by JoomlaShine' => 9900,
					'Template from <a href="https://www.joomlashine.com" target="_blank">https://www.joomlashine.com</a>' => 5,
					'Other JoomlaShine Products at <a href="https://www.joomlashine.com/joomla-extensions.html" target="_blank">https://www.joomlashine.com/joomla-extensions.html</a>' => 5,
					'<a href="https://www.joomlashine.com/joomla-templates.html" target="_blank">JSN Theme</a> by JoomlaShine' => 10,
					'This template is <a href="https://www.joomlashine.com/joomla-templates.html" target="_blank">JoomlaShine Product</a>' => 10,
					'<a href="https://www.joomlashine.com/joomla-templates.html" target="_blank">Joomla Templates</a> from JoomlaShine' => 5,
					'<a href="https://www.joomlashine.com/joomla-templates.html" target="_blank">JSN Template by JoomlaShine</a>' => 5,
					'More JSN Templates at <a href="https://www.joomlashine.com/joomla-templates.html" target="_blank">https://www.joomlashine.com/joomla-templates.html</a>' => 50,
					'More information at <a href="https://www.joomlashine.com/blog.html" target="_blank">https://www.joomlashine.com/blog.html</a>' => 10
				);

				// Get a random back-link.
				$num = rand(1, 10000);

				foreach ($backLinks as $backLink => $ratio)
				{
					$cur = isset($cur) ? $cur + $ratio : $ratio;

					if ($num <= $cur)
					{
						break;
					}
				}

				// Back-link has 80% containing 'rel="nofollow"'.
				$num = rand(1, 100);

				if ($num <= 80)
				{
					$backLink = str_replace('target="_blank"', 'target="_blank" rel="nofollow"', $backLink);
				}

				// Store back-link to plugin params.
				SunFwHelper::updateExtensionParams(array(
					'branding-link' => $backLink
				), 'plugin', 'sunfw', 'system');
			}
			else
			{
				$backLink = $params['branding-link'];
			}
		}

		echo '<div style="text-align:center;">' . $backLink . '</div>';
	}

	/**
	 * Render social share buttons.
	 *
	 * @param   string   $context  The context of the content being passed to the plugin
	 * @param   object   &$row     The article object
	 * @param   object   &$params  The article params
	 * @param   integer  $page     The 'page' number
	 *
	 * @return  string|boolean
	 */
	public function renderSocialShare($context, &$row, &$params, $page = 0)
	{
		// Simply return if not rendering content article.
		if ($context != 'com_content.article')
		{
			return false;
		}

		// Get social share data.
		$socialShare = isset($this->social_share_data) ? $this->social_share_data : array();

		if (empty($socialShare['enabled']) || !(int) $socialShare['enabled'] || !@count($socialShare['buttons']))
		{
			return false;
		}

		// Check if the current article belongs to supported categories?
		if (empty($socialShare['categories']) ||
			 !( in_array('all', $socialShare['categories']) || in_array($row->catid, $socialShare['categories']) ))
		{
			return false;
		}

		// Detect the name of the current event.
		static $currentEvent;

		$currentEvent = isset($currentEvent) ? 'onContentAfterDisplay' : 'onContentBeforeDisplay';

		if ($currentEvent == 'onContentBeforeDisplay' && strpos($socialShare['buttons-position'], 'top-') === false)
		{
			return false;
		}
		elseif ($currentEvent == 'onContentAfterDisplay' && strpos($socialShare['buttons-position'], 'top-') !== false)
		{
			return false;
		}

		// Render social share buttons.
		$html = array();
		$class = explode('-', $socialShare['buttons-position']);

		$html[] = '<div id="sunfw-social-share" class="text-' . $class[1] . '">';
		$html[] = $socialShare['text'];

		foreach ($socialShare['buttons'] as $network)
		{
			$link = '';

			switch ($network)
			{
				case 'facebook':
					$link = 'https://www.facebook.com/sharer/sharer.php?u=';
				break;

				case 'twitter':
					$link = 'https://twitter.com/home?status=';
				break;

				case 'google-plus':
					$link = 'https://plus.google.com/share?url=';
				break;

				case 'pinterest':
					$link = 'https://pinterest.com/pin/create/button/?url=';
				break;

				case 'linkedin':
					$link = 'https://www.linkedin.com/shareArticle?mini=true&url=';
				break;
			}

			if (!empty($link))
			{
				$link .= urlencode(
					JUri::getInstance()->toString(array(
						'scheme',
						'host',
						'port',
						'path',
						'query'
					)));

				$html[] = '<a href="javascript:void(0)" onclick="window.open(\'' . $link .
					 '\', \'share\', \'width=\' + parseInt(window.innerWidth * 0.5) + \',height=\' + parseInt(window.innerHeight * 0.5) + \',menubar=no,toolbar=no\');">';
				$html[] = '<i class="fa fa-' . $network . '-square"></i>';
				$html[] = '</a>';
			}
		}

		$html[] = '</div>';

		// If buttons position is bottom, move buttons to above page navigation.
		if (strpos($socialShare['buttons-position'], 'bottom-') !== false)
		{
			$html[] = '<script type="text/javascript">';
			$html[] = 'var pageNav = document.querySelector(".pagenav");';
			$html[] = 'if (pageNav) {';
			$html[] = 'var socialShare = document.getElementById("sunfw-social-share");';
			$html[] = 'if (socialShare) {';
			$html[] = 'pageNav.parentNode.insertBefore(socialShare, pageNav);';
			$html[] = '}';
			$html[] = '}';
			$html[] = '</script>';
		}

		return implode(' ', $html);
	}

	/**
	 * Render commenting.
	 *
	 * @param   string   $context  The context of the content being passed to the plugin
	 * @param   object   &$row     The article object
	 * @param   object   &$params  The article params
	 * @param   integer  $page     The 'page' number
	 *
	 * @return  string|boolean
	 */
	public function renderCommenting($context, &$row, &$params, $page = 0)
	{
		// Simply return if not rendering content article.
		if ($context != 'com_content.article')
		{
			return false;
		}

		// Get commenting data.
		$commenting = isset($this->commenting_data) ? $this->commenting_data : array();

		if (!isset($commenting['enabled']) || !(int) $commenting['enabled'])
		{
			return false;
		}

		// Check if the current article belongs to supported categories?
		if (empty($commenting['categories']) ||
			 !( in_array('all', $commenting['categories']) || in_array($row->catid, $commenting['categories']) ))
		{
			return false;
		}

		// Detect the name of the current event.
		static $currentEvent;

		$currentEvent = isset($currentEvent) ? 'onContentAfterDisplay' : 'onContentBeforeDisplay';

		if ($currentEvent == 'onContentBeforeDisplay' && ( empty($commenting['show-counter']) || !(int) $commenting['show-counter'] ))
		{
			return false;
		}

		// Render commenting.
		$html = array();
		$page = JUri::getInstance()->toString(array(
			'scheme',
			'host',
			'port',
			'path',
			'query'
		));

		if ($currentEvent == 'onContentAfterDisplay' && (int) $commenting['show-text'] && !empty($commenting['heading-text']))
		{
			$html[] = '<h3>' . $commenting['heading-text'] . '</h3>';
		}

		switch ($commenting['type'])
		{
			case 'disqus':
				if (empty($commenting['disqus-subdomain']))
				{
					return false;
				}

				if ($currentEvent == 'onContentBeforeDisplay')
				{
					$html[] = "<span class=\"sunfw-comment-count\"><i class=\"fa fa-comments\"></i> <a href=\"{$page}#disqus_thread\">0</a></span>";
					$html[] = "<script id=\"dsq-count-scr\" src=\"//{$commenting['disqus-subdomain']}.disqus.com/count.js\" async></script>";
				}
				else
				{
					$html[] = '<div id="disqus_thread"></div>';
					$html[] = '<script type="text/javascript">';
					$html[] = 'var disqus_config = function () {';
					$html[] = 'this.page.url = "' . $page . '";';
					$html[] = "this.page.identifier = '{$commenting['disqus-subdomain']}_article_{$row->id}';";
					$html[] = '};';
					$html[] = '(function() {';
					$html[] = 'var d = document, s = d.createElement("script");';
					$html[] = "s.src = 'https://{$commenting['disqus-subdomain']}.disqus.com/embed.js';";
					$html[] = 's.setAttribute("data-timestamp", +new Date());';
					$html[] = '(d.head || d.body).appendChild(s);';
					$html[] = '})();';
					$html[] = '</script>';
					$html[] = '<noscript>';
					$html[] = "<a href=\"https://{$commenting['disqus-subdomain']}.disqus.com/?url=ref\">";
					$html[] = JText::_('SUNFW_VIEW_THE_DISCUSSION_THREAD');
					$html[] = '</a>';
					$html[] = '</noscript>';
				}
			break;

			case 'facebook':
				if (empty($commenting['facebook-app-id']) || $currentEvent == 'onContentBeforeDisplay')
				{
					return false;
				}

				$html[] = '<div id="fb-root"></div>';
				$html[] = '<script>(function(d, s, id) {';
				$html[] = 'var js, fjs = d.getElementsByTagName(s)[0];';
				$html[] = 'if (d.getElementById(id)) return;';
				$html[] = 'js = d.createElement(s); js.id = id;';
				$html[] = "js.src = '//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.10&appId={$commenting['facebook-app-id']}';";
				$html[] = 'fjs.parentNode.insertBefore(js, fjs);';
				$html[] = '}(document, "script", "facebook-jssdk"));</script>';
				$html[] = '<div class="fb-comments" data-href="' . $page . '" data-width="100%" data-numposts="5"></div>';
			break;

			case 'google-plus':
				if ($currentEvent == 'onContentBeforeDisplay')
				{
					$html[] = '<script src="https://apis.google.com/js/plusone.js"></script>';
					$html[] = '<span class="sunfw-comment-count"><i class="fa fa-comments"></i> <a id="commentscounter" href="#comments">0</a></span>';
					$html[] = '<script>';
					$html[] = 'gapi.commentcount.render("commentscounter", {';
					$html[] = 'href: window.location';
					$html[] = '});';
					$html[] = '</script>';

					define('GOOGLE_PLUS_ONE_SCRIPT_LOADED', true);
				}
				else
				{
					if (!defined('GOOGLE_PLUS_ONE_SCRIPT_LOADED'))
					{
						$html[] = '<script src="https://apis.google.com/js/plusone.js"></script>';
					}

					$html[] = '<div id="comments"></div>';
					$html[] = '<script>';
					$html[] = 'gapi.comments.render("comments", {';
					$html[] = 'href: window.location,';
					$html[] = 'width: "' .
						 ( empty($commenting['google-comments-box-width']) ? 800 : $commenting['google-comments-box-width'] ) . '",';
					$html[] = 'first_party_property: "BLOGGER",';
					$html[] = 'view_type: "FILTERED_POSTMOD"';
					$html[] = '});';
					$html[] = '</script>';
				}
			break;

			case 'intensedebate':
				if (empty($commenting['intensedebate-site-account']))
				{
					return false;
				}

				if ($currentEvent == 'onContentBeforeDisplay')
				{
					$html[] = '<span class="sunfw-comment-count"><i class="fa fa-comments"></i> <a href="#comments">';
					$html[] = '<script>';
					$html[] = "var idcomments_acct = '{$commenting['intensedebate-site-account']}';";
					$html[] = "var idcomments_post_id = '{$commenting['disqus-subdomain']}_article_{$row->id}';";
					$html[] = "var idcomments_post_url = '{$page}';";
					$html[] = '</script>';
					$html[] = '<script type="text/javascript" src="https://www.intensedebate.com/js/genericLinkWrapperV2.js"></script>';
					$html[] = '</a></span>';
				}
				else
				{
					$html[] = '<div id="comments"></div>';
					$html[] = '<script>';
					$html[] = "var idcomments_acct = '{$commenting['intensedebate-site-account']}';";
					$html[] = "var idcomments_post_id = '{$commenting['disqus-subdomain']}_article_{$row->id}';";
					$html[] = "var idcomments_post_url = '{$page}';";
					$html[] = '</script>';
					$html[] = '<span id="IDCommentsPostTitle" style="display:none"></span>';
					$html[] = '<script type="text/javascript" src="https://www.intensedebate.com/js/genericCommentWrapperV2.js"></script>';
				}
			break;
		}

		if ($currentEvent == 'onContentBeforeDisplay' && $commenting['type'] != 'facebook')
		{
			$html[] = '<script type="text/javascript">';
			$html[] = 'var articleInfo = document.querySelector(".article-info");';
			$html[] = 'if (articleInfo) {';
			$html[] = 'var commentCount = document.querySelector(".sunfw-comment-count");';
			$html[] = 'if (commentCount) {';
			$html[] = 'var container = document.createElement("dd");';
			$html[] = 'articleInfo.appendChild(container);';
			$html[] = 'container.appendChild(commentCount);';
			$html[] = '}';
			$html[] = '}';
			$html[] = '</script>';
		}

		return implode(' ', $html);
	}

	/**
	 * Do assets optimization.
	 *
	 * @return  void
	 */
	public function optimizeAssets()
	{
		// Remove default Bootstrap.
		unset($this->doc->_scripts[JUri::root(true) . '/media/jui/js/bootstrap.min.js']);

		// Get system data.
		$systemData = isset($this->system_data) ? $this->system_data : array();
		$compressJS = false;
		$compressCSS = false;

		if (@count($systemData) && isset($systemData['compression']) && @count($systemData['compression']))
		{
			$config = JFactory::getConfig();

			// Verify cache directory.
			if (!preg_match('#^(/|\\|[a-z]:)#i', $systemData['cacheDirectory']))
			{
				$cachePath = JPATH_ROOT . '/' . rtrim($systemData['cacheDirectory'], '\\/');
			}
			else
			{
				$cachePath = rtrim($systemData['cacheDirectory'], '\\/');
			}

			if ($config->get('ftp_enable') || is_writable($cachePath))
			{
				if (is_array($systemData['compression']))
				{
					foreach ($systemData['compression'] as $value)
					{
						if ($value == 'css')
						{
							$compressCSS = true;
						}

						if ($value == 'js')
						{
							$compressJS = true;
						}
					}
				}

				// Compress CSS.
				if ($compressCSS)
				{
					$styleSheets = array();
					$compressedStyleSheets = SunFwSiteCompressCss::compress($this->doc->_styleSheets);

					foreach ($compressedStyleSheets as $compressedStyleSheet)
					{
						$stylesheets[$compressedStyleSheet['file']] = array(
							'mime' => 'text/css',
							'media' => ( $compressedStyleSheet['media'] == '' ? 'all' : $compressedStyleSheet['media'] ),
							'attribs' => array()
						);
					}

					$this->doc->_styleSheets = $stylesheets;
				}

				// Compress JS.
				if ($compressJS)
				{
					$scripts = array();
					$compressedScripts = SunFwSiteCompressJs::compress($this->doc->_scripts);

					foreach ($compressedScripts as $compressedScript)
					{
						$src = is_array($compressedScript) ? $compressedScript['src'] : $compressedScript;

						$scripts[$src] = is_array($compressedScript) ? $compressedScript['args'] : array(
							'type' => 'text/javascript',
							'options' => array()
						);
					}

					$this->doc->_scripts = $scripts;
				}
			}
		}
	}

	/**
	 * Finalize HTML output.
	 */
	public function finalizeOutput()
	{
		// Only continue if a page at front-end is requested.
		if (!$this->app->isClient('site') || !SunFwRecognization::detect())
		{
			return;
		}

		// Get the current output buffer.
		$buffer = $this->app->getBody();

		// Clear favicon link tag.
		$buffer = preg_replace('#<link href="[^>]*/' . $this->template . '/favicon.ico" rel="shortcut icon" type="[^>]*"\s*/?>#', '',
			$buffer);

		// Check if content has any instance of the shortcode '{jsnmenuitem_meta}'?
		$pattern = '#\{jsnmenuitem_meta\s*(content=)?[\'"]*([^\'"]*)[\'"]*\s*/?\}#i';

		if (preg_match_all($pattern, $buffer, $matches, PREG_SET_ORDER))
		{
			foreach ($matches as $match)
			{
				if (empty($match[2]))
				{
					$buffer = str_replace($match[0], '', $buffer);
				}
				else
				{
					// Get menu item parameters.
					if (!isset($mItem))
					{
						$mItem = $this->app->getMenu()->getActive();
					}

					if ($mItem)
					{
						if (!isset($mItemParams))
						{
							$mItemParams = $mItem->getParams();
						}

						// Generate content to replace.
						$meta = array_map('trim', explode(',', $match[2]));
						$html = '';

						foreach ($meta as $param)
						{
							switch ($param)
							{
								case 'menu_item_title':
									if ($mItemParams->get('page_heading', '') != '')
									{
										$html .= $mItemParams->get('page_heading');
									}
									else
									{
										if (isset($mItem->title))
										{
											$html .= $mItem->title;
										}
									}
								break;

								case 'link_title_attribute':
									if ($mItemParams->get('menu-anchor_title', '') != '')
									{
										$html .= $mItemParams->get('menu-anchor_title');
									}
								break;

								case 'link_image':
									if ($mItemParams->get('menu_image', '') != '')
									{
										$html .= '<img src="' . JUri::root(true) . '/' . $mItemParams->get('menu_image') . '" />';
									}
								break;

								case 'link_icon':
									if ($mItemParams->get('sunfw-link-icon', '') != '')
									{
										$html .= '<i class="' . $mItemParams->get('sunfw-link-icon') . '"></i>';
									}
								break;

								case 'link_description':
									if ($mItemParams->get('sunfw-page-subheading', '') != '')
									{
										$html .= $mItemParams->get('sunfw-page-subheading');
									}
								break;
							}
						}

						// Replace the current shortcode with real content.
						$buffer = str_replace($match[0], $html, $buffer);
					}
					else
					{
						$buffer = str_replace($match[0], '', $buffer);
					}
				}
			}
		}

		// Move script tags.
		$buffer = self::moveScriptTags($buffer);

		// Minify HTML.
		$buffer = self::minifyHTML($buffer);

		// Set new buffer.
		$this->app->setBody($buffer);
	}

	/**
	 * Mothod to minify HTML Content
	 *
	 * @param HTML Buffer $body
	 * @return mixed
	 */
	public static function minifyHTML($body)
	{
		// Get settings.
		$renderer = self::getInstance();

		$systemData = isset($renderer->system_data) ? $renderer->system_data : array();

		if (!@count($systemData) || !isset($systemData['minifyHTML']) || !(int) $systemData['minifyHTML'])
		{
			return $body;
		}

		// Do not touch content inside script tag.
		$parts = explode('<script', $body);

		foreach ($parts as $k => $v)
		{
			if ($k == 0)
			{
				$c = $v;
			}
			else
			{
				$v = explode('</script>', $v);
				$c = $v[1];
			}

			// Replace the $ character with the equivalent HTML entity.
			$c = str_replace('$', '&dollar;', $c);

			// Remove all spacing characters between 2 HTML tags.
			$regex = '#>[\r\n\t ]+<#';
			$c = preg_replace($regex, '><', $c);

			// Remove unnecessary spacing characters in a HTML tag.
			$regex = '#(<[^\s]+)\s{2,99}#';
			$c = preg_replace($regex, '\\1 ', $c);

			$regex = '#([\'"])\s{2,99}([^=]+=[\'"])#';
			$c = preg_replace($regex, '\\1 \\2', $c);

			$regex = '#\s+(/?>)#';
			$c = preg_replace($regex, '\\1', $c);

			$regex = '#>\s+([^\s]+[^<]*)<#';
			$c = preg_replace($regex, '>\\1<', $c);

			$regex = '#>([^<]*[^\s]+)\s+<#';
			$c = preg_replace($regex, '>\\1<', $c);

			// Remove new lines followed by multiple white spaces.
			$regex = '#[\r\n][\t ]+#';
			$c = preg_replace($regex, ' ', $c);

			// Revert the $ character from the equivalent HTML entity.
			$c = str_replace('&dollar;', '$', $c);

			if ($k > 0)
			{
				$c = $v[0] . '</script>' . $c;
			}

			$parts[$k] = $c;
		}

		$body = implode('<script', $parts);

		return $body;
	}

	/**
	 * Method to move all script tags from head section to the end of body section.
	 *
	 * @param   string  &$html  Generated response body.
	 *
	 * @return  void
	 */
	public static function moveScriptTags($html)
	{
		// Get Joomla input object
		$input = JFactory::getApplication()->input;
		$doc = JFactory::getDocument();
		// Only continue if requested return format is html
		if ($input->getCmd('format', null) != null and $input->getCmd('format') != 'html')
		{
			return $html;
		}

		// Only continue if the page format is html
		if ($doc->getType() !== 'html')
		{
			return $html;
		}

		// Only continue if the page is not the editing page
		if (strpos($_SERVER["PHP_SELF"], "index.php") === false || $input->getCmd('task', '') == 'edit' ||
			 $input->getCmd('layout', '') == 'edit')
		{
			return $html;
		}

		// Check if script movement is already done by our Sun Framework
		if (defined('SUNFW_SCRIPTS_MOVEMENT_COMPLETED'))
		{
			return $html;
		}

		// Get Joomla document object
		$document = JFactory::getDocument();

		// Get settings.
		$renderer = self::getInstance();

		$systemData = isset($renderer->system_data) ? $renderer->system_data : array();

		if (!@count($systemData) || !isset($systemData['moveJSToBottom']) || !(int) $systemData['moveJSToBottom'])
		{
			return $html;
		}

		// Move all script tags to the end of body section
		if ($n = count($parts = preg_split('/>[\s\t\r\n]*<script/', $html)))
		{
			// Re-generated script tags
			$tags = array();

			// Inline script code block combination status
			$combine = array();
			$last = 'inline';

			// Re-generate HTML document
			$temp = $parts[0];

			for ($i = 1; $i < $n; $i++)
			{
				// Get script tag
				$script = substr($parts[$i], 0, strpos($parts[$i], '</script') + 8);

				// Remove script tag from its original position
				$parts[$i] = str_replace($script, '', $parts[$i]);

				if (strpos($script, 'application/ld+json') !== false || strpos($script, 'application/json') !== false)
				{
					$temp .= ">\n<script" . $script . $parts[$i];
					//$temp .= '';
					continue;
				}

				// Leave script tag as is if it is placed inside conditional comments
				if (( preg_match('/([\r\n][\s\t]*)<\!--\[if[^\]]*IE[^\]]*\]/', $temp, $match) and strpos($temp, '<![endif]--') === false ) or
					 ( isset($notClosed) and $notClosed ))
				{
					$temp .= '>' . ( isset($match[1]) ? $match[1] : '' ) . '<script' . $script . $parts[$i];

					// Look for the end of conditional comments
					$notClosed = strpos($parts[$i], '<![endif]--') !== false ? false : true;

					// Continue the loop
					continue;
				}

				// Leave script code block as is if document.write function is used inside
				if (strpos($script, 'document.write') !== false)
				{
					$temp .= ">\n<script" . $script . $parts[$i];

					// Continue the loop
					continue;
				}

				// Re-generate HTML document
				$temp .= $parts[$i];

				// Complete script tag
				$script = '<script' . $script . '>';

				if (strpos(
					preg_replace(array(
						'/[\s\t\r\n]+/',
						'/[\s\t\r\n]+=[\s\t\r\n]+/'
					), array(
						' ',
						'='
					), $script), ' src=') === false)
				{
					// Clean-up inline script block
					$script = substr($script, strpos($script, '>') + 1, -9);

					if ($last == 'inline')
					{
						// Combine continuous script code block
						$combine[] = $script;
					}
					else
					{
						$combine = array(
							$script
						);
						$last = 'inline';
					}
				}
				else
				{
					// Copy combined script code block
					!count($combine) or $tags[] = '<script type="text/javascript">' . implode(";\n", $combine) . '</script>';

					// Copy script tag
					$tags[] = $script;

					// Reset variables
					$combine = array();
					$last = '';
				}
			}

			// Copy remaining combined script code block
			!count($combine) or $tags[] = '<script type="text/javascript">' . implode(";\n", $combine) . '</script>';

			// Inject all re-generated script tags to the end of body section
			if (count($tags))
			{
				$html = str_replace('</body>', implode("\n", $tags) . '</body>', $temp);

				// Define a constant to state that scripts movement is completed
				define('SUNFW_SCRIPTS_MOVEMENT_COMPLETED', 1);
			}
		}

		return $html;
	}
}
