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

// Continue only if the default template supports custom 404.
$xml = SunFwHelper::getManifest($this->template);

if (!$xml || !( $xml = current($xml->xpath('//feature[@name="custom_404"]')) ) || (string) $xml['enabled'] !== 'yes')
{
	return;
}

// Get request variables.
$option = $this->app->input->getCmd('option');
$view = $this->app->input->getCmd('view');
$layout = $this->app->input->getCmd('layout');
$task = $this->app->input->getCmd('task');
$itemid = $this->app->input->getCmd('Itemid');

// Get site name.
$sitename = $this->app->get('sitename');

// Prepare custom 404 article.
if (!empty($this->custom_404_data) && (int) $this->custom_404_data['enabled'] && !empty($this->custom_404_data['article']))
{
	$item = substr($this->custom_404_data['article'], strpos($this->custom_404_data['article'], ':') + 1);

	if ($item = SunFwSiteHelper::getArticle((int) $item))
	{
		// Add router helpers.
		$item->slug = $item->alias ? ( $item->id . ':' . $item->alias ) : $item->id;
		$item->catslug = $item->category_alias ? ( $item->catid . ':' . $item->category_alias ) : $item->catid;
		$item->parent_slug = $item->parent_alias ? ( $item->parent_id . ':' . $item->parent_alias ) : $item->parent_id;

		// No link for ROOT category.
		if ($item->parent_alias === 'root')
		{
			$item->parent_slug = null;
		}

		// TODO: Change based on shownoauth.
		JLoader::register('ContentHelperRoute', JPATH_ROOT . '/components/com_content/helpers/route.php');

		$item->readmore_link = JRoute::_(ContentHelperRoute::getArticleRoute($item->slug, $item->catid, $item->language));

		// Prepare content.
		$item->text = $item->introtext;
		$item->params = new JRegistry($item->attribs);

		// Process the content plugins.
		JPluginHelper::importPlugin('content');

		$dispatcher = JEventDispatcher::getInstance();
		$dispatcher->trigger('onContentPrepare', array(
			'com_content.article',
			&$item,
			&$item->params
		));

		$item->event = new stdClass();
		$results = $dispatcher->trigger('onContentAfterTitle', array(
			'com_content.article',
			&$item,
			&$item->params
		));
		$item->event->afterDisplayTitle = trim(implode("\n", $results));

		$results = $dispatcher->trigger('onContentBeforeDisplay', array(
			'com_content.article',
			&$item,
			&$item->params
		));
		$item->event->beforeDisplayContent = trim(implode("\n", $results));

		$results = $dispatcher->trigger('onContentAfterDisplay', array(
			'com_content.article',
			&$item,
			&$item->params
		));
		$item->event->afterDisplayContent = trim(implode("\n", $results));
	}
}

// Get Joomla document object.
$document = JFactory::getDocument();

// @formatter:off
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<base href="<?php echo JURI::base(); ?>" />

	<title><?php echo $this->title; ?> <?php echo htmlspecialchars($this->error->getMessage(), ENT_QUOTES, 'UTF-8'); ?></title>

	<?php foreach ($document->_styleSheets as $src => $attrs) : ?>
	<link href="<?php echo $src; ?>" type="<?php echo $attrs['type']; ?>" rel="stylesheet" />
	<?php endforeach; ?>

	<link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template; ?>/css/template.css" rel="stylesheet" />
	<link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template; ?>/css/bootstrap.css" rel="stylesheet" />

	<style type="text/css">
		<?php echo implode("\n", $document->_style); ?>
	</style>

	<?php if ($this->app->get('debug_lang', '0') == '1' || $this->app->get('debug', '0') == '1') : ?>
	<link href="<?php echo $this->baseurl; ?>/media/cms/css/debug.css" rel="stylesheet" />
	<?php endif; ?>

	<?php foreach ($document->_scripts as $src => $attrs) : ?>
	<script src="<?php echo $src; ?>" type="<?php echo $attrs['type']; ?>"></script>
	<?php endforeach; ?>

	<script type="text/javascript">
		<?php echo implode("\n", $document->_script); ?>
	</script>

	<link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template; ?>/favicon.ico" rel="shortcut icon" type="image/vnd.microsoft.icon" />
