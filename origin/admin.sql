/* Database structure `admin` */
DROP DATABASE IF EXISTS `admin`;

CREATE DATABASE IF NOT EXISTS `admin`;

/* Table structure for table `admin`.`user` */
CREATE TABLE IF NOT EXISTS `admin`. `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT 'anyous',
  `password` varchar(255) DEFAULT NULL,
  `database` varchar(255) NOT NULL DEFAULT 'user',
  `name` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `last_change` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

