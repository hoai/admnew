/* Database structure `apitcomp` */
DROP DATABASE IF EXISTS `apitcomp`;

CREATE DATABASE IF NOT EXISTS `apitcomp`;

/* Table structure for table `apitcomp`.`8march_promo` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `8march_promo` (
  `email` varchar(250) NOT NULL,
  `promo` varchar(10) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`_complect` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `_complect` (
  `id` int(11) NOT NULL,
  `w_id` int(11) NOT NULL,
  `qw` tinyint(4) NOT NULL,
  `act` enum('Y','N') NOT NULL,
  PRIMARY KEY (`id`,`w_id`),
  KEY `act` (`act`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`_complect_stat` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `_complect_stat` (
  `id` int(10) unsigned NOT NULL,
  `markup` int(11) unsigned NOT NULL DEFAULT '15',
  `act` enum('Y','N') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `act` (`act`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`_prices` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `_prices` (
  `id` int(6) NOT NULL,
  `seller` int(3) NOT NULL,
  `rozn` decimal(8,2) NOT NULL,
  `opt` decimal(8,2) NOT NULL,
  `av` int(2) NOT NULL,
  `w_id` varchar(24) DEFAULT NULL,
  KEY `av` (`av`),
  KEY `id` (`id`),
  KEY `seller` (`seller`),
  KEY `rozn` (`rozn`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`_zakupka` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `_zakupka` (
  `id` int(6) unsigned NOT NULL,
  `nix` decimal(8,2) DEFAULT NULL,
  `lanit` decimal(8,2) DEFAULT NULL,
  `truesystem` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251  ;

/* Table structure for table `apitcomp`.`accessory` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `accessory` (
  `catalog_id` int(6) unsigned NOT NULL,
  `accessory_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`catalog_id`,`accessory_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`action` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `action` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET cp1251 DEFAULT NULL,
  `field` varchar(10) CHARACTER SET cp1251 DEFAULT NULL COMMENT 'Где отображать картинку (price=на цене, img=на картинке)',
  `img` varchar(16) CHARACTER SET cp1251 DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `toMain` bit(1) NOT NULL,
  `brf` text CHARACTER SET cp1251,
  `to_site` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `perc` smallint(2) DEFAULT NULL,
  `activepopup` enum('1','0') NOT NULL DEFAULT '0',
  `popup` text CHARACTER SET cp1251,
  `order` int(11) NOT NULL DEFAULT '0',
  KEY `ind` (`id`),
  KEY `field` (`field`),
  KEY `to_site` (`to_site`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`action_bak` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `action_bak` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET cp1251 DEFAULT NULL,
  `field` varchar(10) CHARACTER SET cp1251 DEFAULT NULL COMMENT 'Где отображать картинку (price=на цене, img=на картинке)',
  `img` varchar(16) CHARACTER SET cp1251 DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `brf` text CHARACTER SET cp1251,
  `to_site` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `ind` (`id`),
  KEY `field` (`field`),
  KEY `to_site` (`to_site`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`action_speID` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `action_speID` (
  `action_id` int(11) NOT NULL DEFAULT '0',
  `ProductID` int(11) DEFAULT NULL,
  `toSpec` enum('Y','N') NOT NULL DEFAULT 'N',
  UNIQUE KEY `action` (`action_id`,`ProductID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`action_themes` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `action_themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `themes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `active` enum('Y','N') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`admitad` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `admitad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`admitad_cat` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `admitad_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admitadId` int(11) NOT NULL,
  `catId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`adress` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `adress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `region` int(3) DEFAULT NULL,
  `city` varchar(48) DEFAULT NULL,
  `street` varchar(128) DEFAULT NULL,
  `location` varchar(128) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `metro` char(24) DEFAULT NULL,
  `flat` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`assist` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `assist` (
  `ord_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sum` int(11) NOT NULL,
  UNIQUE KEY `ord_id` (`ord_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`banner2place` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `banner2place` (
  `bid` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  UNIQUE KEY `bid` (`bid`,`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`banner_places` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `banner_places` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `placement` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `placement` (`placement`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`banners` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `banners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `url` varchar(400) NOT NULL,
  `active` smallint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resource` (`resource`),
  KEY `url` (`url`(333)),
  KEY `active` (`active`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`basket` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `basket` (
  `invoice_id` bigint(20) NOT NULL,
  `payment_method` char(3) NOT NULL,
  `exchange_rate` double NOT NULL,
  UNIQUE KEY `invoice_id` (`invoice_id`),
  KEY `payment_method` (`payment_method`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`basket_ware` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `basket_ware` (
  `invoice_id` bigint(20) NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  KEY `invoice_id` (`invoice_id`),
  KEY `store_id` (`store_id`),
  KEY `quantity` (`quantity`),
  KEY `price` (`price`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`binded_menu` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `binded_menu` (
  `r_id` int(10) unsigned NOT NULL,
  `r_level` smallint(5) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `id_level` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`r_id`,`id`),
  KEY `r_id` (`r_id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`binded_menu_source` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `binded_menu_source` (
  `r_id` int(10) unsigned NOT NULL,
  `r_level` smallint(5) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `id_level` smallint(5) unsigned NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`branded_category` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `branded_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`bug_track` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `bug_track` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `ticket` int(11) DEFAULT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`buy_with_extra` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `buy_with_extra` (
  `extra_id` int(11) NOT NULL,
  `group` int(5) NOT NULL,
  UNIQUE KEY `extra_id` (`extra_id`,`group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`buy_with_main` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `buy_with_main` (
  `main_id` int(11) NOT NULL,
  `group` int(5) NOT NULL,
  PRIMARY KEY (`main_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`card_info` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `card_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prefix` char(1) NOT NULL,
  `frm` varchar(4) NOT NULL,
  `psw` varchar(6) NOT NULL,
  `stat` enum('A','B','D','F','W') NOT NULL DEFAULT 'F',
  `dt` datetime NOT NULL,
  `usr` int(11) NOT NULL DEFAULT '0',
  `nxt` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `usr` (`usr`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`card_info_dst` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `card_info_dst` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prefix` char(1) NOT NULL,
  `frm` varchar(4) NOT NULL,
  `psw` varchar(6) NOT NULL,
  `stat` enum('A','B','D','F','W') NOT NULL DEFAULT 'F',
  `dt` datetime NOT NULL,
  `usr` int(11) NOT NULL DEFAULT '0',
  `nxt` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`cartrige_compare` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `cartrige_compare` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `p_id` smallint(2) unsigned NOT NULL DEFAULT '0',
  `w_id` varchar(24) NOT NULL DEFAULT '',
  PRIMARY KEY (`w_id`,`p_id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`cartrige_store` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `cartrige_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catalog_id` int(6) unsigned NOT NULL DEFAULT '0',
  `vendor_id` int(6) unsigned NOT NULL DEFAULT '530',
  `vendor_code` varchar(60) DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `img` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `cur_price` decimal(8,2) DEFAULT NULL,
  `last_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `opt_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `change_price` date NOT NULL DEFAULT '0000-00-00',
  `new` enum('Y','N') NOT NULL DEFAULT 'N',
  `on_sale` enum('Y','N') NOT NULL DEFAULT 'N',
  `stock` enum('Y','N') NOT NULL DEFAULT 'N',
  `type` char(3) NOT NULL DEFAULT 'D',
  `status` enum('A','B','C','D') CHARACTER SET utf8 NOT NULL DEFAULT 'D',
  `currency` enum('u','r','e') NOT NULL DEFAULT 'u',
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`,`vendor_id`),
  KEY `vendor_code` (`vendor_code`),
  KEY `vendor_id` (`vendor_id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`cartrige_store_items` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `cartrige_store_items` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `img` varchar(255) DEFAULT NULL,
  `about` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 ;

/* Table structure for table `apitcomp`.`cat_title` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `cat_title` (
  `cat_id` int(11) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`catalog_product_notify` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `catalog_product_notify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`category_morphy` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `category_morphy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `morphy_r` varchar(255) DEFAULT NULL,
  `morphy_v` varchar(255) DEFAULT NULL,
  `morphy_rs` varchar(255) DEFAULT NULL,
  `morphy_vs` varchar(255) DEFAULT NULL,
  `morphy_s` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`certificates` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `certificates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cert_type` enum('1','2','3') CHARACTER SET cp1251 NOT NULL DEFAULT '1',
  `vendor_id` int(11) DEFAULT NULL COMMENT 'certs by vendor for future use',
  `certificate` varchar(50) CHARACTER SET cp1251 NOT NULL,
  `image` varchar(100) CHARACTER SET cp1251 DEFAULT NULL,
  `description` varchar(200) CHARACTER SET cp1251 NOT NULL,
  `laureat` varchar(100) CHARACTER SET cp1251 DEFAULT NULL,
  `previous_year` int(4) DEFAULT NULL,
  `last_year` int(4) NOT NULL,
  `ordre` int(4) DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `cert_type` (`cert_type`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`certificates_tools` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `certificates_tools` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cert_type` enum('1','2','3') CHARACTER SET cp1251 NOT NULL DEFAULT '1',
  `vendor_id` int(11) DEFAULT NULL COMMENT 'certs by vendor for future use',
  `certificate` varchar(50) CHARACTER SET cp1251 NOT NULL,
  `image` varchar(100) CHARACTER SET cp1251 DEFAULT NULL,
  `description` varchar(200) CHARACTER SET cp1251 NOT NULL,
  `laureat` varchar(100) CHARACTER SET cp1251 DEFAULT NULL,
  `previous_year` int(4) DEFAULT NULL,
  `last_year` int(4) NOT NULL,
  `ordre` int(4) DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `cert_type` (`cert_type`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`combine_price` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `combine_price` (
  `id` int(11) NOT NULL,
  `item` int(11) NOT NULL,
  `inc_id` int(11) NOT NULL,
  `cnt` int(11) NOT NULL,
  `ord` int(11) NOT NULL,
  UNIQUE KEY `id` (`id`,`inc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`company` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `company` (
  `id` int(11) NOT NULL,
  `ur_adress` varchar(255) DEFAULT NULL,
  `inn` char(12) DEFAULT NULL,
  `kpp` char(10) DEFAULT NULL,
  `ks` char(21) DEFAULT NULL,
  `rs` char(21) DEFAULT NULL,
  `bik` char(9) DEFAULT NULL,
  `bank` varchar(64) DEFAULT NULL,
  `companyName` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`complect` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `complect` (
  `id` int(11) NOT NULL,
  `w_id` int(11) NOT NULL,
  `grp` int(11) NOT NULL DEFAULT '0',
  `qw` tinyint(4) NOT NULL,
  `act` enum('Y','N') NOT NULL,
  PRIMARY KEY (`id`,`w_id`),
  KEY `act` (`act`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`complect_limits` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `complect_limits` (
  `c_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `limit` int(11) NOT NULL,
  PRIMARY KEY (`c_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`complect_stat` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `complect_stat` (
  `id` int(10) unsigned NOT NULL,
  `markup` int(11) unsigned NOT NULL DEFAULT '15',
  `act` enum('Y','N') NOT NULL DEFAULT 'N',
  `flag` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `act` (`act`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`contact` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone1` varchar(24) DEFAULT NULL,
  `phone2` varchar(24) DEFAULT NULL,
  `fax` varchar(24) DEFAULT NULL,
  `post_adress` char(24) NOT NULL DEFAULT '0',
  `office` char(54) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251  COMMENT='глоб. адреса для заказов и пользо';

/* Table structure for table `apitcomp`.`content_paged` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `content_paged` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `root` int(3) NOT NULL,
  `uri_alias` char(24) NOT NULL DEFAULT '404',
  `meta_key` tinytext,
  `meta_desc` mediumtext,
  `tag_title` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` text,
  `ord` int(2) NOT NULL DEFAULT '0',
  `top` enum('Y','N') NOT NULL DEFAULT 'N',
  `top_ord` int(3) NOT NULL DEFAULT '0',
  `short` char(32) DEFAULT NULL,
  `frame` enum('Y','N') NOT NULL DEFAULT 'Y',
  `display` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`),
  KEY `root` (`root`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`content_rubr` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `content_rubr` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `fld` char(24) NOT NULL,
  `title` varchar(50) NOT NULL,
  `to_site` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `to_site` (`to_site`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`coupon` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `coupon` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` char(32) NOT NULL,
  `rouble_off` decimal(5,2) DEFAULT NULL,
  `percent_off` decimal(5,2) DEFAULT NULL,
  `min_amount_rubl` decimal(8,2) DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `period_days` int(4) DEFAULT NULL,
  `never_expiries` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `combinable` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `display_precedence` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`display_precedence`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251 COMMENT='скидки';

/* Table structure for table `apitcomp`.`coupon_user` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `coupon_user` (
  `coupon` int(4) NOT NULL DEFAULT '0',
  `user` int(11) NOT NULL DEFAULT '0',
  `hash` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`coupon`,`user`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 COMMENT='контроль скидок';

/* Table structure for table `apitcomp`.`credit_feedback` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `credit_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `role` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`csv_gen_runner` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `csv_gen_runner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL,
  `progress` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`dbb` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `dbb` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `vendor_id` int(6) unsigned NOT NULL DEFAULT '530',
  `vendor_code` varchar(24) CHARACTER SET cp1251 DEFAULT NULL,
  `name` varchar(255) CHARACTER SET cp1251 NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`delivery` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `delivery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) CHARACTER SET cp1251 NOT NULL DEFAULT '',
  `text` text CHARACTER SET cp1251 NOT NULL,
  `html` text CHARACTER SET cp1251 NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`dir_nix_catalog` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `dir_nix_catalog` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `level` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251 ;

/* Table structure for table `apitcomp`.`front` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `front` (
  `id` int(11) NOT NULL DEFAULT '0',
  `catalog_id` int(4) DEFAULT NULL,
  `vendor_id` int(4) DEFAULT NULL,
  `order` int(2) NOT NULL DEFAULT '0',
  `title` varchar(128) NOT NULL DEFAULT '',
  `title_alt` varchar(96) DEFAULT NULL,
  `about` mediumtext,
  `img` char(48) DEFAULT NULL,
  `img_alt` varchar(96) DEFAULT NULL,
  `sale_alt` varchar(96) DEFAULT NULL,
  `detail_alt` varchar(96) DEFAULT NULL,
  `type` enum('N','R','O') NOT NULL DEFAULT 'N',
  `view` enum('Y','N') NOT NULL DEFAULT 'N',
  `add` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`get_catalog` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `get_catalog` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(128) NOT NULL DEFAULT '',
  `cat_id` int(5) NOT NULL DEFAULT '0',
  `add` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251 ;

/* Table structure for table `apitcomp`.`gift_cat` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `gift_cat` (
  `id` int(11) NOT NULL,
  `holiday` varchar(8) NOT NULL,
  `name` varchar(24) NOT NULL,
  `img` varchar(32) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`gift_content` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `gift_content` (
  `id` int(11) NOT NULL,
  `holiday` varchar(8) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `ord` int(11) NOT NULL,
  PRIMARY KEY (`id`,`holiday`),
  KEY `cat_id` (`cat_id`,`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`gift_types` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `gift_types` (
  `id` int(11) NOT NULL,
  `txt` varchar(255) CHARACTER SET cp1251 NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`global_settings` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `global_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(32) DEFAULT NULL,
  `option_key` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `stored_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`global_settings_section` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `global_settings_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`icons_tmp` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `icons_tmp` (
  `vnd_id` int(11) NOT NULL,
  `w_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icons` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`id_vnd` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `id_vnd` (
  `id` int(6) NOT NULL DEFAULT '0',
  `vendor_id` int(6) NOT NULL DEFAULT '530'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`info` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `info` (
  `key` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `value` int(7) NOT NULL DEFAULT '0',
  `desc` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`desc`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`invoice` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL DEFAULT '0',
  `manager` int(11) NOT NULL DEFAULT '5',
  `type` int(6) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `note` varchar(500) DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  `reason` varchar(64) DEFAULT NULL,
  `adress` int(11) NOT NULL,
  `shipping` int(3) NOT NULL,
  `s_company` int(4) DEFAULT NULL,
  `s_info` tinytext,
  `s_price` smallint(5) DEFAULT NULL,
  `promo_id` int(10) unsigned DEFAULT NULL,
  `paysystem_status` enum('reserved','cancelled','confirmed') DEFAULT NULL,
  `paysystem_name` varchar(255) DEFAULT NULL,
  `paysystem_response` varchar(255) DEFAULT NULL,
  `paysystem_paymentid` varchar(255) DEFAULT NULL,
  `to1C` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `status` (`status`),
  KEY `type` (`type`),
  KEY `created` (`created`),
  KEY `manager` (`manager`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251  COMMENT='перечень сделанных заказов';

/* Table structure for table `apitcomp`.`invoice_bak` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `invoice_bak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(8) NOT NULL DEFAULT '0',
  `manager` int(4) NOT NULL DEFAULT '0',
  `type` int(3) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `note` varchar(500) DEFAULT NULL,
  `status` int(3) NOT NULL DEFAULT '1',
  `reason` varchar(64) DEFAULT NULL,
  `adress` int(11) NOT NULL,
  `shipping` int(3) NOT NULL,
  `s_company` int(4) DEFAULT NULL,
  `s_info` tinytext,
  `s_price` int(7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`),
  KEY `status` (`status`),
  KEY `type` (`type`),
  KEY `created` (`created`),
  KEY `manager` (`manager`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251  COMMENT='перечень сделанных заказов';

/* Table structure for table `apitcomp`.`invoice_history` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `invoice_history` (
  `id` int(8) NOT NULL DEFAULT '0',
  `status` tinytext,
  `manager` tinytext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`invoice_info` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `invoice_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(9) NOT NULL,
  `invoice` int(9) NOT NULL,
  `part` int(5) NOT NULL,
  `vendor` int(5) NOT NULL DEFAULT '530',
  `rub` int(6) NOT NULL,
  `usd` decimal(8,2) NOT NULL,
  `qw` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`,`invoice`,`part`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`invoice_sku` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `invoice_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251  COMMENT='корзина заказа';

/* Table structure for table `apitcomp`.`key2key1` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `key2key1` (
  `key1` int(7) unsigned NOT NULL,
  `key2` int(7) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`m1` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `m1` (
  `id` int(5) NOT NULL DEFAULT '0',
  `title` varchar(64) DEFAULT NULL,
  `p1` varchar(32) NOT NULL DEFAULT 'N',
  `p2` varchar(32) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 ;

/* Table structure for table `apitcomp`.`manager` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supervisor` int(11) NOT NULL DEFAULT '1',
  `email` varchar(32) NOT NULL DEFAULT 'N',
  `permission_id` int(3) NOT NULL DEFAULT '2',
  `type` char(1) NOT NULL DEFAULT 'N',
  `name` varchar(16) DEFAULT NULL,
  `name2` varchar(16) DEFAULT NULL,
  `login` varchar(10) NOT NULL,
  `pass` varchar(8) DEFAULT NULL,
  `icq` int(10) NOT NULL DEFAULT '0',
  `img` char(16) NOT NULL DEFAULT 'N',
  `last` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251 ;

/* Table structure for table `apitcomp`.`manager_group` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `manager_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `manager_ids` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `last_mgr_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`menu_clic_comp` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `menu_clic_comp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `phpsessid` varchar(32) NOT NULL,
  `dateclic` date NOT NULL,
  `nb_clics` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phpsessid` (`phpsessid`,`dateclic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`menu_clic_tools` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `menu_clic_tools` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `phpsessid` varchar(32) NOT NULL,
  `dateclic` date NOT NULL,
  `nb_clics` int(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `session` (`phpsessid`),
  KEY `nb_clicks` (`nb_clics`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`menu_extra` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `menu_extra` (
  `id` int(11) NOT NULL,
  `force_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`menu_master` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `menu_master` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(108) CHARACTER SET cp1251 DEFAULT NULL,
  `p1` varchar(32) CHARACTER SET cp1251 DEFAULT NULL,
  `p2` varchar(32) CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `apit_url` varchar(255) DEFAULT NULL,
  `root` int(5) NOT NULL DEFAULT '0',
  `order` int(4) NOT NULL DEFAULT '0',
  `cnt` int(5) DEFAULT '0',
  `vnd` text CHARACTER SET cp1251,
  `on_root` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'Y',
  `to_site` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `root` (`root`),
  KEY `order` (`order`),
  KEY `to_site` (`to_site`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`menu_no_comp` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `menu_no_comp` (
  `id` int(5) NOT NULL DEFAULT '0',
  `title` varchar(108) CHARACTER SET cp1251 DEFAULT NULL,
  `p1` varchar(32) CHARACTER SET cp1251 DEFAULT NULL,
  `p2` varchar(32) CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `root` int(5) NOT NULL DEFAULT '0',
  `order` int(4) NOT NULL DEFAULT '0',
  `cnt` int(5) DEFAULT '0',
  `vnd` text CHARACTER SET cp1251,
  `on_root` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'Y',
  `to_site` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `root` (`root`),
  KEY `to_site` (`to_site`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`menu_related` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `menu_related` (
  `menu_id` int(11) NOT NULL,
  `related_menu_id` int(11) NOT NULL,
  UNIQUE KEY `menu_id_2` (`menu_id`,`related_menu_id`),
  KEY `related_menu_id` (`related_menu_id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`menu_sb` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `menu_sb` (
  `id` int(5) NOT NULL DEFAULT '0',
  `title` varchar(64) DEFAULT NULL,
  `root` int(5) NOT NULL DEFAULT '0',
  `order` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `block` (`root`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 ;

/* Table structure for table `apitcomp`.`menu_vendor` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `menu_vendor` (
  `menu_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  UNIQUE KEY `menu_id` (`menu_id`,`vendor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`meta` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `meta` (
  `catalog_id` int(8) NOT NULL DEFAULT '0',
  `vendor_id` int(8) NOT NULL DEFAULT '0',
  `ttl` tinytext CHARACTER SET cp1251,
  `kwd` tinytext CHARACTER SET cp1251,
  `dsc` text CHARACTER SET cp1251,
  `vrt` text CHARACTER SET cp1251,
  `on_change` datetime DEFAULT NULL,
  PRIMARY KEY (`catalog_id`,`vendor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`meta_tools` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `meta_tools` (
  `catalog_id` int(8) NOT NULL DEFAULT '0',
  `vendor_id` int(8) NOT NULL DEFAULT '0',
  `ttl` tinytext CHARACTER SET cp1251,
  `kwd` tinytext CHARACTER SET cp1251,
  `dsc` text CHARACTER SET cp1251,
  `vrt` text CHARACTER SET cp1251,
  `on_change` datetime DEFAULT NULL,
  PRIMARY KEY (`catalog_id`,`vendor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`metro` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `metro` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(32) CHARACTER SET cp1251 NOT NULL,
  `root` varchar(5) NOT NULL,
  `ord` int(4) NOT NULL,
  `city` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`mm_description` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `mm_description` (
  `id` int(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(108) CHARACTER SET cp1251 DEFAULT NULL,
  `p1` varchar(32) CHARACTER SET cp1251 DEFAULT NULL,
  `p2` varchar(32) CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `apit_url` varchar(255) DEFAULT NULL,
  `cnt` int(5) DEFAULT '0',
  `vnd` text CHARACTER SET cp1251,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`mm_title` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `mm_title` (
  `menu_id` int(5) NOT NULL,
  `vnd_id` int(5) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  UNIQUE KEY `menu_id` (`menu_id`,`vnd_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`mm_tree` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `mm_tree` (
  `id` int(5) unsigned NOT NULL DEFAULT '0',
  `root` int(5) NOT NULL DEFAULT '0',
  `order` int(4) NOT NULL DEFAULT '0',
  `to_site` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `root` (`root`),
  KEY `order` (`order`),
  KEY `to_site` (`to_site`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`mm_vnd_count` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `mm_vnd_count` (
  `catalog_id` int(11) unsigned NOT NULL,
  `v_name` varchar(32) CHARACTER SET cp1251 NOT NULL,
  `v_id` int(11) unsigned NOT NULL,
  `cnt` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`catalog_id`,`v_id`),
  KEY `catalog_id` (`catalog_id`),
  KEY `v_id` (`v_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`myragon` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `myragon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `perc` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`myragon_cat` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `myragon_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myr_Id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`news` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site` smallint(6) NOT NULL,
  `title` varchar(255) NOT NULL,
  `announce` text NOT NULL,
  `text` text NOT NULL,
  `date` datetime NOT NULL,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`nix_info` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `nix_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ocs_id` varchar(14) DEFAULT NULL,
  `newnet_id` varchar(24) DEFAULT NULL,
  `nix_id` int(7) DEFAULT NULL,
  `lanit_id` varchar(24) DEFAULT NULL,
  `trusystem_id` int(6) DEFAULT NULL,
  `landata_id` int(7) DEFAULT NULL,
  `copyworld_id` varchar(24) DEFAULT NULL,
  `aptd_id` varchar(16) DEFAULT NULL,
  `elko_id` varchar(10) DEFAULT NULL,
  `x-com_id` varchar(10) DEFAULT NULL,
  `forum_id` varchar(8) DEFAULT NULL,
  `oldi_id` varchar(10) DEFAULT NULL,
  `depo_id` varchar(10) DEFAULT NULL,
  `merlion_id` varchar(10) DEFAULT NULL,
  `buro_id` varchar(24) DEFAULT NULL,
  `lank_id` varchar(10) DEFAULT NULL,
  `formoza_id` varchar(10) DEFAULT NULL,
  `technotrade_id` varchar(16) DEFAULT NULL,
  `usn_id` varchar(10) DEFAULT NULL,
  `lamir_id` varchar(10) DEFAULT NULL,
  `apit_id` int(11) DEFAULT NULL,
  `rsi_id` varchar(16) DEFAULT NULL,
  `russtil_id` varchar(16) DEFAULT NULL,
  `digis_id` varchar(16) DEFAULT NULL,
  `ctckapital_id` varchar(16) DEFAULT NULL,
  `dihouse_id` varchar(20) DEFAULT NULL,
  `denco_id` varchar(24) DEFAULT NULL,
  `mics_id` varchar(16) DEFAULT NULL,
  `cisco_id` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `newnet_id` (`newnet_id`),
  UNIQUE KEY `ocs_id` (`ocs_id`),
  UNIQUE KEY `landata_id` (`landata_id`),
  UNIQUE KEY `copyworld_id` (`copyworld_id`),
  UNIQUE KEY `lanit_id` (`lanit_id`),
  UNIQUE KEY `trusystem_id` (`trusystem_id`),
  UNIQUE KEY `elko_id` (`elko_id`),
  UNIQUE KEY `x-com_id` (`x-com_id`),
  UNIQUE KEY `forum_id` (`forum_id`),
  UNIQUE KEY `oldi_id` (`oldi_id`),
  UNIQUE KEY `depo_id` (`depo_id`),
  UNIQUE KEY `merlion_id` (`merlion_id`),
  UNIQUE KEY `lamir_id` (`lamir_id`),
  UNIQUE KEY `denco_id` (`denco_id`),
  UNIQUE KEY `mics_id` (`mics_id`),
  KEY `nix_id` (`nix_id`),
  KEY `buro_id` (`buro_id`),
  KEY `lank_id` (`lank_id`),
  KEY `formoza_id` (`formoza_id`),
  KEY `technotrade_id` (`technotrade_id`),
  KEY `usn_id` (`usn_id`),
  KEY `apit_id` (`apit_id`),
  KEY `rsi_id` (`rsi_id`),
  KEY `ctckapital_id` (`ctckapital_id`),
  KEY `digis_id` (`digis_id`),
  KEY `russtil_id` (`russtil_id`),
  KEY `dihouse_id` (`dihouse_id`),
  KEY `cisco_id` (`cisco_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251  ;

/* Table structure for table `apitcomp`.`nix_info_bak` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `nix_info_bak` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nix_id` int(7) DEFAULT NULL,
  `lanit_id` varchar(24) DEFAULT NULL,
  `truesystem_id` int(6) DEFAULT NULL,
  `landata_id` int(7) DEFAULT NULL,
  `copyworld_id` varchar(24) DEFAULT NULL,
  `skrak_id` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nix_id` (`nix_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251  ;

/* Table structure for table `apitcomp`.`num_corresp` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `num_corresp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `degree` int(11) NOT NULL,
  `unit` varchar(64) NOT NULL,
  `key1` int(11) NOT NULL,
  `key2` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_id_2` (`menu_id`,`degree`,`unit`,`key1`,`key2`),
  KEY `menu_id` (`menu_id`),
  KEY `key1` (`key1`),
  KEY `key2` (`key2`),
  KEY `unit` (`unit`),
  KEY `degree` (`degree`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`num_corresp_force` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `num_corresp_force` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `degree` int(11) NOT NULL,
  `unit` varchar(64) NOT NULL,
  `key1` int(11) NOT NULL,
  `key2` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_id_2` (`menu_id`,`degree`,`unit`,`key1`,`key2`),
  KEY `menu_id` (`menu_id`),
  KEY `key1` (`key1`),
  KEY `key2` (`key2`),
  KEY `unit` (`unit`),
  KEY `degree` (`degree`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`num_corresp_not` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `num_corresp_not` (
  `menu_id` int(11) NOT NULL,
  `degree` int(11) DEFAULT NULL,
  `unit` varchar(64) NOT NULL,
  `key1` int(11) NOT NULL,
  `key2` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  UNIQUE KEY `menu_id` (`menu_id`,`degree`,`unit`,`key1`,`key2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`num_corresp_tmp` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `num_corresp_tmp` (
  `menu_id` int(11) NOT NULL,
  `degree` int(11) NOT NULL,
  `unit` varchar(64) NOT NULL,
  `key1` int(11) NOT NULL,
  `key2` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`num_filter_names` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `num_filter_names` (
  `filter_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `vector` int(1) DEFAULT NULL,
  UNIQUE KEY `filter_id` (`filter_id`),
  KEY `vector` (`vector`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`num_filter_values` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `num_filter_values` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` int(11) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `vint` double NOT NULL,
  `vmin` double NOT NULL,
  `vmax` double NOT NULL,
  `vstr` varchar(128) NOT NULL,
  `property_id` bigint(20) NOT NULL,
  `importance` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filter_id` (`filter_id`),
  KEY `store_id` (`store_id`),
  KEY `vint` (`vint`),
  KEY `property_id` (`property_id`),
  KEY `vmin` (`vmin`),
  KEY `vmax` (`vmax`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`num_filters` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `num_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `main_key` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `degree` int(11) NOT NULL,
  `unit` varchar(128) NOT NULL,
  `vector` tinyint(3) unsigned NOT NULL,
  `dunit` varchar(64) NOT NULL,
  `dmul` double NOT NULL,
  `importance` int(11) DEFAULT NULL,
  `vmin` double DEFAULT NULL,
  `vmax` double DEFAULT NULL,
  `vavg` double DEFAULT NULL,
  `vcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit` (`unit`),
  KEY `important` (`importance`),
  KEY `main_key` (`main_key`),
  KEY `menu_id` (`menu_id`),
  KEY `vcount` (`vcount`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`num_filters_old` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `num_filters_old` (
  `id` int(11) NOT NULL DEFAULT '0',
  `menu_id` int(11) NOT NULL,
  `main_key` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `degree` int(11) NOT NULL,
  `unit` varchar(128) NOT NULL,
  `ori7n` tinyint(3) unsigned NOT NULL,
  `dunit` varchar(64) NOT NULL,
  `dmul` double NOT NULL,
  `important` smallint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`num_filters_remove` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `num_filters_remove` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `main_key` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `degree` int(11) NOT NULL,
  `unit` varchar(128) NOT NULL,
  `vector` tinyint(3) unsigned NOT NULL,
  `dunit` varchar(64) NOT NULL,
  `dmul` double NOT NULL,
  `importance` int(11) DEFAULT NULL,
  `vmin` double DEFAULT NULL,
  `vmax` double DEFAULT NULL,
  `vavg` double DEFAULT NULL,
  `vcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit` (`unit`),
  KEY `important` (`importance`),
  KEY `main_key` (`main_key`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`num_property` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `num_property` (
  `menu_id` int(11) NOT NULL,
  `value_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) NOT NULL,
  `vstr` varchar(128) NOT NULL,
  `vint` double NOT NULL,
  `vmin` double NOT NULL,
  `vmax` double NOT NULL,
  `degree` smallint(6) NOT NULL,
  `unit` varchar(64) NOT NULL,
  `dunit` varchar(64) NOT NULL,
  `dmul` double NOT NULL,
  `importance` int(11) NOT NULL,
  KEY `unit` (`unit`),
  KEY `menu_id` (`menu_id`),
  KEY `value_id` (`value_id`),
  KEY `vint` (`vint`),
  KEY `dunit` (`dunit`),
  KEY `dmul` (`dmul`),
  KEY `degree` (`degree`),
  KEY `vmin` (`vmin`),
  KEY `vmax` (`vmax`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`online` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `online` (
  `id` int(6) NOT NULL DEFAULT '0',
  `catalog_id` int(6) NOT NULL DEFAULT '0',
  `vendor_id` int(6) NOT NULL DEFAULT '530',
  `vendor_code` varchar(24) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `img` varchar(64) DEFAULT NULL,
  `cur_price` decimal(8,2) DEFAULT NULL,
  `last_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `opt_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `change_price` date NOT NULL DEFAULT '0000-00-00',
  `new` enum('Y','N') NOT NULL DEFAULT 'N',
  `on_sale` enum('Y','N') NOT NULL DEFAULT 'N',
  `stock` enum('Y','N') NOT NULL DEFAULT 'N',
  `type` varchar(2) NOT NULL DEFAULT 'D',
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `catalog_id` (`catalog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 ;

/* Table structure for table `apitcomp`.`payment_log` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `payment_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `event` varchar(10) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`perm_grp` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `perm_grp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`permission` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `permission` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `desc` char(8) NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251 COMMENT='привилегии';

/* Table structure for table `apitcomp`.`perms` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `perms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(108) NOT NULL,
  `grp` int(11) NOT NULL,
  `descr` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`podmosk` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `podmosk` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET cp1251 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`pr_get_info` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `pr_get_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` datetime NOT NULL,
  `info` text NOT NULL,
  `type` enum('pr','or') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`present_stat` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `present_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail1` varchar(32) NOT NULL,
  `name1` varchar(24) NOT NULL,
  `ware_id` int(6) NOT NULL,
  `mail2` varchar(32) DEFAULT NULL,
  `name2` varchar(24) NOT NULL,
  `sent` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sent` (`sent`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`price_xml` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `price_xml` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `cbrf` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`price_xml_catID` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `price_xml_catID` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_priceXml` int(11) DEFAULT NULL,
  `id_cat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_priceXml` (`id_priceXml`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`product_status` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `product_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `status` varchar(1) NOT NULL COMMENT 'c - created\np - processed',
  `notification_send` varchar(1) NOT NULL DEFAULT 'f' COMMENT 'f - false\nt - true',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`promo_code` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `promo_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('text','script') NOT NULL,
  `value` varchar(255) NOT NULL,
  `p_name` varchar(255) DEFAULT NULL,
  `price` enum('opt','rozn') NOT NULL DEFAULT 'rozn',
  `discount` float NOT NULL,
  `priority` int(11) DEFAULT NULL COMMENT 'Small handled first',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`property_keys` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `property_keys` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `order_` int(7) unsigned DEFAULT '1000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `order_` (`order_`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`property_values` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `property_values` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL,
  `section_id` int(7) unsigned NOT NULL,
  `key_id` int(7) unsigned NOT NULL,
  `value` varchar(700) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `section_id_2` (`section_id`,`store_id`,`key_id`),
  KEY `store_id` (`store_id`),
  KEY `key_id` (`key_id`),
  KEY `value` (`value`(333)),
  KEY `section_id` (`section_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`propety_values_fixed` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `propety_values_fixed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `key_id` int(11) DEFAULT NULL,
  `str` varchar(255) DEFAULT NULL,
  `val` float DEFAULT NULL,
  `minv` float DEFAULT NULL,
  `maxv` float DEFAULT NULL,
  `unit` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_id` (`store_id`,`key_id`,`val`,`unit`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`qs` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `qs` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(5) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `pattern` text NOT NULL,
  `inherit` enum('Y','N') NOT NULL DEFAULT 'Y',
  `order` smallint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251  COMMENT='массив быстрого поиска';

/* Table structure for table `apitcomp`.`quick_search` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `quick_search` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(5) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `pattern` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251  COMMENT='массив быстрого поиска';

/* Table structure for table `apitcomp`.`regions` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `regions` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251 ;

/* Table structure for table `apitcomp`.`replay_status` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `replay_status` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` char(64) CHARACTER SET cp1251 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`role2perm` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `role2perm` (
  `rid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  UNIQUE KEY `rid` (`rid`,`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`roles` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(108) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`s1` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `s1` (
  `id` int(6) NOT NULL DEFAULT '0',
  `catalog_id` int(6) NOT NULL DEFAULT '0',
  `vendor_id` int(6) NOT NULL DEFAULT '530',
  `vendor_code` varchar(24) CHARACTER SET cp1251 DEFAULT NULL,
  `name` varchar(255) CHARACTER SET cp1251 NOT NULL DEFAULT '',
  `cur_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `last_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `opt_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `change_price` date NOT NULL DEFAULT '0000-00-00',
  `new` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `on_sale` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `stock` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `type` char(2) CHARACTER SET cp1251 NOT NULL DEFAULT 'D'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`search` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `search` (
  `word` varchar(32) NOT NULL,
  `group` int(6) NOT NULL DEFAULT '0',
  `type` enum('S','M') CHARACTER SET utf8 NOT NULL DEFAULT 'S' COMMENT 'synonim & misprint',
  `define` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`group`,`word`),
  KEY `define` (`define`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`search_replace` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `search_replace` (
  `word` varchar(50) CHARACTER SET cp1251 NOT NULL,
  `replace` varchar(50) CHARACTER SET cp1251 NOT NULL,
  UNIQUE KEY `search` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`search_synonym` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `search_synonym` (
  `word` varchar(50) CHARACTER SET cp1251 NOT NULL,
  `group` int(11) NOT NULL,
  UNIQUE KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`section_keys` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `section_keys` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `order_` int(7) unsigned DEFAULT '1000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `order_` (`order_`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`section_values` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `section_values` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL,
  `key_id` int(7) unsigned NOT NULL,
  `type_` char(1) NOT NULL DEFAULT 'T',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `store_id_2` (`store_id`,`key_id`),
  KEY `store_id` (`store_id`),
  KEY `key_id` (`key_id`),
  KEY `type_` (`type_`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`set_1c_prefix` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `set_1c_prefix` (
  `cat_id` int(11) NOT NULL,
  `text` varchar(32) CHARACTER SET cp1251 NOT NULL,
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`shipping` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `shipping` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` char(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`shipping_company` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `shipping_company` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` char(64) DEFAULT NULL,
  `url` char(64) DEFAULT NULL,
  `phone` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251 COMMENT='транспортные компании';

/* Table structure for table `apitcomp`.`stat_date_clic_comp` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `stat_date_clic_comp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateclic` date NOT NULL COMMENT 'Date',
  `nb_clics` int(11) NOT NULL COMMENT 'Total number of clicks this day',
  `total_nb_persons` int(11) DEFAULT NULL COMMENT 'Total number of persons clicking on menu this day',
  `nb_persons_more_than_two_clics` int(11) DEFAULT NULL COMMENT 'Nober of persons clicked  more than 2 times on menu this day',
  `nb_persons_more_than_three_clics` int(11) DEFAULT NULL COMMENT 'Number of persons clicked more than 3 times on menu this day',
  PRIMARY KEY (`id`),
  KEY `dateclic` (`dateclic`,`nb_clics`,`total_nb_persons`,`nb_persons_more_than_two_clics`,`nb_persons_more_than_three_clics`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`stat_editors` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `stat_editors` (
  `manager` int(4) NOT NULL,
  `ware` int(8) NOT NULL,
  `action` int(4) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `manager` (`manager`,`ware`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`stat_editors_act` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `stat_editors_act` (
  `id` int(4) NOT NULL,
  `name` varchar(32) CHARACTER SET cp1251 NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`static_price` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `static_price` (
  `id` int(10) unsigned NOT NULL,
  `manager_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_id` (`manager_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`status` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `status` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251 COMMENT='тип статуса заказа';

/* Table structure for table `apitcomp`.`store` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) unsigned NOT NULL DEFAULT '0',
  `vendor_id` int(6) unsigned NOT NULL DEFAULT '530',
  `vendor_code` varchar(60) CHARACTER SET cp1251 DEFAULT '',
  `name` varchar(255) CHARACTER SET cp1251 NOT NULL DEFAULT '',
  `img` varchar(255) DEFAULT NULL,
  `cur_price` decimal(8,2) DEFAULT NULL,
  `last_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `opt_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `change_price` date NOT NULL DEFAULT '0000-00-00',
  `new` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `on_sale` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `stock` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `type` char(3) CHARACTER SET cp1251 NOT NULL DEFAULT 'D',
  `status` enum('A','B','C','D') NOT NULL DEFAULT 'D',
  `currency` enum('u','r','e') CHARACTER SET cp1251 NOT NULL DEFAULT 'u',
  `supplier` int(11) DEFAULT NULL,
  `check_av` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `supplier` (`supplier`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`store_bak` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_bak` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `catalog_id` int(11) unsigned NOT NULL DEFAULT '0',
  `vendor_id` int(6) unsigned NOT NULL DEFAULT '530',
  `vendor_code` varchar(60) CHARACTER SET cp1251 DEFAULT '',
  `name` varchar(255) CHARACTER SET cp1251 NOT NULL DEFAULT '',
  `img` varchar(255) DEFAULT NULL,
  `cur_price` decimal(8,2) DEFAULT NULL,
  `last_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `opt_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `change_price` date NOT NULL DEFAULT '0000-00-00',
  `new` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `on_sale` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `stock` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `type` char(3) CHARACTER SET cp1251 NOT NULL DEFAULT 'D',
  `status` enum('A','B','C','D') NOT NULL DEFAULT 'D',
  `currency` enum('u','r','e') CHARACTER SET cp1251 NOT NULL DEFAULT 'u',
  `supplier` int(11) DEFAULT NULL,
  `check_av` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`store_copy` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_copy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catalog_id` int(6) unsigned NOT NULL DEFAULT '0',
  `vendor_id` int(6) unsigned NOT NULL DEFAULT '530',
  `vendor_code` varchar(24) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `img` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `cur_price` decimal(8,2) DEFAULT NULL,
  `last_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `opt_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `change_price` date NOT NULL DEFAULT '0000-00-00',
  `new` enum('Y','N') NOT NULL DEFAULT 'N',
  `on_sale` enum('Y','N') NOT NULL DEFAULT 'N',
  `stock` enum('Y','N') NOT NULL DEFAULT 'N',
  `type` char(3) NOT NULL DEFAULT 'D',
  `status` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `currency` enum('u','r','e') NOT NULL DEFAULT 'u',
  UNIQUE KEY `id` (`id`),
  KEY `catalog_id` (`catalog_id`,`vendor_id`),
  KEY `vendor_code` (`vendor_code`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`store_desc` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_desc` (
  `id` int(10) unsigned NOT NULL,
  `t_name` char(128) DEFAULT NULL,
  `t_desc` text,
  `t_abt` mediumtext,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`store_desc_bak` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_desc_bak` (
  `id` int(10) unsigned NOT NULL,
  `t_name` char(128) CHARACTER SET cp1251 DEFAULT NULL,
  `t_desc` text CHARACTER SET cp1251,
  `t_abt` mediumtext CHARACTER SET cp1251
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`store_desc_copy` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_desc_copy` (
  `id` int(10) unsigned NOT NULL,
  `t_name` char(128) DEFAULT NULL,
  `t_desc` text,
  `t_abt` mediumtext,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`store_dst` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_dst` (
  `id` int(6) NOT NULL DEFAULT '0',
  `catalog_id` int(6) NOT NULL DEFAULT '0',
  `vendor_id` int(6) NOT NULL DEFAULT '530',
  `vendor_code` varchar(24) CHARACTER SET cp1251 DEFAULT NULL,
  `name` varchar(255) CHARACTER SET cp1251 NOT NULL DEFAULT '',
  `img` varchar(255) DEFAULT NULL,
  `cur_price` decimal(8,2) DEFAULT NULL,
  `last_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `opt_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `change_price` date NOT NULL DEFAULT '0000-00-00',
  `new` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `on_sale` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `stock` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `type` char(2) CHARACTER SET cp1251 NOT NULL DEFAULT 'D',
  `status` char(1) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`store_files` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) NOT NULL,
  `header` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `show` bit(1) NOT NULL DEFAULT b'0',
  `http` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`store_fix` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_fix` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `catalog_id` int(11) unsigned NOT NULL DEFAULT '0',
  `vendor_id` int(6) unsigned NOT NULL DEFAULT '530',
  `vendor_code` varchar(60) CHARACTER SET cp1251 DEFAULT '',
  `name` varchar(255) CHARACTER SET cp1251 NOT NULL DEFAULT '',
  `img` varchar(255) DEFAULT NULL,
  `cur_price` decimal(8,2) DEFAULT NULL,
  `last_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `opt_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `change_price` date NOT NULL DEFAULT '0000-00-00',
  `new` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `on_sale` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `stock` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `type` char(3) CHARACTER SET cp1251 NOT NULL DEFAULT 'D',
  `status` enum('A','B','C','D') NOT NULL DEFAULT 'D',
  `currency` enum('u','r','e') CHARACTER SET cp1251 NOT NULL DEFAULT 'u',
  `supplier` int(11) DEFAULT NULL,
  `check_av` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `supplier` (`supplier`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`store_img` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_img` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `img` varchar(255) NOT NULL DEFAULT '',
  `order` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`order`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`store_items` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_items` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `img` varchar(255) DEFAULT NULL,
  `about` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 ;

/* Table structure for table `apitcomp`.`store_items_bak` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_items_bak` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `img` varchar(255) CHARACTER SET cp1251 DEFAULT NULL,
  `about` text CHARACTER SET cp1251
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`store_items_copy` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_items_copy` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `img` varchar(255) DEFAULT NULL,
  `about` text,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 ;

/* Table structure for table `apitcomp`.`store_related` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_related` (
  `store_id` bigint(20) NOT NULL,
  `related_store_id` bigint(20) NOT NULL,
  `freq` int(11) NOT NULL,
  UNIQUE KEY `store_id_2` (`store_id`,`related_store_id`),
  KEY `store_id` (`store_id`),
  KEY `related_store_id` (`related_store_id`),
  KEY `freq` (`freq`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`store_status` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_status` (
  `id` char(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`store_test` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_test` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `catalog_id` int(6) unsigned NOT NULL DEFAULT '0',
  `vendor_id` int(6) unsigned NOT NULL DEFAULT '530',
  `vendor_code` varchar(24) CHARACTER SET cp1251 DEFAULT NULL,
  `name` varchar(255) CHARACTER SET cp1251 NOT NULL DEFAULT '',
  `img` varchar(255) DEFAULT NULL,
  `cur_price` decimal(8,2) DEFAULT NULL,
  `last_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `opt_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `change_price` date NOT NULL DEFAULT '0000-00-00',
  `new` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `on_sale` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `stock` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'N',
  `type` char(3) CHARACTER SET cp1251 NOT NULL DEFAULT 'D',
  `status` char(1) DEFAULT NULL,
  `currency` enum('u','r','e') CHARACTER SET cp1251 NOT NULL DEFAULT 'u'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`store_tsst` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_tsst` (
  `id` int(6) NOT NULL DEFAULT '0',
  `catalog_id` int(6) NOT NULL DEFAULT '0',
  `vendor_id` int(6) NOT NULL DEFAULT '530',
  `vendor_code` varchar(24) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `cur_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `last_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `opt_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `change_price` date NOT NULL DEFAULT '0000-00-00',
  `new` enum('Y','N') NOT NULL DEFAULT 'N',
  `on_sale` enum('Y','N') NOT NULL DEFAULT 'N',
  `stock` enum('Y','N') NOT NULL DEFAULT 'N',
  `type` char(2) NOT NULL DEFAULT 'D',
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `catalog_id` (`catalog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 ;

/* Table structure for table `apitcomp`.`store_url` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_url` (
  `id` int(10) unsigned NOT NULL,
  `apit_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`store_video` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) NOT NULL,
  `link` text NOT NULL,
  `show` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`store_views` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) DEFAULT NULL,
  `views` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `s_id` (`s_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`store_warranty` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `store_warranty` (
  `id` int(10) unsigned NOT NULL,
  `war` smallint(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`super` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `super` (
  `id` int(10) unsigned NOT NULL,
  `act` int(3) NOT NULL,
  `importance` int(11) DEFAULT NULL,
  `toMain` int(11) NOT NULL,
  `order` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`,`act`),
  KEY `importance` (`importance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`super_bak` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `super_bak` (
  `id` int(10) unsigned NOT NULL,
  `act` int(3) NOT NULL,
  `importance` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`,`act`),
  KEY `importance` (`importance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`supplier_delivery` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `supplier_delivery` (
  `supplier` int(11) NOT NULL AUTO_INCREMENT,
  `period` tinyint(2) NOT NULL DEFAULT '2',
  PRIMARY KEY (`supplier`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`t_articles` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_articles` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(90) NOT NULL,
  `sysname` varchar(90) NOT NULL,
  `text` text NOT NULL,
  `seeAlso` text NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`t_articles_photos` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_articles_photos` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `prepic` varchar(90) NOT NULL,
  `bigpic` varchar(90) NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`t_articles_tabs` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_articles_tabs` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `title` varchar(90) NOT NULL,
  `sysname` varchar(90) NOT NULL,
  `visible` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`t_articles_tabs_pictures` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_articles_tabs_pictures` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `title` varchar(90) NOT NULL,
  `prepic` varchar(90) NOT NULL,
  `bigpic` varchar(90) NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`t_bannerClients` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_bannerClients` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(11) NOT NULL,
  `title` varchar(90) NOT NULL,
  `phone` varchar(90) NOT NULL,
  `address` varchar(90) NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`t_bannerClientsPayments` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_bannerClientsPayments` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `title` varchar(90) NOT NULL,
  `realdate` date NOT NULL,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`t_bannerPlaces` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_bannerPlaces` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(90) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`t_banners` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_banners` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(90) NOT NULL,
  `link` text NOT NULL,
  `location` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `dateFrom` date NOT NULL,
  `dateTo` date NOT NULL,
  `src` text NOT NULL,
  `src2` text NOT NULL,
  `src3` text NOT NULL,
  `src4` text NOT NULL,
  `src5` text NOT NULL,
  `src6` text NOT NULL,
  `src7` text NOT NULL,
  `opis` text NOT NULL,
  `cost` varchar(90) NOT NULL,
  `enabled` int(11) NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`t_banners_places` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_banners_places` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`t_certs` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_certs` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(90) NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`t_certs_item` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_certs_item` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `title` varchar(90) NOT NULL,
  `prepic` varchar(90) NOT NULL,
  `bigpic` varchar(90) NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`t_contacts` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_contacts` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(90) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`t_credit_cfg` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_credit_cfg` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  `text_before` text NOT NULL,
  `text_after` text NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`t_groups` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_groups` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `additional` text NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`t_groups_components` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_groups_components` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `component_name` varchar(80) NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`t_groups_users` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_groups_users` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`t_index` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_index` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` text NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`t_regions` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_regions` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(90) NOT NULL,
  `sTitle` varchar(90) NOT NULL,
  `link` varchar(90) NOT NULL,
  `visible` int(11) NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`t_regions_cities` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_regions_cities` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `title` varchar(90) NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`t_team` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_team` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(90) NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`t_team_item` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_team_item` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `title` varchar(90) NOT NULL,
  `name` varchar(90) NOT NULL,
  `phone` varchar(90) NOT NULL,
  `email` varchar(90) NOT NULL,
  `ICQ` varchar(90) NOT NULL,
  `prepic` varchar(90) NOT NULL,
  `srcpic` varchar(90) NOT NULL,
  `extId` int(11) NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`t_users` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `t_users` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL DEFAULT '',
  `fname` varchar(50) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(90) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `is_developer` int(11) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`test_sql` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `test_sql` (
  `id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`tmpx` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `tmpx` (
  `a` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`tools` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `tools` (
  `title` varchar(108) DEFAULT NULL,
  `id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `cur_price` decimal(8,2) DEFAULT NULL,
  `last_price` decimal(8,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`tools_features` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `tools_features` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catalog_id` int(10) unsigned NOT NULL,
  `feature` varchar(50) CHARACTER SET cp1251 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`tools_icons_text` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `tools_icons_text` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `icon_number` int(9) NOT NULL,
  `text` varchar(200) CHARACTER SET cp1251 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `icon_number` (`icon_number`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`tools_items_icons` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `tools_items_icons` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` int(9) NOT NULL,
  `vendor_code` varchar(24) CHARACTER SET cp1251 NOT NULL,
  `icons` varchar(200) CHARACTER SET cp1251 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`,`vendor_code`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Icones numbers for apittools items';

/* Table structure for table `apitcomp`.`tools_items_icons_bak` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `tools_items_icons_bak` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` int(9) NOT NULL,
  `vendor_code` varchar(24) CHARACTER SET cp1251 NOT NULL,
  `icons` varchar(200) CHARACTER SET cp1251 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`,`vendor_code`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Icones numbers for apittools items';

/* Table structure for table `apitcomp`.`tools_items_icons_work` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `tools_items_icons_work` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` int(9) NOT NULL,
  `vendor_code` varchar(24) CHARACTER SET cp1251 NOT NULL,
  `icons` varchar(200) CHARACTER SET cp1251 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`,`vendor_code`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Icones numbers for apittools items';

/* Table structure for table `apitcomp`.`usd` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `usd` (
  `index` date NOT NULL DEFAULT '0000-00-00',
  `dollar` decimal(6,4) NOT NULL DEFAULT '0.0000',
  `euro` decimal(6,4) DEFAULT NULL,
  PRIMARY KEY (`index`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`usd_info` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `usd_info` (
  `type` enum('S','P') NOT NULL,
  `nal_stat` decimal(4,2) NOT NULL,
  `p_nal_cbr` decimal(4,2) NOT NULL,
  `p_bnal_cbr` decimal(4,2) NOT NULL,
  `p_nal_bnal` decimal(4,2) DEFAULT NULL,
  `bank` decimal(4,2) NOT NULL,
  `webmoney` decimal(4,2) NOT NULL,
  `yandex` decimal(4,2) NOT NULL,
  `eport` decimal(4,2) NOT NULL,
  `kreditpilot` decimal(4,2) NOT NULL,
  `prev_type` enum('P','S') NOT NULL,
  `prev_usd` decimal(6,4) DEFAULT NULL,
  `prev_nal` decimal(4,2) DEFAULT NULL,
  `prev_eur` decimal(6,4) DEFAULT NULL,
  `qiwi` decimal(4,2) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`usd_info_test` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `usd_info_test` (
  `type` enum('S','P') CHARACTER SET cp1251 NOT NULL,
  `nal_stat` decimal(4,2) NOT NULL,
  `p_nal_cbr` decimal(4,2) NOT NULL,
  `p_bnal_cbr` decimal(4,2) NOT NULL,
  `p_nal_bnal` decimal(4,2) DEFAULT NULL,
  `bank` decimal(4,2) NOT NULL,
  `webmoney` decimal(4,2) NOT NULL,
  `yandex` decimal(4,2) NOT NULL,
  `eport` decimal(4,2) NOT NULL,
  `kreditpilot` decimal(4,2) NOT NULL,
  `prev_type` enum('P','S') CHARACTER SET cp1251 NOT NULL,
  `prev_usd` decimal(6,4) DEFAULT NULL,
  `prev_nal` decimal(4,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`usd_test` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `usd_test` (
  `index` date NOT NULL DEFAULT '0000-00-00',
  `dollar` decimal(6,4) NOT NULL DEFAULT '0.0000',
  `euro` decimal(6,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`user` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(48) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `name` char(64) NOT NULL,
  `password` varchar(32) NOT NULL DEFAULT '',
  `status` enum('P','O') NOT NULL DEFAULT 'P',
  `manager_id` int(4) NOT NULL DEFAULT '0',
  `subscribed` enum('Y','N') NOT NULL DEFAULT 'Y',
  `social` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`user2role` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `user2role` (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  UNIQUE KEY `uid` (`uid`,`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`user_bk` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `user_bk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(48) DEFAULT NULL,
  `email` varchar(32) NOT NULL,
  `name` char(64) NOT NULL,
  `password` varchar(32) NOT NULL DEFAULT '',
  `status` enum('P','O') NOT NULL DEFAULT 'P',
  `manager_id` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`user_event` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `user_event` (
  `dt` datetime NOT NULL,
  `sess` varchar(32) NOT NULL,
  `events` tinytext NOT NULL,
  KEY `sess` (`sess`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`user_info` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `user_info` (
  `id` int(11) NOT NULL,
  `reg_in` datetime NOT NULL,
  `type_reg` enum('S','T','M') NOT NULL DEFAULT 'S',
  `in_money` decimal(6,2) NOT NULL DEFAULT '0.00',
  `out_money` decimal(6,2) NOT NULL DEFAULT '0.00',
  `in_invoice` int(5) NOT NULL DEFAULT '0',
  `out_invoice` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `apitcomp`.`usertmp` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `usertmp` (
  `id` int(11) NOT NULL DEFAULT '0',
  `login` varchar(48) CHARACTER SET cp1251 DEFAULT NULL,
  `email` varchar(32) CHARACTER SET cp1251 DEFAULT NULL,
  `name` char(64) CHARACTER SET cp1251 NOT NULL,
  `password` varchar(32) CHARACTER SET cp1251 NOT NULL DEFAULT '',
  `status` enum('P','O') CHARACTER SET cp1251 NOT NULL DEFAULT 'P',
  `manager_id` int(4) NOT NULL DEFAULT '0',
  `subscribed` enum('Y','N') CHARACTER SET cp1251 NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`valprop` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `valprop` (
  `menu_id` int(11) DEFAULT NULL,
  `value_id` bigint(20) DEFAULT NULL,
  `vstr` varchar(128) DEFAULT NULL,
  `vint` double DEFAULT NULL,
  `vmin` double DEFAULT NULL,
  `vmax` double DEFAULT NULL,
  `degree` smallint(6) DEFAULT NULL,
  `unit` varchar(64) DEFAULT NULL,
  `dunit` varchar(64) DEFAULT NULL,
  `dmul` double DEFAULT NULL,
  `id` bigint(20) unsigned DEFAULT NULL,
  `store_id` int(10) unsigned DEFAULT NULL,
  `section_id` int(7) unsigned DEFAULT NULL,
  `key_id` int(7) unsigned DEFAULT NULL,
  `value` varchar(700) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`vendor2` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `vendor2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251 ;

/* Table structure for table `apitcomp`.`vendor_instructions` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `vendor_instructions` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_id` int(6) unsigned NOT NULL,
  `vendor_code` varchar(24) CHARACTER SET cp1251 NOT NULL,
  `file` varchar(250) CHARACTER SET cp1251 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vendor` (`vendor_id`,`vendor_code`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`vendor_old` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `vendor_old` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(64) DEFAULT NULL,
  `apit_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251 ;

/* Table structure for table `apitcomp`.`vendor_translation` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `vendor_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(255) DEFAULT NULL,
  `translation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `apitcomp`.`weird_filters` */
