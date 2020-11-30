-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th10 30, 2020 lúc 07:32 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `restaurant`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `idC` int(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`idC`, `name`, `image`) VALUES
(3, 'Meats', 'http://www.lovethatfood.com/images/pork-carnitas/pork-carnitas-200.jpg'),
(4, 'BBQ and Grilling', 'http://www.lovethatfood.com/images/louisiana-barbecued-chicken/louisiana-barbecued-chicken-200.jpg'),
(5, 'Casseroles', 'http://www.lovethatfood.com/images/cheesy-vegetable-casserole/cheesy-vegetable-casserole-200.jpg'),
(6, 'Pasta', 'http://www.lovethatfood.com/images/penne-bolognese/penne-bolognese-200.jpg'),
(7, 'Pizza', 'http://www.lovethatfood.com/images/pepperoni-green-olives-and-feta-pizza/pepperoni-green-olives-and-feta-pizza-200.jpg'),
(8, 'Rice and Beans', 'http://www.lovethatfood.com/images/black-bean-and-corn-salsa/black-bean-and-corn-salsa-200.jpg'),
(9, 'Salads', 'http://www.lovethatfood.com/images/garden-salad-with-dijon-vinaigrette/garden-salad-with-dijon-vinaigrette-200.jpg'),
(10, 'Soups and Stews', 'http://www.lovethatfood.com/images/chicken-minestrone/chicken-minestrone-200.jpg'),
(11, 'Stir-Fry', 'http://www.lovethatfood.com/images/twice-cooked-pork/twice-cooked-pork-200.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `food`
--

CREATE TABLE `food` (
  `idF` int(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` varchar(50) NOT NULL,
  `rating` int(50) NOT NULL,
  `ratingCount` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `food`
--

INSERT INTO `food` (`idF`, `name`, `image`, `price`, `rating`, `ratingCount`) VALUES
(3, 'Balsamic Grilled Vegetables', 'http://www.lovethatfood.com/images/balsamic-grilled-vegetables/balsamic-grilled-vegetables-200.jpg', '100000', 4, 154),
(4, 'Barbecued Pork Ribs', 'http://www.lovethatfood.com/images/barbecued-pork-ribs/barbecued-pork-ribs-200.jpg', '90000', 3, 187),
(5, 'BBQ Baked Beans', 'http://www.lovethatfood.com/images/bbq-baked-beans/baked-beans-200.jpg', '90000', 3, 100),
(6, 'BBQ Pork Sandwich', 'http://www.lovethatfood.com/images/bbq-pork-sandwich/bbq-pork-sandwich-200.jpg', '50000', 4, 458),
(7, 'Beanie Weenie', 'http://www.lovethatfood.com/images/beanie-weenie/beanie-weenie-200.jpg', '190000', 4, 157),
(8, 'Chicken Satay with Peanut Sauce', 'http://www.lovethatfood.com/images/chicken-satay-with-peanut-sauce/chicken-satay-with-peanut-sauce-200.jpg', '500000', 4, 154),
(9, 'Apple Sausage Quiche', 'http://www.lovethatfood.com/images/apple-sausage-quiche/apple-sausage-quiche-200.jpg', '12000', 5, 1235),
(10, 'Au Gratin Potatoes with Crumb Topping', 'http://www.lovethatfood.com/images/au-gratin-potatoes-with-crumb-topping/au-gratin-potatoes-with-crumb-topping-200.jpg', '10000', 4, 946),
(11, 'Cauliflower and Broccoli Gratin', 'http://www.lovethatfood.com/images/cauliflower-and-broccoli-gratin/cauliflower-and-broccoli-gratin-200.jpg', '198000', 5, 239),
(12, 'Chicken and Bacon Quiche', 'http://www.lovethatfood.com/images/chicken-and-bacon-quiche/chicken-and-bacon-quiche-200.jpg', '50000', 3, 945),
(13, 'Chicken and Cheese Casserole', 'http://www.lovethatfood.com/images/chicken-and-cheese-casserole/chicken-and-cheese-casserole-200.jpg', '1000000', 5, 653),
(14, 'Beef', 'http://www.lovethatfood.com/images/cajun-meatloaf/cajun-meatloaf-200.jpg', '430000', 4, 138),
(15, 'Chicken', 'http://www.lovethatfood.com/images/stuffed-cornish-hens-with-rosemary-and-lemon/stuffed-cornish-hens-with-rosemary-and-lemon-200.jpg', '300000', 4, 9517),
(16, 'Pork', 'http://www.lovethatfood.com/images/pork-carnitas/pork-carnitas-200.jpg', '350000', 4, 3894),
(17, 'Seafood', 'http://www.lovethatfood.com/images/salmon-with-sweet-and-sour-coriander-sauce/salmon-with-sweet-and-sour-coriander-sauce-200.jpg', '500000', 3, 4643),
(18, 'Buffalo Mac and Cheese', 'http://www.lovethatfood.com/images/buffalo-mac-and-cheese/buffalo-mac-and-cheese-200.jpg', '50000', 4, 167),
(19, 'Caprese Pasta Salad', 'http://www.lovethatfood.com/images/caprese-pasta-salad/caprese-pasta-salad-200.jpg', '99000', 4, 94),
(20, 'Chicken Broccoli Bake', 'http://www.lovethatfood.com/images/chicken-broccoli-bake/chicken-broccoli-bake-200.jpg', '98000', 5, 976),
(21, 'BBQ Chicken Pizza', 'http://www.lovethatfood.com/images/bbq-chicken-pizza/bbq-chicken-pizza-200.jpg', '230000', 4, 675),
(22, 'Breakfast Pizza', 'http://www.lovethatfood.com/images/breakfast-pizza/breakfast-pizza-200.jpg', '420000', 4, 126),
(23, 'Cheese and Vegetable Pizza Bagels', 'http://www.lovethatfood.com/images/cheese-and-vegetable-pizza-bagels/cheese-and-vegetable-pizza-bagels-200.jpg', '120000', 3, 673),
(24, 'Chicken and Vegetable Pizza', 'http://www.lovethatfood.com/images/chicken-and-vegetable-pizza/chicken-and-vegetable-pizza-200.jpg', '235000', 4, 187),
(25, 'Lemon Cheese Pizza', 'http://www.lovethatfood.com/images/lemon-cheese-pizza/lemon-cheese-pizza-200.jpg', '430000', 4, 845),
(26, 'Mediterranean Pizza', 'http://www.lovethatfood.com/images/mediterranean-pizza/mediterranean-pizza-200.jpg', '460000', 4, 156);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `food_category_detail`
--

CREATE TABLE `food_category_detail` (
  `idF` int(11) NOT NULL,
  `idC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `food_category_detail`
--

INSERT INTO `food_category_detail` (`idF`, `idC`) VALUES
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(8, 4),
(9, 5),
(10, 5),
(11, 5),
(12, 5),
(13, 5),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 6),
(19, 6),
(20, 6),
(21, 7),
(22, 7),
(23, 6),
(23, 7),
(24, 7),
(25, 7),
(26, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `genre`
--

CREATE TABLE `genre` (
  `idG` int(255) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `restaurant`
--

CREATE TABLE `restaurant` (
  `idR` int(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `place` varchar(255) NOT NULL,
  `deliveryTime` varchar(50) NOT NULL,
  `rating` int(50) NOT NULL,
  `ratingCount` int(50) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `restaurant`
--

INSERT INTO `restaurant` (`idR`, `name`, `place`, `deliveryTime`, `rating`, `ratingCount`, `image`) VALUES
(2, 'The Light Paradise', 'Vietnam', '30-40 min', 4, 984, 'http://i0sa.com/food/images/rests/8.jpg'),
(3, 'The Waterway Devil', 'Vietnam', '30-40 min', 5, 49, 'http://i0sa.com/food/images/rests/9.jpg'),
(4, 'The Abacus Hook', 'Paris', '30-40 min', 3, 150, 'http://i0sa.com/food/images/rests/10.jpg'),
(5, 'The Silk Exhibit', 'USA', '30-40 min', 4, 100, 'http://i0sa.com/food/images/rests/11.jpg'),
(6, 'Gentle', 'Paris', '30-40 min', 4, 164, 'http://i0sa.com/food/images/rests/12.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `restaurant_food_detail`
--

CREATE TABLE `restaurant_food_detail` (
  `idR` int(255) NOT NULL,
  `idF` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `restaurant_food_detail`
--

INSERT INTO `restaurant_food_detail` (`idR`, `idF`) VALUES
(2, 13),
(2, 14),
(2, 19),
(3, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 24),
(3, 25),
(3, 26),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(5, 15),
(5, 16),
(5, 17),
(5, 18),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `restaurant_genre_detail`
--

CREATE TABLE `restaurant_genre_detail` (
  `idR` int(11) NOT NULL,
  `idG` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`idC`);

--
-- Chỉ mục cho bảng `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`idF`);

--
-- Chỉ mục cho bảng `food_category_detail`
--
ALTER TABLE `food_category_detail`
  ADD PRIMARY KEY (`idF`,`idC`),
  ADD KEY `Category_FK` (`idC`);

--
-- Chỉ mục cho bảng `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`idG`);

--
-- Chỉ mục cho bảng `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`idR`);

--
-- Chỉ mục cho bảng `restaurant_food_detail`
--
ALTER TABLE `restaurant_food_detail`
  ADD PRIMARY KEY (`idR`,`idF`),
  ADD KEY `Food_FK2` (`idF`);

--
-- Chỉ mục cho bảng `restaurant_genre_detail`
--
ALTER TABLE `restaurant_genre_detail`
  ADD PRIMARY KEY (`idR`,`idG`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `idC` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `food`
--
ALTER TABLE `food`
  MODIFY `idF` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `genre`
--
ALTER TABLE `genre`
  MODIFY `idG` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `idR` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `food_category_detail`
--
ALTER TABLE `food_category_detail`
  ADD CONSTRAINT `Category_FK` FOREIGN KEY (`idC`) REFERENCES `category` (`idC`),
  ADD CONSTRAINT `Food_FK` FOREIGN KEY (`idF`) REFERENCES `food` (`idF`);

--
-- Các ràng buộc cho bảng `restaurant_food_detail`
--
ALTER TABLE `restaurant_food_detail`
  ADD CONSTRAINT `Food_FK2` FOREIGN KEY (`idF`) REFERENCES `food` (`idF`),
  ADD CONSTRAINT `Restaurant_FK2` FOREIGN KEY (`idR`) REFERENCES `restaurant` (`idR`);

--
-- Các ràng buộc cho bảng `restaurant_genre_detail`
--
ALTER TABLE `restaurant_genre_detail`
  ADD CONSTRAINT `Genre_FK` FOREIGN KEY (`idR`) REFERENCES `restaurant` (`idR`),
  ADD CONSTRAINT `Restaurant_FK1` FOREIGN KEY (`idR`) REFERENCES `restaurant` (`idR`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
