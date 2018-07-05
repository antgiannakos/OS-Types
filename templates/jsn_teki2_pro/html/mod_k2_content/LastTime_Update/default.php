<?php
/**
 * @version    2.7.x
 * @package    K2
 * @author     JoomlaWorks http://www.joomlaworks.net
 * @copyright  Copyright (c) 2006 - 2016 JoomlaWorks Ltd. All rights reserved.
 * @license    GNU/GPL license: http://www.gnu.org/copyleft/gpl.html
 */

// no direct access
defined('_JEXEC') or die;
?>

<div id="k2ModuleBox<?php echo $module->id; ?>" class="k2ItemsBlock last-update<?php if($params->get('moduleclass_sfx')) echo ' '.$params->get('moduleclass_sfx'); ?>">
	<?php if($params->get('itemPreText')): ?>
	<p class="modulePretext"><?php echo $params->get('itemPreText'); ?></p>
	<?php endif; ?>
	<span style="display: inline-block;"><?php echo date("d. F Y");?></span>
	<?php if(count($items)): ?>
		<?php foreach ($items as $key=>$item):	?>
			<?php if($key==0) : ?>
			  <div class="Item visible-lg-inline-block visible-md-inline-block visible-sm-inline-block<?php if(count($items)==$key+1) echo ' lastItem'; ?>">
				  <?php if($params->get('itemDateCreated')): ?>
			      <span class="moduleItemDateCreated"><?php echo JText::_('K2_LATES_UPDATE'); echo ": ";?><?php echo JHTML::_('date', $item->created, "d. F Y g:ia"); ?></span>
			      <?php endif; ?>
			  </div>
			<?php endif; ?>
		<?php endforeach; ?>

  	<?php endif; ?>
</div>
