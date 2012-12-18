/* Database structure `master` */
DROP DATABASE IF EXISTS `master`;

CREATE DATABASE IF NOT EXISTS `master`;

/* Table structure for table `master`.`binded_menu` */
CREATE TABLE IF NOT EXISTS `master`. `binded_menu` (
  `r_id` int(10) unsigned NOT NULL,
  `r_level` smallint(5) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `id_level` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`r_id`,`id`),
  KEY `r_id` (`r_id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`binded_menu_source` */
CREATE TABLE IF NOT EXISTS `master`. `binded_menu_source` (
  `r_id` int(10) unsigned NOT NULL,
  `r_level` smallint(5) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `id_level` smallint(5) unsigned NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`brand` */
CREATE TABLE IF NOT EXISTS `master`. `brand` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_group` (`vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`brand_alias` */
CREATE TABLE IF NOT EXISTS `master`. `brand_alias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_unit` (`brand_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`catalog` */
CREATE TABLE IF NOT EXISTS `master`. `catalog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `root` int(11) unsigned NOT NULL DEFAULT '0',
  `order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `deleted` enum('Y','N') NOT NULL DEFAULT 'N',
  `type` enum('real','virt') NOT NULL DEFAULT 'real',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `root` (`root`),
  KEY `order` (`order`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Разделы каталога';

/* Table structure for table `master`.`catalog_alias` */
CREATE TABLE IF NOT EXISTS `master`. `catalog_alias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) unsigned NOT NULL,
  `name` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`catalog_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`catalog_declensions` */
CREATE TABLE IF NOT EXISTS `master`. `catalog_declensions` (
  `id` int(11) unsigned NOT NULL,
  `singular_nominative` varchar(120) NOT NULL,
  `singular_genitive` varchar(120) NOT NULL,
  `singular_dative` varchar(120) NOT NULL,
  `singular_accusative` varchar(120) NOT NULL,
  `singular_instrumentative` varchar(120) NOT NULL,
  `singular_preposition` varchar(120) NOT NULL,
  `multiple_nominative` varchar(120) NOT NULL,
  `multiple_genitive` varchar(120) NOT NULL,
  `multiple_dative` varchar(120) NOT NULL,
  `multiple_accusative` varchar(120) NOT NULL,
  `multiple_instrumentative` varchar(120) NOT NULL,
  `multiple_preposition` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`catalog_dict` */
CREATE TABLE IF NOT EXISTS `master`. `catalog_dict` (
  `catalog_id` int(10) unsigned NOT NULL,
  `dict_id` int(10) unsigned NOT NULL,
  `inherit` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`catalog_id`,`dict_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Подключаемые внешние словари';

/* Table structure for table `master`.`compare` */
CREATE TABLE IF NOT EXISTS `master`. `compare` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `supplier_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ware_id` varchar(24) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`supplier_id`,`ware_id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `master`.`config` */
CREATE TABLE IF NOT EXISTS `master`. `config` (
  `key` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Имя параметра',
  `val` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Значение параметра',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Настройки приложения';

/* Table structure for table `master`.`dict_color` */
CREATE TABLE IF NOT EXISTS `master`. `dict_color` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`dict_color_alias` */
CREATE TABLE IF NOT EXISTS `master`. `dict_color_alias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `color_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(24) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_color` (`color_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`dict_color_connect` */
CREATE TABLE IF NOT EXISTS `master`. `dict_color_connect` (
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `color_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_id`,`color_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/* Table structure for table `master`.`dict_color_group` */
CREATE TABLE IF NOT EXISTS `master`. `dict_color_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/* Table structure for table `master`.`dict_iface` */
CREATE TABLE IF NOT EXISTS `master`. `dict_iface` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(7) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`dict_iface_alias` */
CREATE TABLE IF NOT EXISTS `master`. `dict_iface_alias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `iface_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `iface_id` (`iface_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`dict_iface_group` */
CREATE TABLE IF NOT EXISTS `master`. `dict_iface_group` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`dict_list` */
CREATE TABLE IF NOT EXISTS `master`. `dict_list` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `table` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`dict_main` */
CREATE TABLE IF NOT EXISTS `master`. `dict_main` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `name_short` varchar(128) NOT NULL,
  `unit_id` int(11) unsigned NOT NULL,
  `type` enum('bool','dict','num') NOT NULL DEFAULT 'dict',
  `catalog_id` int(11) unsigned NOT NULL,
  `inherit` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `catalog_id` (`catalog_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`dict_main_alias` */
CREATE TABLE IF NOT EXISTS `master`. `dict_main_alias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`dict_main_group` */
CREATE TABLE IF NOT EXISTS `master`. `dict_main_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catalog_id` int(7) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`dict_main_range` */
CREATE TABLE IF NOT EXISTS `master`. `dict_main_range` (
  `owner_id` int(11) NOT NULL,
  `check` enum('Y','N') DEFAULT 'N',
  `min` float DEFAULT NULL,
  `med` float DEFAULT NULL,
  `max` float DEFAULT NULL,
  PRIMARY KEY (`owner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Диапазоны значений';

/* Table structure for table `master`.`dict_main_val` */
CREATE TABLE IF NOT EXISTS `master`. `dict_main_val` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_short` varchar(255) NOT NULL DEFAULT '',
  `owner_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`dict_main_val_alias` */
CREATE TABLE IF NOT EXISTS `master`. `dict_main_val_alias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `owner_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`dict_material` */
CREATE TABLE IF NOT EXISTS `master`. `dict_material` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`dict_material_alias` */
CREATE TABLE IF NOT EXISTS `master`. `dict_material_alias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `material_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `material_id` (`material_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`dict_package` */
CREATE TABLE IF NOT EXISTS `master`. `dict_package` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`dict_package_alias` */
CREATE TABLE IF NOT EXISTS `master`. `dict_package_alias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `package_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `package_id` (`package_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`dict_percent` */
CREATE TABLE IF NOT EXISTS `master`. `dict_percent` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `catalog_id` int(11) NOT NULL DEFAULT '0',
  `percent` tinyint(4) DEFAULT NULL,
  `dict` enum('v','g') COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` enum('y','n') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`catalog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/* Table structure for table `master`.`dm_connect` */
CREATE TABLE IF NOT EXISTS `master`. `dm_connect` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_list` int(11) unsigned DEFAULT NULL,
  `id_val` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_list` (`id_list`),
  KEY `id_val` (`id_val`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `master`.`dm_list` */
CREATE TABLE IF NOT EXISTS `master`. `dm_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `owner_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner_id` (`owner_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `master`.`dm_val` */
CREATE TABLE IF NOT EXISTS `master`. `dm_val` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `name_short` varchar(255) DEFAULT NULL,
  `root_id` int(11) unsigned DEFAULT '0',
  `dm_id` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dm_id` (`dm_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `master`.`dm_val2group` */
CREATE TABLE IF NOT EXISTS `master`. `dm_val2group` (
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  `val_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`val_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`dm_val_alias` */
CREATE TABLE IF NOT EXISTS `master`. `dm_val_alias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `owner_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `master`.`markup` */
CREATE TABLE IF NOT EXISTS `master`. `markup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) unsigned NOT NULL,
  `catalog_id` int(11) unsigned DEFAULT NULL,
  `vendor_id` int(11) unsigned DEFAULT NULL,
  `level` smallint(6) unsigned DEFAULT NULL,
  `vector` enum('-','+') DEFAULT NULL,
  `value` smallint(2) NOT NULL,
  `type` enum('r','o') NOT NULL,
  `act` enum('Y','N') NOT NULL,
  `method` enum('%','RUB','USD','EUR') NOT NULL,
  `scope_start` decimal(4,2) DEFAULT NULL,
  `scope_finish` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`markup_new` */
CREATE TABLE IF NOT EXISTS `master`. `markup_new` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) unsigned NOT NULL,
  `catalog_id` int(11) unsigned DEFAULT NULL,
  `vendor_id` int(11) unsigned DEFAULT NULL,
  `level` smallint(6) unsigned DEFAULT NULL,
  `vector` enum('-','+') DEFAULT NULL,
  `value` smallint(2) NOT NULL,
  `type` enum('r','o') NOT NULL,
  `act` enum('Y','N') NOT NULL,
  `method` enum('%','RUB','USD','EUR') NOT NULL,
  `scope_start` decimal(4,2) DEFAULT NULL,
  `scope_finish` decimal(4,2) DEFAULT NULL,
  `typed` enum('r','a') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`p_perm_grp` */
CREATE TABLE IF NOT EXISTS `master`. `p_perm_grp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`p_perms` */
CREATE TABLE IF NOT EXISTS `master`. `p_perms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(108) NOT NULL,
  `grp` int(11) NOT NULL,
  `descr` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`p_role2perm` */
CREATE TABLE IF NOT EXISTS `master`. `p_role2perm` (
  `role_id` int(11) NOT NULL,
  `perm_id` int(11) NOT NULL,
  UNIQUE KEY `rid` (`role_id`,`perm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`p_roles` */
CREATE TABLE IF NOT EXISTS `master`. `p_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(108) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`p_user2role` */
CREATE TABLE IF NOT EXISTS `master`. `p_user2role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  UNIQUE KEY `uid` (`user_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`regions` */
CREATE TABLE IF NOT EXISTS `master`. `regions` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251  ;

/* Table structure for table `master`.`sc_rules2level` */
CREATE TABLE IF NOT EXISTS `master`. `sc_rules2level` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` smallint(2) unsigned NOT NULL,
  `file_id` int(10) unsigned NOT NULL,
  `sheet_order` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned DEFAULT NULL,
  `parent_rule` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `supplier_file_sheet` (`supplier_id`,`file_id`,`sheet_order`),
  KEY `parent` (`parent_rule`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `master`.`sc_rules_group` */
CREATE TABLE IF NOT EXISTS `master`. `sc_rules_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group` int(10) unsigned NOT NULL,
  `rule_id` int(10) unsigned DEFAULT NULL,
  `rule_value` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group` (`group`,`rule_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`sc_rules_types` */
CREATE TABLE IF NOT EXISTS `master`. `sc_rules_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(16) NOT NULL,
  `describe` varchar(64) NOT NULL DEFAULT 'char',
  `format` enum('bool','char','num') CHARACTER SET utf8 NOT NULL,
  `name` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `master`.`store_info` */
CREATE TABLE IF NOT EXISTS `master`. `store_info` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `catalog_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vendor_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pn` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `brand_id` int(10) unsigned NOT NULL DEFAULT '0',
  `model` varchar(60) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `analog` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`),
  KEY `vendor_id` (`vendor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Основные характеристики товара';

/* Table structure for table `master`.`store_prop` */
CREATE TABLE IF NOT EXISTS `master`. `store_prop` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `dict_id` int(10) unsigned NOT NULL DEFAULT '0',
  `prop_id` int(10) unsigned NOT NULL DEFAULT '0',
  `val_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `quantity` smallint(2) unsigned NOT NULL DEFAULT '1',
  KEY `id` (`id`),
  KEY `prop_id` (`prop_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Дополнительные характеристики товара';

/* Table structure for table `master`.`supplier` */
CREATE TABLE IF NOT EXISTS `master`. `supplier` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(28) NOT NULL,
  `alias` varchar(16) NOT NULL,
  `color` enum('g','y','h') NOT NULL DEFAULT 'h',
  `active` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `master`.`supplier_address` */
CREATE TABLE IF NOT EXISTS `master`. `supplier_address` (
  `id` int(11) NOT NULL,
  `o_region` int(2) DEFAULT NULL,
  `o_city` varchar(255) DEFAULT NULL,
  `o_street` varchar(255) DEFAULT NULL,
  `o_house` varchar(10) DEFAULT NULL,
  `o_build` varchar(10) DEFAULT NULL,
  `o_office` varchar(10) DEFAULT NULL,
  `s_region` int(2) DEFAULT NULL,
  `s_city` varchar(255) DEFAULT NULL,
  `s_street` varchar(255) DEFAULT NULL,
  `s_house` varchar(10) DEFAULT NULL,
  `s_build` varchar(10) DEFAULT NULL,
  `s_office` varchar(10) DEFAULT NULL,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

/* Table structure for table `master`.`supplier_cat_virt` */
CREATE TABLE IF NOT EXISTS `master`. `supplier_cat_virt` (
  `id` int(11) unsigned NOT NULL,
  `supplier_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `root_id` int(11) unsigned NOT NULL DEFAULT '0',
  `root_name` varchar(32) NOT NULL,
  `ord` smallint(5) unsigned NOT NULL DEFAULT '0',
  `last_change` datetime NOT NULL,
  `type` enum('c','o') DEFAULT 'c',
  PRIMARY KEY (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `root_id` (`root_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 ;

/* Table structure for table `master`.`supplier_cat_virt_rules` */
CREATE TABLE IF NOT EXISTS `master`. `supplier_cat_virt_rules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) unsigned NOT NULL,
  `supplier_cat_id` int(11) DEFAULT NULL,
  `rule` varchar(32) DEFAULT NULL,
  `rule_type` enum('R','L','E') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `s_cat_id` (`supplier_cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251 ;

/* Table structure for table `master`.`supplier_catalog` */
CREATE TABLE IF NOT EXISTS `master`. `supplier_catalog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `root_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ord` smallint(5) unsigned NOT NULL DEFAULT '0',
  `act` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `exist` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `vendor_id` int(11) unsigned DEFAULT NULL,
  `to_cat` int(11) unsigned DEFAULT NULL,
  `pn_rule` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `supplier_id` int(11) unsigned NOT NULL,
  `last_change` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `master`.`supplier_detail` */
CREATE TABLE IF NOT EXISTS `master`. `supplier_detail` (
  `id` smallint(5) unsigned NOT NULL,
  `profile_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `far` smallint(5) unsigned NOT NULL DEFAULT '1',
  `location` enum('Y','N') NOT NULL DEFAULT 'Y',
  `delay` decimal(24,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_min` decimal(24,2) unsigned NOT NULL DEFAULT '0.00',
  `delivery_min` decimal(24,2) unsigned NOT NULL DEFAULT '0.00',
  `b2b` enum('Y','N') NOT NULL DEFAULT 'Y',
  `distrib` enum('Y','N') NOT NULL DEFAULT 'Y',
  `return` enum('Y','N') NOT NULL DEFAULT 'Y',
  `discount` decimal(4,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(24,2) unsigned NOT NULL DEFAULT '0.00',
  `address` varchar(255) NOT NULL DEFAULT '',
  `map` varchar(128) NOT NULL DEFAULT '',
  `officer` varchar(128) NOT NULL DEFAULT '',
  `phone` varchar(64) NOT NULL DEFAULT '',
  `site` varchar(255) NOT NULL DEFAULT '',
  `conv_perc` decimal(4,2) unsigned NOT NULL DEFAULT '0.00',
  `cur_usd` decimal(4,2) DEFAULT NULL,
  `b2bname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

/* Table structure for table `master`.`supplier_markup` */
CREATE TABLE IF NOT EXISTS `master`. `supplier_markup` (
  `id` int(11) unsigned NOT NULL,
  `action` enum('Y','N') DEFAULT 'N',
  `markup` float(4,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `master`.`supplier_profile` */
CREATE TABLE IF NOT EXISTS `master`. `supplier_profile` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(2555) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;

/* Table structure for table `master`.`supplier_site` */
CREATE TABLE IF NOT EXISTS `master`. `supplier_site` (
  `supplier_id` int(11) unsigned NOT NULL,
  `site_id` int(11) unsigned NOT NULL,
  UNIQUE KEY `supplier_id` (`supplier_id`,`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`supplier_weight` */
CREATE TABLE IF NOT EXISTS `master`. `supplier_weight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keys` varchar(255) NOT NULL,
  `val` tinyint(2) NOT NULL DEFAULT '0',
  `nameField` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

/* Table structure for table `master`.`u_user` */
CREATE TABLE IF NOT EXISTS `master`. `u_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT 'anyous',
  `password` varchar(255) DEFAULT NULL,
  `database` varchar(255) NOT NULL DEFAULT 'user',
  `name` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `last_change` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`unique_coincidence` */
CREATE TABLE IF NOT EXISTS `master`. `unique_coincidence` (
  `catalog_id` int(11) unsigned NOT NULL,
  `pn` enum('e','p') DEFAULT NULL,
  `model` enum('e','p') DEFAULT NULL,
  `brand` enum('e','p') DEFAULT NULL,
  PRIMARY KEY (`catalog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`unique_name` */
CREATE TABLE IF NOT EXISTS `master`. `unique_name` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`unique_rule` */
CREATE TABLE IF NOT EXISTS `master`. `unique_rule` (
  `catalog_id` int(11) unsigned NOT NULL DEFAULT '0',
  `prop_id` int(11) unsigned NOT NULL DEFAULT '0',
  `check_name` enum('y','n') NOT NULL DEFAULT 'n',
  `sep` varchar(16) DEFAULT NULL,
  `check_value` enum('y','n') NOT NULL DEFAULT 'n',
  `sep1` varchar(16) DEFAULT NULL,
  `ord` int(11) unsigned NOT NULL DEFAULT '0',
  `unit_id` int(11) unsigned DEFAULT NULL,
  `unit_alias_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`catalog_id`,`prop_id`,`ord`),
  KEY `unit_id` (`unit_id`),
  KEY `unit_alias_id` (`unit_alias_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `master`.`unique_rule_spec` */
CREATE TABLE IF NOT EXISTS `master`. `unique_rule_spec` (
  `prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand` enum('y','n') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `brand_sep` char(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_ord` int(11) unsigned NOT NULL DEFAULT '0',
  `vendor` enum('y','n') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `vendor_sep` char(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendor_ord` int(11) unsigned NOT NULL DEFAULT '0',
  `model` enum('y','n') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `model_sep` char(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_ord` int(11) unsigned NOT NULL DEFAULT '0',
  `pn` enum('y','n') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `pn_sep` char(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pn_ord` int(11) unsigned NOT NULL DEFAULT '0',
  `analog` enum('y','n') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `analog_sep` char(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `analog_ord` int(11) unsigned NOT NULL DEFAULT '0',
  `catalog_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ord` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`catalog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`unit` */
CREATE TABLE IF NOT EXISTS `master`. `unit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `weight` bigint(12) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_group` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`unit_alias` */
CREATE TABLE IF NOT EXISTS `master`. `unit_alias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_unit` (`unit_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`unit_group` */
CREATE TABLE IF NOT EXISTS `master`. `unit_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`user_supplier` */
CREATE TABLE IF NOT EXISTS `master`. `user_supplier` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `supplier_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`vendor` */
CREATE TABLE IF NOT EXISTS `master`. `vendor` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(64) DEFAULT NULL,
  `apit_url` varchar(255) DEFAULT NULL,
  `img` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251 ;

/* Table structure for table `master`.`vendor_alias` */
CREATE TABLE IF NOT EXISTS `master`. `vendor_alias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`name`),
  KEY `ven_id` (`vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`vendor_new` */
CREATE TABLE IF NOT EXISTS `master`. `vendor_new` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `site` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`ware_dam_info` */
CREATE TABLE IF NOT EXISTS `master`. `ware_dam_info` (
  `supplier_id` smallint(2) unsigned NOT NULL DEFAULT '0',
  `ware_id` varchar(24) NOT NULL DEFAULT '',
  `ware_name` varchar(255) NOT NULL,
  `catalog_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vendor_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pn` varchar(60) NOT NULL DEFAULT '',
  `brand_id` int(10) unsigned NOT NULL DEFAULT '0',
  `model` varchar(60) NOT NULL DEFAULT '',
  `analog` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ware_id`,`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Основные характеристики не добавленных товаров';

/* Table structure for table `master`.`ware_dam_prop` */
CREATE TABLE IF NOT EXISTS `master`. `ware_dam_prop` (
  `supplier_id` smallint(2) unsigned NOT NULL DEFAULT '0',
  `ware_id` varchar(24) NOT NULL DEFAULT '',
  `order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `dict_id` int(10) unsigned NOT NULL DEFAULT '0',
  `prop_id` int(10) unsigned NOT NULL DEFAULT '0',
  `val_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `quantity` smallint(2) unsigned NOT NULL DEFAULT '1',
  `found` enum('Y','C','P','N') NOT NULL DEFAULT 'N' COMMENT 'Yes/for Check/Probably/No',
  PRIMARY KEY (`ware_id`,`supplier_id`,`order`),
  KEY `ware_id` (`ware_id`),
  KEY `supplier_id` (`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Дополнительные характеристики не добавленных товара';

/* Table structure for table `master`.`ware_info` */
CREATE TABLE IF NOT EXISTS `master`. `ware_info` (
  `supplier_id` smallint(2) unsigned NOT NULL DEFAULT '0',
  `ware_id` varchar(24) NOT NULL DEFAULT '',
  `catalog_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vendor_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pn` varchar(60) NOT NULL DEFAULT '',
  `brand_id` int(10) unsigned NOT NULL DEFAULT '0',
  `model` varchar(60) NOT NULL DEFAULT '',
  `analog` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ware_id`,`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Основные характеристики товара';

/* Table structure for table `master`.`ware_prefix` */
CREATE TABLE IF NOT EXISTS `master`. `ware_prefix` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) unsigned NOT NULL,
  `supplier_catalog_id` int(11) unsigned NOT NULL,
  `search` varchar(255) DEFAULT NULL,
  `notsearch` varchar(255) DEFAULT NULL,
  `catalog_id` int(11) unsigned DEFAULT NULL,
  `delete` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `s_id` (`supplier_id`,`supplier_catalog_id`,`search`(64))
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `master`.`ware_prop` */
CREATE TABLE IF NOT EXISTS `master`. `ware_prop` (
  `supplier_id` smallint(2) unsigned NOT NULL DEFAULT '0',
  `ware_id` varchar(24) NOT NULL DEFAULT '',
  `dict_id` int(10) unsigned NOT NULL DEFAULT '0',
  `prop_id` int(10) unsigned NOT NULL DEFAULT '0',
  `val_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `quantity` smallint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`ware_id`,`supplier_id`,`dict_id`,`prop_id`,`val_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Дополнительные характеристики товара';

/* Table structure for table `master`.`ware_rule` */
CREATE TABLE IF NOT EXISTS `master`. `ware_rule` (
  `supplier_catalog_id` int(11) unsigned NOT NULL,
  `catalog_id` int(11) unsigned NOT NULL,
  `rule` text NOT NULL,
  UNIQUE KEY `cat_id` (`supplier_catalog_id`,`catalog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Правила разбора для типа товара в категории поставщика';

/* Table structure for table `master`.`wares` */
CREATE TABLE IF NOT EXISTS `master`. `wares` (
  `id` varchar(24) NOT NULL DEFAULT '',
  `p_id` smallint(2) unsigned NOT NULL DEFAULT '0',
  `our_id` int(10) unsigned DEFAULT '0',
  `vendor_code` varchar(60) DEFAULT '',
  `ware` varchar(255) DEFAULT '',
  `rozn` decimal(10,2) DEFAULT NULL,
  `opt` decimal(10,2) DEFAULT NULL,
  `zak` decimal(10,2) DEFAULT NULL,
  `av` varchar(16) DEFAULT NULL,
  `transit` varchar(48) DEFAULT NULL,
  `currency` enum('u','r','e') NOT NULL DEFAULT 'u',
  `cat_id` int(10) unsigned DEFAULT NULL,
  `ven_id` int(10) unsigned DEFAULT NULL,
  `warranty` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `volume` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`p_id`),
  UNIQUE KEY `primary_2` (`p_id`,`id`),
  KEY `vendor_code` (`vendor_code`),
  KEY `our_id` (`our_id`)
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

/* Table structure for table `master`.`ya` */
CREATE TABLE IF NOT EXISTS `master`. `ya` (
  `id` int(10) unsigned NOT NULL,
  `ya_max` int(8) unsigned DEFAULT NULL,
  `ya_avg` int(7) unsigned DEFAULT NULL,
  `ya_med` int(7) unsigned DEFAULT NULL,
  `ya_min` int(7) unsigned DEFAULT NULL,
  `ya_arr` varchar(255) DEFAULT NULL,
  `dt` date NOT NULL,
  `catalog_id` int(10) unsigned NOT NULL,
  `top10` bit(1) NOT NULL DEFAULT b'1',
  `type` enum('L','C') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `master`.`ya_markup` */
CREATE TABLE IF NOT EXISTS `master`. `ya_markup` (
  `id` int(10) unsigned NOT NULL,
  `value` decimal(4,2) DEFAULT NULL,
  `type` enum('EUR','RUR','USD','PROC') CHARACTER SET utf8 NOT NULL DEFAULT 'PROC',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Create structure for procedure `master`.`delete_double_vendors` */
CREATE PROCEDURE `delete_double_vendors`()
    SQL SECURITY INVOKER
BEGIN
	DECLARE v_id,done INT DEFAULT 0;
	DECLARE v_name VARCHAR(32);
	DECLARE rCur CURSOR FOR SELECT MIN(id) as id_min,name FROM master.vendor GROUP BY name HAVING COUNT(id) > 1;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	OPEN rCur;
	WHILE done = 0 DO
		FETCH rCur INTO v_id,v_name;
		UPDATE apitcomp.store s SET s.vendor_id = v_id WHERE  s.vendor_id IN (SELECT v.id FROM master.vendor v WHERE v.name = v_name);
		DELETE FROM master.vendor WHERE name =  v_name AND id <> v_id;
	END WHILE;
	CLOSE rCur;
END;

/* Create structure for procedure `master`.`fix_old_props` */
CREATE PROCEDURE `fix_old_props`(IN `_from` INT, IN `_to` INT)
    SQL SECURITY INVOKER
BEGIN
CREATE TEMPORARY TABLE _t1 SELECT supplier_id,ware_id  FROM `ware_prop` WHERE `dict_id` = 0 AND `prop_id` = _from;
CREATE TEMPORARY TABLE _t2 SELECT supplier_id,ware_id  FROM `ware_prop` WHERE `dict_id` = 0 AND `prop_id` = _to;
DELETE p FROM `ware_prop` p 
INNER JOIN ( 
SELECT *,_from as prop_id 
FROM _t1
INNER JOIN _t2 USING(supplier_id,ware_id)
) a USING(supplier_id,ware_id,prop_id);
END;

/* Create structure for procedure `master`.`fix_val_id` */
CREATE PROCEDURE `fix_val_id`(IN `_q` VARCHAR(16), IN `_from` INT, IN `_to` INT)
    SQL SECURITY INVOKER
BEGIN
	DECLARE _v_id,done,_to_cat INT DEFAULT 0;
	DECLARE r1 CURSOR FOR 
        	SELECT DISTINCT `val_id`
                FROM `ware_prop` 
                WHERE `dict_id` = 0 AND `prop_id` = _to AND `value` LIKE CONCAT('%',_q,'%');
	DECLARE r0 CURSOR FOR 
        	SELECT IFNULL(a.`owner_id`,v.`id`) as id 
                FROM `dict_main_val` v 
                INNER JOIN `dict_main_val_alias` a ON v.`id` = a.`owner_id` 
                WHERE (v.`owner_id` = _to AND (v.`name` LIKE CONCAT('%',_q,'%') OR v.`name_short` LIKE CONCAT('%',_q,'%')))
                OR a.`name` LIKE CONCAT('%',_q,'%');
	DECLARE r2 CURSOR FOR 
        	SELECT DISTINCT `val_id`
                FROM `ware_prop` 
                WHERE `dict_id` = 0 AND `prop_id` = _from AND `value` LIKE CONCAT('%',_q,'%');
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	
	
	

	
	OPEN r0;
		FETCH r0 INTO _to_cat;
	CLOSE r0;
	
	
        IF _to_cat > 0 THEN
	OPEN r2;
	WHILE done = 0 DO
		FETCH r2 INTO _v_id;
		UPDATE `ware_prop` SET `prop_id` = _to,`val_id` = _to_cat WHERE `prop_id` = _from AND `val_id` = _v_id;
	END WHILE;
	CLOSE r2;
        END IF;
END;

/* Create structure for procedure `master`.`menu_rebild` */
CREATE PROCEDURE `menu_rebild`(root_in int, level_in int)
    SQL SECURITY INVOKER
BEGIN
	DECLARE rt,lvl,lvlplus,f_id,done INT DEFAULT 0;
	DECLARE rCur CURSOR FOR SELECT `id` FROM `catalog` WHERE `root` = rt;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	SET rt = root_in;
	SET lvl = level_in;
	SET lvlplus = lvl+1;

	OPEN rCur;
	WHILE done = 0 DO
		FETCH rCur INTO f_id;
		IF rt = 0 THEN
			CALL menu_rebild(f_id,lvlplus);
		ELSE
			IF f_id > 0 THEN
				INSERT INTO binded_menu_source SET `r_id` = rt,`r_level` = lvl,id = f_id,id_level = lvlplus;
				INSERT INTO binded_menu_source SELECT r_id,r_level,f_id,lvlplus FROM binded_menu_source WHERE `id` = rt;
				CALL menu_rebild(f_id,lvlplus);
			END IF;
		END IF;
	END WHILE;
	CLOSE rCur;
END;

/* Create structure for procedure `master`.`rebuild_menu_tree` */
CREATE PROCEDURE `rebuild_menu_tree`()
    SQL SECURITY INVOKER
BEGIN
	SET max_sp_recursion_depth = 10;	
	CALL menu_rebild(0,0);
	DELETE FROM binded_menu;
	INSERT INTO binded_menu SELECT DISTINCT * FROM binded_menu_source;
	DELETE FROM binded_menu_source;
END;

/* Create structure for function `master`.`likelihood` */
CREATE FUNCTION `likelihood`(s_id int, w_id int) RETURNS double(10,8)
    DETERMINISTIC
BEGIN
	DECLARE m1,m2,e1,e2 DOUBLE(10,8) DEFAULT 1.0;
	DECLARE done INT DEFAULT 0;
	DECLARE rCur CURSOR FOR SELECT r.est1, r.est2 FROM master.ware_prop p INNER JOIN master.t_res r ON r.val = CONCAT(p.dict_id,"**", p.prop_id,"**",IF(p.val_id > 0,p.val_id,p.value)) WHERE p.supplier_id = s_id AND p.ware_id = w_id;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	OPEN rCur;
	WHILE done = 0 DO
		FETCH rCur INTO e1,e2;
		SET m1 = m1 * e1 * 10;
		SET m2 = m2 * e2 * 10;
	END WHILE;
	CLOSE rCur;
	RETURN m1;
END;

/* Create structure for trigger rebuild_menu1 */
CREATE TRIGGER rebuild_menu1 AFTER INSERT ON catalog FOR EACH ROW CALL rebuild_menu_tree();

/* Create structure for trigger rebuild_menu3 */
CREATE TRIGGER rebuild_menu3 AFTER DELETE ON catalog FOR EACH ROW CALL rebuild_menu_tree();

