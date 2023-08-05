

CREATE DATABASE IF NOT EXISTS angular_project;
USE angular_project;

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`,`name`) VALUES 
 (1,'Home'),
 (2,'Plants'),
 (3,'Cakes');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `qty` double NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;


/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` (`id`,`order_id`,`item_id`,`qty`,`price`) VALUES 
 (1,1,1,1,10),
 (2,1,4,1,6),
 (3,2,1,1,10),
 (4,2,2,1,5),
 (5,2,4,4,6),
 (6,2,5,2,2),
 (7,3,2,4,5),
 (8,3,5,3,2),
 (9,3,1,5,10),
 (10,4,2,2,5),
 (11,4,4,2,6);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;


DROP TABLE IF EXISTS `order_master`;
CREATE TABLE `order_master` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) NOT NULL,
  `shipping_address` text,
  `remark` text,
  `order_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payment_method` varchar(20) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


/*!40000 ALTER TABLE `order_master` DISABLE KEYS */;
INSERT INTO `order_master` (`id`,`customer_name`,`shipping_address`,`remark`,`order_datetime`,`payment_method`,`email`) VALUES 
 (1,'Samiha Islam','Australia','test','2017-12-11 15:42:04','VISA Card',NULL),
 (2,'Jahidul Islam','Rampura','test','2017-12-11 15:44:42','Master Card',NULL),
 (3,'Ruhul Amin','Mohammadpur','test','2017-12-11 16:12:37','Cupon',NULL),
 (4,'Mizanur Rahman','Dhanmondi','Test','2017-12-11 16:30:55','Master Card',NULL);



DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photo` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `new_price` double NOT NULL,
  `old_price` double NOT NULL,
  `uom` varchar(45) NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;


/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`photo`,`name`,`new_price`,`old_price`,`uom`,`category_id`) VALUES 
 ('Birthday Dish Garden.png','Birthday Dish Garden',740,844.99,'piece',2),
 ('Delightfully Pink.png','Delightfully Pink',1600,1737,'piece',2),
 ('Bonsai Gardenia Plant.png','Bonsai Gardenia Plant',1367,1777,'piece',2),
 ('Classic Peach Lily.png','Classic Peach Lily',1200,1370,'piece',2),
 ('Rustically Charming Windowbox Garden.png','Rustically Charming Windowbox Garden',3452,3740,'piece',2),
 ('Whimsical Pink Delight.png','Whimsical Pink Delight',1232,1440,'piece',2),
  ('Bonshai.png','Bonshai',3432,3540,'piece',2),
 ('Stunning Lily Bouquet.png','Stunning Lily Bouquet',3000,3400,'piece',2),
 
 
 ('Black Forest, Choco Vanilla .png','Black Forest, Choco Vanilla',5000,5560,'piece',3),
 ('Rich Chocolaty Truffle with Fruits.png','Rich Chocolaty Truffle with Fruits',3070,3450,'piece',3),
 ('RICH CHOCOLATY CAKE WITH REAL FRUITS.png','RICH CHOCOLATY CAKE WITH REAL FRUITS',30440,4100,'piece',3),
 ('Blueberry.png','Blueberry',2000,2770,'kg',3),
  ('Choco Orange.png','Choco Orange',1700,1840,'piece',3),
 ('cake4.png','Choco Orange',1500,1840,'piece',3),
 ('Choco Orange.png','Choco Orange',2000,2140,'piece',3),
('cake1.png','Black Forest',2300,2560,'piece',3),
('cake3.png','Choco Black',1220,1340,'piece',3),
 
 
 
 ('Birthday Teddy.png','Birthday Teddy',2000,2400,'piece',1),
 ('Black Teddy.png','Black Teddy',3000,3100,'piece',1),
 ('Cuty Teddy.png','Cuty Teddy',3100,3240,'piece',1),
 ('Lovely Teddy.png','Lovely Teddy',3350,3450,'piece',1),
 ('Teddy-Bear.png','Teddy Bear',4000,4670,'piece',1),
 ('Teddy-Bear1.png','Teddy-Bear1',3000,3500,'piece',1),
 ('Birthday Teddy.png','Birthday Teddy',30,40,'piece',1);
 



DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`,`name`) VALUES 
 (2,'Admin'),
 (3,'User');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;



DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;


INSERT INTO `user` (`id`,`username`,`password`,`inactive`,`role_id`) VALUES 
 (5,'rony','21232f297a57a5a743894a0e4a801fc3',0,2),
 (10,'Jahid','96e79218965eb72c92a549dd5a330112',0,3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
