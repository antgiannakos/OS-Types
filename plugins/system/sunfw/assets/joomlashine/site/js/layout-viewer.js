/**
 * @version    $Id$
 * @package    SUN Framework
 * @subpackage Layout Builder
 * @author     JoomlaShine Team <support@joomlashine.com>
 * @copyright  Copyright (C) 2012 JoomlaShine.com. All Rights Reserved.
 * @license    GNU/GPL v2 or later http://www.gnu.org/licenses/gpl-2.0.html
 *
 * Websites: http://www.joomlashine.com
 * Technical Support:  Feedback - http://www.joomlashine.com/contact-us/get-support.html
 */

window.addEventListener('load', function() {
	// Generate the outer container.
	var outer = document.createElement('div');

	outer.id = 'layout-viewer';

	document.body.appendChild(outer);

	// Generate the inner container.
	var inner = document.createElement('div');

	inner.className = 'inner';

	outer.appendChild(inner);

	// Generate the button to toggle layout viewer.
	var btn = document.createElement('span');

	btn.className = 'show-hints';
	btn.textContent = sunfw.layout_viewer['show-layout'];

	inner.appendChild(btn);

	// Add event to toggle layout viewer.
	outer.addEventListener('click', function(event) {
		event.preventDefault();

		// Toggle button state.
		if (btn.classList.contains('show-hints')) {
			btn.classList.add('hide-hints');
			btn.classList.remove('show-hints');

			btn.textContent = sunfw.layout_viewer['hide-layout'];

			document.body.classList.add('show-layout-hints');
		} else {
			btn.classList.add('show-hints');
			btn.classList.remove('hide-hints');

			btn.textContent = sunfw.layout_viewer['show-layout'];

			document.body.classList.remove('show-layout-hints');
		}

		// Get all layout elements.
		var elements = document.querySelectorAll('[layout-element]'), ids = [];

		for (var i = 0, n = elements.length; i < n; i++) {
			var text = elements[i].getAttribute('layout-element-type') + ': ' + elements[i].getAttribute('layout-element-name'),
				id = 'layout-element-' + elements[i].getAttribute('layout-element') + '_' + text.replace(/[^a-zA-Z0-9\-_]+/g, ''),
				layer = document.getElementById(id);

			if (ids.indexOf('id') > -1) {
				id += '-' + ids.length;
				layer = document.getElementById(id);
			}

			if ( ! document.body.classList.contains('show-layout-hints') ) {
				if (layer) {
					document.body.removeChild(layer);
				}
			} else {
				// Create outline.
				layer = document.createElement('div');

				layer.id = id;
				layer.className = 'layout-element-outline';

				document.body.appendChild(layer);

				// Create label wrapper.
				var label = document.createElement('div');

				label.className = 'layout-element-label';

				layer.appendChild(label);

				// Create label type.
				var type = document.createElement('span');

				type.className = 'layout-element-type';
				type.textContent = elements[i].getAttribute('layout-element-type');

				label.appendChild(type);

				// Create label name.
				var name = document.createElement('span');

				name.className = 'layout-element-name';
				name.textContent = elements[i].getAttribute('layout-element-name');

				label.appendChild(name);

				// Position outline.
				var elementRect = elements[i].getBoundingClientRect();

				layer.style.position = 'absolute';

				layer.style.top = ((document.body.scrollTop || document.documentElement.scrollTop) + elementRect.top) + 'px';
				layer.style.left = ((document.body.scrollLeft || document.documentElement.scrollLeft) + elementRect.left) + 'px';

				layer.style.width = elementRect.width + 'px';
				layer.style.height = elementRect.height + 'px';

				// Setup 'mouseover' and 'mouseout' event handlers for section outline.
				if (elements[i].getAttribute('layout-element') == 'section' && ! elements[i].sunfw_layout_viewer_initialized) {
					elements[i].addEventListener('mouseover', function() {
						// Show item outline.
						var elements = this.querySelectorAll('[layout-element]');

						for (var i = 0, n = elements.length; i < n; i++) {
							var text = elements[i].getAttribute('layout-element-type') + ': ' + elements[i].getAttribute('layout-element-name'),
								id = 'layout-element-' + elements[i].getAttribute('layout-element') + '_' + text.replace(/[^a-zA-Z0-9\-_]+/g, ''),
								layer = document.getElementById(id);

							if (ids.indexOf('id') > -1) {
								id += '-' + ids.length;
								layer = document.getElementById(id);
							}

							if (layer) {
								layer.style.display = 'block';
							}
						}
					});

					elements[i].addEventListener('mouseout', function() {
						// Hide item outline.
						var elements = this.querySelectorAll('[layout-element]');

						for (var i = 0, n = elements.length; i < n; i++) {
							var text = elements[i].getAttribute('layout-element-type') + ': ' + elements[i].getAttribute('layout-element-name'),
								id = 'layout-element-' + elements[i].getAttribute('layout-element') + '_' + text.replace(/[^a-zA-Z0-9\-_]+/g, ''),
								layer = document.getElementById(id);

							if (ids.indexOf('id') > -1) {
								id += '-' + ids.length;
								layer = document.getElementById(id);
							}

							if (layer) {
								layer.style.display = 'none';
							}
						}
					});

					elements[i].sunfw_layout_viewer_initialized = true;
				}
			}

			ids.push(id);
		}
	});

	if (window.location.href.indexOf('&showhint=1') > -1) {
		outer.click();
	}
});