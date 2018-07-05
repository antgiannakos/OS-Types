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
 * Handle Ajax requests.
 *
 * @package  SUN Framework
 * @since    1.0.0
 */
class SunFwAjax
{

	/**
	 * Joomla application object.
	 *
	 * @var  JApplicationCms
	 */
	protected $app;

	/**
	 * Joomla database object.
	 *
	 * @var  JDatabaseDriver
	 */
	protected $dbo;

	/**
	 * Input object.
	 *
	 * @var JInput
	 */
	protected $input;

	/**
	 * Session handler.
	 *
	 * @var JSession
	 */
	protected $session;

	/**
	 * Language management library.
	 *
	 * @var JLanguage
	 */
	protected $language;

	/**
	 * Template details.
	 *
	 * @var array
	 */
	protected $template;

	/**
	 * Active style ID.
	 *
	 * @var int
	 */
	protected $styleID;

	/**
	 * Active template name.
	 *
	 * @var string
	 */
	protected $templateName;

	/**
	 * Base Ajax URL.
	 *
	 * @var array
	 */
	protected $baseUrl;

	/**
	 * Response content.
	 *
	 * @var mixed
	 */
	protected $responseContent;

	/**
	 * Execute the requested Ajax action.
	 *
	 * @return  boolean
	 */
	public static function execute()
	{
		// Get Joomla's application instance.
		$app = JFactory::getApplication();

		// Prepare to execute Ajax action.
		$context = $app->input->getCmd('context', 'common');
		$action = $app->input->getCmd('action', 'index');
		$format = $app->input->getCmd('format', 'json');

		try
		{
			// Verify token.
			if (!JSession::checkToken('get'))
			{
				throw new Exception('Invalid Token');
			}

			// Verify user permission.
			if ($app->isClient('administrator') && !empty($_SERVER['HTTP_REFERER']))
			{
				$referer = explode('/index.php?', $_SERVER['HTTP_REFERER']);

				parse_str($referer[1], $referer);

				if ($referer['option'] != 'com_ajax' && !JFactory::getUser()->authorise('core.manage', $referer['option']))
				{
					// Set 403 header.
					header('HTTP/1.1 403 Forbidden');

					throw new Exception('JERROR_ALERTNOAUTHOR');
				}
			}

			// Generate context class.
			$contextClass = 'SunFwAjax' . str_replace(' ', '', ucwords(preg_replace('/[^a-zA-Z0-9]+/', ' ', $context)));

			if (!class_exists($contextClass))
			{
				throw new Exception("The requested context {$context} is invalid.");
			}

			// Create a new instance of the request context.
			$contextObject = new $contextClass();

			// Generate method name.
			$method = str_replace('-', '', $action) . 'Action';

			if (method_exists($contextObject, $method))
			{
				call_user_func(array(
					$contextObject,
					$method
				));
			}
			elseif (method_exists($contextObject, 'invoke'))
			{
				call_user_func(array(
					$contextObject,
					'invoke'
				), $action);
			}
			else
			{
				throw new Exception("The requested action {$action} is invalid.");
			}

			// Send response back.
			if ($format != 'json')
			{
				echo $contextObject->getResponse();
			}
			else
			{
				header('Content-Type: application/json');

				echo json_encode(array(
					'type' => 'success',
					'data' => $contextObject->getResponse()
				));
			}
		}
		catch (Exception $e)
		{
			if ($format != 'json')
			{
				echo $e->getMessage();
			}
			else
			{
				header('Content-Type: application/json');

				echo json_encode(
					array(
						'type' => $e->getCode() == 99 ? 'outdate' : 'error',
						'data' => ( $data = json_decode($e->getMessage(), true) ) ? $data : $e->getMessage()
					));
			}
		}

		return true;
	}

	/**
	 * Constructor.
	 *
	 * @return  void
	 */
	public function __construct()
	{
		// Get necessary objects.
		$this->app = JFactory::getApplication();
		$this->dbo = JFactory::getDbo();
		$this->input = $this->app->input;
		$this->session = JFactory::getSession();
		$this->language = JFactory::getLanguage();

		// Build base Ajax URL.
		$this->baseUrl = $this->input->getCmd('format', 'json');
		$this->baseUrl = "index.php?option=com_ajax&plugin=sunfw&format={$this->baseUrl}&context=" .
			 strtolower(preg_replace('/([a-z])([A-Z])/', '\\1-\\2', substr(get_class($this), 9))) . '&' . JSession::getFormToken() . '=1';

		// Prepare input data.
		$this->templateName = $this->input->getCmd('template_name', '');
		$this->styleID = $this->input->getInt('style_id', 0);

		if (!empty($this->templateName) && $this->styleID)
		{
			$this->baseUrl .= "&template_name={$this->templateName}&style_id={$this->styleID}";

			$this->parseTemplateInfo($this->templateName);
		}

		// Load template language file.
		$this->language->load('tpl_' . $this->templateName, JPATH_ROOT);
		$this->language->load('lib_joomla');
	}

	/**
	 * Default index action.
	 */
	public function indexAction()
	{
		$this->render();
	}

	/**
	 * Retrieve template detailed information and store it in the memory
	 *
	 * @param   string  $name  The template name
	 * @return  void
	 */
	protected function parseTemplateInfo($name)
	{
		if (!( $details = SunFwRecognization::detect($name) ))
		{
			$this->app->enqueueMessage("The template {$name} is not based on JSN Sun Framework.");
		}

		$this->template = array(
			'name' => $name,
			'id' => SunFwHelper::getTemplateIdentifiedName($name),
			'edition' => SunFwHelper::getTemplateEdition($name),
			'version' => SunFwHelper::getTemplateVersion($name),
			'realName' => ( JText::_($name) == $name ) ? strtoupper(
				preg_replace('/(\d+)$/', ' \\1', str_replace('_', ' ', str_replace('_pro', '', $name)))) : JText::_($name)
		);
	}

	/**
	 * Render a template file.
	 *
	 * @param   string  $tmpl  Template file name to render.
	 * @param   array   $data  Data to pass to template file.
	 *
	 * @return  void
	 */
	protected function render($tmpl = 'index', $data = array())
	{
		$context = $this->input->getCmd('context', 'common');
		$tplFile = dirname(__FILE__) . '/ajax/tmpl/' . $context . '/' . $tmpl . '.php';

		if (!is_file($tplFile) || !is_readable($tplFile))
		{
			throw new Exception('Template file not found: ' . $tplFile);
		}

		// Extract data to seperated variables.
		extract($data);

		// Start output buffer.
		ob_start();

		// Load template file.
		include $tplFile;

		// Send rendered content to client.
		$this->setResponse(ob_get_clean());
	}

	/**
	 * Set response content.
	 *
	 * @param   mixed  $content  Content will be sent to client
	 * @return  void
	 */
	protected function setResponse($content)
	{
		$this->responseContent = $content;
	}

	/**
	 * Get response content.
	 *
	 * @return mixed
	 */
	protected function getResponse()
	{
		return $this->responseContent;
	}
}
