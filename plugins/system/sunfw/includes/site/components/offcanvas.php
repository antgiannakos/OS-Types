<?php
/**
 * @version    $Id$
 * @package    SUN Framework
 * @author     JoomlaShine Team <support@joomlashine.com>
 * @copyright  Copyright (C) 2012 JoomlaShine.com. All Rights Reserved.
 * @license    GNU/GPL v2 or later http://www.gnu.org/licenses/gpl-2.0.html
 *
 * Websites: http://www.joomlashine.com
 * Technical Support:  Feedback - http://www.joomlashine.com/contact-us/get-support.htmlx
 */

// No direct access to this file.
defined('_JEXEC') or die();

// Prepare class and style for offcanvas container.
$container_class = array(
	"off-canvas-base off-canvas-{$position}"
);
$styleCanvas = array();

// Add CSS padding.
if (@is_array($component['settings']['padding']))
{
	$styleCanvas[] = ".off-canvas-{$position} .offcanvas-content {";

	foreach ($component['settings']['padding'] as $k => $v)
	{
		$styleCanvas[] = "padding-{$k}: {$v}px;";
	}

	$styleCanvas[] = '}';
}

switch ($position)
{
	case 'top':
		$container_class[] = 'top-0 right-0 left-0';

		// Get defined height.
		if (isset($component['settings']['height']) && $component['settings']['height'] != '')
		{
			$cvTopHeight = $component['settings']['height'];
		}
		else
		{
			$cvTopHeight = 300;
		}

		// Prepare style for offcanvas.
		$styleCanvas[] = "body.sunfw-offCanvas > .off-canvas-top { height: {$cvTopHeight}px;";

		if (!array_key_exists('show-toggle', $component['settings']) || intval($component['settings']['show-toggle']))
		{
			$styleCanvas[] = "transform: translate3d(0, -{$cvTopHeight}px, 0);";
			$styleCanvas[] = "-webkit-transform: translate3d(0, -{$cvTopHeight}px, 0);";
			$styleCanvas[] = '}';
			$styleCanvas[] = 'body.sunfw-offCanvas.is-top-open > .off-canvas-top {';
		}

		$styleCanvas[] = 'transform: translate3d(0px, 0px, 0px);';
		$styleCanvas[] = '-webkit-transform: translate3d(0px, 0px, 0px);';
		$styleCanvas[] = '}';
	break;

	case 'right':
		$container_class[] = 'top-0 right-0 bottom-0';

		// Get width.
		if (isset($component['settings']['width']) && $component['settings']['width'] != '')
		{
			$cvRightWidth = $component['settings']['width'];
		}
		else
		{
			$cvRightWidth = 300;
		}

		// Prepare style for offcanvas.
		$styleCanvas[] = "body.sunfw-offCanvas > .off-canvas-right { width: {$cvRightWidth}px;";

		if (!array_key_exists('show-toggle', $component['settings']) || intval($component['settings']['show-toggle']))
		{
			$styleCanvas[] = "transform: translate3d({$cvRightWidth}px, 0, 0);";
			$styleCanvas[] = "-webkit-transform: translate3d({$cvRightWidth}px, 0, 0);";
			$styleCanvas[] = '}';
			$styleCanvas[] = 'body.sunfw-offCanvas.sunfw-direction-rtl > .off-canvas-right {';
			$styleCanvas[] = "transform: translate3d(-{$cvRightWidth}px, 0, 0);";
			$styleCanvas[] = "-webkit-transform: translate3d(-{$cvRightWidth}px, 0, 0);";
			$styleCanvas[] = '}';
			$styleCanvas[] = 'body.sunfw-offCanvas.is-right-open > .off-canvas-right {';
		}

		$styleCanvas[] = 'transform: translate3d(0px, 0px, 0px);';
		$styleCanvas[] = '-webkit-transform: translate3d(0px, 0px, 0px);';
		$styleCanvas[] = '}';
	break;

	case 'bottom':
		$container_class[] = 'right-0 bottom-0 left-0';

		// Get height.
		if (isset($component['settings']['height']) && $component['settings']['height'] != '')
		{
			$cvBottomHeight = $component['settings']['height'];
		}
		else
		{
			$cvBottomHeight = 300;
		}

		// Prepare style for offcanvas.
		$styleCanvas[] = "body.sunfw-offCanvas > .off-canvas-bottom { height: {$cvBottomHeight}px;";

		if (!array_key_exists('show-toggle', $component['settings']) || intval($component['settings']['show-toggle']))
		{
			$styleCanvas[] = "transform: translate3d(0, {$cvBottomHeight}px, 0);";
			$styleCanvas[] = "-webkit-transform: translate3d(0, {$cvBottomHeight}px, 0);";
			$styleCanvas[] = '}';
			$styleCanvas[] = 'body.sunfw-offCanvas.is-bottom-open > .off-canvas-bottom {';
		}

		$styleCanvas[] = 'transform: translate3d(0px, 0px, 0px);';
		$styleCanvas[] = '-webkit-transform: translate3d(0px, 0px, 0px);';
		$styleCanvas[] = '}';
	break;

	case 'left':
		$container_class[] = 'top-0 bottom-0 left-0';

		// Get width.
		if (isset($component['settings']['width']) && $component['settings']['width'] != '')
		{
			$cvLeftWidth = $component['settings']['width'];
		}
		else
		{
			$cvLeftWidth = 300;
		}

		// Prepare style for offcanvas.
		$styleCanvas[] = "body.sunfw-offCanvas > .off-canvas-left { width: {$cvLeftWidth}px;";

		if (!array_key_exists('show-toggle', $component['settings']) || intval($component['settings']['show-toggle']))
		{
			$styleCanvas[] = "transform: translate3d(-{$cvLeftWidth}px, 0, 0);";
			$styleCanvas[] = "-webkit-transform: translate3d(-{$cvLeftWidth}px, 0, 0)};";
			$styleCanvas[] = '}';
			$styleCanvas[] = 'body.sunfw-offCanvas.sunfw-direction-rtl > .off-canvas-left {';
			$styleCanvas[] = "transform: translate3d({$cvLeftWidth}px, 0, 0);";
			$styleCanvas[] = "-webkit-transform: translate3d({$cvLeftWidth}px, 0, 0);";
			$styleCanvas[] = '}';
			$styleCanvas[] = 'body.sunfw-offCanvas.is-left-open > .off-canvas-left {';
		}

		$styleCanvas[] = 'transform: translate3d(0px, 0px, 0px);';
		$styleCanvas[] = '-webkit-transform: translate3d(0px, 0px, 0px);';
		$styleCanvas[] = '}';
	break;
}