CREATE TABLE IF NOT EXISTS `apitcomp`. `weird_filters` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `rat` double DEFAULT NULL,
  `intmin` double DEFAULT NULL,
  `intmax` double DEFAULT NULL,
  `strmin` varchar(128) DEFAULT NULL,
  `strmax` varchar(128) DEFAULT NULL,
  `valmin` varchar(700) DEFAULT NULL,
  `valmax` varchar(700) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Create structure for procedure `apitcomp`.`add1_plus_id` */
CREATE PROCEDURE `add1_plus_id`( IN ware_id INT ( 11 ))
    DETERMINISTIC
BEGIN
UPDATE `apitcomp`.`nix_info` SET id = id +1 WHERE `id` = ware_id;
UPDATE `apitcomp`.`store` SET id = id +1 WHERE `id` = ware_id;
UPDATE `apitcomp`.`store_items` SET id = id +1 WHERE `id` = ware_id;
UPDATE `apitcomp`.`store_desc` SET id = id +1 WHERE `id` = ware_id;
UPDATE `apitcomp`.`property_values` SET id = id +1 WHERE `store_id` = ware_id;
UPDATE `apitcomp`.`section_values` SET id = id +1 WHERE `store_id` = ware_id;
UPDATE `apitcomp`.`store_warranty` SET id = id +1 WHERE `id` = ware_id;
UPDATE `apitcomp`.`store_url` SET id = id +1 WHERE `id` = ware_id;
UPDATE `work`.`compare` SET id = id +1 WHERE `id` = ware_id;
UPDATE `apitcomp`.`complect` SET id = id +1 WHERE `w_id` = ware_id;
END;

