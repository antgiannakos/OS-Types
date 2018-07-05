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
?>
<div class="processing-installation">
	<p><?php echo JText::_('SUNFW_AUTO_UPDATE_FRAMEWORK_INSTALLATION_DESC'); ?></p>

	<ul id="sunfw-update-processes">
		<li id="sunfw-download-package"><span class="title"><?php echo JText::_('SUNFW_AUTO_UPDATE_FRAMEWORK_DOWNLOAD_PACKAGE'); ?></span>
			<span class="status fa"></span>
			<div class="progress hidden">
				<div class="progress-bar" role="progressbar">
					<span class="percentage">0%</span>
				</div>
			</div>
			<div class="alert alert-danger hidden"></div></li>
		<li id="sunfw-install-update" class="hidden"><span class="title"><?php echo JText::_('SUNFW_AUTO_UPDATE_FRAMEWORK_INSTALL'); ?></span>
			<span class="status fa"></span>
			<div class="alert alert-danger hidden"></div></li>
	</ul>
</div>

<div class="finished-installation hidden">
	<p><?php echo JText::_('SUNFW_AUTO_UPDATE_FRAMEWORK_INSTALL_SUCCESS_DESC'); ?></p>
</div>

<div class="modal-footer hidden">
	<div class="actions">
		<button id="btn-finish-install" class="btn btn-primary"><?php echo JText::_('SUNFW_FINISH'); ?></button>
	</div>
</div>
