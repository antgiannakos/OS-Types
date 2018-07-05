CREATE TABLE IF NOT EXISTS `#__sunfw_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `style_id` int(11) DEFAULT NULL,
  `template` varchar(250) DEFAULT '',
  `layout_builder_data` LONGTEXT DEFAULT NULL,
  `mega_menu_data` LONGTEXT DEFAULT NULL,
  `appearance_data` LONGTEXT DEFAULT NULL,
  `system_data` LONGTEXT DEFAULT NULL,
  `cookie_law_data` LONGTEXT DEFAULT NULL,
  `social_share_data` LONGTEXT DEFAULT NULL,
  `commenting_data` LONGTEXT DEFAULT NULL,
  `custom_404_data` LONGTEXT DEFAULT NULL,
   PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;
