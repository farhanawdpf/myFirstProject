use sms_1;

drop table if exists category;
CREATE TABLE category (
  id int(10) primary key auto_increment,
  name varchar(45) NOT NULL,
  info varchar(255) NOT NULL,
  date timestamp,
  user_id int(10) NOT NULL
);
INSERT INTO category(`id`, `name`, `info`, `date`, `user_id`) VALUES
(1, 'Clothing', 'All Clothing  item goods.', '2018-07-21 09:34:28', 1),
(2, 'Glossary', 'All Glossary  item goods.', '2018-07-21 09:35:20', 1),
(3, 'Leather', 'All Leather item goods.', '2018-07-21 09:35:34', 1),
(5, 'Medicine', 'All Medicine item goods.', '2018-07-21 09:36:13', 1),
(6, 'Foods', 'All Foods item goods.', '2018-07-21 09:36:29', 1),
(7, 'Library', 'All Library item goods.', '2018-07-21 09:36:41', 1),
(8, 'House Holds', 'All House holds item goods.', '2018-07-21 09:37:20', 1),
(9, 'Electronics ', 'All Electronics item goods.', '2018-07-21 09:37:34', 1);


drop table if exists manufacturer;
CREATE TABLE manufacturer (
  `id` int(10) primary key auto_increment,
  `name` varchar(45) NOT NULL,
  `info` varchar(255) NOT NULL,
  `date` timestamp,
  `user_id` int(10) NOT NULL
);
INSERT INTO `manufacturer` (`id`, `name`, `info`, `date`, `user_id`) VALUES
(1, 'Asus', 'Asus Technolgy ltd.', '2018-07-21 09:29:57', 1),
(2, 'TOSHIBA', 'Toshiba inc ltd Bangladesh.', '2018-07-21 09:30:50', 1),
(3, 'Lenovo', 'Lenovo Technology of Bangladesh.', '2018-07-21 09:31:18', 1),
(4, 'Apple', 'Apple inc ltd of Bangladesh.', '2018-07-21 09:31:47', 1),
(5, 'Samsung', 'Samsung Technology of Service and goods of Bangladesh.', '2018-07-21 09:32:15', 1),
(6, 'Philips', 'Philips technical supports of Bangladesh.', '2018-07-21 09:32:50', 1),
(7, 'Walton', 'Walton Hi-tech ltd of Bangladesh.', '2018-07-21 09:33:27', 1),
(9, 'Symphony', '', '2018-07-21 16:59:04', 1);


drop table if exists product;
CREATE TABLE product(
  `id` int(10) primary key auto_increment,
  `name` varchar(45) NOT NULL,
  `uom` varchar(20) DEFAULT NULL,
  `date` timestamp,
  `manufac_id` int(10) NOT NULL,
  `category_id` int(10) NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
);
INSERT INTO `product` (`id`, `name`, `uom`, `date`, `manufac_id`, `category_id`, `item_id`, `user_id`) VALUES
(4, 'Monitor', 'pcs', '2018-07-21 19:16:08', 5, 9, 4, 1),
(5, 'Power Bank', 'pcs', '2018-07-21 19:16:22', 6, 9, 4, 1),
(6, 'Mobile', 'pcs', '2018-07-21 19:16:37', 9, 9, 4, 1),
(7, 'Laptop', 'pcs', '2018-07-21 19:16:53', 3, 9, 4, 1),
(8, 'SSD Drive', 'pcs', '2018-07-21 19:17:10', 5, 9, 4, 1),
(9, 'USB Drive', 'pcs', '2018-07-21 19:17:19', 2, 9, 4, 1),
(10, 'Modem', 'pcs', '2018-07-21 19:17:36', 6, 9, 4, 1),
(11, 'USB', 'pcs', '2018-07-21 19:18:07', 4, 9, 4, 1),
(12, 'Zen-Book', 'pcs', '2018-07-21 19:18:20', 1, 9, 4, 1),
(14, 'Television', 'pcs', '2018-07-21 19:20:07', 7, 9, 4, 1),
(15, 'i-Phone', 'pcs', '2018-07-21 19:20:33', 4, 9, 4, 1);


drop table if exists purchase;
CREATE TABLE `purchase` (
  `id` int(10) primary key auto_increment,
  `uom` varchar(10) NOT NULL,
  `qty` double(12,2) NOT NULL,
  `price` double(12,2) NOT NULL,
  `product_id` int(11) NOT NULL,
  `p_inv_id` int(10) NOT NULL
);
INSERT INTO `purchase` (`id`, `uom`, `qty`, `price`, `product_id`, `p_inv_id`) VALUES
(1, 'pcs', 3.00, 2500.00, 4, 1),
(2, 'pcs', 5.00, 2500.00, 4, 2),
(3, 'pcs', 2.00, 2600.00, 4, 3),
(4, 'pcs', 5.00, 1000.00, 5, 4),
(5, 'pcs', 3.00, 48000.00, 7, 4),
(6, 'pcs', 2.00, 3500.00, 4, 5),
(7, 'pcs', 3.00, 650.00, 9, 5),
(8, 'pcs', 1.00, 1250.00, 5, 5),
(9, 'pcs', 1.00, 9200.00, 6, 5);

drop table if exists user;
CREATE TABLE `user` (
  `id` int(10) primary key auto_increment,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `date` datetime NOT NULL
);
INSERT INTO `user` (`id`, `username`, `password`, `email`, `date`) VALUES
(1, 'admin', 'admin', 'admin@email.com', '2018-07-09 08:15:05'),
(2, 'demo', 'demo', 'demo@email.com', '2018-07-09 08:15:05'),
(3, 'sumon', 'sumon', 'sumon@email.com', '2018-07-09 08:15:05');
