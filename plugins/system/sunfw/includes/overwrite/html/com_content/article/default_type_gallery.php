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
$params  = $this->item->params;
$gallery = $params->get('sunfw_gallery_images');

if (is_array($params->get('sunfw_gallery_images'))) :

	$countArray = count($gallery);

	echo '<div id="carousel-sunfw-' . $this->item->id . '" class="carousel slide sunfw-gallery" data-ride="carousel">';
	// Indicators
	echo '<ol class="carousel-indicators">';
	foreach ($gallery as $i => $v) {
		if ($i == 0) {
			echo '<li data-target="#carousel-sunfw-' . $this->item->id .'" data-slide-to="'.$i.'" class="active"></li>';
		}else {
			echo '<li data-target="#carousel-sunfw-' . $this->item->id .'" data-slide-to="'.$i.'"></li>';
		}
	}
	echo '</ol>';

	// Wrapper for slides
	echo '<div class="carousel-inner" role="listbox">';
	foreach ($gallery as $i => $v) {
		if ($i == 0) {
			echo '<div class="item active">';
		}else {
			echo '<div class="item">';
		}
			echo '<img src="'.$v.'" alt="'.$this->item->title.'" />';
		echo '</div>'; // Item
	}
	echo '</div>'; //  carousel-inner

	// Controls
	echo '<a class="left carousel-control" href="#carousel-sunfw-' . $this->item->id . '" role="button" data-slide="prev">' .
			'<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>' .
			'<span class="sr-only">Previous</span>' .
		'</a>' .
		'<a class="right carousel-control" href="#carousel-sunfw-' . $this->item->id . '" role="button" data-slide="next">' .
			'<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>' .
			'<span class="sr-only">Next</span>' .
		'</a>';
	echo '</div>'; // carousel-sunfw-ID
endif;
?>