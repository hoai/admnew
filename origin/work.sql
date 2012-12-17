/* Database structure `work` */
DROP DATABASE IF EXISTS `work`;

CREATE DATABASE IF NOT EXISTS `work`;

/* Table structure for table `work`.`cats` */
CREATE TABLE IF NOT EXISTS `work`. `cats` (
  `id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `root_id` int(11) unsigned DEFAULT NULL,
  `ord` smallint(5) unsigned DEFAULT NULL,
  `act` enum('Y','N') DEFAULT NULL,
  `exist` enum('Y','N') DEFAULT NULL,
  `vendor` int(11) unsigned DEFAULT NULL,
  `to_cat` int(11) unsigned DEFAULT NULL,
  `pn_rule` enum('Y','N') DEFAULT NULL,
  `supplier` int(11) unsigned DEFAULT NULL,
  `last_change` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

/* Table structure for table `work`.`compare` */
CREATE TABLE IF NOT EXISTS `work`. `compare` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `p_id` smallint(2) unsigned NOT NULL DEFAULT '0',
  `w_id` varchar(24) NOT NULL DEFAULT '',
  PRIMARY KEY (`w_id`,`p_id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `work`.`file` */
CREATE TABLE IF NOT EXISTS `work`. `file` (
  `id` smallint(2) NOT NULL AUTO_INCREMENT,
  `supplier_id` smallint(2) NOT NULL,
  `gettype` enum('h','s','e','m') NOT NULL DEFAULT 'm',
  `ifauth` enum('Y','N') NOT NULL DEFAULT 'N',
  `auth_uri` varchar(128) DEFAULT NULL,
  `auth_query` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `refresh` enum('h','d','w') DEFAULT NULL,
  `arj` enum('x','z','r','m','c','h','u') DEFAULT 'x',
  `rule_sbj` varchar(16) DEFAULT NULL,
  `rule_file` varchar(32) DEFAULT NULL,
  `rule_file_deny` varchar(32) DEFAULT NULL,
  `check_name` enum('Y','N') NOT NULL DEFAULT 'N',
  `auth_type` enum('W','H') DEFAULT NULL,
  `http_login` varchar(255) NOT NULL,
  `http_pass` varchar(255) NOT NULL,
  `filetype` enum('p','s') NOT NULL DEFAULT 'p',
  `arch_type` enum('x','z','r','m','c','h','u') DEFAULT 'x',
  `value_type` enum('u','e','r') NOT NULL DEFAULT 'u',
  `availability` varchar(16) DEFAULT NULL,
  `sign` varchar(16) DEFAULT NULL,
  `combine` char(6) DEFAULT NULL,
  PRIMARY KEY (`id`,`supplier_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `work`.`file_custom_load` */
CREATE TABLE IF NOT EXISTS `work`. `file_custom_load` (
  `file_id` int(11) NOT NULL,
  `key` varchar(16) NOT NULL,
  `val` text NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  KEY `file_id` (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `work`.`file_stat` */
CREATE TABLE IF NOT EXISTS `work`. `file_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `csv_file` varchar(255) NOT NULL,
  `stat` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ;

/* Table structure for table `work`.`flt_field_custom_sep` */
CREATE TABLE IF NOT EXISTS `work`. `flt_field_custom_sep` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_catalog_id` int(11) NOT NULL,
  `separator` varchar(255) NOT NULL,
  `glue` enum('L','R','S') DEFAULT NULL,
  `count` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `work`.`flt_field_separator` */
CREATE TABLE IF NOT EXISTS `work`. `flt_field_separator` (
  `supplier_catalog_id` int(4) NOT NULL,
  `separator` char(1) NOT NULL,
  `freq` int(4) NOT NULL,
  `percent` decimal(4,1) NOT NULL,
  `action` enum('Y','N') DEFAULT NULL,
  `purpose` smallint(2) DEFAULT NULL,
  `date_of_change` datetime DEFAULT NULL,
  PRIMARY KEY (`supplier_catalog_id`,`separator`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `work`.`logs` */
CREATE TABLE IF NOT EXISTS `work`. `logs` (
  `id` smallint(6) NOT NULL,
  `rows` smallint(6) DEFAULT NULL,
  `info` text,
  `dt` datetime DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `work`.`nix_img` */
CREATE TABLE IF NOT EXISTS `work`. `nix_img` (
  `id` int(11) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`,`img`),
  KEY `img` (`img`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/* Table structure for table `work`.`nix_prefix` */
CREATE TABLE IF NOT EXISTS `work`. `nix_prefix` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `search` varchar(255) NOT NULL,
  `insert` varchar(255) DEFAULT NULL,
  `delete` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `work`.`nixcat_rule` */
CREATE TABLE IF NOT EXISTS `work`. `nixcat_rule` (
  `id` int(11) NOT NULL,
  `type` enum('r','l') NOT NULL DEFAULT 'l',
  `rule` varchar(255) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `work`.`sheet` */
CREATE TABLE IF NOT EXISTS `work`. `sheet` (
  `file_id` smallint(3) NOT NULL,
  `ord` smallint(2) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pattern_id` int(11) DEFAULT NULL,
  `pattern` varchar(255) NOT NULL,
  `true_val` varchar(128) DEFAULT NULL,
  `add_name` enum('Y','N') NOT NULL DEFAULT 'N',
  `start_row` tinyint(2) NOT NULL DEFAULT '0',
  `cur` enum('u','r','e') NOT NULL DEFAULT 'u',
  `search_vnd` enum('Y','N') NOT NULL DEFAULT 'N',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `pattern_id` (`pattern_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251;

/* Table structure for table `work`.`sheet_pattern` */
CREATE TABLE IF NOT EXISTS `work`. `sheet_pattern` (
  `pattern_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `column_number` int(11) NOT NULL,
  `column_name` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `pattern_id` (`pattern_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251 ;

/* Table structure for table `work`.`sheet_pattern_link` */
CREATE TABLE IF NOT EXISTS `work`. `sheet_pattern_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251 ;

/* Table structure for table `work`.`sheet_type` */
CREATE TABLE IF NOT EXISTS `work`. `sheet_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=cp1251 ;

/* Table structure for table `work`.`wares` */
CREATE TABLE IF NOT EXISTS `work`. `wares` (
  `id` varchar(24) NOT NULL DEFAULT '',
  `p_id` int(11) NOT NULL DEFAULT '0',
  `f_id` int(11) DEFAULT NULL,
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
  KEY `our_id` (`our_id`),
  KEY `f_id` (`f_id`),
  KEY `id` (`id`),
  KEY `p_id` (`p_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `work`.`ya` */
CREATE TABLE IF NOT EXISTS `work`. `ya` (
  `id` int(6) unsigned NOT NULL,
  `ya_max` int(6) DEFAULT NULL,
  `ya_avg` int(6) DEFAULT NULL,
  `ya_min` decimal(8,2) DEFAULT NULL,
  `ya_arr` varchar(255) DEFAULT NULL,
  `dt` date NOT NULL,
  `catalog_id` int(10) unsigned NOT NULL,
  `top10` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251  ;

/* Table structure for table `work`.`ya_list` */
CREATE TABLE IF NOT EXISTS `work`. `ya_list` (
  `field` int(10) unsigned NOT NULL,
  `key` enum('D','W') NOT NULL,
  PRIMARY KEY (`field`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Table structure for table `work`.`ya_list_exclude` */
CREATE TABLE IF NOT EXISTS `work`. `ya_list_exclude` (
  `field` int(10) unsigned NOT NULL,
  `key` enum('D','W') NOT NULL,
  PRIMARY KEY (`field`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

/* Create structure for procedure `work`.`addFile` */
CREATE PROCEDURE `addFile`(IN _id MEDIUMINT, IN sel_id SMALLINT, IN tp ENUM('h','s','e','m'), IN auth ENUM('Y','N'), IN authUri VARCHAR(128), IN authQuery VARCHAR(255), IN lnk VARCHAR(255), IN refr ENUM('H','D','W'), IN arj ENUM('z','r','u'), IN r_sbj VARCHAR(16), IN r_file VARCHAR(16), IN ch_nm ENUM('Y','N'))
BEGIN
   INSERT INTO `file` VALUES (_id,sel_id,tp,auth,authUri,authQuery,lnk,refr,arj,r_sbj,r_file,ch_nm) 
   ON DUPLICATE KEY UPDATE 
		`gettype` = VALUES(`gettype`),
		`ifauth` = VALUES(`ifauth`), 
		`auth_uri` = VALUES(`auth_uri`), 
		`auth_query` = VALUES(`auth_query`), 
		`link` = VALUES(`link`),
        `refresh` = VALUES(`refresh`),
        `arj` = VALUES(`arj`),
        `rule_sbj` = VALUES(`rule_sbj`),
        `rule_file` = VALUES(`rule_file`),
        `check_name` = VALUES(`check_name`);
	SELECT LAST_INSERT_ID() as _last;
END;

/* Create structure for procedure `work`.`addSheet` */
CREATE PROCEDURE `addSheet`(IN f_id SMALLINT, IN _ord SMALLINT, IN _ptt VARCHAR(200), IN _tv VARCHAR(128), IN _add ENUM('Y','N'), IN _start TINYINT(2), IN _cur ENUM('u','r','e'))
    READS SQL DATA
BEGIN
   INSERT INTO `sheet`
   (`file_id`,`ord`,`pattern`,`true_val`,`add_name`,`start_row`,`cur`)
   VALUES(f_id,_ord,_ptt,_tv,_add,_start,_cur)
    ON DUPLICATE KEY UPDATE
   `pattern` = VALUES(`pattern`),
   `true_val` = VALUES(`true_val`),
   `add_name` = VALUES(`add_name`),
   `start_row` = VALUES(`start_row`),
   `cur` = VALUES(`cur`);
END;

/* Create structure for procedure `work`.`clearLog` */
CREATE PROCEDURE `clearLog`(IN f_id int)
BEGIN
	DELETE FROM  `logs` WHERE `id` = f_id;
    INSERT  `logs`  SET `id` = f_id,`rows`=0,`info` = '',`dt`=NOW();
END;

/* Create structure for procedure `work`.`delSheet_by_id` */
CREATE PROCEDURE `delSheet_by_id`(IN _id SMALLINT(3), IN _ord SMALLINT(2))
    DETERMINISTIC
BEGIN
   DELETE FROM `sheet` WHERE `file_id` = _id AND `ord` = _ord;
END;

/* Create structure for procedure `work`.`delSupplier` */
CREATE PROCEDURE `delSupplier`(IN sup INT(11))
    DETERMINISTIC
BEGIN
   	DELETE FROM `work`.`sheet`,`work`.`file` USING `work`.`sheet`,`work`.`file` WHERE `work`.`file`.`supplier_id` = sup AND `work`.`sheet`.`file_id` = `work`.`file`.`id`;
	DELETE FROM `work`.`supplier` WHERE `id` = sup;
	DELETE FROM `work`.`wares` WHERE `p_id` = sup;
DELETE FROM `work`.`compare` WHERE `p_id` = sup;
END;

/* Create structure for procedure `work`.`fileID_by_mail` */
CREATE PROCEDURE `fileID_by_mail`( IN _mail VARCHAR ( 32 ))
    READS SQL DATA
    DETERMINISTIC
BEGIN
	SELECT f.`id`, s.`id` AS s_id, s.`alias` AS s_name, rule_sbj, rule_file, f.`check_name`
	FROM `file` f
	JOIN `supplier` s ON s.`id` = f.`supplier_id`
	WHERE f.`link` LIKE CONCAT('%',_mail,'%') AND s.`freeze` = 'N';
END;

/* Create structure for procedure `work`.`file_by_id` */
CREATE PROCEDURE `file_by_id`( iN _id MEDIUMINT)
BEGIN
      SELECT  `gettype`,`ifauth`,`auth_uri`,`auth_query`,`link`,
      `refresh`,`arj`,`rule_sbj`,`rule_file`,`check_name`
      FROM `file` WHERE `id` = _id;
END;

/* Create structure for procedure `work`.`getFIleInfo` */
CREATE PROCEDURE `getFIleInfo`( IN _id SMALLINT)
BEGIN
   SELECT f.`gettype` , f.`ifauth` , f.`auth_uri` , f.`auth_query` , f.`link` , f.`refresh` , f.`arj` , s.`id` AS s_id, s.`alias` AS s_name, f.`check_name`
	FROM `file` f
	JOIN `supplier` s ON s.`id` = f.`supplier_id`
	WHERE f.id =_id;
END;

/* Create structure for procedure `work`.`insWare` */
CREATE PROCEDURE `insWare`(IN _id VARCHAR(24), IN s_id SMALLINT, IN _pn VARCHAR(32), IN _our_id MEDIUMINT, IN _name VARCHAR(255), IN _rozn DECIMAL(8,2), IN _opt DECIMAL(8,2), IN _zak DECIMAL(8,2), IN _sklad CHAR(10), IN _tr VARCHAR(48), iN _cur ENUM('u','r','e'))
BEGIN
   REPLACE INTO work.`wares` 
   SET
   `id`=_id,
   `p_id`=s_id,
   `vendor_code`=_pn,
   `our_id`=_our_id,
   `ware`=_name,
   `rozn`=_rozn,
   `opt`=_opt,
   `zak`=_zak,
   `av`=_sklad,
   `transit`=_tr,
   `currency`=_cur;
END;

/* Create structure for procedure `work`.`mergeDouble` */
CREATE PROCEDURE `mergeDouble`(IN `from` integer(11), IN `to` integer(11))
BEGIN
   UPDATE `work`.`compare` SET `id` = `to` WHERE id = `from`;
   CALL apitcomp.del_by_id(`from`);
END;

/* Create structure for procedure `work`.`seller` */
CREATE PROCEDURE `seller`(IN id int, IN nm varchar(28), IN alias varchar(16), IN k_w smallint(2), IN k_d smallint(2), IN cont varchar(255), IN color char(1), IN delay char(1), IN frz char(1))
INSERT INTO `supplier` VALUES (id,nm,alias,k_w,k_d,cont,color,delay,frz) ON DUPLICATE KEY UPDATE 
		`name` = VALUES(`name`),
		`alias` = VALUES(`alias`), 
		`k_weight` = VALUES(`k_weight`), 
		`k_dist` = VALUES(`k_dist`), 
		`contact` = VALUES(`contact`),
`color` = VALUES(`color`), 
`delay` = VALUES(`delay`),
`freeze` = VALUES(`freeze`);

/* Create structure for procedure `work`.`seller_by_id` */
CREATE PROCEDURE `seller_by_id`( IN _id SMALLINT)
BEGIN
    SELECT `name`,`alias`,`k_weight`,`k_dist`,`contact`,`color`,`delay` FROM `supplier` WHERE `id` = _id;
END;

/* Create structure for procedure `work`.`seller_list` */
CREATE PROCEDURE `seller_list`()
BEGIN
    SELECT s.`id`,s.`name`,f.`id` as f_id,f.`gettype`,f.`ifauth`,f.`refresh`,l.`rows`,l.`info`,l.`dt`,s.`color`
    FROM `supplier` s
    LEFT JOIN `file` f ON f.`supplier_id` = s.`id`
    LEFT JOIN `logs` l ON l.`id` = f.`id`
    ORDER BY l.`dt` DESC;
END;

/* Create structure for procedure `work`.`setLogI` */
CREATE PROCEDURE `setLogI`(IN f_id SMALLINT(3), IN _i TEXT)
    DETERMINISTIC
BEGIN
	UPDATE `logs` SET `info` = CONCAT(`info`,_i) WHERE `id` = f_id;
END;

/* Create structure for procedure `work`.`setLogQ` */
CREATE PROCEDURE `setLogQ`( IN f_id SMALLINT , IN _q SMALLINT)
    DETERMINISTIC
BEGIN
  UPDATE `logs` SET `rows` = `rows` + _q  WHERE `id` = f_id;
END;

/* Create structure for procedure `work`.`sheetsInFile` */
CREATE PROCEDURE `sheetsInFile`( iN f_id SMALLINT)
BEGIN
    SELECT `ord`,`name`,`pattern`,`true_val`,`add_name`,`start_row`,`cur` FROM `sheet` WHERE `file_id` = f_id;
END;

/* Create structure for procedure `work`.`updSheetName` */
CREATE PROCEDURE `updSheetName`(IN f_id SMALLINT, IN _ord SMALLINT, IN _nm vARCHAR(32))
BEGIN
	UPDATE `sheet` SET `name` = _nm WHERE `file_id` = f_id AND `ord` = _ord;
END;

/* Create structure for function `work`.`clear_trash` */
CREATE FUNCTION `clear_trash`(txt varchar(255), repl varchar(255)) RETURNS varchar(255) CHARSET cp1251
    DETERMINISTIC
BEGIN
DECLARE t TEXT DEFAULT '';
DECLARE c TEXT DEFAULT '';
DECLARE d TEXT DEFAULT '';
DECLARE pos INT DEFAULT 0;
SET t = txt;
SET d = TRIM(BOTH ';' FROM repl);

REPEAT
	SET pos = LOCATE(';',d);
	IF pos > 0 THEN 
		SET c = SUBSTR(d, 1 ,pos - 1);
		SET d = SUBSTR(d, pos + 1);
		SET t = REPLACE(REPLACE(t, c, ''),'  ',' ');
	ELSE
		SET t = REPLACE(REPLACE(t, d, ''),'  ',' ');
	END IF;	
UNTIL pos = 0 END REPEAT;

RETURN t;
END;

/* Create structure for function `work`.`get_PN_position` */
CREATE FUNCTION `get_PN_position`(pn VARCHAR (24), name VARCHAR ( 255 )) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
					DECLARE pos SMALLINT(2) DEFAULT 0;
					DECLARE halflen SMALLINT(2) DEFAULT 0;
					DECLARE outN TINYINT (1)  DEFAULT 0;
					SET NAMES cp1251;
					SET pos = POSITION( pn IN name);
					SET halflen = CHAR_LENGTH(name) / 2;
					IF pos = 0 THEN
						SET outN = 0;
					ELSEIF pos > halflen THEN
						SET outN = -1;
					ELSEIF pos < halflen THEN
						SET outN = 1;
					END IF;    
					RETURN  outN;
				END;

/* Create structure for function `work`.`html_resolve_entities` */
CREATE FUNCTION `html_resolve_entities`(`txt` TEXT) RETURNS text CHARSET cp1251
    DETERMINISTIC
return 
	replace(
		replace(
			replace(
				replace(
					replace(
						replace(
                                                	replace(
								replace(txt, '&nbsp;', ' '),
                                                        '&#039;', '\''),
						'&quot;', '"'),
					'&apos;', "'"),
				'&amp;', '&'),
			'&lt;', '<'),
		'&gt;', '>'),
	'<br />',' ');

/* Create structure for function `work`.`html_strip_tags` */
CREATE FUNCTION `html_strip_tags`(str_val text, tag varchar(100)) RETURNS text CHARSET cp1251
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

/* Create structure for function `work`.`zone_count` */
CREATE FUNCTION `zone_count`(txt varchar(255), sepp SET('!','@','#','$','%','^','&','*','(',')','_','+','~','`','-','=','|','}','{','\\',']','[',':',';','\'','"','<','>','/','.'),
comma char(1),space char(1),repl varchar(64)) RETURNS int(2)
    NO SQL
    DETERMINISTIC
    COMMENT 'return int number of counted zones splited by list of separators'
BEGIN
DECLARE cm TEXT DEFAULT '';
DECLARE t TEXT DEFAULT '';
DECLARE s TEXT DEFAULT '';
DECLARE sp TEXT DEFAULT '';
DECLARE lt TEXT DEFAULT '';
DECLARE zc INT DEFAULT 1;
DECLARE c1 INT DEFAULT 0;
DECLARE t_len INT DEFAULT 0;
DECLARE prev INT DEFAULT 0;

SET s = sepp;
SET t = html_resolve_entities(txt);
IF LENGTH(repl) > 0 THEN SET t = clear_trash(t,repl);
END IF;

SET t_len = LENGTH(txt);
SET cm = comma;
SET sp = space;
WHILE t_len > 0
	DO 
		SET c1 = c1 + 1;
		SET lt = LEFT(t,1);
		SET t = SUBSTR(t,2);
		SET t_len := LENGTH(t);
			IF((cm = 'Y' AND lt = ',') OR (sp = 'Y' AND lt = ' ') OR FIND_IN_SET(lt,s) > 0) THEN 
   			IF((prev != (c1 - 1)) AND (t_len > 1 AND c1 > 1)) THEN
					SET zc = zc + 1;
				END IF;
				SET prev = c1;
			END IF;
END WHILE;
RETURN zc;

END;

/* Create structure for function `work`.`zone_count1` */
CREATE FUNCTION `zone_count1`(txt varchar(255), sepp SET('!','@','#','$','%','^','&','*','(',')','_','+','~','`','-','=','|','}','{','\\',']','[',':',';','\'','"','<','>','/',' ','.'),
comma char(1)) RETURNS varchar(255) CHARSET cp1251
    NO SQL
    DETERMINISTIC
BEGIN
DECLARE cm TEXT DEFAULT '';
DECLARE t TEXT DEFAULT '';
DECLARE s TEXT DEFAULT '';
DECLARE lt TEXT DEFAULT '';
DECLARE zc INT DEFAULT 1;
DECLARE c1 INT DEFAULT 0;
DECLARE t_len INT DEFAULT 0;
DECLARE prev INT DEFAULT 0;

SET s = sepp;
SET t = html_resolve_entities(txt);
SET @tt := t;
SET t_len = LENGTH(txt);
SET cm = comma;
WHILE t_len > 0
	DO 
		SET c1 = c1 + 1;
		SET lt = LEFT(t,1);
		SET t = SUBSTR(t,2);
		SET t_len := LENGTH(t);
			IF((cm = 'Y' AND lt = ',') OR FIND_IN_SET(lt,s) > 0) THEN 
   			IF((prev != (c1 - 1)) AND (t_len > 1 AND c1 > 1)) THEN
					SET zc = zc + 1;
				END IF;
				SET prev = c1;
			END IF;
END WHILE;
RETURN CONCAT_WS('_',@tt,zc);

END;

