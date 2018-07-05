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

$token = JSession::getFormToken();
?>
<div class="processing-installation">
	<p><?php echo JText::_('SUNFW_AUTO_UPDATE_INSTALLATION_DESC') ?></p>

	<ul id="sunfw-update-processes">
		<li id="sunfw-download-package"><span class="title"><?php echo JText::_('SUNFW_AUTO_UPDATE_DOWNLOAD_PACKAGE'); ?></span>
			<span class="status fa"></span>
			<div class="progress hidden">
				<div class="progress-bar" role="progressbar">
					<span class="percentage">0%</span>
				</div>
			</div>
			<div class="alert alert-danger hidden"></div></li>
		<li id="sunfw-backup-modified-files" class="hidden"><span
			class="title"><?php echo JText::_('SUNFW_AUTO_UPDATE_CREATE_LIST_UPDATED'); ?></span>
			<span class="status fa"></span>
			<p id="sunfw-download-backup-of-modified-files" class="hidden">
				<?php echo JText::_('SUNFW_AUTO_UPDATE_FOUND_MODIFIED_FILE_BEING_UPDATED'); ?>
				<a
					href="<?php echo $this->baseUrl . '&context=integrity&action=download&type=update&format=raw'; ?>"
					class="btn btn-xs btn-danger"><?php echo JText::_('SUNFW_AUTO_UPDATE_DOWNLOAD_MODIFIED_FILES'); ?></a>
			</p>
			<div class="alert alert-danger hidden"></div></li>
		<li id="sunfw-download-framework" class="hidden"><span class="title"><?php echo JText::_('SUNFW_AUTO_UPDATE_FRAMEWORK_DOWNLOAD_PACKAGE'); ?></span>
			<span class="status fa"></span>
			<div class="progress hidden">
				<div class="progress-bar" role="progressbar">
					<span class="percentage">0%</span>
				</div>
			</div>
			<div class="alert alert-danger hidden"></div></li>
		<li id="sunfw-install-framework" class="hidden"><span class="title"><?php echo JText::_('SUNFW_AUTO_UPDATE_FRAMEWORK_INSTALL'); ?></span>
			<span class="status fa"></span>
			<div class="alert alert-danger hidden"></div></li>
		<li id="sunfw-install-update" class="hidden"><span class="title"><?php echo JText::_('SUNFW_AUTO_UPDATE_INSTALL'); ?></span>
			<span class="status fa"></span>
			<div class="alert alert-danger hidden"></div></li>
	</ul>
</div>

<div class="finished-installation hidden">
	<p><?php echo JText::sprintf('SUNFW_AUTO_UPDATE_INSTALL_SUCCESS_DESC', $this->template['realName']); ?></p>

	<div id="sunfw-backup-information" class="alert alert-warning hidden">
		<span class="label label-danger"><?php echo JText::_('SUNFW_IMPORTANT_INFORMATION'); ?></span>
		<p>
			<?php echo JText::_('SUNFW_AUTO_UPDATE_INSTALL_DOWNLOAD_BACKUP'); ?>
			<a
				href="<?php echo $this->baseUrl . '&context=integrity&action=download&type=update&format=raw'; ?>"
				class="btn btn-xs btn-danger"><?php echo JText::_('SUNFW_AUTO_UPDATE_DOWNLOAD_MODIFIED_FILES'); ?></a>
		</p>
	</div>
</div>

<div class="modal-footer hidden">
	<div class="actions">
		<div id="sunfw-put-update-on-hold" class="hidden">
			<button id="btn-continue-install" class="btn btn-primary"><?php echo JText::_('SUNFW_CONTINUE') ?></button>
			<button id="btn-cancel-install" class="btn btn-default"><?php echo JText::_('SUNFW_CANCEL') ?></button>
		</div>
		<button id="btn-finish-install" class="btn btn-primary hidden"><?php echo JText::_('SUNFW_FINISH') ?></button>
	</div>
</div>
