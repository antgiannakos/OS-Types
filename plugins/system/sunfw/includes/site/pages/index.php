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

// Check if desktop switcher should be shown?
$showSwitch = isset($this->layout['settings']['show_desktop_switcher']) ? $this->layout['settings']['show_desktop_switcher'] : false;

// Check if boxed layout is enabled?
$boxLayout = isset($this->layout['settings']['enable_boxed_layout']) ? $this->layout['settings']['enable_boxed_layout'] : false;

// Get advanced parameters.
$systemDataParams = @count($this->system_data) ? $this->system_data : array();

// Check if cookie law is enabled?
$cookieLawEnabled = ( @count($this->cookie_law_data) && (int) $this->cookie_law_data['enabled'] );

// @formatter:off
?>
<!DOCTYPE html>
<html lang="<?php echo strtolower($this->doc->language); ?>"  dir="<?php echo $this->doc->direction; ?>">
	<head>
		<?php
		// Print custom code if has.
		if (!empty($systemDataParams['customAfterOpeningHeadTag']))
		{
			echo $systemDataParams['customAfterOpeningHeadTag'];
		}

		if ($cookieLawEnabled) :

		if (@count($this->cookie_law_data['cookie-law-accept-script'])) :
		?>
		<script type="text/javascript">
			function getCookie(cname) {
				var name = cname + '=';
				var decodedCookie = decodeURIComponent(document.cookie);
				var ca = decodedCookie.split(';');
				for (var i = 0; i <ca.length; i++) {
					var c = ca[i];
					while (c.charAt(0) == ' ') {
						c = c.substring(1);
					}
					if (c.indexOf(name) == 0) {
						return c.substring(name.length, c.length);
					}
				}
				return '';
			}
		</script>
		<?php
		endif;

		if (!empty($this->cookie_law_data['cookie-law-accept-script']['after_opening_head'])) :
		?>
		<script type="text/javascript">
			if (getCookie('cookieconsent_status') == 'dismiss') {<?php
				echo @preg_replace('#</?script[^>]*>#i', '', $this->cookie_law_data['cookie-law-accept-script']['after_opening_head']);
			?>}
		</script>
		<?php
		endif;

		endif;

		// If responsive is enabled, print viewport meta tag.
		if ($this->responsive) :
		?>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<?php endif ?>

		<jdoc:include type="head" />

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

		<?php
		// Add favicon to document object if defined.
		if (isset($systemDataParams['sunfwfavicon']) && !empty($systemDataParams['sunfwfavicon']))
		{
			if (preg_match('/^(http|https)/', $systemDataParams['sunfwfavicon'], $m) && count($m))
			{
				$this->doc->addFavicon($systemDataParams['sunfwfavicon']);
			}
			else
			{
				$this->doc->addFavicon($this->baseurl . '/' . $systemDataParams['sunfwfavicon']);
			}
		}

		// Print custom code if has.
		if (!empty($systemDataParams['customBeforeEndingHeadTag']))
		{
			echo $systemDataParams['customBeforeEndingHeadTag'];
		}

		if ($cookieLawEnabled && !empty($this->cookie_law_data['cookie-law-accept-script']['before_closing_head'])) :
		?>
		<script type="text/javascript">
			if (getCookie('cookieconsent_status') == 'dismiss') {<?php
				echo @preg_replace('#</?script[^>]*>#i', '', $this->cookie_law_data['cookie-law-accept-script']['before_closing_head']);
			?>}
		</script>
		<?php endif; ?>
	</head>

	<?php
	// Get setting effect for offvancas.
	// If no setting specified, init the default setting.
	// !!! Check if offvancas is always visible !!!
	$body_class = '';

	foreach (array('top', 'right', 'bottom', 'left') as $position)
	{
		if (isset($this->layout['views'][$position]) && @count($this->layout['views'][$position]['rows']))
		{
			if (isset($this->layout['views'][$position]['settings']) && !empty($this->layout['views'][$position]['settings']['effect']))
			{
				$body_class .= $this->layout['views'][$position]['settings']['effect'] . ' sunfw-offCanvas ';
			}
			else
			{
				$body_class .= 'effect-' . $position . '-push sunfw-offCanvas ';
			}
		}
	}

	// If responsive is not enabled, add an additional class to body tag.
	if (!$this->responsive)
	{
		$body_class .= 'disable-responsive';
	}
	?>

	<body id="sunfw-master" class="<?php echo $body_class . ' ' . $this->bodyClass; ?>">
		<?php
		// Print custom code if has.
		if (!empty($systemDataParams['customAfterOpeningBodyTag']))
		{
			echo $systemDataParams['customAfterOpeningBodyTag'];
		}

		if ($cookieLawEnabled && !empty($this->cookie_law_data['cookie-law-accept-script']['after_opening_body'])) :
		?>
		<script type="text/javascript">
			if (getCookie('cookieconsent_status') == 'dismiss') {<?php
				echo @preg_replace('#</?script[^>]*>#i', '', $this->cookie_law_data['cookie-law-accept-script']['after_opening_body']);
			?>}
		</script>
		<?php
		endif;

		// Show desktop switcher if enabled.
		if ($showSwitch) :
		?>
		<div class="sunfw-switcher setting hidden-lg hidden-md">
			<div class="btn-group" role="group" aria-label="...">
				<?php if ($this->responsive) : ?>
				<a href="#" class="btn" onclick="javascript: SunFwUtils.setTemplateAttribute('<?php echo $this->templatePrefix; ?>switcher_','mobile','no'); return false;"><i class="fa fa-desktop" aria-hidden="true"></i></a>
				<a href="#" class="btn active" onclick="javascript: SunFwUtils.setTemplateAttribute('<?php echo $this->templatePrefix; ?>switcher_','mobile','yes'); return false;"><i class="fa fa-mobile" aria-hidden="true"></i></a>
				<?php else : ?>
				<a href="#" class="btn active" onclick="javascript: SunFwUtils.setTemplateAttribute('<?php echo $this->templatePrefix; ?>switcher_','mobile','no'); return false;"><i class="fa fa-desktop" aria-hidden="true"></i></a>
				<a href="#" class="btn" onclick="javascript: SunFwUtils.setTemplateAttribute('<?php echo $this->templatePrefix; ?>switcher_','mobile','yes'); return false;"><i class="fa fa-mobile" aria-hidden="true"></i></a>
				<?php endif ?>
			</div>
		</div>
		<?php endif; ?>

		<div id="sunfw-wrapper" class="sunfw-content <?php if ($boxLayout) echo 'boxLayout'; ?>">
			<?php
			// Render sections.
			if (isset($this->layout['views']['main']) && @count($this->layout['views']['main']['sections']))
			{
				foreach ($this->layout['views']['main']['sections'] as $sectionIndex)
				{
					SunFwSite::renderSection($this->layout['sections'][$sectionIndex]);
				}
			}
			?>
		</div><!--/ #jsn-wrapper -->

		<?php
		// Render offcanvas.
		foreach (array('top', 'right', 'bottom', 'left') as $position)
		{
			if (isset($this->layout['views'][$position]) && @count($this->layout['views'][$position]['rows']))
			{
				SunFwSite::renderOffcanvas($this->layout['views'][$position], $position);
			}
		}

		// If Go to Top is enabled, print the icon.
		if (isset($this->layout['settings']['go_to_top']) && $this->layout['settings']['go_to_top'] == 1)
		{
			$classGoToTop = isset($this->layout['settings']['class_go_to_top']) ? $this->layout['settings']['class_go_to_top'] : '';
			$colorGoToTop = isset($this->layout['settings']['color_go_to_top']) ? $this->layout['settings']['color_go_to_top'] : '';
			$bgGoToTop    = isset($this->layout['settings']['bg_go_to_top'   ]) ? $this->layout['settings']['bg_go_to_top'   ] : '';
			$psGoToTop    = isset($this->layout['settings']['ps_go_to_top'   ]) ? $this->layout['settings']['ps_go_to_top'   ] : '';

			if (empty($psGoToTop))
			{
				$psGoToTop = 'right';
			}

			if ($bgGoToTop != '' || $colorGoToTop != '')
			{
				$styleGoToTop = '.sunfw-scrollup {'
					. 'background: ' . $bgGoToTop . ';'
					. 'color: ' . $colorGoToTop . ';'
					. '}';

				$this->doc->addStyleDeclaration($styleGoToTop);
			}
			?>
			<a href="#" class="sunfw-scrollup position-<?php echo $psGoToTop; ?> <?php echo $classGoToTop; ?>">
				<?php if (!empty($this->layout['settings']['icon_go_to_top']) && $this->layout['settings']['icon_go_to_top'] != 'fa-ban') : ?>
				<i class="fa <?php echo $this->layout['settings']['icon_go_to_top'];?>"></i>
				<?php
				endif;

				if (!empty($this->layout['settings']['text_go_to_top']))
				{
					echo $this->layout['settings']['text_go_to_top'];
				}
				?>
			</a>
			<?php
		}

		// Print custom code if has.
		if (!empty( $systemDataParams['customBeforeEndingBodyTag']))
		{
			echo $systemDataParams['customBeforeEndingBodyTag'];
		}

		if ($cookieLawEnabled && !empty($this->cookie_law_data['cookie-law-accept-script']['before_closing_body'])) :
		?>
		<script type="text/javascript">
			if (getCookie('cookieconsent_status') == 'dismiss') {<?php
				echo @preg_replace('#</?script[^>]*>#i', '', $this->cookie_law_data['cookie-law-accept-script']['before_closing_body']);
			?>}
		</script>
		<?php
		endif;

		// Show branding link.
		SunFwSite::renderBrandingLink();
		?>
	</body>
</html>
