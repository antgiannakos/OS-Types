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

(function($) {
	var SunFwGallerySelector = function(params) {
		this.params = params;

		this.init();
	};

	SunFwGallerySelector.prototype = {
		init: function() {
			var self = this;

			// Get the media selector modal.
			this.modal = document.getElementById('sunFwModalGallery');
			this.iframe = this.modal.querySelector('iframe');
			this.save = this.modal.querySelector('.select-image-btn');
			this.template = document.getElementById('sunFwTemplateGallery').textContent;

			// Setup button to select media.
			$('.sunfw-gallery-selector a[href="#sunFwModalGallery"]').click(function(event) {
				event.preventDefault();

				if ( this.disabled || this.classList.contains('disabled') ) {
					return;
				}

				// Make the modal temporary invisible for calculating modal height.
				self.modal.classList.remove('in');
				self.modal.classList.remove('hide');

				self.modal.style.display = 'initial';
				self.modal.style.visibility = 'hidden';

				// Calculate modal height.
				setTimeout(function() {
					var
					clientHeight = (document.documentElement || document.body).clientHeight,
					modalRect = self.modal.getBoundingClientRect(),
					modalHeight = clientHeight - (modalRect.top * 2),
					modalHeaderRect = self.modal.querySelector('.modal-header').getBoundingClientRect(),
					modalFooterRect = self.modal.querySelector('.modal-footer').getBoundingClientRect(),
					modalBody = self.modal.querySelector('.modal-body'),
					modalBodyCss = window.getComputedStyle(modalBody),
					modalBodyHeight = modalHeight - modalHeaderRect.height - modalFooterRect.height,
					iframeCss = window.getComputedStyle(self.iframe),
					iframeHeight = modalBodyHeight
						- parseInt( modalBodyCss.getPropertyValue('padding-top') )
						- parseInt( modalBodyCss.getPropertyValue('padding-bottom') )
						- parseInt( iframeCss.getPropertyValue('margin-top') )
						- parseInt( iframeCss.getPropertyValue('margin-bottom') );

					modalBody.style.maxHeight = 'initial';
					self.iframe.style.height = iframeHeight + 'px';

					// Make the modal visible again.
					self.modal.style.visibility = null;

					self.modal.classList.add('in');
				}, 10);

				// Get target field.
				self.field = $(this).closest('.sunfw-gallery-selector')[0];

				// Set iframe source.
				if (self.iframe.src == 'about:blank') {
					self.iframe.src = self.params.url;
				}

				// Define function to store selected image.
				window.SunFwSelectImage = function(selected) {
					// Generate image thumbnail.
					var
					name = self.field.querySelector('a[href="#sunFwModalGallery"]').getAttribute('data-name'),
					thumb = self.template.replace('{name}', name).replace(/\{image\}/g, selected);

					// Show thumbnail of newly selected image.
					$('.image-thumbs', self.field).removeClass('hide').append(thumb);
				};
			});

			// Setup button to remove selected image.
			$(document).on('click', '.sunfw-gallery-selector .remove-image', function(event) {
				event.preventDefault();

				// Check if field is disabled.
				var button = $(this).closest('.sunfw-gallery-selector')[0].querySelector('a[href="#sunFwModalGallery"]');

				if ( button.disabled || button.classList.contains('disabled') ) {
					return;
				}

				// Get thumbnails container.
				var container = this.parentNode.parentNode;

				// Remove image.
				container.removeChild(this.parentNode);

				// Hide thumbnails container if the last image is removed.
				if ( ! container.children.length ) {
					container.classList.add('hide');
				}
			});
		}
	}

	$(window).load(function() {
		new SunFwGallerySelector(SunFwGallerySelectorConfig);
	});
})(jQuery);
