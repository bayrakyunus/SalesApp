-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2020 at 11:22 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sales_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `basket`
--

CREATE TABLE `basket` (
  `bid` int(11) NOT NULL,
  `bprid` int(11) NOT NULL COMMENT 'ürün id''si',
  `bprprice` decimal(6,2) NOT NULL,
  `bstatu` int(1) NOT NULL COMMENT '0 ise satış yapılmış, 1 ise satış beklemede',
  `bpid` int(11) NOT NULL COMMENT 'personel id',
  `bdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `basket`
--

INSERT INTO `basket` (`bid`, `bprid`, `bprprice`, `bstatu`, `bpid`, `bdate`) VALUES
(67, 2, '6.00', 0, 0, '2020-06-18 21:47:53'),
(68, 4, '2.00', 0, 0, '2020-06-18 21:47:55'),
(69, 2, '6.00', 0, 0, '2020-06-18 21:48:16'),
(70, 4, '2.00', 0, 0, '2020-06-18 21:48:23'),
(71, 2, '6.00', 0, 0, '2020-06-18 21:49:13'),
(72, 2, '6.00', 0, 0, '2020-06-18 22:01:35'),
(73, 2, '6.00', 0, 0, '2020-06-18 22:02:34'),
(74, 5, '12.00', 0, 0, '2020-06-18 22:04:27'),
(75, 5, '12.00', 0, 0, '2020-06-18 22:05:04'),
(76, 5, '12.00', 0, 0, '2020-06-18 22:05:36'),
(77, 5, '12.00', 0, 0, '2020-06-18 22:07:29'),
(78, 4, '2.00', 0, 0, '2020-06-18 22:07:34'),
(79, 4, '2.00', 0, 0, '2020-06-18 22:07:42'),
(80, 2, '6.00', 0, 0, '2020-06-18 22:07:48'),
(81, 2, '6.00', 0, 0, '2020-06-18 22:07:52'),
(82, 5, '12.00', 0, 0, '2020-06-18 22:07:59'),
(83, 5, '12.00', 0, 0, '2020-06-18 22:08:10'),
(84, 4, '2.00', 0, 0, '2020-06-18 22:08:12'),
(85, 2, '6.00', 0, 0, '2020-06-18 22:08:13'),
(86, 5, '12.00', 0, 0, '2020-06-18 22:08:20'),
(87, 5, '12.00', 0, 0, '2020-06-18 22:08:25'),
(88, 5, '12.00', 0, 0, '2020-06-18 22:08:28'),
(89, 5, '12.00', 0, 0, '2020-06-18 22:08:30'),
(90, 5, '12.00', 0, 0, '2020-06-18 22:08:33'),
(91, 5, '12.00', 0, 0, '2020-06-18 22:08:36'),
(92, 4, '2.00', 0, 0, '2020-06-18 22:08:38'),
(93, 2, '6.00', 0, 0, '2020-06-18 22:10:18'),
(94, 5, '12.00', 0, 0, '2020-06-18 22:10:21'),
(95, 4, '2.00', 0, 0, '2020-06-18 22:10:23'),
(96, 4, '2.00', 0, 0, '2020-06-18 22:10:25'),
(97, 4, '2.00', 0, 0, '2020-06-18 22:10:26'),
(98, 4, '2.00', 0, 0, '2020-06-18 22:10:28'),
(99, 4, '2.00', 0, 0, '2020-06-18 22:10:29'),
(100, 5, '12.00', 0, 0, '2020-06-18 22:10:31'),
(101, 4, '2.00', 0, 0, '2020-06-18 22:10:32'),
(102, 2, '6.00', 0, 0, '2020-06-18 22:10:33'),
(103, 2, '6.00', 0, 0, '2020-06-18 22:11:52'),
(104, 4, '2.00', 0, 0, '2020-06-18 22:11:55'),
(105, 4, '2.00', 0, 0, '2020-06-18 22:11:58'),
(106, 4, '2.00', 0, 0, '2020-06-18 22:11:59'),
(107, 4, '2.00', 0, 0, '2020-06-18 22:12:05'),
(108, 5, '2.00', 0, 0, '2020-06-18 22:12:12'),
(109, 4, '2.00', 0, 0, '2020-06-18 22:12:14'),
(110, 2, '6.00', 0, 0, '2020-06-18 22:12:17'),
(111, 6, '15.00', 0, 31, '2020-06-18 22:24:07'),
(112, 6, '15.00', 0, 31, '2020-06-18 22:24:23'),
(113, 2, '6.00', 0, 31, '2020-06-18 22:24:26'),
(114, 4, '2.00', 0, 31, '2020-06-18 22:24:30'),
(115, 9, '45.00', 0, 0, '2020-06-18 23:05:49'),
(116, 9, '45.00', 0, 0, '2020-06-18 23:05:51'),
(117, 9, '45.00', 0, 0, '2020-06-18 23:05:53'),
(118, 9, '45.00', 0, 0, '2020-06-18 23:05:54'),
(119, 9, '45.00', 0, 0, '2020-06-18 23:05:55'),
(120, 9, '45.00', 0, 0, '2020-06-18 23:06:03'),
(121, 9, '45.00', 0, 0, '2020-06-18 23:06:05'),
(122, 7, '4.00', 0, 0, '2020-06-18 23:06:08'),
(123, 12, '195.00', 0, 36, '2020-06-19 01:53:00'),
(124, 13, '85.00', 0, 36, '2020-06-19 01:53:10'),
(125, 10, '2.00', 0, 37, '2020-06-19 01:56:28'),
(126, 11, '9.00', 0, 37, '2020-06-19 01:56:31'),
(127, 10, '2.00', 0, 37, '2020-06-19 01:56:49'),
(128, 10, '2.00', 0, 37, '2020-06-19 01:57:29'),
(129, 11, '9.00', 0, 0, '2020-06-19 01:59:55'),
(130, 11, '9.00', 0, 37, '2020-06-19 02:00:10'),
(131, 13, '85.00', 0, 37, '2020-06-19 02:00:14'),
(132, 12, '195.00', 0, 37, '2020-06-19 02:00:21'),
(133, 11, '9.00', 0, 37, '2020-06-19 02:00:24'),
(134, 11, '9.00', 0, 37, '2020-06-19 02:00:26'),
(135, 11, '9.00', 0, 37, '2020-06-19 02:00:33'),
(136, 13, '85.00', 0, 36, '2020-06-19 02:07:04'),
(137, 10, '2.00', 0, 36, '2020-06-19 02:07:07'),
(138, 10, '2.00', 1, 37, '2020-06-19 02:12:23'),
(139, 12, '195.00', 1, 37, '2020-06-19 02:12:29');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cid` int(11) NOT NULL,
  `ctitle` varchar(255) NOT NULL,
  `cdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cid`, `ctitle`, `cdate`) VALUES
