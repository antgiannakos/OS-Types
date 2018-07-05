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

// Load necessary library.
jimport('joomla.filesystem.file');

/**
 * General helper class.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwSiteHelper
{

	/**
	 * A singleton instance of the class.
	 *
	 * @var  SunFwSiteHelper
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
	 * SunFw renderer object.
	 *
	 * @var  SunFwSite
	 */
	protected $renderer;

	/**
	 * Constructor.
	 *
	 * @param   SunFwSite  $renderer  SunFw renderer object.
	 *
	 * @return  void
	 */
	public function __construct($renderer = null)
	{
		$this->renderer = $renderer;

		if ($this->renderer)
		{
			$this->app = & $this->renderer->app;
			$this->doc = & $this->renderer->doc;
		}
		else
		{
			$this->app = JFactory::getApplication();
			$this->doc = JFactory::getDocument();
		}
	}

	/**
	 * Get active instance of template helper object
	 *
	 * @param   SunFwSite  $renderer  SunFw renderer object.
	 *
	 * @return  SunFwSiteHelper
	 */
	public static function &getInstance($renderer = null)
	{
		if (!isset(self::$instance))
		{
			self::$instance = new self($renderer);
		}

		return self::$instance;
	}

	/**
	 * Alias of _prepare method
	 *
	 * @param   SunFwSite  $renderer  SunFw renderer object.
	 *
	 * @return  void
	 */
	public static function prepare($renderer = null)
	{
		self::getInstance($renderer)->_prepare();
	}

	/**
	 * Get an article.
	 *
	 * @param   int     $id    Article ID.
	 * @param   string  $lang  If specified, article association for this language tag will be loaded.
	 *                         Otherwise, article association for the current language will be loaded.
	 *
	 * @return  object
	 */
	public static function getArticle($id, $lang = '')
	{
		// Get database object.
		$db = JFactory::getDbo();

		// Start building query.
		$query = $db->getQuery(true)
			->select(
			'a.id, a.asset_id, a.title, a.alias, a.introtext, a.fulltext, a.catid, a.created, a.created_by, a.created_by_alias, CASE WHEN a.modified = ' .
				 $db->quote($db->getNullDate()) .
				 ' THEN a.created ELSE a.modified END as modified, a.modified_by, a.checked_out, a.checked_out_time, a.publish_up, a.publish_down, a.images, a.urls, a.attribs, a.version, a.ordering, a.metakey, a.metadesc, a.access, a.hits, a.metadata, a.featured, a.language, a.xreference')
			->from('#__content AS a');

		// Join on category table.
		$query->select('c.title AS category_title, c.alias AS category_alias, c.access AS category_access')->join('LEFT',
			'#__categories AS c on c.id = a.catid');

		// Join on user table.
		$query->select('u.name AS author')->join('LEFT', '#__users AS u on u.id = a.created_by');

		// Join over the categories to get parent category titles
		$query->select('parent.title as parent_title, parent.id as parent_id, parent.path as parent_route, parent.alias as parent_alias')->join(
			'LEFT', '#__categories as parent ON parent.id = c.parent_id');

		// Join on voting table
		$query->select('ROUND(v.rating_sum / v.rating_count, 0) AS rating, v.rating_count as rating_count')->join('LEFT',
			'#__content_rating AS v ON a.id = v.content_id');

		// Where...
		$query->where('a.id = ' . (int) $id);

		// Get data.
		$db->setQuery($query);

		$data = $db->loadObject();

		if (!empty($data))
		{
			// Check article language.
			if (empty($lang))
			{
				$lang = JFactory::getLanguage()->getTag();
			}

			if ($data->language == $lang)
			{
				if (class_exists('Registry'))
				{
					// Convert parameter fields to objects.
					$data->params = new Registry();
					$data->params->loadString($data->attribs);

					$registry = new Registry();
					$registry->loadString($data->metadata);
					$data->metadata = $registry;
				}
			}
			else
			{
				// Get associations of the specified article.
				$associations = JLanguageAssociations::getAssociations('com_content', '#__content', 'com_content.item', (int) $id);

				foreach ($associations as $tag => $association)
				{
					if ($tag == $lang)
					{
						return self::getArticle($association->id, $lang);
					}
				}
			}
		}

		return $data;
	}

	/**
	 * Prepare parameters for rendering the template.
	 *
	 * @return  void
	 */
	private function _prepare()
	{
		// Preset some variables.
		$this->doc->templateUrl = $this->renderer->baseurl . '/templates/' . $this->renderer->template;
		$this->doc->templatePrefix = $this->renderer->template . '_';
		$this->doc->isMobileSwicher = null;

		// Set custom direction if specified via query string.
		$this->doc->direction = $this->app->input->getCmd('sunfw_setdirection', $this->doc->direction);

		// Prepare switcher state.
		$switcher = $this->app->input->cookie->get($this->doc->templatePrefix . 'switcher_params', null, 'RAW');

		if ($switcher != null)
		{
			$switcher = json_decode($switcher, true);

			if ($switcher['mobile'] == 'yes')
			{
				$this->doc->isMobileSwicher = true;
			}
			else
			{
				$this->doc->isMobileSwicher = false;
			}
		}

		// Prepare body class.
		$this->_prepareBodyClass();

		// Prepare template assets.
		$this->_prepareHead();
	}

	/**
	 * Generate class attribute for the body tag.
	 *
	 * @return  string
	 */
	private function _prepareBodyClass()
	{
		// Generate body class.
		$bodyClass = array(
			"sunfw-direction-{$this->doc->direction}"
		);

		// Add page class suffix.
		$bodyClass[] = implode(' ', $this->_getPageClass());

		// Add class for requested component.
		if ($option = substr($this->app->input->getCmd('option'), 4))
		{
			$bodyClass[] = "sunfw-com-{$option}";
		}

		// Add class for requested view.
		if ($view = $this->app->input->getCmd('view'))
		{
			$bodyClass[] = "sunfw-view-{$view}";
		}

		// Add class for requested layout.
		if ($layout = $this->app->input->getCmd('layout'))
		{
			$bodyClass[] = "sunfw-layout-{$layout}";
		}

		// Add class for requested Itemid.
		if ($itemid = $this->app->input->getInt('Itemid'))
		{
			$bodyClass[] = "sunfw-itemid-{$itemid}";
		}

		// Add class for home page.
		if (is_object($this->doc->activeMenu) && $this->doc->activeMenu->home == 1)
		{
			$bodyClass[] = 'sunfw-homepage';
		}

		$this->doc->bodyClass = preg_replace('/custom-[^\-]+width-span\d+/', '', implode(' ', $bodyClass));
	}

	/**
	 * Get page class suffix from the current menu item parameters.
	 *
	 * @return  string
	 */
	private function _getPageClass()
	{
		$pageClass = '';

		$menus = $this->app->getMenu();
		$this->doc->activeMenu = $menus->getActive();

		if (is_object($this->doc->activeMenu))
		{
			// Get page class suffix.
			$params = JMenu::getInstance('site')->getParams($this->doc->activeMenu->id);
			$pageClass = $params->get('pageclass_sfx');
		}

		return explode(' ', $pageClass);
	}

	/**
	 * Prepare document head.
	 *
	 * @return  void
	 */
	private function _prepareHead()
	{
		// Only continue if requested return format is html.
		if ($this->doc->getType() != 'html')
		{
			return;
		}

		if (!empty($this->renderer->system_data))
		{
			// Load custom CSS files.
			if (!empty($this->renderer->system_data['customCSSFiles']))
			{
				$customCSSFiles = $this->renderer->system_data['customCSSFiles'];

				foreach (preg_split('/[\r\n]+/', $customCSSFiles) as $cssFile)
				{
					if (empty($cssFile) || strcasecmp(substr($cssFile, -4), '.css') != 0)
					{
						continue;
					}

					if (preg_match('#^([a-z]+://|/)#i', $cssFile))
					{
						$this->doc->addStylesheet(trim($cssFile));
					}
					else
					{
						$this->doc->addStylesheet($this->doc->templateUrl . '/css/' . trim($cssFile));
					}
				}
			}

			// Load custom Javascript files.
			if (!empty($this->renderer->system_data['customJSFiles']))
			{
				$customJSFiles = $this->renderer->system_data['customJSFiles'];

				foreach (preg_split('/[\r\n]+/', $customJSFiles) as $jsFile)
				{
					if (empty($jsFile) or strcasecmp(substr($jsFile, -3), '.js') != 0)
					{
						continue;
					}

					if (preg_match('#^([a-z]+://|/)#i', $jsFile))
					{
						$this->doc->addScript(trim($jsFile));
					}
					else
					{
						$this->doc->addScript($this->doc->templateUrl . '/js/' . trim($jsFile));
					}
				}
			}
		}

		if (!empty($this->renderer->appearance))
		{
			// Load Google Fonts.
			$fonts = array();

			if (!empty($this->renderer->appearance['general']))
			{
				$general = $this->renderer->appearance['general'];

				if ($general['heading']['headings-font-type'] == 'google' && !empty($general['heading']['headings-google-font-family']))
				{
					$tmpFont = $general['heading']['headings-google-font-family']['family'];

					if (!empty($general['heading']['headings-google-font-family']['subset']))
					{
						$tmpFont .= "&subset={$general['heading']['headings-google-font-family']['subset']}";
					}

					$fonts[] = $tmpFont;
				}

				if ($general['content']['content-font-type'] == 'google' && !empty($general['content']['content-google-font-family']))
				{
					$tmpFont = $general['content']['content-google-font-family']['family'];

					if (!empty($general['content']['content-google-font-family']['subset']))
					{
						$tmpFont .= "&subset={$general['content']['content-google-font-family']['subset']}";
					}

					$fonts[] = $tmpFont;
				}
			}

			if (!empty($this->renderer->appearance['menu']))
			{
				foreach ($this->renderer->appearance['menu'] as $k => $v)
				{
					if (isset($v['root']) && isset($v['root']['font-type']) && $v['root']['font-type'] == 'google' &&
						 !empty($v['root']['google-font-family']))
					{
						$tmpFont = $v['root']['google-font-family']['family'];

						if (!empty($v['root']['google-font-family']['subset']))
						{
							$tmpFont .= "&subset={$v['root']['google-font-family']['subset']}";
						}

						$fonts[] = $tmpFont;
					}
				}
			}

			if (count($fonts))
			{
				$fonts = $this->_prepareFont($fonts);

				foreach ($fonts as $font)
				{
					$this->doc->addStylesheet('https://fonts.googleapis.com/css?family=' . trim($font));
				}
			}
		}

		// Load right-to-left stylesheet.
		if ($this->doc->direction == 'rtl')
		{
			$this->doc->addStylesheet("{$this->doc->templateUrl}/css/rtl/style-rtl.css");

			// Load RTL override in niche.
			$template = $this->renderer->template;
			$niche = SunFwHelper::getActiveNicheStyle();

			if (file_exists(JPATH_ROOT . "/templates/{$template}/niches/{$niche}/css/rtl/style-rtl.css"))
			{
				$this->doc->addStylesheet("{$this->doc->templateUrl}/niches/{$niche}/css/rtl/style-rtl.css");
			}
		}

		// Auto load custom CSS file.
		$this->_autoLoadCustomCssFile();
	}

	/**
	 * Prepare font before add them to head tag.
	 *
	 * @param   array  $fonts
	 *
	 * @return  array
	 */
	private function _prepareFont($fonts)
	{
		$final = array();

		// Prepare links for loading the specified Google fonts.
		if ($fonts)
		{
			foreach ((array) $fonts as $font)
			{
				if (preg_match('/([^:&]+)(:[^&]+)?(&subset=.+)?/', $font, $match))
				{
					if (!isset($final[$match[1]]))
					{
						$final[$match[1]] = array(
							'weight' => array(),
							'subset' => array()
						);
					}

					if (!empty($match[2]))
					{
						$final[$match[1]]['weight'] = array_merge($final[$match[1]]['weight'],
							explode(',', substr($match[2], strlen(':'))));
					}

					if (!empty($match[3]))
					{
						$final[$match[1]]['subset'] = array_merge($final[$match[1]]['subset'],
							explode(',', substr($match[3], strlen('&subset='))));
					}
				}
			}
		}

		foreach ($final as $tmp => $tmpAttrs)
		{
			$final[$tmp] = urlencode($tmp);

			if (count($tmpAttrs['weight']))
			{
				$final[$tmp] .= ':' . implode(',', array_unique($tmpAttrs['weight']));
			}

			if (count($tmpAttrs['subset']))
			{
				$final[$tmp] .= '&subset=' . implode(',', array_unique($tmpAttrs['subset']));
			}
		}

		return $final;
	}

	/**
	 * Auto load custom CSS file.
	 *
	 * @return  void
	 */
	private function _autoLoadCustomCssFile()
	{
		// Get template parameters from the extensions table.
		$templateParams = SunFwHelper::getTemplateParams($this->renderer->template);

		if (isset($templateParams) && !empty($templateParams['customCSSFileChecksum']))
		{
			$customFile = JPATH_ROOT . "/templates/{$this->doc->template}/css/custom/custom.css";

			if (JFile::exists($customFile))
			{
				$md5 = md5_file($customFile);

				if ($md5 != $templateParams['customCSSFileChecksum'])
				{
					$this->doc->addStylesheet("{$this->doc->templateUrl}/css/custom/custom.css");
				}
			}
		}
	}
}
