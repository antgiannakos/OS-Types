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
	var SunFwIconSelector = function(params) {
		this.params = params;

		this.init();
	};

	SunFwIconSelector.prototype = {
		init: function() {
			var self = this;

			// Setup icon selector modal.
			this.modal = $('#sunFwModalIcon');
			this.container = $('.sunfw-show-icon-container', this.modal);
			this.category = $('.sunfw_font_category', this.modal);
			this.quicksearch = $('.sunfw-quicksearch-icon', this.modal);
			this.selectBtn = $('.select-icon-btn', this.modal);

			var oldIconFilter = '';

			this.containerResultsFilter = $('<ul/>', {'class': 'sunfw-items-list'});

			this.container.append(this.containerResultsFilter);

			this.quicksearch.val('');

			this.category.on('change', function() {
				self.quicksearch.val('');
				self.renderIconList();
			});

			this.quicksearch.keyup(function(el) {
				if ($(this).val() != oldIconFilter) {
					oldIconFilter = $(this).val();
					self.filterResults($(this).val(), self.containerResultsFilter);
				}
			});

			this.selectBtn.on('click', function(){
				if ( this.disabled || this.classList.contains('disabled') ) {
					return;
				}

				self.selectIcon();
			});

			this.renderIconList();

			// Setup button to open selector modal.
			$('a[href="#sunFwModalIcon"]').click(function(event) {
				event.preventDefault();

				self.targetField = $(this).closest('.sunfw-icon-selector');
			});

			// Setup button to clear selected icon.
			$('.sunfw-clear-icon').click(function(event) {
				event.preventDefault();

				// Clear field.
				var field = $(this).closest('.sunfw-icon-selector');

				$('input[name]', field).val('');
				$('.sunfw-selected-icon', field).val('');
				$('.sunfw-preview-icon i', field).removeAttr('class');

				// Hide button to clear selected icon.
				$(this).addClass('hidden');
			});
		},

		filterResults: function(value, resultsFilter) {
			$(resultsFilter).find('li').hide();

			if (value != '') {
				$(resultsFilter).find('li').each(function() {
					var textField = $(this).find('a').attr('data-value').toLowerCase();

					if (textField.search(value.toLowerCase()) == -1) {
						$(this).hide();
					} else {
						$(this).fadeIn(100);
					}
				});
			} else {
				$(resultsFilter).find('li').each(function() {
					$(this).fadeIn(100);
				});
			}
		},

		renderIconList: function() {
			var self = this, classActive = {'class': 'sunfw-item'}, category = this.category.val();

			if (category == 'all-icons') {
				var icons = this.params.allIcons;

				self.containerResultsFilter.html('');

				$.each(icons, function(value, title) {
					self.containerResultsFilter.append(
						$('<li/>', classActive).append(
							$('<a/>', {href: 'javascript:void(0)', 'class': 'icons-item', 'data-value': value, title: title})
							.append($('<i/>', {'class': 'fa ' + value})).click(function() {
								self.highlightIcon(this);
							})
						)
					);
				});
			} else {
				var icons = this.params.icons;

				$.each(icons, function(index, items) {
					if (index == category) {
						self.containerResultsFilter.html('');

						$.each(items, function(value, title) {
							self.containerResultsFilter.append(
								$('<li/>', classActive).append(
									$('<a/>', {href: 'javascript:void(0)', 'class': 'icons-item', 'data-value': value, title: title})
									.append($('<i/>', {'class': 'fa ' + value})).click(function () {
										self.highlightIcon(this);
									})
								)
							);
						});
					}
				});
			}
		},

		highlightIcon: function(e) {
			var self = this;

			$(e).parents('.sunfw-items-list').find('.active').removeClass('active');
			$(e).parent().addClass('active');

			$('.sunfw-selected-icon', self.targetField).val($(e).attr('data-value'));
		},

		selectIcon: function() {
			var self = this, icon = 'fa ' + $('.sunfw-selected-icon', self.targetField).val();

			$('input[name]', self.targetField).val(icon);
			$('.sunfw-preview-icon i', self.targetField).removeAttr('class').addClass(icon);

			if (self.modal.modal) {
				self.modal.modal('hide');
			} else {
				$('#sunFwModalIcon .close').trigger('click');
			}

			// Show button to clear selected icon.
			$('.sunfw-clear-icon', self.targetField).removeClass('hidden');
		}
	};

	$(window).load(function() {
		new SunFwIconSelector(SunFwIconSelectorConfig);
	});
})(jQuery);
