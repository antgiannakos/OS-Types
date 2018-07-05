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
$params 	= $this->item->params;
$images     = json_decode($this->item->images);
$standard  	= $params->get('sunfw_featured_image');
if ($standard != '') {
    echo '<div class="sunfw-standard"><img src="'.$standard.'" alt="" /></div>';
}else {
    ?>
    <?php if (isset($images->image_fulltext) && !empty($images->image_fulltext)) : ?>
        <?php $imgfloat = (empty($images->float_fulltext)) ? $params->get('float_fulltext') : $images->float_fulltext; ?>
        <div class="pull-<?php echo htmlspecialchars($imgfloat); ?> item-image">
            <img class="img-responsive" <?php if ($images->image_fulltext_caption): echo ' title="' . htmlspecialchars($images->image_fulltext_caption) . '"'; endif; ?>
                 src="<?php echo htmlspecialchars($images->image_fulltext); ?>" alt="<?php echo htmlspecialchars($images->image_fulltext_alt); ?>" itemprop="image"/>
        </div>
    <?php endif; ?>
    <?php
}
?>