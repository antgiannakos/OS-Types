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
$attribs = json_decode($this->item->attribs);
?>
<div class="sunfw-link">
	<h2><a href="<?php echo $attribs->sunfw_link_url; ?>" target="_blank" title="<?php echo $attribs->sunfw_link_title; ?>"><i class="fa fa-link" aria-hidden="true"></i><?php echo $attribs->sunfw_link_title; ?></a></h2>
</div>