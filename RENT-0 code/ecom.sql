SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--


CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(16) NOT NULL,
  `email` varchar(35) NULL,
  `address` varchar(300) NULL,
  `contact` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--



-- --------------------------------------------------------

--
-- Table structure for table `products`
--


CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `category` varchar(30) NOT NULL,
  `image1` varchar(100) NOT NULL,
  `image2` varchar(100) NOT NULL,
  `image3` varchar(100) NOT NULL,
  `image4` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--


-- --------------------------------------------------------

--
-- Table structure for table `orders`
--


CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cur_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rate` int(50) NOT NULL,
  `qty` int(50) NOT NULL,
  `amount` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

--INSERT INTO `orders` (`id`, `customer_id`, `address`, `date`,  `total`, `status`) VALUES
--(1, 1, 'Address 2',  '2017-03-28 17:32:41',  150, 'Yet to be delivered');
-- --------------------------------------------------------

--
-- Table structure for table `tracking_orders`
--


CREATE TABLE `tracking_orders` (
  `order_id` int(50) NOT NULL,
  `status` varchar(25) NOT NULL DEFAULT 'ORDER PLACED'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tracking_orders`
--

--INSERT INTO `tracking_orders` (`order_id`, `customer_id`, `status`) VALUES
--(1, 1, 'Address 2',  '2017-03-28 17:32:41',  150, 'Yet to be delivered');
--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `rate` int(50) NOT NULL,
  `quantity` int(50) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

--INSERT INTO `order_details` (`id`, `order_id`, `item_id`, `quantity`, `price`) VALUES
--(1, 1, 1, 2, 90);


--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`product_id`,`customer_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `tracking orders`
--
ALTER TABLE `tracking_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_id` (`order_id`);
--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `user_id` (`user_id`);


 --
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1111;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1111;

-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1111;
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`user_id`) 
  ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) 
  ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `tracking_orders`
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) 
   ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) 
   ON DELETE CASCADE ON UPDATE CASCADE;


INSERT INTO `product` (`name`, `price`,`description`,`category` ,`image1`,`image2`,`image3`,`image4`) VALUES
('Beat Headphones', 8000,'Beats Studio3 Wireless Headphones - Beats Camo Collection - Sand Dune','Electronics','beat3.jpg','beat1.jpg','beat3.jpg','beat.jpg');

INSERT INTO `product` (`name`, `price`,`description`,`category` ,`image1`,`image2`,`image3`,`image4`) VALUES
('Round Neck T-Shirt',800,'StylePick Maroon Navy White Cotton Round Neck Tshirt for Women','Clothing','hoodie1.jpg','hoodie1.jpg','hoodie2.jpg','hoodie1.jpg');


INSERT INTO `product` (`name`, `price`,`description`,`category` ,`image1`,`image2`,`image3`,`image4`) VALUES
('Striped T-Shirt',600,'Fabricorn White Black Striped with Yellow Pocket Cotton Tshirt for Women','Clothing','striped.jpg','striped1.jpg','striped1.jpg','striped.jpg');

INSERT INTO `product` (`name`, `price`,`description`,`category` ,`image1`,`image2`,`image3`,`image4`) VALUES
('I-Phone Xs',70000,'Apple iPhone Xs Max (64GB) - Gold','Electronics','phone.jpg','phone1.jpg','phone2.jpg','phone2.jpg');

INSERT INTO `product` (`name`, `price`,`description`,`category` ,`image1`,`image2`,`image3`,`image4`) VALUES
('BackPack',2000,'Wildcraft 35 Ltrs Black and Mel Backpack','Accessories','bag1.jpg','bag1.jpg','bag2.jpg','bag1.jpg');

INSERT INTO `product` (`name`, `price`,`description`,`category` ,`image1`,`image2`,`image3`,`image4`) VALUES
('Groceries',500,'Dussle Dorf Large Heavy Duty Waterproof Shopping Bags with Groceries','Food','food1.jpg','food3.jpg','food2.jpg','food1.jpg');

INSERT INTO `product` (`name`, `price`,`description`,`category` ,`image1`,`image2`,`image3`,`image4`) VALUES
('Footwear',2000,'Ethics Mens Ultra Lite Mesh Casual Sports Shoes for Mens','Accessories','shoe.jpg','shoe1.jpg','shoe2.jpg','shoe.jpg');

INSERT INTO `product` (`name`, `price`,`description`,`category` ,`image1`,`image2`,`image3`,`image4`) VALUES
('Apple Watch', 13000,'Soft Leather Watch Bands Compatible with Apple Watch Band','Electronics','applewatch1.jpg','applewatch.jpg','applewatch3.jpg','applewatch1.jpg');

INSERT INTO `product` (`name`, `price`,`description`,`category` ,`image1`,`image2`,`image3`,`image4`) VALUES
('Casual T-shirt', 700,'Fabula Womens Cotton T-Shirt ','Clothing','tshirt1.jpg','tshirt3.jpg','tshirt2.jpg','tshirt1.jpg');









--insert into `users` ( `name`, `username`, `password`, `email`, `address`, `contact`) VALUES
--('suhail','sr','1234','s@gmail.com','1869 1st floor',7760559230);
--INSERT INTO `product` (`name`, `price`,`category` ,`image1`,`image2`,`image3`,`image4`) VALUES
--('Watch', 325,'electronics','electronic3.png','electronic2.png','electronic3.png','electronic2.png');

--INSERT INTO `product` (`name`, `price`,`category` ,`image1`,`image2`,`image3`,`image4`) VALUES
--('food', 500,'food','food2.jpg','food3.jpg','food2.jpg','food3.jpg');