/* Create structure for procedure `apitcomp`.`backup` */
CREATE PROCEDURE `backup`()
BEGIN
	DROP TABLE IF EXISTS `store_bak`;
	CREATE TABLE store_bak SELECT * FROM store;
	DROP TABLE IF EXISTS `store_items_bak`;
	CREATE TABLE store_items_bak SELECT * FROM store_items;
	DROP TABLE IF EXISTS `store_desc_bak`;
	CREATE TABLE store_desc_bak SELECT * FROM store_desc;
END;

/* Create structure for procedure `apitcomp`.`del_by_id` */
CREATE PROCEDURE `del_by_id`( IN ware_id INT ( 11 ))
    DETERMINISTIC
BEGIN
DELETE  FROM `apitcomp`.`nix_info` WHERE `id` = ware_id;
DELETE  FROM `apitcomp`.`store` WHERE `id` = ware_id;
DELETE  FROM `apitcomp`.`store_items` WHERE `id` = ware_id;
DELETE  FROM `apitcomp`.`store_desc` WHERE `id` = ware_id;
DELETE  FROM `apitcomp`.`property_values` WHERE `store_id` = ware_id;
DELETE  FROM `apitcomp`.`section_values` WHERE `store_id` = ware_id;
DELETE  FROM `apitcomp`.`store_warranty` WHERE `id` = ware_id;
DELETE  FROM `apitcomp`.`store_url` WHERE `id` = ware_id;
DELETE FROM `work`.`compare` WHERE `id` = ware_id;
DELETE FROM `apitcomp`.`complect` WHERE `w_id` = ware_id;
END;

