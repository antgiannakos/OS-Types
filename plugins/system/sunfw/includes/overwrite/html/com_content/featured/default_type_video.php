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
$videoURL   = $attribs->sunfw_video_url;

$videoType  = parse_url($videoURL);

switch($videoType['host']) {
	case 'youtu.be':
	case 'www.youtube.com':
	case 'youtube.com':
		preg_match('%(?:youtube(?:-nocookie)?\.com/(?:[^/]+/.+/|(?:v|e(?:mbed)?)/|.*[?&]v=)|youtu\.be/)([^"&?/ ]{11})%i', $videoURL, $match);
		$video_src 	= '//www.youtube.com/embed/' . $match[1];
		break;

	case 'vimeo.com':
	case 'www.vimeo.com':
		preg_match('%^https?:\/\/(?:www\.|player\.)?vimeo.com\/(?:channels\/(?:\w+\/)?|groups\/([^\/]*)\/videos\/|album\/(\d+)\/video\/|video\/|)(\d+)(?:$|\/|\?)(?:[?]?.*)$%im', $videoURL, $regs);
		$video_src 	= "//player.vimeo.com/video/" . $regs[3];
}

?>
<div class="sunfw-video">
	<div class="embed-responsive embed-responsive-16by9">
		<iframe class="embed-responsive-item" src="<?php echo $video_src;?>" allowfullscreen></iframe>
	</div>
</div>