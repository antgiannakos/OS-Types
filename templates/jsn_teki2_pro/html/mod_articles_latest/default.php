<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_articles_latest
 *
 * @copyright   Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
?>
<div class="sunfw-latestnews">
	<ul class="latestnews<?php echo $moduleclass_sfx; ?>">
	<?php foreach ($list as $item) : ?>
		<li itemscope itemtype="https://schema.org/Article">
			<div class="date">
				<div class="day">
					<?php echo JHtml::_('date',$item -> created,'d')?>
				</div>
				<div class="month">
					<?php echo JHtml::_('date',$item -> created,'M')?>
				</div>
			</div>
			<div class="content">
				<a href="<?php echo $item->link; ?>" itemprop="url">
				<span itemprop="name">
					<?php echo $item->title; ?>
				</span>
				</a>
			</div>
		</li>
	<?php endforeach; ?>
	</ul>
</div>