/* Create structure for procedure `apitcomp`.`del_dbl_nix` */
CREATE PROCEDURE `del_dbl_nix`()
    DETERMINISTIC
BEGIN
CREATE TEMPORARY TABLE `dbl_nix` SELECT `nix_id` FROM `nix_info` WHERE nix_id IS NOT NULL GROUP BY nix_id HAVING COUNT( id ) >1;
CREATE TEMPORARY TABLE `del_dbl` SELECT MIN(id) as id FROM nix_info JOIN dbl_nix USING(nix_id) GROUP BY nix_id;
DELETE FROM `nix_info` WHERE `id` IN (SELECT `id` FROM `del_dbl`);
DELETE FROM `store` WHERE `id` IN (SELECT `id` FROM `del_dbl`);
DELETE FROM `store_items` WHERE `id` IN (SELECT `id` FROM `del_dbl`);
DELETE FROM `store_desc` WHERE `id` IN (SELECT `id` FROM `del_dbl`);
DELETE FROM `section_values` WHERE `store_id` IN (SELECT `id` FROM `del_dbl`);
DELETE FROM `property_values` WHERE `store_id` IN (SELECT `id` FROM `del_dbl`);
DROP TEMPORARY TABLE IF EXISTS `dbl_nix`;
DROP TEMPORARY TABLE IF EXISTS `del_dbl`;
END;

