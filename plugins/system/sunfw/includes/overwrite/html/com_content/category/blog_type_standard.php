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
$standard  	= $attribs->sunfw_featured_image;
if ($standard != '') {
    echo '<div class="sunfw-standard"><img src="'.$standard.'" alt="" /></div>';
}else {
    echo JLayoutHelper::render('joomla.content.intro_image', $this->item);
}
?>