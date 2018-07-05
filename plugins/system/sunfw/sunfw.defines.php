<?php
/**
 * @version     $Id$
 * @package     JSNExtension
 * @subpackage  TPLFRAMEWORK2
 * @author      JoomlaShine Team <support@joomlashine.com>
 * @copyright   Copyright (C) 2012 JoomlaShine.com. All Rights Reserved.
 * @license     GNU/GPL v2 or later http://www.gnu.org/licenses/gpl-2.0.html
 *
 * Websites: http://www.joomlashine.com
 * Technical Support:  Feedback - http://www.joomlashine.com/contact-us/get-support.html
 */

// No direct access to this file
defined('_JEXEC') or die('Restricted access');

// Define base constants for the framework
define('SUNFW_PATH', dirname(__FILE__));

define('SUNFW_PATH_INCLUDES', SUNFW_PATH . '/includes');

define('SUNFW_ID', 'tpl_sunframework');
define('SUNFW_VERSION', '2.2.2');
define('SUNFW_RELEASED_DATE', '06/27/2018');

// Define remote URL for communicating with JoomlaShine server
define('SUNFW_CUSTOMER_AREA', 'https://www.joomlashine.com/customer-area/licenses.html');
define('SUNFW_LIGHTCART_URL', 'https://www.joomlashine.com/index.php?option=com_lightcart');
define('SUNFW_VERSIONING_URL', 'https://www.joomlashine.com/versioning/product_version.php');
define('SUNFW_UPGRADE_DETAILS', 'https://www.joomlashine.com/versioning/product_upgrade.php');
define('SUNFW_POST_CLIENT_INFORMATION_URL',
	'https://www.joomlashine.com/index.php?option=com_lightcart&view=clientinfo&task=clientinfo.getclientinfo');

define('SUNFW_CHECK_TOKEN_URL', 'https://www.joomlashine.com/index.php?option=com_lightcart&view=token&task=token.verify');
define('SUNFW_GET_TOKEN_URL', 'https://www.joomlashine.com/index.php?option=com_lightcart&view=token&task=token.gettoken');

define('SUNFW_GET_LICENSE_URL',
	'https://www.joomlashine.com/index.php?option=com_lightcart&view=authenticationapi&task=authenticationapi.getEdition&tmpl=component');
define('SUNFW_GET_UPDATE_URL',
	'https://www.joomlashine.com/index.php?option=com_lightcart&view=authenticationapi&task=authenticationapi.getUpdate&tmpl=component');
define('SUNFW_JOIN_TRIAL_URL',
	'https://www.joomlashine.com/index.php?option=com_lightcart&view=authenticationapi&task=authenticationapi.createTrialOrder&tmpl=component');
define('SUNFW_VALIDATE_LICENSE_URL',
	'https://www.joomlashine.com/index.php?option=com_lightcart&view=authenticationapi&task=authenticationapi.validateLicense&tmpl=component');
define('SUNFW_GET_BANNER_URL',
	'https://www.joomlashine.com/index.php?option=com_lightcart&view=adsbanners&task=adsbanners.getBanners&tmpl=component&type=json');
define('SUNFW_GET_INFO_URL',
	'https://www.joomlashine.com/index.php?option=com_lightcart&view=productapi&task=productapi.getInformation&tmpl=component&type=json');

define('SUNFW_PLUGIN_CHANGELOG', 'https://www.joomlashine.com/joomla-templates/jsn-sunframework.html#changelog');
define('SUNFW_TEMPLATE_CHANGELOG', 'https://www.joomlashine.com/joomla-templates/%s.html#changelog');

define('SUNFW_DOCUMENTATION_URL', 'https://www.joomlashine.com/documentation/jsn-templates/jsn-%1$s/jsn-%2$s-configuration-manual.html');
define('SUNFW_SUPPORT_URL', 'https://www.joomlashine.com/forum.html');
define('SUNFW_TEMPLATE_URL', 'https://www.joomlashine.com/joomla-templates/jsn-%s.html');