/* Create structure for procedure `apitcomp`.`drop_double` */
CREATE PROCEDURE `drop_double`()
BEGIN
create temporary table `nix_tmp`
SELECT s.`id`,
s.`vendor_code`,
REPLACE(s.`name`, ' ', '') as name,
s.`name` as nix_name
from  `store` s
RIGHT JOIN `nix_info` n USING(id)
WHERE s.`catalog_id` in (181,182,183,184,209) AND
n.`nix_id` IS NOT NULL AND n.`lanit_id` IS NULL;

create temporary table
lanit_tmp
SELECT n.id,n.lanit_id,s.name as lanit_name
from  store s
RIGHT JOIN nix_info n USING(id)
WHERE s.catalog_id in (181,182,183,184,209) AND
n.lanit_id IS NOT NULL AND n.nix_id IS NULL;

create temporary table
double_vals
SELECT l.id as del_id,l.lanit_id,(SELECT n.id FROM nix_tmp n 
WHERE (LOCATE(l.lanit_id,n.name) > 0 OR  l.lanit_id = n.vendor_code) AND l.id != n.id) as true_id
FROM lanit_tmp l 
HAVING true_id IS NOT NULL;

UPDATE `nix_info` n, `double_vals` d SET n.lanit_id = d.lanit_id WHERE n.id = d.true_id;

