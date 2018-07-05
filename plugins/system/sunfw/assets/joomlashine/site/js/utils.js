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

var SunFwUtils = {
	/**
	 * Encode double quote character to comply with Opera browser
	 * Add more rules here if needed
	 */
	encodeCookie: function(value) {
		return value.replace(/\"/g, '%22');
	},

	/**
	 * Decode double quote character back to normal
	 */
	decodeCookie: function(value) {
		return value.replace(/\%22/g, '"');
	},

	writeCookie: function (name,value,days){
		value = SunFwUtils.encodeCookie(value);

		if (days) {
			var date = new Date();
			date.setTime(date.getTime()+(days*24*60*60*1000));
			var expires = "; expires="+date.toGMTString();
		} else expires = "";

		document.cookie = name+"="+value+expires+"; path=/";
	},

	readCookie: function (name){
		var nameEQ = name + "=";
		var ca = document.cookie.split(';');
		for(var i=0;i < ca.length;i++) {
			var c = ca[i];
			while (c.charAt(0)==' ') c = c.substring(1,c.length);
			if (c.indexOf(nameEQ) == 0) return SunFwUtils.decodeCookie(c.substring(nameEQ.length,c.length));
		}
		return null;
	},

	/* Change template setting stored in cookie */
	setTemplateAttribute: function(templatePrefix, attribute, value) {
		var templateParams = JSON.parse(SunFwUtils.readCookie(templatePrefix + 'params')) || {};

		templateParams[attribute] = value;

		SunFwUtils.writeCookie(templatePrefix + 'params', JSON.stringify(templateParams));

		window.location.reload(true);
	},

	/* ============================== DOM - GUI ============================== */
	/* ============================== DOM - GUI - MENU ============================== */

	/**
	 * Reposition submenu if it goes off screen area.
	 */
	setSubmenuPosition: function(enableRTL,$) {
		// Skip repositioning submenu if mobile menu is active
		var toggle = $('.sunfw-menu-head .navbar-header .navbar-toggle');
		if (toggle && toggle.css('display') != 'none') {
			return;
		}

		// Initialize parameters
		var maxSize, parents, enableRTL = enableRTL || false;

		// Get all parents
		parents = $('ul.sunfw-tpl-menu > li.parent');
		if (!parents.length) return;

		// Add level to all submenus
		parents.each(function(i, parent) {
			var submenu = $(this).children('ul'), level = 0;
			while (submenu.length) {
				var tmp = [];

				// Increase submenu level
				level++;

				// Add class to indicate submenu level
				$(submenu).each(function(ul) {
					$(this).addClass('sunfw-submenu-level-' + level);

					// Get nested submenus
					$(this).find('> li.parent > ul').each(function(nested) {
						tmp.push($(this));
					});
				});

				// Set nested submenus
				submenu = tmp;
			}

			// Store max level of submenu
			parent.sunfwMaxSubmenuLevel = level;
		});

		// Declare some utilities
		var placeSubmenu = function(parent, flipBack) {
				var	width = 0, submenu = $(parent).find('ul.sunfw-submenu-level-' + parent.sunfwMaxSubmenuLevel),
					flipBack = flipBack || false, farLeft;
				// Calculate submenu's far-left offset
				submenu = submenu.get(0);
				if ((enableRTL && !flipBack) || (!enableRTL && flipBack)) {
					farLeft = $(parent).position().left + $(parent).width();
					// Calculate far-left position when all nested submenus are expanded
					while (!$(submenu).hasClass('sunfw-tpl-menu')) {
						farLeft -= $(submenu).width();
						// Travel back the DOM tree
						submenu = $(submenu).parent().parent();
					}
				} else if ((!enableRTL && !flipBack) || (enableRTL && flipBack)) {
					farLeft = $(parent).offset().left;
					// Calculate total width when all nested submenus are expanded
					while (!$(submenu).hasClass('sunfw-tpl-menu')) {
						width += $(submenu).width();

						// Travel back the DOM tree
						submenu = $(submenu).parent().parent();
					}
				}
				// Check if there is any submenu goes off screen when all nested submenus are expanded
				if (
					(((enableRTL && !flipBack) || (!enableRTL && flipBack)) && farLeft < 0)
					||
					(((!enableRTL && !flipBack) || (enableRTL && flipBack)) && farLeft + width > maxSize)
				) {
					if (!flipBack) {
						$(parent).addClass('sunfw-submenu-flipback');

						// Check if there is any submenu goes off screen in the opposite side after flipping back
						placeSubmenu(parent, true);
					} else {
						// $(parent).removeClass('sunfw-submenu-flipback');
					}
				}
			},

			resizeHandler = function() {
				// Disable left-right scrolling
				$('body').css('overflow-x', 'hidden');

				// Update max screen area
				maxSize = $(window).width();

				// Place all submenus
				parents.each(function(i,parent) {
					var submenus = $(this).find('ul');
					// Restore original position for all submenu
					$(this).removeClass('sunfw-submenu-flipback');

					// Make sure all submenus is visible
					$(submenus).css('display', 'block');

					// Place nested submenus
					placeSubmenu(parent);

					// Restore default visibility state for submenu
					$(submenus).css('display', '');
				});

				// Restore original left-right scrolling
				$('body').css('overflow-x', '');
			};

		// Handle window resize event
		$(window).on('resize', function() {
			placeSubmenu.timer && clearTimeout(placeSubmenu.timer);
			placeSubmenu.timer = setTimeout(resizeHandler, 500);
		});

		// Place all submenus
		resizeHandler();
	},
};