(31, 'Meyve', '2020-06-19 01:42:08'),
(32, 'Sebze', '2020-06-19 01:42:12'),
(33, 'Giyim', '2020-06-19 01:42:19'),
(34, 'Spor Ekipmanları', '2020-06-19 01:42:40');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `pid` int(11) NOT NULL,
  `pregister` tinyint(1) NOT NULL,
  `pname` varchar(255) NOT NULL,
  `psurname` varchar(255) NOT NULL,
  `pmail` varchar(255) NOT NULL,
  `pphone` varchar(50) NOT NULL,
  `paddress` varchar(255) NOT NULL,
  `pdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`pid`, `pregister`, `pname`, `psurname`, `pmail`, `pphone`, `paddress`, `pdate`) VALUES
(36, 1, 'Nuran', 'Serdaroğlu', 'nuran@serdaoglu.com', '+90(90)970-70-12', 'Kadıköy / İstanbul', '2020-06-19 01:44:51'),
(37, 1, 'Umut Sinan', 'Güldür', 'umut@guldur.com', '+90(3190)985-08-48', 'Kızılay / Ankara', '2020-06-19 01:45:39'),
(38, 0, 'Göktuğ', 'Subari', 'goktug@subari.com', '+90(97)467-10-90', 'Maçka / Trabzon', '2020-06-19 01:46:19');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `prid` int(11) NOT NULL,
  `prcid` int(11) NOT NULL COMMENT 'Kategori id''sidir.',
  `prtitle` varchar(255) NOT NULL,
  `prprice` decimal(6,2) NOT NULL,
  `prbarcode` varchar(255) NOT NULL,
  `prshelf` varchar(300) NOT NULL,
  `prstock` int(11) NOT NULL,
  `prnote` varchar(255) NOT NULL,
  `prdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`prid`, `prcid`, `prtitle`, `prprice`, `prbarcode`, `prshelf`, `prstock`, `prnote`, `prdate`) VALUES
(10, 32, 'Patates', '2.00', 'EUR-KYZTQ-2016', '4-D / 45', 3000, 'Tatlı Patates', '2020-06-19 01:48:43'),
(11, 31, 'Çilek', '9.00', 'FR18_SH9PP4NG_N3W', '3-B / 15', 2000, 'Doğal Çilek', '2020-06-19 01:50:14'),
(12, 34, 'Barfiks Tutucu', '195.00', 'DFINSX', '2-A / 26', 200, 'Kapıya uygun barfiks tutacağı', '2020-06-19 01:51:08'),
(13, 33, 'Kot Pantolon', '85.00', 'X6RgzCXb', '1-D / 22', 9000, 'Dar Paça Kot Pantolon Yeni Sezon', '2020-06-19 01:52:25');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `uusername` varchar(255) NOT NULL,
  `upassword` varchar(32) NOT NULL,
  `ustatu` int(1) NOT NULL COMMENT '1-> admin 0-> person',
  `upid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `uname`, `uusername`, `upassword`, `ustatu`, `upid`) VALUES
(31, 'Yunus', 'admin01', '58b1216b06850385d9a4eadbedc806c4', 1, 0),
(32, 'Umut Sinan Güldür', 'umut', '58b1216b06850385d9a4eadbedc806c4', 0, 37),
(33, 'Nuran Serdaroğlu', 'nuran', '58b1216b06850385d9a4eadbedc806c4', 0, 36);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cid`),
  ADD UNIQUE KEY `ctitle` (`ctitle`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `pmail` (`pmail`),
  ADD UNIQUE KEY `pphone` (`pphone`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`prid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `uusername` (`uusername`),
  ADD UNIQUE KEY `upid` (`upid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `basket`
--
ALTER TABLE `basket`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `prid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