DELETE FROM `nix_info` WHERE `id` IN (SELECT `del_id` FROM `double_vals`);
DELETE FROM `store` WHERE `id` IN (SELECT `del_id` FROM `double_vals`);
DELETE FROM `store_items` WHERE `id` IN (SELECT `del_id` FROM `double_vals`);
DELETE FROM `store_desc` WHERE `id` IN (SELECT `del_id` FROM `double_vals`);
DELETE FROM `online` WHERE `id` IN (SELECT `del_id` FROM `double_vals`);

DROP TEMPORARY TABLE IF EXISTS nix_tmp;
DROP TEMPORARY TABLE IF EXISTS lanit_tmp;
DROP TEMPORARY TABLE IF EXISTS double_vals;
END;

/* Create structure for procedure `apitcomp`.`front_del_by_id` */
CREATE PROCEDURE `front_del_by_id`( IN ware_id MEDIUMINT ( 6 ))
BEGIN
DELETE FROM `front`  WHERE `id` = ware_id;
END;

/* Create structure for procedure `apitcomp`.`front_edit` */
CREATE PROCEDURE `front_edit`( IN catalog_id SMALLINT ( 3 ) , IN vendor_id MEDIUMINT ( 4 ) , IN title CHAR ( 128 ) , IN about TEXT , IN img CHAR ( 48 ) , IN img_alt CHAR ( 96 ) , IN sale_alt CHAR ( 96 ) , IN typ CHAR ( 1 ) , IN detail_alt CHAR ( 96 ) , IN id MEDIUMINT ( 6 ) , IN qw TINYINT ( 1 ))
BEGIN
IF qw = 1 THEN
UPDATE `front`
	SET
	`catalog_id` = catalog_id,
	`vendor_id` = vendor_id,
	`title` = title,
	`title_alt` = title_alt,
	`about` = about,
	`img` = img,
	`img_alt` = img_alt,
	`sale_alt` = sale_alt,
	`type` = typ,
	`detail_alt` = detail_alt
	WHERE `id` = id;
ELSE
INSERT INTO `front`
	(`catalog_id`,`vendor_id`,`title`,`title_alt`,`about`,`img`,`img_alt`,`sale_alt`,`type`,`detail_alt`,`id`)
	VALUES (catalog_id,vendor_id,title,title_alt,about,img,img_alt,sale_alt,typ,detail_alt,id);