// Check if class prefix is defined?
if (isset($component['settings']['class-prefix']))
{
	$container_class[] = $component['settings']['class-prefix'];
}

// Set inline style for offcanvas.
$this->doc->addStyleDeclaration(implode(' ', $styleCanvas));

// Prepare offcanvas visibility.
$visible_in = isset($component['settings']['visible_in']) ? $component['settings']['visible_in'] : '';

if (is_array($visible_in) && count($visible_in) > 0)
{
	foreach ($visible_in as $value)
	{
		$container_class[] = 'visible-' . $value;
	}
}

// Prepare class for offcanvas anchor if needed.

$anchor_class = 'close-offcanvas toggle-offcanvas';

if (isset($component['settings']['anchor-position']))
{
	$anchor_class .= " {$component['settings']['anchor-position']}";
}
else
{
	$anchor_class .= ' ' . ( in_array($position, array(
		'top',
		'bottom'
	)) ? 'center' : 'middle' );
}

if ($component['settings']['show-toggle'] == 1)
{
	$anchor_class .= ' show-toggle';
}

// @formatter:off

// Print style and script to toggle offcanvas.
if (!defined('OFFCANVAS_SCRIPT_PRINTED')) :
?>
<script type="text/javascript">
	(function($) {
		$(document).ready(function() {
			// Init event handler to toggle offcancas when toggling button is clicked.
			$('.toggle-offcanvas').on('click', function(event) {
				event.preventDefault();

				var match = $(this).closest('.off-canvas-base').attr('class').match(/off-canvas-base off-canvas-([^\s]+)/);

				if (match) {
					$('body').toggleClass('is-' + match[1] + '-open offcanvas-open');
				}

				// Init event handler to hide offcanvas when clicked outside.
				function hideOffcanvas(event) {
					if ( ! $(event.target).closest('.off-canvas-base').length ) {
						$('body').removeClass('is-top-open is-right-open is-bottom-open is-left-open offcanvas-open');

						$(document).off('click', hideOffcanvas);
					}
				}

				$(document).on('click', hideOffcanvas);
			});
		});
	})(jQuery);
</script>
<?php
define('OFFCANVAS_SCRIPT_PRINTED', true);

endif;
?>
<div class="<?php echo implode(' ', $container_class); ?>">
	<!--	-->
	<?php //if ( ! array_key_exists('show-toggle', $component['settings']) || intval($component['settings']['show-toggle']) ) : ?>
	<a class="<?php echo $anchor_class; ?>" href="#"><i class="fa fa-bars"
		aria-hidden="true"></i></a>
	<div class="clearfix"></div>
	<!--	-->
	<?php //endif; ?>
	<div class="offcanvas-content">
		<?php
		// Render sections in offcanvas.
		if (@count($component['rows']))
		{
			foreach ($component['rows'] as $sectionIndex)
			{
				SunFwSite::renderRow($layout['rows'][$sectionIndex]);
			}
		}
		?>
	</div>
</div>