</head>
<body class="site <?php echo "{$option} view-{$view}" . ($layout ? ' layout-' . $layout : ' no-layout') . ($task ? ' task-' . $task : ' no-task') . ($itemid ? ' itemid-' . $itemid : ''); ?>">
	<div class="body">
		<div class="jsn-error container">
			<div class="jsn-error-inner">
				<div class="jsn-error-page">
					<header class="header" role="banner">
						<div class="header-inner clearfix">
							<a class="brand" href="<?php echo $this->baseurl; ?>/">
								<div class="page-header">
									<h1 class="site-title" title="<?php echo $sitename; ?>"><?php echo $sitename; ?></h1>
								</div>
							</a>
							<div class="header-search pull-right">
								<?php echo $this->doc->getBuffer('modules', 'position-0', array('style' => 'none')); ?>
							</div>
						</div>
					</header>

					<div class="navigation">
						<?php echo $this->doc->getBuffer('modules', 'position-1', array('style' => 'none')); ?>
					</div>
				</div>

				<div id="content">
					<?php
					// Print article title if enabled.
					if (isset($item) && ($params = json_decode($item->attribs, true)) && (int) $params['show_title']) :
					?>
					<h2 class="page-header"><?php echo $item->title; ?></h2>
					<?php endif; ?>

					<div class="well">
						<?php
						if (isset($item)) :

						echo $item->event->beforeDisplayContent;
						echo $item->text;
						echo $item->event->afterDisplayContent;

						if (!empty($item->fulltext)) :
						?>
						<p class="text-right">
							<a href="<?php echo $item->readmore_link; ?>" title="<?php echo $item->title; ?>"><?php echo JText::_('SUNFW_READ_MORE'); ?></a>
						</p>
						<?php
						endif;

						else :
						?>
						<div class="row page-header">
							<div class="col-xs-12 col-md-6">
								<h3><?php echo JText::_('JERROR_LAYOUT_ERROR_HAS_OCCURRED_WHILE_PROCESSING_YOUR_REQUEST'); ?></h3>
								<p><?php echo JText::_('JERROR_LAYOUT_NOT_ABLE_TO_VISIT'); ?></p>
								<ul>
									<li><?php echo JText::_('JERROR_LAYOUT_AN_OUT_OF_DATE_BOOKMARK_FAVOURITE'); ?></li>
									<li><?php echo JText::_('JERROR_LAYOUT_MIS_TYPED_ADDRESS'); ?></li>
									<li><?php echo JText::_('JERROR_LAYOUT_SEARCH_ENGINE_OUT_OF_DATE_LISTING'); ?></li>
									<li><?php echo JText::_('JERROR_LAYOUT_YOU_HAVE_NO_ACCESS_TO_THIS_PAGE'); ?></li>
								</ul>
							</div>

							<div class="col-xs-12 col-md-6">
								<?php if (JModuleHelper::getModule('search')) : ?>
									<h3><?php echo JText::_('JERROR_LAYOUT_SEARCH'); ?></h3>
									<p><?php echo JText::_('JERROR_LAYOUT_SEARCH_PAGE'); ?></p>
									<?php
									echo $this->doc->getBuffer('module', 'search');

								endif;
								?>
								<p><?php echo JText::_('JERROR_LAYOUT_GO_TO_THE_HOME_PAGE'); ?></p>
								<p><a href="<?php echo $this->baseurl; ?>/index.php" class="btn btn-default"><?php echo JText::_('JERROR_LAYOUT_HOME_PAGE'); ?></a></p>
							</div>
						</div>

						<p><?php echo JText::_('JERROR_LAYOUT_PLEASE_CONTACT_THE_SYSTEM_ADMINISTRATOR'); ?></p>
						<blockquote>
							<span class="label label-inverse"><?php echo $this->error->getCode(); ?></span> <?php echo htmlspecialchars($this->error->getMessage(), ENT_QUOTES, 'UTF-8');?>
							<?php if ($this->debug) : ?>
								<br/><?php echo htmlspecialchars($this->error->getFile(), ENT_QUOTES, 'UTF-8');?>:<?php echo $this->error->getLine(); ?>
							<?php endif; ?>
						</blockquote>
						<?php endif; ?>

						<?php if ($this->debug) : ?>
						<div>
							<?php
							echo $this->doc->renderBacktrace();

							if ($this->error->getPrevious()) :

							$loop = true;

							// Reference $this->_error here and in the loop as setError() assigns errors to this property and we need this for the backtrace to work correctly.
							// Make the first assignment to setError() outside the loop so the loop does not skip Exceptions.
							$this->doc->setError($this->_error->getPrevious());

							while ($loop === true) :
							?>
							<p><?php echo JText::_('JERROR_LAYOUT_PREVIOUS_ERROR'); ?></p>
							<p>
								<?php echo htmlspecialchars($this->_error->getMessage(), ENT_QUOTES, 'UTF-8'); ?>
								<br/><?php echo htmlspecialchars($this->_error->getFile(), ENT_QUOTES, 'UTF-8');?>:<?php echo $this->_error->getLine(); ?>
							</p>
							<?php
							echo $this->doc->renderBacktrace();

							$loop = $this->doc->setError($this->_error->getPrevious());

							endwhile;

							// Reset the main error object to the base error.
							$this->doc->setError($this->error);

							endif;
							?>
						</div>
						<?php endif; ?>
					</div>
				</div>
			</div>

			<div class="footer">
				<div>
					<hr />
					<?php echo $this->doc->getBuffer('modules', 'footer', array('style' => 'none')); ?>
					<p class="pull-right">
						<a href="#top" id="back-top">
							<?php echo JText::_('TPL_GOTOTOP'); ?>
						</a>
					</p>
					<p>
						&copy; <?php echo date('Y'); ?> <?php echo $sitename; ?>
					</p>
				</div>
			</div>
		</div>
	</div>
	<?php echo $this->doc->getBuffer('modules', 'debug', array('style' => 'none')); ?>
</body>
</html>