END IF;
END;

/* Create structure for procedure `apitcomp`.`front_get_img_by_id` */
CREATE PROCEDURE `front_get_img_by_id`( IN ware_id INTEGER ( 6 ))
BEGIN
SELECT f.`img` FROM `front` f WHERE f.`id` = ware_id;
END;

/* Create structure for procedure `apitcomp`.`front_list` */
CREATE PROCEDURE `front_list`()
BEGIN
SELECT f.id, f.`type` , f.`order` , f.`view` , f.`title` , f.`about` , f.`img` , s.`cur_price` 
FROM `front` f
JOIN store s
USING ( id ) 
ORDER BY f.`type` , f.`order`; 
END;

/* Create structure for procedure `apitcomp`.`front_sel_list` */
CREATE PROCEDURE `front_sel_list`()
BEGIN
SELECT f.*,s.cur_price FROM `front` f JOIN store s USING(id) ORDER BY f.`type` DESC, f.`order`;
END;

/* Create structure for procedure `apitcomp`.`kill_dups` */
CREATE PROCEDURE `kill_dups`()
begin
    create temporary table
    tmp_kill_dups select
    nix.id as nx_id,
    lnt.id as lt_id from
    store as nix inner join
    store as lnt on
    nix.id <> lnt.id and
    nix.catalog_id = lnt.catalog_id and
    nix.vendor_id = lnt.vendor_id and
    nix.vendor_code is null and
    lnt.vendor_code is not null and
    nix.catalog_id in (181,182,183,184) and
    find_ignore_space(lnt.vendor_code, nix.name) = 1 inner join online on online.id = nix.id or online.id = lnt.id;

    update nix_info a, nix_info b, tmp_kill_dups set a.lanit_id = b.lanit_id where a.id = nx_id and b.id = lt_id;
    delete from nix_info where id in (select lt_id from tmp_kill_dups) and nix_id is null;
end;

/* Create structure for procedure `apitcomp`.`map` */
CREATE PROCEDURE `map`()
BEGIN
SELECT 
	DISTINCT (SELECT mm.`title`  FROM `menu` mm WHERE mm.`id` = m.`root`) AS rrot,
	m.`root`,
	m.`title`,
	m.`id`,
	v.`name`,
	s.`vendor_id`
FROM `menu` m
JOIN `store` s ON s.`catalog_id` = m.`id`
JOIN `vendor` v ON v.`id` = s.`vendor_id`
WHERE s.status IN ('A','B')
GROUP BY m.`id`,s.`vendor_id`
ORDER BY  m.`root`,m.`order`,v.`name`;
END;

/* Create structure for procedure `apitcomp`.`map_admin` */
CREATE PROCEDURE `map_admin`()
BEGIN
SELECT 
	DISTINCT (SELECT mm.`title`  FROM `menu` mm WHERE mm.`id` = m.`root`) AS rrot,
	m.`root`,
	m.`title`,
	m.`id`,
	v.`name`,
	s.`vendor_id`,
    a.`on_change`
FROM `menu` m
JOIN `online` s ON s.`catalog_id` = m.`id`
JOIN `vendor` v ON v.`id` = s.`vendor_id`
LEFT JOIN `meta` a ON (a.catalog_id = m.id AND a.vendor_id = v.id)
GROUP BY m.`id`,s.`vendor_id`
ORDER BY  m.`root`,m.`order`,v.`name`;
END;

/* Create structure for procedure `apitcomp`.`map_admin_tools` */
CREATE PROCEDURE `map_admin_tools`()
BEGIN
SELECT 
	DISTINCT (SELECT mm.`title`  FROM `menu_tools` mm WHERE mm.`id` = m.`root`) AS rrot,
	m.`root`,
	m.`title`,
	m.`id`,
	v.`name`,
	s.`vendor_id`,
    a.`on_change`
FROM `menu_tools` m
JOIN `store` s ON s.`catalog_id` = m.`id`
JOIN `vendor` v ON v.`id` = s.`vendor_id`
LEFT JOIN `meta` a ON (a.catalog_id = m.id AND a.vendor_id = v.id)
GROUP BY m.`id`,s.`vendor_id`
ORDER BY  m.`root`,m.`order`,v.`name`;
END;

/* Create structure for procedure `apitcomp`.`map_tools` */
CREATE PROCEDURE `map_tools`()
BEGIN
SELECT 
	DISTINCT (SELECT mm.`title`  FROM `menu_tools` mm WHERE mm.`id` = m.`root`) AS rrot,
	m.`root`,
	m.`title`,
	m.`id`,
	v.`name`,
	s.`vendor_id`
FROM `menu_tools` m
JOIN `store` s ON s.`catalog_id` = m.`id`
JOIN `vendor` v ON v.`id` = s.`vendor_id`
WHERE s.status IN ('A','B')
GROUP BY m.`id`,s.`vendor_id`
ORDER BY  m.`root`,m.`order`,v.`name`;
END;

/* Create structure for procedure `apitcomp`.`menu_rebild` */
CREATE PROCEDURE `menu_rebild`(IN root_in int, IN level_in tinyint)
BEGIN
	DECLARE rt,lvl,lvlplus,f_id,done INT DEFAULT 0;
	DECLARE rCur CURSOR FOR SELECT `id` FROM `menu_master` WHERE `root` = rt;
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

/* Create structure for procedure `apitcomp`.`mm_roots_vnd` */
CREATE PROCEDURE `mm_roots_vnd`()
BEGIN
	DECLARE root_id,done INT DEFAULT 0;
	DECLARE rCur CURSOR FOR SELECT DISTINCT `root` FROM apitcomp.`mm_tree`;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

	TRUNCATE TABLE apitcomp.mm_vnd_count;
	OPEN rCur;
	WHILE done = 0 DO
		FETCH rCur INTO root_id;
		INSERT IGNORE INTO apitcomp.mm_vnd_count 
		SELECT root_id,v.name,v.id,COUNT(s.id) FROM apitcomp.store s
		INNER JOIN (SELECT DISTINCT `id` FROM apitcomp.`binded_menu` WHERE `r_id` = root_id) j ON j.id = s.catalog_id
		INNER JOIN apitcomp.vendor v ON s.vendor_id = v.id 
		WHERE s.status < 'C'
		GROUP BY s.vendor_id;
	END WHILE;
	CLOSE rCur;
	INSERT IGNORE INTO apitcomp.mm_vnd_count 
	SELECT catalog_id,v.name,v.id,COUNT(s.id) FROM apitcomp.store s
	INNER JOIN apitcomp.vendor v ON s.vendor_id = v.id
	WHERE s.status < 'C'
	GROUP BY s.catalog_id,s.vendor_id;
END;

/* Create structure for procedure `apitcomp`.`mm_split_mm` */
CREATE PROCEDURE `mm_split_mm`()
BEGIN
	TRUNCATE TABLE mm_tree;
	INSERT INTO mm_tree SELECT `id`,`root`,`order`,`to_site` FROM menu_master;
	TRUNCATE TABLE mm_description;
	INSERT INTO mm_description SELECT id,title,p1,p2,apit_url,cnt,vnd  FROM menu_master;
END;

/* Create structure for procedure `apitcomp`.`move_compare` */
CREATE PROCEDURE `move_compare`( IN id_from INT ( 11 ),IN id_to INT (11))
    DETERMINISTIC
BEGIN
	UPDATE work.compare SET id=id_to WHERE id = id_from;
	CALL del_by_id(id_from);
END;

/* Create structure for procedure `apitcomp`.`nix_get_id` */
CREATE PROCEDURE `nix_get_id`(iN our_id INTEGER(6))
BEGIN
SELECT * FROM `nix_info` WHERE `id` = our_id;
END;

/* Create structure for procedure `apitcomp`.`num_filter` */
CREATE PROCEDURE `num_filter`(filter_id int, fromv double, tov double)
select s.* from num_filter_values v inner join
store s on v.store_id = s.id where
filter_id = filter_id and vint >= fromv and vint <= tov group by
store_id;

/* Create structure for procedure `apitcomp`.`price_get_by_id` */
CREATE PROCEDURE `price_get_by_id`( IN w_id MEDIUMINT ( 6 ))
BEGIN
SELECT `name`,`cur_price`, `opt_price`, `type`,DATE_FORMAT(`change_price`,
'%d.%m.%Y') as ch_p FROM `store` WHERE `id` = w_id LIMIT 1;
END;

/* Create structure for procedure `apitcomp`.`price_set_by_id` */
CREATE PROCEDURE `price_set_by_id`( IN cur_price DECIMAL ( 8 , 2 ) , IN opt_price DECIMAL ( 8 , 2 ) , IN last_price DECIMAL ( 8 , 2 ) , IN t_val CHAR ( 2 ) , IN w_id MEDIUMINT ( 6 ))
BEGIN
UPDATE `store` SET `cur_price`=cur_price,`opt_price`=opt_price,`change_price`=
CURDATE(), `last_price`=last_price, `on_sale` = 'Y', `type` = t_val WHERE `id`=
w_id;
END;

/* Create structure for procedure `apitcomp`.`rebuild_menu_tree` */
CREATE PROCEDURE `rebuild_menu_tree`()
BEGIN
	SET max_sp_recursion_depth = 10;	
	CALL menu_rebild(0,0);
	DELETE FROM binded_menu;
	INSERT INTO binded_menu SELECT DISTINCT * FROM binded_menu_source;
	DELETE FROM binded_menu_source;
END;

/* Create structure for procedure `apitcomp`.`recalc_complect` */
CREATE PROCEDURE `recalc_complect`()
BEGIN
UPDATE apitcomp.complect_stat t set t.act = 'Y';
UPDATE apitcomp.complect_stat t set t.act = 'N'
		WHERE id IN(
			SELECT DISTINCT c.id
			FROM apitcomp.store s
			INNER JOIN apitcomp.complect c ON s.id = c.w_id
			GROUP BY c.id,s.catalog_id
			HAVING MIN(s.cur_price) IS NULL);

DROP TABLE IF EXISTS _from;
CREATE TEMPORARY TABLE _from SELECT c.id,s.id as `from` FROM apitcomp.complect c
INNER JOIN apitcomp.store s ON s.id = c.w_id
INNER JOIN apitcomp.complect_stat t ON t.id=c.id AND t.act ='Y'
WHERE c.act = 'Y' AND s.cur_price IS NULL
GROUP BY c.id,s.catalog_id;
DROP TABLE IF EXISTS _to;
CREATE TEMPORARY TABLE _to SELECT c.id,s.id as `to` FROM apitcomp.complect c
INNER JOIN apitcomp.store s ON s.id = c.w_id
INNER JOIN apitcomp.complect_stat t ON t.id=c.id AND t.act ='Y'
WHERE c.act = 'N'
GROUP BY c.id,s.catalog_id
HAVING MIN(s.cur_price) IS NOT NULL;
DROP TABLE IF EXISTS from_to;
CREATE TEMPORARY TABLE from_to SELECT f.id,f.`from`,t.`to` FROM _from f
INNER JOIN _to t ON f.id=t.id;

UPDATE apitcomp.complect c,from_to f SET c.act = 'N' WHERE c.id = f.id AND c.w_id = f.`from`;
UPDATE apitcomp.complect c,from_to f SET c.act = 'Y' WHERE c.id = f.id AND c.w_id = f.`to`;
END;

