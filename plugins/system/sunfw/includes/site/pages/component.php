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

// No direct access to this file.
defined('_JEXEC') or die();

// Check if boxed layout is enabled?
$boxLayout = isset($this->layout['settings']['enable_boxed_layout']) ? $this->layout['settings']['enable_boxed_layout'] : false;

// Get advanced parameters.
$systemDataParams = @count($this->system_data) ? $this->system_data : array();

// @formatter:off
?>
<!DOCTYPE html>
<html lang="<?php echo strtolower($this->doc->language); ?>"  dir="<?php echo $this->doc->direction; ?>">
	<head>
		<?php if ($this->responsive) : ?>
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
		?>
	</head>

	<?php
	// Prepare body class.
	$body_class = '';

	// If responsive is not enabled, add an additional class to body tag.
	if (!$this->responsive)
	{
		$body_class = 'disable-responsive';
	}
	?>

	<body id="sunfw-master" class="<?php echo $body_class . ' ' . $this->bodyClass; ?>">
		<div id="sunfw-wrapper" class="sunfw-content <?php if ($boxLayout) echo 'boxLayout'; ?>">
			<jdoc:include type="message" />
			<jdoc:include type="component" />
		</div>
	</body>
</html>
