/* Database structure `site` */
DROP DATABASE IF EXISTS `site`;

CREATE DATABASE IF NOT EXISTS `site`;

/* Table structure for table `site`.`_prices` */
CREATE TABLE IF NOT EXISTS `site`. `_prices` (
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

/* Table structure for table `site`.`binded_menu` */
CREATE TABLE IF NOT EXISTS `site`. `binded_menu` (
  `r_id` int(10) unsigned NOT NULL,
  `r_level` smallint(5) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `id_level` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`r_id`,`id`),
  KEY `r_id` (`r_id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `site`.`binded_menu_source` */
CREATE TABLE IF NOT EXISTS `site`. `binded_menu_source` (
  `r_id` int(10) unsigned NOT NULL,
  `r_level` smallint(5) unsigned NOT NULL,
  `id` int(10) unsigned NOT NULL,
  `id_level` smallint(5) unsigned NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `site`.`catalog` */
CREATE TABLE IF NOT EXISTS `site`. `catalog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `root` int(11) unsigned NOT NULL DEFAULT '0',
  `order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `deleted` enum('Y','N') NOT NULL DEFAULT 'N',
  `type` enum('real','virt') NOT NULL DEFAULT 'real',
  `id_site` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `root` (`root`),
  KEY `order` (`order`),
  KEY `id_site` (`id_site`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='Разделы каталога';

/* Table structure for table `site`.`category_rule` */
CREATE TABLE IF NOT EXISTS `site`. `category_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `master_id` int(11) NOT NULL,
  `rule` blob,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`),
  KEY `master_id` (`master_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `site`.`markup_new` */
CREATE TABLE IF NOT EXISTS `site`. `markup_new` (
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

/* Table structure for table `site`.`price` */
CREATE TABLE IF NOT EXISTS `site`. `price` (
  `id` int(11) NOT NULL DEFAULT '0',
  `rozn` decimal(8,2) DEFAULT NULL,
  `opt` decimal(8,2) DEFAULT NULL,
  `av` int(11) DEFAULT NULL,
  `seller` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `site`.`showdictmain` */
CREATE TABLE IF NOT EXISTS `site`. `showdictmain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_rule_id` int(11) NOT NULL,
  `dict_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `prop_id` int(11) NOT NULL,
  `show` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dict_group_prop` (`dict_id`,`group_id`,`prop_id`),
  KEY `category_rule_id` (`category_rule_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `site`.`site_name` */
CREATE TABLE IF NOT EXISTS `site`. `site_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `url` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/* Table structure for table `site`.`site_products` */
CREATE TABLE IF NOT EXISTS `site`. `site_products` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) unsigned NOT NULL DEFAULT '0',
  `cat_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ware_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`site_id`,`cat_id`,`ware_id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `site`.`store_info` */
CREATE TABLE IF NOT EXISTS `site`. `store_info` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `catalog_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vendor_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pn` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `brand_id` int(10) unsigned NOT NULL DEFAULT '0',
  `model` varchar(60) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `analog` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`),
  KEY `rule_id` (`rule_id`),
  KEY `vendor_id` (`vendor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Основные характеристики товара';

/* Table structure for table `site`.`supplier_markup` */
CREATE TABLE IF NOT EXISTS `site`. `supplier_markup` (
  `id` int(11) unsigned NOT NULL,
  `action` enum('Y','N') DEFAULT 'N',
  `markup` float(4,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `site`.`ya_list` */
CREATE TABLE IF NOT EXISTS `site`. `ya_list` (
  `field` int(10) unsigned NOT NULL,
  `key` enum('D','W') NOT NULL,
  PRIMARY KEY (`field`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `site`.`ya_list_exclude` */
CREATE TABLE IF NOT EXISTS `site`. `ya_list_exclude` (
  `field` int(10) unsigned NOT NULL,
  `key` enum('D','W') NOT NULL,
  PRIMARY KEY (`field`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `site`.`ya_markup` */
CREATE TABLE IF NOT EXISTS `site`. `ya_markup` (
  `id` int(10) unsigned NOT NULL,
  `value` decimal(4,2) DEFAULT NULL,
  `type` enum('EUR','RUR','USD','PROC') CHARACTER SET utf8 NOT NULL DEFAULT 'PROC',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Create structure for procedure `site`.`menu_rebild` */
CREATE PROCEDURE `menu_rebild`(IN root_in int, IN level_in tinyint)
BEGIN
            DECLARE rt,lvl,lvlplus,f_id,done INT DEFAULT 0;
            DECLARE rCur CURSOR FOR SELECT `id` FROM `site`.`catalog` WHERE `root` = rt;
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
                     INSERT INTO `site`.binded_menu_source SET `r_id` = rt,`r_level` = lvl,id = f_id,id_level = lvlplus;
                     INSERT INTO `site`.binded_menu_source SELECT r_id,r_level,f_id,lvlplus FROM `site`.binded_menu_source WHERE `id` = rt;
                     CALL menu_rebild(f_id,lvlplus);
                  END IF;
               END IF;
            END WHILE;
            CLOSE rCur;
         END;

/* Create structure for procedure `site`.`rebuild_menu_tree` */
CREATE PROCEDURE `rebuild_menu_tree`()
BEGIN
            SET max_sp_recursion_depth = 10;	
            CALL menu_rebild(0,0);
            DELETE FROM `site`.binded_menu;
            INSERT INTO `site`.binded_menu SELECT DISTINCT * FROM `site`.binded_menu_source;
            DELETE FROM `site`.binded_menu_source;
         END;

/* Create structure for trigger rebuild_menu1 */
CREATE TRIGGER rebuild_menu1 AFTER INSERT ON catalog FOR EACH ROW CALL rebuild_menu_tree();

/* Create structure for trigger rebuild_menu2 */
CREATE TRIGGER rebuild_menu2 AFTER UPDATE ON catalog FOR EACH ROW CALL rebuild_menu_tree();

/* Create structure for trigger rebuild_menu3 */
CREATE TRIGGER rebuild_menu3 AFTER DELETE ON catalog FOR EACH ROW CALL rebuild_menu_tree();