/* Create structure for procedure `apitcomp`.`sitemap` */
CREATE PROCEDURE `sitemap`()
BEGIN
SELECT id,catalog_id,vendor_id FROM online;
END;

/* Create structure for procedure `apitcomp`.`usd_list` */
CREATE PROCEDURE `usd_list`()
BEGIN
SELECT * FROM `usd_info`;
END;

/* Create structure for procedure `apitcomp`.`usd_update` */
CREATE PROCEDURE `usd_update`(IN tpe CHAR(1), IN p_nal_cbr DECIMAL(4,2), IN p_bnal_cbr DECIMAL(4,2), IN nal_stat DECIMAL(4,2), IN p_nal_bnal DECIMAL(4,2))
BEGIN
	UPDATE `usd_info` SET `type` = tpe,`p_nal_cbr`= p_nal_cbr,`p_bnal_cbr`= p_bnal_cbr,`nal_stat`= nal_stat,`p_nal_bnal`= p_nal_bnal;
END;

/* Create structure for procedure `apitcomp`.`vnd_cnt` */
CREATE PROCEDURE `vnd_cnt`(OUT out_id int)
BEGIN
SELECT root FROM apitcomp.end_level_vnd_count;
END;

/* Create structure for function `apitcomp`.`articul_nix` */
CREATE FUNCTION `articul_nix`(str_val text) RETURNS varchar(255) CHARSET cp1251
    DETERMINISTIC
begin
    set @start = locate('&lt;', str_val) + 4;
    return substr(str_val, @start, locate('&gt;', str_val) - @start);
end;

/* Create structure for function `apitcomp`.`compare_store` */
CREATE FUNCTION `compare_store`(vendor_code varchar(44), name varchar(255)) RETURNS int(1)
    DETERMINISTIC
begin
    return coalesce(locate(replace(replace(vendor_code, '-', ''), ' ', ''), replace(replace(name, '-', ''), ' ', '')), 0) > 0 ;
end;

/* Create structure for function `apitcomp`.`c_tst` */
CREATE FUNCTION `c_tst`(val text) RETURNS text CHARSET utf8
    READS SQL DATA
begin
	return collation(val);
end;

/* Create structure for function `apitcomp`.`find_ignore_space` */
CREATE FUNCTION `find_ignore_space`(vendor_code varchar(44), name varchar(255)) RETURNS int(1)
    DETERMINISTIC
begin
    return coalesce(locate(replace(replace(vendor_code, ' ', ''), '-', ''),
			   replace(replace(name, ' ', ''), '-', '')), 0) > 0 ;
end;

/* Create structure for function `apitcomp`.`full_path` */
CREATE FUNCTION `full_path`(content_id int, delim varchar(100)) RETURNS text CHARSET cp1251
    READS SQL DATA
begin
    select name, parent into @name, @id from jos_menu where componentid = content_id limit 1;
    while @id > 0
    do
        select concat(name, delim, @name), parent into @name, @id from jos_menu where id = @id;
    end while;
    return @name;
end;

/* Create structure for function `apitcomp`.`get_bracket` */
CREATE FUNCTION `get_bracket`( w_name VARCHAR ( 255 )) RETURNS varchar(255) CHARSET utf8
    DETERMINISTIC
BEGIN
	DECLARE pos1 SMALLINT(3) DEFAULT 0;
	DECLARE pos2 SMALLINT(3) DEFAULT 0;
	DECLARE pos_len SMALLINT(2) DEFAULT 0;
	DECLARE out_str VARCHAR ( 255 )  DEFAULT '';
SET NAMES cp1251;
        SET out_str = w_name;
	SET pos1 = POSITION('(' IN out_str);
	SET pos2 = POSITION(')' IN out_str);
	SET pos_len = pos2 - pos1;
	IF pos_len > 19 THEN
		SET out_str = REPLACE(out_str, '(', '|||');
		SET out_str = REPLACE(out_str, ')', '');
	END IF;
	RETURN out_str;
END;

/* Create structure for function `apitcomp`.`get_lanit_id` */
CREATE FUNCTION `get_lanit_id`( w_name VARCHAR ( 32 )) RETURNS varchar(32) CHARSET cp1251
    DETERMINISTIC
BEGIN
	DECLARE pos1 SMALLINT(2) DEFAULT 0;
	DECLARE pos2 SMALLINT(2) DEFAULT 0;
	DECLARE strlen SMALLINT(2) DEFAULT 0;
	DECLARE out_str VARCHAR ( 32 )  DEFAULT '';
	SET NAMES cp1251;
	SET out_str = w_name;
	SET pos1 = POSITION('#' IN out_str);
	SET pos2 = POSITION(':' IN out_str);
	SET strlen = CHAR_LENGTH(out_str);
	IF pos1 > 0 THEN
		SET out_str = SUBSTR(out_str,0,strlen - pos1);
	ELSEIF strlen > 18 AND pos2 > 0 THEN
		SET out_str = REPLACE(out_str,'-','');
        SET out_str = CONCAT(SUBSTR(out_str,0,6),'-',SUBSTR(out_str,6,6),'-',SUBSTR(out_str,12));
    END IF;    
	RETURN  out_str;
END;

/* Create structure for function `apitcomp`.`html_extract_param` */
CREATE FUNCTION `html_extract_param`(str_val text, param varchar(100), quote char(1)) RETURNS text CHARSET cp1251
    DETERMINISTIC
begin
    set @str_val = replace(replace(str_val, '\n', ' '), '\t', ' ');
	set @param = concat(' ', param, '=');
    set @start = locate(@param, @str_val) + length(param);
    if @start = length(param) then return NULL; end if;
    set @quotestart = locate(quote, @str_val, @start);
    set @tmp = substr(@str_val, locate(quote, @str_val, @quotestart) + 1);
    set @end = locate(quote, @tmp) - 1;
    return substr(str_val, @quotestart + 1, @end);
end;

/* Create structure for function `apitcomp`.`html_resolve_entities` */
CREATE FUNCTION `html_resolve_entities`(txt text) RETURNS text CHARSET utf8
    DETERMINISTIC
return replace(replace(replace(replace(replace(replace(txt, '&nbsp;', ' '), '&quot;', '"'), '&apos;', "'"), '&amp;', '&'), '&lt;', '<'), '&gt;', '>');

/* Create structure for function `apitcomp`.`html_strip_tags` */
CREATE FUNCTION `html_strip_tags`(str_val text, tag varchar(100)) RETURNS text CHARSET utf8
    DETERMINISTIC
begin
    set str_val = replace(str_val, concat('<', coalesce(tag, ''), '>'), '');
    set str_val = replace(str_val, concat('</', coalesce(tag, ''), '>'), '');
    set @tag = case when tag is NULL then '<' else concat('<', tag, ' ') end;
    set @str_val = replace(replace(replace(str_val, '\r', ' '), '\n', ' '), '\t', ' ');
    set @start = locate(@tag, @str_val);
    while @start > 0
    do
        set @tmp = substr(@str_val, @start + 1);
        set @end = locate('>', @tmp);
        if @end = 0 then set @end = @start + length(@tmp); end if;
        set str_val = concat(substr(str_val, 1, @start - 1), ' ', substr(str_val, @end + @start + 1));
        set @str_val = replace(replace(replace(str_val, '\r', ' '), '\n', ' '), '\t', ' ');
        set @start = locate(@tag, @str_val);
    end while;
    return str_val;
end;

/* Create structure for function `apitcomp`.`inc_perc` */
CREATE FUNCTION `inc_perc`(a decimal(6,4), b decimal(4,2)) RETURNS decimal(5,2)
    NO SQL
    DETERMINISTIC
BEGIN
	RETURN ROUND(a * (1+(b/100)),2);
END;

/* Create structure for function `apitcomp`.`item_has_details` */
CREATE FUNCTION `item_has_details`(item_id int) RETURNS char(1) CHARSET cp1251
    READS SQL DATA
begin
    return (coalesce(
            (select 'Y' from section_values where store_id = item_id limit 1),
            (select 'Y' from property_values where store_id = item_id limit 1),
            'N')); 
end;

/* Create structure for function `apitcomp`.`post_id_get` */
CREATE FUNCTION `post_id_get`( post_list VARCHAR ( 32 )) RETURNS int(6)
    DETERMINISTIC
BEGIN
	DECLARE pos1 SMALLINT(2) DEFAULT 0;
	DECLARE cnt SMALLINT(2) DEFAULT 0;
	DECLARE post_id INT(6);
	SET pos1 = 1 + POSITION('#' IN post_list);
	SET cnt = LOCATE(',',post_list, pos1);	
	CASE cnt
    	WHEN 0 THEN SET post_id = SUBSTRING(post_list, pos1);
        ELSE SET post_id = SUBSTRING(post_list, pos1,(cnt - pos1));
	END CASE;
	RETURN post_id;
END;

/* Create structure for function `apitcomp`.`strip_tags` */
CREATE FUNCTION `strip_tags`( x longtext) RETURNS longtext CHARSET utf8
    READS SQL DATA
BEGIN DECLARE sstart INT UNSIGNED; DECLARE ends INT UNSIGNED; SET sstart = LOCATE('<', x, 1); REPEAT SET ends = LOCATE('>', x, sstart); SET x = CONCAT(SUBSTRING( x, 1 ,sstart -1) ,SUBSTRING(x, ends +1 )) ; SET sstart = LOCATE('<', x, 1); UNTIL sstart < 1 END REPEAT; return x; END;

/* Create structure for function `apitcomp`.`substrCount` */
CREATE FUNCTION `substrCount`(x varchar(255), delim varchar(12)) RETURNS int(11)
    DETERMINISTIC
begin
return (length(x)-length(REPLACE(x, delim, '')))/length(delim);
end;

/* Create structure for function `apitcomp`.`top_parent` */
CREATE FUNCTION `top_parent`(cat_id int) RETURNS int(11)
    READS SQL DATA
begin
select parent into @parent from catalog where id = cat_id;
while (@parent != 0) do
set cat_id =  @parent;
select parent into @parent from catalog where id = cat_id;
end while;
return cat_id;
end;

/* Create structure for function `apitcomp`.`tst` */
CREATE FUNCTION `tst`(val text) RETURNS text CHARSET cp1251
    READS SQL DATA
begin
	return collation(val);
end;

/* Create structure for function `apitcomp`.`vc_from_name` */
CREATE FUNCTION `vc_from_name`(str_val VARCHAR(255)) RETURNS varchar(24) CHARSET utf8
    DETERMINISTIC
BEGIN
    SET @start = locate('&lt;', str_val) + 4;  
    SET @str = substr(str_val, @start, locate('&gt;', str_val) - @start);
    SET  @str = REPLACE (@str,'Black','');
    SET  @str = REPLACE (@str,'White','');
    SET  @str = REPLACE (@str,'Red','');
    SET  @str = REPLACE (@str,'Orange','');
    SET  @str = REPLACE (@str,'Pearl','');
    SET  @str = REPLACE (@str,'Blue','');
    SET  @str = REPLACE (@str,'Pink','');
    SET  @str = REPLACE (@str,'Silver','');
    SET  @str = REPLACE (@str,'Wine','');
    SET  @str = REPLACE (@str,'Bronze','');
    SET  @add = IF(RIGHT(@str,1) = '-',1,0);
    SET  @str = SUBSTR(@str , 1,LENGTH(@str)-@add);
    RETURN  @str;
END;

