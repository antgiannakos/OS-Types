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

// No direct access.
defined('_JEXEC') or die;

// Get parameters.
$params = $this->item->params;
?>
<div class="sunfw-quote">
	<i class="fa fa-quote-left" aria-hidden="true"></i>
	<div class="info-quote">
		<p class="text"><?php echo $params->get('sunfw_quote_text'); ?></p>
		<p class="author"><?php echo $params->get('sunfw_quote_author'); ?></p>
	</div>
</div>