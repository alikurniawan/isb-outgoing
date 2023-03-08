CREATE DATABASE demo;
USE demo;

CREATE TABLE `customers` (
  `idcustomers` int(10) unsigned NOT NULL auto_increment,
  `name` char(32) default NULL,
  `city` char(32) default NULL,
  `file` int(10) unsigned default NULL,
  PRIMARY KEY  (`idcustomers`)
) TYPE=InnoDB;

INSERT INTO `customers` VALUES (1, 'Berkley & Sons', 'Paris', 4);
INSERT INTO `customers` VALUES (3, 'Frankie & Finley', 'London', 2);
INSERT INTO `customers` VALUES (4, 'Graham & Stevie', 'Moscow', 3);
INSERT INTO `customers` VALUES (5, 'Cliff Shoppers', 'Warsaw', 5);
INSERT INTO `customers` VALUES (6, 'Moons', 'Berlin', 11);
INSERT INTO `customers` VALUES (7, 'Municipal Library', 'Prague', 13);
INSERT INTO `customers` VALUES (8, 'Caffee Bee', 'Bratislava', 9);
INSERT INTO `customers` VALUES (9, 'DIY Maan', 'Budapest', 14);
INSERT INTO `customers` VALUES (10, 'Agness - Cheap Book', 'Vienna', 7);
INSERT INTO `customers` VALUES (12, 'Vet Rooms', 'Roma', 17);
INSERT INTO `customers` VALUES (13, 'Flowers of World', 'Ankara', 16);
INSERT INTO `customers` VALUES (15, 'Bakery of the City', 'Athenes', 10);
INSERT INTO `customers` VALUES (19, 'Kitchens & Furniture - Fellas', 'Liverpool', 20);
INSERT INTO `customers` VALUES (20, 'Victor - alternations', 'Leeds', 29);
INSERT INTO `customers` VALUES (21, 'Sport Goods', 'Bonn', 31);


CREATE TABLE `products` (
  `idproducts` int(10) unsigned NOT NULL auto_increment,
  `name` char(32) default NULL,
  `uprice` float default NULL,
  PRIMARY KEY  (`idproducts`)
) TYPE=InnoDB;

INSERT INTO `products` VALUES (1, 'apples', 12.30);
INSERT INTO `products` VALUES (2, 'bananas', 8.98);
INSERT INTO `products` VALUES (3, 'grapes',  6.22);
INSERT INTO `products` VALUES (4, 'pears',   2.99);
INSERT INTO `products` VALUES (5, 'oranges', 8.12);
INSERT INTO `products` VALUES (6, 'strawberries', 0.99);
INSERT INTO `products` VALUES (7, 'blackberries', 1.95);

CREATE TABLE `orders` (
  `idorders` int(10) unsigned NOT NULL auto_increment,
  `product` int(10) unsigned NOT NULL default '0',
  `customer` int(10) unsigned NOT NULL default '0',
  `odate` date default NULL,
  `qty` mediumint(8) unsigned default NULL,
  PRIMARY KEY  (`idorders`),
  KEY `orders_FKIndex1` (`customer`),
  KEY `orders_FKIndex2` (`product`),
  
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer`) REFERENCES `customers` (`idcustomers`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product`) REFERENCES `products` (`idproducts`) ON DELETE NO ACTION ON UPDATE NO ACTION
) TYPE=InnoDB;

INSERT INTO `orders` VALUES (1, 4, 10, '2004-08-22', 1);
INSERT INTO `orders` VALUES (4, 3, 1, '2004-08-20', 2);
INSERT INTO `orders` VALUES (5, 4, 13, '2004-08-02', 1);
INSERT INTO `orders` VALUES (6, 1, 4, '2004-08-10', 1);
INSERT INTO `orders` VALUES (8, 3, 3, '2004-08-03', 2);
INSERT INTO `orders` VALUES (9, 2, 3, '2004-08-03', 1);
INSERT INTO `orders` VALUES (10, 4, 3, '2004-08-03', 2);
INSERT INTO `orders` VALUES (11, 7, 3, '2004-08-23', 2);
INSERT INTO `orders` VALUES (12, 6, 9, '2004-08-20', 6);
INSERT INTO `orders` VALUES (13, 6, 5, '2004-08-06', 12);
INSERT INTO `orders` VALUES (14, 6, 8, '2004-08-17', 4);
