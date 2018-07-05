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
$templateName = str_replace('tpl_', '', $this->identifiedName);
$templateName = str_replace('2', '', $templateName);
$templateLink = "http://www.joomlashine.com/joomla-templates/jsn-" . $templateName . ".html";
?>
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700,900" rel="stylesheet">
<link rel="stylesheet" href="<?php echo $this->pathOnly . '/templates/' . $this->templateName . '/install/templates/assets/css/install.css';?>" />
<div class="sunfw-install">
	<div class="content-install">
		<h3 class="sunfw-install-title">Thank you for choosing JoomlaShine</h3>
		<p class="sunfw-install-content">You have successfully installed <a href="<?php echo $templateLink; ?>"  target="_blank"><?php echo JText::_(strtoupper($this->templateName)); ?> v<?php echo $this->templateVersion; ?></a> powered by <a href="http://www.joomlashine.com/joomla-templates/jsn-sunframework.html" target="_blank">Sun Framework</a></p>
	</div>
	<div class="sunfw-install-actions">
        <a href="index.php?option=com_templates&task=style.edit&id=<?php echo $this->style->id; ?>" class="btn btn-default" id="sunfw-btn-install-configure">Get started</a>
    </div>
</div>