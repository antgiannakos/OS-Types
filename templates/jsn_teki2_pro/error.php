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
defined('_JEXEC') or die;
$error = SunFwSite::getInstance()->render( 'error' );
$app             = JFactory::getApplication();
$doc             = JFactory::getDocument();
$user            = JFactory::getUser();
$this->language  = $doc->language;
$this->direction = $doc->direction;

// Output document as HTML5.
if (is_callable(array($doc, 'setHtml5')))
{
    $doc->setHtml5(true);
}

// Getting params from template
$params = $app->getTemplate(true)->params;

// Detecting Active Variables
$option   = $app->input->getCmd('option', '');
$view     = $app->input->getCmd('view', '');
$layout   = $app->input->getCmd('layout', '');
$task     = $app->input->getCmd('task', '');
$itemid   = $app->input->getCmd('Itemid', '');
$sitename = $app->get('sitename');

if($task == "edit" || $layout == "form" )
{
    $fullWidth = 1;
}
else
{
    $fullWidth = 0;
}

// Add JavaScript Frameworks
JHtml::_('bootstrap.framework');

?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title><?php echo $this->title; ?> <?php echo htmlspecialchars($this->error->getMessage(), ENT_QUOTES, 'UTF-8'); ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php // Use of Google Font ?>
    <link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template; ?>/css/template.css" rel="stylesheet" />
    <link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template; ?>/css/bootstrap.css" rel="stylesheet" />
    <?php if ($app->get('debug_lang', '0') == '1' || $app->get('debug', '0') == '1') : ?>
        <link href="<?php echo JUri::root(true); ?>/media/cms/css/debug.css" rel="stylesheet" />
    <?php endif; ?>

    <link href="<?php echo $this->baseurl; ?>/templates/<?php echo $this->template; ?>/favicon.ico" rel="shortcut icon" type="image/vnd.microsoft.icon" />

</head>
<body class="site <?php echo $option
    . ' view-' . $view
    . ($layout ? ' layout-' . $layout : ' no-layout')
    . ($task ? ' task-' . $task : ' no-task')
    . ($itemid ? ' itemid-' . $itemid : '')
    . ($params->get('fluidContainer') ? ' fluid' : '');
?>">
<!-- Body -->
<div class="body jsn-error-page">
    <div class="jsn-content">

        <!-- Banner -->
        <div class="row">
            <div id="content" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <!-- Begin Content -->
                <div class="table">
                    <div class="table-cell">
                        <h1 class="page-header"><?php echo $this->error->getCode(); ?></h1>
                        <div class="content-inner">
                            <h3><?php echo htmlspecialchars($this->error->getMessage(), ENT_QUOTES, 'UTF-8');?></h3>
                            <p>The page you are looking for was moved, removed, renamed or might never existed.</p>
							<div class="goto-home"><a class="" href="<?php echo JUri::base();?>"><?php echo JText::_('TPL_GO_TO_HOME');?></a></div>
                            <div class="jsn-search">
                                <?php echo $doc->getBuffer('modules', 'search-404', array('style' => 'xhtml')); ?>
                            </div>
                            
                        </div>
                    </div>
                </div>
                <!-- End Content -->
            </div>
        </div>
    </div>
</div>
<?php echo $doc->getBuffer('modules', 'debug', array('style' => 'none')); ?>
</body>
</html>