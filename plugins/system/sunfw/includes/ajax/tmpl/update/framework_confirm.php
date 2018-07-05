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

if ($templateHasUpdate)
{
	$template_name = trim(preg_replace('/jsn_([^\d]+)(\d*)/', 'jsn-\\1-\\2', str_replace('_pro', '', $this->template['name'])), '-');
}

// @formatter:off
?>
<p><?php echo JText::_('SUNFW_AUTO_UPDATE_FRAMEWORK_AUTH_DESC'); ?></p>
<div class="alert alert-warning">
	<span class="label label-danger"><?php echo JText::_('SUNFW_IMPORTANT_INFORMATION'); ?></span>
	<ul>
		<li class="mb-0"><?php echo JText::_('SUNFW_AUTO_UPDATE_AUTH_NOTE_01'); ?></li>
		<li class="<?php echo $templateHasUpdate ? 'mb-0' : ''; ?>">
			<?php echo JText::sprintf('SUNFW_NEW_FRAMEWORK_VERSION_CHANGELOG', SUNFW_PLUGIN_CHANGELOG); ?>
		</li>
		<?php if ($templateHasUpdate) : ?>
		<li><?php echo JText::sprintf('SUNFW_NEW_TEMPLATE_VERSION_CHANGELOG_2', JText::_($template), sprintf(SUNFW_TEMPLATE_CHANGELOG, $template_name)); ?></li>
		<?php endif; ?>
	</ul>
</div>
<div class="modal-footer">
	<div class="actions">
		<?php if ($templateHasUpdate) : ?>
		<button id="btn-confirm-update-both" class="btn btn-primary"
			type="button"><?php echo JText::_('SUNFW_AUTO_UPDATE_FRAMEWORK_AND_TEMPLATE'); ?></button>
		<button id="btn-confirm-update" class="btn btn-primary" type="button"><?php echo JText::_('SUNFW_AUTO_UPDATE_FRAMEWORK_ONLY'); ?></button>
		<?php else: ?>
		<button id="btn-confirm-update" class="btn btn-primary" type="button"><?php echo JText::_('SUNFW_UPDATE'); ?></button>
		<?php endif; ?>
		<button id="btn-cancel-update" class="btn btn-default" type="button"><?php echo JText::_('SUNFW_CANCEL'); ?></button>
	</div>
</div>
