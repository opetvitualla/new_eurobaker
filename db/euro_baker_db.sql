-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2020 at 05:48 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `euro_baker_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `eb_forgot_password_keys`
--

CREATE TABLE `eb_forgot_password_keys` (
  `PK_forget_id` int(11) NOT NULL,
  `FK_user_id` int(11) NOT NULL,
  `email_address` varchar(100) NOT NULL,
  `token_value` text NOT NULL,
  `status` int(11) NOT NULL,
  `date_expire` date NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `eb_inventory_movement`
--

CREATE TABLE `eb_inventory_movement` (
  `pk_inv_move_id` int(11) NOT NULL,
  `fk_item_id` int(11) NOT NULL,
  `type_entry` varchar(55) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `from_value` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `date_added` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_inventory_movement`
--

INSERT INTO `eb_inventory_movement` (`pk_inv_move_id`, `fk_item_id`, `type_entry`, `trans_id`, `from_value`, `value`, `branch_id`, `date_added`) VALUES
(12, 1, 'initial', 0, 0, 30, 1, '2020-07-13'),
(13, 2, 'initial', 0, 0, 10, 1, '2020-07-13'),
(14, 3, 'initial', 0, 0, 20, 1, '2020-07-13'),
(15, 1, 'purchase', 5, 30, 3, 1, '2020-07-13'),
(16, 2, 'purchase', 5, 10, 5, 1, '2020-07-13'),
(17, 3, 'purchase', 6, 20, 1, 1, '2020-07-13');

-- --------------------------------------------------------

--
-- Table structure for table `eb_item_inventory`
--

CREATE TABLE `eb_item_inventory` (
  `PK_inventory_id` int(11) NOT NULL,
  `FK_raw_material_id` int(11) NOT NULL,
  `FK_outlet_id` int(11) NOT NULL,
  `beginning_inventory` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `type` varchar(150) NOT NULL,
  `discrepancy` tinyint(4) NOT NULL COMMENT '0-no 1-yes',
  `date_added` date NOT NULL DEFAULT current_timestamp(),
  `date_updated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_item_inventory`
--

INSERT INTO `eb_item_inventory` (`PK_inventory_id`, `FK_raw_material_id`, `FK_outlet_id`, `beginning_inventory`, `quantity`, `status`, `type`, `discrepancy`, `date_added`, `date_updated`) VALUES
(23, 1, 1, 30, 33, 1, 'purchase', 0, '2020-07-13', '2020-07-13'),
(24, 2, 1, 10, 15, 1, 'purchase', 0, '2020-07-13', '2020-07-13'),
(25, 3, 1, 20, 21, 1, 'purchase', 0, '2020-07-13', '2020-07-13');

-- --------------------------------------------------------

--
-- Table structure for table `eb_other_outlet_delivery`
--

CREATE TABLE `eb_other_outlet_delivery` (
  `pk_other_deliver_id` int(11) NOT NULL,
  `fk_po_id` int(11) NOT NULL,
  `fk_receiver_id` int(11) NOT NULL,
  `checked_by` varchar(55) NOT NULL,
  `fk_outlet_recieved_id` int(11) NOT NULL,
  `fk_outlet_to_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_other_outlet_delivery`
--

INSERT INTO `eb_other_outlet_delivery` (`pk_other_deliver_id`, `fk_po_id`, `fk_receiver_id`, `checked_by`, `fk_outlet_recieved_id`, `fk_outlet_to_id`) VALUES
(1, 3, 1, 'test', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `eb_outlet`
--

CREATE TABLE `eb_outlet` (
  `PK_branch_id` int(11) NOT NULL,
  `outlet_name` varchar(100) NOT NULL,
  `outlet_description` text NOT NULL,
  `status` int(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `remarks` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `eb_outlets`
--

CREATE TABLE `eb_outlets` (
  `PK_branch_id` tinyint(4) NOT NULL,
  `outlet_name` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eb_outlets`
--

INSERT INTO `eb_outlets` (`PK_branch_id`, `outlet_name`, `status`, `date_added`) VALUES
(1, 'Bajada', 1, '2020-03-20 10:28:17'),
(2, 'Tagum', 1, '2020-03-20 10:28:17'),
(3, 'Toril', 1, '2020-03-20 10:28:23'),
(4, 'Commisary', 1, '2020-05-26 14:07:58');

-- --------------------------------------------------------

--
-- Table structure for table `eb_po_discrepancy_items`
--

CREATE TABLE `eb_po_discrepancy_items` (
  `po_discrepancy_item_id` int(11) NOT NULL,
  `fk_po_discrepancy_id` int(11) NOT NULL,
  `fk_material_id` int(11) NOT NULL,
  `material_name` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `received_qty` int(11) NOT NULL,
  `units` varchar(55) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_po_discrepancy_items`
--

INSERT INTO `eb_po_discrepancy_items` (`po_discrepancy_item_id`, `fk_po_discrepancy_id`, `fk_material_id`, `material_name`, `qty`, `received_qty`, `units`, `date_added`) VALUES
(4, 5, 2, ' Milk ', 6, 5, '', '2020-07-13 09:56:44');

-- --------------------------------------------------------

--
-- Table structure for table `eb_purchase_order`
--

CREATE TABLE `eb_purchase_order` (
  `PK_purchase_order_id` int(11) NOT NULL,
  `purchase_order_no` varchar(60) NOT NULL,
  `FK_supplier_id` int(11) NOT NULL,
  `FK_user_id` int(11) NOT NULL,
  `FK_branch_id` int(11) NOT NULL,
  `status` varchar(55) NOT NULL,
  `date_added` datetime NOT NULL,
  `total_amount` float NOT NULL,
  `remarks` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_purchase_order`
--

INSERT INTO `eb_purchase_order` (`PK_purchase_order_id`, `purchase_order_no`, `FK_supplier_id`, `FK_user_id`, `FK_branch_id`, `status`, `date_added`, `total_amount`, `remarks`) VALUES
(5, 'N/A', 2, 1, 1, 'received', '2020-07-13 09:55:01', 210, ''),
(6, 'N/A', 2, 1, 1, 'received', '2020-07-13 10:00:06', 66, '');

-- --------------------------------------------------------

--
-- Table structure for table `eb_purchase_order_discrepancy`
--

CREATE TABLE `eb_purchase_order_discrepancy` (
  `pk_po_discrepancy_id` int(11) NOT NULL,
  `fk_purchase_id` int(11) NOT NULL,
  `reason` text NOT NULL,
  `status` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_purchase_order_discrepancy`
--

INSERT INTO `eb_purchase_order_discrepancy` (`pk_po_discrepancy_id`, `fk_purchase_id`, `reason`, `status`, `date_added`) VALUES
(2, 5, 'test', 1, '2020-07-13 09:56:44');

-- --------------------------------------------------------

--
-- Table structure for table `eb_purchase_order_item`
--

CREATE TABLE `eb_purchase_order_item` (
  `PK_po_item_id` int(11) NOT NULL,
  `FK_purchase_id` int(11) NOT NULL,
  `FK_raw_material_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` float NOT NULL,
  `price` float NOT NULL,
  `status` varchar(55) NOT NULL,
  `item_unit` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_purchase_order_item`
--

INSERT INTO `eb_purchase_order_item` (`PK_po_item_id`, `FK_purchase_id`, `FK_raw_material_id`, `quantity`, `total`, `price`, `status`, `item_unit`, `date_added`) VALUES
(8, 5, 1, 3, 30, 10, '1', '2', '2020-07-13 09:55:01'),
(9, 5, 2, 6, 180, 30, '1', '1', '2020-07-13 09:55:01'),
(10, 6, 3, 1, 66, 66, '1', '2', '2020-07-13 10:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `eb_purchase_order_received`
--

CREATE TABLE `eb_purchase_order_received` (
  `PK_po_received_id` int(11) NOT NULL,
  `FK_purchase_id` int(11) NOT NULL,
  `FK_received_user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `counter_checked` varchar(55) NOT NULL,
  `date_received` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_purchase_order_received`
--

INSERT INTO `eb_purchase_order_received` (`PK_po_received_id`, `FK_purchase_id`, `FK_received_user_id`, `status`, `counter_checked`, `date_received`) VALUES
(10, 5, 1, 1, 'opets ', '2020-07-13 09:56:44'),
(11, 6, 1, 1, 'opets', '2020-07-13 10:21:49');

-- --------------------------------------------------------

--
-- Table structure for table `eb_raw_materials`
--

CREATE TABLE `eb_raw_materials` (
  `PK_raw_materials_id` bigint(20) NOT NULL,
  `FK_outlet_id` tinyint(4) NOT NULL,
  `FK_category_id` tinyint(4) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1- Active 0-Inactive',
  `material_name` varchar(255) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `average_cost` varchar(20) NOT NULL,
  `asset_value` varchar(20) NOT NULL,
  `total_asset_percent` varchar(20) NOT NULL,
  `sales_price` varchar(20) NOT NULL,
  `retail_value` varchar(20) NOT NULL,
  `total_retail_percent` varchar(20) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eb_raw_materials`
--

INSERT INTO `eb_raw_materials` (`PK_raw_materials_id`, `FK_outlet_id`, `FK_category_id`, `status`, `material_name`, `unit`, `average_cost`, `asset_value`, `total_asset_percent`, `sales_price`, `retail_value`, `total_retail_percent`, `date_added`) VALUES
(1, 1, 3, 1, '12x12  spongecake plain (12x12 spongecake plain)', 'ea', '287.88', '0.00%', '0.00%', '287.87', '0', '0.00%', '2020-03-19 18:01:56'),
(2, 1, 3, 1, '12x12 choco spongecake choco (12x12 choco spongecake choco)', 'ea', '311.85', '0.00%', '0.00%', '311.85', '0', '0.00%', '2020-03-19 18:01:56'),
(3, 1, 3, 1, '12x16x2 styro (12x16x2 styro)', 'ea', '150', '0.00%', '0.00%', '150', '0', '0.00%', '2020-03-19 18:01:56'),
(4, 1, 3, 1, '12x4 Styro (12x4 Styro)', 'ea', '186', '0.00%', '0.00%', '186', '0', '0.00%', '2020-03-19 18:01:56'),
(5, 1, 3, 1, '2D poster board for Spongebob (2D poster board for Spongebob)', 'ea', '20', '0.00%', '0.00%', '20', '0', '0.00%', '2020-03-19 18:01:56'),
(6, 1, 3, 1, '320 CC Paper Bowl w/ lid (320 CC Paper Bowl)', 'ea', '5.1', '0.00%', '0.00%', '5.1', '0', '0.00%', '2020-03-19 18:01:56'),
(7, 1, 3, 1, '3D Board Castle (3D Board Castle)', 'ea', '25', '0.00%', '0.00%', '25', '0', '0.00%', '2020-03-19 18:01:56'),
(8, 1, 3, 1, '8x12 choco spongecake choco (8x12 choco spongecake choco  )', 'ea', '169.99', '0.00%', '0.00%', '169.99', '0', '0.00%', '2020-03-19 18:01:56'),
(9, 1, 3, 1, '8X12X2 Styro (8X12X2 Styro)', 'ea', '80', '0.00%', '0.00%', '80', '0', '0.00%', '2020-03-19 18:01:56'),
(10, 1, 3, 1, '8x4 Styro (8x4 Styro)', 'ea', '99', '0.00%', '0.00%', '99', '0', '0.00%', '2020-03-19 18:01:56'),
(11, 1, 3, 1, 'A1 Steak Sauce (A1 Steak Sauce 10oz)', 'Bot', '296.43', '0.03%', '0.00%', '296.44', '569.16', '0.03%', '2020-03-19 18:01:56'),
(12, 1, 3, 1, 'Acrylic Topper Big heart Gold (Acrylic Topper)', 'ea', '54', '0.00%', '0.00%', '54', '0', '0.00%', '2020-03-19 18:01:56'),
(13, 1, 3, 1, 'Airbrush Cleaner (Airbrush Cleaner)', 'ML', '1.1', '0.01%', '0.00%', '1.099', '219.8', '0.01%', '2020-03-19 18:01:56'),
(14, 1, 3, 1, 'Airbrush coloring black (Airbrush coloring black  )', 'ML', '1.41', '0.02%', '0.00%', '1.41', '324.3', '0.02%', '2020-03-19 18:01:56'),
(15, 1, 3, 1, 'Airbrush coloring blue (Airbrush coloring blue  )', 'ML', '1.02', '0.02%', '0.00%', '1.02', '387.6', '0.02%', '2020-03-19 18:01:56'),
(16, 1, 3, 1, 'Airbrush coloring brown (Airbrush coloring brown  )', 'ML', '1.07', '0.02%', '0.00%', '1.15', '293.25', '0.02%', '2020-03-19 18:01:56'),
(17, 1, 3, 1, 'Airbrush coloring green (Airbrush coloring green  )', 'ML', '1.02', '0.02%', '0.00%', '1.02', '408', '0.02%', '2020-03-19 18:01:56'),
(18, 1, 3, 1, 'Airbrush coloring orange (Airbrush coloring orange  )', 'ML', '1.02', '0.02%', '0.00%', '1.02', '260.1', '0.02%', '2020-03-19 18:01:56'),
(19, 1, 3, 1, 'Airbrush coloring peach (Airbrush coloring peach  )', 'ML', '1.02', '0.00%', '0.00%', '1.02', '0', '0.00%', '2020-03-19 18:01:56'),
(20, 1, 3, 1, 'Airbrush coloring pink (Airbrush coloring pink  )', 'ML', '1.15', '0.05%', '0.00%', '1.22', '799.1', '0.05%', '2020-03-19 18:01:56'),
(21, 1, 3, 1, 'Airbrush coloring red (Airbrush coloring red  )', 'ML', '1.41', '0.05%', '0.00%', '1.42', '809.4', '0.05%', '2020-03-19 18:01:56'),
(22, 1, 3, 1, 'Airbrush coloring violet (Airbrush coloring violet  )', 'ML', '1.41', '0.05%', '0.00%', '1.39', '827.05', '0.05%', '2020-03-19 18:01:56'),
(23, 1, 3, 1, 'Airbrush coloring yellow(255ml/ (Airbrush coloring yellow(255ml/bot)  )', 'ML', '1.02', '0.03%', '0.00%', '1.03', '525.3', '0.03%', '2020-03-19 18:01:56'),
(24, 1, 3, 1, 'Airbrush Deep Pink 255ml (Airbrush Deep Pink 255ml)', 'ML', '1.41', '0.00%', '0.00%', '1.4117', '0', '0.00%', '2020-03-19 18:01:56'),
(25, 1, 3, 1, 'Airbrush Gold (Airbrush Gold)', 'ML', '2.16', '0.00%', '0.00%', '2.16', '0', '0.00%', '2020-03-19 18:01:56'),
(26, 1, 3, 1, 'Airbrush Silver (Airbrush Silver)', 'ML', '2.16', '0.01%', '0.00%', '2.16', '216', '0.01%', '2020-03-19 18:01:56'),
(27, 1, 3, 1, 'Alexander Styro (Alexander Styro)', 'ea', '38', '0.00%', '0.00%', '40', '0', '0.00%', '2020-03-19 18:01:56'),
(28, 1, 3, 1, 'Alice Rose 4in1 REd (Alice Rose 4in1 REd)', 'ea', '60', '0.00%', '0.00%', '60', '0', '0.00%', '2020-03-19 18:01:56'),
(29, 1, 3, 1, 'Almond Whole 500g (Almond Whole 500g)', 'grms', '0.78', '0.00%', '0.00%', '0.78', '0', '0.00%', '2020-03-19 18:01:56'),
(30, 1, 3, 1, 'Almonds (Almonds)', 'grms', '1', '0.02%', '0.00%', '0.997', '398.8', '0.02%', '2020-03-19 18:01:56'),
(31, 1, 3, 1, 'American garden U.S Ketchup (American garden U.S Ketchup 140z)', 'Bot', '89.5', '0.00%', '0.00%', '89.5', '0', '0.00%', '2020-03-19 18:01:56'),
(32, 1, 3, 1, 'Anods Dark compand (Anods Dark compand)', 'Kls', '214.32', '0.00%', '0.00%', '216', '0', '0.00%', '2020-03-19 18:01:56'),
(33, 1, 3, 1, 'Apple Blossom white (Apple Blossom white)', 'Pck', '20', '0.00%', '0.00%', '20', '0', '0.00%', '2020-03-19 18:01:56'),
(34, 1, 3, 1, 'Apple green (Apple green  )', 'ea', '29.68', '0.02%', '0.00%', '30', '270', '0.02%', '2020-03-19 18:01:56'),
(35, 1, 3, 1, 'Apple Pie-Euro (Apple Pie-Euro  )', 'ea', '46.07', '0.02%', '0.00%', '46.07', '322.49', '0.02%', '2020-03-19 18:01:56'),
(36, 1, 3, 1, 'Apple pie-New york style (Apple pie-New york style  )', 'ea', '33.38', '0.01%', '0.00%', '33.38', '200.28', '0.01%', '2020-03-19 18:01:56'),
(37, 1, 3, 1, 'Apple red (Apple red  )', 'ea', '26.23', '0.03%', '0.00%', '30', '510', '0.03%', '2020-03-19 18:01:56'),
(38, 1, 3, 1, 'Armanio Honey 250ml (Armanio Honey 250ml)', 'ea', '190', '0.00%', '0.00%', '190', '0', '0.00%', '2020-03-19 18:01:56'),
(39, 1, 3, 1, 'Artistic straw (Artistic straw  )', 'ea', '0.43', '0.03%', '0.00%', '0.4145', '427.35', '0.03%', '2020-03-19 18:01:56'),
(40, 1, 3, 1, 'Asst. Sprinkle (Asst. Sprinkle)', 'grms', '0.35', '0.00%', '0.00%', '0.35', '0', '0.00%', '2020-03-19 18:01:56'),
(41, 1, 3, 1, 'Aurora Figurine Imported (Aurora Figurine Imported)', 'ea', '60', '0.00%', '0.00%', '60', '0', '0.00%', '2020-03-19 18:01:56'),
(42, 1, 3, 1, 'Baby on crib (Baby on crib  )', 'ea', '30', '0.00%', '0.00%', '30', '0', '0.00%', '2020-03-19 18:01:56'),
(43, 1, 3, 1, 'Baby on Crib (XL) (Baby on Crib (XL))', 'ea', '85', '0.02%', '0.00%', '85', '255', '0.02%', '2020-03-19 18:01:56'),
(44, 1, 3, 1, 'Baby on crib Impoted (Baby on crib Imported)', 'ea', '65', '0.04%', '0.00%', '75', '825', '0.05%', '2020-03-19 18:01:56'),
(45, 1, 3, 1, 'Baked cheesecake (Baked cheesecake  )', 'ea', '111.64', '0.11%', '0.00%', '111.64', '1786.24', '0.11%', '2020-03-19 18:01:56'),
(46, 1, 3, 1, 'Barbie Doll (Barbie Doll  )', 'ea', '55', '0.00%', '0.00%', '55', '0', '0.00%', '2020-03-19 18:01:56'),
(47, 1, 3, 1, 'Batman big (Batman big  )', 'ea', '50', '0.00%', '0.00%', '50', '0', '0.00%', '2020-03-19 18:01:56'),
(48, 1, 3, 1, 'Batman Figurine Loca (Batman Figurine Loca)', 'ea', '25', '0.01%', '0.00%', '25', '100', '0.01%', '2020-03-19 18:01:56'),
(49, 1, 3, 1, 'Batman Styro (Batman Styro)', 'ea', '15.91', '0.01%', '0.00%', '15', '150', '0.01%', '2020-03-19 18:01:56'),
(50, 1, 3, 1, 'Bday Topper Plastic (Bday Topper Plastic)', 'ea', '43.33', '0.02%', '0.00%', '50', '300', '0.02%', '2020-03-19 18:01:56'),
(51, 1, 3, 1, 'Beauty Fig ( Imported) (Beauty Fig ( Imported))', 'ea', '65', '0.00%', '0.00%', '65', '0', '0.00%', '2020-03-19 18:01:56'),
(52, 1, 3, 1, 'Beauty Figurine ( Local) (Beauty Figurine ( Local))', 'ea', '30', '0.00%', '0.00%', '30', '0', '0.00%', '2020-03-19 18:01:56'),
(53, 1, 3, 1, 'Belle Figurine ( Local) (Belle Figurine ( Local))', 'ea', '25', '0.00%', '0.00%', '25', '0', '0.00%', '2020-03-19 18:01:56'),
(54, 1, 3, 1, 'Belle Figurine Imported (Belle Figurine Imported)', 'ea', '65', '0.00%', '0.00%', '65', '0', '0.00%', '2020-03-19 18:01:56'),
(55, 1, 3, 1, 'Ben 10 Figurine Imported (Ben 10 Figurine Imported)', 'ea', '65', '0.02%', '0.00%', '65', '260', '0.02%', '2020-03-19 18:01:56'),
(56, 1, 3, 1, 'Ben 10 figurine local big (Ben 10 figurine local big  )', 'ea', '57.69', '0.00%', '0.00%', '57.69', '0', '0.00%', '2020-03-19 18:01:56'),
(57, 1, 3, 1, 'Ben 10 figurine small (Ben 10 figurine small  )', 'ea', '28', '0.00%', '0.00%', '28', '0', '0.00%', '2020-03-19 18:01:56'),
(58, 1, 3, 1, 'Ben 10 styro (Ben 10 styro)', 'ea', '15.72', '0.01%', '0.00%', '15', '105', '0.01%', '2020-03-19 18:01:56'),
(59, 1, 3, 1, 'Beryls Dark Compound 1kg (Beryls Dark Compound 1kg)', 'ea', '194', '0.04%', '0.00%', '194', '582', '0.03%', '2020-03-19 18:01:56'),
(60, 1, 3, 1, 'Biscuit-Cream O (Biscuit-Cream O   )', 'Pck', '19.1', '0.00%', '0.00%', '19.1', '0', '0.00%', '2020-03-19 18:01:56'),
(61, 1, 3, 1, 'Black Forest (Black Forest  )', 'ea', '52.88', '0.00%', '0.00%', '52.88', '0', '0.00%', '2020-03-19 18:01:56'),
(62, 1, 3, 1, 'Blueberry 595g (Blueberry 595g x12pcs/case)', 'grms', '0.32', '0.00%', '0.00%', '0.37', '0', '0.00%', '2020-03-19 18:01:56'),
(63, 1, 3, 1, 'Blueberry 595g/Bot (Blueberry 595g/Bot)', 'Bot', '224.09', '0.00%', '0.00%', '224.1', '0', '0.00%', '2020-03-19 18:01:56'),
(64, 1, 3, 1, 'Blueberry bakecheese cake (Blueberry bakecheese cake  )', 'ea', '34.33', '0.01%', '0.00%', '34.33', '171.65', '0.01%', '2020-03-19 18:01:56'),
(65, 1, 3, 1, 'Blueberry chilled cake (Blueberry chilled cake  )', 'ea', '65.09', '0.00%', '0.00%', '65.09', '0', '0.00%', '2020-03-19 18:01:56'),
(66, 1, 3, 1, 'Blueberry square (Blueberry square  )', 'ea', '38.89', '0.05%', '0.00%', '38.89', '855.58', '0.05%', '2020-03-19 18:01:56'),
(67, 1, 3, 1, 'Bubble Gum Gelato (Bubble Gum Gelato)', 'ea', '0', '0.00%', '0.00%', '110', '0', '0.00%', '2020-03-19 18:01:56'),
(68, 1, 3, 1, 'Bulla Light Sour Cream 200g (Bulla Light Sour Cream 200g)', 'ea', '186', '0.07%', '0.00%', '186', '1116', '0.07%', '2020-03-19 18:01:56'),
(69, 1, 3, 1, 'Butterfly gumpaste (Butterfly gumpaste  )', 'ea', '14', '0.00%', '0.00%', '14', '0', '0.00%', '2020-03-19 18:01:56'),
(70, 1, 3, 1, 'butterfly Icing (butterfly Icing)', 'ea', '14', '0.02%', '0.00%', '14', '252', '0.02%', '2020-03-19 18:01:56'),
(71, 1, 3, 1, 'Cafe Latina Gelato (Cafe Latina Gelato)', 'ea', '0', '0.00%', '0.00%', '110', '0', '0.00%', '2020-03-19 18:01:56'),
(72, 1, 3, 1, 'Caffe Verona (Caffe Verona)', 'Pck', '40', '-0.20%', '0.00%', '40', '-3360', '-0.20%', '2020-03-19 18:01:56'),
(73, 1, 3, 1, 'Cake acetate (Cake Acetate  )', 'Roll', '2000', '0.00%', '0.00%', '2000', '0', '0.00%', '2020-03-19 18:01:56'),
(74, 1, 3, 1, 'Cake Choco 8x12 (Cake Choco 8x12)', 'ea', '71.34', '0.00%', '0.00%', '71.34', '0', '0.00%', '2020-03-19 18:01:56'),
(75, 1, 3, 1, 'Cake Topper (Cake Topper)', 'ea', '60', '0.01%', '0.00%', '60', '240', '0.01%', '2020-03-19 18:01:56'),
(76, 1, 3, 1, 'Camomile Tea bag (Camomile Tea bag)', 'ea', '6.11', '0.07%', '0.00%', '7', '1351', '0.08%', '2020-03-19 18:01:56'),
(77, 1, 3, 1, 'Candle letters (Candle letters  )', 'Pck', '45', '0.00%', '0.00%', '45', '0', '0.00%', '2020-03-19 18:01:56'),
(78, 1, 3, 1, 'Candle Number AP Gold (Candle Number AP Gold)', 'ea', '9', '0.00%', '0.00%', '9', '0', '0.00%', '2020-03-19 18:01:56'),
(79, 1, 3, 1, 'Candle Numbers (Candle Numbers  )', 'Pck', '12.97', '0.07%', '0.00%', '13', '1105', '0.07%', '2020-03-19 18:01:56'),
(80, 1, 3, 1, 'Candle stick (Candle stick)', 'Pck', '22', '0.02%', '0.00%', '22', '330', '0.02%', '2020-03-19 18:01:56'),
(81, 1, 3, 1, 'Candy Sprinkle SQ (Candy Sprinkle SQ)', 'ea', '68', '0.00%', '0.00%', '68', '0', '0.00%', '2020-03-19 18:01:56'),
(82, 1, 3, 1, 'Captain America (Captain America  )', 'ea', '50', '0.00%', '0.00%', '50', '50', '0.00%', '2020-03-19 18:01:56'),
(83, 1, 3, 1, 'Car Figurine (Car Figurine  )', 'ea', '50', '0.00%', '0.00%', '50', '0', '0.00%', '2020-03-19 18:01:56'),
(84, 1, 3, 1, 'Car styro (Car styro  )', 'ea', '16', '0.01%', '0.00%', '16', '128', '0.01%', '2020-03-19 18:01:56'),
(85, 1, 3, 1, 'Carnival bending straw (Carnival bending straw 100pcs/pack)', 'ea', '0.2', '0.02%', '0.00%', '0.19', '334.59', '0.02%', '2020-03-19 18:01:56'),
(86, 1, 3, 1, 'CARS figurine loca (CARS figurine loca)', 'ea', '31.2', '0.02%', '0.00%', '32', '288', '0.02%', '2020-03-19 18:01:56'),
(87, 1, 3, 1, 'Castle styro (Castle styro  )', 'ea', '37.88', '0.02%', '0.00%', '37.73', '264.11', '0.02%', '2020-03-19 18:01:56'),
(88, 1, 3, 1, 'CDO Liver Spread 85g (CDO Liver Spread 85g)', 'Pck', '15.77', '0.00%', '0.00%', '16.5', '0', '0.00%', '2020-03-19 18:01:56'),
(89, 1, 3, 1, 'Cebu Mango Gelato (Cebu Mango Gelato)', 'ea', '72.8', '-0.04%', '0.00%', '110', '-1100', '-0.06%', '2020-03-19 18:01:56'),
(90, 1, 3, 1, 'Champola Chocolate 280g (Champola Chocolate 280g)', 'Tub', '50.7', '0.00%', '0.00%', '50.7', '0', '0.00%', '2020-03-19 18:01:56'),
(91, 1, 3, 1, 'Chefmaster Gelbase-Black (Chefmaster Gelbase-Black)', 'ea', '90', '0.00%', '0.00%', '90', '0', '0.00%', '2020-03-19 18:01:56'),
(92, 1, 3, 1, 'Chefmaster gelbase-blue (Chefmaster gelbase-blue  )', 'Bot', '70', '0.00%', '0.00%', '95', '0', '0.00%', '2020-03-19 18:01:56'),
(93, 1, 3, 1, 'Chefmaster gelbase-brown (Chefmaster gelbase-brown  )', 'Bot', '75', '0.00%', '0.00%', '75', '0', '0.00%', '2020-03-19 18:01:56'),
(94, 1, 3, 1, 'Chefmaster gelbase-green (Chefmaster gelbase-green  )', 'Bot', '70', '0.00%', '0.00%', '75', '0', '0.00%', '2020-03-19 18:01:56'),
(95, 1, 3, 1, 'Chefmaster gelbase-orange (Chefmaster gelbase-orange  )', 'ea', '75', '0.00%', '0.00%', '75', '0', '0.00%', '2020-03-19 18:01:56'),
(96, 1, 3, 1, 'Chefmaster gelbase-red (Chefmaster gelbase-red  )', 'Bot', '90', '0.00%', '0.00%', '95', '0', '0.00%', '2020-03-19 18:01:56'),
(97, 1, 3, 1, 'Chefmaster Gelbase-Yellow (Chefmaster Gelbase-Yellow)', 'ea', '70', '0.00%', '0.00%', '70', '0', '0.00%', '2020-03-19 18:01:56'),
(98, 1, 3, 1, 'Chefmaster gelbase maroon (Chefmaster gelbase maroon  )', 'Bot', '75', '0.00%', '0.00%', '75', '0', '0.00%', '2020-03-19 18:01:56'),
(99, 1, 3, 1, 'Chefmaster gelbase pink (Chefmaster gelbase pink  )', 'Bot', '90', '0.00%', '0.00%', '95', '0', '0.00%', '2020-03-19 18:01:56'),
(100, 1, 3, 1, 'Chefmaster gelbase violet (Chefmaster gelbase violet  )', 'Bot', '95', '0.00%', '0.00%', '95', '0', '0.00%', '2020-03-19 18:01:56'),
(101, 1, 3, 1, 'Cherry bake cheesecake (Cherry bake cheesecake  )', 'ea', '33.46', '0.01%', '0.00%', '33.46', '133.84', '0.01%', '2020-03-19 18:01:56'),
(102, 1, 3, 1, 'Cherry Chilled Cake (Cherry Chilled Cake  )', 'ea', '31.48', '0.00%', '0.00%', '31.48', '0', '0.00%', '2020-03-19 18:01:56'),
(103, 1, 3, 1, 'Cherry square (Cherry square  )', 'ea', '42.73', '0.04%', '0.00%', '42.73', '683.68', '0.04%', '2020-03-19 18:01:56'),
(104, 1, 3, 1, 'Cherry tomato (Cherry tomato (GV -changes)  )', 'grms', '0.24', '0.04%', '0.00%', '0.86401', '2242.97', '0.13%', '2020-03-19 18:01:56'),
(105, 1, 3, 1, 'Chicken Lumpia (Chicken Lumpia)', 'ea', '3.92', '0.00%', '0.00%', '3.92', '0', '0.00%', '2020-03-19 18:01:56'),
(106, 1, 3, 1, 'Chili Sauce 340gms (Chili Sauce 340gms/bot)', 'Bot', '34.15', '0.02%', '0.00%', '31.6', '316', '0.02%', '2020-03-19 18:01:56'),
(107, 1, 3, 1, 'Choc.Fudge (Choc.Fudge)', 'grms', '0.24', '0.00%', '0.00%', '0.239', '0', '0.00%', '2020-03-19 18:01:56'),
(108, 1, 3, 1, 'Choco Cake 12x12 (Choco Cake 12x12)', 'ea', '142.69', '0.02%', '0.00%', '142.69', '285.38', '0.02%', '2020-03-19 18:01:56'),
(109, 1, 3, 1, 'Choco Ganache (Choco Ganache    )', 'ea', '26.77', '0.04%', '0.00%', '26.77', '588.94', '0.04%', '2020-03-19 18:01:56'),
(110, 1, 3, 1, 'Choco Ganache Base (Choco Ganache Base)', 'ea', '11.89', '0.00%', '0.00%', '11.89', '0', '0.00%', '2020-03-19 18:01:56'),
(111, 1, 3, 1, 'Choco Knots Blast 28g (Choco Knots Blast 28g)', 'Pck', '0', '0.00%', '0.00%', '5.25', '0', '0.00%', '2020-03-19 18:01:56'),
(112, 1, 3, 1, 'Choco Moist Base (Choco Moist Base)', 'ea', '117.44', '0.06%', '0.00%', '117.44', '1056.96', '0.06%', '2020-03-19 18:01:56'),
(113, 1, 3, 1, 'Choco rumbles (Choco rumbles  )', 'ea', '24.13', '0.03%', '0.00%', '24.13', '482.6', '0.03%', '2020-03-19 18:01:56'),
(114, 1, 3, 1, 'Choco square (Choco square  )', 'ea', '32.38', '0.04%', '0.00%', '32.38', '712.36', '0.04%', '2020-03-19 18:01:56'),
(115, 1, 3, 1, 'Chocolate coins (Chocolate coins  )', 'ea', '1.51', '0.00%', '0.00%', '1.51', '0', '0.00%', '2020-03-19 18:01:56'),
(116, 1, 3, 1, 'Chocolate Decadent (Chocolate Decadent  )', 'ea', '52.08', '0.00%', '0.00%', '52.08', '0', '0.00%', '2020-03-19 18:01:56'),
(117, 1, 3, 1, 'Chocolate fudgecake (Chocolate fudgecake  )', 'ea', '37.52', '0.00%', '0.00%', '37.52', '0', '0.00%', '2020-03-19 18:01:56'),
(118, 1, 3, 1, 'Chocolate Ganache (Chocolate Ganache 5kl/pail)', 'grms', '1.51', '1.07%', '0.00%', '0.49665', '5959.8', '0.35%', '2020-03-19 18:01:56'),
(119, 1, 3, 1, 'Chocolate layer (Chocolate layer  )', 'ea', '59.26', '0.00%', '0.00%', '59.26', '0', '0.00%', '2020-03-19 18:01:56'),
(120, 1, 3, 1, 'Chocolate Waffer 20s (Chocolate Waffer 20s)', 'Pck', '36.9', '0.00%', '0.00%', '36.9', '0', '0.00%', '2020-03-19 18:01:56'),
(121, 1, 3, 1, 'Christmas  gumpaste (Christmas  gumpaste  )', 'ea', '70', '0.00%', '0.00%', '70', '0', '0.00%', '2020-03-19 18:01:56'),
(122, 1, 3, 1, 'Christmas Sign Plastic Topper (Christmas Sign Plastic Topper)', 'ea', '60', '0.04%', '0.00%', '60', '600', '0.04%', '2020-03-19 18:01:56'),
(123, 1, 3, 1, 'Cinderella Figurine(Imported) (Cinderella Figurine(Imported))', 'ea', '65', '0.00%', '0.00%', '75', '0', '0.00%', '2020-03-19 18:01:56'),
(124, 1, 3, 1, 'Cindy Figurine ( Local) (Cindy Figurine ( Local))', 'ea', '30', '0.00%', '0.00%', '30', '0', '0.00%', '2020-03-19 18:01:56'),
(125, 1, 3, 1, 'Cino Machine (Cino Machine)', 'ea', '3746.8', '-0.45%', '0.00%', '4026.8', '-8053.6', '-0.47%', '2020-03-19 18:01:56'),
(126, 1, 3, 1, 'Clara Ole Mapple Pancake Syrup (Clara Ole Mapple Pancake Syrup 355ml)', 'Bot', '102.07', '0.06%', '0.00%', '105.5', '1102.48', '0.07%', '2020-03-19 18:01:56'),
(127, 1, 3, 1, 'Clara Ole Mrshno Chrs 1050g (Clara Ole Mrshno Chrs 1050g)', 'Bot', '310.9', '0.00%', '0.00%', '310.9', '0', '0.00%', '2020-03-19 18:01:56'),
(128, 1, 3, 1, 'Cocktail Picks 100s (Cocktail Picks 100s)', 'Pck', '32.4', '0.00%', '0.00%', '32.4', '45.04', '0.00%', '2020-03-19 18:01:56'),
(129, 1, 3, 1, 'Cocktail tissue (Cocktail tissue  )', 'Roll', '24', '0.10%', '0.00%', '23.75', '1591.25', '0.09%', '2020-03-19 18:01:56'),
(130, 1, 3, 1, 'Coconut Tree w/Fruit Accs (Coconut Tree w/Fruit Accs)', 'ea', '15', '0.00%', '0.00%', '15', '0', '0.00%', '2020-03-19 18:01:56'),
(131, 1, 3, 1, 'Coffee 3 in 1 (12x36x 20 gms) (Coffee 3 in 1 (12x36x 20 gms)  )', 'ea', '2.78', '0.00%', '0.00%', '2.78', '0', '0.00%', '2020-03-19 18:01:56'),
(132, 1, 3, 1, 'Coffee Beans - Rabecca Columbia (Coffee Beans - Rabecca Columbia)', 'grms', '1.09', '0.00%', '0.00%', '1.1', '0', '0.00%', '2020-03-19 18:01:56'),
(133, 1, 3, 1, 'Coffee Mate (Coffee Mate 48pcsx20grms/pack)', 'ea', '1.65', '0.09%', '0.00%', '1.65', '1513.05', '0.09%', '2020-03-19 18:01:56'),
(134, 1, 3, 1, 'Coffee Sticks (21x48x2 gms) (Coffee sticks ( 21x48x2 gms)  )', 'ea', '1.9', '0.00%', '0.00%', '1.9', '0', '0.00%', '2020-03-19 18:01:56'),
(135, 1, 3, 1, 'Coke 1.5L (Coke 1.5L)', 'ea', '0', '0.00%', '0.00%', '44.75', '0', '0.00%', '2020-03-19 18:01:56'),
(136, 1, 3, 1, 'Coke Light in Can (Coke Light in Can)', 'ea', '24.71', '0.12%', '0.00%', '24.44', '1955.2', '0.12%', '2020-03-19 18:01:56'),
(137, 1, 3, 1, 'Coke Mismo (Coke Mismo)', 'ea', '12.08', '0.00%', '0.00%', '12.08333', '0', '0.00%', '2020-03-19 18:01:56'),
(138, 1, 3, 1, 'Coke Regular in Can (Coke Regular in Can)', 'ea', '24.92', '0.28%', '0.00%', '24.91667', '4634.5', '0.27%', '2020-03-19 18:01:56'),
(139, 1, 3, 1, 'Coke zero can (Coke zero can 330ml 1x24)', 'ea', '23.71', '0.15%', '0.00%', '23.70833', '2536.79', '0.15%', '2020-03-19 18:01:56'),
(140, 1, 3, 1, 'Comstock Red Ruby Cherry (Comstock Red Ruby Cherry 210z 12\'s)', 'Bot', '187.1', '0.29%', '0.00%', '196.96', '5219.44', '0.31%', '2020-03-19 18:01:56'),
(141, 1, 3, 1, 'Comstock Royal Blueberry (Comstock Royal Blueberry 21oz 12\'s)', 'Bot', '204.75', '0.43%', '0.00%', '205', '7257', '0.43%', '2020-03-19 18:01:56'),
(142, 1, 3, 1, 'Comstock Strawberry (Comstock Strawberry 210oz)', 'Bot', '167.85', '0.00%', '0.00%', '167.85', '0', '0.00%', '2020-03-19 18:01:56'),
(143, 1, 3, 1, 'Cotton Candy Gelato (Cotton Candy Gelato)', 'ea', '72.8', '0.00%', '0.00%', '89.38', '0', '0.00%', '2020-03-19 18:01:56'),
(144, 1, 3, 1, 'Cotton Candy Pints (Cotton Candy Pints)', 'ea', '336', '0.00%', '0.00%', '385', '0', '0.00%', '2020-03-19 18:01:56'),
(145, 1, 3, 1, 'Cream-O vanilla (Cream-O vanilla)', 'Pck', '59.45', '0.02%', '0.00%', '59.45', '404.26', '0.02%', '2020-03-19 18:01:56'),
(146, 1, 3, 1, 'Cream Vanilla JR 80g (Cream Vanilla JR 80g)', 'Bot', '13.05', '0.00%', '0.00%', '13.05', '0', '0.00%', '2020-03-19 18:01:56'),
(147, 1, 3, 1, 'Crown Prince Clams 6.50z (Crown Prince Clams 6.50z)', 'Can', '129.95', '0.00%', '0.00%', '129.95', '0', '0.00%', '2020-03-19 18:01:56'),
(148, 1, 3, 1, 'Crushed Grahams 200g (Crushed Grahams 200g)', 'Pck', '31.99', '0.00%', '0.00%', '33', '0', '0.00%', '2020-03-19 18:01:56'),
(149, 1, 3, 1, 'Dad Bear Black Pearl Straw (Dad Bear Black Pearl Straw 25s)', 'ea', '1.59', '0.00%', '0.00%', '1.592', '0', '0.00%', '2020-03-19 18:01:56'),
(150, 1, 3, 1, 'Daffodil (Daffodil)', 'Pck', '14', '0.00%', '0.00%', '14', '0', '0.00%', '2020-03-19 18:01:56'),
(151, 1, 3, 1, 'Dark Chocolate Sauce 1890ml/Bot (Dark Chocolate Sauce 1890ml/Bot)', 'ML', '0.37', '0.04%', '0.00%', '0.3746', '707.99', '0.04%', '2020-03-19 18:01:56'),
(152, 1, 3, 1, 'Dedication cake choco (Dedication cake choco  )', 'ea', '118.89', '0.04%', '0.00%', '118.89', '713.34', '0.04%', '2020-03-19 18:01:56'),
(153, 1, 3, 1, 'Dilmah Earl gray tea (Dilmah Earl gray tea  )', 'ea', '5.6', '0.06%', '0.00%', '5.6', '1013.6', '0.06%', '2020-03-19 18:01:56'),
(154, 1, 3, 1, 'Dilmah English breakfast tea (Dilmah English breakfast tea  )', 'ea', '5.6', '0.04%', '0.00%', '5.6', '739.2', '0.04%', '2020-03-19 18:01:56'),
(155, 1, 3, 1, 'Dilmah lychees tea (Dilmah lychees tea  )', 'ea', '5.6', '0.00%', '0.00%', '5.6', '0', '0.00%', '2020-03-19 18:01:56'),
(156, 1, 3, 1, 'Dilmah Pure Green Tea  1000pcs/ (Dilmah Pure Green Tea  1000pcs/box)', 'ea', '5.6', '0.06%', '0.00%', '5.6', '1019.2', '0.06%', '2020-03-19 18:01:56'),
(157, 1, 3, 1, 'Disney Princess styro DP (Disney Princess styro (DP styro))', 'ea', '15', '0.00%', '0.00%', '15', '30', '0.00%', '2020-03-19 18:01:56'),
(158, 1, 3, 1, 'Disposable Fork (Disposable Fork)', 'ea', '0.7', '0.01%', '0.00%', '0.67', '167.5', '0.01%', '2020-03-19 18:01:56'),
(159, 1, 3, 1, 'Disposable spoon (Disposable spoon  )', 'ea', '0.76', '0.01%', '0.00%', '0.87', '217.5', '0.01%', '2020-03-19 18:01:56'),
(160, 1, 3, 1, 'DM  FSJ. Free (DM  FSJ. Free)', 'ea', '17.5', '0.00%', '0.00%', '17.5', '0', '0.00%', '2020-03-19 18:01:56'),
(161, 1, 3, 1, 'DM Four Seasons (DM four seasons)', 'ea', '24.29', '0.20%', '0.00%', '24.28583', '3424.3', '0.20%', '2020-03-19 18:01:56'),
(162, 1, 3, 1, 'DM Mango Juice (DM mango juice)', 'ea', '29.05', '0.23%', '0.00%', '29.05', '3892.7', '0.23%', '2020-03-19 18:01:56'),
(163, 1, 3, 1, 'DM Orange (DM Orange)', 'ea', '17.88', '0.10%', '0.00%', '24.28583', '2210.01', '0.13%', '2020-03-19 18:01:56'),
(164, 1, 3, 1, 'DM Original Blend Ketchup 12oz (DM Original Blend Ketchup 12oz)', 'Bot', '31.75', '0.00%', '0.00%', '31.75', '0', '0.00%', '2020-03-19 18:01:56'),
(165, 1, 3, 1, 'DM Pineapple Orange (DM pineapple orange)', 'ea', '23.49', '0.25%', '0.00%', '23.80917', '4285.65', '0.25%', '2020-03-19 18:01:56'),
(166, 1, 3, 1, 'DM Pineapple Sweetened (DM pineapple sweetened)', 'ea', '24.29', '0.40%', '0.00%', '24.28583', '6702.89', '0.39%', '2020-03-19 18:01:56'),
(167, 1, 3, 1, 'DM Pineapple Unsweetened (DM pineapple unsweetened)', 'ea', '23.33', '0.14%', '0.00%', '23.19', '2365.38', '0.14%', '2020-03-19 18:01:56'),
(168, 1, 3, 1, 'DM SweetndOrange Juice 202/240m (Sweetened Orange Juice 202/240ml w/free)', 'ea', '14.65', '0.10%', '0.00%', '23.80917', '2857.1', '0.17%', '2020-03-19 18:01:56'),
(169, 1, 3, 1, 'Donut Shop (Donut Shop)', 'ea', '22.35', '0.00%', '0.00%', '22.35', '-44.7', '0.00%', '2020-03-19 18:01:56'),
(170, 1, 3, 1, 'Double Dark Choco (Double Dark Choco)', 'ea', '89.6', '0.00%', '0.00%', '110', '0', '0.00%', '2020-03-19 18:01:56'),
(171, 1, 3, 1, 'Double Dark Pints (Double Dark Pints)', 'Tub', '358.4', '0.00%', '0.00%', '385', '0', '0.00%', '2020-03-19 18:01:56'),
(172, 1, 3, 1, 'Dragees 4mm Red (Dragees 4mm Red)', 'Pck', '63', '0.00%', '0.00%', '63', '0', '0.00%', '2020-03-19 18:01:56'),
(173, 1, 3, 1, 'Dragees 8mm Red (Dragees 8mm Red 1 kg)', 'Pck', '63', '0.00%', '0.00%', '63', '0', '0.00%', '2020-03-19 18:01:56'),
(174, 1, 3, 1, 'Duncanhines Comstock FruitCherr (Duncanhines Comstock FruitCherry 21oz)', 'Bot', '329.95', '0.00%', '0.00%', '329.95', '0', '0.00%', '2020-03-19 18:01:56'),
(175, 1, 3, 1, 'Durain meat (Durain meat  )', 'grms', '0.45', '0.00%', '0.00%', '0.3', '0', '0.00%', '2020-03-19 18:01:56'),
(176, 1, 3, 1, 'Durian Chilled Cake (Durian Chilled Cake  )', 'ea', '39.75', '0.04%', '0.00%', '39.75', '636', '0.04%', '2020-03-19 18:01:56'),
(177, 1, 3, 1, 'Durian Meat (Durian Meat)', 'Kls', '159.56', '0.00%', '0.00%', '90', '0', '0.00%', '2020-03-19 18:01:56'),
(178, 1, 3, 1, 'Early Grey Foil Tbag 100 (Early Grey Foil Tbag 100)', 'Box', '560', '0.00%', '0.00%', '0', '0', '0.00%', '2020-03-19 18:01:56'),
(179, 1, 3, 1, 'Egg Pie (Egg Pie  )', 'ea', '18.75', '0.01%', '0.00%', '18.75', '93.75', '0.01%', '2020-03-19 18:01:56'),
(180, 1, 3, 1, 'Eight O\'Clock Juice 350g/pack (Eight O\'Clock Juice 350g/pack)', 'Pck', '92.4', '0.00%', '0.00%', '92.4', '0', '0.00%', '2020-03-19 18:01:56'),
(181, 1, 3, 1, 'Eight O\'Clock Orange 87.5g (Eight O\'Clock Orange 87.5g)', 'Pck', '23.1', '0.00%', '0.00%', '23.5', '0', '0.00%', '2020-03-19 18:01:56'),
(182, 1, 3, 1, 'Eiht O\'clock Orange 175g (Eiht O\'clock Orange 175g)', 'Pck', '46.44', '0.00%', '0.00%', '46.44', '0', '0.00%', '2020-03-19 18:01:56'),
(183, 1, 3, 1, 'Elsa figurine (Elsa figurine  )', 'ea', '30', '0.02%', '0.00%', '34.69', '312.21', '0.02%', '2020-03-19 18:01:56'),
(184, 1, 3, 1, 'Elsa Figurine (imported) (Elsa Figurine (imported))', 'ea', '60', '0.00%', '0.00%', '60', '0', '0.00%', '2020-03-19 18:01:56'),
(185, 1, 3, 1, 'Elsa styro (Elsa styro  )', 'ea', '15', '0.00%', '0.00%', '15', '0', '0.00%', '2020-03-19 18:01:56'),
(186, 1, 3, 1, 'Equal Powder 100g (Equal Powder 100g)', 'Pck', '225.95', '0.00%', '0.00%', '225.95', '0', '0.00%', '2020-03-19 18:01:56'),
(187, 1, 3, 1, 'Equal Powder 12g (Equal Powder 12g)', 'Box', '33.45', '0.00%', '0.00%', '33.45', '0', '0.00%', '2020-03-19 18:01:56'),
(188, 1, 3, 1, 'Equal Sugar (Equal Sugar)', 'ea', '2.05', '0.01%', '0.00%', '2.15', '240.8', '0.01%', '2020-03-19 18:01:56'),
(189, 1, 3, 1, 'Espreso Blend 250 grams (Espreso Blend (250 grams))', 'grms', '1.1', '0.00%', '0.00%', '1.1', '0', '0.00%', '2020-03-19 18:01:56'),
(190, 1, 3, 1, 'Euro Water 500ml (Euro Water 500ml)', 'Bot', '6.5', '1.95%', '0.00%', '6.9', '34879.5', '2.04%', '2020-03-19 18:01:56'),
(191, 1, 3, 1, 'Evening Blend (Evening Blend)', 'grms', '0.7', '0.62%', '0.00%', '0.7', '10500', '0.62%', '2020-03-19 18:01:56'),
(192, 1, 3, 1, 'Ferrawr Gelato (Ferrawr Gelato)', 'ea', '89.6', '-0.03%', '0.00%', '110', '-550', '-0.03%', '2020-03-19 18:01:56'),
(193, 1, 3, 1, 'Ferrerawr Pints (Ferrerawr Pints)', 'Tub', '358.4', '0.00%', '0.00%', '385', '0', '0.00%', '2020-03-19 18:01:56'),
(194, 1, 3, 1, 'Figurine ( Local) (Figurine ( Local))', 'ea', '30', '0.00%', '0.00%', '30', '0', '0.00%', '2020-03-19 18:01:56'),
(195, 1, 3, 1, 'Flag picks (Flag picks   )', 'ea', '0.61', '0.00%', '0.00%', '1.81', '0', '0.00%', '2020-03-19 18:01:56'),
(196, 1, 3, 1, 'Flavored Mocha (Flavored Mocha)', 'Bot', '215.78', '0.00%', '0.00%', '215.78', '0', '0.00%', '2020-03-19 18:01:56'),
(197, 1, 3, 1, 'Flower Cutter (Flower Cutter)', 'ea', '415', '0.00%', '0.00%', '415', '0', '0.00%', '2020-03-19 18:01:56'),
(198, 1, 3, 1, 'Flower Lifter (Flower Lifter)', 'ea', '29', '0.00%', '0.00%', '29', '0', '0.00%', '2020-03-19 18:01:56'),
(199, 1, 3, 1, 'Flower Rose Accs (Flower Rose Accs)', 'ea', '12', '0.00%', '0.00%', '15', '0', '0.00%', '2020-03-19 18:01:56'),
(200, 1, 3, 1, 'Flowerettes ( Forget me not) (Flowerettes ( Forget me not))', 'ea', '16', '0.10%', '0.00%', '16', '1600', '0.09%', '2020-03-19 18:01:56'),
(201, 1, 3, 1, 'Flowerettes icing (Flowerettes icing  )', 'ea', '16', '0.00%', '0.00%', '15', '0', '0.00%', '2020-03-19 18:01:56'),
(202, 1, 3, 1, 'Flowerrettes (Flowerrettes)', 'Pck', '12', '0.02%', '0.00%', '20', '460', '0.03%', '2020-03-19 18:01:56'),
(203, 1, 3, 1, 'Fondant Icing (Fondant Icing)', 'Kls', '265', '0.06%', '0.00%', '260', '1040', '0.06%', '2020-03-19 18:01:56'),
(204, 1, 3, 1, 'Frank further Sausages (Frank further Sausages 1KL/pack X 7pcs 120g)', 'grms', '0.52', '0.00%', '0.00%', '0.36', '0', '0.00%', '2020-03-19 18:01:56'),
(205, 1, 3, 1, 'Frappe Mix Java Chip (Frappe Mix Java Chip 1360ml/Jar)', 'ML', '0.73', '0.00%', '0.00%', '0.73', '0', '0.00%', '2020-03-19 18:01:56'),
(206, 1, 3, 1, 'French Dressing (French dressing  )', 'grms', '0.23', '0.00%', '0.00%', '0.23', '0', '0.00%', '2020-03-19 18:01:56'),
(207, 1, 3, 1, 'Fresh Milk -Nestle (Fresh Milk -Nestle)', 'Pck', '84.51', '0.80%', '0.00%', '84.50683', '13436.59', '0.79%', '2020-03-19 18:01:56'),
(208, 1, 3, 1, 'Frozen Styro (Frozen Styro)', 'ea', '15.77', '0.01%', '0.00%', '15', '150', '0.01%', '2020-03-19 18:01:56'),
(209, 1, 3, 1, 'Galor Black Pepper 100g (Galor Black Pepper 100g)', 'Bot', '87.9', '0.00%', '0.00%', '87.9', '0', '0.00%', '2020-03-19 18:01:56'),
(210, 1, 3, 1, 'Garlic Stick (1 KILO) (Garlic Stick (1 KILO))', 'Kls', '96.34', '0.00%', '0.00%', '96.35', '0', '0.00%', '2020-03-19 18:01:56'),
(211, 1, 3, 1, 'Green Chocolate (Green Chocolate 500g/bar)', 'grms', '0.34', '0.00%', '0.00%', '0.46', '0', '0.00%', '2020-03-19 18:01:56'),
(212, 1, 3, 1, 'Green Tea Gelato (Green Tea Gelato)', 'ea', '72.8', '0.00%', '0.00%', '110', '0', '0.00%', '2020-03-19 18:01:56'),
(213, 1, 3, 1, 'Green Tea Pints (Green Tea Pints)', 'Tub', '336', '0.00%', '0.00%', '385', '0', '0.00%', '2020-03-19 18:01:56'),
(214, 1, 3, 1, 'Gumpaste Fondant (Gumpaste Fondant   )', 'ea', '18', '0.01%', '0.00%', '14', '140', '0.01%', '2020-03-19 18:01:56'),
(215, 1, 3, 1, 'GV Shakepowder cks&crm 100g (GV Shakepowder cks&crm 100g)', 'Pck', '0', '0.00%', '0.00%', '26.75', '0', '0.00%', '2020-03-19 18:01:56'),
(216, 1, 3, 1, 'Happy Bday Candle (Happy Bday Candle)', 'ea', '45', '0.03%', '0.00%', '0', '0', '0.00%', '2020-03-19 18:01:56'),
(217, 1, 3, 1, 'Happy birthday  styro (Happy birthday  styro  )', 'ea', '14.29', '0.00%', '0.00%', '15', '0', '0.00%', '2020-03-19 18:01:56'),
(218, 1, 3, 1, 'Happy Birthday ( Letter) (Happy Birthday ( Letter))', 'ea', '45', '0.00%', '0.00%', '45', '0', '0.00%', '2020-03-19 18:01:56'),
(219, 1, 3, 1, 'Happy birthday Styro (Happy birthday Styro)', 'ea', '15', '0.01%', '0.00%', '14', '84', '0.01%', '2020-03-19 18:01:56'),
(220, 1, 3, 1, 'Happy christening (Happy christening  )', 'ea', '15.89', '0.01%', '0.00%', '15', '195', '0.01%', '2020-03-19 18:01:56'),
(221, 1, 3, 1, 'Hazelnut  750ml/bot (Hazelnut  750ml/bot)', 'ML', '0.52', '0.00%', '0.00%', '0.52', '0', '0.00%', '2020-03-19 18:01:56'),
(222, 1, 3, 1, 'HB Ballons Acrylic Topper (HB Ballons Acrylic Topper)', 'ea', '58', '0.00%', '0.00%', '0', '0', '0.00%', '2020-03-19 18:01:56'),
(223, 1, 3, 1, 'HB Banner Acrylic Topper (HB Banner Acrylic Topper)', 'ea', '58', '0.00%', '0.00%', '0', '0', '0.00%', '2020-03-19 18:01:56'),
(224, 1, 3, 1, 'HB Candle Acrylic Topper (HB Candle Acrylic Topper)', 'ea', '58', '0.00%', '0.00%', '58', '0', '0.00%', '2020-03-19 18:01:56'),
(225, 1, 3, 1, 'HB Flower Acrylic Topper (HB Flower Acrylic Topper)', 'ea', '95', '0.00%', '0.00%', '0', '0', '0.00%', '2020-03-19 18:01:56'),
(226, 1, 3, 1, 'HB Sea Acrylic Topper (HB Sea Acrylic Topper)', 'ea', '95', '0.00%', '0.00%', '95', '0', '0.00%', '2020-03-19 18:01:56'),
(227, 1, 3, 1, 'HB Styro Baech Board (Happy birthday Styro (Beach Board)  )', 'ea', '0', '0.00%', '0.00%', '14', '0', '0.00%', '2020-03-19 18:01:56'),
(228, 1, 3, 1, 'Heart Sprinkles (Heart Sprinkles)', 'grms', '0.45', '0.00%', '0.00%', '0.45', '0', '0.00%', '2020-03-19 18:01:56'),
(229, 1, 3, 1, 'Heinz Toamato Mustard 20oz (Heinz Toamato Mustard 20oz)', 'Bot', '156.26', '0.00%', '0.00%', '159.95', '0', '0.00%', '2020-03-19 18:01:56'),
(230, 1, 3, 1, 'Heinz Tomatoe Ketchup Easy Sque (Heinz Tomatoe Ketchup Easy Sque)', 'Can', '129', '0.19%', '0.00%', '129', '3225', '0.19%', '2020-03-19 18:01:56'),
(231, 1, 3, 1, 'Hello kitty Figurine (Hello kitty Figurine)', 'ea', '30.91', '0.02%', '0.00%', '32', '384', '0.02%', '2020-03-19 18:01:56'),
(232, 1, 3, 1, 'Hello Kitty Styro (Hello Kitty Styro)', 'ea', '15.83', '0.01%', '0.00%', '15', '165', '0.01%', '2020-03-19 18:01:56'),
(233, 1, 3, 1, 'Herbal Pillow-Shoulder patch (Herbal Pillow-Shoulder patch)', 'ea', '0', '0.00%', '0.00%', '980', '0', '0.00%', '2020-03-19 18:01:56'),
(234, 1, 3, 1, 'Herbal Pillow-Waist pad (Herbal Pillow-Waist pad)', 'ea', '0', '0.00%', '0.00%', '1200', '0', '0.00%', '2020-03-19 18:01:56'),
(235, 1, 3, 1, 'Hugh Blend (Hugh Blend)', 'ea', '19.25', '0.00%', '0.00%', '19.25', '0', '0.00%', '2020-03-19 18:01:56'),
(236, 1, 3, 1, 'Icing (Icing)', 'grms', '0.2', '0.00%', '0.00%', '0.2', '0', '0.00%', '2020-03-19 18:01:56'),
(237, 1, 3, 1, 'Irish Cream 750g/bot (Irish Cream 750g/bot)', 'ML', '0.52', '0.05%', '0.00%', '0.52267', '905.79', '0.05%', '2020-03-19 18:01:56'),
(238, 1, 3, 1, 'JC02 Jelly Cup (JC02 Jelly Cup)', 'ea', '65', '0.00%', '0.00%', '65', '0', '0.00%', '2020-03-19 18:01:56'),
(239, 1, 3, 1, 'Jolly Marschno Cherries w/stem (Jolly Marschno Cherries w/stem 260z)', 'Can', '321.65', '0.07%', '0.00%', '321.65', '1132.21', '0.07%', '2020-03-19 18:01:56'),
(240, 1, 3, 1, 'Jolly Mushrom Cherry 720z (Jolly Mushrom Cherry 720z)', 'Bot', '827', '0.20%', '0.00%', '827', '3308', '0.19%', '2020-03-19 18:01:56'),
(241, 1, 3, 1, 'Jufran Swt Chili Sauce 355/330g (Chili Sauce 355/330g)', 'Bot', '39.05', '0.00%', '0.00%', '39.05', '0', '0.00%', '2020-03-19 18:01:56'),
(242, 1, 3, 1, 'KirkLand Breakfast (KirkLand Breakfast)', 'ea', '32.06', '0.00%', '0.00%', '32.06', '-32.06', '0.00%', '2020-03-19 18:01:56'),
(243, 1, 3, 1, 'Kopiko La Cafe Hngr 25gx10s (Kopiko La Cafe Hngr 25gx10s)', 'ea', '0', '0.00%', '0.00%', '5.1', '0', '0.00%', '2020-03-19 18:01:56'),
(244, 1, 3, 1, 'Kopiko La Coffee (Kopiko La Coffee 25gx10)', 'Pck', '52.55', '0.00%', '0.00%', '52.55', '0', '0.00%', '2020-03-19 18:01:56'),
(245, 1, 3, 1, 'L-Fold Tissue (L-Fold Tissue (30pcks/case) Femme)', 'Pck', '43.33', '0.00%', '0.00%', '43.333', '0', '0.00%', '2020-03-19 18:01:56'),
(246, 1, 3, 1, 'Laughing Man (Laughing Man)', 'ea', '19.25', '-0.01%', '0.00%', '0', '0', '0.00%', '2020-03-19 18:01:56'),
(247, 1, 3, 1, 'Leekumkee Chili Ketchup 18.5oz (Leekumkee Chili Ketchup 18.5oz)', 'Bot', '229', '0.00%', '0.00%', '229', '0', '0.00%', '2020-03-19 18:01:56'),
(248, 1, 3, 1, 'Lemon Mint (Lemon Mint)', 'ea', '32.83', '0.00%', '0.00%', '32.83', '0', '0.00%', '2020-03-19 18:01:56'),
(249, 1, 3, 1, 'Little mermaid imported (Little mermaid imported  )', 'ea', '50', '0.00%', '0.00%', '50', '0', '0.00%', '2020-03-19 18:01:56'),
(250, 1, 3, 1, 'Little mermaid local (Little mermaid local  )', 'ea', '26.5', '0.01%', '0.00%', '30', '270', '0.02%', '2020-03-19 18:01:56'),
(251, 1, 3, 1, 'Little Mermaid Styro (Little Mermaid Styro)', 'ea', '15', '0.01%', '0.00%', '15', '150', '0.01%', '2020-03-19 18:01:56'),
(252, 1, 3, 1, 'Mango Cupcake (Mango Cupcake)', 'ea', '43.44', '0.03%', '0.00%', '43.44', '434.4', '0.03%', '2020-03-19 18:01:56'),
(253, 1, 3, 1, 'Mango Pints (Mango Pints)', 'Tub', '336', '0.00%', '0.00%', '385', '0', '0.00%', '2020-03-19 18:01:56'),
(254, 1, 3, 1, 'Maple Pancake Syrup (Maple Pancake Syrup 355ml)', 'Bot', '89.8', '0.00%', '0.00%', '89.8', '0', '0.00%', '2020-03-19 18:01:56'),
(255, 1, 3, 1, 'Mariani Sweetened Cranberries 5 (Mariani Sweetened Cranberries 50oz)', 'Bot', '229.95', '0.00%', '0.00%', '229.95', '0', '0.00%', '2020-03-19 18:01:56'),
(256, 1, 3, 1, 'Marshmallow 1kg (Marshmallow 1kg)', 'Kls', '267.85', '0.00%', '0.00%', '290', '58', '0.00%', '2020-03-19 18:01:56'),
(257, 1, 3, 1, 'MB Hot Sauce 12oz (MB Hot Sauce 12oz)', 'Bot', '32.05', '0.00%', '0.00%', '32.05', '0', '0.00%', '2020-03-19 18:01:56'),
(258, 1, 3, 1, 'MB Hot Sauce 50ml (MB Hot Sauce 50ml)', 'Bot', '15.46', '0.01%', '0.00%', '15.455', '92.73', '0.01%', '2020-03-19 18:01:56'),
(259, 1, 3, 1, 'MB Hot Sweet Chili Sauce 200Z (MB Hot Sweet Chili Sauce 200Z)', 'Bot', '52.3', '0.01%', '0.00%', '51.3', '102.6', '0.01%', '2020-03-19 18:01:56'),
(260, 1, 3, 1, 'MC  Cormick  Mustard200g (MC  Cormick  Mustard200g)', 'Bot', '68.95', '0.00%', '0.00%', '68.95', '0', '0.00%', '2020-03-19 18:01:56'),
(261, 1, 3, 1, 'Mc Cormick Italian Ssoning 16G (Mc Cormick Italian Ssoning 16G)', 'Bot', '46.65', '0.01%', '0.00%', '46.65', '93.3', '0.01%', '2020-03-19 18:01:56'),
(262, 1, 3, 1, 'Mickey & Friends Figurine (Mickey & Friends Figurine   )', 'ea', '75', '0.00%', '0.00%', '75', '0', '0.00%', '2020-03-19 18:01:56'),
(263, 1, 3, 1, 'Mickey Figurine (Mickey Figurine)', 'ea', '32', '0.01%', '0.00%', '32', '96', '0.01%', '2020-03-19 18:01:56'),
(264, 1, 3, 1, 'Mickey Styro (Mickey Styro)', 'ea', '16', '0.01%', '0.00%', '16', '80', '0.01%', '2020-03-19 18:01:56'),
(265, 1, 3, 1, 'Mini Oreo Vanilla 67g (Mini Oreo Vanilla 67g)', 'Pck', '37.05', '0.05%', '0.00%', '39.77', '835.17', '0.05%', '2020-03-19 18:01:56'),
(266, 1, 3, 1, 'Minion Figurine Local (Minion Figurine Local)', 'ea', '30', '0.04%', '0.00%', '30', '720', '0.04%', '2020-03-19 18:01:56'),
(267, 1, 3, 1, 'Minions figurine (Minions figurine  )', 'ea', '32.73', '0.00%', '0.00%', '80', '0', '0.00%', '2020-03-19 18:01:56'),
(268, 1, 3, 1, 'Minnie mouse figurine (Minnie mouse figurine  )', 'ea', '37.61', '0.00%', '0.00%', '37.61', '0', '0.00%', '2020-03-19 18:01:56'),
(269, 1, 3, 1, 'Minnie mouse Styro (Minnie mouse Styro)', 'ea', '15', '0.00%', '0.00%', '15', '75', '0.00%', '2020-03-19 18:01:56'),
(270, 1, 3, 1, 'Mint Chocolate Gelato (Mint Chocolate Gelato)', 'ea', '0', '0.00%', '0.00%', '123.2', '0', '0.00%', '2020-03-19 18:01:56'),
(271, 1, 3, 1, 'Mionion Figurine L (Mionion Figurine L)', 'ea', '25', '0.00%', '0.00%', '25', '0', '0.00%', '2020-03-19 18:01:56'),
(272, 1, 3, 1, 'MK Mini White (MK Mini White)', 'Pck', '145', '0.00%', '0.00%', '165.73', '0', '0.00%', '2020-03-19 18:01:56'),
(273, 1, 3, 1, 'Moistcake big (Moistcake big  )', 'ea', '257.37', '0.00%', '0.00%', '257.37', '0', '0.00%', '2020-03-19 18:01:56'),
(274, 1, 3, 1, 'Moistcake small (Moistcake small  )', 'ea', '134.69', '0.03%', '0.00%', '134.69', '538.76', '0.03%', '2020-03-19 18:01:56'),
(275, 1, 3, 1, 'Moreau Wine 750ml (Moreau Wine 750ml/bot)', 'ML', '0.51', '0.00%', '0.00%', '0.51', '0', '0.00%', '2020-03-19 18:01:56'),
(276, 1, 3, 1, 'Mr&Mrs Flower Acrylic Topper (Mr&Mrs Flower Acrylic Topper)', 'ea', '95', '0.00%', '0.00%', '95', '0', '0.00%', '2020-03-19 18:01:56'),
(277, 1, 3, 1, 'Muscovado sugar (Muscovado sugar  )', 'grms', '0.06', '0.00%', '0.00%', '0.06', '0', '0.00%', '2020-03-19 18:01:56'),
(278, 1, 3, 1, 'Nescafe Blend&Brew( 30x28g) (Nescafe Blend&Brew( 30x28g))', 'ea', '5.46', '0.00%', '0.00%', '5.44', '0', '0.00%', '2020-03-19 18:01:56'),
(279, 1, 3, 1, 'Nescafe Brew Original (Nescafe Brew Original 36pcs/pack)', 'ea', '5.44', '0.14%', '0.00%', '5.44033', '2284.94', '0.13%', '2020-03-19 18:01:56'),
(280, 1, 3, 1, 'Nescafe Sticks 48x2g (Nescafe Sticks 48x2g)', 'ea', '1.9', '0.15%', '0.00%', '1.9', '2470', '0.15%', '2020-03-19 18:01:56'),
(281, 1, 3, 1, 'Nestea House Blend 200gx12 (Nestea House Blend 200gx12)', 'ea', '189.53', '0.11%', '0.00%', '189.53', '1895.3', '0.11%', '2020-03-19 18:01:56'),
(282, 1, 3, 1, 'Nestea Lemon 450g (Nestea Lemon 450g)', 'Pck', '169.95', '0.00%', '0.00%', '169.95', '0', '0.00%', '2020-03-19 18:01:56'),
(283, 1, 3, 1, 'Nestea Restaurant Blend (Nestea Restaurant Blend)', 'ea', '2.83', '0.00%', '0.00%', '2.83', '0', '0.00%', '2020-03-19 18:01:56'),
(284, 1, 3, 1, 'Nestea Restaurant Blend - 360g (Nestea Restaurant Blend (12x360g))', 'ea', '171.31', '0.00%', '0.00%', '195.64', '0', '0.00%', '2020-03-19 18:01:56'),
(285, 1, 3, 1, 'Nestle Sour Cream 240g (Nestle Sour Cream 240g)', 'Pck', '90', '0.00%', '0.00%', '90', '0', '0.00%', '2020-03-19 18:01:56'),
(286, 1, 3, 1, 'Orange Lemonade (Orange Lemonade)', 'ea', '43.83', '0.00%', '0.00%', '43.83', '0', '0.00%', '2020-03-19 18:01:56'),
(287, 1, 3, 1, 'Oreo Cookies (Oreo Cookies)', 'ea', '39.5', '0.00%', '0.00%', '39.5', '0', '0.00%', '2020-03-19 18:01:56'),
(288, 1, 3, 1, 'Oreo Cookies Cake (Oreo Cookies Cake)', 'ea', '15.71', '0.00%', '0.00%', '15.71', '0', '0.00%', '2020-03-19 18:01:56'),
(289, 1, 3, 1, 'Oreo Crushed 454g (Oreo Crushed 454g)', 'Pck', '149.5', '0.00%', '0.00%', '149.67', '0', '0.00%', '2020-03-19 18:01:56'),
(290, 1, 3, 1, 'Paper Doll Frozen/Cindy (Paper Doll Frozen/Cindy)', 'ea', '0', '0.00%', '0.00%', '20', '0', '0.00%', '2020-03-19 18:01:56'),
(291, 1, 3, 1, 'Parchment Paper (Wilton) (Parchment Paper (Wilton))', 'Roll', '69.75', '0.00%', '0.00%', '279', '0', '0.00%', '2020-03-19 18:01:56'),
(292, 1, 3, 1, 'Pastry Bag (Pastry Bag)', 'ea', '25', '0.00%', '0.00%', '25', '0', '0.00%', '2020-03-19 18:01:56'),
(293, 1, 3, 1, 'Peppermint   750ml (Peppermint   750ml/bot)', 'Bot', '392', '0.05%', '0.00%', '392', '838.88', '0.05%', '2020-03-19 18:01:56'),
(294, 1, 3, 1, 'Peppermint Foil Tbag (Peppermint Foil Tbag)', 'ea', '7', '0.00%', '0.00%', '7', '0', '0.00%', '2020-03-19 18:01:56'),
(295, 1, 3, 1, 'Pike Place (Pike Place)', 'ea', '30.32', '-0.05%', '0.00%', '30.32', '-879.28', '-0.05%', '2020-03-19 18:01:56'),
(296, 1, 3, 1, 'Pineapple fresh (Pineapple fresh  )', 'grms', '0.02', '0.03%', '0.00%', '0.035', '719.95', '0.04%', '2020-03-19 18:01:56'),
(297, 1, 3, 1, 'Pistacchio Gelato (Pistacchio Gelato)', 'ea', '89.6', '-0.01%', '0.00%', '110', '-220', '-0.01%', '2020-03-19 18:01:56'),
(298, 1, 3, 1, 'Pistachio Pints (Pistachio Pints)', 'Tub', '358.4', '0.00%', '0.00%', '385', '0', '0.00%', '2020-03-19 18:01:56'),
(299, 1, 3, 1, 'Plain Cake 12x12 (Plain Cake 12x12)', 'ea', '120.94', '0.00%', '0.00%', '120.94', '60.47', '0.00%', '2020-03-19 18:01:56'),
(300, 1, 3, 1, 'Plastic coconut with fruits (Plastic coconut with fruits  )', 'ea', '15', '0.01%', '0.00%', '15', '90', '0.01%', '2020-03-19 18:01:56'),
(301, 1, 3, 1, 'Plastic Grass Assorted w/ Flowe (Plastic Grass Assorted w/ Flowe)', 'ea', '15', '0.01%', '0.00%', '0', '0', '0.00%', '2020-03-19 18:01:56'),
(302, 1, 3, 1, 'Plastic Grass Asst. Accs (Plastic Grass Asst. Accs)', 'Kls', '650', '0.00%', '0.00%', '650', '0', '0.00%', '2020-03-19 18:01:56'),
(303, 1, 3, 1, 'Plastic leaves (Plastic leaves  )', 'ea', '9.98', '0.00%', '0.00%', '10', '0', '0.00%', '2020-03-19 18:01:56'),
(304, 1, 3, 1, 'Plastic Leaves Big (Plastic Leaves Big)', 'ea', '15', '0.00%', '0.00%', '15', '0', '0.00%', '2020-03-19 18:01:56'),
(305, 1, 3, 1, 'Pooh & Friends figurine (Pooh & Friends figurine  )', 'ea', '75', '0.00%', '0.00%', '75', '75', '0.00%', '2020-03-19 18:01:56'),
(306, 1, 3, 1, 'Pound Cake (Pound Cake - whole 8slices=17.60/slice)', 'ea', '140.78', '0.00%', '0.00%', '140.78', '0', '0.00%', '2020-03-19 18:01:56'),
(307, 1, 3, 1, 'Powder Sugar (Powder Sugar)', 'grms', '0.1', '0.08%', '0.00%', '0.09', '1125', '0.07%', '2020-03-19 18:01:56'),
(308, 1, 3, 1, 'Precut tissue (Precut tissue  )', 'Roll', '85', '0.08%', '0.00%', '85', '1275', '0.08%', '2020-03-19 18:01:56'),
(309, 1, 3, 1, 'Pretzels berry knots (Pretzels berry knots)', 'ea', '5.25', '0.00%', '0.00%', '5.25', '0', '0.00%', '2020-03-19 18:01:56'),
(310, 1, 3, 1, 'Pretzels Berry Knots 28g (Pretzels Berry Knots 28g)', 'ea', '5.25', '0.00%', '0.00%', '5.25', '0', '0.00%', '2020-03-19 18:01:56'),
(311, 1, 3, 1, 'Pretzels Choco Nuts (Pretzels Choco Nuts)', 'ea', '5.25', '0.00%', '0.00%', '5.25', '0', '0.00%', '2020-03-19 18:01:56'),
(312, 1, 3, 1, 'Princess Fig. ( Imp) (Princess Fig. ( Imp))', 'ea', '65', '0.00%', '0.00%', '65', '0', '0.00%', '2020-03-19 18:01:56'),
(313, 1, 3, 1, 'Princess figurine big (Princess figurine big  )', 'ea', '45', '0.06%', '0.00%', '45', '990', '0.06%', '2020-03-19 18:01:56'),
(314, 1, 3, 1, 'Princess figurine small (Princess figurine small  )', 'ea', '30', '0.00%', '0.00%', '30', '0', '0.00%', '2020-03-19 18:01:56'),
(315, 1, 3, 1, 'Princess Toppers (Princess Toppers)', 'ea', '20', '0.00%', '0.00%', '20', '0', '0.00%', '2020-03-19 18:01:56'),
(316, 1, 3, 1, 'Pure Green Tbag (Pure Green Tbag)', 'ea', '5.6', '0.00%', '0.00%', '5.6', '0', '0.00%', '2020-03-19 18:01:56'),
(317, 1, 3, 1, 'Rainbow Sprinkles (Rainbow Sprinkle)', 'grms', '0.35', '0.19%', '0.00%', '0.35', '3246.25', '0.19%', '2020-03-19 18:01:56'),
(318, 1, 3, 1, 'RAM Hot Sauce 110ML (RAM Hot Sauce 110ML)', 'Bot', '15.69', '0.00%', '0.00%', '15.7', '0', '0.00%', '2020-03-19 18:01:56'),
(319, 1, 3, 1, 'Red Cherry 595ml (Red Cherry 595ml)', 'Bot', '198', '0.00%', '0.00%', '198', '0', '0.00%', '2020-03-19 18:01:56'),
(320, 1, 3, 1, 'Red Cherry w/ stem 1050 (Red Cherry w/ stem 1050ml)', 'Bot', '310.91', '0.00%', '0.00%', '310.91', '0', '0.00%', '2020-03-19 18:01:56'),
(321, 1, 3, 1, 'Redman Gumpaste (Redman Gumpaste 1kg)', 'Kls', '389.68', '0.07%', '0.00%', '390', '1236.3', '0.07%', '2020-03-19 18:01:56'),
(322, 1, 3, 1, 'Redman Gumpaste 500g (Redman Gumpaste 500g)', 'ea', '220', '0.18%', '0.00%', '220.1', '3026.38', '0.18%', '2020-03-19 18:01:56'),
(323, 1, 3, 1, 'rice Wine 750ml (rice Wine 750ml)', 'Bot', '90.67', '0.00%', '0.00%', '105.6', '0', '0.00%', '2020-03-19 18:01:56'),
(324, 1, 3, 1, 'RM solo cc green 20\'s 40pcs (RM solo cc green 20\'s 40pcs)', 'Pck', '120', '0.00%', '0.00%', '120', '0', '0.00%', '2020-03-19 18:01:56'),
(325, 1, 3, 1, 'Rocky Road Cake (Rocky Road Cake)', 'ea', '44.16', '0.00%', '0.00%', '44.1588', '0', '0.00%', '2020-03-19 18:01:56'),
(326, 1, 3, 1, 'Rosamary Leaf 60z (Rosamary Leaf 60z)', 'ea', '569', '0.00%', '0.00%', '569', '0', '0.00%', '2020-03-19 18:01:56'),
(327, 1, 3, 1, 'Rose Toopick Violet (Rose Toopick Violet)', 'Pck', '20', '0.00%', '0.00%', '20', '0', '0.00%', '2020-03-19 18:01:56'),
(328, 1, 3, 1, 'Rose Toothpick Green (Rose Toothpick Green)', 'Pck', '20', '0.00%', '0.00%', '20', '0', '0.00%', '2020-03-19 18:01:56'),
(329, 1, 3, 1, 'Rose Toothpick Red (Rose Toothpick Red)', 'Pck', '20', '0.00%', '0.00%', '20', '0', '0.00%', '2020-03-19 18:01:56'),
(330, 1, 3, 1, 'Rose Wire Green (Rose Wire Green)', 'Pck', '20', '0.00%', '0.00%', '20', '0', '0.00%', '2020-03-19 18:01:56'),
(331, 1, 3, 1, 'Rose Wire Red (Rose Wire Red)', 'Pck', '20', '0.00%', '0.00%', '20', '0', '0.00%', '2020-03-19 18:01:56'),
(332, 1, 3, 1, 'Royal Mismo (Royal Mismo)', 'ea', '12.08', '0.00%', '0.00%', '12.08333', '0', '0.00%', '2020-03-19 18:01:56'),
(333, 1, 3, 1, 'ROYAL TRU ORANGE 330MLX24 (ROYAL TRU ORANGE 330MLX24)', 'Can', '23.71', '0.00%', '0.00%', '23.71', '0', '0.00%', '2020-03-19 18:01:56'),
(334, 1, 3, 1, 'Sagu Black Bending Straw 100s/P (Sagu Black Bending Straw 100s/Pack)', 'ea', '2.35', '0.01%', '0.00%', '1.95', '68.25', '0.00%', '2020-03-19 18:01:56'),
(335, 1, 3, 1, 'Salted Caramel Gelato (Salted Caramel Gelato)', 'ea', '72.8', '-0.02%', '0.00%', '123.2', '-492.8', '-0.03%', '2020-03-19 18:01:56'),
(336, 1, 3, 1, 'Salted Caramel Pints (Salted Caramel Pints)', 'Tub', '336', '0.00%', '0.00%', '385', '0', '0.00%', '2020-03-19 18:01:56'),
(337, 1, 3, 1, 'Sampaguita Leaves (Sampaguita Leaves)', 'ea', '19.2', '0.00%', '0.00%', '24', '0', '0.00%', '2020-03-19 18:01:56'),
(338, 1, 3, 1, 'San Francisco (San Francisco)', 'ea', '15.59', '0.01%', '0.00%', '15.59', '93.54', '0.01%', '2020-03-19 18:01:56'),
(339, 1, 3, 1, 'San Mig Pale Pilsen in Can (San Mig Pale Pilsen in Can)', 'ea', '44', '0.25%', '0.00%', '44', '4224', '0.25%', '2020-03-19 18:01:56'),
(340, 1, 3, 1, 'San Miguel Light 330ml (San Miguel Light 330ml)', 'Can', '44', '0.06%', '0.00%', '44', '1056', '0.06%', '2020-03-19 18:01:56'),
(341, 1, 3, 1, 'San Pelligrino Water (San Pelligrino Water)', 'Bot', '119.95', '0.04%', '0.00%', '119.95', '599.75', '0.04%', '2020-03-19 18:01:56'),
(342, 1, 3, 1, 'Sando Bag Large (4 u) (Sando Bag Large (4 u))', 'ea', '0.78', '0.00%', '0.00%', '0.78', '0', '0.00%', '2020-03-19 18:01:56'),
(343, 1, 3, 1, 'Savor Classic 130g (Savor Classic 130g)', 'ea', '35.55', '0.10%', '0.00%', '35.54792', '1635.2', '0.10%', '2020-03-19 18:01:56'),
(344, 1, 3, 1, 'Selecta Vanilla Ice Cream 1.5L (Selecta Vanilla Ice Cream 1.5L)', 'Gal', '230', '0.00%', '0.00%', '230', '0', '0.00%', '2020-03-19 18:01:56'),
(345, 1, 3, 1, 'Semi sweet chocolate (Semi sweet chocolate  )', 'grms', '0.19', '0.00%', '0.00%', '0.19', '0', '0.00%', '2020-03-19 18:01:56'),
(346, 1, 3, 1, 'Sliced Mushroom 400g Susan bake (Sliced Mushroom 400g Susan bake)', 'Can', '55', '0.00%', '0.00%', '49.1', '0', '0.00%', '2020-03-19 18:01:56'),
(347, 1, 3, 1, 'Small Alpabet Cutter (Small Alpabet Cutter)', 'ea', '247', '0.00%', '0.00%', '247', '0', '0.00%', '2020-03-19 18:01:56'),
(348, 1, 3, 1, 'Snow white figurine Imported (Snow white figurine Imported)', 'ea', '65', '0.00%', '0.00%', '65', '0', '0.00%', '2020-03-19 18:01:56'),
(349, 1, 3, 1, 'SnowWhite Figurine ( Local) (SnowWhite Figurine ( Local))', 'ea', '32', '0.00%', '0.00%', '32', '0', '0.00%', '2020-03-19 18:01:56'),
(350, 1, 3, 1, 'Sofia Figurine local (Sofia Figurine local)', 'ea', '44', '0.02%', '0.00%', '65', '455', '0.03%', '2020-03-19 18:01:56'),
(351, 1, 3, 1, 'Spaghetti meat balls (Spaghetti meat balls  )', 'Portion', '50.18', '0.00%', '0.00%', '50.18', '0', '0.00%', '2020-03-19 18:01:56'),
(352, 1, 3, 1, 'Spaghetti Meatballs (Spaghetti Meatballs)', 'ea', '50.18', '0.12%', '0.00%', '50.18', '2057.38', '0.12%', '2020-03-19 18:01:56'),
(353, 1, 3, 1, 'Sparkle Mismo (Sparkle Mismo)', 'ea', '12.08', '0.00%', '0.00%', '12.08333', '0', '0.00%', '2020-03-19 18:01:56'),
(354, 1, 3, 1, 'Spiderman Figurine Imported (Spiderman Figurine Imported)', 'ea', '65', '0.00%', '0.00%', '55', '0', '0.00%', '2020-03-19 18:01:56'),
(355, 1, 3, 1, 'Spiderman Figurine local (Spiderman Figurine local)', 'ea', '30.45', '0.01%', '0.00%', '30', '180', '0.01%', '2020-03-19 18:01:56'),
(356, 1, 3, 1, 'Spiderman Styro (Spiderman Styro)', 'ea', '16', '0.01%', '0.00%', '16', '192', '0.01%', '2020-03-19 18:01:56'),
(357, 1, 3, 1, 'Spongebob figurine (Spongebob figurine  )', 'ea', '33.55', '0.02%', '0.00%', '33.55', '369.05', '0.02%', '2020-03-19 18:01:56'),
(358, 1, 3, 1, 'Spongebob gumpaste (Spongebob gumpaste)', 'ea', '70', '0.00%', '0.00%', '70', '0', '0.00%', '2020-03-19 18:01:56'),
(359, 1, 3, 1, 'Spongebob styro (Spongebob styro  )', 'ea', '15', '0.01%', '0.00%', '15', '150', '0.01%', '2020-03-19 18:01:56');
INSERT INTO `eb_raw_materials` (`PK_raw_materials_id`, `FK_outlet_id`, `FK_category_id`, `status`, `material_name`, `unit`, `average_cost`, `asset_value`, `total_asset_percent`, `sales_price`, `retail_value`, `total_retail_percent`, `date_added`) VALUES
(360, 1, 3, 1, 'Spring Rolls (Spring Rolls)', 'ea', '0', '0.00%', '0.00%', '3.92', '0', '0.00%', '2020-03-19 18:01:56'),
(361, 1, 3, 1, 'Sprite 2L (Sprite 2L)', 'Bot', '41', '0.00%', '0.00%', '51.5', '0', '0.00%', '2020-03-19 18:01:56'),
(362, 1, 3, 1, 'Sprite in can 330ml (Sprite in can 330ml)', 'Can', '24.92', '0.16%', '0.00%', '24.91667', '2666.08', '0.16%', '2020-03-19 18:01:56'),
(363, 1, 3, 1, 'Sprite Mismo (Sprite Mismo)', 'ea', '12.08', '0.00%', '0.00%', '12.08333', '0', '0.00%', '2020-03-19 18:01:56'),
(364, 1, 3, 1, 'Sriracha Hot Chili sauce 280z (Sriracha Hot Chili sauce 280z)', 'Bot', '243.57', '0.04%', '0.00%', '239', '693.1', '0.04%', '2020-03-19 18:01:56'),
(365, 1, 3, 1, 'Sriracha HotChili 170z (Sriracha HotChili 170z)', 'Bot', '190', '0.00%', '0.00%', '190', '0', '0.00%', '2020-03-19 18:01:56'),
(366, 1, 3, 1, 'Star Sprinkles (Star Sprinkles)', 'grms', '0.45', '0.00%', '0.00%', '0.45', '22.5', '0.00%', '2020-03-19 18:01:56'),
(367, 1, 3, 1, 'Stick O 380g (Stick O 380g)', 'Tub', '57.75', '0.00%', '0.00%', '57.75', '57.75', '0.00%', '2020-03-19 18:01:56'),
(368, 1, 3, 1, 'Stick O 480g (Stick O 480g)', 'ea', '0.55', '0.00%', '0.00%', '0.55', '0', '0.00%', '2020-03-19 18:01:56'),
(369, 1, 3, 1, 'Stick O Big 850g (Stick O Big 850g)', 'Tub', '109.5', '0.02%', '0.00%', '109.5', '321.93', '0.02%', '2020-03-19 18:01:56'),
(370, 1, 3, 1, 'Stirrer (Stirrer  )', 'ea', '0.22', '0.00%', '0.00%', '0.2', '50', '0.00%', '2020-03-19 18:01:56'),
(371, 1, 3, 1, 'Styro Castle (Styro Castle)', 'ea', '38', '0.00%', '0.00%', '38', '0', '0.00%', '2020-03-19 18:01:56'),
(372, 1, 3, 1, 'Sunflower (Sunflower)', 'Pck', '18', '0.00%', '0.00%', '18', '0', '0.00%', '2020-03-19 18:01:56'),
(373, 1, 3, 1, 'Superman figurine small (Superman figurine small  )', 'ea', '26.91', '0.01%', '0.00%', '25', '225', '0.01%', '2020-03-19 18:01:56'),
(374, 1, 3, 1, 'Superman styro (Superman styro  )', 'ea', '15.91', '0.01%', '0.00%', '15', '135', '0.01%', '2020-03-19 18:01:56'),
(375, 1, 3, 1, 'Sweet chili sauce-DM- 340 ml) (Sweet chili sauce-DM- 340 ml)  )', 'Bot', '34.15', '0.00%', '0.00%', '33.73', '-33.73', '0.00%', '2020-03-19 18:01:56'),
(376, 1, 3, 1, 'Take out sugar (Take out sugar  )', 'Pck', '7.26', '0.02%', '0.00%', '44.1', '2447.55', '0.14%', '2020-03-19 18:01:56'),
(377, 1, 3, 1, 'Tang Orange 350g/250g (Tang Orange 350g/250g)', 'Pck', '199.5', '0.00%', '0.00%', '199.5', '0', '0.00%', '2020-03-19 18:01:56'),
(378, 1, 3, 1, 'Tang Orange 675g/525g (Tang Orange 675g/525g)', 'Pck', '263.12', '0.25%', '0.00%', '286.5', '4584', '0.27%', '2020-03-19 18:01:56'),
(379, 1, 3, 1, 'Thor (Thor  )', 'ea', '50', '0.00%', '0.00%', '50', '50', '0.00%', '2020-03-19 18:01:56'),
(380, 1, 3, 1, 'Tigerstix choco 315g (Tigerstix choco 315g)', 'Pck', '0', '0.00%', '0.00%', '41.8', '0', '0.00%', '2020-03-19 18:01:56'),
(381, 1, 3, 1, 'Tinker Bell Fig. Local (Tinker Bell Fig. Local)', 'ea', '30', '0.03%', '0.00%', '30', '510', '0.03%', '2020-03-19 18:01:56'),
(382, 1, 3, 1, 'Tinker Bell Fig.Imp (Tinker Bell Fig.Imp)', 'ea', '65', '0.00%', '0.00%', '65', '0', '0.00%', '2020-03-19 18:01:56'),
(383, 1, 3, 1, 'Tinker bell figurine (Tinker bell figurine  )', 'ea', '60', '0.00%', '0.00%', '60', '0', '0.00%', '2020-03-19 18:01:56'),
(384, 1, 3, 1, 'Tinker bell styro (Tinker bell styro  )', 'ea', '16', '0.02%', '0.00%', '16', '304', '0.02%', '2020-03-19 18:01:56'),
(385, 1, 3, 1, 'Tiramizu cake (Tiramizu cake  )', 'ea', '19.92', '0.00%', '0.00%', '19.92', '0', '0.00%', '2020-03-19 18:01:56'),
(386, 1, 3, 1, 'Toasted Marshmallow (Toasted Marshmallow 750ml)', 'Bot', '392', '0.06%', '0.00%', '392', '964.32', '0.06%', '2020-03-19 18:01:56'),
(387, 1, 3, 1, 'Toothpick (Toothpick  )', 'ea', '0.09', '0.01%', '0.00%', '0.21', '378.84', '0.02%', '2020-03-19 18:01:56'),
(388, 1, 3, 1, 'Torani Almond Rocca syrup(750ml (Torani Almond Rocca syrup(750ml)  )', 'Bot', '392', '0.00%', '0.00%', '392', '0', '0.00%', '2020-03-19 18:01:56'),
(389, 1, 3, 1, 'Torani Blackberry syrup (Torani Blackberry syrup  )', 'Bot', '0', '0.00%', '0.00%', '392', '0', '0.00%', '2020-03-19 18:01:56'),
(390, 1, 3, 1, 'Torani Cheesecake syrup (Torani Cheesecake syrup  )', 'Bot', '392', '0.00%', '0.00%', '392', '0', '0.00%', '2020-03-19 18:01:56'),
(391, 1, 3, 1, 'Torani Chocolate macademia nut( (Torani Chocolate macademia nut( 750 ml)  )', 'Bot', '392', '0.00%', '0.00%', '392', '0', '0.00%', '2020-03-19 18:01:56'),
(392, 1, 3, 1, 'Torani Creme De Banana (750ml) (Torani Creme De Banana (750ml))', 'Bot', '392', '0.00%', '0.00%', '392', '0', '0.00%', '2020-03-19 18:01:56'),
(393, 1, 3, 1, 'Torani Creme de cacao syrup(750 (Torani Creme de cacao syrup(750ml)  )', 'Bot', '392', '0.00%', '0.00%', '392', '0', '0.00%', '2020-03-19 18:01:56'),
(394, 1, 3, 1, 'Torani French Vanilla syrup(750 (Torani French Vanilla syrup(750ml)  )', 'Bot', '0', '0.00%', '0.00%', '392', '0', '0.00%', '2020-03-19 18:01:56'),
(395, 1, 3, 1, 'Torani Grenadine syrup(750ml) (Torani Grenadine syrup(750ml)  )', 'Bot', '198', '0.00%', '0.00%', '198', '0', '0.00%', '2020-03-19 18:01:56'),
(396, 1, 3, 1, 'Torani Kiwi syrup (Torani Kiwi syrup  )', 'Bot', '0', '0.00%', '0.00%', '392', '0', '0.00%', '2020-03-19 18:01:56'),
(397, 1, 3, 1, 'Torani Mapple syrup (Torani Mapple syrup  )', 'Bot', '392', '0.00%', '0.00%', '392', '0', '0.00%', '2020-03-19 18:01:56'),
(398, 1, 3, 1, 'Torani Raspberry syrup (Torani Raspberry syrup  )', 'Bot', '392', '0.00%', '0.00%', '392', '0', '0.00%', '2020-03-19 18:01:56'),
(399, 1, 3, 1, 'Torani Strawberry syrup (Torani Strawberry syrup  )', 'Bot', '392', '0.00%', '0.00%', '392', '0', '0.00%', '2020-03-19 18:01:56'),
(400, 1, 3, 1, 'Torani Tangerine syrup (Torani Tangerine syrup  )', 'Bot', '392', '0.00%', '0.00%', '392', '0', '0.00%', '2020-03-19 18:01:56'),
(401, 1, 3, 1, 'UFC Hot Sauce 100g (UFC Hot Sauce 100g)', 'Bot', '15.7', '0.00%', '0.00%', '16.55', '0', '0.00%', '2020-03-19 18:01:56'),
(402, 1, 3, 1, 'Umbrella picks (Umbrella picks)', 'ea', '1.46', '0.04%', '0.00%', '1.94', '838.08', '0.05%', '2020-03-19 18:01:56'),
(403, 1, 3, 1, 'US Lemon (US Lemon)', 'ea', '21.85', '0.14%', '0.00%', '25', '2750', '0.16%', '2020-03-19 18:01:56'),
(404, 1, 3, 1, 'Vanilla Pints (Vanilla Pints)', 'Tub', '336', '0.00%', '0.00%', '385', '0', '0.00%', '2020-03-19 18:01:56'),
(405, 1, 3, 1, 'Vanilla Single Serve (Vanilla Single Serving)', 'ea', '72.8', '0.00%', '0.00%', '110', '0', '0.00%', '2020-03-19 18:01:56'),
(406, 1, 3, 1, 'Viva Mineral Water (Viva Mineral Water)', 'Bot', '0', '0.00%', '0.00%', '10.42', '0', '0.00%', '2020-03-19 18:01:56'),
(407, 1, 3, 1, 'Wafer Strawberry vanila 20\'s (Wafer Strawberry vanila 20\'s)', 'Pck', '35.15', '0.00%', '0.00%', '35.15', '14.06', '0.00%', '2020-03-19 18:01:56'),
(408, 1, 3, 1, 'Waterade 500ml (Waterade 500ml)', 'Bot', '30', '0.00%', '0.00%', '9.5', '0', '0.00%', '2020-03-19 18:01:56'),
(409, 1, 3, 1, 'Wedding Cupcake Topper (Wedding Cupcake Topper)', 'ea', '77', '0.00%', '0.00%', '77', '0', '0.00%', '2020-03-19 18:01:56'),
(410, 1, 3, 1, 'White Banana Fondant 1kg (White Banana Fondant 1kg)', 'Kls', '249', '0.03%', '0.00%', '249', '557.76', '0.03%', '2020-03-19 18:01:56'),
(411, 1, 3, 1, 'Whole Almonds (Whole Almonds)', 'Kls', '740', '0.00%', '0.00%', '740', '0', '0.00%', '2020-03-19 18:01:56'),
(412, 1, 3, 1, 'Yema Chilled Cake (Yema Chilled Cake)', 'ea', '19.04', '0.00%', '0.00%', '19.03875', '0', '0.00%', '2020-03-19 18:01:56'),
(413, 1, 3, 1, 'Zest O Mango Juice 10s (Zest O Mango Juice 10s)', 'ea', '7.81', '0.06%', '0.00%', '7.81', '1015.3', '0.06%', '2020-03-19 18:01:56'),
(414, 1, 3, 1, 'Zest O Orange Juice 10s (Zest O Orange Juice 10s)', 'ea', '7.81', '0.00%', '0.00%', '7.805', '0', '0.00%', '2020-03-19 18:01:56'),
(415, 1, 5, 1, 'Ajinomoto 9gx21s (Ajinomoto 9gx21s)', 'ea', '1.71', '0', '0.00%', '1.71', '0', '0.00%', '2020-03-19 18:05:24'),
(416, 1, 5, 1, 'All Spiced 32g/Bottle (All Spiced 32g/Bottle)', '', '62.4', '0', '0.00%', '62.4', '0', '0.00%', '2020-03-19 18:05:24'),
(417, 1, 5, 1, 'Almond Sliced (Almond Sliced 100gms/pack)', 'grms', '0.82', '0', '0.00%', '1.07', '0', '0.00%', '2020-03-19 18:05:24'),
(418, 1, 5, 1, 'Aluminum Foil (Aluminum Foil)', 'Roll', '623.05', '1246.1', '0.07%', '750', '1500', '0.09%', '2020-03-19 18:05:24'),
(419, 1, 5, 1, 'Anchovies (Anchovies 365g/Can)', 'grms', '0.1', '37.6', '0.00%', '1.53', '558.45', '0.03%', '2020-03-19 18:05:24'),
(420, 1, 5, 1, 'Angel Condensed Milk 330g (Angel Condensed Milk 330g)', 'Can', '46.51', '0', '0.00%', '46.51', '0', '0.00%', '2020-03-19 18:05:24'),
(421, 1, 5, 1, 'Apple (Apple)', 'ea', '25', '3100', '0.18%', '30', '3720', '0.22%', '2020-03-19 18:05:24'),
(422, 1, 5, 1, 'Argentina Corned Beef 150g (Argentina Corned Beef 150g)', 'Can', '42.2', '0', '0.00%', '50', '0', '0.00%', '2020-03-19 18:05:24'),
(423, 1, 5, 1, 'Argentina Corned beef 175g (Argentina Corned beef 175g)', 'Can', '33.47', '0', '0.00%', '33.47', '0', '0.00%', '2020-03-19 18:05:24'),
(424, 1, 5, 1, 'Asparagus (Asparagus)', 'Kls', '123.06', '463.95', '0.03%', '200', '754', '0.04%', '2020-03-19 18:05:24'),
(425, 1, 5, 1, 'Avocado (Avocado)', 'Kls', '63.8', '1200', '0.07%', '90', '1692.9', '0.10%', '2020-03-19 18:05:24'),
(426, 1, 5, 1, 'Baby Carrots (Baby Carrots)', 'Kls', '25.42', '30', '0.00%', '45', '53.1', '0.00%', '2020-03-19 18:05:24'),
(427, 1, 5, 1, 'Bacon (Bacon)', 'Kls', '360', '6840', '0.41%', '360', '6840', '0.40%', '2020-03-19 18:05:24'),
(428, 1, 5, 1, 'Baguio Beans (Baguio Beans)', 'Pck', '15.92', '35.35', '0.00%', '15', '33.3', '0.00%', '2020-03-19 18:05:24'),
(429, 1, 5, 1, 'Baguio Beans /kl (Baguio Beans /kl)', 'Kls', '37.33', '28', '0.00%', '80', '60', '0.00%', '2020-03-19 18:05:24'),
(430, 1, 5, 1, 'Balsamic Vinegar 1L (Balsamic Vinegar 1L)', 'Gal', '372', '0', '0.00%', '372', '0', '0.00%', '2020-03-19 18:05:24'),
(431, 1, 5, 1, 'Banana Blossom (Banana Blossom)', 'ea', '5', '40', '0.00%', '10', '80', '0.01%', '2020-03-19 18:05:24'),
(432, 1, 5, 1, 'Barilis (Barilis)', 'grms', '0.4', '0', '0.00%', '0.48', '0', '0.00%', '2020-03-19 18:05:24'),
(433, 1, 5, 1, 'Basil (Basil)', 'Kls', '400', '60', '0.00%', '400', '60', '0.00%', '2020-03-19 18:05:24'),
(434, 1, 5, 1, 'BBQ Marinated Clara Ole (BBQ Marinated Clara Ole 225g/Pack)', 'Pck', '0', '0', '0.00%', '35.15', '0', '0.00%', '2020-03-19 18:05:24'),
(435, 1, 5, 1, 'BBQ Marinated sauce Hickory (BBQ Marinated sauce Hickory 225g/Pack)', 'Pck', '36.07', '288.55', '0.02%', '36.07', '288.56', '0.02%', '2020-03-19 18:05:24'),
(436, 1, 5, 1, 'BBQ Marinated sauce Mamasitas (BBQ Marinated sauce Mamasitas 680ml/Bot)', 'Bot', '97.1', '0', '0.00%', '97.1', '0', '0.00%', '2020-03-19 18:05:24'),
(437, 1, 5, 1, 'BBQ Sauce Hickory 180z (BBQ Sauce Hickory 180z)', 'Can', '129.95', '0', '0.00%', '129.95', '0', '0.00%', '2020-03-19 18:05:24'),
(438, 1, 5, 1, 'Beef & Herbs Gravy 30g (Beef & Herbs Gravy 30g/pck)', 'Pck', '20.95', '167.6', '0.01%', '20.95', '167.6', '0.01%', '2020-03-19 18:05:24'),
(439, 1, 5, 1, 'Beef Cubes (Beef Cubes Beef Cubes 60pcsx10gms/pail)', 'ea', '4.33', '2335.5', '0.14%', '4.38', '2365.2', '0.14%', '2020-03-19 18:05:24'),
(440, 1, 5, 1, 'Beef Giniling (Beef Giniling)', 'Kls', '290', '0', '0.00%', '290', '0', '0.00%', '2020-03-19 18:05:24'),
(441, 1, 5, 1, 'Beef Tapa (Beef Tapa)', 'Kls', '655', '7711.97', '0.46%', '510', '6004.74', '0.35%', '2020-03-19 18:05:24'),
(442, 1, 5, 1, 'Beef Tapa Marinated (Beef Tapa Marinated)', 'Kls', '436.52', '0', '0.00%', '436.52', '0', '0.00%', '2020-03-19 18:05:24'),
(443, 1, 5, 1, 'Beef Tocino (Beef Tocino)', 'Kls', '299.97', '984.5', '0.06%', '300', '984.6', '0.06%', '2020-03-19 18:05:24'),
(444, 1, 5, 1, 'Beefies Lots of Cheese Regular (Beefies Lots of Cheese Regular)', 'Kls', '165.39', '489.22', '0.03%', '167', '493.99', '0.03%', '2020-03-19 18:05:24'),
(445, 1, 5, 1, 'Bell Pepper (Bell Pepper)', 'grms', '0.08', '164.62', '0.01%', '0.1', '197.2', '0.01%', '2020-03-19 18:05:24'),
(446, 1, 5, 1, 'Best Yet Swt Relish 160z (Best Yet Swt Relish 160z)', 'Bot', '149.95', '0', '0.00%', '149.95', '0', '0.00%', '2020-03-19 18:05:24'),
(447, 1, 5, 1, 'Big Bihon Red 500g (Big Bihon Red 500g)', 'Pck', '30.2', '302', '0.02%', '30.2', '302', '0.02%', '2020-03-19 18:05:24'),
(448, 1, 5, 1, 'Big Family Bihon 125g (Big Family Bihon 125g)', 'Pck', '8.4', '58.8', '0.00%', '8.4', '58.8', '0.00%', '2020-03-19 18:05:24'),
(449, 1, 5, 1, 'Big Family Bihon 1kl (Big Family Bihon 1kl)', 'Pck', '58.8', '58.8', '0.00%', '58.8', '58.8', '0.00%', '2020-03-19 18:05:24'),
(450, 1, 5, 1, 'Big Family Bihon 250g (Big Family Bihon 250g)', 'Pck', '15', '0', '0.00%', '15.75', '0', '0.00%', '2020-03-19 18:05:24'),
(451, 1, 5, 1, 'Black Beans (Black Beans)', 'Can', '25.25', '75.74', '0.00%', '26.05', '78.15', '0.01%', '2020-03-19 18:05:24'),
(452, 1, 5, 1, 'Black Olive Slice 165g (Black Olive Slice 165g/bot)', 'ML', '0.25', '0', '0.00%', '0.35', '0', '0.00%', '2020-03-19 18:05:24'),
(453, 1, 5, 1, 'Black Olive Slice 310g (Black Olive Slice 310g/bot)', 'grms', '0.27', '0', '0.00%', '0.29', '0', '0.00%', '2020-03-19 18:05:24'),
(454, 1, 5, 1, 'Black Olives 140g (Black Olives 140g)', 'Bot', '54.1', '54.1', '0.00%', '54.1', '54.1', '0.00%', '2020-03-19 18:05:24'),
(455, 1, 5, 1, 'Black Olives 330g (Black Olives 330g)', 'Bot', '83', '0', '0.00%', '83', '0', '0.00%', '2020-03-19 18:05:24'),
(456, 1, 5, 1, 'Black Pepper (Black Pepper 500/pck)', 'grms', '0.95', '0', '0.00%', '0.94', '0', '0.00%', '2020-03-19 18:05:24'),
(457, 1, 5, 1, 'Black Pepper 250g (Black Pepper 250g/pck)', 'grms', '0.86', '864.54', '0.05%', '0.85', '850', '0.05%', '2020-03-19 18:05:24'),
(458, 1, 5, 1, 'Black Pepper 50g (Black Pepper 50g)', 'Bot', '51.5', '51.5', '0.00%', '48.8', '48.8', '0.00%', '2020-03-19 18:05:24'),
(459, 1, 5, 1, 'Black Pepper Powder1kg (Black Pepper 1kg)', 'Kls', '728', '728', '0.04%', '985', '985', '0.06%', '2020-03-19 18:05:24'),
(460, 1, 5, 1, 'Bread Crums (new) 500g (Bread Crums white 500g)', 'Pck', '28.3', '0', '0.00%', '30.43', '0', '0.00%', '2020-03-19 18:05:24'),
(461, 1, 5, 1, 'Bulalo (Bulalo)', 'Kls', '220.07', '954', '0.06%', '230.08', '997.4', '0.06%', '2020-03-19 18:05:24'),
(462, 1, 5, 1, 'Cabbage (Cabbage)', 'Kls', '71.13', '0', '0.00%', '50', '0', '0.00%', '2020-03-19 18:05:24'),
(463, 1, 5, 1, 'Caesar dressing (Caesar dressing  )', 'grms', '0.2', '175.2', '0.01%', '0.2', '175.2', '0.01%', '2020-03-19 18:05:24'),
(464, 1, 5, 1, 'Carrots (Carrots)', 'grms', '0.04', '167.53', '0.01%', '0.06', '233.88', '0.01%', '2020-03-19 18:05:24'),
(465, 1, 5, 1, 'Cashew Nuts (Cashew Nuts)', 'grms', '0.48', '0', '0.00%', '0.48', '0', '0.00%', '2020-03-19 18:05:24'),
(466, 1, 5, 1, 'CDO Liver Spread (CDO Liver Spread)', 'Can', '16.5', '66', '0.00%', '44.5', '178', '0.01%', '2020-03-19 18:05:24'),
(467, 1, 5, 1, 'Cebu Dried Mango 100g 3s ( Dried Mango 100g 3s)', 'Pck', '134.1', '402.3', '0.02%', '192.65', '577.95', '0.03%', '2020-03-19 18:05:24'),
(468, 1, 5, 1, 'Cebu Dried Mango Chip 50g (Cebu Dried Mango Chip 50g)', 'Pck', '35.15', '281.2', '0.02%', '35.15', '281.2', '0.02%', '2020-03-19 18:05:24'),
(469, 1, 5, 1, 'Celery (Celery)', 'grms', '0.11', '13', '0.00%', '0.13', '15.6', '0.00%', '2020-03-19 18:05:24'),
(470, 1, 5, 1, 'Cellophane 8x14/ smoked celloph (Cellophane 8x14/ smoked cellophane)', 'Pck', '26.39', '52.77', '0.00%', '14.15', '28.3', '0.00%', '2020-03-19 18:05:24'),
(471, 1, 5, 1, 'Cems Honey Brand 500g (Cems Honey Brand 500g)', 'Bot', '147.75', '0', '0.00%', '147.75', '0', '0.00%', '2020-03-19 18:05:24'),
(472, 1, 5, 1, 'Century Tuna Solid in Oil 184g (Century Tuna Solid in Oil 184g)', 'Can', '70.2', '0', '0.00%', '70.2', '0', '0.00%', '2020-03-19 18:05:24'),
(473, 1, 5, 1, 'Cenury Tuna Chunks inWater 184g (Cenury Tuna Chunks inWater 184g)', 'Can', '60.15', '2345.85', '0.14%', '60.7', '2367.3', '0.14%', '2020-03-19 18:05:24'),
(474, 1, 5, 1, 'Cheese Powder (Cheese Powder 100g/pck)', 'grms', '0.1', '66.3', '0.00%', '0.35', '227.5', '0.01%', '2020-03-19 18:05:24'),
(475, 1, 5, 1, 'Cheese Powder 50g (Cheese Powder 50g)', 'Pck', '26.5', '0', '0.00%', '26.5', '0', '0.00%', '2020-03-19 18:05:24'),
(476, 1, 5, 1, 'Cherry Tomato (Cherry Tomato)', 'grms', '0.06', '0', '0.00%', '0.06', '0', '0.00%', '2020-03-19 18:05:24'),
(477, 1, 5, 1, 'Cherry Tomatoe (Cherry Tomatoe)', 'Kls', '27.99', '0', '0.00%', '28', '0', '0.00%', '2020-03-19 18:05:24'),
(478, 1, 5, 1, 'Chicharon (Chicharon)', 'grms', '0.68', '0', '0.00%', '0.3', '0', '0.00%', '2020-03-19 18:05:24'),
(479, 1, 5, 1, 'Chicken Breast (Chicken Breast)', 'Kls', '224.31', '10335.75', '0.61%', '195', '8985.21', '0.53%', '2020-03-19 18:05:24'),
(480, 1, 5, 1, 'Chicken Breast Fillet (Chicken Breast Fillet)', 'Kls', '265.71', '15830.25', '0.94%', '275', '16383.95', '0.96%', '2020-03-19 18:05:24'),
(481, 1, 5, 1, 'Chicken Cubes (Chicken Cubes)', 'ea', '4.3', '2736.92', '0.16%', '4.30333', '2736.92', '0.16%', '2020-03-19 18:05:24'),
(482, 1, 5, 1, 'Chicken Drumstick (Chicken Drumstick)', 'Kls', '192', '0', '0.00%', '190', '0', '0.00%', '2020-03-19 18:05:24'),
(483, 1, 5, 1, 'Chicken Drumstick w/ Thigh (Chicken Drumstick w/ Thigh)', 'Kls', '150', '0', '0.00%', '235', '0', '0.00%', '2020-03-19 18:05:24'),
(484, 1, 5, 1, 'Chicken Powder (Chicken Powder)', 'grms', '0.35', '826.03', '0.05%', '0.3506', '823.91', '0.05%', '2020-03-19 18:05:24'),
(485, 1, 5, 1, 'Chicken Thigh (Chicken Thigh)', 'Kls', '180.01', '1844.75', '0.11%', '190', '1947.12', '0.11%', '2020-03-19 18:05:24'),
(486, 1, 5, 1, 'Chicken Tocino (Chicken Tocino)', 'Kls', '319.5', '1597.49', '0.10%', '360', '1800', '0.11%', '2020-03-19 18:05:24'),
(487, 1, 5, 1, 'Chicken Wings (Chicken Wings)', 'Kls', '175.43', '1391.55', '0.08%', '163', '1292.916', '0.08%', '2020-03-19 18:05:24'),
(488, 1, 5, 1, 'Chili Flakes (Chili Flakes)', 'Bot', '24.12', '24.12', '0.00%', '28.75', '28.75', '0.00%', '2020-03-19 18:05:24'),
(489, 1, 5, 1, 'Chili Powder 30g (Chili Powder 30g)', 'Bot', '21.5', '21.5', '0.00%', '24.75', '24.75', '0.00%', '2020-03-19 18:05:24'),
(490, 1, 5, 1, 'Chili Powder 50g (Chili Powder 50g)', 'Pck', '17.5', '0', '0.00%', '17.5', '0', '0.00%', '2020-03-19 18:05:24'),
(491, 1, 5, 1, 'Chorizo (Chorizo)', 'Pck', '40', '0', '0.00%', '50', '0', '0.00%', '2020-03-19 18:05:24'),
(492, 1, 5, 1, 'Clams (Clams)', 'grms', '0.06', '30', '0.00%', '0.06', '30', '0.00%', '2020-03-19 18:05:24'),
(493, 1, 5, 1, 'Clams Chawder (Clams Chawder)', 'ea', '0', '0', '0.00%', '88.94', '0', '0.00%', '2020-03-19 18:05:24'),
(494, 1, 5, 1, 'Clara Ole BBQ Marinade Hickory (Clara Ole BBQ Marinade Hickory 225g)', 'Pck', '38.25', '153', '0.01%', '35.15', '140.6', '0.01%', '2020-03-19 18:05:24'),
(495, 1, 5, 1, 'Clara Ole Carbonara 200g (Clara Ole Carbonara)', 'Can', '32.07', '705.57', '0.04%', '30.75', '676.5', '0.04%', '2020-03-19 18:05:24'),
(496, 1, 5, 1, 'Clara Ole Mrchno Chrs 280g (Clara Ole Mrchno Chrs 280g)', 'ea', '109.4', '0', '0.00%', '109.4', '0', '0.00%', '2020-03-19 18:05:24'),
(497, 1, 5, 1, 'Clara Ole Tomato Sauce 250g (Clara Ole Tomato Sauce 250g)', 'Bot', '18.17', '454.29', '0.03%', '18.2', '455', '0.03%', '2020-03-19 18:05:24'),
(498, 1, 5, 1, 'Coco Milk (Coco Milk)', 'grms', '0.08', '160', '0.01%', '0.08', '160', '0.01%', '2020-03-19 18:05:24'),
(499, 1, 5, 1, 'Colicot (Colicot  )', 'grms', '0.12', '124.78', '0.01%', '0.13', '137.54', '0.01%', '2020-03-19 18:05:24'),
(500, 1, 5, 1, 'Corn Oil (New) (Corn Oil (New))', 'ML', '0.11', '1950.07', '0.12%', '0.11471', '1950.07', '0.11%', '2020-03-19 18:05:24'),
(501, 1, 5, 1, 'Cotan Black Pepper 500g (Cotan Black Pepper 500g)', 'Pck', '364', '0', '0.00%', '364', '0', '0.00%', '2020-03-19 18:05:24'),
(502, 1, 5, 1, 'Cranberries 100g (Cranberries 100g)', 'grms', '0.29', '592.76', '0.04%', '0.3015', '618.08', '0.04%', '2020-03-19 18:05:24'),
(503, 1, 5, 1, 'Cranberries Dried Fruit 213g (Cranberries Dried Fruit 213g)', 'Bot', '189.95', '0', '0.00%', '189.95', '0', '0.00%', '2020-03-19 18:05:24'),
(504, 1, 5, 1, 'Crapers in Vinegar Dona Elena (Crapers in Vinegar Dona Elena 340/bot)', 'Bot', '139.63', '0', '0.00%', '147.75', '0', '0.00%', '2020-03-19 18:05:24'),
(505, 1, 5, 1, 'Cream Dory Fillet (Cream Dory Fillet)', 'Kls', '105', '2100', '0.13%', '125', '2500', '0.15%', '2020-03-19 18:05:24'),
(506, 1, 5, 1, 'Crepe dough (Crepe dough  )', 'grms', '0.09', '0', '0.00%', '0.09164', '0', '0.00%', '2020-03-19 18:05:24'),
(507, 1, 5, 1, 'CS Edcor Swt Pears 2s (CS Edcor Swt Pears 2s)', 'Pck', '90.65', '0', '0.00%', '148', '0', '0.00%', '2020-03-19 18:05:24'),
(508, 1, 5, 1, 'CS Fuji Apple 32@ (CS Fuji Apple 32@)', 'ea', '54', '0', '0.00%', '54', '0', '0.00%', '2020-03-19 18:05:24'),
(509, 1, 5, 1, 'CS Green Apple 2s (CS Green Apple 2s)', 'ea', '37.5', '0', '0.00%', '37.5', '0', '0.00%', '2020-03-19 18:05:24'),
(510, 1, 5, 1, 'Cucumber (Cucumber)', 'Kls', '33.99', '1474.99', '0.09%', '40', '1736', '0.10%', '2020-03-19 18:05:24'),
(511, 1, 5, 1, 'Curry Powder (Curry Powder 539g/can)', 'grms', '1.22', '0', '0.00%', '1.22', '0', '0.00%', '2020-03-19 18:05:24'),
(512, 1, 5, 1, 'Dahon Laurel (Dahon Laurel)', 'ea', '5', '2.8', '0.00%', '5', '2.8', '0.00%', '2020-03-19 18:05:24'),
(513, 1, 5, 1, 'Dahon Paminta (Dahon Paminta)', 'Pck', '5', '20', '0.00%', '5', '20', '0.00%', '2020-03-19 18:05:24'),
(514, 1, 5, 1, 'Dahon Saging (Dahon Saging)', 'grms', '0.03', '0', '0.00%', '0.03', '0', '0.00%', '2020-03-19 18:05:24'),
(515, 1, 5, 1, 'Datu Puti Soy Sauce (Datu Puti Soy Sauce 2L (1.893L))', 'ML', '78.7', '393.5', '0.02%', '73', '365', '0.02%', '2020-03-19 18:05:24'),
(516, 1, 5, 1, 'Datu Puti Vinegar (Datu Puti Vinegar 1 gal (3.785ltrs))', 'Gal', '137.6', '68.8', '0.00%', '115.8', '57.9', '0.00%', '2020-03-19 18:05:24'),
(517, 1, 5, 1, 'Datu Soy Sauce 4L/3.785 (Datu Soy Sauce 4L/3.785)', 'Gal', '139.85', '0', '0.00%', '139.85', '0', '0.00%', '2020-03-19 18:05:24'),
(518, 1, 5, 1, 'DE Sliced Black Olives 330g (DE Sliced Black Olives 330g)', 'Can', '76.65', '0', '0.00%', '76.65', '0', '0.00%', '2020-03-19 18:05:24'),
(519, 1, 5, 1, 'Del Monte Spaghetti 1kg (Del Monte Spaghetti 1kg)', 'Kls', '82.6', '743.4', '0.04%', '81.8', '736.2', '0.04%', '2020-03-19 18:05:24'),
(520, 1, 5, 1, 'Diamond Sliced Almonds (Diamond Sliced Almonds)', 'Pck', '399', '0', '0.00%', '399.95', '0', '0.00%', '2020-03-19 18:05:24'),
(521, 1, 5, 1, 'DM Olive Oil 250ML (DM Olive Oil 250ML)', 'Bot', '154.3', '0', '0.00%', '154.3', '0', '0.00%', '2020-03-19 18:05:24'),
(522, 1, 5, 1, 'DM Olive Oil 500ml (DM Olive Oil 500ml)', '', '272.6', '0', '0.00%', '272.6', '0', '0.00%', '2020-03-19 18:05:24'),
(523, 1, 5, 1, 'DM Spag 560g/500g (DM Spag 560g/500g)', 'Pck', '56.06', '0', '0.00%', '56.05', '0', '0.00%', '2020-03-19 18:05:24'),
(524, 1, 5, 1, 'DM Spaghetti 900g (DM Spaghetti 900g)', 'Pck', '76.7', '0', '0.00%', '76.7', '0', '0.00%', '2020-03-19 18:05:24'),
(525, 1, 5, 1, 'Dm Sweet Chili Sauce 120z (Dm Sweet Chili Sauce 120z)', 'Bot', '32.05', '0', '0.00%', '35.4', '0', '0.00%', '2020-03-19 18:05:24'),
(526, 1, 5, 1, 'Dolphin Bihon 1kl (Dolphin Bihon 1kl)', 'Kls', '53.55', '0', '0.00%', '53.55', '0', '0.00%', '2020-03-19 18:05:24'),
(527, 1, 5, 1, 'Dolphin Bihon 200g (Dolphin Bihon 200g)', 'Pck', '11.2', '0', '0.00%', '11.2', '0', '0.00%', '2020-03-19 18:05:24'),
(528, 1, 5, 1, 'Dolphin Golden Bihon 400g (Dolphin Golden Bihon 400g)', 'Pck', '22.75', '0', '0.00%', '22.75', '0', '0.00%', '2020-03-19 18:05:24'),
(529, 1, 5, 1, 'Dona Elena Al Dante Fettu 500g (Dona Elena Al Dante Fettu 500g)', 'Pck', '69.75', '0', '0.00%', '69.75', '0', '0.00%', '2020-03-19 18:05:24'),
(530, 1, 5, 1, 'Dona Elena Capers Vinegar 100g (Dona Elena Capers Vinegar 100g)', 'Bot', '71.3', '71.3', '0.00%', '71.3', '71.3', '0.00%', '2020-03-19 18:05:24'),
(531, 1, 5, 1, 'Dona Elena Flt Flt 365g (Dona Elena Flt Flt 365g)', 'Bot', '633.2', '633.2', '0.04%', '633.2', '633.2', '0.04%', '2020-03-19 18:05:24'),
(532, 1, 5, 1, 'Dona Elena Olive Oil 250ml (Dona Elena Olive Oil 250ml)', 'Bot', '137.85', '0', '0.00%', '137.85', '0', '0.00%', '2020-03-19 18:05:24'),
(533, 1, 5, 1, 'Dona Elena Olive Oil 500ml (Dona Elena Olive Oil 500ml)', 'Gal', '245.85', '0', '0.00%', '253.02', '0', '0.00%', '2020-03-19 18:05:24'),
(534, 1, 5, 1, 'Dried Mango 50g (Dried Mango 50g)', 'Pck', '168.7', '0', '0.00%', '168.7', '0', '0.00%', '2020-03-19 18:05:24'),
(535, 1, 5, 1, 'Durian Jam (Durian Jam)', 'grms', '0.4', '893.85', '0.05%', '0.39474', '876.32', '0.05%', '2020-03-19 18:05:24'),
(536, 1, 5, 1, 'Durian Preserve CS Jeya (Durian Preserve CS Jeya 120oz/ 340g)', 'Bot', '150', '0', '0.00%', '150', '0', '0.00%', '2020-03-19 18:05:24'),
(537, 1, 5, 1, 'Durian Preserve CS Neneng 380g (Durian Preserve CS Neneng 380g/bot)', 'Bot', '134', '0', '0.00%', '134', '0', '0.00%', '2020-03-19 18:05:24'),
(538, 1, 5, 1, 'Durian Whole (Durian Whole)', 'Kls', '158.84', '2049', '0.12%', '80', '1032', '0.06%', '2020-03-19 18:05:24'),
(539, 1, 5, 1, 'Egg Noodles (Egg Noodles)', 'Pck', '93', '0', '0.00%', '93', '0', '0.00%', '2020-03-19 18:05:24'),
(540, 1, 5, 1, 'equal Powder 50g (equal Powder 50g)', 'Pck', '137.95', '0', '0.00%', '137.95', '0', '0.00%', '2020-03-19 18:05:24'),
(541, 1, 5, 1, 'French Fries (French Fries)', 'grms', '0.1', '3919.85', '0.23%', '0.095', '3911.53', '0.23%', '2020-03-19 18:05:24'),
(542, 1, 5, 1, 'Frozen Durian (Frozen Durian)', 'Pck', '200', '0', '0.00%', '200', '0', '0.00%', '2020-03-19 18:05:24'),
(543, 1, 5, 1, 'Garlic (Garlic  )', 'grms', '0.18', '2450.03', '0.15%', '0.095', '1330', '0.08%', '2020-03-19 18:05:24'),
(544, 1, 5, 1, 'Garlic Fried 1 kg (Garlic Fried 1 kg)', 'grms', '0', '0', '0.00%', '0.27313', '0', '0.00%', '2020-03-19 18:05:24'),
(545, 1, 5, 1, 'Garlic Granulated (Garlic Granulated 45g/bot)', 'Bot', '71.37', '0', '0.00%', '71.36', '0', '0.00%', '2020-03-19 18:05:24'),
(546, 1, 5, 1, 'Garlic Powder 100g (Garlic Powder 100g)', 'Pck', '35.05', '43.46', '0.00%', '35.05', '43.46', '0.00%', '2020-03-19 18:05:24'),
(547, 1, 5, 1, 'Gelatine (Gelatine)', 'grms', '0.96', '2439.45', '0.15%', '0.96', '2438.4', '0.14%', '2020-03-19 18:05:24'),
(548, 1, 5, 1, 'Ginger (Ginger)', 'grms', '0.09', '418.93', '0.03%', '0.095', '433.2', '0.03%', '2020-03-19 18:05:24'),
(549, 1, 5, 1, 'Goat Cheese (Goat Cheese)', 'grms', '1.33', '0', '0.00%', '0.95', '0', '0.00%', '2020-03-19 18:05:24'),
(550, 1, 5, 1, 'Good Life Bihon 200g (Good Life Bihon 200g)', 'Pck', '17.05', '0', '0.00%', '17.05', '0', '0.00%', '2020-03-19 18:05:24'),
(551, 1, 5, 1, 'Good Life Bihon 400g (Good Life Bihon 400g)', 'Pck', '30.71', '0', '0.00%', '30.74', '0', '0.00%', '2020-03-19 18:05:24'),
(552, 1, 5, 1, 'Good Life Oyster Sauce 630ml (Good Life Oyster Sauce 630ml)', 'Bot', '140.5', '0', '0.00%', '140.5', '0', '0.00%', '2020-03-19 18:05:24'),
(553, 1, 5, 1, 'Good Sense Almonds 3.5oz (Good Sense Almonds 3.5oz)', 'ea', '189.95', '379.9', '0.02%', '189.95', '379.9', '0.02%', '2020-03-19 18:05:24'),
(554, 1, 5, 1, 'Grapes (Grapes)', 'Kls', '286.11', '460.64', '0.03%', '289.99', '466.88', '0.03%', '2020-03-19 18:05:24'),
(555, 1, 5, 1, 'Gravy Mix Knorr (Gravy Mix Knorr)', 'grms', '0', '0', '0.00%', '0.38', '0', '0.00%', '2020-03-19 18:05:24'),
(556, 1, 5, 1, 'Ground Beef Cooked (Ground Beef Cooked)', 'Kls', '290', '0', '0.00%', '417.9', '0', '0.00%', '2020-03-19 18:05:24'),
(557, 1, 5, 1, 'Ground Beef Pure Lean (Ground Beef Pure Lean)', 'Kls', '399.89', '13580.95', '0.81%', '440', '14943.28', '0.88%', '2020-03-19 18:05:24'),
(558, 1, 5, 1, 'Ground Pork (Ground Pork)', 'Kls', '185', '925', '0.06%', '205', '1025', '0.06%', '2020-03-19 18:05:24'),
(559, 1, 5, 1, 'Gruyere Block (Gruyere Block)', 'grms', '1.9', '1187.77', '0.07%', '1.71278', '1068.77', '0.06%', '2020-03-19 18:05:24'),
(560, 1, 5, 1, 'Gulaman 90g/pack (Gulaman 90g/pack)', 'grms', '0.54', '0', '0.00%', '0.54', '0', '0.00%', '2020-03-19 18:05:24'),
(561, 1, 5, 1, 'HamRoast Whole (HamRoast Whole/Pork Tapa)', 'Kls', '190.02', '0', '0.00%', '190', '0', '0.00%', '2020-03-19 18:05:24'),
(562, 1, 5, 1, 'Heinz Ketchup 300g (Heinz Ketchup 300g)', 'Bot', '45.25', '0', '0.00%', '47.3', '0', '0.00%', '2020-03-19 18:05:24'),
(563, 1, 5, 1, 'Heinz Tomatoe Ketchup 38oz (Heinz Tomatoe Ketchup 38oz)', 'Bot', '269.95', '1619.7', '0.10%', '269.95', '1619.7', '0.10%', '2020-03-19 18:05:24'),
(564, 1, 5, 1, 'Hoisen Sauce (Hoisen Sauce 240ml/bot)', 'Bot', '93.75', '0', '0.00%', '93.75', '0', '0.00%', '2020-03-19 18:05:24'),
(565, 1, 5, 1, 'Holiday Cheesedog 1kl (Holiday Cheesedog 1kl)', 'Kls', '0', '0', '0.00%', '155', '0', '0.00%', '2020-03-19 18:05:24'),
(566, 1, 5, 1, 'Honey Cems Prime Brand (Honey Cems Prime Brand)', 'Bot', '266.15', '0', '0.00%', '256.81', '0', '0.00%', '2020-03-19 18:05:24'),
(567, 1, 5, 1, 'HS Parchment Paper (HS Parchment Paper)', 'Roll', '66', '0', '0.00%', '69.75', '0', '0.00%', '2020-03-19 18:05:24'),
(568, 1, 5, 1, 'Hungarian Sausage pcs (Hungarian Sausage pcs)', 'ea', '62.4', '-748.8', '-0.04%', '62.4', '-748.8', '-0.04%', '2020-03-19 18:05:24'),
(569, 1, 5, 1, 'Hungarian Sausages (Hungarian Sausages 1KL/pack X 6pcs)', 'grms', '0.33', '6723.99', '0.40%', '0.33', '6765', '0.40%', '2020-03-19 18:05:24'),
(570, 1, 5, 1, 'Italian Seasoning 10g/bot (Italian Seasoning 10g/bot)', 'grms', '6.54', '0', '0.00%', '6.54', '0', '0.00%', '2020-03-19 18:05:24'),
(571, 1, 5, 1, 'Japanese Chili pads (Japanese Chili pads)', 'Pck', '89.94', '0', '0.00%', '89.95', '0', '0.00%', '2020-03-19 18:05:24'),
(572, 1, 5, 1, 'Katambak (Katambak)', 'grms', '0.22', '0', '0.00%', '0.22', '0', '0.00%', '2020-03-19 18:05:24'),
(573, 1, 5, 1, 'Kewpei Dressing 500ml (Kewpei Dressing 500ml)', 'Bot', '336', '0', '0.00%', '336', '0', '0.00%', '2020-03-19 18:05:24'),
(574, 1, 5, 1, 'Kewpie Roasted Seasame 1L (Kewpie Roasted Seasame 1L)', 'Bot', '664.4', '8723.57', '0.52%', '664.4', '8723.572', '0.51%', '2020-03-19 18:05:24'),
(575, 1, 5, 1, 'Kewpie Roasted Seasame 210ml (Kewpie Roasted Seasame 210ml)', 'Bot', '144.5', '2167.5', '0.13%', '144.5', '2167.5', '0.13%', '2020-03-19 18:05:24'),
(576, 1, 5, 1, 'Knorr Shrimps 60g (Knorr Shrimp 60g)', 'ea', '37.08', '0', '0.00%', '35.35', '0', '0.00%', '2020-03-19 18:05:24'),
(577, 1, 5, 1, 'Knorr Shrimps Broth Cubes 10g (Knorr Shrimps Broth Cubes 10g)', 'ea', '5.1', '76.5', '0.01%', '5.1', '76.5', '0.00%', '2020-03-19 18:05:24'),
(578, 1, 5, 1, 'La Patis 340ml (La Patis 340ml)', 'Bot', '14.14', '0', '0.00%', '14.14', '0', '0.00%', '2020-03-19 18:05:24'),
(579, 1, 5, 1, 'Lady finger (Lady finger)', 'grms', '0.07', '0', '0.00%', '0.07', '0', '0.00%', '2020-03-19 18:05:24'),
(580, 1, 5, 1, 'Lea & Perrins Worcesterchire (Lea & Perrins Worcesterchire  300ml)', 'Bot', '170.86', '0', '0.00%', '167.44', '0', '0.00%', '2020-03-19 18:05:24'),
(581, 1, 5, 1, 'Lea & Perrins Worcesterchire 15 (Lea & Perrins Worcesterchire 150ml)', 'Pck', '101.4', '302.17', '0.02%', '101.4', '302.17', '0.02%', '2020-03-19 18:05:24'),
(582, 1, 5, 1, 'Lean Meat Sliced (Lean Meat Sliced)', 'Kls', '430', '0', '0.00%', '430', '0', '0.00%', '2020-03-19 18:05:24'),
(583, 1, 5, 1, 'Lemon (Lemon)', 'Kls', '24.07', '369', '0.02%', '45', '689.94', '0.04%', '2020-03-19 18:05:24'),
(584, 1, 5, 1, 'Lemon Grass (Lemon Grass)', 'Bundle', '10', '178.2', '0.01%', '10', '178.2', '0.01%', '2020-03-19 18:05:24'),
(585, 1, 5, 1, 'Lemon Grass Brewed (Lemon Grass Brewed)', 'Kls', '4.14', '0', '0.00%', '4.14', '0', '0.00%', '2020-03-19 18:05:24'),
(586, 1, 5, 1, 'Lettuce (Lettuce)', 'Kls', '142.5', '0', '0.00%', '300', '0', '0.00%', '2020-03-19 18:05:24'),
(587, 1, 5, 1, 'Lettuce Curly (Lettuce Curly)', 'Kls', '144.79', '3185.31', '0.19%', '300', '6600', '0.39%', '2020-03-19 18:05:24'),
(588, 1, 5, 1, 'Lettuce Head (Lettuce Head)', 'Kls', '145', '466.32', '0.03%', '145', '466.32', '0.03%', '2020-03-19 18:05:24'),
(589, 1, 5, 1, 'Lettuce Ice berg (Lettuce Ice berg)', 'Kls', '75', '900', '0.05%', '187.15', '2245.8', '0.13%', '2020-03-19 18:05:24'),
(590, 1, 5, 1, 'Lettuce Leaf (Lettuce Leaf)', 'Kls', '176.71', '0', '0.00%', '212.53', '0', '0.00%', '2020-03-19 18:05:24'),
(591, 1, 5, 1, 'Lettuce Romaine (Lettuce Romaine)', 'Kls', '136.03', '3945', '0.23%', '349.94', '10148.26', '0.60%', '2020-03-19 18:05:24'),
(592, 1, 5, 1, 'Liquid Seasoning Maggi 1L (Liquid Seasoning Maggi 1L)', 'Bot', '236.51', '0', '0.00%', '231.65', '0', '0.00%', '2020-03-19 18:05:24'),
(593, 1, 5, 1, 'Liquid Seasoning Maggi 3.8L (Liquid Seasoning Maggi 3.8L)', 'Gal', '751.5', '495.99', '0.03%', '751.5', '495.99', '0.03%', '2020-03-19 18:05:24'),
(594, 1, 5, 1, 'Liver Spread Argentina (Liver Spread Argentina)', 'Can', '17.9', '0', '0.00%', '38', '0', '0.00%', '2020-03-19 18:05:24'),
(595, 1, 5, 1, 'Longanisa (Longanisa 340g/ pack X 10pcs)', 'ea', '4', '260', '0.02%', '4', '260', '0.02%', '2020-03-19 18:05:24'),
(596, 1, 5, 1, 'Maggi Magic Sarap 8g (Maggi Magic Sarap 8g)', 'ea', '2.96', '506.78', '0.03%', '2.95', '504.45', '0.03%', '2020-03-19 18:05:24'),
(597, 1, 5, 1, 'Magnolia Quickmelt 185/165 (Magnolia Quickmelt 185/165)', 'Bar', '73.78', '0', '0.00%', '73.78', '0', '0.00%', '2020-03-19 18:05:24'),
(598, 1, 5, 1, 'Magnolia Quickmelt Cheese900g (Magnolia Quickmelt Cheese900g)', 'Bar', '350', '472.5', '0.03%', '350', '472.5', '0.03%', '2020-03-19 18:05:24'),
(599, 1, 5, 1, 'Malasugue (Malasugue)', 'grms', '0.46', '3225', '0.19%', '0.45', '3150', '0.19%', '2020-03-19 18:05:24'),
(600, 1, 5, 1, 'Mama Sitas BBQ Marinated 680ml (Mama Sitas BBQ Marinated 680ml)', 'Bot', '128.7', '0', '0.00%', '128.7', '0', '0.00%', '2020-03-19 18:05:24'),
(601, 1, 5, 1, 'Mama Sitas Oyster Sauce 765g (Mama Sitas Oyster Sauce 765g)', 'Bot', '148.3', '0', '0.00%', '129.8', '0', '0.00%', '2020-03-19 18:05:24'),
(602, 1, 5, 1, 'Mangga Hilaw (Mangga Hilaw)', 'Kls', '39.81', '84', '0.01%', '50', '105.5', '0.01%', '2020-03-19 18:05:24'),
(603, 1, 5, 1, 'Mango (Mango)', 'Kls', '140', '504', '0.03%', '96.6', '347.76', '0.02%', '2020-03-19 18:05:24'),
(604, 1, 5, 1, 'Mango fresh (Mango fresh  )', 'Kls', '96.23', '3320', '0.20%', '140', '4830', '0.28%', '2020-03-19 18:05:24'),
(605, 1, 5, 1, 'Mango Jam 320ml (Mango Jam 320ml)', 'Bot', '101', '202', '0.01%', '81.75', '163.5', '0.01%', '2020-03-19 18:05:24'),
(606, 1, 5, 1, 'Marble Potato (Marble Potato)', 'grms', '0.03', '0', '0.00%', '0.035', '0', '0.00%', '2020-03-19 18:05:24'),
(607, 1, 5, 1, 'Marca Leon (Marca Leon)', 'Can', '890', '0', '0.00%', '890', '0', '0.00%', '2020-03-19 18:05:24'),
(608, 1, 5, 1, 'Maria Clara  750ml (Maria Clara  750ml)', 'Bot', '163.25', '608.92', '0.04%', '163.25', '608.92', '0.04%', '2020-03-19 18:05:24'),
(609, 1, 5, 1, 'Matchstick Emi 100s (Matchstick Emi 100s  )', 'ea', '0.16', '206.69', '0.01%', '0.16', '208', '0.01%', '2020-03-19 18:05:24'),
(610, 1, 5, 1, 'Mayonnaise-homemade (Mayonnaise-homemade  )', 'grms', '0.12', '421.92', '0.03%', '0.12', '421.92', '0.03%', '2020-03-19 18:05:24'),
(611, 1, 5, 1, 'MB Hot Sauce 100g 36/case (MB Hot Sauce 100g 36/case)', 'ea', '22.39', '1007.5', '0.06%', '21.95', '987.75', '0.06%', '2020-03-19 18:05:24'),
(612, 1, 5, 1, 'MB Hot Sauce 95ml (MB Hot Sauce 95ml)', 'Bot', '18.7', '0', '0.00%', '18.35', '0', '0.00%', '2020-03-19 18:05:24'),
(613, 1, 5, 1, 'MB Pickle Relish 250g (MB Pickle Relish 250g)', 'Bot', '62.95', '0', '0.00%', '62.95', '0', '0.00%', '2020-03-19 18:05:24'),
(614, 1, 5, 1, 'MB woystersauce 340ml (MB woystersauce 340ml)', 'Bot', '48.9', '43.03', '0.00%', '48.9', '43.03', '0.00%', '2020-03-19 18:05:24'),
(615, 1, 5, 1, 'Mc Cormick Basil Leaves Whole 9 (Mc Cormick Basil Leaves Whole 9g)', 'Bot', '45.7', '0', '0.00%', '45.7', '0', '0.00%', '2020-03-19 18:05:24'),
(616, 1, 5, 1, 'Mc Cormick Cry Powder  480g (Mc Cormick Cry Powder  480g)', 'Bot', '373.35', '0', '0.00%', '373.35', '0', '0.00%', '2020-03-19 18:05:24'),
(617, 1, 5, 1, 'Mc Cormick Garlic Powder 35g (Mc Cormick Garlic Powder 35g)', 'Bot', '24.5', '0', '0.00%', '60.7', '0', '0.00%', '2020-03-19 18:05:24'),
(618, 1, 5, 1, 'Mc Cormick RoseMary 235g (Mc Cormick RoseMary 235g)', 'Bot', '278.6', '236.81', '0.01%', '278.6', '236.81', '0.01%', '2020-03-19 18:05:24'),
(619, 1, 5, 1, 'Mixed Vegetable (Mixed Vegetable)', 'grms', '0.14', '1300.81', '0.08%', '0.139', '1300.762', '0.08%', '2020-03-19 18:05:24'),
(620, 1, 5, 1, 'moked pork sausage-pcs (Smoked pork sausage - pcs)', 'ea', '0', '0', '0.00%', '22', '0', '0.00%', '2020-03-19 18:05:24'),
(621, 1, 5, 1, 'Mongo Beans (Mongo Beans)', 'Kls', '80', '0', '0.00%', '80', '0', '0.00%', '2020-03-19 18:05:24'),
(622, 1, 5, 1, 'Mushroom Jolly Prm HTKE (Mushroom Jolly Prm HTKE 198g)', 'grms', '0', '0', '0.00%', '0.14', '0', '0.00%', '2020-03-19 18:05:24'),
(623, 1, 5, 1, 'Mushroom Shitake 284g (Mushroom Shitake)', 'grms', '0.14', '0', '0.00%', '0.18', '0', '0.00%', '2020-03-19 18:05:24'),
(624, 1, 5, 1, 'Mushroom Sliced (Mushroom Slice (Mushroom Sliced (Mushroom Sliced 400g  )  )', 'grms', '0.11', '0', '0.00%', '0.12', '0', '0.00%', '2020-03-19 18:05:24'),
(625, 1, 5, 1, 'Mushroom Straw 200g (Mushroom Straw 200g)', 'grms', '0', '0', '0.00%', '0.24', '0', '0.00%', '2020-03-19 18:05:24'),
(626, 1, 5, 1, 'Mustard (Mustard Dijon 5kgs E. Fallot)', 'grms', '0.32', '957', '0.06%', '0.319', '957', '0.06%', '2020-03-19 18:05:24'),
(627, 1, 5, 1, 'Nanya Wrap (cling wrap) (Nanya Wrap (cling wrap))', 'Roll', '695', '0', '0.00%', '695', '0', '0.00%', '2020-03-19 18:05:24'),
(628, 1, 5, 1, 'Novellino 750ml (Novellino 750ml)', 'Bot', '259', '950.53', '0.06%', '319', '1170.73', '0.07%', '2020-03-19 18:05:24'),
(629, 1, 5, 1, 'Nutmeg Ground (Nutmeg Ground 375G/BOT)', 'Bot', '87.9', '0', '0.00%', '87.95', '0', '0.00%', '2020-03-19 18:05:24'),
(630, 1, 5, 1, 'Olive Oil 16.90z (Olive Oil 16.90z)', 'Gal', '359.95', '0', '0.00%', '359.95', '0', '0.00%', '2020-03-19 18:05:24'),
(631, 1, 5, 1, 'Olive Oil 1L (Olive Oil 1L)', 'Bot', '474.45', '4198.88', '0.25%', '513.65', '4545.8', '0.27%', '2020-03-19 18:05:24'),
(632, 1, 5, 1, 'Onion (Onion)', 'ea', '65', '0', '0.00%', '21.36', '0', '0.00%', '2020-03-19 18:05:24'),
(633, 1, 5, 1, 'Orange (Orange)', 'ea', '24.24', '1575.48', '0.09%', '30.89', '2007.85', '0.12%', '2020-03-19 18:05:24'),
(634, 1, 5, 1, 'Oregano Ground 10G (Oregano Ground 10G)', 'Bot', '85.7', '0', '0.00%', '85.7', '0', '0.00%', '2020-03-19 18:05:24'),
(635, 1, 5, 1, 'Oyster Sauce Lee Kum Kee 907ml (Oyster Sauce Lee Kum Kee 907ml)', 'Bot', '172.49', '0', '0.00%', '172.5', '0', '0.00%', '2020-03-19 18:05:24'),
(636, 1, 5, 1, 'Oyster Sauce Mothers Best 750ml (Oyster Sauce Mothers Best 750ml)', 'Bot', '101.55', '0', '0.00%', '126.2', '0', '0.00%', '2020-03-19 18:05:24'),
(637, 1, 5, 1, 'Pancake dough (Pancake dough  )', 'grms', '0.09', '0', '0.00%', '0.09', '0', '0.00%', '2020-03-19 18:05:24'),
(638, 1, 5, 1, 'Paper Towel Premium 30packs/cas (Paper Towel Premium 30packs/cas)', 'Pck', '32.55', '2115.75', '0.13%', '32.55', '2115.75', '0.12%', '2020-03-19 18:05:24'),
(639, 1, 5, 1, 'Paprika Spanish 34g (Paprika Spanish 34g)', 'Bot', '56.4', '0', '0.00%', '56.4', '0', '0.00%', '2020-03-19 18:05:24'),
(640, 1, 5, 1, 'Parmesan Cheese (Parmesan Cheese)', 'grms', '1.2', '10539.49', '0.63%', '1.232', '10853.92', '0.64%', '2020-03-19 18:05:24'),
(641, 1, 5, 1, 'Parmesan Whole ( Wedges) (Parmesan Whole ( Wedges))', 'grms', '1.01', '0', '0.00%', '1.012', '0', '0.00%', '2020-03-19 18:05:24'),
(642, 1, 5, 1, 'Parsley (Parsley)', 'grms', '0.23', '171.46', '0.01%', '0.5', '380', '0.02%', '2020-03-19 18:05:24'),
(643, 1, 5, 1, 'Paulsen Sauerkraut 9.7kg (Paulsen Sauerkraut 9.7kg)', 'Kls', '1298', '0', '0.00%', '1298', '0', '0.00%', '2020-03-19 18:05:24'),
(644, 1, 5, 1, 'Paulsen Weisauerkraur 500g (Paulsen Weisauerkraur 500g)', 'Kls', '88', '1848', '0.11%', '88', '1848', '0.11%', '2020-03-19 18:05:24'),
(645, 1, 5, 1, 'Peanut Butter (Peanut Butter)', 'Bot', '0', '0', '0.00%', '60', '0', '0.00%', '2020-03-19 18:05:24'),
(646, 1, 5, 1, 'Pears (Pears)', 'ea', '26.53', '848.93', '0.05%', '35', '1120', '0.07%', '2020-03-19 18:05:24'),
(647, 1, 5, 1, 'PF Honeycured Bacon 1kg (PF Honeycured Bacon 1kg)', 'Pck', '544', '0', '0.00%', '544', '0', '0.00%', '2020-03-19 18:05:24'),
(648, 1, 5, 1, 'Pickle Relish (Pickle Relish 270g/Bot)', 'Bot', '51.45', '51.45', '0.00%', '61.95', '61.95', '0.00%', '2020-03-19 18:05:24'),
(649, 1, 5, 1, 'Pickle Relish 100g (Pickle Relish 100g/Bot  )', 'Bot', '23.15', '0', '0.00%', '23.15', '0', '0.00%', '2020-03-19 18:05:24'),
(650, 1, 5, 1, 'Pickle Relish 160z (Pickle Relish 160z)', 'Bot', '149.95', '0', '0.00%', '149.95', '0', '0.00%', '2020-03-19 18:05:24'),
(651, 1, 5, 1, 'Pineapple (Pineapple)', 'Kls', '29.59', '79.88', '0.01%', '30', '81', '0.01%', '2020-03-19 18:05:24'),
(652, 1, 5, 1, 'Pork (Pork)', 'Kls', '170', '0', '0.00%', '185', '0', '0.00%', '2020-03-19 18:05:24'),
(653, 1, 5, 1, 'Pork Belly (Pork Belly)', 'Kls', '185', '740', '0.04%', '220', '880', '0.05%', '2020-03-19 18:05:24'),
(654, 1, 5, 1, 'Pork Bratwurst (Pork Bratwurst 1 kl/pck or 6 pcs/pack-130gms)', 'grms', '0.39', '0', '0.00%', '0.39', '0', '0.00%', '2020-03-19 18:05:24'),
(655, 1, 5, 1, 'Pork Chicharon (Pork Chicharon)', 'Pck', '70', '0', '0.00%', '70', '0', '0.00%', '2020-03-19 18:05:24'),
(656, 1, 5, 1, 'Pork Chop Bone-In (Pork Chop Bone-In)', 'Kls', '209.83', '4210.96', '0.25%', '220', '4414.96', '0.26%', '2020-03-19 18:05:24'),
(657, 1, 5, 1, 'Pork Chop Skinless (Pork Chop Skinless)', 'Kls', '209.99', '0', '0.00%', '215', '0', '0.00%', '2020-03-19 18:05:24'),
(658, 1, 5, 1, 'Pork Cubes 600g (Pork Cubes 600g)', 'Tub', '259.43', '1284.2', '0.08%', '259.5', '1284.525', '0.08%', '2020-03-19 18:05:24'),
(659, 1, 5, 1, 'Pork Giniling (Pork Giniling)', 'grms', '0.19', '2035.01', '0.12%', '0.185', '2035', '0.12%', '2020-03-19 18:05:24'),
(660, 1, 5, 1, 'Pork Knuckles (Pork Knuckles)', 'Kls', '182', '1820', '0.11%', '182', '1820', '0.11%', '2020-03-19 18:05:24'),
(661, 1, 5, 1, 'Pork Mandarin Sausage (Pork Mandarin Sausage)', 'grms', '0.35', '0', '0.00%', '0.35', '0', '0.00%', '2020-03-19 18:05:24'),
(662, 1, 5, 1, 'Pork Maskara (Pork Maskara)', 'Kls', '150', '899.97', '0.05%', '150', '900', '0.05%', '2020-03-19 18:05:24'),
(663, 1, 5, 1, 'Pork Riblets (Pork Riblets)', 'Kls', '394.97', '0', '0.00%', '395', '0', '0.00%', '2020-03-19 18:05:24'),
(664, 1, 5, 1, 'Pork Ribs (Pork Ribs)', 'Kls', '160', '0', '0.00%', '180', '0', '0.00%', '2020-03-19 18:05:24'),
(665, 1, 5, 1, 'Pork Tapa (Pork Tapa)', 'Kls', '244.97', '3674.61', '0.22%', '245', '3675', '0.22%', '2020-03-19 18:05:24'),
(666, 1, 5, 1, 'Pork Tapa Marinated (Pork Tapa Marinated)', 'Kls', '249.53', '0', '0.00%', '249.53', '0', '0.00%', '2020-03-19 18:05:24'),
(667, 1, 5, 1, 'Pork Tocino (Pork Tocino)', 'Kls', '240.07', '1288.71', '0.08%', '240', '1288.32', '0.08%', '2020-03-19 18:05:24'),
(668, 1, 5, 1, 'Pork Tocino (Skinless) (Pork Tocino (Skinless))', 'Pck', '50', '0', '0.00%', '50', '0', '0.00%', '2020-03-19 18:05:24'),
(669, 1, 5, 1, 'Porky Best Chiharon 70g (Porky Best Chiharon 70g)', 'Pck', '43.22', '0', '0.00%', '43.22', '0', '0.00%', '2020-03-19 18:05:24'),
(670, 1, 5, 1, 'Potato (Potato  )', 'grms', '0.07', '2236.77', '0.13%', '0.075', '2249.55', '0.13%', '2020-03-19 18:05:24'),
(671, 1, 5, 1, 'Potato marble (Potato marble  )', 'grms', '0.03', '0', '0.00%', '0.03', '0', '0.00%', '2020-03-19 18:05:24'),
(672, 1, 5, 1, 'Pudding (Pudding)', 'ea', '6.6', '0', '0.00%', '6.6', '0', '0.00%', '2020-03-19 18:05:24'),
(673, 1, 5, 1, 'Quick Melt 440g (Quick Melt 440g)', 'grms', '0.51', '-959.58', '-0.06%', '0.74', '-1406', '-0.08%', '2020-03-19 18:05:24'),
(674, 1, 5, 1, 'Ram Bread Crams 100g (Ram Bread Crams 100g)', 'Bot', '12.2', '0', '0.00%', '12.3', '0', '0.00%', '2020-03-19 18:05:24'),
(675, 1, 5, 1, 'Ram Bread Crams 500g (Ram Bread Crams 500g)', 'Pck', '60.85', '60.85', '0.00%', '60.85', '60.85', '0.00%', '2020-03-19 18:05:24'),
(676, 1, 5, 1, 'Ram Liver Spread 85g (Ram Liver Spread 85g)', 'ea', '17.9', '107.4', '0.01%', '16.3', '97.8', '0.01%', '2020-03-19 18:05:24'),
(677, 1, 5, 1, 'Ram Oyster Sauce 400ml (Ram Oyster Sauce 400ml)', 'Bot', '63.45', '230.32', '0.01%', '63.45', '230.32', '0.01%', '2020-03-19 18:05:24'),
(678, 1, 5, 1, 'Ram Oyster Sauce 750ml (Ram Oyster Sauce 750ml)', 'Bot', '101.55', '507.75', '0.03%', '101.55', '507.75', '0.03%', '2020-03-19 18:05:24'),
(679, 1, 5, 1, 'Ram Pcs/Stms Mushroom 425g/400g (Ram Pcs/Stms Mushroom 425g/400g)', 'Can', '46.3', '0', '0.00%', '46.3', '0', '0.00%', '2020-03-19 18:05:24'),
(680, 1, 5, 1, 'Ram Pickle 405g (Ram Pickle 405g)', 'ea', '85.05', '0', '0.00%', '85.05', '0', '0.00%', '2020-03-19 18:05:24'),
(681, 1, 5, 1, 'Ram Soy Sauce 1 gal (Ram Soy Sauce 1 gal)', 'Gal', '131.9', '0', '0.00%', '102.1', '0', '0.00%', '2020-03-19 18:05:24'),
(682, 1, 5, 1, 'Ram Spaghetti 1kg (Ram Spaghetti 1kg)', 'Pck', '55.55', '166.65', '0.01%', '55.55', '166.65', '0.01%', '2020-03-19 18:05:24'),
(683, 1, 5, 1, 'RAM spaghetti sauce sweet 750g (RAM spaghetti sauce sweet 750g)', 'Pck', '83.3', '0', '0.00%', '83.3', '0', '0.00%', '2020-03-19 18:05:24'),
(684, 1, 5, 1, 'Ram Special Bihon 227g (Ram Special Bihon 227g)', 'Pck', '17.8', '0', '0.00%', '17.8', '0', '0.00%', '2020-03-19 18:05:24'),
(685, 1, 5, 1, 'RAM Special Bihon 454g (RAM Special Bihon 454g)', 'Pck', '33.5', '0', '0.00%', '33.5', '0', '0.00%', '2020-03-19 18:05:24'),
(686, 1, 5, 1, 'Ram Tomatoe Paste 500g (Ram Tomatoe Paste 500g)', 'Pck', '70.3', '140.6', '0.01%', '70.3', '140.6', '0.01%', '2020-03-19 18:05:24'),
(687, 1, 5, 1, 'Red Onion (Red Onion)', 'Kls', '95.17', '1025.95', '0.06%', '85', '916.3', '0.05%', '2020-03-19 18:05:24'),
(688, 1, 5, 1, 'Regina Balsamic Venigar 16.9oz (Regina Balsamic Venigar 16.9oz)', 'Bot', '249.95', '249.95', '0.02%', '249.95', '249.95', '0.02%', '2020-03-19 18:05:24'),
(689, 1, 5, 1, 'Reno Liver Spread 85g (Reno Liver Spread 85g)', 'Pck', '20.6', '0', '0.00%', '20.6', '0', '0.00%', '2020-03-19 18:05:24'),
(690, 1, 5, 1, 'Rib Eye Whole (Rib Eye Whole)', 'Kls', '899.98', '2737.75', '0.16%', '1100', '3346.2', '0.20%', '2020-03-19 18:05:24'),
(691, 1, 5, 1, 'Rice (Rice)', 'Kls', '34.59', '11310', '0.67%', '39.58333', '12943.75', '0.76%', '2020-03-19 18:05:24'),
(692, 1, 5, 1, 'Rice Vinegar 120z (Rice Vinegar 120z)', 'Bot', '199.95', '0', '0.00%', '199.95', '0', '0.00%', '2020-03-19 18:05:24'),
(693, 1, 5, 1, 'Rice Wine 700ml (Rice Wine 700ml)', 'Bot', '78', '78', '0.01%', '76.5', '76.5', '0.00%', '2020-03-19 18:05:24'),
(694, 1, 5, 1, 'Roland White Truffle Oil 3.4oz (Roland White Truffle Oil 3.4oz)', 'Bot', '990', '0', '0.00%', '990', '0', '0.00%', '2020-03-19 18:05:24'),
(695, 1, 5, 1, 'Rosemary 11g (Rosemary 11g)', 'Bot', '42.44', '0', '0.00%', '42.45', '0', '0.00%', '2020-03-19 18:05:24'),
(696, 1, 5, 1, 'Royal Spaghetti (Royal Spaghetti)', 'Pck', '81.8', '0', '0.00%', '80.2', '0', '0.00%', '2020-03-19 18:05:24'),
(697, 1, 5, 1, 'Rufina Patis 325ml (Rufina Patis 325ml)', 'Bot', '24.9', '0', '0.00%', '39.65', '0', '0.00%', '2020-03-19 18:05:24'),
(698, 1, 5, 1, 'Rufina Patis 750ml (Rufina Patis 750ml  )', 'Bot', '66.69', '978.96', '0.06%', '67.2', '986.5', '0.06%', '2020-03-19 18:05:24'),
(699, 1, 5, 1, 'Sage Leaves 12g (Sage Leaves 12g)', 'Bot', '44.27', '0', '0.00%', '44.25', '0', '0.00%', '2020-03-19 18:05:24'),
(700, 1, 5, 1, 'Sage Leaves 195g (Sage Leaves 195g)', 'Bot', '310.41', '214.18', '0.01%', '373.35', '257.61', '0.02%', '2020-03-19 18:05:24'),
(701, 1, 5, 1, 'Salsa verde (Salsa verde  )', 'grms', '0.49', '98', '0.01%', '0.49', '98', '0.01%', '2020-03-19 18:05:24'),
(702, 1, 5, 1, 'Salt (Salt)', 'grms', '0.01', '710.4', '0.04%', '0.0096', '710.4', '0.04%', '2020-03-19 18:05:24'),
(703, 1, 5, 1, 'San Marino Tuna Spread 85g (San Marino Tuna Spread 85g)', 'Can', '18.5', '0', '0.00%', '18.5', '0', '0.00%', '2020-03-19 18:05:24'),
(704, 1, 5, 1, 'San Remo Fettuccini 500g (San Remo Fettuccini 500g)', 'grms', '0.17', '918.04', '0.06%', '0.1347', '740.85', '0.04%', '2020-03-19 18:05:24'),
(705, 1, 5, 1, 'San Remo Lngne 500g (San Remo Lngne 500g)', 'ea', '66.05', '0', '0.00%', '66.05', '0', '0.00%', '2020-03-19 18:05:24'),
(706, 1, 5, 1, 'San Remo Pnne Rgti 500g (San Remo Pnne Rgti 500g)', 'grms', '68.14', '545.1', '0.03%', '67.35', '538.8', '0.03%', '2020-03-19 18:05:24'),
(707, 1, 5, 1, 'Sesame Oil 115ml (Sesame Oil 115ml)', 'Bot', '102.7', '0', '0.00%', '102.7', '0', '0.00%', '2020-03-19 18:05:24'),
(708, 1, 5, 1, 'Sesame Oil 330ml (Sesame Oil 330ml)', 'ML', '120', '0', '0.00%', '114', '0', '0.00%', '2020-03-19 18:05:24'),
(709, 1, 5, 1, 'Sesame Oil Lee Kum Lee 207ml (Sesame Oil Lee Kum Lee 207ml)', 'Bot', '88.2', '0', '0.00%', '127.9', '0', '0.00%', '2020-03-19 18:05:24'),
(710, 1, 5, 1, 'SESAME OIL MUA YU 2L (SESAME OIL MUA YU 2L)', 'Bot', '408', '0', '0.00%', '408', '0', '0.00%', '2020-03-19 18:05:24'),
(711, 1, 5, 1, 'Sesame Oil Mua Yu 500ml (Sesame Oil Mua Yu 500ml)', 'Bot', '162', '567', '0.03%', '162', '567', '0.03%', '2020-03-19 18:05:24'),
(712, 1, 5, 1, 'Sevilla Swt Relish Pickle 405g (Sevilla Swt Relish Pickle 405g)', 'Bot', '68.25', '0', '0.00%', '68.25', '0', '0.00%', '2020-03-19 18:05:24'),
(713, 1, 5, 1, 'Shrimps (Shrimps)', 'grms', '0.28', '70', '0.00%', '0.28', '70', '0.00%', '2020-03-19 18:05:24'),
(714, 1, 5, 1, 'Sibuyas Dahon (Sibuyas Dahon)', 'Kls', '61.19', '198.24', '0.01%', '120', '388.8', '0.02%', '2020-03-19 18:05:24'),
(715, 1, 5, 1, 'Sili (Sili)', 'Pck', '15', '0', '0.00%', '15', '0', '0.00%', '2020-03-19 18:05:24'),
(716, 1, 5, 1, 'Silver Swan 1/2 gal (Silver Swan 1/2 gal)', 'Gal', '80.55', '161.1', '0.01%', '76.7', '153.4', '0.01%', '2020-03-19 18:05:24'),
(717, 1, 5, 1, 'Silver Swan Patis 750ml (Silver Swan Patis 750ml)', 'Bot', '50.65', '0', '0.00%', '50.65', '0', '0.00%', '2020-03-19 18:05:24'),
(718, 1, 5, 1, 'silver Swan Soy Sauce 1 gal (silver Swan Soy Sauce 1 gal)', 'Gal', '140.25', '350.62', '0.02%', '140.25', '350.63', '0.02%', '2020-03-19 18:05:24'),
(719, 1, 5, 1, 'Silver Swan Sukang Puti3785ml (Silver Swan Sukang Puti3785ml)', 'Gal', '119.5', '0', '0.00%', '119.5', '0', '0.00%', '2020-03-19 18:05:24'),
(720, 1, 5, 1, 'Singkamas (Singkamas)', 'Kls', '30.78', '231.16', '0.01%', '100', '751', '0.04%', '2020-03-19 18:05:24'),
(721, 1, 5, 1, 'Sliced Mushroom 850g (Sliced Mushroom 850g)', 'ea', '96.95', '0', '0.00%', '96.95', '0', '0.00%', '2020-03-19 18:05:24'),
(722, 1, 5, 1, 'Smoke Porkloin (Smoke Porkloin)', 'Kls', '336', '26.88', '0.00%', '336', '26.88', '0.00%', '2020-03-19 18:05:24'),
(723, 1, 5, 1, 'Smoked Farmer\'s Ham (Smoked Farmer\'s Ham)', 'Kls', '360', '0', '0.00%', '360', '0', '0.00%', '2020-03-19 18:05:24'),
(724, 1, 5, 1, 'Smoked Pork Sausage (Smoked Pork Sausage 1KL/pack X 19pcs)', 'grms', '0.33', '0', '0.00%', '0.02', '0', '0.00%', '2020-03-19 18:05:24');
INSERT INTO `eb_raw_materials` (`PK_raw_materials_id`, `FK_outlet_id`, `FK_category_id`, `status`, `material_name`, `unit`, `average_cost`, `asset_value`, `total_asset_percent`, `sales_price`, `retail_value`, `total_retail_percent`, `date_added`) VALUES
(725, 1, 5, 1, 'Smoked pork sausage-pck (Smoked pork sausage (1kl/pack = 15pcs/pck)', 'Pck', '330', '990', '0.06%', '330', '990', '0.06%', '2020-03-19 18:05:24'),
(726, 1, 5, 1, 'Smoked pork sausage-pcs (Smoked pork sausage-pcs)', 'ea', '22', '0', '0.00%', '22', '0', '0.00%', '2020-03-19 18:05:24'),
(727, 1, 5, 1, 'Soy Sauce 500ml (Soy Sauce 500ml)', 'Bot', '62.45', '0', '0.00%', '62.45', '0', '0.00%', '2020-03-19 18:05:24'),
(728, 1, 5, 1, 'Spaghetti Pasta (Spaghetti Pasta)', 'Pck', '67.95', '679.5', '0.04%', '77.66', '776.6', '0.05%', '2020-03-19 18:05:24'),
(729, 1, 5, 1, 'Spaghetti pasta-Royal (Spaghetti pasta-Royal (1000 gms)  )', 'Pck', '89.95', '0', '0.00%', '83.3', '0', '0.00%', '2020-03-19 18:05:24'),
(730, 1, 5, 1, 'Spaghetti Sauce Filipino Style (Spaghetti Sauce Filipino Style)', 'grms', '0.07', '742.03', '0.04%', '0.07067', '742.04', '0.04%', '2020-03-19 18:05:24'),
(731, 1, 5, 1, 'Spaghetti Sauce Sweet 1kg (Spaghetti Sauce Sweet 1kg)', 'Pck', '82.6', '165.2', '0.01%', '81.6', '163.2', '0.01%', '2020-03-19 18:05:24'),
(732, 1, 5, 1, 'Special Bihon 250g (Special Bihon 250g)', 'Pck', '14', '0', '0.00%', '25.75', '0', '0.00%', '2020-03-19 18:05:24'),
(733, 1, 5, 1, 'Spring Onion (Spring Onion)', 'grms', '0.07', '350', '0.02%', '0.114', '570', '0.03%', '2020-03-19 18:05:24'),
(734, 1, 5, 1, 'Squash (Squash)', 'Kls', '11.04', '65.14', '0.00%', '35', '206.5', '0.01%', '2020-03-19 18:05:24'),
(735, 1, 5, 1, 'Squid (Squid)', 'grms', '0.36', '238', '0.01%', '0.36', '241.2', '0.01%', '2020-03-19 18:05:24'),
(736, 1, 5, 1, 'Srircha Chili Sauce18 (Srircha Chili Sauce18)', 'Bot', '229', '0', '0.00%', '229', '0', '0.00%', '2020-03-19 18:05:24'),
(737, 1, 5, 1, 'Star Anis (Star Anis)', 'Bot', '0', '0', '0.00%', '53.25', '0', '0.00%', '2020-03-19 18:05:24'),
(738, 1, 5, 1, 'Sunpride Spiced Ham 1kg (Sunpride Spiced Ham 1kg)', 'Kls', '178.95', '0', '0.00%', '178.95', '0', '0.00%', '2020-03-19 18:05:24'),
(739, 1, 5, 1, 'SunSweet Cranberries Trt&Tngy 6 (SunSweet Cranberries Trt&Tngy 60z)', 'Bot', '179.95', '0', '0.00%', '179.95', '0', '0.00%', '2020-03-19 18:05:24'),
(740, 1, 5, 1, 'Susan Baker Corn Oil 2L (Susan Baker Corn Oil 2L)', 'ML', '0.16', '0', '0.00%', '0.161', '0', '0.00%', '2020-03-19 18:05:24'),
(741, 1, 5, 1, 'Susan Baker Sliced Mushroom 284 (Susan Baker Sliced Mushroom 284)', 'Bot', '42.21', '717.57', '0.04%', '42.21', '717.57', '0.04%', '2020-03-19 18:05:24'),
(742, 1, 5, 1, 'SusanBaker Steam Mshrm 400g (SusanBaker Steam Mshrm 400g)', 'ea', '46.73', '327.08', '0.02%', '45', '315', '0.02%', '2020-03-19 18:05:24'),
(743, 1, 5, 1, 'Sweet Potatoe (Sweet Potatoe)', 'Kls', '20.33', '61', '0.00%', '30', '90', '0.01%', '2020-03-19 18:05:24'),
(744, 1, 5, 1, 'Sweetcorn (Sweetcorn)', 'Kls', '10', '0', '0.00%', '95.88', '0', '0.00%', '2020-03-19 18:05:24'),
(745, 1, 5, 1, 'SweetCorn pcs (SweetCorn)', 'ea', '11.67', '245.1', '0.02%', '15', '315', '0.02%', '2020-03-19 18:05:24'),
(746, 1, 5, 1, 'Tauge (Tauge)', 'grms', '0', '0', '0.00%', '0.04', '0', '0.00%', '2020-03-19 18:05:24'),
(747, 1, 5, 1, 'Thousand island dressing (Thousand island dressing  )', 'grms', '0.27', '0', '0.00%', '0.27', '0', '0.00%', '2020-03-19 18:05:24'),
(748, 1, 5, 1, 'Thyme Leaves 14g (Thyme Leaves 14g)', 'Bot', '44.29', '0', '0.00%', '44.3', '0', '0.00%', '2020-03-19 18:05:24'),
(749, 1, 5, 1, 'Thyme Leaves 225g (Thyme Leaves 225g)', 'Bot', '298', '131.12', '0.01%', '298', '131.12', '0.01%', '2020-03-19 18:05:24'),
(750, 1, 5, 1, 'Tita My Patis 345ml (Tita My Patis 345ml)', 'Bot', '17.85', '0', '0.00%', '17.85', '0', '0.00%', '2020-03-19 18:05:24'),
(751, 1, 5, 1, 'Tita Patis 750ML (Tita Patis 750ML)', 'Bot', '37.95', '0', '0.00%', '37.95', '0', '0.00%', '2020-03-19 18:05:24'),
(752, 1, 5, 1, 'Tomato Paste 150g/pack (Tomato Paste 150g/pack)', 'Pck', '19.25', '0', '0.00%', '19.25', '0', '0.00%', '2020-03-19 18:05:24'),
(753, 1, 5, 1, 'Tomato Sauce Clara Ole 1kg (Tomato Sauce Clara Ole 1kg)', 'Pck', '58.03', '0', '0.00%', '58.2', '0', '0.00%', '2020-03-19 18:05:24'),
(754, 1, 5, 1, 'Tomatoe (Tomatoe)', 'Kls', '23.07', '445.64', '0.03%', '40', '772.8', '0.05%', '2020-03-19 18:05:24'),
(755, 1, 5, 1, 'Tuna 1705g (Tuna 1705g)', 'grms', '0.24', '0', '0.00%', '0.24', '0', '0.00%', '2020-03-19 18:05:24'),
(756, 1, 5, 1, 'Tuna Bariles (Tuna Bariles)', 'grms', '0.43', '98.9', '0.01%', '0.34', '78.2', '0.01%', '2020-03-19 18:05:24'),
(757, 1, 5, 1, 'Tuna Flakes 155g (Tuna Flakes 155g)', 'Bot', '27.8', '0', '0.00%', '27.8', '0', '0.00%', '2020-03-19 18:05:24'),
(758, 1, 5, 1, 'Tuna Flakes 180g (Tuna Flakes 180g)', 'Can', '34.28', '0', '0.00%', '34.3', '0', '0.00%', '2020-03-19 18:05:24'),
(759, 1, 5, 1, 'Turmeric Ground 30g (Turmeric Ground 30g)', 'Bot', '51.3', '0', '0.00%', '51.3', '0', '0.00%', '2020-03-19 18:05:24'),
(760, 1, 5, 1, 'Turmeric Ground Big Bot (Turmeric Ground Big Bot)', 'Bot', '458.96', '440.6', '0.03%', '453.55', '435.41', '0.03%', '2020-03-19 18:05:24'),
(761, 1, 5, 1, 'UFC Spaghetti Sauce 1kg (UFC Spaghetti Sauce 1kg)', 'Pck', '61.1', '0', '0.00%', '61.8', '0', '0.00%', '2020-03-19 18:05:24'),
(762, 1, 5, 1, 'Vinegar (silver swan- 1893 ml/g (Vinegar (silver swan- 1893 ml/gal)  )', 'ML', '0.03', '107.94', '0.01%', '0.07', '282.45', '0.02%', '2020-03-19 18:05:24'),
(763, 1, 5, 1, 'Vinegar Balsamic 500ml/bot (Vinegar Balsamic 500ml/bot)', 'Bot', '214.95', '0', '0.00%', '257.97', '0', '0.00%', '2020-03-19 18:05:24'),
(764, 1, 5, 1, 'Vinegar Capers 340g/bot (Vinegar Capers 340g/bot)', 'Bot', '148', '0', '0.00%', '148', '0', '0.00%', '2020-03-19 18:05:24'),
(765, 1, 5, 1, 'Watermelon (Watermelon)', 'Kls', '25', '0', '0.00%', '23.33', '0', '0.00%', '2020-03-19 18:05:24'),
(766, 1, 5, 1, 'Watermelon fresh (Watermelon fresh  )', 'Kls', '20.51', '856.78', '0.05%', '25', '1044.25', '0.06%', '2020-03-19 18:05:24'),
(767, 1, 5, 1, 'White Onion (White Onion)', 'Kls', '65.92', '563.61', '0.03%', '89.72', '767.11', '0.05%', '2020-03-19 18:05:24'),
(768, 1, 5, 1, 'White Onion pcs (White Onion pcs)', 'ea', '0', '0', '0.00%', '95', '0', '0.00%', '2020-03-19 18:05:24'),
(769, 1, 5, 1, 'White Pepper Powder 31g (White Pepper Powder 31g)', 'Bot', '74.14', '0', '0.00%', '74.15', '0', '0.00%', '2020-03-19 18:05:24'),
(770, 1, 5, 1, 'White wine-Novelino ( 750 ml) (White wine-Novelino ( 750 ml)  )', 'Bot', '274.97', '0', '0.00%', '309.5', '0', '0.00%', '2020-03-19 18:05:24'),
(771, 1, 6, 1, '1 Oz Cup White (1 Oz Cup White)', 'ea', '0.65', '0', '0.00%', '0.65', '0', '0.00%', '2020-03-20 01:05:08'),
(772, 1, 6, 1, '1 oz Lid White (1 oz Lid White)', 'ea', '0.5', '0', '0.00%', '0.5', '0', '0.00%', '2020-03-20 01:05:08'),
(773, 1, 6, 1, '10 Cake Box (10 Cake Box)', 'ea', '8', '0', '0.00%', '8', '0', '0.00%', '2020-03-20 01:05:08'),
(774, 1, 6, 1, '10 Diameter Board (10 Diameter Board)', 'ea', '17', '238', '0.01%', '17', '238', '0.01%', '2020-03-20 01:05:08'),
(775, 1, 6, 1, '102 Plastic Cup w/lid (102 Plastic Cup w/lid)', 'ea', '2.22', '0', '0.00%', '2.22', '0', '0.00%', '2020-03-20 01:05:08'),
(776, 1, 6, 1, '10X10 Round Board (10X10 Round Board)', 'ea', '12', '0', '0.00%', '12', '0', '0.00%', '2020-03-20 01:05:08'),
(777, 1, 6, 1, '10x10x4 Royal Red (10x10x4 Royal Red)', 'ea', '23.14', '0', '0.00%', '26.18', '0', '0.00%', '2020-03-20 01:05:08'),
(778, 1, 6, 1, '10x10x4.5 Cake box (10x10x4.5 Cake box)', 'ea', '21.22', '0.01', '0.00%', '21.22', '0', '0.00%', '2020-03-20 01:05:08'),
(779, 1, 6, 1, '10x10x4.5 Tri-Circle Box (10x10x4.5 Tri-Circle Box)', 'ea', '19.5', '0', '0.00%', '195', '0', '0.00%', '2020-03-20 01:05:08'),
(780, 1, 6, 1, '10x10x5 Cake Box (10x10x5 Cake Box)', 'ea', '23.02', '4166.63', '0.25%', '26', '4706', '0.28%', '2020-03-20 01:05:08'),
(781, 1, 6, 1, '10x14 ( Silver ) Board (10x14 ( Silver ) Board)', 'ea', '20', '500', '0.03%', '20', '500', '0.03%', '2020-03-20 01:05:08'),
(782, 1, 6, 1, '10x14 Base (10x14 Base)', 'ea', '19', '0', '0.00%', '19', '0', '0.00%', '2020-03-20 01:05:08'),
(783, 1, 6, 1, '10X14 board decorated (10X14 board decorated)', 'ea', '22', '0', '0.00%', '22', '0', '0.00%', '2020-03-20 01:05:08'),
(784, 1, 6, 1, '10X14 board thick (10X14 board thick)', 'ea', '8.5', '0', '0.00%', '8.5', '0', '0.00%', '2020-03-20 01:05:08'),
(785, 1, 6, 1, '10x14 White Cake Board (10x14 White Cake Board)', 'ea', '16', '720', '0.04%', '17.38', '782.1', '0.05%', '2020-03-20 01:05:08'),
(786, 1, 6, 1, '10x14x5 box red (10x14x5 box red)', 'ea', '27', '0', '0.00%', '27', '0', '0.00%', '2020-03-20 01:05:08'),
(787, 1, 6, 1, '10X14X5 Cake Box ( Red) (10X14X5 Cake Box ( Red))', 'ea', '27', '1782', '0.11%', '27', '1782', '0.10%', '2020-03-20 01:05:08'),
(788, 1, 6, 1, '12 oz QTC Hot Heads (12 oz QTC Hot Heads)', 'ea', '2.75', '0', '0.00%', '2.75', '0', '0.00%', '2020-03-20 01:05:08'),
(789, 1, 6, 1, '1202 Apple cup w/lid (1202 Apple cup w/lid)', 'ea', '9.14', '0', '0.00%', '10.05', '0', '0.00%', '2020-03-20 01:05:08'),
(790, 1, 6, 1, '1202 Plastic Cup w/ lid (1202 Plastic Cup w/ lid)', 'ea', '4.84', '0', '0.00%', '4.9', '0', '0.00%', '2020-03-20 01:05:08'),
(791, 1, 6, 1, '1202 Rippled Cup (1202 Rippled Cup)', 'ea', '10.05', '0', '0.00%', '10.05', '0', '0.00%', '2020-03-20 01:05:08'),
(792, 1, 6, 1, '12oz Dome Cup w/Lid (12oz Dome Cup w/Lid)', 'ea', '5.1', '0', '0.00%', '5.1', '0', '0.00%', '2020-03-20 01:05:08'),
(793, 1, 6, 1, '12oz QTC Hot Cup Ripple (12oz QTC Hot Cup Ripple)', 'ea', '8.75', '0', '0.00%', '8.75', '0', '0.00%', '2020-03-20 01:05:08'),
(794, 1, 6, 1, '12X12X2 styro (12X12X2 styro)', 'ea', '120', '0', '0.00%', '120', '0', '0.00%', '2020-03-20 01:05:08'),
(795, 1, 6, 1, '14x14 board thin (14x14 board thin)', 'ea', '13.07', '0', '0.00%', '13.07', '0', '0.00%', '2020-03-20 01:05:08'),
(796, 1, 6, 1, '14x14 cake board (white) (14x14 cake board (white))', 'ea', '32.99', '1022.67', '0.06%', '33', '1023', '0.06%', '2020-03-20 01:05:08'),
(797, 1, 6, 1, '14x14 White Square Board (14x14 White Square Board)', 'ea', '26.1', '0', '0.00%', '26.1', '0', '0.00%', '2020-03-20 01:05:08'),
(798, 1, 6, 1, '14x14x5 cake box red (14x14x5 cake box red)', 'ea', '36', '1404', '0.08%', '37', '1443', '0.09%', '2020-03-20 01:05:08'),
(799, 1, 6, 1, '14x18 cakeboard (14x18 cakeboard  )', 'ea', '38.9', '1322.5', '0.08%', '38.28', '1301.52', '0.08%', '2020-03-20 01:05:08'),
(800, 1, 6, 1, '14x18x5 (red ) box (14x18x5 (red ) box)', 'ea', '38.62', '772.31', '0.05%', '39', '780', '0.05%', '2020-03-20 01:05:08'),
(801, 1, 6, 1, '3.50z Cups w/design & lid (3.50z Cups w/design & lid)', 'Pck', '44.35', '0', '0.00%', '44.35', '0', '0.00%', '2020-03-20 01:05:08'),
(802, 1, 6, 1, '3.50z Cups w/design & lid-pcs (3.50z Cups w/design & lid - pcs)', 'ea', '2.88', '0', '0.00%', '2.88', '0', '0.00%', '2020-03-20 01:05:08'),
(803, 1, 6, 1, '3X16 Plastic Bag 100s (3X16 Plastic Bag 100s)', 'Pck', '29.7', '0', '0.00%', '29.7', '0', '0.00%', '2020-03-20 01:05:08'),
(804, 1, 6, 1, '4 diameter round board-gold (4 diameter round board-gold  )', 'ea', '4.25', '68', '0.00%', '4.25', '68', '0.00%', '2020-03-20 01:05:08'),
(805, 1, 6, 1, '7R Cake Box Silver (7R Cake Box Silver)', 'ea', '10.5', '0', '0.00%', '10.5', '0', '0.00%', '2020-03-20 01:05:08'),
(806, 1, 6, 1, '7x14 Plastic Bag (7x14 Plastic Bag)', 'Pck', '25.61', '435.4', '0.03%', '32.45', '551.65', '0.03%', '2020-03-20 01:05:08'),
(807, 1, 6, 1, '7x7x4 Cake Box (7x7x4 Cake Box)', 'ea', '17.25', '0', '0.00%', '23', '0', '0.00%', '2020-03-20 01:05:08'),
(808, 1, 6, 1, '8 Diameter Round Board (8 Diameter Round Board)', 'ea', '11', '0', '0.00%', '11', '0', '0.00%', '2020-03-20 01:05:08'),
(809, 1, 6, 1, '880CC Paper Lunch Box Med. (880CC Paper Lunch Box Med.)', 'ea', '10.25', '943', '0.06%', '10.25', '943', '0.06%', '2020-03-20 01:05:08'),
(810, 1, 6, 1, '8x8 Cake Box (8x8 Cake Box)', 'ea', '22', '0', '0.00%', '22', '0', '0.00%', '2020-03-20 01:05:08'),
(811, 1, 6, 1, '8X8X4 Christmas Box (8X8X4 Christmas Box)', 'ea', '20', '0', '0.00%', '20', '0', '0.00%', '2020-03-20 01:05:08'),
(812, 1, 6, 1, '9\'s Board Silver (9\'s Board Silver)', 'ea', '13', '0', '0.00%', '13', '0', '0.00%', '2020-03-20 01:05:08'),
(813, 1, 6, 1, '9x9x4 Red Box (9x9x4 Red Box)', 'ea', '18.23', '0', '0.00%', '20', '0', '0.00%', '2020-03-20 01:05:08'),
(814, 1, 6, 1, 'Baking cups-2 oz (Baking cups-2 oz  )', 'ea', '0.3', '0', '0.00%', '0.4', '0', '0.00%', '2020-03-20 01:05:08'),
(815, 1, 6, 1, 'Baking cups-3 oz ( 200 pcs/pck) (Baking cups-3 oz ( 200 pcs/pck)  )', 'ea', '0.89', '1683.88', '0.10%', '0.25', '473', '0.03%', '2020-03-20 01:05:08'),
(816, 1, 6, 1, 'C-302 Burger Box Clear (C-302 Burger Box Clear)', 'ea', '7', '8470', '0.50%', '7', '8470', '0.50%', '2020-03-20 01:05:08'),
(817, 1, 6, 1, 'CBJ Cellophane (CBJ Cellophane)', 'ea', '1.38', '0', '0.00%', '1.37', '0', '0.00%', '2020-03-20 01:05:08'),
(818, 1, 6, 1, 'CBL Cellophane (CBL Cellophane)', 'ea', '1.1', '0', '0.00%', '1.1', '0', '0.00%', '2020-03-20 01:05:08'),
(819, 1, 6, 1, 'Cellophane 1x10 (Cellophane 1x10)', 'Pck', '7.15', '71.5', '0.00%', '7.15', '71.5', '0.00%', '2020-03-20 01:05:08'),
(820, 1, 6, 1, 'Cellophane 8x14 (Cellophane 8x14)', 'Pck', '14.15', '0', '0.00%', '16.9', '0', '0.00%', '2020-03-20 01:05:08'),
(821, 1, 6, 1, 'ChipBoard (ChipBoard)', 'ea', '19', '190', '0.01%', '19', '190', '0.01%', '2020-03-20 01:05:08'),
(822, 1, 6, 1, 'Clam Shell - Take Out Box (Clam Shell - Take Out Box)', 'ea', '7.44', '2232', '0.13%', '9', '2700', '0.16%', '2020-03-20 01:05:08'),
(823, 1, 6, 1, 'Clamshell (Clamshell)', 'ea', '8.33', '0', '0.00%', '9', '0', '0.00%', '2020-03-20 01:05:08'),
(824, 1, 6, 1, 'Cody Detpak Lids 80z 6s (ody Detpak Lids 80z 6s)', 'ea', '2.32', '0', '0.00%', '2.32', '0', '0.00%', '2020-03-20 01:05:08'),
(825, 1, 6, 1, 'Coffee Cup Cover 10s (Coffee Cup Cover 10s)', 'ea', '1.5', '0', '0.00%', '1.5', '0', '0.00%', '2020-03-20 01:05:08'),
(826, 1, 6, 1, 'Coffee cups-12ozx100 pcs/bag (Coffee cups-12ozx100 pcs/bag  )', 'ea', '9.9', '1920.6', '0.11%', '9.8', '1901.2', '0.11%', '2020-03-20 01:05:08'),
(827, 1, 6, 1, 'Cold drinks cups-12 ozx 100 pcs (Cold drinks cups-12 ozx 100 pcs/bag  )', 'ea', '6.53', '0', '0.00%', '6.53', '0', '0.00%', '2020-03-20 01:05:08'),
(828, 1, 6, 1, 'Croco ClingWrap 12x500m (Croco ClingWrap 12x500m)', 'Roll', '485', '0', '0.00%', '485', '0', '0.00%', '2020-03-20 01:05:08'),
(829, 1, 6, 1, 'Croco Foofdwrap 18x 500m (Croco Foofdwrap 18x 500m)', 'Roll', '680', '0', '0.00%', '680', '0', '0.00%', '2020-03-20 01:05:08'),
(830, 1, 6, 1, 'Croco Wax Paper 150M (Croco Wax Paper 150M)', 'Roll', '450', '1858.51', '0.11%', '525', '2168.25', '0.13%', '2020-03-20 01:05:08'),
(831, 1, 6, 1, 'Dome Lid (Dome Lid)', 'ea', '2.2', '0', '0.00%', '2.2', '0', '0.00%', '2020-03-20 01:05:08'),
(832, 1, 6, 1, 'Dome Plastic Cup (Dome Plastic Cup)', 'ea', '2.49', '0', '0.00%', '2.49', '0', '0.00%', '2020-03-20 01:05:08'),
(833, 1, 6, 1, 'French Bread window (Plain) (French Bread window (Plain))', 'ea', '5.4', '8635.06', '0.51%', '5.45', '8720', '0.51%', '2020-03-20 01:05:08'),
(834, 1, 6, 1, 'Glassine (Glassine)', 'ea', '1.57', '50.27', '0.00%', '1.5', '48', '0.00%', '2020-03-20 01:05:08'),
(835, 1, 6, 1, 'Golden Wire Twist ( Big) (Golden Wire Twist ( Big))', 'Roll', '75', '3000', '0.18%', '75', '3000', '0.18%', '2020-03-20 01:05:08'),
(836, 1, 6, 1, 'Healthy bread cellophane (Healthy bread cellophane  )', 'ea', '1.2', '3610.8', '0.21%', '1.2', '3610.8', '0.21%', '2020-03-20 01:05:08'),
(837, 1, 6, 1, 'Hopia Box (Hopia Box (10\'s/pack) 5x6 9/4 1/2)', 'ea', '6.5', '0', '0.00%', '6.5', '0', '0.00%', '2020-03-20 01:05:08'),
(838, 1, 6, 1, 'Jellycup (Jellycup)', 'ea', '13', '0', '0.00%', '13', '0', '0.00%', '2020-03-20 01:05:08'),
(839, 1, 6, 1, 'Jellyroll box (Jellyroll box)', 'ea', '21', '0', '0.00%', '21', '0', '0.00%', '2020-03-20 01:05:08'),
(840, 1, 6, 1, 'Jellyroll w/ handle (Jellyroll w/ handle)', 'ea', '21', '0', '0.00%', '21', '0', '0.00%', '2020-03-20 01:05:08'),
(841, 1, 6, 1, 'Klear Kake Band 2.5 (Klear Kake Band 2.5)', 'Box', '2000', '0', '0.00%', '2000', '0', '0.00%', '2020-03-20 01:05:08'),
(842, 1, 6, 1, 'Luch Box Silver (Luch Box Silver)', 'ea', '5.45', '0', '0.00%', '5.45', '0', '0.00%', '2020-03-20 01:05:08'),
(843, 1, 6, 1, 'Matza Cellophane 7x11 bag (Matza Cellophane 7x11 bag)', 'ea', '2', '0', '0.00%', '2', '0', '0.00%', '2020-03-20 01:05:08'),
(844, 1, 6, 1, 'OPP cellophane with logo (OPP cellophane with logo  )', 'Kls', '229.8', '4044.51', '0.24%', '178.51', '3141.776', '0.18%', '2020-03-20 01:05:08'),
(845, 1, 6, 1, 'Paper Cup 12oz 10s (Paper Cup 12oz 10s)', 'ea', '8.29', '124.34', '0.01%', '7.25', '108.75', '0.01%', '2020-03-20 01:05:08'),
(846, 1, 6, 1, 'Pet Bottles (Triwall Pet Bottles)', 'ea', '9.71', '1097.15', '0.07%', '9.55', '1079.15', '0.06%', '2020-03-20 01:05:08'),
(847, 1, 6, 1, 'Plain Loaf bread (Plain Loaf bread)', 'ea', '0.9', '0', '0.00%', '0.9', '0', '0.00%', '2020-03-20 01:05:08'),
(848, 1, 6, 1, 'Plastic Cup 10oz 100s (Plastic Cup 10oz 100s)', 'ea', '0.66', '0', '0.00%', '0.65625', '0', '0.00%', '2020-03-20 01:05:08'),
(849, 1, 6, 1, 'Popeye Cup 3.50z 25s (Popeye Cup 3.50z 25s)', 'ea', '2.16', '53.95', '0.00%', '2.18', '54.5', '0.00%', '2020-03-20 01:05:08'),
(850, 1, 6, 1, 'Precut napkin 2000s (Precut napkin 2000s)', 'ea', '0.19', '0', '0.00%', '0.1875', '0', '0.00%', '2020-03-20 01:05:08'),
(851, 1, 6, 1, 'Round Cake Board (Round Cake Board)', 'ea', '12', '0', '0.00%', '13', '0', '0.00%', '2020-03-20 01:05:08'),
(852, 1, 6, 1, 'Sando Bag Large (Sando Bag Large)', 'ea', '1.8', '17159.39', '1.02%', '1.8', '17159.4', '1.01%', '2020-03-20 01:05:08'),
(853, 1, 6, 1, 'Sando Bag Medium (Sando Bag Medium)', 'ea', '1.3', '29542.13', '1.75%', '1.3', '29542.5', '1.73%', '2020-03-20 01:05:08'),
(854, 1, 6, 1, 'Sando Bag Medium (4 u) 100s (ando Bag Medium (4 u) 100s)', 'ea', '0.5', '0', '0.00%', '0.5', '0', '0.00%', '2020-03-20 01:05:08'),
(855, 1, 6, 1, 'Sando Bag Mini (4 u) 100s (Sando Bag Mini (4 u) 100s)', 'ea', '0.23', '0', '0.00%', '0.23', '0', '0.00%', '2020-03-20 01:05:08'),
(856, 1, 6, 1, 'Sando Bag Tiny (Sando Bag Tiny)', 'ea', '0.55', '13331.51', '0.79%', '0.68', '16624.64', '0.97%', '2020-03-20 01:05:08'),
(857, 1, 6, 1, 'Sando Bag Tiny 100s (4 u) (Sando Bag Tiny 100s (4 u))', 'ea', '0.28', '0', '0.00%', '0.28', '0', '0.00%', '2020-03-20 01:05:08'),
(858, 1, 6, 1, 'Supot # 10 (Supot # 10 ( 2000pcs))', 'ea', '0.85', '1695', '0.10%', '0.8475', '1695', '0.10%', '2020-03-20 01:05:08'),
(859, 1, 6, 1, 'Supot # 4 (4000pcs) (Supot # 4 (4000pcs))', 'ea', '0.49', '1950', '0.12%', '0.4875', '1950', '0.11%', '2020-03-20 01:05:08'),
(860, 1, 6, 1, 'Supot # 5 3000s (Supot # 5 3000s)', 'ea', '0.64', '5444.12', '0.32%', '0.5', '4250', '0.25%', '2020-03-20 01:05:08'),
(861, 1, 6, 1, 'Supot #3 (Supot #3 (5000pcs/bundle))', 'ea', '0.4', '7147.69', '0.42%', '0.4012', '7147.7792', '0.42%', '2020-03-20 01:05:08'),
(862, 1, 6, 1, 'Supot #6 (Supot #6 3000pcs/bundle)', 'ea', '0.76', '6813', '0.41%', '0.757', '6813', '0.40%', '2020-03-20 01:05:08'),
(863, 1, 6, 1, 'Supot #8 (Supot #8 ( 2000pcs/bundle))', 'ea', '0.88', '9406.65', '0.56%', '0.884', '9406.644', '0.55%', '2020-03-20 01:05:08'),
(864, 1, 6, 1, 'Supot#2 (Supot#2)', 'ea', '0.36', '10257.48', '0.61%', '0.36', '10257.48', '0.60%', '2020-03-20 01:05:08'),
(865, 1, 6, 1, 'Take-out box -cake Single (Take-out box -cake Single(menros))', 'ea', '7.93', '0', '0.00%', '7.93', '0', '0.00%', '2020-03-20 01:05:08'),
(866, 1, 6, 1, 'Take Out bowl 5 pcs/pck (Take Out bowl 5 pcs/pck)', 'ea', '4.39', '0', '0.00%', '4.39', '0', '0.00%', '2020-03-20 01:05:08'),
(867, 1, 6, 1, 'Take Out bowl Small 5 pcs/pck (Take Out bowl Small 5 pcs/pck)', 'ea', '1.14', '27.36', '0.00%', '1.14', '27.36', '0.00%', '2020-03-20 01:05:08'),
(868, 1, 6, 1, 'Take out box ( silver) (Take out box ( silver))', 'ea', '5', '0', '0.00%', '5', '0', '0.00%', '2020-03-20 01:05:08'),
(869, 1, 6, 1, 'Take out boxes medium (Take out boxes medium)', 'ea', '9.2', '0', '0.00%', '9.75', '0', '0.00%', '2020-03-20 01:05:08'),
(870, 1, 6, 1, 'Take Out Sauce Boat (Take Out Sauce Boat (100pcs/pck))', 'ea', '0.59', '0', '0.00%', '0.59', '0', '0.00%', '2020-03-20 01:05:08'),
(871, 1, 6, 1, 'Toasted Siopao Box (Toasted Siopao Box)', 'ea', '14', '14', '0.00%', '14', '14', '0.00%', '2020-03-20 01:05:08'),
(872, 1, 6, 1, 'Waxpaper (Waxpaper  )', 'Roll', '143.88', '0', '0.00%', '66', '0', '0.00%', '2020-03-20 01:05:08'),
(873, 1, 6, 1, 'Wire Twist ( Small Roll) (Wire Twist ( Small Roll))', 'Roll', '50', '8600', '0.51%', '50', '8600', '0.50%', '2020-03-20 01:05:08'),
(874, 1, 7, 1, 'Alsacian (Alsacian)', 'Portion', '383.38', '1533.52', '0.09%', '390.53', '1562.12', '0.09%', '2020-03-20 01:09:27'),
(875, 1, 7, 1, 'Beef tapa (Beef tapa  )', 'Portion', '40.87', '490.44', '0.03%', '40.87', '490.44', '0.03%', '2020-03-20 01:09:27'),
(876, 1, 7, 1, 'Beef tocino (Beef Tocino  )', 'Portion', '23.99', '431.78', '0.03%', '23.99', '431.82', '0.03%', '2020-03-20 01:09:27'),
(877, 1, 7, 1, 'Bolognaise Sauce (Bolognaise Sauce)', 'Portion', '22.13', '1261.13', '0.08%', '22.13', '1261.41', '0.07%', '2020-03-20 01:09:27'),
(878, 1, 7, 1, 'Brown sauce - 50 gms (Brown sauce - 50 gms  )', 'Portion', '4.57', '31.99', '0.00%', '4.84', '33.88', '0.00%', '2020-03-20 01:09:27'),
(879, 1, 7, 1, 'Bulalo (Bulalo  )', 'Portion', '198.94', '795.76', '0.05%', '198.94', '795.76', '0.05%', '2020-03-20 01:09:27'),
(880, 1, 7, 1, 'Chicken Adobo (Chicken Adobo)', 'Portion', '12.17', '352.93', '0.02%', '12.17', '352.93', '0.02%', '2020-03-20 01:09:27'),
(881, 1, 7, 1, 'Chicken Ala King (Chicken Ala King)', 'ea', '109.8', '-1207.8', '-0.07%', '109.8', '-1207.8', '-0.07%', '2020-03-20 01:09:27'),
(882, 1, 7, 1, 'Chicken Tandori (Chicken Tandori  )', 'Portion', '50.72', '0', '0.00%', '51.04', '0', '0.00%', '2020-03-20 01:09:27'),
(883, 1, 7, 1, 'Chicken Teriyaki (Chicken Teriyaki)', 'Portion', '22.55', '0', '0.00%', '22.55', '0', '0.00%', '2020-03-20 01:09:27'),
(884, 1, 7, 1, 'Chicken Tocino (Chicken Tocino  )', 'Portion', '27.95', '586.88', '0.04%', '28.02', '588.42', '0.03%', '2020-03-20 01:09:27'),
(885, 1, 7, 1, 'Chicken Wings (Chicken Wings  )', 'Portion', '26.84', '322.02', '0.02%', '26.83', '321.96', '0.02%', '2020-03-20 01:09:27'),
(886, 1, 7, 1, 'Curry meat (Curry meat  )', 'Portion', '41.31', '1445.85', '0.09%', '41.31', '1445.85', '0.09%', '2020-03-20 01:09:27'),
(887, 1, 7, 1, 'Curry Sauce (80gms/protion) (Curry Sauce (80gms/protion))', 'Portion', '11.4', '171', '0.01%', '11.4', '171', '0.01%', '2020-03-20 01:09:27'),
(888, 1, 7, 1, 'Dory fish fillet - 100 gms (Dory fish fillet - 100 gms  )', 'Portion', '33.76', '641.53', '0.04%', '33.77', '641.63', '0.04%', '2020-03-20 01:09:27'),
(889, 1, 7, 1, 'Fettucinni pasta-San Remo - por (Fettucinni pasta-San Remo - portions  130 gms  )', 'Portion', '8.76', '96.36', '0.01%', '8.76', '96.36', '0.01%', '2020-03-20 01:09:27'),
(890, 1, 7, 1, 'Garlicky (Garlicky)', 'ea', '0', '0', '0.00%', '108.18', '0', '0.00%', '2020-03-20 01:09:27'),
(891, 1, 7, 1, 'Gideon chicken (Gideon chicken  )', 'Portion', '55.39', '2215.6', '0.13%', '55.39', '2215.6', '0.13%', '2020-03-20 01:09:27'),
(892, 1, 7, 1, 'Grilled hickory ribs-250 gms (Grilled hickory ribs-250 gms  )', 'Portion', '153.8', '0', '0.00%', '153.8', '0', '0.00%', '2020-03-20 01:09:27'),
(893, 1, 7, 1, 'Malasugue (Malasugue  )', 'Portion', '48', '0', '0.00%', '48', '0', '0.00%', '2020-03-20 01:09:27'),
(894, 1, 7, 1, 'Mango chutney  30 gms (Mango chutney  30 gms  )', 'Portion', '15.11', '846.05', '0.05%', '15.11', '846.16', '0.05%', '2020-03-20 01:09:27'),
(895, 1, 7, 1, 'Meat Bread Filling(5kls) (Meat Bread Filling(5kls))', 'Portion', '2376.5', '0', '0.00%', '2376.47', '0', '0.00%', '2020-03-20 01:09:27'),
(896, 1, 7, 1, 'Napolitana sauce-  50 gms (Napolitana sauce-  50 gms  )', 'Portion', '6.09', '334.95', '0.02%', '6.09', '334.95', '0.02%', '2020-03-20 01:09:27'),
(897, 1, 7, 1, 'Onion soup (Onion soup  )', 'Portion', '34.45', '723.45', '0.04%', '34.45', '723.45', '0.04%', '2020-03-20 01:09:27'),
(898, 1, 7, 1, 'palabok Sauce (palabok Sauce)', 'ea', '14.38', '445.78', '0.03%', '14.38', '445.78', '0.03%', '2020-03-20 01:09:27'),
(899, 1, 7, 1, 'Pastel (Pastel)', 'ea', '106.11', '955', '0.06%', '106.11', '954.99', '0.06%', '2020-03-20 01:09:27'),
(900, 1, 7, 1, 'Pattie big (Pattie big  )', 'Portion', '45.59', '0', '0.00%', '71.23', '0', '0.00%', '2020-03-20 01:09:27'),
(901, 1, 7, 1, 'Pattie small (Pattie small  )', 'Portion', '34.98', '3498', '0.21%', '54.65', '5465', '0.32%', '2020-03-20 01:09:27'),
(902, 1, 7, 1, 'Poached chicken (Poached chicken  )', 'Portion', '31.6', '1453.6', '0.09%', '31.6', '1453.6', '0.09%', '2020-03-20 01:09:27'),
(903, 1, 7, 1, 'Pork chop - 120 gms (Pork chop - 120 gms  )', 'Portion', '40.42', '687.21', '0.04%', '40.42', '687.14', '0.04%', '2020-03-20 01:09:27'),
(904, 1, 7, 1, 'Pork crackling (Pork crackling  )', 'Portion', '123.31', '0', '0.00%', '123.31', '0', '0.00%', '2020-03-20 01:09:27'),
(905, 1, 7, 1, 'Pork humba (Pork humba)', 'ea', '21.91', '0', '0.00%', '21.91', '0', '0.00%', '2020-03-20 01:09:27'),
(906, 1, 7, 1, 'Pork Ribs (Pork Ribs)', 'ea', '153.8', '1076.6', '0.06%', '153.8', '1076.6', '0.06%', '2020-03-20 01:09:27'),
(907, 1, 7, 1, 'Pork tapa (Pork tapa  )', 'Portion', '18.51', '148.05', '0.01%', '20.06', '160.48', '0.01%', '2020-03-20 01:09:27'),
(908, 1, 7, 1, 'Pork Tocino (Pork Tocino  )', 'Portion', '23.4', '280.76', '0.02%', '23.4', '280.8', '0.02%', '2020-03-20 01:09:27'),
(909, 1, 7, 1, 'Pumpkin soup (Pumpkin soup  )', 'Portion', '20.46', '163.68', '0.01%', '20.46', '163.68', '0.01%', '2020-03-20 01:09:27'),
(910, 1, 7, 1, 'Rib eye (Rib eye)', 'ea', '159.19', '1751.09', '0.10%', '159.19', '1751.09', '0.10%', '2020-03-20 01:09:27'),
(911, 1, 7, 1, 'Seafoods- 20 gms/ portion (Seafoods- 20 gms/ portion  )', 'Portion', '11.1', '166.5', '0.01%', '11.1', '166.5', '0.01%', '2020-03-20 01:09:27'),
(912, 1, 7, 1, 'Sesame chicken fillet (Sesame chicken fillet  )', 'Portion', '9.28', '603.2', '0.04%', '9.28', '603.2', '0.04%', '2020-03-20 01:09:27'),
(913, 1, 7, 1, 'Shrimps (Shrimps  ) - 20 gms (Shrimps (Shrimps  ) - 20 gms  )', 'Portion', '0.24', '0', '0.00%', '0.24', '0', '0.00%', '2020-03-20 01:09:27'),
(914, 1, 7, 1, 'Smoked Farmer\'s ham - 40 gms (Smoked Farmer\'s ham - 40 gms  )', 'Portion', '12.46', '647.72', '0.04%', '12.46', '647.92', '0.04%', '2020-03-20 01:09:27'),
(915, 1, 7, 1, 'Spaghetti pasta-Royal -portions (Spaghetti pasta-Royal -portions  )', 'Portion', '10.43', '177.31', '0.01%', '10.43', '177.31', '0.01%', '2020-03-20 01:09:27'),
(916, 1, 7, 1, 'Teriyaki Sauce - portion (Teriyaki Sauce)', 'Portion', '57.63', '0', '0.00%', '57.63', '0', '0.00%', '2020-03-20 01:09:27'),
(917, 1, 7, 1, 'Tomato soup (Tomato soup  )', 'Portion', '23.02', '276.24', '0.02%', '23.02', '276.24', '0.02%', '2020-03-20 01:09:27'),
(918, 1, 8, 1, 'Banana Muffins - MIX (Banana Muffins - MIX)', 'MIX', '328.9', '27956.5', '1.66%', '328.9', '27956.5', '1.64%', '2020-03-20 01:12:16'),
(919, 1, 8, 1, 'Buko Bibingka Mix (Buko Bibingka Mix)', 'MIX', '173.09', '14539.56', '0.86%', '173.09', '14539.56', '0.85%', '2020-03-20 01:12:16'),
(920, 1, 8, 1, 'Cheese filling Kls (Cheese filling Kls)', 'Kls', '72.71', '527.18', '0.03%', '96.64', '700.64', '0.04%', '2020-03-20 01:12:16'),
(921, 1, 8, 1, 'Cheese filling MIX - 8kls/mix (Cheese filling MIX - 8kls/mix)', 'MIX', '798.24', '6385.92', '0.38%', '798.24', '6385.92', '0.37%', '2020-03-20 01:12:16'),
(922, 1, 8, 1, 'CheeseLoaf kls (CheeseLoaf kls)', 'Kls', '75.42', '10095.72', '0.60%', '75.42', '10095.7212', '0.59%', '2020-03-20 01:12:16'),
(923, 1, 8, 1, 'Choco Filling kls (Choco Filling kls)', 'Kls', '228.97', '4167.25', '0.25%', '228.97', '4167.254', '0.24%', '2020-03-20 01:12:16'),
(924, 1, 8, 1, 'Choco Lanay Filling (Choco Lanay Filling)', 'Kls', '150.46', '917.82', '0.05%', '83.5', '509.35', '0.03%', '2020-03-20 01:12:16'),
(925, 1, 8, 1, 'Ciabatta (Ciabatta(Per Mix))', 'MIX', '53.62', '0', '0.00%', '53.62', '0', '0.00%', '2020-03-20 01:12:16'),
(926, 1, 8, 1, 'Cinnamon Filling Mix (Cinnamon Filling Mix)', 'MIX', '557.51', '10826.84', '0.64%', '557.51', '10826.8442', '0.63%', '2020-03-20 01:12:16'),
(927, 1, 8, 1, 'Cinnamon with Sugar Filling (Cinnamon with Sugar Filling)', 'Kls', '57.26', '37.22', '0.00%', '57.3', '37.25', '0.00%', '2020-03-20 01:12:16'),
(928, 1, 8, 1, 'Coco Fruit -Mix (Coco Fruit -Mix)', 'MIX', '550.37', '550.37', '0.03%', '550.37', '550.37', '0.03%', '2020-03-20 01:12:16'),
(929, 1, 8, 1, 'Coco Fruit Filling -kls (Coco Fruit Filling -kls)', 'Kls', '103.09', '231.95', '0.01%', '103.09', '231.95', '0.01%', '2020-03-20 01:12:16'),
(930, 1, 8, 1, 'Coco Fruit Filling Mix (Coco Fruit Filling Mix)', 'MIX', '550.37', '3302.22', '0.20%', '550.37', '3302.22', '0.19%', '2020-03-20 01:12:16'),
(931, 1, 8, 1, 'Dark European (Dark European(kls))', 'Kls', '97.52', '1852.88', '0.11%', '97.52', '1852.88', '0.11%', '2020-03-20 01:12:16'),
(932, 1, 8, 1, 'Ensaymada kls (Ensaymada kls)', 'Kls', '95.59', '11088.44', '0.66%', '95.59', '11088.44', '0.65%', '2020-03-20 01:12:16'),
(933, 1, 8, 1, 'Fino pandesal Kls (Fino pandesal Kls)', 'Kls', '75.92', '11008.4', '0.65%', '75.92', '11008.4', '0.65%', '2020-03-20 01:12:16'),
(934, 1, 8, 1, 'French Bread plain-kls (French Bread plain-kls)', 'Kls', '72.12', '10457.4', '0.62%', '72.12', '10457.4', '0.61%', '2020-03-20 01:12:16'),
(935, 1, 8, 1, 'Frenchbread W.wheat kls (Frenchbread W.wheat kls)', 'Kls', '76.57', '11102.65', '0.66%', '76.57', '11102.65', '0.65%', '2020-03-20 01:12:16'),
(936, 1, 8, 1, 'Fruit John Kls (Fruit John Kls)', 'Kls', '110.04', '0', '0.00%', '110.04', '0', '0.00%', '2020-03-20 01:12:16'),
(937, 1, 8, 1, 'Marjorie filling MIX (Marjorie filling MIX)', 'MIX', '223.64', '0', '0.00%', '223.64', '0', '0.00%', '2020-03-20 01:12:16'),
(938, 1, 8, 1, 'Monay premix - kls (Monay premix - kls)', 'Kls', '66.97', '802.3', '0.05%', '66.97', '802.3', '0.05%', '2020-03-20 01:12:16'),
(939, 1, 8, 1, 'Pilipit premix (Pilipit premix)', 'Kls', '70.93', '41139.4', '2.44%', '70.93', '41139.4', '2.41%', '2020-03-20 01:12:16'),
(940, 1, 8, 1, 'Putok premix (Putok premix)', 'Kls', '76.64', '8731.6', '0.52%', '76.64', '8731.5952', '0.51%', '2020-03-20 01:12:16'),
(941, 1, 8, 1, 'Strussels- mix (Strussels- mix)', 'MIX', '179.92', '46.78', '0.00%', '179.93', '46.78', '0.00%', '2020-03-20 01:12:16'),
(942, 1, 8, 1, 'Sweetdough (Sweetdough)', 'Kls', '59.61', '660.53', '0.04%', '59.62', '660.59', '0.04%', '2020-03-20 01:12:16'),
(943, 1, 8, 1, 'Taipan Filling (Taipan Filling)', 'MIX', '174.79', '445.71', '0.03%', '174.79', '445.71', '0.03%', '2020-03-20 01:12:16'),
(944, 1, 8, 1, 'Whole wheat premix (Whole wheat premix)', 'Kls', '63.11', '10981.14', '0.65%', '63.11', '10981.14', '0.64%', '2020-03-20 01:12:16'),
(945, 1, 9, 1, 'Alaska Condensada Easy 300ml (Alaska Condensada Easy 300ml)', 'Can', '38.72', '0', '0.00%', '38.72', '0', '0.00%', '2020-03-20 01:15:17'),
(946, 1, 9, 1, 'Alaska Condensed Milk (Alaska Condensed Milk 300ml/can)', 'Can', '54.3', '12000.79', '0.71%', '53.47', '11816.87', '0.69%', '2020-03-20 01:15:17'),
(947, 1, 9, 1, 'Alaska Condensed Milk 380g (Alaska Condensed Milk 380g)', 'Can', '46.51', '0', '0.00%', '46.51', '0', '0.00%', '2020-03-20 01:15:17'),
(948, 1, 9, 1, 'All purpose Cream (All purpose Cream 	250g X 24 pac)', 'Pck', '55.15', '9321.03', '0.55%', '55.13992', '9318.65', '0.55%', '2020-03-20 01:15:17'),
(949, 1, 9, 1, 'All Purpose Flour (All Purpose Flour 25kg / sack)', 'grms', '0.04', '4697.32', '0.28%', '0.038', '4696.8', '0.28%', '2020-03-20 01:15:17'),
(950, 1, 9, 1, 'Arla Cream Cheese (Arla Cream Cheese 1.8kg x 3/case)', 'grms', '0.5', '0', '0.00%', '0.5', '0', '0.00%', '2020-03-20 01:15:17'),
(951, 1, 9, 1, 'Baguette Flour (Baguette Flour Baguette Flour 10kg/case)', 'grms', '0', '0', '0.00%', '0.24', '0', '0.00%', '2020-03-20 01:15:17'),
(952, 1, 9, 1, 'Baking Powder (Baking Powder)', 'grms', '0.11', '1907.31', '0.11%', '0.118', '2006', '0.12%', '2020-03-20 01:15:17'),
(953, 1, 9, 1, 'Baking Soda (Baking Soda)', 'grms', '0.04', '23.68', '0.00%', '0.05', '33', '0.00%', '2020-03-20 01:15:17'),
(954, 1, 9, 1, 'Banana Fresh (Banana Fresh)', 'grms', '0.04', '21845.43', '1.30%', '0.035', '20811.7', '1.22%', '2020-03-20 01:15:17'),
(955, 1, 9, 1, 'Bread crumbs (Bread crumbs  )', 'grms', '0.06', '9208.37', '0.55%', '0.05', '7588.9', '0.45%', '2020-03-20 01:15:17'),
(956, 1, 9, 1, 'Bread Improver (Bread Improver)', 'grms', '0.08', '1876.83', '0.11%', '0.07685', '1876.68', '0.11%', '2020-03-20 01:15:17'),
(957, 1, 9, 1, 'Brown Paper (Brown Paper 500pcs/bundle)', 'ea', '1.67', '0', '0.00%', '2.66', '0', '0.00%', '2020-03-20 01:15:17'),
(958, 1, 9, 1, 'Buko meat (Buko meat  )', 'grms', '0.24', '0', '0.00%', '0.12', '0', '0.00%', '2020-03-20 01:15:17'),
(959, 1, 9, 1, 'Butter Oil Substitute (Butter Oil Substitute)', 'grms', '0.13', '11726', '0.70%', '0.13', '11726', '0.69%', '2020-03-20 01:15:17'),
(960, 1, 9, 1, 'Butter Unsalted  20KG (Butter Unsalted  20KG/CASE)', 'grms', '0.29', '0', '0.00%', '0.29', '0', '0.00%', '2020-03-20 01:15:17'),
(961, 1, 9, 1, 'Butter Unsalted 10KG (Butter Unsalted 10KG/CASE)', 'grms', '0.39', '0', '0.00%', '0.39', '0', '0.00%', '2020-03-20 01:15:17'),
(962, 1, 9, 1, 'Butter Unsalted 227g (Butter Unsalted 227g)', 'grms', '0.45', '4062.21', '0.24%', '0.44', '3960', '0.23%', '2020-03-20 01:15:17'),
(963, 1, 9, 1, 'Butter Unsalted 5kg (Butter Unsalted 5kg)', 'Kls', '496.28', '0', '0.00%', '503', '0', '0.00%', '2020-03-20 01:15:17'),
(964, 1, 9, 1, 'Buttercup 225g (Buttercup 225g/bar)', 'Bar', '40.1', '11443.53', '0.68%', '40.14583', '11458.02', '0.67%', '2020-03-20 01:15:17'),
(965, 1, 9, 1, 'ButterMilk 25g/sack (ButterMilk 25g/sack)', 'grms', '0.11', '0', '0.00%', '0.108', '0', '0.00%', '2020-03-20 01:15:17'),
(966, 1, 9, 1, 'Buuter Salted 5kgx4 (Buuter Salted 5kgx4)', 'Kls', '96.35', '0', '0.00%', '132.75', '0', '0.00%', '2020-03-20 01:15:17'),
(967, 1, 9, 1, 'Cake Flour (Cake Flour)', 'grms', '0.04', '4147.56', '0.25%', '0.038', '4134.4', '0.24%', '2020-03-20 01:15:17'),
(968, 1, 9, 1, 'Cake Improver 4kg/pail (Cake Improver 4kg/pail)', 'grms', '0.26', '0', '0.00%', '0.264', '0', '0.00%', '2020-03-20 01:15:17'),
(969, 1, 9, 1, 'Cems Honey Prime 1L (Cems Honey Prime 1L)', 'ML', '286.17', '4172.37', '0.25%', '266.15', '3880.47', '0.23%', '2020-03-20 01:15:17'),
(970, 1, 9, 1, 'Cherries with stem (1050 gms/bo (Cherries with stem (1050 gms/bot)  )', 'Bot', '0.82', '0', '0.00%', '0.78', '0', '0.00%', '2020-03-20 01:15:17'),
(971, 1, 9, 1, 'Chicharon (BAngkerohan) (Chicharon (BAngkerohan))', 'Pck', '100', '550', '0.03%', '100', '550', '0.03%', '2020-03-20 01:15:17'),
(972, 1, 9, 1, 'Chocolate fudge (Chocolate fudge)', 'grms', '0.24', '0', '0.00%', '0.24', '0', '0.00%', '2020-03-20 01:15:17'),
(973, 1, 9, 1, 'Chocolate Glazed (Chocolate Glazed 5000/Pail)', 'grms', '0.3', '27193.86', '1.62%', '0.30464', '27356.67', '1.60%', '2020-03-20 01:15:17'),
(974, 1, 9, 1, 'Chocolate Green (Chocolate Green)', 'ea', '110', '0', '0.00%', '132.5', '0', '0.00%', '2020-03-20 01:15:17'),
(975, 1, 9, 1, 'Chocolate Mix (Chocolate Mix)', 'grms', '0.17', '0', '0.00%', '0.162', '0', '0.00%', '2020-03-20 01:15:17'),
(976, 1, 9, 1, 'Chocolate Sprinkles (Chocolate Sprinkles)', 'grms', '0.35', '2917.25', '0.17%', '0.35', '2917.25', '0.17%', '2020-03-20 01:15:17'),
(977, 1, 9, 1, 'Chocolate White (Chocolate White  )', 'Kls', '224', '407.68', '0.02%', '239', '434.98', '0.03%', '2020-03-20 01:15:17'),
(978, 1, 9, 1, 'Cinnamon Powder 1KG/Pack (Cinnamon Powder 1KG/Pack)', 'grms', '0.35', '641.58', '0.04%', '0.28', '518', '0.03%', '2020-03-20 01:15:17'),
(979, 1, 9, 1, 'Cinnamon Powder 500g (Cinnamon Powder 500g/pack)', 'grms', '0.29', '0', '0.00%', '0.25', '0', '0.00%', '2020-03-20 01:15:17'),
(980, 1, 9, 1, 'Cocoa (Cocoa)', 'grms', '0.29', '23372.53', '1.39%', '0.304', '24624', '1.44%', '2020-03-20 01:15:17'),
(981, 1, 9, 1, 'Corn Oil (Corn Oil)', 'ML', '1.95', '0', '0.00%', '1.95', '0', '0.00%', '2020-03-20 01:15:17'),
(982, 1, 9, 1, 'Corn Oil 3L (Corn Oil 3L)', 'ML', '493.25', '0', '0.00%', '493.25', '0', '0.00%', '2020-03-20 01:15:17'),
(983, 1, 9, 1, 'Cornstarch (Cornstarch)', 'grms', '0.03', '60.92', '0.00%', '0.05', '93.25', '0.01%', '2020-03-20 01:15:17'),
(984, 1, 9, 1, 'Cream Cheese 1.361KG (Cream Cheese 1.361KG)', 'grms', '0.35', '14408.75', '0.86%', '0.39704', '16433.49', '0.96%', '2020-03-20 01:15:17'),
(985, 1, 9, 1, 'Cream Cheese 1KG (Cream Cheese 1KG)', 'grms', '0.47', '469.07', '0.03%', '0.42005', '420.05', '0.03%', '2020-03-20 01:15:17'),
(986, 1, 9, 1, 'Cream of tartar (Cream of tartar  )', 'Kls', '287.94', '547.08', '0.03%', '500', '950', '0.06%', '2020-03-20 01:15:17'),
(987, 1, 9, 1, 'Creamfill Vanilla 5kls/Pail (Creamfill Vanilla 5kls/Pail)', 'grms', '0.17', '47172.74', '2.80%', '0.177', '48825.45', '2.86%', '2020-03-20 01:15:17'),
(988, 1, 9, 1, 'Dahon ng Saging (Dahon ng Saging)', 'Bundle', '25', '-775', '-0.05%', '25', '-775', '-0.05%', '2020-03-20 01:15:17'),
(989, 1, 9, 1, 'Dark Chocolate 1kg (Dark Chocolate 1kg)', 'ea', '163', '0', '0.00%', '194', '0', '0.00%', '2020-03-20 01:15:17'),
(990, 1, 9, 1, 'Demi Glace (Demi Glace)', 'grms', '0.51', '1064.28', '0.06%', '0.5068', '1064.28', '0.06%', '2020-03-20 01:15:17'),
(991, 1, 9, 1, 'Dessicated Coconut (Dessicated Coconut)', 'grms', '0.15', '1620.27', '0.10%', '0.14', '1482.6', '0.09%', '2020-03-20 01:15:17'),
(992, 1, 9, 1, 'Dole Pineapple Crashed  439g/ca (Dole Pineapple Crashed  439g/can)', 'Can', '42.77', '0', '0.00%', '43.65', '0', '0.00%', '2020-03-20 01:15:17'),
(993, 1, 9, 1, 'Dole Pineapple crushed  567g / (Dole Pineapple crushed  567g/can)', 'Can', '52.75', '0', '0.00%', '52.75', '0', '0.00%', '2020-03-20 01:15:17'),
(994, 1, 9, 1, 'Dole Pineapple Crushed234g/227g (Dole Pineapple Crushed 234g/227g)', 'Can', '24.25', '5164.32', '0.31%', '25.5', '5431.5', '0.32%', '2020-03-20 01:15:17'),
(995, 1, 9, 1, 'Eden Original Filled Cheese 950 (Eden Original Filled Cheese 950)', 'Pck', '265', '0', '0.00%', '265', '0', '0.00%', '2020-03-20 01:15:17'),
(996, 1, 9, 1, 'Egg White (Egg White)', 'Kls', '10', '0', '0.00%', '10', '0', '0.00%', '2020-03-20 01:15:17'),
(997, 1, 9, 1, 'Egg Yellow coloring (Egg Yellow coloring)', 'grms', '0.17', '213.14', '0.01%', '0.17', '215.05', '0.01%', '2020-03-20 01:15:17'),
(998, 1, 9, 1, 'Eggs (Eggs)', 'ea', '5.71', '94631.27', '5.62%', '5.8', '96129.2', '5.63%', '2020-03-20 01:15:17'),
(999, 1, 9, 1, 'El Rancho Spiced Ham (El Rancho Spiced Ham)', 'grms', '0.19', '4160.03', '0.25%', '0.189', '4080.51', '0.24%', '2020-03-20 01:15:17'),
(1000, 1, 9, 1, 'Evaporated Milk 370ml (Evaporated Milk 370ml)', 'Can', '38.96', '366.18', '0.02%', '39.16', '368.1', '0.02%', '2020-03-20 01:15:17'),
(1001, 1, 9, 1, 'Filled Cheese (Filled Cheese)', 'grms', '0.24', '35101.65', '2.08%', '0.24239', '35122.31', '2.06%', '2020-03-20 01:15:17'),
(1002, 1, 9, 1, 'First Class flour (First Class flour)', 'grms', '0.03', '124897.07', '7.42%', '0.0298', '126393.72', '7.41%', '2020-03-20 01:15:17'),
(1003, 1, 9, 1, 'Fresh Milk- Conaprole (Fresh Milk- Conaprole)', 'Pck', '58', '12818', '0.76%', '58', '12818', '0.75%', '2020-03-20 01:15:17'),
(1004, 1, 9, 1, 'FreshMilk Anchor 12s (FreshMilk Anchor 12s)', 'ea', '65.83', '0', '0.00%', '65.83', '0', '0.00%', '2020-03-20 01:15:17'),
(1005, 1, 9, 1, 'Freshmilk Pauls Pure Milk (Freshmilk Pauls Pure Milk 12sx1ltr)', '', '62', '0', '0.00%', '62', '0', '0.00%', '2020-03-20 01:15:17'),
(1006, 1, 9, 1, 'Glaze Fruit (Glaze Fruit)', 'grms', '0.29', '7168.58', '0.43%', '0.26', '6526', '0.38%', '2020-03-20 01:15:17'),
(1007, 1, 9, 1, 'Good Sense Almonds 8.00z (Good Sense Almonds 8.00z)', 'ea', '329.95', '0', '0.00%', '329.95', '0', '0.00%', '2020-03-20 01:15:17'),
(1008, 1, 9, 1, 'Graham 1 kg (Graham 1 kg)', 'Kls', '147.61', '612.6', '0.04%', '138', '572.7', '0.03%', '2020-03-20 01:15:17'),
(1009, 1, 9, 1, 'Hotdog Champion (Hotdog Champion)', 'grms', '0.09', '0', '0.00%', '0.09', '0', '0.00%', '2020-03-20 01:15:17'),
(1010, 1, 9, 1, 'Macapuno Jam (Macapuno Jam)', 'grms', '0.19', '0', '0.00%', '0.19', '0', '0.00%', '2020-03-20 01:15:17'),
(1011, 1, 9, 1, 'Macapuno Meat (Macapuno Meat)', 'grms', '0.2', '35999.62', '2.14%', '0.2', '36000', '2.11%', '2020-03-20 01:15:17'),
(1012, 1, 9, 1, 'Magnolia Butter Unsalted (Magnolia Butter Unsalted 5kgx4)', 'Kls', '437.29', '0', '0.00%', '437.29', '0', '0.00%', '2020-03-20 01:15:17'),
(1013, 1, 9, 1, 'Magnolia Quickmelt 1.9kg (Magnolia Quickmelt 1.9kg)', 'Bar', '628', '4396', '0.26%', '628', '4396', '0.26%', '2020-03-20 01:15:17'),
(1014, 1, 9, 1, 'Mango Puree (Mango Puree)', 'grms', '0.13', '0', '0.00%', '0.13', '0', '0.00%', '2020-03-20 01:15:17'),
(1015, 1, 9, 1, 'Margarine (Margarine)', 'grms', '0.08', '13100.93', '0.78%', '0.08', '13096', '0.77%', '2020-03-20 01:15:17'),
(1016, 1, 9, 1, 'Mayonnaise 5kls/Pail (Mayonnaise 5kls/Pail)', 'grms', '0.12', '6198.96', '0.37%', '0.11707', '6198.86', '0.36%', '2020-03-20 01:15:17'),
(1017, 1, 9, 1, 'Mc Cormick Curry Powder 1kg (Mc Cormick Curry Powder 1kg)', 'Kls', '656.8', '945.79', '0.06%', '656.81', '945.81', '0.06%', '2020-03-20 01:15:17'),
(1018, 1, 9, 1, 'Meatbread filling (Meatbread filling  )', 'grms', '0.48', '0', '0.00%', '0.49', '0', '0.00%', '2020-03-20 01:15:17'),
(1019, 1, 9, 1, 'Micram (Micram)', 'grms', '0.22', '0', '0.00%', '0.22', '0', '0.00%', '2020-03-20 01:15:17'),
(1020, 1, 9, 1, 'Mollases (Mollases  )', 'ML', '0.08', '326.06', '0.02%', '0.07398', '309.61', '0.02%', '2020-03-20 01:15:17'),
(1021, 1, 9, 1, 'Mongo Paste (Mongo Paste)', 'grms', '0.11', '9790.16', '0.58%', '0.11', '9790', '0.57%', '2020-03-20 01:15:17'),
(1022, 1, 9, 1, 'Neutral Glaze Bakels (Neutral Glaze Bakels)', 'Gal', '1350', '0', '0.00%', '1350', '0', '0.00%', '2020-03-20 01:15:17'),
(1023, 1, 9, 1, 'Oatmeal (Oatmeal  )', 'grms', '0.12', '227.17', '0.01%', '0.1', '195', '0.01%', '2020-03-20 01:15:17'),
(1024, 1, 9, 1, 'Orange Coloring (Orange Coloring 25/PACK  )', 'grms', '0', '0', '0.00%', '1.29', '0', '0.00%', '2020-03-20 01:15:17'),
(1025, 1, 9, 1, 'Peanut (Peanut)', 'grms', '0.09', '1917.52', '0.11%', '0.11', '2266', '0.13%', '2020-03-20 01:15:17'),
(1026, 1, 9, 1, 'Pineapple Crushed 567g (Pineapple Crushed 567g)', 'Can', '50', '0', '0.00%', '51.2', '0', '0.00%', '2020-03-20 01:15:17'),
(1027, 1, 9, 1, 'Powdered Milk (Powdered Milk)', 'grms', '0.11', '11946.98', '0.71%', '0.114', '11970', '0.70%', '2020-03-20 01:15:17'),
(1028, 1, 9, 1, 'Pudding- uncook (Pudding- uncook  )', 'grms', '0.1', '0', '0.00%', '0.1', '0', '0.00%', '2020-03-20 01:15:17'),
(1029, 1, 9, 1, 'Raisin 10kg (Raisin 10kg)', 'grms', '0.17', '5695.79', '0.34%', '0.15', '5085', '0.30%', '2020-03-20 01:15:17'),
(1030, 1, 9, 1, 'Raisin 9kg (Raisin 9kg)', 'grms', '0.15', '0', '0.00%', '0.15', '0', '0.00%', '2020-03-20 01:15:17'),
(1031, 1, 9, 1, 'Rye Flour (Rye Flour)', 'grms', '0.29', '146.56', '0.01%', '0.27', '135', '0.01%', '2020-03-20 01:15:17'),
(1032, 1, 9, 1, 'salami Ham 1kg (salami Ham 1kg)', 'Kls', '220', '0', '0.00%', '220', '0', '0.00%', '2020-03-20 01:15:17'),
(1033, 1, 9, 1, 'Sesame Seeds (Sesame Seeds)', 'grms', '0.16', '804.58', '0.05%', '0.18', '887.4', '0.05%', '2020-03-20 01:15:17'),
(1034, 1, 9, 1, 'Sevilla Swt Pickle 270g (Sevilla Swt Pickle 270g)', 'Bot', '51.45', '61.23', '0.00%', '56.15', '66.82', '0.00%', '2020-03-20 01:15:17'),
(1035, 1, 9, 1, 'Shortening (Shortening)', 'grms', '0.09', '51995.13', '3.09%', '0.08533', '49448.74', '2.90%', '2020-03-20 01:15:17'),
(1036, 1, 9, 1, 'Shortening Mix (Shortening Mix)', 'grms', '0.12', '0.37', '0.00%', '0.12133', '0', '0.00%', '2020-03-20 01:15:17'),
(1037, 1, 9, 1, 'Sugar Brown (Sugar Brown)', 'grms', '0.04', '18805.08', '1.12%', '0.03652', '18807.8', '1.10%', '2020-03-20 01:15:17'),
(1038, 1, 9, 1, 'Sugar Syrup (Sugar Syrup)', 'grms', '0.04', '3000', '0.18%', '0.04', '3000', '0.18%', '2020-03-20 01:15:17'),
(1039, 1, 9, 1, 'Sugar White (Sugar White)', 'grms', '0.05', '62090.55', '3.69%', '0.0484', '61642.24', '3.61%', '2020-03-20 01:15:17'),
(1040, 1, 9, 1, 'Super Syrup (Super Syrup)', 'grms', '0.07', '7180.49', '0.43%', '0.075', '7500', '0.44%', '2020-03-20 01:15:17'),
(1041, 1, 9, 1, 'Sweet Ube Jam 1kg (Sweet Ube Jam 1kg)', 'grms', '0.13', '0', '0.00%', '0.13', '0', '0.00%', '2020-03-20 01:15:17'),
(1042, 1, 9, 1, 'Tanduay 5 yrs  375ML (Tanduay 5 yrs  375ML)', 'Bot', '43', '0', '0.00%', '43', '0', '0.00%', '2020-03-20 01:15:17'),
(1043, 1, 9, 1, 'Tanduay 5 yrs 250ml (Tanduay 5 yrs 250ml)', 'Bot', '33.9', '0', '0.00%', '33.9', '0', '0.00%', '2020-03-20 01:15:17'),
(1044, 1, 9, 1, 'Tanduay Rhum 1000ml (Tanduay Rhum 1000ml)', 'Bot', '107.7', '0', '0.00%', '102.45', '0', '0.00%', '2020-03-20 01:15:17'),
(1045, 1, 9, 1, 'Tanduay Rhum 750ml (Tanduay Rhum 750ml)', 'Bot', '97.35', '681.45', '0.04%', '87.35', '611.45', '0.04%', '2020-03-20 01:15:17'),
(1046, 1, 9, 1, 'Third Class flour (Third Class flour)', 'grms', '0.02', '9277.32', '0.55%', '0.0244', '9276.88', '0.54%', '2020-03-20 01:15:17'),
(1047, 1, 9, 1, 'Ube Flavocol (Ube Flavocol)', 'ML', '0', '0', '0.00%', '0.45', '0', '0.00%', '2020-03-20 01:15:17'),
(1048, 1, 9, 1, 'Ube flavor(120 ml) (Ube flavor(120 ml)  )', 'Bot', '12', '0', '0.00%', '12', '0', '0.00%', '2020-03-20 01:15:17'),
(1049, 1, 9, 1, 'Ube Paste (Ube Paste)', 'grms', '0.11', '5990.83', '0.36%', '0.11', '5984', '0.35%', '2020-03-20 01:15:17'),
(1050, 1, 9, 1, 'Vanilla 3785ml/gal (Vanilla 3785ml/gal)', 'ML', '0.03', '612.43', '0.04%', '0.03236', '612.41', '0.04%', '2020-03-20 01:15:17'),
(1051, 1, 9, 1, 'Vegetable Oil (Vegetable Oil)', 'ML', '0.06', '33413.44', '1.98%', '0.05775', '32109', '1.88%', '2020-03-20 01:15:17'),
(1052, 1, 9, 1, 'Vegetable Oil Gal (Vegetable Oil   )', 'Gal', '895.08', '-895.08', '-0.05%', '895.078', '-895.08', '-0.05%', '2020-03-20 01:15:17'),
(1053, 1, 9, 1, 'Virginia Honeycure Bacon (Virginia Honeycure Bacon)', 'grms', '0.6', '0', '0.00%', '0.595', '0', '0.00%', '2020-03-20 01:15:17'),
(1054, 1, 9, 1, 'Whipping Cream (Whipping Cream)', 'grms', '0.21', '22938.16', '1.36%', '0.20889', '22738.72', '1.33%', '2020-03-20 01:15:17'),
(1055, 1, 9, 1, 'Whole Durian (Whole Durian)', 'Kls', '80', '0', '0.00%', '35', '0', '0.00%', '2020-03-20 01:15:17'),
(1056, 1, 9, 1, 'Whole Wheat Flour (Whole Wheat Flour)', 'grms', '0.05', '-510', '-0.03%', '0.05', '-500', '-0.03%', '2020-03-20 01:15:17'),
(1057, 1, 9, 1, 'Whpping cream-icing (Whpping cream-icing  )', 'ea', '0.12', '0', '0.00%', '0.12', '0', '0.00%', '2020-03-20 01:15:17'),
(1058, 1, 9, 1, 'Yeast (Yeast)', 'grms', '0.2', '22672.95', '1.35%', '0.21', '23310', '1.37%', '2020-03-20 01:15:17'),
(1059, 1, 10, 1, 'Assorted Cookies (Assorted Cookies)', 'ea', '3.54', '0', '0.00%', '3.54', '0', '0.00%', '2020-03-20 01:18:27'),
(1060, 1, 10, 1, 'Bacon Bread (Bacon Bread)', 'ea', '23.73', '0', '0.00%', '23.73', '0', '0.00%', '2020-03-20 01:18:27'),
(1061, 1, 10, 1, 'Bagels (Bagels)', 'ea', '0', '0', '0.00%', '3.34', '0', '0.00%', '2020-03-20 01:18:27'),
(1062, 1, 10, 1, 'Banana Ketchup Mafran (Banana Ketchup Mafran)', 'grms', '0.02', '304.06', '0.02%', '0.02094', '317.03', '0.02%', '2020-03-20 01:18:27'),
(1063, 1, 10, 1, 'Banana Ketchup Tita Frita (Banana Ketchup Tita Frita 3785/Gal)', 'grms', '0.02', '0', '0.00%', '0.02', '0', '0.00%', '2020-03-20 01:18:27'),
(1064, 1, 10, 1, 'Banana Muffins (Banana Muffins)', 'ea', '3.05', '0', '0.00%', '3.05', '0', '0.00%', '2020-03-20 01:18:27'),
(1065, 1, 10, 1, 'Bavarian loaf (Bavarian loaf)', 'ea', '21.61', '0', '0.00%', '21.61', '0', '0.00%', '2020-03-20 01:18:27'),
(1066, 1, 10, 1, 'Big Bibingka (Big Bibingka)', 'ea', '15.69', '0', '0.00%', '15.69', '0', '0.00%', '2020-03-20 01:18:27'),
(1067, 1, 10, 1, 'Binangkal (Binangkal)', 'ea', '3.09', '200.85', '0.01%', '3.09', '200.85', '0.01%', '2020-03-20 01:18:27'),
(1068, 1, 10, 1, 'Boiled Egg (Boiled Egg)', 'ea', '6.05', '0', '0.00%', '6.05', '0', '0.00%', '2020-03-20 01:18:27'),
(1069, 1, 10, 1, 'Brownies (Brownies)', 'ea', '10.2', '0', '0.00%', '10.2', '0', '0.00%', '2020-03-20 01:18:27'),
(1070, 1, 10, 1, 'Buko Bibingka (Buko Bibingka)', 'ea', '8.46', '0', '0.00%', '8.46', '0', '0.00%', '2020-03-20 01:18:27'),
(1071, 1, 10, 1, 'Burger Buns by 6\'s (Burger Buns by 6\'s)', 'Pck', '18.42', '0', '0.00%', '18.42', '0', '0.00%', '2020-03-20 01:18:27'),
(1072, 1, 10, 1, 'Butter Macaroons (Butter Macaroons)', 'ea', '3.69', '0', '0.00%', '3.69', '0', '0.00%', '2020-03-20 01:18:27'),
(1073, 1, 10, 1, 'Cheese bread (Cheese bread)', 'ea', '4.28', '0', '0.00%', '4.28', '0', '0.00%', '2020-03-20 01:18:27'),
(1074, 1, 10, 1, 'Cheese Cake (Cheese Cake)', 'ea', '8.49', '8.49', '0.00%', '8.49', '8.49', '0.00%', '2020-03-20 01:18:27'),
(1075, 1, 10, 1, 'Cheese cross buns (Cheese cross buns)', 'ea', '20.35', '0', '0.00%', '20.35', '0', '0.00%', '2020-03-20 01:18:27'),
(1076, 1, 10, 1, 'Cheese Monay (Cheese Monay)', 'ea', '2.46', '0', '0.00%', '2.46', '0', '0.00%', '2020-03-20 01:18:27'),
(1077, 1, 10, 1, 'Cheeseloaf (Cheeseloaf)', 'ea', '31.65', '63.3', '0.00%', '31.65', '63.3', '0.00%', '2020-03-20 01:18:27'),
(1078, 1, 10, 1, 'Chicken sisig (Chicken sisig)', 'ea', '30.14', '1446.88', '0.09%', '22.22', '1066.56', '0.06%', '2020-03-20 01:18:27'),
(1079, 1, 10, 1, 'Chiffon Cake Large (Chiffon Cake Large)', 'ea', '109.71', '219.41', '0.01%', '109.71', '219.42', '0.01%', '2020-03-20 01:18:27'),
(1080, 1, 10, 1, 'Chiffon Cake Mini (Chiffon Cake Mini)', 'ea', '14.87', '0', '0.00%', '14.87', '0', '0.00%', '2020-03-20 01:18:27'),
(1081, 1, 10, 1, 'Chiffon Cake Small (Chiffon Cake Small   )', 'ea', '67.54', '0', '0.00%', '67.54', '0', '0.00%', '2020-03-20 01:18:27'),
(1082, 1, 10, 1, 'Chiffon Xsmall (Chiffon Xsmall)', 'ea', '30.53', '0', '0.00%', '30.53', '0', '0.00%', '2020-03-20 01:18:27'),
(1083, 1, 10, 1, 'Chinese Hopia (Chinese Hopia)', 'ea', '6', '432', '0.03%', '4.18', '300.96', '0.02%', '2020-03-20 01:18:27'),
(1084, 1, 10, 1, 'Choco bread (Choco bread)', 'ea', '6.62', '0', '0.00%', '6.62', '0', '0.00%', '2020-03-20 01:18:28'),
(1085, 1, 10, 1, 'Choco Crinkles (Choco Crinkles)', 'ea', '6.35', '0', '0.00%', '6.35', '0', '0.00%', '2020-03-20 01:18:28'),
(1086, 1, 10, 1, 'Choco flowing (Choco flowing)', 'ea', '0', '0', '0.00%', '2.74', '0', '0.00%', '2020-03-20 01:18:28'),
(1087, 1, 10, 1, 'Choco Lanay (Choco Lanay)', 'ea', '29.32', '0', '0.00%', '29.32', '0', '0.00%', '2020-03-20 01:18:28'),
(1088, 1, 10, 1, 'Choco loaf (Choco loaf)', 'ea', '18.02', '0', '0.00%', '18.02', '0', '0.00%', '2020-03-20 01:18:28'),
(1089, 1, 10, 1, 'Choco Muffins (Choco Muffins)', 'ea', '0', '0', '0.00%', '7.15', '0', '0.00%', '2020-03-20 01:18:28');
INSERT INTO `eb_raw_materials` (`PK_raw_materials_id`, `FK_outlet_id`, `FK_category_id`, `status`, `material_name`, `unit`, `average_cost`, `asset_value`, `total_asset_percent`, `sales_price`, `retail_value`, `total_retail_percent`, `date_added`) VALUES
(1090, 1, 10, 1, 'Choco twirl (Choco twirl)', 'ea', '5.05', '0', '0.00%', '5.05', '0', '0.00%', '2020-03-20 01:18:28'),
(1091, 1, 10, 1, 'Ciabatta (Ciabatta)', 'ea', '12', '108', '0.01%', '12', '108', '0.01%', '2020-03-20 01:18:28'),
(1092, 1, 10, 1, 'Cinnamon loaf (Cinnamon loaf)', 'ea', '16.35', '0', '0.00%', '16.35', '0', '0.00%', '2020-03-20 01:18:28'),
(1093, 1, 10, 1, 'Cinnamon slice (Cinnamon slice)', 'ea', '7.68', '7.68', '0.00%', '7.68', '7.68', '0.00%', '2020-03-20 01:18:28'),
(1094, 1, 10, 1, 'Cinnamon syrup (Cinnamon syrup)', 'ea', '7.45', '0', '0.00%', '7.45', '0', '0.00%', '2020-03-20 01:18:28'),
(1095, 1, 10, 1, 'Coco bread (Coco bread)', 'ea', '4.74', '0', '0.00%', '4.74', '0', '0.00%', '2020-03-20 01:18:28'),
(1096, 1, 10, 1, 'Communion Bread (Communion Bread)', 'ea', '14.98', '2202.06', '0.13%', '14.98', '2202.06', '0.13%', '2020-03-20 01:18:28'),
(1097, 1, 10, 1, 'Cookies & Cream Chilled (Cookies & Cream Chilled)', 'ea', '18', '0', '0.00%', '18', '0', '0.00%', '2020-03-20 01:18:28'),
(1098, 1, 10, 1, 'Cookies and Cream (Cookies and Cream)', 'ea', '45.78', '0', '0.00%', '45.78', '0', '0.00%', '2020-03-20 01:18:28'),
(1099, 1, 10, 1, 'Cracked w.wheat (Cracked w.wheat)', 'ea', '15.95', '15.95', '0.00%', '15.95', '15.95', '0.00%', '2020-03-20 01:18:28'),
(1100, 1, 10, 1, 'Cream Bread Jumbo (Cream Bread Jumbo)', 'ea', '37.29', '2610.3', '0.16%', '39.29', '2750.3', '0.16%', '2020-03-20 01:18:28'),
(1101, 1, 10, 1, 'Cream Bread Large (Cream Bread Large)', 'ea', '27.02', '1188.88', '0.07%', '27.02', '1188.88', '0.07%', '2020-03-20 01:18:28'),
(1102, 1, 10, 1, 'Croissant (Croissant)', 'ea', '0', '0', '0.00%', '7.52', '0', '0.00%', '2020-03-20 01:18:28'),
(1103, 1, 10, 1, 'Crotons (Crotons)', 'ea', '40', '0', '0.00%', '40', '0', '0.00%', '2020-03-20 01:18:28'),
(1104, 1, 10, 1, 'Cup Noodles (Cup Noodles)', 'ea', '25', '0', '0.00%', '25', '0', '0.00%', '2020-03-20 01:18:28'),
(1105, 1, 10, 1, 'Custard Cake (Custard Cake)', 'ea', '19.33', '0', '0.00%', '18', '0', '0.00%', '2020-03-20 01:18:28'),
(1106, 1, 10, 1, 'Dark Rye Oats (Dark Rye Oats)', 'ea', '51', '0', '0.00%', '23.94', '0', '0.00%', '2020-03-20 01:18:28'),
(1107, 1, 10, 1, 'Dinner Roll (Dinner Roll)', 'ea', '0', '0', '0.00%', '19.68', '0', '0.00%', '2020-03-20 01:18:28'),
(1108, 1, 10, 1, 'Disposable Gloves (Disposable Gloves)', 'Pck', '41.23', '577.28', '0.03%', '42', '588', '0.03%', '2020-03-20 01:18:28'),
(1109, 1, 10, 1, 'Donut (Donut)', 'ea', '7.5', '0', '0.00%', '3.69', '0', '0.00%', '2020-03-20 01:18:28'),
(1110, 1, 10, 1, 'Double Body Plain (Double Body Plain)', 'ea', '7.02', '91.26', '0.01%', '7.02', '91.26', '0.01%', '2020-03-20 01:18:28'),
(1111, 1, 10, 1, 'Double Body Ube (Double Body Ube)', 'ea', '7.77', '31.08', '0.00%', '7.77', '31.08', '0.00%', '2020-03-20 01:18:28'),
(1112, 1, 10, 1, 'Durian Chilled (Durian Chilled)', 'ea', '23.84', '1311.2', '0.08%', '30', '1650', '0.10%', '2020-03-20 01:18:28'),
(1113, 1, 10, 1, 'Durian Chocolate (Durian Chocolate)', 'ea', '58.38', '-58.38', '0.00%', '58.38', '-58.38', '0.00%', '2020-03-20 01:18:28'),
(1114, 1, 10, 1, 'Durian Yema Candy (Durian Yema Candy)', 'Pck', '0', '0', '0.00%', '22.97', '0', '0.00%', '2020-03-20 01:18:28'),
(1115, 1, 10, 1, 'Dutch WWM (Dutch WWM)', 'ea', '20.09', '60.27', '0.00%', '20.09', '60.27', '0.00%', '2020-03-20 01:18:28'),
(1116, 1, 10, 1, 'Egg Cracker (Egg Cracker)', 'ea', '0', '0', '0.00%', '16.09', '0', '0.00%', '2020-03-20 01:18:28'),
(1117, 1, 10, 1, 'Ensaymada big (Ensaymada big)', 'ea', '15.32', '0', '0.00%', '22.03', '0', '0.00%', '2020-03-20 01:18:28'),
(1118, 1, 10, 1, 'Ensaymada small (Ensaymada small)', 'ea', '6.48', '0', '0.00%', '6.48', '0', '0.00%', '2020-03-20 01:18:28'),
(1119, 1, 10, 1, 'Euro Desal (Euro Desal)', 'ea', '1.74', '34.8', '0.00%', '1.74', '34.8', '0.00%', '2020-03-20 01:18:28'),
(1120, 1, 10, 1, 'Euro loaf (Euro loaf)', 'ea', '29.37', '0', '0.00%', '29.37', '0', '0.00%', '2020-03-20 01:18:28'),
(1121, 1, 10, 1, 'Figue Pie (Figue Pie)', 'ea', '3.77', '109.33', '0.01%', '3.77', '109.33', '0.01%', '2020-03-20 01:18:28'),
(1122, 1, 10, 1, 'Fino (Fino)', 'ea', '1.54', '0', '0.00%', '1.54', '0', '0.00%', '2020-03-20 01:18:28'),
(1123, 1, 10, 1, 'Food For the Gods (Food For the Gods)', 'ea', '9.17', '0', '0.00%', '9.17', '0', '0.00%', '2020-03-20 01:18:28'),
(1124, 1, 10, 1, 'Frances big (Frances big)', 'ea', '21.26', '0', '0.00%', '21.26', '0', '0.00%', '2020-03-20 01:18:28'),
(1125, 1, 10, 1, 'Frances small (Frances small)', 'ea', '6.52', '0', '0.00%', '6.52', '0', '0.00%', '2020-03-20 01:18:28'),
(1126, 1, 10, 1, 'French Bread Plain Large (French Bread Plain Large)', 'ea', '16.83', '0', '0.00%', '16.83', '0', '0.00%', '2020-03-20 01:18:28'),
(1127, 1, 10, 1, 'French Bread WW Large (French Bread WW Large)', 'ea', '16.81', '0', '0.00%', '16.81', '0', '0.00%', '2020-03-20 01:18:28'),
(1128, 1, 10, 1, 'Fruit Cake (Fruit Cake)', 'ea', '202.78', '0', '0.00%', '202.78', '0', '0.00%', '2020-03-20 01:18:28'),
(1129, 1, 10, 1, 'Fruit John (Fruit John)', 'ea', '19.13', '0', '0.00%', '19.13', '0', '0.00%', '2020-03-20 01:18:28'),
(1130, 1, 10, 1, 'Fruit Shake (Fruit Shake)', 'Bot', '12.2', '0', '0.00%', '20', '0', '0.00%', '2020-03-20 01:18:28'),
(1131, 1, 10, 1, 'Fruitty Muffins (Fruitty Muffins)', 'ea', '6', '90', '0.01%', '6', '90', '0.01%', '2020-03-20 01:18:28'),
(1132, 1, 10, 1, 'Fry Stick Bread Plain (Fry Stick Bread Plain)', 'ea', '10.06', '0', '0.00%', '10.06', '0', '0.00%', '2020-03-20 01:18:28'),
(1133, 1, 10, 1, 'Fry Stick Bread w/ Cheese (Fry Stick Bread w/ Cheese)', 'ea', '11.59', '3859.85', '0.23%', '10.37', '3453.21', '0.20%', '2020-03-20 01:18:28'),
(1134, 1, 10, 1, 'Ganache Plain (Ganache Plain)', 'ea', '10.08', '0', '0.00%', '10.08', '0', '0.00%', '2020-03-20 01:18:28'),
(1135, 1, 10, 1, 'Garlic Bread Stick Tumbler (Garlic Bread Stick Tumbler)', 'ea', '45.75', '274.52', '0.02%', '45.82', '274.92', '0.02%', '2020-03-20 01:18:28'),
(1136, 1, 10, 1, 'Garlic Butter Sauce (Garlic Butter Sauce)', 'Kls', '555.7', '0', '0.00%', '555.7', '0', '0.00%', '2020-03-20 01:18:28'),
(1137, 1, 10, 1, 'Garlic Mint (Garlic Mint)', 'ea', '0', '0', '0.00%', '3.76', '0', '0.00%', '2020-03-20 01:18:28'),
(1138, 1, 10, 1, 'Garlic slice bread (Garlic slice bread)', 'ea', '4.65', '0', '0.00%', '4.65', '0', '0.00%', '2020-03-20 01:18:28'),
(1139, 1, 10, 1, 'Ham & egg (Ham & egg)', 'ea', '5.35', '0', '0.00%', '5.35', '0', '0.00%', '2020-03-20 01:18:28'),
(1140, 1, 10, 1, 'Ham roll (Ham roll)', 'ea', '0', '0', '0.00%', '6.14', '0', '0.00%', '2020-03-20 01:18:28'),
(1141, 1, 10, 1, 'Hawaiian upside (Hawaiian upside)', 'ea', '33.49', '0', '0.00%', '33.49', '0', '0.00%', '2020-03-20 01:18:28'),
(1142, 1, 10, 1, 'Hopia Mongo (Hopia Mongo)', 'ea', '1.69', '0', '0.00%', '1.69', '0', '0.00%', '2020-03-20 01:18:28'),
(1143, 1, 10, 1, 'Hotdog delight (Hotdog delight)', 'ea', '0', '0', '0.00%', '4.09', '0', '0.00%', '2020-03-20 01:18:28'),
(1144, 1, 10, 1, 'Jelly Roll (Jelly Roll)', 'ea', '109.84', '0', '0.00%', '109.84', '0', '0.00%', '2020-03-20 01:18:28'),
(1145, 1, 10, 1, 'Kaizer buns -big (Kaizer buns -big)', 'ea', '3.36', '0', '0.00%', '10.14', '0', '0.00%', '2020-03-20 01:18:28'),
(1146, 1, 10, 1, 'Kaizer buns -small (Kaizer buns -small)', 'ea', '4.67', '0', '0.00%', '4.67', '0', '0.00%', '2020-03-20 01:18:28'),
(1147, 1, 10, 1, 'Lengua Big (Lengua Big)', 'ea', '56.53', '1526.31', '0.09%', '56.53', '1526.31', '0.09%', '2020-03-20 01:18:28'),
(1148, 1, 10, 1, 'Lengua De Gato (Lengua De Gato)', 'ea', '29.37', '0', '0.00%', '29.37', '0', '0.00%', '2020-03-20 01:18:28'),
(1149, 1, 10, 1, 'Long Pandesal (Long Pandesal)', 'ea', '2.92', '0', '0.00%', '2.92', '0', '0.00%', '2020-03-20 01:18:28'),
(1150, 1, 10, 1, 'Macapuno bread (Macapuno bread  )', 'ea', '7.17', '0', '0.00%', '7.17', '0', '0.00%', '2020-03-20 01:18:28'),
(1151, 1, 10, 1, 'Macapuno Loaf (Macapuno Loaf)', 'ea', '22.27', '0', '0.00%', '22.27', '0', '0.00%', '2020-03-20 01:18:28'),
(1152, 1, 10, 1, 'Mango Chilled (Mango Chilled)', 'ea', '18', '0', '0.00%', '18', '0', '0.00%', '2020-03-20 01:18:28'),
(1153, 1, 10, 1, 'Marjorie loaf (Marjorie loaf)', 'ea', '21.89', '0', '0.00%', '21.89', '0', '0.00%', '2020-03-20 01:18:28'),
(1154, 1, 10, 1, 'Matzu Biscuit (Matzu Biscuit)', 'ea', '11.85', '0', '0.00%', '11.85', '0', '0.00%', '2020-03-20 01:18:28'),
(1155, 1, 10, 1, 'Meat Bread (Meat Bread  )', 'ea', '113.89', '0', '0.00%', '13.5', '0', '0.00%', '2020-03-20 01:18:28'),
(1156, 1, 10, 1, 'Mix Rye (Mix Rye)', 'ea', '26.69', '0', '0.00%', '26.69', '0', '0.00%', '2020-03-20 01:18:28'),
(1157, 1, 10, 1, 'Moist Cake Square (Moist Cake Square)', 'ea', '23.5', '94', '0.01%', '23.5', '94', '0.01%', '2020-03-20 01:18:28'),
(1158, 1, 10, 1, 'Monay big (Monay big)', 'ea', '19.57', '0', '0.00%', '19.57', '0', '0.00%', '2020-03-20 01:18:28'),
(1159, 1, 10, 1, 'Monay Del Valle (Monay Del Valle)', 'ea', '23.24', '0', '0.00%', '23.24', '0', '0.00%', '2020-03-20 01:18:28'),
(1160, 1, 10, 1, 'Monay mini (Monay mini)', 'ea', '2.5', '105', '0.01%', '2.5', '105', '0.01%', '2020-03-20 01:18:28'),
(1161, 1, 10, 1, 'Monay small (Monay small)', 'ea', '6.42', '0', '0.00%', '6.42', '0', '0.00%', '2020-03-20 01:18:28'),
(1162, 1, 10, 1, 'Mongo bread (Mongo bread)', 'ea', '4.88', '0', '0.00%', '4.88', '0', '0.00%', '2020-03-20 01:18:28'),
(1163, 1, 10, 1, 'Mud Bar (Mud Bar)', 'ea', '9.95', '0', '0.00%', '9.95', '0', '0.00%', '2020-03-20 01:18:28'),
(1164, 1, 10, 1, 'Multiseeds (Multiseeds)', 'ea', '0', '0', '0.00%', '25.87', '0', '0.00%', '2020-03-20 01:18:28'),
(1165, 1, 10, 1, 'Mushroom (Mushroom)', 'ea', '2.7', '0', '0.00%', '2.7', '0', '0.00%', '2020-03-20 01:18:28'),
(1166, 1, 10, 1, 'P. Ensaymada (Packed Ensaymada)', 'Pck', '15.32', '0', '0.00%', '15.32', '0', '0.00%', '2020-03-20 01:18:28'),
(1167, 1, 10, 1, 'Pandan Hopia (Pandan Hopia)', 'ea', '1.41', '0', '0.00%', '1.41', '0', '0.00%', '2020-03-20 01:18:28'),
(1168, 1, 10, 1, 'Papaya (Papaya)', 'ea', '20.71', '0', '0.00%', '20.71', '0', '0.00%', '2020-03-20 01:18:28'),
(1169, 1, 10, 1, 'Parsly cheese (Parsly cheese)', 'ea', '0', '0', '0.00%', '2.46', '0', '0.00%', '2020-03-20 01:18:28'),
(1170, 1, 10, 1, 'Parsly Hotdog (Parsly Hotdog  )', 'ea', '4.89', '0', '0.00%', '4.89', '0', '0.00%', '2020-03-20 01:18:28'),
(1171, 1, 10, 1, 'Pilipit (Pilipit)', 'ea', '7.5', '0', '0.00%', '3.69', '0', '0.00%', '2020-03-20 01:18:28'),
(1172, 1, 10, 1, 'Plain Muffins (Plain Muffins)', 'ea', '0', '0', '0.00%', '7.25', '0', '0.00%', '2020-03-20 01:18:28'),
(1173, 1, 10, 1, 'Pork sisig (Pork sisig)', 'ea', '22.22', '2466.42', '0.15%', '27.77', '3082.47', '0.18%', '2020-03-20 01:18:28'),
(1174, 1, 10, 1, 'Putok (Putok)', 'ea', '2.77', '0', '0.00%', '2.77', '0', '0.00%', '2020-03-20 01:18:28'),
(1175, 1, 10, 1, 'Raisin Cake (Raisin Cake)', 'ea', '0', '0', '0.00%', '7.11', '0', '0.00%', '2020-03-20 01:18:28'),
(1176, 1, 10, 1, 'Revel Bar (Revel Bar)', 'ea', '8.96', '71.68', '0.00%', '8.96', '71.68', '0.00%', '2020-03-20 01:18:28'),
(1177, 1, 10, 1, 'Royal Bibingka (Royal Bibingka)', 'ea', '11.58', '69.48', '0.00%', '11.58', '69.48', '0.00%', '2020-03-20 01:18:28'),
(1178, 1, 10, 1, 'S.Donut Filling (S.Donut Filling)', 'ea', '5.61', '11.22', '0.00%', '5.61', '11.22', '0.00%', '2020-03-20 01:18:28'),
(1179, 1, 10, 1, 'Sesame Buns (Sesame Buns)', '', '1.74', '87', '0.01%', '1.74', '87', '0.01%', '2020-03-20 01:18:28'),
(1180, 1, 10, 1, 'Sesame Cookies (Sesame Cookies  )', 'ea', '12.5', '500', '0.03%', '12.5', '500', '0.03%', '2020-03-20 01:18:28'),
(1181, 1, 10, 1, 'Sesame Roll (Sesame Roll)', 'ea', '2.72', '0', '0.00%', '2.72', '0', '0.00%', '2020-03-20 01:18:28'),
(1182, 1, 10, 1, 'Sesame Rye (Sesame Rye)', 'ea', '22.47', '0', '0.00%', '22.47', '0', '0.00%', '2020-03-20 01:18:28'),
(1183, 1, 10, 1, 'Sesame w.wheat (Sesame w.wheat)', 'ea', '22.25', '22.25', '0.00%', '22.25', '22.25', '0.00%', '2020-03-20 01:18:28'),
(1184, 1, 10, 1, 'Slutty Brownies (Slutty Brownies)', 'ea', '10.85', '0', '0.00%', '10.85', '0', '0.00%', '2020-03-20 01:18:28'),
(1185, 1, 10, 1, 'Sour Dough Bread (Sour Dough Bread)', 'ea', '14.95', '224.25', '0.01%', '14.95', '224.25', '0.01%', '2020-03-20 01:18:28'),
(1186, 1, 10, 1, 'Spanish bread (Spanish bread)', 'ea', '3.42', '6.84', '0.00%', '3.42', '6.84', '0.00%', '2020-03-20 01:18:28'),
(1187, 1, 10, 1, 'Special Mamon (Special Mamon)', 'ea', '10.31', '20.62', '0.00%', '10.31', '20.62', '0.00%', '2020-03-20 01:18:28'),
(1188, 1, 10, 1, 'Star bread big (Star bread big)', 'ea', '19.68', '0', '0.00%', '19.68', '0', '0.00%', '2020-03-20 01:18:28'),
(1189, 1, 10, 1, 'Star small (Star small)', 'ea', '6.42', '0', '0.00%', '6.42', '0', '0.00%', '2020-03-20 01:18:28'),
(1190, 1, 10, 1, 'Starbread mini (Starbread mini)', 'ea', '2.5', '0', '0.00%', '2.5', '0', '0.00%', '2020-03-20 01:18:28'),
(1191, 1, 10, 1, 'Stick Bread (Stick Bread)', 'ea', '10.37', '0', '0.00%', '17', '0', '0.00%', '2020-03-20 01:18:28'),
(1192, 1, 10, 1, 'Strussels small (Strussels small)', 'ea', '6.78', '6.78', '0.00%', '6.78', '6.78', '0.00%', '2020-03-20 01:18:28'),
(1193, 1, 10, 1, 'Taipan Loaf (Taipan Loaf)', 'ea', '23.75', '0', '0.00%', '23.75', '0', '0.00%', '2020-03-20 01:18:28'),
(1194, 1, 10, 1, 'Toasted Bread (Toasted Bread)', 'ea', '10.33', '1187.95', '0.07%', '11', '1265', '0.07%', '2020-03-20 01:18:28'),
(1195, 1, 10, 1, 'Toasted Siopao Chicken (Toasted Siopao Chicken)', 'ea', '8.71', '0', '0.00%', '7.16', '0', '0.00%', '2020-03-20 01:18:28'),
(1196, 1, 10, 1, 'Toasted Siopao Pork (Toasted Siopao Pork)', 'ea', '8.96', '1343.59', '0.08%', '7.57', '1135.5', '0.07%', '2020-03-20 01:18:28'),
(1197, 1, 10, 1, 'Ube bread (Ube bread)', 'ea', '3.35', '0', '0.00%', '3.35', '0', '0.00%', '2020-03-20 01:18:28'),
(1198, 1, 10, 1, 'Ube Chilled (Ube Chilled)', 'ea', '18.9', '0', '0.00%', '18.9', '0', '0.00%', '2020-03-20 01:18:28'),
(1199, 1, 10, 1, 'Ube Hopia (Ube Hopia)', 'ea', '3.39', '250.86', '0.02%', '1.69', '125.06', '0.01%', '2020-03-20 01:18:28'),
(1200, 1, 10, 1, 'Ube loaf (Ube loaf)', 'ea', '14.13', '0', '0.00%', '14.13', '0', '0.00%', '2020-03-20 01:18:28'),
(1201, 1, 10, 1, 'Valentine Cake (Valentine Cake)', 'ea', '0', '0', '0.00%', '14.42', '0', '0.00%', '2020-03-20 01:18:28'),
(1202, 1, 10, 1, 'W.wheat pandesal (W.wheat pandesal)', 'ea', '5.86', '17.58', '0.00%', '5.86', '17.58', '0.00%', '2020-03-20 01:18:28'),
(1203, 1, 10, 1, 'White Mongo Hopia (White Mongo Hopia)', 'ea', '0', '0', '0.00%', '1.41', '0', '0.00%', '2020-03-20 01:18:28'),
(1204, 1, 10, 1, 'Wholewheat Jumbo (Wholewheat Jumbo)', 'ea', '31.02', '0', '0.00%', '31.02', '0', '0.00%', '2020-03-20 01:18:28'),
(1205, 1, 10, 1, 'Wholewheat Loaf (Wholewheat Loaf)', 'ea', '17.48', '0', '0.00%', '17.48', '0', '0.00%', '2020-03-20 01:18:28'),
(1206, 1, 10, 1, 'Yema Cake (Yema Cake)', 'ea', '8.74', '0', '0.00%', '7.8', '0', '0.00%', '2020-03-20 01:18:28'),
(1207, 1, 11, 1, 'MX3 Capsule w/ cofee (MX3 Capsule w/ coffee)', '', '907.2', '0', '0.00%', '1039.16', '0', '0.00%', '2020-03-20 01:20:35'),
(1208, 1, 11, 1, 'MX3 Coffee (MX3 Coffee)', '', '169.03', '9584.09', '0.57%', '181.36', '10283.11', '0.60%', '2020-03-20 01:20:35'),
(1209, 1, 2, 1, '1.2 small card (1.2 small card)', 'ea', '28.57', '0', '0.00%', '28.57', '0', '0.00%', '2020-03-20 01:22:15'),
(1210, 1, 2, 1, '1.65 Card (1.65 Card)', 'ea', '31.88', '0', '0.00%', '31.88', '0', '0.00%', '2020-03-20 01:22:15'),
(1211, 1, 2, 1, 'Birthday Card (Birthday Card)', 'ea', '60.18', '0', '0.00%', '60.18', '0', '0.00%', '2020-03-20 01:22:15'),
(1212, 1, 2, 1, 'Cake Deco 5set (Cake Deco 5set)', 'ea', '15.66', '0', '0.00%', '15.66', '0', '0.00%', '2020-03-20 01:22:15'),
(1213, 1, 2, 1, 'Cake Strips Girls (Cake Strips Girls)', 'ea', '72.45', '0', '0.00%', '72.45', '0', '0.00%', '2020-03-20 01:22:15'),
(1214, 1, 2, 1, 'Cake Strips Golden (Cake Strips Golden)', 'Roll', '138.6', '0', '0.00%', '138.6', '0', '0.00%', '2020-03-20 01:22:15'),
(1215, 1, 2, 1, 'Cake Strips Lady (Cake Strips Lady)', 'Roll', '72.45', '0', '0.00%', '72.45', '0', '0.00%', '2020-03-20 01:22:15'),
(1216, 1, 2, 1, 'Ceramic Plates black (Ceramic Plates black)', 'ea', '0', '0', '0.00%', '103.99', '0', '0.00%', '2020-03-20 01:22:15'),
(1217, 1, 2, 1, 'Ceramic Plates Green (Ceramic Plates black)', 'ea', '0', '0', '0.00%', '103.99', '0', '0.00%', '2020-03-20 01:22:15'),
(1218, 1, 2, 1, 'Gift Candles (Gift Candles)', 'ea', '22.81', '0', '0.00%', '22.81', '0', '0.00%', '2020-03-20 01:22:15'),
(1219, 1, 2, 1, 'Personalized Cups (Personalized Cups)', 'ea', '198.95', '10146.45', '0.60%', '198.95', '10146.45', '0.59%', '2020-03-20 01:22:15'),
(1220, 1, 2, 1, 'Tumbler (Tumbler)', 'ea', '198.95', '3382.15', '0.20%', '250', '4250', '0.25%', '2020-03-20 01:22:15'),
(1221, 1, 2, 1, 'Umbrella (Umbrella)', 'ea', '149.02', '1639.22', '0.10%', '249', '2739', '0.16%', '2020-03-20 01:22:15'),
(1222, 1, 2, 1, 'V-Shape Mugs (V-Shape Mugs)', 'ea', '33.95', '1663.55', '0.10%', '33.95', '1663.55', '0.10%', '2020-03-20 01:22:15'),
(1223, 1, 2, 1, 'Wedding Cups (Wedding Cups)', 'ea', '201.45', '1208.7', '0.07%', '250', '1500', '0.09%', '2020-03-20 01:22:15'),
(1224, 1, 2, 1, 'Wedding Flower (Wedding Flower)', 'ea', '150', '750', '0.05%', '150', '750', '0.04%', '2020-03-20 01:22:15'),
(1225, 1, 2, 1, 'Wedding Glass (Wedding Glass)', 'ea', '201.45', '0', '0.00%', '249', '0', '0.00%', '2020-03-20 01:22:15'),
(1226, 1, 2, 1, 'Wedding Knife (Wedding Knife)', 'ea', '150', '600', '0.04%', '150', '600', '0.04%', '2020-03-20 01:22:15'),
(1227, 2, 3, 1, '12x12 chocolate spongecake (12x12 chocolate spongecake  )', 'ea', '212.45', '0', '0.00%', '212.45', '0', '0.00%', '2020-03-20 14:22:50'),
(1228, 2, 3, 1, '12x12 Plain spongecake (12x12 c (12x12 Plain spongecake)', 'ea', '227.07', '0', '0.00%', '227.07', '0', '0.00%', '2020-03-20 14:22:50'),
(1229, 2, 3, 1, '12x16 chocolate spongecake (12x12 spongecake  )', 'ea', '468.47', '0', '0.00%', '468.47', '0', '0.00%', '2020-03-20 14:22:50'),
(1230, 2, 3, 1, '12x16 plain spongecake (12x16 plain spongecake)', 'ea', '308.34', '0', '0.00%', '308.34', '0', '0.00%', '2020-03-20 14:22:50'),
(1231, 2, 3, 1, '8 x12 chocolate spongecake (8 x12 chocolate spongecake)', 'ea', '198.43', '0', '0.00%', '198.43', '0', '0.00%', '2020-03-20 14:22:50'),
(1232, 2, 3, 1, 'Airbrush Color Black - 225ml/bo (Airbrush Color Black - 225ml/bot  )', 'Bot', '360', '540', '0.07%', '360', '540', '0.04%', '2020-03-20 14:22:50'),
(1233, 2, 3, 1, 'Airbrush Color Blue - 225ml/bot (Airbrush Color Blue - 225ml/bot  )', 'Bot', '260', '390', '0.05%', '260', '390', '0.03%', '2020-03-20 14:22:50'),
(1234, 2, 3, 1, 'Airbrush Color Brown - 225ml/bo (Airbrush Color Brown - 225ml/bot  )', 'Bot', '261.38', '849.48', '0.12%', '360', '1170', '0.08%', '2020-03-20 14:22:50'),
(1235, 2, 3, 1, 'Airbrush Color Green - 225ml/bo (Airbrush Color Green - 225ml/bot  )', 'Bot', '260', '130', '0.02%', '260', '130', '0.01%', '2020-03-20 14:22:50'),
(1236, 2, 3, 1, 'Airbrush Color Orange - 225ml/b (Airbrush Color Orange - 225ml/bot  )', 'Bot', '260', '585', '0.08%', '260', '585', '0.04%', '2020-03-20 14:22:50'),
(1237, 2, 3, 1, 'Airbrush Color Pink - 225ml/bot (Airbrush Color Pink - 225ml/bot  )', 'Bot', '317.38', '1269.51', '0.17%', '360', '1440', '0.10%', '2020-03-20 14:22:50'),
(1238, 2, 3, 1, 'Airbrush Color Red  -225ml/bot (Airbrush Color Red  -225ml/bot  )', 'Bot', '360', '810', '0.11%', '360', '810', '0.06%', '2020-03-20 14:22:50'),
(1239, 2, 3, 1, 'Airbrush Color Violet - 225ml/b (Airbrush Color Violet - 225ml/bot  )', 'Bot', '360', '1980', '0.27%', '260', '1430', '0.10%', '2020-03-20 14:22:50'),
(1240, 2, 3, 1, 'Airbrush Color Yellow -225ml/bo (Airbrush Color Yellow -225ml/bot  )', 'Bot', '260', '325', '0.04%', '260', '325', '0.02%', '2020-03-20 14:22:50'),
(1241, 2, 3, 1, 'Amamio Honey 250ml (Amamio Honey 250ML)', 'Bot', '190', '0', '0.00%', '250', '0', '0.00%', '2020-03-20 14:22:50'),
(1242, 2, 3, 1, 'American Lemon (American Lemon)', 'g', '0.3', '0', '0.00%', '0.3', '0', '0.00%', '2020-03-20 14:22:50'),
(1243, 2, 3, 1, 'American Lemon (pcs) (American Lemon)', 'ea', '20', '420', '0.06%', '25', '525', '0.04%', '2020-03-20 14:22:50'),
(1244, 2, 3, 1, 'Ana figurine (Ana figurine  )', 'ea', '60', '0', '0.00%', '60', '0', '0.00%', '2020-03-20 14:22:50'),
(1245, 2, 3, 1, 'Assorted Grass (Assorted Grass (3pcs/pack) = 15/pck = 3each  )', 'ea', '3', '0', '0.00%', '3', '0', '0.00%', '2020-03-20 14:22:50'),
(1246, 2, 3, 1, 'Aurora figurine (Aurora figurine  )', 'ea', '32', '0', '0.00%', '60', '0', '0.00%', '2020-03-20 14:22:50'),
(1247, 2, 3, 1, 'Avocado (Avocado)', 'kls', '43.99', '0', '0.00%', '35', '0', '0.00%', '2020-03-20 14:22:50'),
(1248, 2, 3, 1, 'Avocado Fresh (Fresh Avocado)', 'kls', '51.76', '0', '0.00%', '51.92308', '0', '0.00%', '2020-03-20 14:22:50'),
(1249, 2, 3, 1, 'Baby Figurine (Imported) (Baby Figurine (Imported))', 'ea', '60', '0', '0.00%', '60', '0', '0.00%', '2020-03-20 14:22:50'),
(1250, 2, 3, 1, 'Baby on crib (Baby on crib (cake accs)  )', 'ea', '36.09', '180.44', '0.02%', '60', '300', '0.02%', '2020-03-20 14:22:50'),
(1251, 2, 3, 1, 'Batman figurine (Batman figurine  )', 'ea', '55.76', '836.43', '0.11%', '25', '375', '0.03%', '2020-03-20 14:22:50'),
(1252, 2, 3, 1, 'Batman Styro (Batman Styro)', 'ea', '15.88', '142.94', '0.02%', '15', '135', '0.01%', '2020-03-20 14:22:50'),
(1253, 2, 3, 1, 'Belle figurine (Belle figurine  )', 'ea', '31.7', '0', '0.00%', '60', '0', '0.00%', '2020-03-20 14:22:51'),
(1254, 2, 3, 1, 'Ben 10 Figurine (Ben 10 Figurine)', 'ea', '28', '168', '0.02%', '28', '168', '0.01%', '2020-03-20 14:22:51'),
(1255, 2, 3, 1, 'Blackforest Cake (Blackforest Cake)', 'ea', '52.88', '0', '0.00%', '52.88', '0', '0.00%', '2020-03-20 14:22:51'),
(1256, 2, 3, 1, 'Blueberry Baked (Blueberry Baked)', 'ea', '46.41', '0', '0.00%', '46.41', '0', '0.00%', '2020-03-20 14:22:51'),
(1257, 2, 3, 1, 'Blueberry CC (Blueberry CC)', 'ea', '47.66', '0', '0.00%', '47.66', '0', '0.00%', '2020-03-20 14:22:51'),
(1258, 2, 3, 1, 'Blueberry Square (Blueberry Square)', 'ea', '34.58', '0', '0.00%', '34.58', '0', '0.00%', '2020-03-20 14:22:51'),
(1259, 2, 3, 1, 'BreakFast Blend (BreakFast Blend)', 'ea', '5.6', '0', '0.00%', '32.06', '0', '0.00%', '2020-03-20 14:22:51'),
(1260, 2, 3, 1, 'Brown Sugar (7g (100pcs/pack) (Brown Sugar (7g (100pcs/pack)  )', 'ea', '0.66', '0', '0.00%', '0.66', '0', '0.00%', '2020-03-20 14:22:51'),
(1261, 2, 3, 1, 'C.Tree (Coconut Tree w/ Fruit(2 pcs per pack))', 'Pck', '15', '75', '0.01%', '15', '75', '0.01%', '2020-03-20 14:22:51'),
(1262, 2, 3, 1, 'Caffe Veronica (Caffe Veronica)', 'ea', '30.32', '-30.32', '0.00%', '32.06', '-32.06', '0.00%', '2020-03-20 14:22:51'),
(1263, 2, 3, 1, 'Camomile tea (Camomile tea pcs  )', 'ea', '7.47', '44.79', '0.01%', '8', '48', '0.00%', '2020-03-20 14:22:51'),
(1264, 2, 3, 1, 'Candle numbers (Candle numbers  )', 'ea', '13.27', '3344.26', '0.45%', '13', '3276', '0.22%', '2020-03-20 14:22:51'),
(1265, 2, 3, 1, 'Candle Stick SM (Cake Candle Stick)', 'ea', '21', '399', '0.05%', '20', '380', '0.03%', '2020-03-20 14:22:51'),
(1266, 2, 3, 1, 'Cars Figurine (Cars Figurine  )', 'ea', '29.93', '418.98', '0.06%', '30', '420', '0.03%', '2020-03-20 14:22:51'),
(1267, 2, 3, 1, 'Cars styro (Cars styro  )', 'ea', '16', '31.99', '0.00%', '15', '30', '0.00%', '2020-03-20 14:22:51'),
(1268, 2, 3, 1, 'Castle styro (Castle styro  )', 'ea', '38', '0', '0.00%', '38', '0', '0.00%', '2020-03-20 14:22:51'),
(1269, 2, 3, 1, 'Cheery Baked Cake (Cheery Baked Cake slice)', 'ea', '42.5', '0', '0.00%', '42.5', '0', '0.00%', '2020-03-20 14:22:51'),
(1270, 2, 3, 1, 'Cheese Cake Flavor (Cheese Cake - 750 ml)', 'Bot', '392', '403.76', '0.05%', '392', '403.76', '0.03%', '2020-03-20 14:22:51'),
(1271, 2, 3, 1, 'Cheesecake (Cheesecake)', 'ea', '9.04', '0', '0.00%', '9.04', '0', '0.00%', '2020-03-20 14:22:51'),
(1272, 2, 3, 1, 'Chef Master Gel Black (Chef Master Gel Black  )', 'Bot', '75', '0', '0.00%', '75', '0', '0.00%', '2020-03-20 14:22:51'),
(1273, 2, 3, 1, 'Chef Master Gel Blue (Chef Master Gel Blue  )', 'Bot', '70', '0', '0.00%', '300', '0', '0.00%', '2020-03-20 14:22:51'),
(1274, 2, 3, 1, 'Chef Master Gel Brown (Chef Master Gel Brown - 28.35ML  )', 'Bot', '94.4', '0', '0.00%', '95', '0', '0.00%', '2020-03-20 14:22:51'),
(1275, 2, 3, 1, 'Chef Master Gel Green (Chef Master Gel Green  )', 'Bot', '70', '0', '0.00%', '75', '0', '0.00%', '2020-03-20 14:22:51'),
(1276, 2, 3, 1, 'Chef Master Gel Orange (Chef Master Gel Orange  )', 'Bot', '70', '0', '0.00%', '75', '0', '0.00%', '2020-03-20 14:22:51'),
(1277, 2, 3, 1, 'Chef Master Gel Pink (Chef Master Gel Pink  )', 'Bot', '94.39', '0', '0.00%', '95', '0', '0.00%', '2020-03-20 14:22:51'),
(1278, 2, 3, 1, 'Chef Master Gel Red (Chef Master Gel Red  )', 'Bot', '90.93', '0', '0.00%', '95', '0', '0.00%', '2020-03-20 14:22:51'),
(1279, 2, 3, 1, 'Chef Master Gel Violet (Chef Master Gel Violet  )', 'Bot', '90.55', '0', '0.00%', '95', '0', '0.00%', '2020-03-20 14:22:51'),
(1280, 2, 3, 1, 'Chef Master Gel Yellow (Chef Master Gel Yellow)', 'Bot', '70', '0', '0.00%', '90.55', '0', '0.00%', '2020-03-20 14:22:51'),
(1281, 2, 3, 1, 'Cherry Chilled Cake (Cherry Chilled Cake)', 'ea', '31.48', '0', '0.00%', '31.48', '0', '0.00%', '2020-03-20 14:22:51'),
(1282, 2, 3, 1, 'Cherry Square (Cherry Square)', 'ea', '25.6', '0', '0.00%', '25.6', '0', '0.00%', '2020-03-20 14:22:51'),
(1283, 2, 3, 1, 'Chobiz Choco 20s (Chobiz Choco 20s)', 'Pck', '17.35', '0', '0.00%', '17.35', '0', '0.00%', '2020-03-20 14:22:51'),
(1284, 2, 3, 1, 'Chobiz Milk 20s (Chobiz Milk 20s)', 'Pck', '17.35', '0', '0.00%', '17.35', '0', '0.00%', '2020-03-20 14:22:51'),
(1285, 2, 3, 1, 'Choc.Fudge (Choc.Fudge)', 'g', '0.3', '0', '0.00%', '0.239', '0', '0.00%', '2020-03-20 14:22:51'),
(1286, 2, 3, 1, 'Choco nuts blast 28g (Choco nuts blast 28g)', 'Pck', '5.25', '0', '0.00%', '5.25', '0', '0.00%', '2020-03-20 14:22:51'),
(1287, 2, 3, 1, 'Choco Rumbles (Choco Rumbles  )', 'ea', '17.28', '0', '0.00%', '17.28', '0', '0.00%', '2020-03-20 14:22:51'),
(1288, 2, 3, 1, 'Chocolate Decadent (Chocolate Decadent - slice)', 'ea', '46.53', '0', '0.00%', '46.53', '0', '0.00%', '2020-03-20 14:22:51'),
(1289, 2, 3, 1, 'Chocolate Fudge (Chocolate Fudge  )', 'ea', '45.84', '0', '0.00%', '45.84', '0', '0.00%', '2020-03-20 14:22:51'),
(1290, 2, 3, 1, 'Chocolate Ganache (Chocolate Ganache slice)', 'ea', '29.99', '0', '0.00%', '29.99', '0', '0.00%', '2020-03-20 14:22:51'),
(1291, 2, 3, 1, 'Chocolate Layer (Chocolate Layer)', 'ea', '39.47', '0', '0.00%', '39.47', '0', '0.00%', '2020-03-20 14:22:51'),
(1292, 2, 3, 1, 'Chocolate Powder (Chocolate Powder (500g))', 'Pck', '157.5', '0', '0.00%', '157.5', '0', '0.00%', '2020-03-20 14:22:51'),
(1293, 2, 3, 1, 'Chocolate Sprinkle (Chocolate Sprinkle   )', 'g', '0.35', '0', '0.00%', '0.357', '0', '0.00%', '2020-03-20 14:22:51'),
(1294, 2, 3, 1, 'Chocolate Square (Chocolate Square slice)', 'ea', '33.05', '165.25', '0.02%', '33.05', '165.25', '0.01%', '2020-03-20 14:22:51'),
(1295, 2, 3, 1, 'Cinderella figurine (Cinderella figurine   )', 'ea', '31.88', '0', '0.00%', '30', '0', '0.00%', '2020-03-20 14:22:51'),
(1296, 2, 3, 1, 'Clara Ole Mrshno Chrs 1050g (Clara Ole Mrshno Chrs 1050g)', 'Bot', '310.9', '0', '0.00%', '310.9', '0', '0.00%', '2020-03-20 14:22:51'),
(1297, 2, 3, 1, 'Cocktail pics (Cocktail pics packs)', 'Pck', '60.97', '0', '0.00%', '48', '0', '0.00%', '2020-03-20 14:22:51'),
(1298, 2, 3, 1, 'Coffee-3 in 1 pcs (Coffee-3 in 1 pcs)', 'ea', '2.78', '0', '0.00%', '5', '0', '0.00%', '2020-03-20 14:22:51'),
(1299, 2, 3, 1, 'Coffee beans-FROGS (Coffee beans-FROGS 500gms/pck    )', 'Pck', '490.26', '0', '0.00%', '275', '0', '0.00%', '2020-03-20 14:22:51'),
(1300, 2, 3, 1, 'Coffee Nescafe Blend &  Brew (Coffee Nescafe blend and brew 12gx 36pcs/pck   )', 'ea', '5.03', '0', '0.00%', '5.1', '0', '0.00%', '2020-03-20 14:22:51'),
(1301, 2, 3, 1, 'Coffee stick - Nescafe (Coffee stick - Nescafe (48pcsx2g)  )', 'ea', '1.76', '0', '0.00%', '1.94', '0', '0.00%', '2020-03-20 14:22:51'),
(1302, 2, 3, 1, 'Coffeemate 48/pck (Coffeemate 48/pck - pcs)', 'ea', '1.65', '477.29', '0.06%', '1.68101', '487.49', '0.03%', '2020-03-20 14:22:51'),
(1303, 2, 3, 1, 'Coffeemate pack (Coffeemate pack)', 'Pck', '80.65', '0', '0.00%', '70.54', '0', '0.00%', '2020-03-20 14:22:51'),
(1304, 2, 3, 1, 'Coke (Coke  1.5ltr  )', 'ea', '20.5', '0', '0.00%', '44.75', '0', '0.00%', '2020-03-20 14:22:51'),
(1305, 2, 3, 1, 'Coke light (Coke light cans  )', 'ea', '24.71', '0', '0.00%', '21.25', '0', '0.00%', '2020-03-20 14:22:51'),
(1306, 2, 3, 1, 'Coke regular (Coke regular  )', 'ea', '24.92', '1196', '0.16%', '20.5', '984', '0.07%', '2020-03-20 14:22:51'),
(1307, 2, 3, 1, 'Coke zero (Coke zero  )', 'ea', '23.71', '2276', '0.31%', '20.5', '1968', '0.14%', '2020-03-20 14:22:51'),
(1308, 2, 3, 1, 'Colored artistic Straw (100pcs/ (Colored artistic Straw (100pcs/pck)  )', 'ea', '0.65', '0', '0.00%', '0.65', '0', '0.00%', '2020-03-20 14:22:51'),
(1309, 2, 3, 1, 'Colored Butterfly (assorted) (Colored Butterfly (assorted)  )', 'ea', '10', '0', '0.00%', '10', '0', '0.00%', '2020-03-20 14:22:51'),
(1310, 2, 3, 1, 'Cream O Vanilla ( Pck 10s ) (Cream O Vanilla ( Pck 10s ))', 'Pck', '59.45', '77.28', '0.01%', '59.45', '77.29', '0.01%', '2020-03-20 14:22:51'),
(1311, 2, 3, 1, 'Cream O Vanilla 90g (Cream O Vanilla 90g)', 'Pck', '16.98', '0', '0.00%', '19.1', '0', '0.00%', '2020-03-20 14:22:51'),
(1312, 2, 3, 1, 'Creme De Cacao (Creme De Cacao-750 ml)', 'Bot', '392', '490', '0.07%', '392', '490', '0.03%', '2020-03-20 14:22:51'),
(1313, 2, 3, 1, 'Cup Cake (Cup Cake)', 'ea', '5.42', '0', '0.00%', '6.81', '0', '0.00%', '2020-03-20 14:22:51'),
(1314, 2, 3, 1, 'Dad Bear Black Pearl Straw (Dad Bear Black Pearl Straw)', 'ea', '1.6', '0', '0.00%', '1.6', '0', '0.00%', '2020-03-20 14:22:51'),
(1315, 2, 3, 1, 'Dark Chocolate Sauce ml (Dark Chocolate Sauce - 1890ml/bot)', 'ml', '0.37', '708.02', '0.10%', '0.3746', '707.99', '0.05%', '2020-03-20 14:22:51'),
(1316, 2, 3, 1, 'Disposable Cups 1 pack (Disposable Cups 25 psc/pack)', 'Pck', '195', '0', '0.00%', '195', '0', '0.00%', '2020-03-20 14:22:51'),
(1317, 2, 3, 1, 'Distilled water - gal (Distilled water  )', 'Gal', '15', '0', '0.00%', '15', '0', '0.00%', '2020-03-20 14:22:51'),
(1318, 2, 3, 1, 'DM Four Season (DM Four Season)', 'ea', '24.29', '1772.87', '0.24%', '24.28583', '1772.87', '0.12%', '2020-03-20 14:22:51'),
(1319, 2, 3, 1, 'DM mango juice (DM mango juice  )', 'ea', '29.05', '2033.34', '0.27%', '23.33333', '1633.33', '0.11%', '2020-03-20 14:22:51'),
(1320, 2, 3, 1, 'DM orange juice (DM orange juice  )', 'ea', '24.29', '1772.87', '0.24%', '21.42833', '1564.27', '0.11%', '2020-03-20 14:22:51'),
(1321, 2, 3, 1, 'DM Pineapple 240ml(24cans/bot) (DM Pineapple 240ml(24cans/bot) Sweetened)', 'can', '23.33', '840', '0.11%', '21.905', '788.58', '0.05%', '2020-03-20 14:22:51'),
(1322, 2, 3, 1, 'DM pineapple juice (DM pineapple juice Unsweetened  )', 'can', '24.29', '1894.29', '0.26%', '21.42833', '1671.41', '0.11%', '2020-03-20 14:22:51'),
(1323, 2, 3, 1, 'DM pineapple orange (DM pineapple orange  )', 'can', '24.29', '1165.72', '0.16%', '24.28583', '1165.72', '0.08%', '2020-03-20 14:22:51'),
(1324, 2, 3, 1, 'DM Sweet Blend Ketchup 320g (DM Sweet Blend Ketchup 320g)', 'Bot', '33.13', '0', '0.00%', '31.75', '0', '0.00%', '2020-03-20 14:22:51'),
(1325, 2, 3, 1, 'DM Sweetened Orange (DM Sweetened Orange)', 'can', '24.29', '0', '0.00%', '24.28583', '0', '0.00%', '2020-03-20 14:22:51'),
(1326, 2, 3, 1, 'Donut Shop (Donut Shop)', 'ea', '22.35', '402.3', '0.05%', '22.35', '402.3', '0.03%', '2020-03-20 14:22:51'),
(1327, 2, 3, 1, 'Dukes Stickman Choco 130g (Dukes Stickman Choco 130g)', 'Pck', '100.35', '0', '0.00%', '100.35', '0', '0.00%', '2020-03-20 14:22:51'),
(1328, 2, 3, 1, 'Dummy Cake 12x12 (Dummy Cake 12x12)', 'ea', '163.63', '0', '0.00%', '237.26', '0', '0.00%', '2020-03-20 14:22:51'),
(1329, 2, 3, 1, 'Dummy Cake 12x16 (Dummy Cake 12x16)', 'ea', '234.3', '0', '0.00%', '339.74', '0', '0.00%', '2020-03-20 14:22:51'),
(1330, 2, 3, 1, 'Dummy Cake 8x12 (Dummy Cake 8x12)', 'ea', '128.15', '0', '0.00%', '185.82', '0', '0.00%', '2020-03-20 14:22:51'),
(1331, 2, 3, 1, 'Earl gray tea (Earl gray tea - pcs  )', 'ea', '5.6', '84', '0.01%', '8', '120', '0.01%', '2020-03-20 14:22:51'),
(1332, 2, 3, 1, 'Egg Pie (Egg Pie  )', 'ea', '18.75', '0', '0.00%', '18.75', '0', '0.00%', '2020-03-20 14:22:51'),
(1333, 2, 3, 1, 'Eight O\'clock 175grms (Eight oclock juice powder (175grms/pck))', 'Pck', '45.96', '0', '0.00%', '45.675', '0', '0.00%', '2020-03-20 14:22:51'),
(1334, 2, 3, 1, 'Eight oclock juice powder (Eight oclock juice powder - 350grms)', 'Pck', '91.35', '0', '0.00%', '91.35', '0', '0.00%', '2020-03-20 14:22:51'),
(1335, 2, 3, 1, 'English breakfast tea (English breakfast tea  )', 'ea', '5.6', '100.8', '0.01%', '8', '144', '0.01%', '2020-03-20 14:22:51'),
(1336, 2, 3, 1, 'Equal Powder 12G (Equal Powder 12G)', 'Pck', '137.95', '0', '0.00%', '33.45', '0', '0.00%', '2020-03-20 14:22:51'),
(1337, 2, 3, 1, 'Equal sugar (Equal sugar  )', 'ea', '1.47', '563.45', '0.08%', '2.65833', '1018.14', '0.07%', '2020-03-20 14:22:51'),
(1338, 2, 3, 1, 'Euro Water 500ml (Euro Water 500m (Euro Water 500ml  )  )', 'Bot', '6.5', '16880.5', '2.28%', '5.5', '14283.5', '0.98%', '2020-03-20 14:22:51'),
(1339, 2, 3, 1, 'Evening Blend (Evening Blend)', 'g', '0.7', '4549.73', '0.61%', '0.695', '4517.5', '0.31%', '2020-03-20 14:22:51'),
(1340, 2, 3, 1, 'Flowerets Colored (Flowerets Colored   )', 'ea', '16.82', '3279.4', '0.44%', '15', '2925', '0.20%', '2020-03-20 14:22:51'),
(1341, 2, 3, 1, 'Frappe Caffe Latte (Frappe Caffe Latte-1360/pck)', 'g', '0.77', '2872.06', '0.39%', '1.4558', '5415.58', '0.37%', '2020-03-20 14:22:51'),
(1342, 2, 3, 1, 'Frappe Mix Java Chip (Frappe Mix Java Chip-1360g/pck)', 'g', '0.77', '2265.99', '0.31%', '0.7279', '2136.39', '0.15%', '2020-03-20 14:22:51'),
(1343, 2, 3, 1, 'French fries (French fries  )', 'Pck', '95', '950', '0.13%', '108', '1080', '0.07%', '2020-03-20 14:22:51'),
(1344, 2, 3, 1, 'French Fries (2kg) (French Fries (2kg))', 'Pck', '172.85', '458.06', '0.06%', '187', '495.55', '0.03%', '2020-03-20 14:22:51'),
(1345, 2, 3, 1, 'Garlic stick bread (Garlic stick bread - grms  )', 'g', '0.09', '0', '0.00%', '0.09', '0', '0.00%', '2020-03-20 14:22:51'),
(1346, 2, 3, 1, 'Green Tea (Green tea  )', 'ea', '5.6', '33.6', '0.01%', '8', '48', '0.00%', '2020-03-20 14:22:51'),
(1347, 2, 3, 1, 'Gum Paste (Gum Paste)', 'kls', '250', '0', '0.00%', '345', '0', '0.00%', '2020-03-20 14:22:51'),
(1348, 2, 3, 1, 'GV Shake Powder Cookies& Cream (GV Shake Powder Cookies& Cream)', 'Pck', '26.75', '0', '0.00%', '26.75', '0', '0.00%', '2020-03-20 14:22:51'),
(1349, 2, 3, 1, 'GV Shake Powder Strawberry (GV Shake Powder Strawberry  )', 'Pck', '26.75', '428', '0.06%', '26.75', '428', '0.03%', '2020-03-20 14:22:51'),
(1350, 2, 3, 1, 'Happy birthday cake (Happy birthday cake)', 'ea', '172.4', '0', '0.00%', '172.4', '0', '0.00%', '2020-03-20 14:22:51'),
(1351, 2, 3, 1, 'Happy birthday Candle (Happy birthday Candle   )', 'set', '50', '0', '0.00%', '50', '0', '0.00%', '2020-03-20 14:22:51'),
(1352, 2, 3, 1, 'Happy birthday Styro (Happy birthday Styro)', 'ea', '15', '450', '0.06%', '14', '420', '0.03%', '2020-03-20 14:22:51'),
(1353, 2, 3, 1, 'Hello Kitty Figurine (Hello Kitty Figurine)', 'ea', '31.87', '1593.55', '0.22%', '25', '1250', '0.09%', '2020-03-20 14:22:51'),
(1354, 2, 3, 1, 'Hello Kitty styro (Hello Kitty styro  )', 'ea', '15.75', '188.95', '0.03%', '25', '300', '0.02%', '2020-03-20 14:22:51'),
(1355, 2, 3, 1, 'Herbal Pillow - Patch Shoulder (Herbal Pillow - Patch Shoulder  )', 'ea', '858', '0', '0.00%', '858', '0', '0.00%', '2020-03-20 14:22:51'),
(1356, 2, 3, 1, 'Herbal Pillow - Waist (Herbal Pillow - Waist  )', 'ea', '972', '0', '0.00%', '972', '0', '0.00%', '2020-03-20 14:22:51'),
(1357, 2, 3, 1, 'Hot sauce-MB 100ml/Bot (Hot sauce-MB 100ml/Bot)', 'Bot', '32.92', '0', '0.00%', '32.92', '0', '0.00%', '2020-03-20 14:22:51'),
(1358, 2, 3, 1, 'Hugh Blend (Hugh Blend)', 'ea', '19.25', '0', '0.00%', '19.25', '0', '0.00%', '2020-03-20 14:22:51'),
(1359, 2, 3, 1, 'Ice Cubes - pck (Ice Cubes - pck)', 'Pck', '18', '0', '0.00%', '25', '0', '0.00%', '2020-03-20 14:22:51'),
(1360, 2, 3, 1, 'Ice Tea Nestea 450gms/pck (Ice tea- Nestea -pck (450grms/pck )  )', 'Pck', '98.65', '0', '0.00%', '99.1', '0', '0.00%', '2020-03-20 14:22:51'),
(1361, 2, 3, 1, 'Icing (Icing)', 'g', '0.2', '400', '0.05%', '0.2', '400', '0.03%', '2020-03-20 14:22:51'),
(1362, 2, 3, 1, 'Irish cream (Irish cream-750ml)', 'Bot', '392', '795.76', '0.11%', '392', '795.76', '0.05%', '2020-03-20 14:22:51'),
(1363, 2, 3, 1, 'Italian coffee beans (Italian coffee beans - packs 500grms  )', 'Pck', '408', '0', '0.00%', '408', '0', '0.00%', '2020-03-20 14:22:51'),
(1364, 2, 3, 1, 'Jufran Red Hot Chili Sauce 100g (Jufran Red Hot Chili Sauce 100g)', 'Bot', '40.25', '0', '0.00%', '20.29167', '0', '0.00%', '2020-03-20 14:22:51'),
(1365, 2, 3, 1, 'Kaizer buns small (Kaizer buns small  )', 'ea', '5.78', '46.24', '0.01%', '5.78', '46.24', '0.00%', '2020-03-20 14:22:51'),
(1366, 2, 3, 1, 'Kopiko La Cafe 25gx10s (Kopiko La Cafe 25gx10s)', 'ea', '5.1', '0', '0.00%', '4.675', '0', '0.00%', '2020-03-20 14:22:51'),
(1367, 2, 3, 1, 'Lady figurine (Lady figurine   )', 'ea', '30', '0', '0.00%', '30', '0', '0.00%', '2020-03-20 14:22:51'),
(1368, 2, 3, 1, 'Lemon Grass (Lemon Grass)', 'Bundle', '10', '0', '0.00%', '10', '0', '0.00%', '2020-03-20 14:22:51'),
(1369, 2, 3, 1, 'Lemon Grass Mix (Lemon Grass Mix)', 'Ltr', '62.55', '0', '0.00%', '62.5', '0', '0.00%', '2020-03-20 14:22:51'),
(1370, 2, 3, 1, 'Liquid seasoning small (Liquid seasoning small  )', 'Bot', '26.43', '0', '0.00%', '26.43', '0', '0.00%', '2020-03-20 14:22:51'),
(1371, 2, 3, 1, 'Macademia Nut (Macademia Nut-750 ml)', 'Bot', '392', '588', '0.08%', '392', '588', '0.04%', '2020-03-20 14:22:51'),
(1372, 2, 3, 1, 'Maggi savor 130ml (Maggi savor 130ml)', 'Bot', '35.45', '673.63', '0.09%', '29.5', '560.5', '0.04%', '2020-03-20 14:22:51'),
(1373, 2, 3, 1, 'Mango chilled (Mango chilled  )', 'ea', '46.51', '0', '0.00%', '46.51', '0', '0.00%', '2020-03-20 14:22:51'),
(1374, 2, 3, 1, 'Mapple syrup 355ml/bot (Mapple syrup 355ml/bot    )', 'Bot', '87.21', '0', '0.00%', '87.2', '0', '0.00%', '2020-03-20 14:22:51'),
(1375, 2, 3, 1, 'Mermaid Figurine - Local (Mermaid Figurine - Local)', 'ea', '30', '30', '0.00%', '30', '30', '0.00%', '2020-03-20 14:22:51'),
(1376, 2, 3, 1, 'Mermaid styro (Mermaid styro   )', 'ea', '15', '0', '0.00%', '15', '0', '0.00%', '2020-03-20 14:22:51'),
(1377, 2, 3, 1, 'Mickey Figurine (Mickey Figurine)', 'ea', '31.94', '2076.08', '0.28%', '30', '1950', '0.13%', '2020-03-20 14:22:51'),
(1378, 2, 3, 1, 'Mickey Styro (Mickey Styro)', 'ea', '15', '0', '0.00%', '15', '0', '0.00%', '2020-03-20 14:22:51'),
(1379, 2, 3, 1, 'Minions Figurine (Minions Figurine)', 'ea', '25', '0', '0.00%', '25', '0', '0.00%', '2020-03-20 14:22:51'),
(1380, 2, 3, 1, 'Moistcake small Whole (Moistcake small  )', 'ea', '119.15', '0', '0.00%', '119.15', '0', '0.00%', '2020-03-20 14:22:51'),
(1381, 2, 3, 1, 'Moistcake Whole (Moistcake big  )', 'ea', '305.5', '0', '0.00%', '305.5', '0', '0.00%', '2020-03-20 14:22:51'),
(1382, 2, 3, 1, 'Muscovado (Muscovado  )', 'g', '0.05', '52', '0.01%', '0.052', '52', '0.00%', '2020-03-20 14:22:51'),
(1383, 2, 3, 1, 'Nestea Apple 450g (Nestea Apple 450g)', 'Pck', '169.95', '0', '0.00%', '169.95', '0', '0.00%', '2020-03-20 14:22:51'),
(1384, 2, 3, 1, 'Nestea Honey Blend 450g (Nestea Honey Blend 450g)', 'Pck', '171.31', '0', '0.00%', '99.1', '0', '0.00%', '2020-03-20 14:22:51'),
(1385, 2, 3, 1, 'Nestea House Blend 200g (Nestea House Blend 200g)', 'Pck', '189.53', '1800.49', '0.24%', '189.526', '1800.5', '0.12%', '2020-03-20 14:22:51'),
(1386, 2, 3, 1, 'Nestea Rest Blend 360g (Nestea Rest Blend 360g)', 'Pck', '171.31', '0', '0.00%', '171.31', '0', '0.00%', '2020-03-20 14:22:51'),
(1387, 2, 3, 1, 'Nips white Chocolate Snack 40s (Nips white Chocolate Snack 40s)', 'Pck', '20.1', '0', '0.00%', '20.1', '0', '0.00%', '2020-03-20 14:22:51'),
(1388, 2, 3, 1, 'Orange (Orange  )', 'ea', '20.49', '471.17', '0.06%', '15', '345', '0.02%', '2020-03-20 14:22:51'),
(1389, 2, 3, 1, 'Oreo-9s/pck (Oreo biscuit 9pcs/pack(9pcksx29.4g)nt wt 264.6g  )', 'Pck', '51.96', '0', '0.00%', '64.6', '0', '0.00%', '2020-03-20 14:22:51'),
(1390, 2, 3, 1, 'Oreo biscuit (Oreo biscuit  )', 'Pck', '35.05', '0', '0.00%', '64.6', '0', '0.00%', '2020-03-20 14:22:51'),
(1391, 2, 3, 1, 'OREO Double Tap (OREO Double (pack) (152.4grms))', 'Pck', '41.5', '0', '0.00%', '38.85', '0', '0.00%', '2020-03-20 14:22:51'),
(1392, 2, 3, 1, 'OREO Stawberry (OREO Stawberry (137g))', 'Pck', '37.45', '0', '0.00%', '35.1', '0', '0.00%', '2020-03-20 14:22:51'),
(1393, 2, 3, 1, 'OREO Vanilla (OREO Vanilla (137g))', 'Pck', '37.45', '0', '0.00%', '35.1', '0', '0.00%', '2020-03-20 14:22:51'),
(1394, 2, 3, 1, 'Pike Place (Pike Place)', 'ea', '30.32', '60.64', '0.01%', '30.32', '60.64', '0.00%', '2020-03-20 14:22:51'),
(1395, 2, 3, 1, 'Plastic Leaves (Plastic Leaves(2 pcs per pck))', 'ea', '7.01', '350.6', '0.05%', '10', '500', '0.03%', '2020-03-20 14:22:51'),
(1396, 2, 3, 1, 'Precut tissue (Precut tissue  )', 'Pck', '84.91', '169.81', '0.02%', '77.39', '154.78', '0.01%', '2020-03-20 14:22:51'),
(1397, 2, 3, 1, 'Precut Tissue 2000s (Precut Tissue 2000s)', 'ea', '0.21', '425', '0.06%', '0.1875', '375', '0.03%', '2020-03-20 14:22:51'),
(1398, 2, 3, 1, 'Pretzels Berry Knots 28g (Pretzels Berry Knots 28g)', 'ea', '5.25', '0', '0.00%', '5.25', '0', '0.00%', '2020-03-20 14:22:51'),
(1399, 2, 3, 1, 'Princess Figurine (Princess Figurine  )', 'ea', '30', '2070', '0.28%', '30', '2070', '0.14%', '2020-03-20 14:22:51'),
(1400, 2, 3, 1, 'Quaker Oats 400g (Quaker Oats 400g  )', 'Pck', '52.5', '0', '0.00%', '49.35', '0', '0.00%', '2020-03-20 14:22:51'),
(1401, 2, 3, 1, 'Rainbow sprinkles (Rainbow sprinkles  )', 'g', '0.35', '350', '0.05%', '0.35', '350', '0.02%', '2020-03-20 14:22:51'),
(1402, 2, 3, 1, 'Red cherry (Red cherry  )', 'can', '193.58', '0', '0.00%', '188', '0', '0.00%', '2020-03-20 14:22:51'),
(1403, 2, 3, 1, 'Red wine (Moreaw & Fils) -750ml (Red wine (Moreaw & Fils) - 750ml/bot  )', 'Bot', '381.67', '0', '0.00%', '381.7', '0', '0.00%', '2020-03-20 14:22:51'),
(1404, 2, 3, 1, 'Royal Tru Orange 330mlx24 (Royal Tru Orange 330mlx24)', 'can', '24.92', '2392', '0.32%', '24.92', '2392.32', '0.16%', '2020-03-20 14:22:51'),
(1405, 2, 3, 1, 'Sago Straw Black (Sago Straw Black)', 'ea', '0.21', '10.75', '0.00%', '0.7', '36.4', '0.00%', '2020-03-20 14:22:51'),
(1406, 2, 3, 1, 'San Fransisco Bay (San Fransisco Bay)', 'ea', '15.59', '0', '0.00%', '15.59', '0', '0.00%', '2020-03-20 14:22:51'),
(1407, 2, 3, 1, 'San miguel pilsen (San miguel pilsen  )', 'can', '41.23', '0', '0.00%', '36.6', '0', '0.00%', '2020-03-20 14:22:51'),
(1408, 2, 3, 1, 'Snow white figurine (Snow white figurine  )', 'ea', '35.37', '0', '0.00%', '60', '0', '0.00%', '2020-03-20 14:22:51'),
(1409, 2, 3, 1, 'Sofia 1st figurine (Sofia 1st figurine  )', 'ea', '32.31', '1195.58', '0.16%', '60', '2220', '0.15%', '2020-03-20 14:22:51'),
(1410, 2, 3, 1, 'Spiderman Figurine (Spiderman Figurine)', 'ea', '32.28', '193.68', '0.03%', '30', '180', '0.01%', '2020-03-20 14:22:51'),
(1411, 2, 3, 1, 'Spiderman styro (Spiderman styro  )', 'ea', '16', '0', '0.00%', '15', '0', '0.00%', '2020-03-20 14:22:51'),
(1412, 2, 3, 1, 'Spongebob Figurine (Spongebob Figurine)', 'ea', '40.96', '122.89', '0.02%', '60', '180', '0.01%', '2020-03-20 14:22:51'),
(1413, 2, 3, 1, 'Spongebob styro (Spongebob styro  )', 'ea', '15', '60', '0.01%', '15', '60', '0.00%', '2020-03-20 14:22:51'),
(1414, 2, 3, 1, 'Sprite in can (Sprite in can  )', 'can', '24.92', '2392', '0.32%', '20.5', '1968', '0.14%', '2020-03-20 14:22:51'),
(1415, 2, 3, 1, 'Stick-O Jr Choco 380g (Stick-O Jr Choco 380g)', 'Tumbler', '109.53', '0', '0.00%', '56.2', '0', '0.00%', '2020-03-20 14:22:51'),
(1416, 2, 3, 1, 'Stick - O Big Choco (Stick-O Big Choco 850g)', 'Tumbler', '109.49', '77.74', '0.01%', '109.5', '77.75', '0.01%', '2020-03-20 14:22:51'),
(1417, 2, 3, 1, 'Stirrer (Stirrer  )', 'ea', '0.2', '0', '0.00%', '0.201', '0', '0.00%', '2020-03-20 14:22:51'),
(1418, 2, 3, 1, 'Straw-Artistic (Straw-Artistic  )', 'ea', '0.43', '129.03', '0.02%', '1.04', '314.08', '0.02%', '2020-03-20 14:22:51'),
(1419, 2, 3, 1, 'Sugar take out (Sugar take out  )', 'ea', '3.4', '0', '0.00%', '0.85833', '0', '0.00%', '2020-03-20 14:22:51'),
(1420, 2, 3, 1, 'Superman Figurine (Superman Figurine)', 'ea', '33.48', '1506.68', '0.20%', '60', '2700', '0.19%', '2020-03-20 14:22:51'),
(1421, 2, 3, 1, 'Superman Styro (Superman Styro)', 'ea', '15.6', '265.13', '0.04%', '15', '255', '0.02%', '2020-03-20 14:22:51'),
(1422, 2, 3, 1, 'SuperStick (Stick O (superstick)  (100pcs/tumbler)  )', 'ea', '0.49', '0', '0.00%', '0.9815', '0', '0.00%', '2020-03-20 14:22:51'),
(1423, 2, 3, 1, 'Susan Baker Sliced Mushroom 400 (Susan Baker Sliced Mushroom 400)', 'can', '47.96', '359.71', '0.05%', '46.75', '350.63', '0.02%', '2020-03-20 14:22:51'),
(1424, 2, 3, 1, 'Tigerstix Choco 315g (Tigerstix Choco 315g)', 'Pck', '41.8', '0', '0.00%', '41.8', '0', '0.00%', '2020-03-20 14:22:51'),
(1425, 2, 3, 1, 'Tinker bell Figurine (Tinker bell Figurine)', 'ea', '32', '448', '0.06%', '60', '840', '0.06%', '2020-03-20 14:22:51'),
(1426, 2, 3, 1, 'Tinker bell styro (Tinker bell styro  )', 'ea', '16', '192', '0.03%', '15', '180', '0.01%', '2020-03-20 14:22:51'),
(1427, 2, 3, 1, 'Toasted mallows-Torani (Toasted mallows-Torani - 750ml  )', 'Bot', '392', '0', '0.00%', '392', '0', '0.00%', '2020-03-20 14:22:51'),
(1428, 2, 3, 1, 'Toothpick (Toothpick  )', 'ea', '0.53', '0', '0.00%', '0.5275', '0', '0.00%', '2020-03-20 14:22:51'),
(1429, 2, 3, 1, 'Toothpick Crown Chef (Toothpick Crown chef)', 'ea', '0.09', '170', '0.02%', '0.085', '170', '0.01%', '2020-03-20 14:22:51'),
(1430, 2, 3, 1, 'Torani - Peppermint (Peppermint 750ml  )', 'Bot', '392', '0', '0.00%', '392', '0', '0.00%', '2020-03-20 14:22:51'),
(1431, 2, 3, 1, 'Torani Almond Rocca 750ml (Torani Almond Rocca 750ml)', 'Bot', '392', '493.92', '0.07%', '392', '493.92', '0.03%', '2020-03-20 14:22:51'),
(1432, 2, 3, 1, 'Torani Hazelnut 750ml (Torani Hazelnut 750ml)', 'ml', '0.52', '392.07', '0.05%', '0.52', '390.07', '0.03%', '2020-03-20 14:22:51'),
(1433, 2, 3, 1, 'Umbrella Pics (Umbrella Pics  )', 'Pck', '146.4', '292.79', '0.04%', '146.4', '292.8', '0.02%', '2020-03-20 14:22:51'),
(1434, 2, 3, 1, 'Waterrade (Waterrade  )', 'Bot', '7.92', '0', '0.00%', '7.92', '0', '0.00%', '2020-03-20 14:22:51'),
(1435, 2, 3, 1, 'White straw (White straw  )', 'ea', '0.19', '309.51', '0.04%', '0.27', '439.83', '0.03%', '2020-03-20 14:22:51'),
(1436, 2, 3, 1, 'White Sugar (7g (100pcs/pack) (White Sugar (7g (100pcs/pack))', 'ea', '0.69', '50.58', '0.01%', '0.693', '50.59', '0.00%', '2020-03-20 14:22:51'),
(1437, 2, 4, 1, 'Solaine-11kls (Solaine-11kls  )', 'kls', '0', '0', '0.00%', '907', '0', '0.00%', '2020-03-20 14:24:26'),
(1438, 2, 4, 1, 'Solaine-50kls (Solaine-50kls  )', 'Tank', '1796.42', '0', '0.00%', '3570', '0', '0.00%', '2020-03-20 14:24:26'),
(1439, 2, 5, 1, 'A1 steak sauce (A1 steak sauce (142 gms/bot)      )', 'Bot', '150.61', '0', '0.00%', '150', '0', '0.00%', '2020-03-20 14:27:03'),
(1440, 2, 5, 1, 'A1 steak sauce 283ml (A1 steak sauce (283 gms/bot)      )  )', 'Bot', '282', '0', '0.00%', '225', '0', '0.00%', '2020-03-20 14:27:03'),
(1441, 2, 5, 1, 'All purpose cream (All purpose cream  )', 'Pck', '55.73', '835.91', '0.11%', '46.16833', '692.52', '0.05%', '2020-03-20 14:27:03'),
(1442, 2, 5, 1, 'All spice (All spice 32 gms/bot    )', 'Bot', '62.4', '0', '0.00%', '62.4', '0', '0.00%', '2020-03-20 14:27:03'),
(1443, 2, 5, 1, 'Almond slice (Almond slice 100gms/pck    )', 'Pck', '96.97', '231.77', '0.03%', '107.5', '256.93', '0.02%', '2020-03-20 14:27:03'),
(1444, 2, 5, 1, 'Almond slice 170g (Almond slice (Almond slice 170gms/pck    )    )', 'g', '2.38', '0', '0.00%', '2.35265', '0', '0.00%', '2020-03-20 14:27:03'),
(1445, 2, 5, 1, 'Aluminum foil Reynolds (Aluminum foil Reynolds)', 'Rlls', '100', '117', '0.02%', '100', '117', '0.01%', '2020-03-20 14:27:03'),
(1446, 2, 5, 1, 'Anchovies (Anchovies 365gms/can    )', 'can', '558.59', '0', '0.00%', '558.35', '0', '0.00%', '2020-03-20 14:27:03'),
(1447, 2, 5, 1, 'Apple (Apple  )', 'ea', '23.69', '118.46', '0.02%', '50', '250', '0.02%', '2020-03-20 14:27:03'),
(1448, 2, 5, 1, 'Arbol Chili 5oz (Arbol Chili 5oz)', 'Bot', '89.95', '0', '0.00%', '89.95', '0', '0.00%', '2020-03-20 14:27:03'),
(1449, 2, 5, 1, 'Argenina Corn Beef (Gold Label) (Argenina Corn Beef (Gold Label) 150g  )', 'can', '33.25', '0', '0.00%', '46', '0', '0.00%', '2020-03-20 14:27:03'),
(1450, 2, 5, 1, 'Asparagus (Asparagus  )', 'kls', '214', '0', '0.00%', '120', '0', '0.00%', '2020-03-20 14:27:03'),
(1451, 2, 5, 1, 'Baby carrots (Baby carrots  )', 'g', '0.03', '0', '0.00%', '0.088', '0', '0.00%', '2020-03-20 14:27:03'),
(1452, 2, 5, 1, 'Bacon (Bacon)', 'g', '0.39', '3575.2', '0.48%', '0.36', '3276', '0.22%', '2020-03-20 14:27:03'),
(1453, 2, 5, 1, 'Balsamic Vinegar 500ml/bot (Balsamic Vinegar 500ml/bot  )', 'Bot', '210.19', '0', '0.00%', '246.7', '0', '0.00%', '2020-03-20 14:27:03'),
(1454, 2, 5, 1, 'Bariles', 'g', '0.35', '0', '0.00%', '0.38', '0', '0.00%', '2020-03-20 14:27:03'),
(1455, 2, 5, 1, 'Beef & herbs gravy (Beef & herbs gravy 30gms pcks    )', 'ea', '20.93', '0', '0.00%', '20.95', '0', '0.00%', '2020-03-20 14:27:03'),
(1456, 2, 5, 1, 'Beef cubes (Beef cubes 10gms/pc    )', 'ea', '4.33', '0', '0.00%', '4.73', '0', '0.00%', '2020-03-20 14:27:03'),
(1457, 2, 5, 1, 'Bell Pepper (Bell Pepper)', 'g', '0.12', '0', '0.00%', '0.14', '0', '0.00%', '2020-03-20 14:27:03'),
(1458, 2, 5, 1, 'Best Yet Swt Ghrkns 16oz (Best Yet Swt Ghrkns 16oz)', 'Bot', '179.95', '0', '0.00%', '0', '0', '0.00%', '2020-03-20 14:27:03'),
(1459, 2, 5, 1, 'Bihon special (Bihon special)', 'Pck', '25.35', '141.72', '0.02%', '16.2', '90.56', '0.01%', '2020-03-20 14:27:03'),
(1460, 2, 5, 1, 'Black mushroom-shitake (Black mushroom-shitake 284gms    )', 'Bot', '50.95', '0', '0.00%', '50.95', '0', '0.00%', '2020-03-20 14:27:03'),
(1461, 2, 5, 1, 'Black olive slice (Black olive slice 330gms bot    )', 'Bot', '84', '84', '0.01%', '86.55', '86.55', '0.01%', '2020-03-20 14:27:03'),
(1462, 2, 5, 1, 'Black Pepper (Black Pepper 1kl/pck)', 'g', '0.97', '292.49', '0.04%', '0.73', '219', '0.02%', '2020-03-20 14:27:03'),
(1463, 2, 5, 1, 'Burger Patty 225g (El RanchoBurger Patty 225g)', 'Pck', '45.1', '0', '0.00%', '45.1', '0', '0.00%', '2020-03-20 14:27:03');
INSERT INTO `eb_raw_materials` (`PK_raw_materials_id`, `FK_outlet_id`, `FK_category_id`, `status`, `material_name`, `unit`, `average_cost`, `asset_value`, `total_asset_percent`, `sales_price`, `retail_value`, `total_retail_percent`, `date_added`) VALUES
(1464, 2, 5, 1, 'Burger Wrapper 100\'s (Wellfresh Hamburger Wrapper 100s/pck)', 'ea', '0.63', '0', '0.00%', '0.6275', '0', '0.00%', '2020-03-20 14:27:03'),
(1465, 2, 5, 1, 'Cabbage (Cabbage - grmas)', 'g', '0.04', '0', '0.00%', '0.09095', '0', '0.00%', '2020-03-20 14:27:03'),
(1466, 2, 5, 1, 'Caesar dressing (Caesar dressing  )', 'g', '0.37', '0', '0.00%', '0.37', '0', '0.00%', '2020-03-20 14:27:03'),
(1467, 2, 5, 1, 'Capers 340grms (Capers 340grms - bottle)', 'Bot', '138.7', '138.7', '0.02%', '141.45', '141.45', '0.01%', '2020-03-20 14:27:03'),
(1468, 2, 5, 1, 'Carrots (Carrots)', 'g', '0.05', '19.4', '0.00%', '0.05', '19', '0.00%', '2020-03-20 14:27:03'),
(1469, 2, 5, 1, 'Cellophane (8x14) (Cellophane (8x14))', 'Pck', '29.7', '0', '0.00%', '16.5', '0', '0.00%', '2020-03-20 14:27:03'),
(1470, 2, 5, 1, 'CenturyTuna 184grms (Tuna 184grms)', 'can', '52.04', '0', '0.00%', '51.5', '0', '0.00%', '2020-03-20 14:27:03'),
(1471, 2, 5, 1, 'Cheese Powder 250gms (Cheese Powder pck 250gms/pck    )', 'Pck', '30.59', '13.46', '0.00%', '56.9', '25.04', '0.00%', '2020-03-20 14:27:03'),
(1472, 2, 5, 1, 'Cheese Powder pck (Cheese Powder - 100gms/pck  )', 'Pck', '47.14', '565.65', '0.08%', '51', '612', '0.04%', '2020-03-20 14:27:03'),
(1473, 2, 5, 1, 'Cherry Tomato (Cherry Tomato)', 'g', '0.15', '0', '0.00%', '0.02', '0', '0.00%', '2020-03-20 14:27:03'),
(1474, 2, 5, 1, 'Cherry Tomatoe (Cherry Tomatoe  )', 'g', '0.2', '0', '0.00%', '0.15', '0', '0.00%', '2020-03-20 14:27:03'),
(1475, 2, 5, 1, 'Chicharon 60g (Chicharon 60g)', 'Pck', '60', '60', '0.01%', '36', '36', '0.00%', '2020-03-20 14:27:03'),
(1476, 2, 5, 1, 'Chicken Breast Fillet (Chicken Breast Fillet)', 'kls', '265', '0', '0.00%', '0', '0', '0.00%', '2020-03-20 14:27:03'),
(1477, 2, 5, 1, 'Chicken cubes (Chicken cubes  )', 'ea', '4.32', '2154.16', '0.29%', '5.21', '2599.79', '0.18%', '2020-03-20 14:27:03'),
(1478, 2, 5, 1, 'Chicken Powder (Chicken Powder)', 'g', '0.35', '593.13', '0.08%', '0.336', '568.51', '0.04%', '2020-03-20 14:27:03'),
(1479, 2, 5, 1, 'Chicken Wings (Chicken Wings)', 'kls', '139.97', '0', '0.00%', '138', '0', '0.00%', '2020-03-20 14:27:03'),
(1480, 2, 5, 1, 'Chili Powder Pcks (Chili Powder Pcks 50gms  )', 'Pck', '79', '0', '0.00%', '79', '0', '0.00%', '2020-03-20 14:27:03'),
(1481, 2, 5, 1, 'Chip Boad (Chip Boad  )', 'ea', '19', '285', '0.04%', '16', '240', '0.02%', '2020-03-20 14:27:03'),
(1482, 2, 5, 1, 'Chopsoy Patis 750ml (Chopsoy Patis 750ml)', 'Bot', '26.5', '0', '0.00%', '26.5', '0', '0.00%', '2020-03-20 14:27:03'),
(1483, 2, 5, 1, 'Clams (Clams kls)', 'g', '0.03', '0', '0.00%', '0.04', '0', '0.00%', '2020-03-20 14:27:03'),
(1484, 2, 5, 1, 'Clara Ole Carbonara Pasta (Clara Ole Carbonara Pasta 200g)', 'Pck', '30.75', '0', '0.00%', '30.75', '0', '0.00%', '2020-03-20 14:27:03'),
(1485, 2, 5, 1, 'Clara Ole Marinated Hickery 225 (Clara Ole Marinated Hickery 225)', 'Bot', '35.85', '0', '0.00%', '0', '0', '0.00%', '2020-03-20 14:27:03'),
(1486, 2, 5, 1, 'Coco Milk (Coconut Mik(g))', 'g', '0.03', '90', '0.01%', '0.1', '300', '0.02%', '2020-03-20 14:27:03'),
(1487, 2, 5, 1, 'Colicot (Colicot)', 'g', '0.09', '17.83', '0.00%', '0.12', '24.08', '0.00%', '2020-03-20 14:27:03'),
(1488, 2, 5, 1, 'Corn Oil kls (Corn Oil kls)', 'kls', '134.96', '269.91', '0.04%', '114.71', '229.42', '0.02%', '2020-03-20 14:27:03'),
(1489, 2, 5, 1, 'Corn Starch 500g/pack (Corn Starch 500g/pack  )', 'Pck', '30.34', '0', '0.00%', '28.95', '0', '0.00%', '2020-03-20 14:27:03'),
(1490, 2, 5, 1, 'Crepe Dough (Crepe Dough - grammage)', 'g', '0.09', '0', '0.00%', '0.09164', '0', '0.00%', '2020-03-20 14:27:03'),
(1491, 2, 5, 1, 'Cucumber (Cucumber)', 'g', '0.03', '289.01', '0.04%', '0.04', '356.27', '0.02%', '2020-03-20 14:27:03'),
(1492, 2, 5, 1, 'Culikot (Culikot)', 'g', '0.06', '0', '0.00%', '0.06', '0', '0.00%', '2020-03-20 14:27:03'),
(1493, 2, 5, 1, 'Curry Powder - bot (Curry Powder - 539gms/bot  )', 'Bot', '41.32', '0', '0.00%', '649.95', '0', '0.00%', '2020-03-20 14:27:03'),
(1494, 2, 5, 1, 'Curry Powder 480grms/bot (Curry Powder (480gms/bot  ))', 'Bot', '373.15', '358.22', '0.05%', '373.35', '358.42', '0.03%', '2020-03-20 14:27:03'),
(1495, 2, 5, 1, 'Curry Sauce (Curry Sauce)', 'g', '0.13', '0', '0.00%', '0.12931', '0', '0.00%', '2020-03-20 14:27:03'),
(1496, 2, 5, 1, 'Danes Sliced Cheese 250gs (anes Sliced Cheese 250gs)', 'ea', '65', '0', '0.00%', '65', '0', '0.00%', '2020-03-20 14:27:03'),
(1497, 2, 5, 1, 'Demi Glaze pcks (Demi Glaze pcks)', 'Pck', '506.8', '456.12', '0.06%', '446.9', '402.21', '0.03%', '2020-03-20 14:27:03'),
(1498, 2, 5, 1, 'Dried fish-katambak (Dried fish-katambak)', 'g', '0.22', '0', '0.00%', '0.22', '0', '0.00%', '2020-03-20 14:27:03'),
(1499, 2, 5, 1, 'Durian  Jam -grams (Durian  Jam -grams)', 'g', '0.32', '0', '0.00%', '0.3676', '0', '0.00%', '2020-03-20 14:27:03'),
(1500, 2, 5, 1, 'Durian Jam Small (Durian Jam Small)', 'Bot', '125', '0', '0.00%', '125', '0', '0.00%', '2020-03-20 14:27:03'),
(1501, 2, 5, 1, 'Eden Filled Cheese 450g (Eden Filled Cheese 450g)', 'Pck', '201.1', '0', '0.00%', '168.15', '0', '0.00%', '2020-03-20 14:27:03'),
(1502, 2, 5, 1, 'Egg noodle Pcks (Egg noodle 500gms/pck    )', 'Pck', '93', '0', '0.00%', '93', '0', '0.00%', '2020-03-20 14:27:03'),
(1503, 2, 5, 1, 'Ferna Gelatine (Ferna Gelatine   )', 'g', '0.98', '0', '0.00%', '0.714', '0', '0.00%', '2020-03-20 14:27:03'),
(1504, 2, 5, 1, 'Flag  Picks (Flagl Picks  )100 (Flag  Picks (Flagl Picks  ) 100pcs/box   )', 'Pck', '57.48', '57.48', '0.01%', '52.75', '52.75', '0.00%', '2020-03-20 14:27:03'),
(1505, 2, 5, 1, 'Frankfurter - packs (Frankfurter - packs)', 'ea', '301', '0', '0.00%', '301', '0', '0.00%', '2020-03-20 14:27:03'),
(1506, 2, 5, 1, 'Frankfurter - pcs (Frankfurter - pcs  )', 'ea', '43', '0', '0.00%', '43', '0', '0.00%', '2020-03-20 14:27:03'),
(1507, 2, 5, 1, 'French Dressing (French Dressing grms  )', 'g', '0.24', '0', '0.00%', '0.236', '0', '0.00%', '2020-03-20 14:27:03'),
(1508, 2, 5, 1, 'Fresh Milk Conapole 1L (Fresh Milk Conapole 1L  )', 'Ltr', '58', '10788', '1.45%', '58', '10788', '0.74%', '2020-03-20 14:27:03'),
(1509, 2, 5, 1, 'Freshmilk-ltrs (Freshmilk 12 liters/case    )', 'ea', '60', '0', '0.00%', '75', '0', '0.00%', '2020-03-20 14:27:03'),
(1510, 2, 5, 1, 'Freshmilk-Nestle (Freshmilk-Nestle  )', 'Pck', '86.36', '5440.85', '0.73%', '79.44167', '5004.83', '0.34%', '2020-03-20 14:27:03'),
(1511, 2, 5, 1, 'Fried Garlic (Fried Garlic  )', 'g', '0.27', '30.42', '0.00%', '0.5502', '61.07', '0.00%', '2020-03-20 14:27:03'),
(1512, 2, 5, 1, 'Garlic (Garlic  )', 'g', '0.09', '256.35', '0.04%', '0.204', '591.6', '0.04%', '2020-03-20 14:27:03'),
(1513, 2, 5, 1, 'Garlic granulated (Garlic granulated 45grms/bot  )', 'Bot', '71.34', '0', '0.00%', '71.35', '0', '0.00%', '2020-03-20 14:27:03'),
(1514, 2, 5, 1, 'Ginger (Ginger -grams)', 'g', '0.08', '248.41', '0.03%', '0.08', '239.79', '0.02%', '2020-03-20 14:27:03'),
(1515, 2, 5, 1, 'Goat cheese (Goat cheese 150grms/bar  )', 'g', '1.1', '0', '0.00%', '1.26667', '0', '0.00%', '2020-03-20 14:27:03'),
(1516, 2, 5, 1, 'Grapes (Grapes)', 'g', '0.41', '160.2', '0.02%', '0.21428', '83.78', '0.01%', '2020-03-20 14:27:03'),
(1517, 2, 5, 1, 'Gruyere cheese (Gruyere cheese  )', 'g', '1.16', '0', '0.00%', '1.19', '0', '0.00%', '2020-03-20 14:27:03'),
(1518, 2, 5, 1, 'Gulaman 90gs/pck (Gulaman 90gs/pck  )', 'Pck', '48.15', '0', '0.00%', '48.15', '0', '0.00%', '2020-03-20 14:27:03'),
(1519, 2, 5, 1, 'GV Aswete 50g (GV Aswete 50g)', 'Pck', '26.5', '53', '0.01%', '26.5', '53', '0.00%', '2020-03-20 14:27:03'),
(1520, 2, 5, 1, 'Ham (Ham - grms)', 'g', '0.21', '0', '0.00%', '0.16', '0', '0.00%', '2020-03-20 14:27:03'),
(1521, 2, 5, 1, 'Heinz catshup-bot (Heinz catshup-bot)', 'Bot', '109.75', '1042.59', '0.14%', '129', '1225.5', '0.08%', '2020-03-20 14:27:03'),
(1522, 2, 5, 1, 'Hickory sauce (Hickory sauce 225grms  )', 'g', '0.19', '84.37', '0.01%', '0.15622', '70.3', '0.01%', '2020-03-20 14:27:03'),
(1523, 2, 5, 1, 'Hoisen sauce 240gms/bot (Hoisen sauce 240gms/bot    )', 'Bot', '93.75', '0', '0.00%', '93.75', '0', '0.00%', '2020-03-20 14:27:03'),
(1524, 2, 5, 1, 'Honey (Honey 1 ltr)', 'Ltr', '288.22', '576.44', '0.08%', '237.65', '475.3', '0.03%', '2020-03-20 14:27:03'),
(1525, 2, 5, 1, 'Hot sauce-MB-bot (Hot sauce-MB 50ml/bot    )', 'Bot', '15.76', '646.21', '0.09%', '22.25', '912.25', '0.06%', '2020-03-20 14:27:03'),
(1526, 2, 5, 1, 'Hungarian - pcs (Hungarian)', 'ea', '62.4', '936', '0.13%', '62.4', '936', '0.06%', '2020-03-20 14:27:03'),
(1527, 2, 5, 1, 'JC Flat Lid 200/320 Trans. (C Flat Lid 200/320 Trans.)', 'ea', '1.5', '0', '0.00%', '1.5', '0', '0.00%', '2020-03-20 14:27:03'),
(1528, 2, 5, 1, 'JC FLAT LID 520ML (JC FLAT LID 520ML)', 'ea', '1.9', '0', '0.00%', '1.9', '0', '0.00%', '2020-03-20 14:27:03'),
(1529, 2, 5, 1, 'Joms Chili Flakes 35G (Joms Chili Flakes 35G)', 'Bot', '28.75', '0', '0.00%', '28.75', '0', '0.00%', '2020-03-20 14:27:03'),
(1530, 2, 5, 1, 'Kaizer buns big (Kaizer buns big  )', 'ea', '10.33', '0', '0.00%', '10.33', '0', '0.00%', '2020-03-20 14:27:03'),
(1531, 2, 5, 1, 'Kewpie 210Ml (Kewpie japanese dressing 210ml  )', 'Bot', '144.51', '0', '0.00%', '162.9', '0', '0.00%', '2020-03-20 14:27:03'),
(1532, 2, 5, 1, 'Kewpie japanese dressing (Kewpie japanese dressing - 1ltr)', 'Bot', '470', '324.3', '0.04%', '683.65', '471.72', '0.03%', '2020-03-20 14:27:03'),
(1533, 2, 5, 1, 'Kikiam 500G (Kikiam 500G)', 'Pck', '48.51', '0', '0.00%', '48.5', '0', '0.00%', '2020-03-20 14:27:03'),
(1534, 2, 5, 1, 'Knorr Ginataang Gulay 45g (Knorr Ginataang Gulay 45g)', 'Pck', '26.3', '78.9', '0.01%', '26.3', '78.9', '0.01%', '2020-03-20 14:27:03'),
(1535, 2, 5, 1, 'Lea & Perrins (Lea & Perrins - 300ml/bot  )', 'Bot', '149.89', '0', '0.00%', '149.9', '0', '0.00%', '2020-03-20 14:27:03'),
(1536, 2, 5, 1, 'Lee Kum Kee Panda Oyster Sauce (Lee Kum Kee Panda Oyster Sauce (90z))', 'Bot', '101.55', '0', '0.00%', '64.45', '0', '0.00%', '2020-03-20 14:27:03'),
(1537, 2, 5, 1, 'Lemon (Lemon)', 'g', '0.02', '213.15', '0.03%', '0.03', '284.76', '0.02%', '2020-03-20 14:27:03'),
(1538, 2, 5, 1, 'Lettuce-Curly (Lettuce-Curly  )', 'g', '0.14', '0.01', '0.00%', '0.18', '0', '0.00%', '2020-03-20 14:27:03'),
(1539, 2, 5, 1, 'Lettuce-Iceberg (Lettuce-Iceberg  )', 'g', '0.13', '0', '0.00%', '0.14', '0', '0.00%', '2020-03-20 14:27:03'),
(1540, 2, 5, 1, 'Lettuce-Romaine (Lettuce-Romaine  )', 'g', '0.15', '793.15', '0.11%', '0.18', '956.4', '0.07%', '2020-03-20 14:27:03'),
(1541, 2, 5, 1, 'Liquid seasoning-bot (Liquid seasoning  1liter  )', 'Bot', '231.65', '0', '0.00%', '206.1', '0', '0.00%', '2020-03-20 14:27:03'),
(1542, 2, 5, 1, 'Longganisa (10pcs/pack) (Longganisa (10pcs/pack)  )', 'ea', '5', '50', '0.01%', '4', '40', '0.00%', '2020-03-20 14:27:03'),
(1543, 2, 5, 1, 'Madarin Sausage (Pack) (Madarin Sausage (Pack)  )', 'Pck', '141', '0', '0.00%', '141', '0', '0.00%', '2020-03-20 14:27:03'),
(1544, 2, 5, 1, 'Maggi Magic Sarap 100g (Maggi Magic Sarap 100g)', 'Pck', '28.65', '0', '0.00%', '28.65', '0', '0.00%', '2020-03-20 14:27:03'),
(1545, 2, 5, 1, 'Maggi Magic Sarap 8gms/sachet (Maggi Magic Sarap 8gms/sachet  )', 'ea', '2.95', '0', '0.00%', '2.65833', '0', '0.00%', '2020-03-20 14:27:03'),
(1546, 2, 5, 1, 'Maggi Majic Sarap Isda (Maggi Majic Sarap Isda)', 'ea', '2.61', '0', '0.00%', '2.61', '0', '0.00%', '2020-03-20 14:27:03'),
(1547, 2, 5, 1, 'Magnolia Cheese Reg 470/440g (Magnolia Cheese Reg 470/440g)', 'ea', '118', '0', '0.00%', '118', '0', '0.00%', '2020-03-20 14:27:03'),
(1548, 2, 5, 1, 'Magnolia Cheese Reg 950/900g (Magnolia Cheese Reg 950/900g)', 'ea', '248.2', '1489.2', '0.20%', '236.05', '1416.3', '0.10%', '2020-03-20 14:27:03'),
(1549, 2, 5, 1, 'Magnolia Quickmelt Chees Spread (Magnolia Quickmelt Chees Spread  900g)', 'Pck', '335.55', '671.09', '0.09%', '342', '684', '0.05%', '2020-03-20 14:27:03'),
(1550, 2, 5, 1, 'Malasugue Fish (Malasugue Fish(g))', 'g', '0.44', '870', '0.12%', '0.37981', '759.62', '0.05%', '2020-03-20 14:27:03'),
(1551, 2, 5, 1, 'Mandarin Sausage (Mandarin Sausage)', 'Pck', '141', '0', '0.00%', '141', '0', '0.00%', '2020-03-20 14:27:03'),
(1552, 2, 5, 1, 'Mango chutney (Mango chutney  )', 'g', '0.02', '0', '0.00%', '0.0323', '0', '0.00%', '2020-03-20 14:27:03'),
(1553, 2, 5, 1, 'Mango fresh (Mango fresh  )', 'g', '0.08', '638.29', '0.09%', '0.11984', '904.13', '0.06%', '2020-03-20 14:27:03'),
(1554, 2, 5, 1, 'Mango Jam 340grms (Mango Jam 340grms)', 'Bot', '106.21', '0', '0.00%', '111.45', '0', '0.00%', '2020-03-20 14:27:03'),
(1555, 2, 5, 1, 'Mango Jam Clara Ole 320grms (Mango Jam Clara Ole 320grms)', 'Bot', '92.7', '0', '0.00%', '92.7', '0', '0.00%', '2020-03-20 14:27:03'),
(1556, 2, 5, 1, 'Maria clara-wine (Maria clara-wine 750ml  )', 'Bot', '156.97', '136.56', '0.02%', '156.95', '136.55', '0.01%', '2020-03-20 14:27:03'),
(1557, 2, 5, 1, 'Mayonaie (Mayonaise    )', 'kls', '117.07', '0', '0.00%', '106.43', '0', '0.00%', '2020-03-20 14:27:03'),
(1558, 2, 5, 1, 'Mayonnaise-homemade (Mayonnaise-homemade  )', 'g', '0.11', '0', '0.00%', '0.10621', '0', '0.00%', '2020-03-20 14:27:03'),
(1559, 2, 5, 1, 'Mixed vegetable (Mixed vegetable  )', 'g', '0.14', '260.4', '0.04%', '0.126', '226.8', '0.02%', '2020-03-20 14:27:03'),
(1560, 2, 5, 1, 'Mushroom shitake 198gm (Mushroom shitake 198gms   )', 'can', '30.94', '0', '0.00%', '36', '0', '0.00%', '2020-03-20 14:27:03'),
(1561, 2, 5, 1, 'Mushroom shitake 284gm Golden C (Mushroom shitake 284gm Golden Champ)', 'can', '36', '0', '0.00%', '36', '0', '0.00%', '2020-03-20 14:27:03'),
(1562, 2, 5, 1, 'Mushroom sliced 400gms (Mushroom sliced - 400gms/can    )', 'ea', '46.75', '0', '0.00%', '49.1', '0', '0.00%', '2020-03-20 14:27:03'),
(1563, 2, 5, 1, 'Mustard (Mustard  )', 'g', '0.04', '0', '0.00%', '0.2833', '0', '0.00%', '2020-03-20 14:27:03'),
(1564, 2, 5, 1, 'Oil-Sun valley kls (Oil-Sun valley  )', 'kls', '44', '0', '0.00%', '58.53', '0', '0.00%', '2020-03-20 14:27:03'),
(1565, 2, 5, 1, 'Olive Oil 1Ltr (dona Elena) (Olive Oil 1Ltr (dona Elena)  )', 'Bot', '476.37', '428.73', '0.06%', '509.1', '458.19', '0.03%', '2020-03-20 14:27:03'),
(1566, 2, 5, 1, 'Olive Oil 330ml (Olive Oil 330ml)', 'Bot', '246.45', '0', '0.00%', '165', '0', '0.00%', '2020-03-20 14:27:03'),
(1567, 2, 5, 1, 'Onion (Onion)', 'g', '0.06', '178.08', '0.02%', '0.08039', '225.09', '0.02%', '2020-03-20 14:27:03'),
(1568, 2, 5, 1, 'Oyster sauce-MB (Oyster sauce-MB 750ml/bot  )', 'Bot', '106.59', '156.69', '0.02%', '117.8', '173.17', '0.01%', '2020-03-20 14:27:03'),
(1569, 2, 5, 1, 'Oyster sauce-Panda (Oyster sauce-Panda 907ml/bot  )', 'Bot', '141.6', '0', '0.00%', '172.5', '0', '0.00%', '2020-03-20 14:27:03'),
(1570, 2, 5, 1, 'PA-320ML Paper Bowl (PA-320ML Paper Bowl)', 'ea', '3.35', '0', '0.00%', '0', '0', '0.00%', '2020-03-20 14:27:03'),
(1571, 2, 5, 1, 'PA-520ml Paper Bowl (PA-520ml Paper Bowl)', 'ea', '3.8', '326.8', '0.04%', '3.8', '326.8', '0.02%', '2020-03-20 14:27:03'),
(1572, 2, 5, 1, 'Pancake Dough (Pancake Dough  )', 'g', '0.09', '63', '0.01%', '0.09', '63', '0.00%', '2020-03-20 14:27:03'),
(1573, 2, 5, 1, 'Pancit Canton Cebu 125G (Pancit Canton Cebu 125G)', 'Pck', '15.45', '0', '0.00%', '15.45', '0', '0.00%', '2020-03-20 14:27:03'),
(1574, 2, 5, 1, 'Parchment Wax Paper (30sq 10yd) (Parchment Wax Paper (30sq 10yd))', 'Rlls', '69.76', '17.44', '0.00%', '69.75', '17.44', '0.00%', '2020-03-20 14:27:03'),
(1575, 2, 5, 1, 'Parmesan cheese (Parmesan cheese  )', 'kls', '884', '998.92', '0.14%', '1155', '1305.15', '0.09%', '2020-03-20 14:27:03'),
(1576, 2, 5, 1, 'Parsley (Parsley)', 'g', '0.39', '114.88', '0.02%', '0.21', '61.2', '0.00%', '2020-03-20 14:27:03'),
(1577, 2, 5, 1, 'Patatas (Patatas  )', 'g', '0.06', '0', '0.00%', '0.07', '0', '0.00%', '2020-03-20 14:27:03'),
(1578, 2, 5, 1, 'Patis-Rufina (Patis-Rufina  )', 'Bot', '28.34', '0', '0.00%', '40.3', '0', '0.00%', '2020-03-20 14:27:03'),
(1579, 2, 5, 1, 'Patis 350ML Great Value (Patis 350ML Great Value)', 'Bot', '18.6', '213.74', '0.03%', '13.25', '152.24', '0.01%', '2020-03-20 14:27:03'),
(1580, 2, 5, 1, 'Pears (Pears  )', 'ea', '30.38', '121.5', '0.02%', '25', '100', '0.01%', '2020-03-20 14:27:03'),
(1581, 2, 5, 1, 'Pickle Relish (Pickle Relish 250grms  )', 'Bot', '45.8', '45.8', '0.01%', '55.7', '55.7', '0.00%', '2020-03-20 14:27:03'),
(1582, 2, 5, 1, 'Pineapple (Pineapple   )', 'g', '0.04', '180', '0.02%', '0.025', '128.57', '0.01%', '2020-03-20 14:27:03'),
(1583, 2, 5, 1, 'Pork Bratwurst - Pack (Pork Bratwurst - Pack)', 'Pck', '302', '0', '0.00%', '302', '0', '0.00%', '2020-03-20 14:27:03'),
(1584, 2, 5, 1, 'Pork bratwurst - pcs (Pork bratwurst - pcs)', 'ea', '50.33', '0', '0.00%', '50.33', '0', '0.00%', '2020-03-20 14:27:03'),
(1585, 2, 5, 1, 'Potato marble - kls (Potato marble - kls)', 'kls', '54.25', '0', '0.00%', '30', '0', '0.00%', '2020-03-20 14:27:03'),
(1586, 2, 5, 1, 'Quickmelt - 440grms (Quickmelt - 440grms  )', 'ea', '205', '0', '0.00%', '325.25', '0', '0.00%', '2020-03-20 14:27:03'),
(1587, 2, 5, 1, 'Quickmelt Magnolia - 1.9kg (Quickmelt Magnolia - 1.9kg)', 'kls', '330.54', '0', '0.00%', '320.39167', '0', '0.00%', '2020-03-20 14:27:03'),
(1588, 2, 5, 1, 'Raisin 200g/Pack (Raisin 200g/pack)', 'Pck', '50', '0', '0.00%', '50', '0', '0.00%', '2020-03-20 14:27:03'),
(1589, 2, 5, 1, 'Raisin Seedlesss 200g(Raisin  ) (Raisin Seedlesss 200g(Raisin  )  )', 'Pck', '26.07', '0', '0.00%', '30', '0', '0.00%', '2020-03-20 14:27:03'),
(1590, 2, 5, 1, 'Red onion (Red onion  )', 'g', '0.07', '0', '0.00%', '0.075', '0', '0.00%', '2020-03-20 14:27:03'),
(1591, 2, 5, 1, 'Rice (Rice  )', 'kls', '34.18', '4019.55', '0.54%', '36.09861', '4245.2', '0.29%', '2020-03-20 14:27:03'),
(1592, 2, 5, 1, 'Rice 7toner Order ni Misis (Rice 7toner Order ni Misis)', 'kls', '51.44', '0', '0.00%', '45.583', '0', '0.00%', '2020-03-20 14:27:03'),
(1593, 2, 5, 1, 'Sage - bot (Sage 12grms  )', 'Bot', '49.05', '0', '0.00%', '49.05', '0', '0.00%', '2020-03-20 14:27:03'),
(1594, 2, 5, 1, 'Salsa Verde (Salsa Verde  )', 'g', '0.25', '0', '0.00%', '0.25', '0', '0.00%', '2020-03-20 14:27:03'),
(1595, 2, 5, 1, 'Salt (Salt  )', 'g', '0.03', '159.94', '0.02%', '0.03485', '160.31', '0.01%', '2020-03-20 14:27:03'),
(1596, 2, 5, 1, 'San Remo Fettucini 500g (San Remo Fettucini 500g)', 'Pck', '74.95', '359.76', '0.05%', '132.1', '634.08', '0.04%', '2020-03-20 14:27:03'),
(1597, 2, 5, 1, 'Sangke 25g (Sangke 25g  )', 'Pck', '24', '0', '0.00%', '24', '0', '0.00%', '2020-03-20 14:27:03'),
(1598, 2, 5, 1, 'Sesame oil-Mua Yu (Sesame oil-Mua Yu - 500ml  )', 'Bot', '162', '145.8', '0.02%', '132', '118.8', '0.01%', '2020-03-20 14:27:03'),
(1599, 2, 5, 1, 'Sesame oil-Mua Yu  2L (Sesame oil-Mua Yu 2L   )', 'Bot', '0', '0', '0.00%', '0', '0', '0.00%', '2020-03-20 14:27:03'),
(1600, 2, 5, 1, 'Sesame oil-Mua Yu 2L (Sesame oil-Mua Yu 2L  )', 'Bot', '408', '0', '0.00%', '408', '0', '0.00%', '2020-03-20 14:27:03'),
(1601, 2, 5, 1, 'Shrimp (Shrimp  )', 'g', '0.29', '0', '0.00%', '0.26', '0', '0.00%', '2020-03-20 14:27:03'),
(1602, 2, 5, 1, 'Sibuyas dahon (Sibuyas dahon  )', 'g', '0.07', '421.32', '0.06%', '0.09', '530.07', '0.04%', '2020-03-20 14:27:03'),
(1603, 2, 5, 1, 'Side Dish (Side Dish  )', 'g', '0.05', '0', '0.00%', '0.05', '0', '0.00%', '2020-03-20 14:27:03'),
(1604, 2, 5, 1, 'Silver Swan Patis 1G (Silver Swan Patis 1G)', 'Gal', '60.41', '0', '0.00%', '109.05', '0', '0.00%', '2020-03-20 14:27:03'),
(1605, 2, 5, 1, 'Silver Swan Patis 750ml (Silver Swan Patis 750ml)', 'Bot', '20.55', '0', '0.00%', '5065', '0', '0.00%', '2020-03-20 14:27:03'),
(1606, 2, 5, 1, 'Silver Swan Soy Sauce (Silver Swan Soy Sauce  )', 'Gal', '76.7', '0', '0.00%', '111.98', '0', '0.00%', '2020-03-20 14:27:03'),
(1607, 2, 5, 1, 'Singkamas (Singkamas  )', 'g', '0.04', '40.5', '0.01%', '0.03', '31.6', '0.00%', '2020-03-20 14:27:03'),
(1608, 2, 5, 1, 'Smoked farmer\'s ham (Smoked farmer\'s ham  )', 'Prtn', '12.45', '0', '0.00%', '12.45', '0', '0.00%', '2020-03-20 14:27:03'),
(1609, 2, 5, 1, 'Smoked Pork Sausage (Smoked Pork Sausage   )', 'Pck', '313', '0', '0.00%', '313', '0', '0.00%', '2020-03-20 14:27:03'),
(1610, 2, 5, 1, 'Sotanghon Verminicili 100g (Sotanghon Verminicili 100g)', 'Pck', '14.8', '0', '0.00%', '14.8', '0', '0.00%', '2020-03-20 14:27:03'),
(1611, 2, 5, 1, 'Soy sauce (Soy sauce  )', 'g', '0.03', '0', '0.00%', '0.112', '0', '0.00%', '2020-03-20 14:27:03'),
(1612, 2, 5, 1, 'Spaghetti pasta (Spaghetti pasta  )', 'kls', '55.46', '124.22', '0.02%', '88', '197.12', '0.01%', '2020-03-20 14:27:03'),
(1613, 2, 5, 1, 'Spaghetti pasta-Fettucinni (Spaghetti pasta-Fettucinni - 500gms/pck  )', 'Pck', '67.35', '0', '0.00%', '67.35', '0', '0.00%', '2020-03-20 14:27:03'),
(1614, 2, 5, 1, 'Spanish paprika (Spanish paprika - 34grms  )', 'Bot', '56.4', '0', '0.00%', '56.4', '0', '0.00%', '2020-03-20 14:27:03'),
(1615, 2, 5, 1, 'Spiced Ham (El Rancho Spiced Ham)', 'g', '0.2', '1216.02', '0.16%', '0.15725', '943.5', '0.07%', '2020-03-20 14:27:03'),
(1616, 2, 5, 1, 'Squid Ball 500g (Squid Ball 500g)', 'Pck', '69', '0', '0.00%', '69', '0', '0.00%', '2020-03-20 14:27:03'),
(1617, 2, 5, 1, 'Sriracha Lee KUm Kee Chili Sauc (Sriracha Lee KUm Kee Chili Sauce 17oz)', 'Bot', '205.76', '506.17', '0.07%', '229', '563.34', '0.04%', '2020-03-20 14:27:03'),
(1618, 2, 5, 1, 'Star Anis (Star Anis (50 g)  )', 'Bot', '53.26', '0', '0.00%', '53.25', '0', '0.00%', '2020-03-20 14:27:03'),
(1619, 2, 5, 1, 'Star Anis(25 g) (Star Anis(25 g))', 'ea', '23.4', '0', '0.00%', '23.4', '0', '0.00%', '2020-03-20 14:27:03'),
(1620, 2, 5, 1, 'Sweet chili sauce (Sweet chili sauce 340ML  )', 'Bot', '35.79', '235.87', '0.03%', '35', '230.65', '0.02%', '2020-03-20 14:27:03'),
(1621, 2, 5, 1, 'Tauge (Tauge)', 'g', '0.04', '0', '0.00%', '0.04', '0', '0.00%', '2020-03-20 14:27:03'),
(1622, 2, 5, 1, 'Teriyaki Chicken Fillet (Teriyaki Chicken Fillet)', 'Prtn', '31.61', '0', '0.00%', '31.61', '0', '0.00%', '2020-03-20 14:27:03'),
(1623, 2, 5, 1, 'Texas Cellophane 3x16 100s (Texas Cellophane 3x16 100s)', 'Pck', '29.7', '0', '0.00%', '29.7', '0', '0.00%', '2020-03-20 14:27:03'),
(1624, 2, 5, 1, 'Thousand island dressing (Thousand island dressing  )', 'g', '0.11', '0', '0.00%', '0.10677', '0', '0.00%', '2020-03-20 14:27:03'),
(1625, 2, 5, 1, 'Tissue Coctail 40 pulls (Tissue Coctail  (40 pulls)  )', 'Pck', '0', '0', '0.00%', '23.75', '0', '0.00%', '2020-03-20 14:27:03'),
(1626, 2, 5, 1, 'Tissue Coctail 40pulls (Tissue Coctail 40pulls)', 'Pck', '24', '168', '0.02%', '23.75', '166.25', '0.01%', '2020-03-20 14:27:03'),
(1627, 2, 5, 1, 'Tissue Kitchen Folded Tissue (Tissue Kitchen Folded Tissue)', 'Pck', '32.55', '325.5', '0.04%', '77.39', '773.9', '0.05%', '2020-03-20 14:27:03'),
(1628, 2, 5, 1, 'Tomato (Tomato  )', 'kls', '7.83', '54', '0.01%', '35', '241.5', '0.02%', '2020-03-20 14:27:03'),
(1629, 2, 5, 1, 'Tomato paste 150grms (Tomato paste 150grms)', 'Pck', '19.25', '0', '0.00%', '19.25', '0', '0.00%', '2020-03-20 14:27:03'),
(1630, 2, 5, 1, 'Tomato sauce (Tomato sauce (1kl/pack)  )', 'Pck', '79.8', '0', '0.00%', '57', '0', '0.00%', '2020-03-20 14:27:03'),
(1631, 2, 5, 1, 'Tuna Century 1075gms (Tuna Century 1075gms)', 'can', '415.5', '0', '0.00%', '415.45', '0', '0.00%', '2020-03-20 14:27:03'),
(1632, 2, 5, 1, 'Turmeric gound (Turmeric gound 30gms    )', 'Bot', '51.3', '307.8', '0.04%', '51.3', '307.8', '0.02%', '2020-03-20 14:27:03'),
(1633, 2, 5, 1, 'Ube jam (Ube Jam)', 'g', '0.13', '0', '0.00%', '0.12527', '0', '0.00%', '2020-03-20 14:27:03'),
(1634, 2, 5, 1, 'Vinegar (Vinegar  )', 'Gal', '68.8', '34.4', '0.01%', '100.85', '50.43', '0.00%', '2020-03-20 14:27:03'),
(1635, 2, 5, 1, 'Watermelon (Watermelon)', 'g', '0.03', '0', '0.00%', '0.02', '0', '0.00%', '2020-03-20 14:27:03'),
(1636, 2, 5, 1, 'Waxpaper (Waxpaper  )', 'Rlls', '66', '0', '0.00%', '66', '0', '0.00%', '2020-03-20 14:27:03'),
(1637, 2, 5, 1, 'White onion (White onion  )', 'g', '0.1', '205.94', '0.03%', '0.09', '181.31', '0.01%', '2020-03-20 14:27:03'),
(1638, 2, 5, 1, 'White pepper 31g (White pepper 31g  )', 'Bot', '74.15', '0', '0.00%', '74.15', '0', '0.00%', '2020-03-20 14:27:03'),
(1639, 2, 5, 1, 'White Squid (Squid(g))', 'g', '0.14', '0', '0.00%', '0.24', '0', '0.00%', '2020-03-20 14:27:03'),
(1640, 2, 6, 1, '10x10 cakeboard (10x10 cakeboard)', 'ea', '20', '0', '0.00%', '8', '0', '0.00%', '2020-03-20 14:28:54'),
(1641, 2, 6, 1, '10x10x4 Royal Red (10x10x4 Royal Red)', 'set', '23.5', '0', '0.00%', '24', '0', '0.00%', '2020-03-20 14:28:54'),
(1642, 2, 6, 1, '10x10x4 Royal Red(1) (10x10x4 Royal Red)', 'ea', '27', '0', '0.00%', '22', '0', '0.00%', '2020-03-20 14:28:54'),
(1643, 2, 6, 1, '10x10x5 Box Red (10x10x5 Box Red)', 'ea', '23', '12673', '1.71%', '21', '11571', '0.79%', '2020-03-20 14:28:54'),
(1644, 2, 6, 1, '10x14 cakeboard (10x14 cakeboard)', 'ea', '16', '432', '0.06%', '22', '594', '0.04%', '2020-03-20 14:28:54'),
(1645, 2, 6, 1, '10x14 cakebox (10x14 cakebox  )', 'ea', '27', '729', '0.10%', '25', '675', '0.05%', '2020-03-20 14:28:54'),
(1646, 2, 6, 1, '12x12 cake board (12x12 cake board  )', 'ea', '20', '0', '0.00%', '20', '0', '0.00%', '2020-03-20 14:28:54'),
(1647, 2, 6, 1, '12x12 cake box Red (12x12 cake box Red)', 'ea', '23', '0', '0.00%', '23', '0', '0.00%', '2020-03-20 14:28:54'),
(1648, 2, 6, 1, '12x12 Styro (12x12 Styro)', 'ea', '110', '0', '0.00%', '110', '0', '0.00%', '2020-03-20 14:28:54'),
(1649, 2, 6, 1, '12x16 Styro (12x16 Styro)', 'ea', '140', '0', '0.00%', '140', '0', '0.00%', '2020-03-20 14:28:54'),
(1650, 2, 6, 1, '12x16x5 Box Red (12x16x5 Red)', 'ea', '31', '0', '0.00%', '27', '0', '0.00%', '2020-03-20 14:28:54'),
(1651, 2, 6, 1, '14x14 Cake Box (14x14 Cake Box)', 'ea', '36', '0', '0.00%', '36', '0', '0.00%', '2020-03-20 14:28:54'),
(1652, 2, 6, 1, '14x14 Cakeboard (14x14 Cakeboard)', 'ea', '33', '2574.02', '0.35%', '31', '2418', '0.17%', '2020-03-20 14:28:54'),
(1653, 2, 6, 1, '14x14x5 cakebox (14x14x5 cakebox  )', 'ea', '36', '1764', '0.24%', '33', '1617', '0.11%', '2020-03-20 14:28:54'),
(1654, 2, 6, 1, '14X15 DEC Board (14X15 DEC Board)', 'ea', '38', '0', '0.00%', '38', '0', '0.00%', '2020-03-20 14:28:54'),
(1655, 2, 6, 1, '14x18 cakeboard (14x18 cakeboard  )', 'ea', '38.29', '2871.94', '0.39%', '39.22581', '2941.93575', '0.20%', '2020-03-20 14:28:54'),
(1656, 2, 6, 1, '14x18 cakebox (14x18 cakebox  )', 'ea', '38.76', '4380.43', '0.59%', '35', '3955', '0.27%', '2020-03-20 14:28:54'),
(1657, 2, 6, 1, '16oz Plastic Cup w/lid (16oz Plastic Cup w/lid)', 'ea', '4.24', '0', '0.00%', '4.24', '0', '0.00%', '2020-03-20 14:28:54'),
(1658, 2, 6, 1, '3.5 0z cups (3.5 0z cups  )', 'ea', '1.6', '0', '0.00%', '1.6', '0', '0.00%', '2020-03-20 14:28:54'),
(1659, 2, 6, 1, '6pk 120z/355ml (hot/cold) 6pcs/ (6pk 120z/355ml (hot/cold) 6pcs/pack  )', 'ea', '13.29', '0', '0.00%', '13.29', '0', '0.00%', '2020-03-20 14:28:54'),
(1660, 2, 6, 1, '7x11 Matzo Cellophane (7x11 Matzo Cellophane)', 'Pck', '200', '0', '0.00%', '200', '0', '0.00%', '2020-03-20 14:28:54'),
(1661, 2, 6, 1, '7x7 Cake Box (7x7 Cake Box)', 'ea', '23', '0', '0.00%', '23', '0', '0.00%', '2020-03-20 14:28:54'),
(1662, 2, 6, 1, '7x7 Round Board Silver (7x7 Round Board Silver)', 'ea', '10.5', '420', '0.06%', '10.25', '410', '0.03%', '2020-03-20 14:28:54'),
(1663, 2, 6, 1, '8x12 cakeboard (8x12 cakeboard)', 'ea', '7', '0', '0.00%', '7', '0', '0.00%', '2020-03-20 14:28:54'),
(1664, 2, 6, 1, '8x12 cakebox (8x12 cakebox)', 'ea', '16', '0', '0.00%', '16', '0', '0.00%', '2020-03-20 14:28:54'),
(1665, 2, 6, 1, '8x12 Styro (8x12 Styro)', 'ea', '70', '0', '0.00%', '70', '0', '0.00%', '2020-03-20 14:28:54'),
(1666, 2, 6, 1, 'Aluminum foil (Aluminum foil  )', 'Rlls', '750', '0', '0.00%', '425', '0', '0.00%', '2020-03-20 14:28:54'),
(1667, 2, 6, 1, 'Baking cups (Baking cups 2oz    )', 'ea', '0.65', '0', '0.00%', '0.4', '0', '0.00%', '2020-03-20 14:28:54'),
(1668, 2, 6, 1, 'Brown bag (Supot #2) (Brown bag #2)', 'ea', '0.29', '0', '0.00%', '0.28', '0', '0.00%', '2020-03-20 14:28:54'),
(1669, 2, 6, 1, 'Brown Paper (21pcs/kl) (Brown Paper (21pcs/kl) (Brown Paper)   )', 'ea', '0.57', '0', '0.00%', '0.57', '0', '0.00%', '2020-03-20 14:28:54'),
(1670, 2, 6, 1, 'C302 burger box (C302 burger box  )', 'ea', '7.07', '10407', '1.40%', '7', '10297', '0.71%', '2020-03-20 14:28:54'),
(1671, 2, 6, 1, 'Clamshell (Clamshell)', 'ea', '9', '0', '0.00%', '8.33', '0', '0.00%', '2020-03-20 14:28:54'),
(1672, 2, 6, 1, 'Frenchbread cellophane (Frenchbread cellophane  )', 'ea', '5.45', '10690.91', '1.44%', '4.75', '9324.25', '0.64%', '2020-03-20 14:28:54'),
(1673, 2, 6, 1, 'Healthy Bread Cellophane (Healthy Bread Cellophane)', 'ea', '1.2', '1680', '0.23%', '1.15', '1610', '0.11%', '2020-03-20 14:28:54'),
(1674, 2, 6, 1, 'Jelly roll with handle (Jelly roll with handle  )', 'ea', '23', '0', '0.00%', '23', '0', '0.00%', '2020-03-20 14:28:54'),
(1675, 2, 6, 1, 'OPP cellophane (OPP cellophane  )', 'kls', '234.6', '4269.72', '0.58%', '198.33884', '3609.77', '0.25%', '2020-03-20 14:28:54'),
(1676, 2, 6, 1, 'Paper bowl (Paper bowl  )', 'ea', '3.8', '0', '0.00%', '8.85', '0', '0.00%', '2020-03-20 14:28:54'),
(1677, 2, 6, 1, 'Plastic Cellophane 3x12 ice bag (Plastic Cellophane 3x12 ice bag Texas  )', 'ea', '0.3', '355.2', '0.05%', '0.18', '216', '0.02%', '2020-03-20 14:28:54'),
(1678, 2, 6, 1, 'Plastic cellophane honey gold ( (Plastic cellophane honey gold (8x14 )  )', 'Pck', '14.15', '0', '0.00%', '16.5', '0', '0.00%', '2020-03-20 14:28:54'),
(1679, 2, 6, 1, 'Plastic Cups Transparent (Plastic Cups Transparent Elasto (50pcs/pck)  )', 'ea', '5.5', '0', '0.00%', '1.02', '0', '0.00%', '2020-03-20 14:28:54'),
(1680, 2, 6, 1, 'Rippled Cup 12oz (Rippled Cup 12oz)', 'ea', '10.05', '0', '0.00%', '10.05', '0', '0.00%', '2020-03-20 14:28:54'),
(1681, 2, 6, 1, 'Round Cake Board (Round Cake Board  )', 'ea', '12.95', '10176.71', '1.37%', '8', '6288', '0.43%', '2020-03-20 14:28:54'),
(1682, 2, 6, 1, 'Sandobag Large (Sandobag Large  )', 'ea', '1.8', '2395.79', '0.32%', '1.8', '2395.8', '0.16%', '2020-03-20 14:28:54'),
(1683, 2, 6, 1, 'Sandobag Medium (Sandobag Medium  )', 'ea', '1.3', '15421.9', '2.08%', '1.3', '15421.9', '1.06%', '2020-03-20 14:28:54'),
(1684, 2, 6, 1, 'Sandobag tiny (Sandobag tiny  )', 'ea', '0.68', '8285.72', '1.12%', '0.28', '3430.28', '0.24%', '2020-03-20 14:28:54'),
(1685, 2, 6, 1, 'Supot # 2 (Supot # 2  )', 'ea', '0.36', '0', '0.00%', '0.36', '0', '0.00%', '2020-03-20 14:28:54'),
(1686, 2, 6, 1, 'Supot # 3 (Supot # 3  )', 'ea', '0.4', '5570.6', '0.75%', '0.4012', '5569.06', '0.38%', '2020-03-20 14:28:54'),
(1687, 2, 6, 1, 'Supot # 4 (4000pcs) (Supot # 4 (4000pcs))', 'ea', '1.11', '0', '0.00%', '0.4625', '0', '0.00%', '2020-03-20 14:28:54'),
(1688, 2, 6, 1, 'Supot # 6 (Supot # 6  )', 'ea', '0.77', '3847.29', '0.52%', '0.757', '3785', '0.26%', '2020-03-20 14:28:54'),
(1689, 2, 6, 1, 'Supot # 8 (Supot # 8  )', 'ea', '0.88', '5593.3', '0.75%', '0.884', '5593.07', '0.38%', '2020-03-20 14:28:54'),
(1690, 2, 6, 1, 'Supot #5 (3000pcs) (Supot #5 (3000pcs))', 'ea', '0.65', '3871.4', '0.52%', '0.64047', '3842.82', '0.26%', '2020-03-20 14:28:54'),
(1691, 2, 6, 1, 'Take out bowl medium (Take out bowl medium  )', 'ea', '4.59', '0', '0.00%', '7.5', '0', '0.00%', '2020-03-20 14:28:54'),
(1692, 2, 6, 1, 'Take out box Transparent (Take out box Transparent   )', 'ea', '10.25', '358.75', '0.05%', '8', '280', '0.02%', '2020-03-20 14:28:54'),
(1693, 2, 6, 1, 'Take out coffee cups (Take out coffee cups  )', 'ea', '10.08', '1219.77', '0.16%', '15.95', '1929.95', '0.13%', '2020-03-20 14:28:54'),
(1694, 2, 6, 1, 'Take out cold cups (Take out cold cups  )', 'ea', '8.24', '1622.3', '0.22%', '5.58', '1099.26', '0.08%', '2020-03-20 14:28:54'),
(1695, 2, 6, 1, 'Take out fork (Take out fork   )', 'ea', '0.85', '99.97', '0.01%', '0.73', '86.14', '0.01%', '2020-03-20 14:28:54'),
(1696, 2, 6, 1, 'Take out sauceboat (Take out sauceboat  )', 'ea', '0.6', '0', '0.00%', '0.6', '0', '0.00%', '2020-03-20 14:28:54'),
(1697, 2, 6, 1, 'Take out spoon (Take out spoon   )', 'ea', '0.63', '14.57', '0.00%', '0.73', '16.79', '0.00%', '2020-03-20 14:28:54'),
(1698, 2, 6, 1, 'Tebow Large (Tebow Large)', 'ea', '1.6', '0', '0.00%', '1.6', '0', '0.00%', '2020-03-20 14:28:54'),
(1699, 2, 6, 1, 'Toasted siopao box (Toasted siopao box  )', 'ea', '14', '0', '0.00%', '14', '0', '0.00%', '2020-03-20 14:28:54'),
(1700, 2, 6, 1, 'wooden spoon (Wooden Spoon)', 'ea', '0.75', '0', '0.00%', '1.5', '0', '0.00%', '2020-03-20 14:28:54'),
(1701, 2, 7, 1, 'Alcation (Alsacian - portion  )', 'Prtn', '389.32', '0', '0.00%', '313.1', '0', '0.00%', '2020-03-20 14:30:46'),
(1702, 2, 7, 1, 'Beef Bulalo (Beef Bulalo)', 'Prtn', '198.94', '0', '0.00%', '198.94', '0', '0.00%', '2020-03-20 14:30:46'),
(1703, 2, 7, 1, 'Beef Tapa (Beef Tapa)', 'Prtn', '40.87', '735.66', '0.10%', '40.87', '735.66', '0.05%', '2020-03-20 14:30:46'),
(1704, 2, 7, 1, 'Beef Tocino (Beef Tocino)', 'Prtn', '24.08', '0', '0.00%', '24.3', '0', '0.00%', '2020-03-20 14:30:46'),
(1705, 2, 7, 1, 'Bolognaise (100gmrs/portion) (Bolognaise (100gmrs/portion)  )', 'Prtn', '21.82', '0', '0.00%', '27.8', '0', '0.00%', '2020-03-20 14:30:46'),
(1706, 2, 7, 1, 'Brown Sauce (Brown Sauce (50grams/portion)   )', 'Prtn', '4.84', '33.88', '0.01%', '4.57', '31.99', '0.00%', '2020-03-20 14:30:46'),
(1707, 2, 7, 1, 'C.Teriyaki (Chicken Teriyaki)', 'Prtn', '33.83', '0', '0.00%', '33.83', '0', '0.00%', '2020-03-20 14:30:46'),
(1708, 2, 7, 1, 'Chicken Adobo (Chicken Adobo)', 'Prtn', '12', '0', '0.00%', '12', '0', '0.00%', '2020-03-20 14:30:46'),
(1709, 2, 7, 1, 'Chicken Ala King (Chicken Ala King)', 'ea', '109.8', '0', '0.00%', '109.8', '0', '0.00%', '2020-03-20 14:30:46'),
(1710, 2, 7, 1, 'Chicken Curry Meat (130grms) (Chicken Curry Meat (130grms/portion)  )', 'Prtn', '41.31', '867.51', '0.12%', '41.31', '867.51', '0.06%', '2020-03-20 14:30:46'),
(1711, 2, 7, 1, 'Chicken Curry Sauce (Chicken Curry Sauce  )', 'Prtn', '0.13', '0', '0.00%', '0.13', '0', '0.00%', '2020-03-20 14:30:46'),
(1712, 2, 7, 1, 'Chicken Pastel (Chicken Pastel)', 'Prtn', '106.11', '106.11', '0.01%', '106.11', '106.11', '0.01%', '2020-03-20 14:30:46'),
(1713, 2, 7, 1, 'Chicken Sisig (Chicken Sisig  )', 'Prtn', '29.87', '209.11', '0.03%', '30.14', '210.98', '0.01%', '2020-03-20 14:30:46'),
(1714, 2, 7, 1, 'Chicken Tandori (150gms) (Chicken Tandori (150gms/serving)  )', 'Prtn', '51.05', '0', '0.00%', '71.96', '0', '0.00%', '2020-03-20 14:30:46'),
(1715, 2, 7, 1, 'Chicken Tocino (Chicken Tocino  )', 'Prtn', '28.6', '0', '0.00%', '35.81', '0', '0.00%', '2020-03-20 14:30:46'),
(1716, 2, 7, 1, 'Chicken Wings (Chicken Wings)', 'Prtn', '26.83', '160.98', '0.02%', '26.83', '160.98', '0.01%', '2020-03-20 14:30:46'),
(1717, 2, 7, 1, 'Fettucini Pasta (150grms) (Fettucini Pasta (150grms)  )', 'Prtn', '67.35', '0', '0.00%', '98', '0', '0.00%', '2020-03-20 14:30:46'),
(1718, 2, 7, 1, 'Fish Fillet (100g/portion) (Fish Fillet (100g/portion)  )', 'Prtn', '33.77', '472.77', '0.06%', '33.77', '472.78', '0.03%', '2020-03-20 14:30:46'),
(1719, 2, 7, 1, 'Giant Burger Pattie (Giant Burger Pattie    )', 'Prtn', '45.5', '0', '0.00%', '45.59', '0', '0.00%', '2020-03-20 14:30:46'),
(1720, 2, 7, 1, 'Gideon chicken (Gideon chicken  )', 'Prtn', '55.39', '664.68', '0.09%', '55.39', '664.68', '0.05%', '2020-03-20 14:30:46'),
(1721, 2, 7, 1, 'Ham (Ham - 40gmrs/portion) (Ham (Ham - 40gmrs/portion)  )', 'Prtn', '12.45', '0', '0.00%', '12.45', '0', '0.00%', '2020-03-20 14:30:46'),
(1722, 2, 7, 1, 'Lapoletana Sauce (50grms) (Lapoletana Sauce (50grms)  )', 'Prtn', '65.45', '0', '0.00%', '65.45', '0', '0.00%', '2020-03-20 14:30:46'),
(1723, 2, 7, 1, 'M.Chutney (Mango Chutney(500g))', 'g', '0.51', '0', '0.00%', '0.25928', '0', '0.00%', '2020-03-20 14:30:46'),
(1724, 2, 7, 1, 'Malasugue (Malasugue  )', 'g', '0.34', '0', '0.00%', '0.45', '0', '0.00%', '2020-03-20 14:30:46'),
(1725, 2, 7, 1, 'Mango Chutney Portion (Mango Chutney 30grms/portion)', 'g', '15.11', '423.08', '0.06%', '15.11', '423.08', '0.03%', '2020-03-20 14:30:46'),
(1726, 2, 7, 1, 'Napolitana Sauce (Napolitana Sauce)', 'ea', '6.09', '0', '0.00%', '6.09', '0', '0.00%', '2020-03-20 14:30:46'),
(1727, 2, 7, 1, 'Onion soup (Onion soup  )', 'ea', '34.43', '0', '0.00%', '34.43', '0', '0.00%', '2020-03-20 14:30:46'),
(1728, 2, 7, 1, 'Palabok Sauce (Palabok Sauce)', 'Prtn', '14.38', '388.26', '0.05%', '14.38', '388.26', '0.03%', '2020-03-20 14:30:46'),
(1729, 2, 7, 1, 'Poached Chicken (Poached Chicken  )', 'Prtn', '31.6', '189.6', '0.03%', '31.6', '189.6', '0.01%', '2020-03-20 14:30:46'),
(1730, 2, 7, 1, 'Pork Chop (Pork Chop  )', 'Prtn', '40.42', '727.56', '0.10%', '40.42', '727.56', '0.05%', '2020-03-20 14:30:46'),
(1731, 2, 7, 1, 'Pork Crackling (Pork Crackling  )', 'Prtn', '103.96', '0', '0.00%', '103.96', '0', '0.00%', '2020-03-20 14:30:46'),
(1732, 2, 7, 1, 'Pork Humba (Pork Humba)', 'ea', '20', '0', '0.00%', '20', '0', '0.00%', '2020-03-20 14:30:46'),
(1733, 2, 7, 1, 'Pork Ribs (Pork Ribs  )', 'Prtn', '153.8', '0', '0.00%', '153.8', '0', '0.00%', '2020-03-20 14:30:46'),
(1734, 2, 7, 1, 'Pork Sisig (Pork Sisig  )', 'Prtn', '27.77', '527.63', '0.07%', '27.77', '527.63', '0.04%', '2020-03-20 14:30:46'),
(1735, 2, 7, 1, 'Pork Tapa (Pork Tapa)', 'Prtn', '20.06', '300.9', '0.04%', '20.06', '300.9', '0.02%', '2020-03-20 14:30:46'),
(1736, 2, 7, 1, 'Pork Tocino (Pork Tocino  )', 'Prtn', '23.12', '0', '0.00%', '23.12', '0', '0.00%', '2020-03-20 14:30:46'),
(1737, 2, 7, 1, 'Pumpkin Soup 250gms/portion (Pumpkin Soup 250gms/portion  )', 'Prtn', '20.46', '163.68', '0.02%', '20.46', '163.68', '0.01%', '2020-03-20 14:30:46'),
(1738, 2, 7, 1, 'Rib Eye (Rib Eye  )', 'Prtn', '153.05', '0', '0.00%', '159.19', '0', '0.00%', '2020-03-20 14:30:46'),
(1739, 2, 7, 1, 'Seafood (20grms/portion) (Seafood (20grms/portion)  )', 'Prtn', '11.1', '0', '0.00%', '11.1', '0', '0.00%', '2020-03-20 14:30:46'),
(1740, 2, 7, 1, 'Sesame Chicken (Sesame Chicken  )', 'Prtn', '9.28', '0', '0.00%', '9.28', '0', '0.00%', '2020-03-20 14:30:46'),
(1741, 2, 7, 1, 'Small Burger Pattie (80gms/port (Small Burger Pattie (80gms/portion)  )', 'Prtn', '56.65', '1642.85', '0.22%', '56.65', '1642.85', '0.11%', '2020-03-20 14:30:46'),
(1742, 2, 7, 1, 'Spaghetti Pasta (40g) cooked (Spaghetti Pasta (40g) cooked  )', 'Prtn', '16.59', '0', '0.00%', '16.59', '0', '0.00%', '2020-03-20 14:30:46'),
(1743, 2, 7, 1, 'Tomato soup (Tomato soup  )', 'Prtn', '16.42', '0', '0.00%', '16.42', '0', '0.00%', '2020-03-20 14:30:46'),
(1744, 2, 8, 1, 'Banana Muffins - MIX (BBanana Muffins - MIX)', 'Mix', '328.9', '16773.9', '2.26%', '328.9', '16773.9', '1.15%', '2020-03-20 14:32:42'),
(1745, 2, 8, 1, 'Banana Premix (Banana Premix - 2.5kls)', 'kls', '43.18', '0', '0.00%', '43.18', '0', '0.00%', '2020-03-20 14:32:42'),
(1746, 2, 8, 1, 'Buko Bibingka Mix (Buko Bibingka Mix)', 'Mix', '173.09', '5019.61', '0.68%', '151.7', '4399.3', '0.30%', '2020-03-20 14:32:42'),
(1747, 2, 8, 1, 'Cheese filling Kls (Cheese filling Kls)', 'kls', '96.64', '0', '0.00%', '96.64', '0', '0.00%', '2020-03-20 14:32:42'),
(1748, 2, 8, 1, 'Cheese filling Mix (Cheese filling Mix (Cheese filling 8kls)  )', 'Mix', '798.24', '4254.62', '0.57%', '798.24', '4254.62', '0.29%', '2020-03-20 14:32:42'),
(1749, 2, 8, 1, 'CheeseLoaf kls (CheeseLoaf kls)', 'kls', '75.42', '15385.68', '2.07%', '75.42', '15385.68', '1.05%', '2020-03-20 14:32:42'),
(1750, 2, 8, 1, 'Choco Filling kls (Choco Filling kls)', 'kls', '95.9', '0', '0.00%', '95.89', '0', '0.00%', '2020-03-20 14:32:42'),
(1751, 2, 8, 1, 'Choco Lanay Filling (Choco Lanay Filling   )', 'kls', '83.5', '100.2', '0.01%', '83.5', '100.2', '0.01%', '2020-03-20 14:32:42'),
(1752, 2, 8, 1, 'Cinnamon Filling (Cinnamon Filling kls)', 'Mix', '557.51', '5006.44', '0.68%', '557.51', '5006.44', '0.34%', '2020-03-20 14:32:42'),
(1753, 2, 8, 1, 'Cinnamon with Sugar Filling (Cinnamon with Sugar Filling  )', 'kls', '57.3', '28.65', '0.00%', '57.27', '28.64', '0.00%', '2020-03-20 14:32:42'),
(1754, 2, 8, 1, 'Coco Fruit -Mix (filling) (Coco Fruit Filling -mix 4.850kls  )', 'Mix', '478.47', '0', '0.00%', '553.25', '0', '0.00%', '2020-03-20 14:32:42'),
(1755, 2, 8, 1, 'Coco Fruit Filling -kls (Coco Fruit Filling -kls)', 'kls', '65.69', '0', '0.00%', '103.09', '0', '0.00%', '2020-03-20 14:32:42'),
(1756, 2, 8, 1, 'Coco Fruit Filling -Mix (Coco Fruit Filling -Mix)', 'Mix', '550.37', '4127.77', '0.56%', '550.37', '4127.78', '0.28%', '2020-03-20 14:32:42'),
(1757, 2, 8, 1, 'Ensaymada kls (Ensaymada kls  )', 'kls', '87.16', '0', '0.00%', '87.16', '0', '0.00%', '2020-03-20 14:32:42'),
(1758, 2, 8, 1, 'Fino pandesal kls (Fino pandesal kls)', 'kls', '77.59', '0', '0.00%', '77.59', '0', '0.00%', '2020-03-20 14:32:42'),
(1759, 2, 8, 1, 'French Bread plain-kls (French Bread Plain-Premixes)', 'kls', '72.12', '6058.08', '0.82%', '72.12', '6058.08', '0.42%', '2020-03-20 14:32:42'),
(1760, 2, 8, 1, 'Frenchbread W.wheat kls (Frenchbread W.wheat premix  )', 'kls', '76.57', '6738.16', '0.91%', '76.57', '6738.16', '0.46%', '2020-03-20 14:32:42'),
(1761, 2, 8, 1, 'Fruit John Filling (Fruit John Filling)', 'g', '0.1', '0', '0.00%', '0.1', '0', '0.00%', '2020-03-20 14:32:42'),
(1762, 2, 8, 1, 'Marjorie filling (Marjorie filling  )', 'g', '0.21', '0', '0.00%', '0.22186', '0', '0.00%', '2020-03-20 14:32:42'),
(1763, 2, 8, 1, 'Marjorie filling Kls (Marjorie filling (Marjorie filling  )  )', 'kls', '220.4', '8573.56', '1.16%', '220.4', '8573.56', '0.59%', '2020-03-20 14:32:42'),
(1764, 2, 8, 1, 'Monay premix (Monay premix/kl)', 'kls', '70.22', '5687.82', '0.77%', '70.22', '5687.82', '0.39%', '2020-03-20 14:32:42'),
(1765, 2, 8, 1, 'Pilipit premix - kls (Pilipit premix - kls)', 'kls', '70.93', '42203.35', '5.69%', '70.93', '42203.35', '2.89%', '2020-03-20 14:32:42'),
(1766, 2, 8, 1, 'Putok premix (Putok premix  )', 'kls', '76.64', '2299.2', '0.31%', '76.64', '2299.2', '0.16%', '2020-03-20 14:32:42'),
(1767, 2, 8, 1, 'Strussels-kls (Strussels  )', 'kls', '179.93', '251.9', '0.03%', '237.61', '332.65', '0.02%', '2020-03-20 14:32:42'),
(1768, 2, 8, 1, 'Strussels-Mix (Strussels-Mix)', 'Mix', '179.93', '359.86', '0.05%', '179.93', '359.86', '0.03%', '2020-03-20 14:32:42'),
(1769, 2, 8, 1, 'Sweetdough (Sweetdough  )', 'kls', '71.84', '55316.8', '7.46%', '71.84', '55316.8', '3.79%', '2020-03-20 14:32:42'),
(1770, 2, 8, 1, 'Sweetdough (ingredient w/o Flou (Sweetdough (ingredient w/o Flour )  )', 'g', '0.05', '0', '0.00%', '0.05', '0', '0.00%', '2020-03-20 14:32:42'),
(1771, 2, 8, 1, 'Whole wheat premix (Whole wheat premix  )', 'kls', '63.11', '2840.1', '0.38%', '63.11', '2839.95', '0.19%', '2020-03-20 14:32:42'),
(1772, 2, 9, 1, 'Alaska Evap (Alaska Evaporated Milk(370 ml))', 'can', '38.18', '613.17', '0.08%', '37.482', '601.96', '0.04%', '2020-03-20 14:34:39'),
(1773, 2, 9, 1, 'All purpose flour (All purpose flour  )', 'kls', '0.52', '1046.52', '0.14%', '37.944', '76836.6', '5.26%', '2020-03-20 14:34:39'),
(1774, 2, 9, 1, 'B.O.S (B.O.S)', 'g', '0.18', '763.15', '0.10%', '0.17748', '763.16', '0.05%', '2020-03-20 14:34:39'),
(1775, 2, 9, 1, 'Baking Powder-Grms (Baking Powder - grammage)', 'g', '0.11', '516.13', '0.07%', '0.11634', '535.16', '0.04%', '2020-03-20 14:34:39'),
(1776, 2, 9, 1, 'Baking Soda (Baking Soda - grammage)', 'g', '0.04', '110.66', '0.02%', '0.04', '124', '0.01%', '2020-03-20 14:34:39'),
(1777, 2, 9, 1, 'Banana fresh (Banana fresh - Lacatan  )', 'kls', '35', '8785', '1.18%', '35', '8785', '0.60%', '2020-03-20 14:34:39'),
(1778, 2, 9, 1, 'Blueberry (Blueberry 595 gms    )', 'can', '211.14', '0', '0.00%', '220.38', '0', '0.00%', '2020-03-20 14:34:39'),
(1779, 2, 9, 1, 'Bread Crumbs (Bread Crumbs)', 'kls', '59.11', '7370.63', '0.99%', '61.2', '7631.64', '0.52%', '2020-03-20 14:34:39'),
(1780, 2, 9, 1, 'Bread Impover (Bread Impover)', 'g', '0.08', '81.58', '0.01%', '0.07', '70', '0.01%', '2020-03-20 14:34:39'),
(1781, 2, 9, 1, 'Brown Sugar (Brown Sugar)', 'g', '0.04', '6172.45', '0.83%', '0.03672', '6172.63', '0.42%', '2020-03-20 14:34:39'),
(1782, 2, 9, 1, 'Building board (Building board  )', 'ea', '25', '150', '0.02%', '25', '150', '0.01%', '2020-03-20 14:34:39'),
(1783, 2, 9, 1, 'Buko Fresh (Buko Fresh grammage)', 'g', '0.12', '480', '0.07%', '0.12', '480', '0.03%', '2020-03-20 14:34:39'),
(1784, 2, 9, 1, 'Butter Cup (Butter Cup per bar)', 'ea', '43.52', '2045.42', '0.28%', '36.34797', '1708.35', '0.12%', '2020-03-20 14:34:39'),
(1785, 2, 9, 1, 'Butter Milk (Butter Milk)', 'g', '0.23', '0', '0.00%', '0.12', '0', '0.00%', '2020-03-20 14:34:39'),
(1786, 2, 9, 1, 'Butter Unsalted 5kg/bar (Butter Unsalted 5kg/bar)', 'g', '0.5', '45.27', '0.01%', '0.503', '45.27', '0.00%', '2020-03-20 14:34:39'),
(1787, 2, 9, 1, 'Cake Flour - kls (Cake Flour - kls  )', 'kls', '40.8', '771.12', '0.10%', '46.15533', '872.34', '0.06%', '2020-03-20 14:34:39'),
(1788, 2, 9, 1, 'Cherries w/Stem (Cherries with stem 1050ml/bot    )', 'Bot', '318.3', '1139.51', '0.15%', '310.9', '1113.02', '0.08%', '2020-03-20 14:34:39'),
(1789, 2, 9, 1, 'Choco Glaze (Chocolate Glaze)', 'g', '0.3', '14172.55', '1.91%', '0.272', '12648', '0.87%', '2020-03-20 14:34:39'),
(1790, 2, 9, 1, 'Chocolate (green - 5 (Semi Sweet Chocolate (green - 500g)  )', 'g', '0.17', '0', '0.00%', '0.28', '0', '0.00%', '2020-03-20 14:34:39'),
(1791, 2, 9, 1, 'Chocolate (white) (Chocolate (white)  )', 'g', '0.24', '0', '0.00%', '0.24', '0', '0.00%', '2020-03-20 14:34:39'),
(1792, 2, 9, 1, 'Cinnamon Powder (1kl/pck) (Cinnamon Powder (1kl/pck)  )', 'g', '0.35', '245.05', '0.03%', '0.2856', '202.78', '0.01%', '2020-03-20 14:34:39'),
(1793, 2, 9, 1, 'Cocoa (Cocoa)', 'g', '0.31', '3473.38', '0.47%', '0.31012', '3473.34', '0.24%', '2020-03-20 14:34:39'),
(1794, 2, 9, 1, 'Comstock Blue Berry Patch Straw (Comstock Blue Berry Patch Strawberry (595gms)  )', 'Bot', '220.3', '0', '0.00%', '220.38', '0', '0.00%', '2020-03-20 14:34:39'),
(1795, 2, 9, 1, 'Condense Milk 380ml (Condense Milk 300ml  )', 'can', '53.74', '5562.34', '0.75%', '52.426', '5426.09', '0.37%', '2020-03-20 14:34:39'),
(1796, 2, 9, 1, 'Cranberries (Cranberries 100gms/pck  )', 'Pck', '30.15', '108.24', '0.02%', '29.3', '105.19', '0.01%', '2020-03-20 14:34:39'),
(1797, 2, 9, 1, 'Cream cheese- Magnolia (bar) (Cream cheese- Magnolia (bar)  )', 'ea', '390', '0', '0.00%', '394.225', '0', '0.00%', '2020-03-20 14:34:39'),
(1798, 2, 9, 1, 'Cream cheese-Swiss Valley (Cream cheese-Swiss Valley - bars  )', 'ea', '463.67', '0', '0.00%', '485.88', '0', '0.00%', '2020-03-20 14:34:39'),
(1799, 2, 9, 1, 'Cream of Tarter (Cream of Tarter grams)', 'g', '0.29', '0', '0.00%', '0.37', '0', '0.00%', '2020-03-20 14:34:39'),
(1800, 2, 9, 1, 'Creamfil vanilla -grams (Creamfil vanilla -grams)', 'g', '0.17', '17334', '2.34%', '0.177', '17700', '1.21%', '2020-03-20 14:34:39'),
(1801, 2, 9, 1, 'Dahon Saging (Dahon Saging grms)', 'g', '0.02', '298.62', '0.04%', '0.01588', '214.38', '0.02%', '2020-03-20 14:34:39'),
(1802, 2, 9, 1, 'Desc.Coconut (120) (Dessicated coconut 120/kls - grams  )', 'g', '0.15', '0', '0.00%', '0.12', '0', '0.00%', '2020-03-20 14:34:39'),
(1803, 2, 9, 1, 'Dessicated coconut (Dessicated coconut  )', 'g', '0.15', '1285.33', '0.17%', '0.07084', '595.06', '0.04%', '2020-03-20 14:34:39'),
(1804, 2, 9, 1, 'Diamond Glaze 5kls /Pail (Diamond Glaze 5kls /Pail  )', 'kls', '246.71', '0', '0.00%', '235.33', '0', '0.00%', '2020-03-20 14:34:39'),
(1805, 2, 9, 1, 'Dole Pineapple Crushed 234g (Dole Pineapple Crushed 234g)', 'ea', '24.17', '0', '0.00%', '24.17', '0', '0.00%', '2020-03-20 14:34:39'),
(1806, 2, 9, 1, 'Dole Pineapple Tidbits 439/432g (Dole Pineapple Tidbits 439/432g)', 'ea', '24.5', '0', '0.00%', '44.4', '0', '0.00%', '2020-03-20 14:34:39'),
(1807, 2, 9, 1, 'Egg yellow (Egg yellow 500gms/pck    )', 'Pck', '81.6', '97.92', '0.01%', '81.6', '97.92', '0.01%', '2020-03-20 14:34:39'),
(1808, 2, 9, 1, 'Eggs - pc (Eggs in pcs (30pcs/tray))', 'ea', '5.67', '37753', '5.09%', '5.4', '35931.6', '2.46%', '2020-03-20 14:34:39'),
(1809, 2, 9, 1, 'Filled cheese-grms (Filled cheese  )', 'g', '0.24', '65171.7', '8.79%', '0.21465', '58084.29', '3.98%', '2020-03-20 14:34:39'),
(1810, 2, 9, 1, 'First class flour-grms (First class flour - grms  )', 'g', '0.03', '6671.24', '0.90%', '0.03335', '6670', '0.46%', '2020-03-20 14:34:39'),
(1811, 2, 9, 1, 'Freshmilk-Pure milk (Freshmilk- (Freshmilk-Pure milk (Freshmilk- Pure milk  )  )', 'Pck', '60', '0', '0.00%', '62', '0', '0.00%', '2020-03-20 14:34:39'),
(1812, 2, 9, 1, 'Glassin Paper (Glassin Paper  )', 'ea', '1.57', '677.02', '0.09%', '1.53', '659.43', '0.05%', '2020-03-20 14:34:39'),
(1813, 2, 9, 1, 'Glaze Fruit (Glaze Fruit (KG))', 'g', '0.29', '0', '0.00%', '0.2856', '0', '0.00%', '2020-03-20 14:34:39'),
(1814, 2, 9, 1, 'Hotdog (Hotdog  )', 'g', '0.09', '0', '0.00%', '0.0925', '0', '0.00%', '2020-03-20 14:34:39'),
(1815, 2, 9, 1, 'Lard (Lard  )', 'g', '0.09', '3699.25', '0.50%', '0.11917', '5064.73', '0.35%', '2020-03-20 14:34:39'),
(1816, 2, 9, 1, 'Macapuno Meat (Macapuno Jam)', 'g', '0.2', '6036.33', '0.81%', '0.2', '6040', '0.41%', '2020-03-20 14:34:39'),
(1817, 2, 9, 1, 'Margarine (45kls/pail) (Margarine (45kls/pail)  )', 'g', '0.08', '587.54', '0.08%', '0.0816', '587.52', '0.04%', '2020-03-20 14:34:39'),
(1818, 2, 9, 1, 'Mayonnaise (Mayonnaise  )', 'g', '0.12', '2373.19', '0.32%', '0.11707', '2375.35', '0.16%', '2020-03-20 14:34:39'),
(1819, 2, 9, 1, 'Micram (Micram  )', 'g', '0.21', '0', '0.00%', '0.21', '0', '0.00%', '2020-03-20 14:34:39'),
(1820, 2, 9, 1, 'Mix rye flour (Mix rye flour  )', 'g', '0.24', '0', '0.00%', '0.24', '0', '0.00%', '2020-03-20 14:34:39'),
(1821, 2, 9, 1, 'Mollases (Mollases  )', 'g', '0.07', '428.18', '0.06%', '0.0625', '361.56', '0.03%', '2020-03-20 14:34:39'),
(1822, 2, 9, 1, 'Mollases (4ltrs/GAL) (Mollases 4ltrs/Gal  )', 'Gal', '250', '0', '0.00%', '250', '0', '0.00%', '2020-03-20 14:34:39'),
(1823, 2, 9, 1, 'Monggo paste (Monggo paste  )', 'g', '0.11', '649', '0.09%', '0.1122', '661.98', '0.05%', '2020-03-20 14:34:39'),
(1824, 2, 9, 1, 'Oatmeal (Oatmeal  )', 'g', '0.1', '0', '0.00%', '0.12338', '0', '0.00%', '2020-03-20 14:34:39'),
(1825, 2, 9, 1, 'Pauls Milk (1ltrx12) (Pure Milk 1 Lit. 12\'s)', 'Ltr', '62', '0', '0.00%', '55', '0', '0.00%', '2020-03-20 14:34:39'),
(1826, 2, 9, 1, 'Peanut (Peanut  )', 'kls', '85.68', '642.6', '0.09%', '112.2', '841.5', '0.06%', '2020-03-20 14:34:39'),
(1827, 2, 9, 1, 'Pineapple crushed- 567gms/can (Pineapple crushed 567gms/can  )', 'can', '54.9', '0', '0.00%', '51.2', '0', '0.00%', '2020-03-20 14:34:39'),
(1828, 2, 9, 1, 'Pineapple crushed - 227gms (Pineapple crushed - 227gms)', 'can', '24.02', '3025.91', '0.41%', '23.7', '2986.2', '0.20%', '2020-03-20 14:34:39'),
(1829, 2, 9, 1, 'Pineapple crushed - 439gms (Pineapple crushed - 439gms)', 'can', '40.58', '81.16', '0.01%', '42.55', '85.1', '0.01%', '2020-03-20 14:34:39');
INSERT INTO `eb_raw_materials` (`PK_raw_materials_id`, `FK_outlet_id`, `FK_category_id`, `status`, `material_name`, `unit`, `average_cost`, `asset_value`, `total_asset_percent`, `sales_price`, `retail_value`, `total_retail_percent`, `date_added`) VALUES
(1830, 2, 9, 1, 'Powder sugar (Powder Sugar)', 'g', '0.1', '2224.41', '0.30%', '0.10251', '2224.467', '0.15%', '2020-03-20 14:34:39'),
(1831, 2, 9, 1, 'Powdered Milk (Powdered Milk   )', 'kls', '110.22', '143.29', '0.02%', '108', '140.4', '0.01%', '2020-03-20 14:34:39'),
(1832, 2, 9, 1, 'Quacker Oats (400g) (Quacker Oats (400g)  )', 'g', '0.11', '0', '0.00%', '0.05', '0', '0.00%', '2020-03-20 14:34:39'),
(1833, 2, 9, 1, 'Quaker Oats 800g (Quaker Oats 800g  )', 'Pck', '97.7', '0', '0.00%', '97.7', '0', '0.00%', '2020-03-20 14:34:39'),
(1834, 2, 9, 1, 'Raisin (Raisin  )', 'g', '0.17', '0', '0.00%', '0.2365', '0', '0.00%', '2020-03-20 14:34:39'),
(1835, 2, 9, 1, 'Semi Sweet Chocolate (black - 5 (Semi Sweet Chocolate (black - 500g)  )', 'g', '0.24', '0', '0.00%', '0.48', '0', '0.00%', '2020-03-20 14:34:39'),
(1836, 2, 9, 1, 'Sesame seeds (Sesame seeds)', 'g', '0.16', '404.58', '0.06%', '0.195', '483.41', '0.03%', '2020-03-20 14:34:39'),
(1837, 2, 9, 1, 'Sugar syrup (Sugar syrup)', 'g', '0.06', '0', '0.00%', '0.02617', '0', '0.00%', '2020-03-20 14:34:39'),
(1838, 2, 9, 1, 'Super syrup (Super syrup)', 'kls', '71.81', '5395.38', '0.73%', '64.26', '4827.85', '0.33%', '2020-03-20 14:34:39'),
(1839, 2, 9, 1, 'Tanduay (Tanduay Rhum)', 'g', '0.12', '43.35', '0.01%', '0.22032', '82.62', '0.01%', '2020-03-20 14:34:39'),
(1840, 2, 9, 1, 'Tanduay per Bott (Tanduay Rhumper Bottle  )', 'Bot', '82.93', '0', '0.00%', '81', '0', '0.00%', '2020-03-20 14:34:39'),
(1841, 2, 9, 1, 'Third class flour (Third class flour)', 'g', '0.05', '0', '0.00%', '0.0276', '0', '0.00%', '2020-03-20 14:34:39'),
(1842, 2, 9, 1, 'Ube F (Ube flavor)', 'g', '0.46', '376.38', '0.05%', '0.45', '369', '0.03%', '2020-03-20 14:34:39'),
(1843, 2, 9, 1, 'Ube Paste (Ube Paste  )', 'g', '0.11', '1660.58', '0.22%', '0.1122', '1660.56', '0.11%', '2020-03-20 14:34:39'),
(1844, 2, 9, 1, 'Ube Powder (Ube Powder)', 'g', '0.28', '0', '0.00%', '0.27236', '0', '0.00%', '2020-03-20 14:34:39'),
(1845, 2, 9, 1, 'Unsweetend Chocolate (brown - 5 (Unsweetened Chocolate (brown - 500g)  )', 'g', '0.2', '0', '0.00%', '0.2', '0', '0.00%', '2020-03-20 14:34:39'),
(1846, 2, 9, 1, 'Vanilla (Vanilla  )', 'Bot', '0.18', '4425', '0.60%', '26.25', '656250', '44.91%', '2020-03-20 14:34:39'),
(1847, 2, 9, 1, 'Vanilla(Gallon) (Vanilla (Gallon))', 'g', '0.03', '167.83', '0.02%', '0.02964', '150.72', '0.01%', '2020-03-20 14:34:39'),
(1848, 2, 9, 1, 'Vegatable oil (Vegatable oil  )', 'g', '0.06', '25167.09', '3.39%', '0.07', '30380', '2.08%', '2020-03-20 14:34:39'),
(1849, 2, 9, 1, 'Water (Water (Gal))', 'Gal', '30.67', '460', '0.06%', '30', '450', '0.03%', '2020-03-20 14:34:39'),
(1850, 2, 9, 1, 'Whip cream (Whip cream (4.5kls/pail  )  )', 'kls', '208.89', '6579.99', '0.89%', '213.33', '6719.9', '0.46%', '2020-03-20 14:34:39'),
(1851, 2, 9, 1, 'Whipping cream (Whipping cream  )', 'g', '0.21', '0', '0.00%', '0.272', '0', '0.00%', '2020-03-20 14:34:39'),
(1852, 2, 9, 1, 'White sugar (White sugar  )', 'g', '0.08', '13186.65', '1.78%', '0.05059', '8671.13', '0.59%', '2020-03-20 14:34:39'),
(1853, 2, 9, 1, 'WholeWheat  Flour (WholeWheat  Flour)', 'g', '0.05', '0', '0.00%', '0.05', '0', '0.00%', '2020-03-20 14:34:39'),
(1854, 2, 9, 1, 'Yeast-Angel (Yeast-Angel  )', 'g', '0.22', '8202.3', '1.11%', '0.2142', '7829.01', '0.54%', '2020-03-20 14:34:39'),
(1855, 2, 11, 1, 'MX3 Capsule (MX3 Capsule)', 'Pck', '907.2', '0', '0.00%', '1008', '0', '0.00%', '2020-03-20 14:36:11'),
(1856, 2, 11, 1, 'MX3 Coffee (MX3 Coffee.New)', 'ea', '0', '0', '0.00%', '159', '795', '0.05%', '2020-03-20 14:36:11'),
(1857, 2, 12, 1, 'Organica Big (Organica Big)', '', '120', '600', '0.08%', '159.59', '797.95', '0.06%', '2020-03-20 14:38:52'),
(1858, 2, 12, 1, 'Organica Small (Organica Small)', '', '49.95', '1498.5', '0.20%', '57', '1710', '0.12%', '2020-03-20 14:38:52'),
(1859, 2, 10, 1, 'Assorted Cookies (Assorted Cookies  )', 'ea', '3.86', '0', '0.00%', '3.86', '0', '0.00%', '2020-03-20 14:43:16'),
(1860, 2, 10, 1, 'Bagumbayan (Bagumbayan)', 'ea', '5.85', '0', '0.00%', '5.85', '0', '0.00%', '2020-03-20 14:43:16'),
(1861, 2, 10, 1, 'banana catsup(1 Gal) (Banana Catsup (Gal))', 'g', '0.02', '1.52', '0.00%', '0.0218', '1.7', '0.00%', '2020-03-20 14:43:16'),
(1862, 2, 10, 1, 'Banana Catsup(Sachet) (Banana Catsup(Sachet))', 'ea', '0.82', '0', '0.00%', '0.7875', '0', '0.00%', '2020-03-20 14:43:16'),
(1863, 2, 10, 1, 'Banana Muffins (Banana Muffins  )', 'ea', '4.5', '0', '0.00%', '4.5', '0', '0.00%', '2020-03-20 14:43:16'),
(1864, 2, 10, 1, 'Bavarian Loaf (Bavarian Loaf)', 'ea', '21.61', '64.83', '0.01%', '21.61', '64.83', '0.00%', '2020-03-20 14:43:16'),
(1865, 2, 10, 1, 'Big Bibingka (Big Bibingka  )', 'ea', '16.13', '16.13', '0.00%', '16.13', '16.13', '0.00%', '2020-03-20 14:43:16'),
(1866, 2, 10, 1, 'Binangkal (Binangkal  )', 'ea', '4.48', '3248', '0.44%', '4.48', '3248', '0.22%', '2020-03-20 14:43:16'),
(1867, 2, 10, 1, 'Breaded Bacon Loaf (Breaded Bacon Loaf)', 'ea', '23.72', '0', '0.00%', '23.72', '0', '0.00%', '2020-03-20 14:43:16'),
(1868, 2, 10, 1, 'Buko Bibingka (Buko Bibingka  )', 'ea', '12.3', '0', '0.00%', '12.3', '0', '0.00%', '2020-03-20 14:43:16'),
(1869, 2, 10, 1, 'Catsup (Tita Frita 1Gal) (Catsup (Tita Frita 1Gal)  )', 'g', '0.02', '0', '0.00%', '83.55', '0', '0.00%', '2020-03-20 14:43:16'),
(1870, 2, 10, 1, 'Catsup pc (Catsup pc)', 'ea', '0.83', '0', '0.00%', '0.79', '0', '0.00%', '2020-03-20 14:43:16'),
(1871, 2, 10, 1, 'CBL (CBL)', 'ea', '27.02', '1972.46', '0.27%', '27.02', '1972.46', '0.14%', '2020-03-20 14:43:16'),
(1872, 2, 10, 1, 'Cheese Bread (Cheese Bread  )', 'ea', '6.21', '37.26', '0.01%', '6.21', '37.26', '0.00%', '2020-03-20 14:43:16'),
(1873, 2, 10, 1, 'Cheese Cross Buns x8 (Cheese Cross Buns x8  )', 'ea', '29.52', '0', '0.00%', '29.51', '0', '0.00%', '2020-03-20 14:43:16'),
(1874, 2, 10, 1, 'Cheese Monay (Cheese Monay  )', 'ea', '2.46', '0', '0.00%', '2.46', '0', '0.00%', '2020-03-20 14:43:16'),
(1875, 2, 10, 1, 'Chiffon Big (Chiffon Big  )', 'ea', '109.71', '0', '0.00%', '109.71', '0', '0.00%', '2020-03-20 14:43:16'),
(1876, 2, 10, 1, 'Chiffon Small (Chiffon Small  )', 'ea', '67.54', '270.16', '0.04%', '67.54', '270.16', '0.02%', '2020-03-20 14:43:16'),
(1877, 2, 10, 1, 'Chiffon Xsmal (Chiffon Xsmal)', 'ea', '30.53', '0', '0.00%', '30.53', '0', '0.00%', '2020-03-20 14:43:16'),
(1878, 2, 10, 1, 'Chinese Hopia (Chinese Hopia  )', 'ea', '6.1', '225.7', '0.03%', '6.1', '225.7', '0.02%', '2020-03-20 14:43:16'),
(1879, 2, 10, 1, 'Choco Crinkles (Choco Crinkles  )', 'ea', '6.35', '0', '0.00%', '6.35', '0', '0.00%', '2020-03-20 14:43:16'),
(1880, 2, 10, 1, 'Choco Flowing (Choco Flowing  )', 'ea', '5.51', '0', '0.00%', '5.51', '0', '0.00%', '2020-03-20 14:43:16'),
(1881, 2, 10, 1, 'Ciabatta (Ciabatta  )', 'Pck', '12', '60', '0.01%', '12', '60', '0.00%', '2020-03-20 14:43:16'),
(1882, 2, 10, 1, 'Cinnamon loaf (Cinnamon loaf  )', 'ea', '23.7', '0', '0.00%', '23.7', '0', '0.00%', '2020-03-20 14:43:16'),
(1883, 2, 10, 1, 'Cinnamon Slice (Cinnamon Slice  )', 'ea', '11.13', '89.04', '0.01%', '11.13', '89.04', '0.01%', '2020-03-20 14:43:16'),
(1884, 2, 10, 1, 'Cinnamon Syrup Bread (Cinnamon Syrup Bread)', 'ea', '4.79', '0', '0.00%', '4.79', '0', '0.00%', '2020-03-20 14:43:16'),
(1885, 2, 10, 1, 'Coco Bread (Coco Bread  )', 'ea', '6.9', '0', '0.00%', '6.9', '0', '0.00%', '2020-03-20 14:43:16'),
(1886, 2, 10, 1, 'Coke Mismo (Coke Mismo   )', 'ea', '12.08', '0', '0.00%', '6.25', '0', '0.00%', '2020-03-20 14:43:16'),
(1887, 2, 10, 1, 'Communion Bread (Communion Bread)', 'ea', '13.98', '251.64', '0.03%', '13.98', '251.64', '0.02%', '2020-03-20 14:43:16'),
(1888, 2, 10, 1, 'Cookies and Cream (Tub) (Cookies and Cream (Tub)   )', 'ea', '39.11', '0', '0.00%', '39.11', '0', '0.00%', '2020-03-20 14:43:16'),
(1889, 2, 10, 1, 'Cookies and Cream fun size (Cookies and Cream Chilled)', 'ea', '18', '0', '0.00%', '18', '0', '0.00%', '2020-03-20 14:43:16'),
(1890, 2, 10, 1, 'Cracked Wholewheat (Cracked Wholewheat  )', 'ea', '23.1', '0', '0.00%', '23.1', '0', '0.00%', '2020-03-20 14:43:16'),
(1891, 2, 10, 1, 'Cream Bread Jumbo (Cream Bread Jumbo  )', 'ea', '36.47', '2917.6', '0.39%', '37.29', '2983.2', '0.20%', '2020-03-20 14:43:16'),
(1892, 2, 10, 1, 'Crotons (Crotons)', 'Pck', '21.3', '0', '0.00%', '21.3', '0', '0.00%', '2020-03-20 14:43:16'),
(1893, 2, 10, 1, 'Custard Cake (Custard Cake)', 'ea', '18', '90', '0.01%', '18', '90', '0.01%', '2020-03-20 14:43:16'),
(1894, 2, 10, 1, 'Dark Rye Oats (Dark Rye Oats  )', 'ea', '34.7', '0', '0.00%', '34.7', '0', '0.00%', '2020-03-20 14:43:16'),
(1895, 2, 10, 1, 'Dinner Roll (Dinner Roll)', 'ea', '19.68', '0', '0.00%', '19.68', '0', '0.00%', '2020-03-20 14:43:16'),
(1896, 2, 10, 1, 'Donut Mini Choco (Donut Mini Choco  )', 'ea', '5.61', '0', '0.00%', '5.61', '0', '0.00%', '2020-03-20 14:43:16'),
(1897, 2, 10, 1, 'Donut Mini Plain (Donut Mini Plain)', 'ea', '5.61', '0', '0.00%', '5.61', '0', '0.00%', '2020-03-20 14:43:16'),
(1898, 2, 10, 1, 'Donut Plain (Donut Plain)', 'ea', '3.69', '276.75', '0.04%', '3.69', '276.75', '0.02%', '2020-03-20 14:43:16'),
(1899, 2, 10, 1, 'Donut Plain with filling (Donut Plain with filling  )', 'ea', '5.61', '196.35', '0.03%', '5.61', '196.35', '0.01%', '2020-03-20 14:43:16'),
(1900, 2, 10, 1, 'Double Body Plain (Double Body Plain  )', 'ea', '7.73', '610.67', '0.08%', '7.73', '610.67', '0.04%', '2020-03-20 14:43:16'),
(1901, 2, 10, 1, 'Double Body Ube (Double Body Ube  )', 'ea', '8.48', '322.24', '0.04%', '8.48', '322.24', '0.02%', '2020-03-20 14:43:16'),
(1902, 2, 10, 1, 'Durian Chilled (Durian Chilled)', 'ea', '21.47', '0', '0.00%', '20', '0', '0.00%', '2020-03-20 14:43:16'),
(1903, 2, 10, 1, 'Durian Chocolate (Durian Chocolate  )', 'ea', '58.38', '0', '0.00%', '58.38', '0', '0.00%', '2020-03-20 14:43:16'),
(1904, 2, 10, 1, 'Durian Fun Size (Durian Fun Size)', 'ea', '23.85', '0', '0.00%', '20', '0', '0.00%', '2020-03-20 14:43:16'),
(1905, 2, 10, 1, 'Dutch WW rye large (Dutch WW rye large  )', 'ea', '29.13', '0', '0.00%', '29.13', '0', '0.00%', '2020-03-20 14:43:16'),
(1906, 2, 10, 1, 'Dutch WW rye meduim (Dutch WW rye meduim  )', 'ea', '18.09', '0', '0.00%', '18.09', '0', '0.00%', '2020-03-20 14:43:16'),
(1907, 2, 10, 1, 'Egg Cracker (Egg Cracker  )', 'ea', '16.09', '0', '0.00%', '16.09', '0', '0.00%', '2020-03-20 14:43:16'),
(1908, 2, 10, 1, 'Ensaymada Small (Ensaymada Small  )', 'ea', '6.48', '149.04', '0.02%', '6.48', '149.04', '0.01%', '2020-03-20 14:43:16'),
(1909, 2, 10, 1, 'Euro Butter Loaf (special) (Euro Butter Loaf (special)  )', 'ea', '42.59', '0', '0.00%', '42.59', '0', '0.00%', '2020-03-20 14:43:16'),
(1910, 2, 10, 1, 'Euro Cheese Loaf (Euro Cheese Loaf  )', 'ea', '31.65', '0', '0.00%', '31.65', '0', '0.00%', '2020-03-20 14:43:16'),
(1911, 2, 10, 1, 'Eurodesal (Eurodesal)', 'ea', '2.14', '0', '0.00%', '2.14', '0', '0.00%', '2020-03-20 14:43:16'),
(1912, 2, 10, 1, 'Fenchbread plain-Large (Fenchbread plain-Large  )', 'ea', '16.83', '0', '0.00%', '16.83', '0', '0.00%', '2020-03-20 14:43:16'),
(1913, 2, 10, 1, 'Figue Pie (Figue Pie  )', 'ea', '3.89', '151.71', '0.02%', '3.77', '147.03', '0.01%', '2020-03-20 14:43:16'),
(1914, 2, 10, 1, 'Fino Desal (Fino Desal  )', 'ea', '1.54', '0', '0.00%', '1.54', '0', '0.00%', '2020-03-20 14:43:16'),
(1915, 2, 10, 1, 'Frances Big (Frances Big)', 'ea', '23.32', '0', '0.00%', '23.32', '0', '0.00%', '2020-03-20 14:43:16'),
(1916, 2, 10, 1, 'French Bread Plain-Large (Fenchbread plain-Large  )', 'ea', '16.83', '201.96', '0.03%', '16.83', '201.96', '0.01%', '2020-03-20 14:43:16'),
(1917, 2, 10, 1, 'Frenchbread w.wheat-Large (Frenchbread w.wheat-Large  )', 'ea', '16.81', '151.29', '0.02%', '16.81', '151.29', '0.01%', '2020-03-20 14:43:16'),
(1918, 2, 10, 1, 'Fruit Cake (Fruit Cake)', 'ea', '202.78', '0', '0.00%', '202.78', '0', '0.00%', '2020-03-20 14:43:16'),
(1919, 2, 10, 1, 'Fruit John (Fruit John  )', 'ea', '19.13', '0', '0.00%', '19.13', '0', '0.00%', '2020-03-20 14:43:16'),
(1920, 2, 10, 1, 'Fruitcake (Fruitcake  )', 'ea', '202.78', '0', '0.00%', '202.78', '0', '0.00%', '2020-03-20 14:43:16'),
(1921, 2, 10, 1, 'Fruitty muffins (Fruitty muffins  )', 'ea', '6', '156', '0.02%', '6', '156', '0.01%', '2020-03-20 14:43:16'),
(1922, 2, 10, 1, 'Fry stick bread (Fry stick bread  )', 'ea', '4.93', '547.23', '0.07%', '4.93', '547.23', '0.04%', '2020-03-20 14:43:16'),
(1923, 2, 10, 1, 'Garlic Bread Stick Tumbler (Garlic Bread Stick Tumbler  )', 'ea', '45.82', '0', '0.00%', '45.82', '0', '0.00%', '2020-03-20 14:43:16'),
(1924, 2, 10, 1, 'Garlic mint roll (Garlic mint roll  )', 'ea', '5.45', '0', '0.00%', '5.45', '0', '0.00%', '2020-03-20 14:43:16'),
(1925, 2, 10, 1, 'Garlic Sliced Bread (Garlic Sliced Bread)', 'ea', '4.65', '0', '0.00%', '4.65', '0', '0.00%', '2020-03-20 14:43:16'),
(1926, 2, 10, 1, 'Ham & egg (Ham & egg  )', 'ea', '7.01', '0', '0.00%', '7.01', '0', '0.00%', '2020-03-20 14:43:16'),
(1927, 2, 10, 1, 'Hand Towel (Hand Towel)', 'ea', '25', '0', '0.00%', '40.03', '0', '0.00%', '2020-03-20 14:43:16'),
(1928, 2, 10, 1, 'Hawaiian Upside Down (Hawaiian Upside Down  )', 'ea', '33.49', '0', '0.00%', '33.49', '0', '0.00%', '2020-03-20 14:43:16'),
(1929, 2, 10, 1, 'Hopia Mini Ube (Hopia Mini Ube)', 'ea', '1.69', '169', '0.02%', '1.69', '169', '0.01%', '2020-03-20 14:43:16'),
(1930, 2, 10, 1, 'Hopia Monggo (Hopia Monggo)', 'ea', '1.69', '0', '0.00%', '1.69', '0', '0.00%', '2020-03-20 14:43:16'),
(1931, 2, 10, 1, 'Hopia Pandan (Hopia Pandan)', 'ea', '0', '0', '0.00%', '1.41', '0', '0.00%', '2020-03-20 14:43:16'),
(1932, 2, 10, 1, 'Jelly Roll (Jelly Roll  )', 'ea', '109.84', '0', '0.00%', '109.84', '0', '0.00%', '2020-03-20 14:43:16'),
(1933, 2, 10, 1, 'Journal (Journal)', 'Rlls', '21.67', '0', '0.00%', '22', '0', '0.00%', '2020-03-20 14:43:16'),
(1934, 2, 10, 1, 'Lengua De Gato (Lengua De Gato)', 'ea', '29.37', '1086.69', '0.15%', '29.37', '1086.69', '0.07%', '2020-03-20 14:43:16'),
(1935, 2, 10, 1, 'Long Pandesal (Long Pandesal  )', 'ea', '4.24', '0', '0.00%', '4.24', '0', '0.00%', '2020-03-20 14:43:16'),
(1936, 2, 10, 1, 'Macapuno Bread (Macapuno Bread)', 'ea', '7.17', '28.68', '0.00%', '7.17', '28.68', '0.00%', '2020-03-20 14:43:16'),
(1937, 2, 10, 1, 'Macapuno Loaf (Macapuno Loaf)', 'ea', '23.67', '0', '0.00%', '23.67', '0', '0.00%', '2020-03-20 14:43:16'),
(1938, 2, 10, 1, 'Mango Fun Size (Mango Fun Size)', 'ea', '18', '0', '0.00%', '18', '0', '0.00%', '2020-03-20 14:43:16'),
(1939, 2, 10, 1, 'Marjorie Loaf (Marjorie Loaf  )', 'ea', '21.89', '0', '0.00%', '21.89', '0', '0.00%', '2020-03-20 14:43:16'),
(1940, 2, 10, 1, 'Matzo crackers (Matzo crackers)', 'ea', '7.64', '0', '0.00%', '7.64', '0', '0.00%', '2020-03-20 14:43:16'),
(1941, 2, 10, 1, 'Mini chiffon (Mini chiffon  )', 'ea', '13.02', '0', '0.00%', '13.02', '0', '0.00%', '2020-03-20 14:43:16'),
(1942, 2, 10, 1, 'Mix Rye (Mix Rye  )', 'ea', '26.69', '0', '0.00%', '26.69', '0', '0.00%', '2020-03-20 14:43:16'),
(1943, 2, 10, 1, 'Monay Big (Monay Big  )', 'ea', '24.62', '0', '0.00%', '24.62', '0', '0.00%', '2020-03-20 14:43:16'),
(1944, 2, 10, 1, 'Monay Del Valle (Monay Del Valle)', 'ea', '23.58', '0', '0.00%', '23.58', '0', '0.00%', '2020-03-20 14:43:16'),
(1945, 2, 10, 1, 'Monay mini (Monay mini  )', 'ea', '3.6', '7.2', '0.00%', '3.6', '7.2', '0.00%', '2020-03-20 14:43:16'),
(1946, 2, 10, 1, 'Mongo bread (Mongo bread  )', 'ea', '5.77', '5.77', '0.00%', '5.77', '5.77', '0.00%', '2020-03-20 14:43:16'),
(1947, 2, 10, 1, 'Mushroom (Mushroom  )', 'ea', '2.69', '0', '0.00%', '2.69', '0', '0.00%', '2020-03-20 14:43:16'),
(1948, 2, 10, 1, 'Papa Banana Catshup 4KG (Papa Banana Catshup 4KG)', 'Gal', '0', '0', '0.00%', '137.9', '0', '0.00%', '2020-03-20 14:43:16'),
(1949, 2, 10, 1, 'Papaya bread (Papaya bread  )', 'ea', '30.04', '0', '0.00%', '30.04', '0', '0.00%', '2020-03-20 14:43:16'),
(1950, 2, 10, 1, 'Parsley cheese (Parsley cheese  )', 'ea', '6.15', '0', '0.00%', '6.15', '0', '0.00%', '2020-03-20 14:43:16'),
(1951, 2, 10, 1, 'Parsly hotdog (Parsly hotdog  )', 'ea', '7.1', '0', '0.00%', '7.1', '0', '0.00%', '2020-03-20 14:43:16'),
(1952, 2, 10, 1, 'Pilipit (Pilipit)', 'ea', '3.69', '55.35', '0.01%', '3.69', '55.35', '0.00%', '2020-03-20 14:43:16'),
(1953, 2, 10, 1, 'Pineapple pie (Pineapple pie  )', 'ea', '5.5', '11', '0.00%', '5.5', '11', '0.00%', '2020-03-20 14:43:16'),
(1954, 2, 10, 1, 'Pudding (Pudding  )', 'ea', '25.55', '0', '0.00%', '25.55', '0', '0.00%', '2020-03-20 14:43:16'),
(1955, 2, 10, 1, 'Putok pandesal (Putok pandesal  )', 'ea', '4.02', '0', '0.00%', '4.02', '0', '0.00%', '2020-03-20 14:43:16'),
(1956, 2, 10, 1, 'Royal bibingka (Royal bibingka  )', 'ea', '11.63', '93.04', '0.01%', '11.63', '93.04', '0.01%', '2020-03-20 14:43:16'),
(1957, 2, 10, 1, 'Scotch Tape (Scotch Tape  )', 'Rlls', '19', '0', '0.00%', '16', '0', '0.00%', '2020-03-20 14:43:16'),
(1958, 2, 10, 1, 'Sealer Tape (Sealer Tape)', 'Rlls', '25', '0', '0.00%', '25', '0', '0.00%', '2020-03-20 14:43:16'),
(1959, 2, 10, 1, 'Sesame cookies (Sesame cookies)', 'ea', '22.09', '1723.02', '0.23%', '22.09', '1723.02', '0.12%', '2020-03-20 14:43:16'),
(1960, 2, 10, 1, 'Sesame rye (Sesame rye  )', 'ea', '32.58', '0', '0.00%', '32.58', '0', '0.00%', '2020-03-20 14:43:16'),
(1961, 2, 10, 1, 'Sesame whole wheat (Sesame whole wheat  )', 'ea', '32.3', '0', '0.00%', '32.3', '0', '0.00%', '2020-03-20 14:43:16'),
(1962, 2, 10, 1, 'Slutty Brownies (Slutty Brownies  )', 'ea', '10.85', '0', '0.00%', '10.85', '0', '0.00%', '2020-03-20 14:43:16'),
(1963, 2, 10, 1, 'Sourdough (Sourdough  )', 'ea', '21.68', '0', '0.00%', '21.68', '0', '0.00%', '2020-03-20 14:43:16'),
(1964, 2, 10, 1, 'Spanish bread (Spanish bread  )', 'ea', '4.96', '0', '0.00%', '4.96', '0', '0.00%', '2020-03-20 14:43:16'),
(1965, 2, 10, 1, 'Special mamon (Special mamon  )', 'ea', '16.57', '66.28', '0.01%', '16.57', '66.28', '0.01%', '2020-03-20 14:43:16'),
(1966, 2, 10, 1, 'Star Bread Big (Star Bread Big)', 'ea', '19.79', '0', '0.00%', '19.79', '0', '0.00%', '2020-03-20 14:43:16'),
(1967, 2, 10, 1, 'Star bread mini (Star bread mini  )', 'ea', '3.63', '0', '0.00%', '3.63', '0', '0.00%', '2020-03-20 14:43:16'),
(1968, 2, 10, 1, 'Toasted Bread (Toasted Bread  )', 'ea', '14.32', '945.12', '0.13%', '13.9', '917.4', '0.06%', '2020-03-20 14:43:16'),
(1969, 2, 10, 1, 'Toasted sioapao-pork (Toasted sioapao-pork  )', 'ea', '7.57', '764.57', '0.10%', '7.57', '764.57', '0.05%', '2020-03-20 14:43:16'),
(1970, 2, 10, 1, 'Toasted Siopao Chicken (Toasted Siopao Chicken)', 'ea', '7.16', '0', '0.00%', '7.16', '0', '0.00%', '2020-03-20 14:43:16'),
(1971, 2, 10, 1, 'Toasted Siopao Sisig (Toasted Siopao Sisig)', 'ea', '7.44', '0', '0.00%', '7.44', '0', '0.00%', '2020-03-20 14:43:16'),
(1972, 2, 10, 1, 'Ube funsize (Ube funsize  )', 'ea', '18', '0', '0.00%', '18', '0', '0.00%', '2020-03-20 14:43:16'),
(1973, 2, 10, 1, 'Ube loaf (Ube loaf  )', 'ea', '14.13', '0', '0.00%', '14.13', '0', '0.00%', '2020-03-20 14:43:16'),
(1974, 2, 10, 1, 'Whole wheat Loaf (Whole wheat Loaf  )', 'ea', '50.67', '0', '0.00%', '25.34', '0', '0.00%', '2020-03-20 14:43:16'),
(1975, 2, 10, 1, 'WW Pandesal (Wholewheat Pandesal)', 'ea', '4.57', '0', '0.00%', '4.57', '0', '0.00%', '2020-03-20 14:43:16'),
(1976, 2, 10, 1, 'Yema Cake (Yema Cake  )', 'ea', '7.8', '148.2', '0.02%', '7.8', '148.2', '0.01%', '2020-03-20 14:43:16'),
(1977, 2, 2, 1, '1.2Small Card (1.2Small Card)', 'ea', '28.57', '171.42', '0.02%', '28.57', '171.42', '0.01%', '2020-03-20 14:44:43'),
(1978, 2, 2, 1, '1.65 Card (1.65 Card)', 'ea', '31.88', '127.52', '0.02%', '31.88', '127.52', '0.01%', '2020-03-20 14:44:43'),
(1979, 2, 2, 1, 'Birthday Card (Birthday Card)', 'ea', '60.18', '180.54', '0.02%', '60.18', '180.54', '0.01%', '2020-03-20 14:44:43'),
(1980, 2, 2, 1, 'Cake Deco 5set (Cake Deco 5set)', 'ea', '15.66', '0', '0.00%', '15.66', '0', '0.00%', '2020-03-20 14:44:43'),
(1981, 2, 2, 1, 'Gift Candles (Gift Candles)', 'ea', '22.81', '0', '0.00%', '22.81', '0', '0.00%', '2020-03-20 14:44:43'),
(1982, 2, 2, 1, 'Personalized Cups (Personalized Cups)', 'ea', '198.95', '1989.5', '0.27%', '250', '2500', '0.17%', '2020-03-20 14:44:43'),
(1983, 2, 2, 1, 'Umbrella (Umbrella)', 'ea', '149.02', '15796.12', '2.13%', '249', '26394', '1.81%', '2020-03-20 14:44:43'),
(1984, 2, 2, 1, 'VShape Mug (VShape Mug)', 'ea', '33.95', '3157.35', '0.43%', '33.95', '3157.35', '0.22%', '2020-03-20 14:44:43'),
(1985, 2, 2, 1, 'Wedding Cups (Wedding Cups)', 'ea', '201.45', '201.45', '0.03%', '250', '250', '0.02%', '2020-03-20 14:44:43'),
(1986, 2, 2, 1, 'Wedding Flower (Wedding Flower)', 'ea', '150', '600', '0.08%', '150', '600', '0.04%', '2020-03-20 14:44:43'),
(1987, 2, 2, 1, 'Zoo Chairs (Zoo Chairs)', 'ea', '690.4', '(-1380.8)', '-0.19%', '750', '(-1500)', '-0.10%', '2020-03-20 14:44:43'),
(1991, 3, 1, 1, 'Coke Mismo (Coke Mismo)', 'Bot', '12.08', '6585.42', '0.71%', '12.08333', '6585.41485', '0.78%', '2020-03-20 14:49:25'),
(1992, 3, 1, 1, 'Coke Swakto (Coke Swakto)', 'cs', '107.99', '2699.76', '0.29%', '108', '2700', '0.32%', '2020-03-20 14:49:25'),
(1993, 3, 1, 1, 'Mugs (Mugs)', 'ea', '0', '0', '0.00%', '33', '0', '0.00%', '2020-03-20 14:49:25'),
(1994, 3, 1, 1, 'MX3 Capsule (MX3 Capsule)', '', '907.2', '4536', '0.49%', '1039.16', '5195.8', '0.62%', '2020-03-20 14:49:25'),
(1995, 3, 1, 1, 'MX3 Coffee (MX3 Coffee)', '', '169.1', '12006.08', '1.29%', '181.36', '12876.56', '1.53%', '2020-03-20 14:49:25'),
(1996, 3, 1, 1, 'MX3 Coffee Sachet (MX3 Coffee Sachet)', '', '15.12', '-5730.48', '-0.62%', '35', '-13265', '-1.58%', '2020-03-20 14:49:25'),
(1997, 3, 1, 1, 'Organica Big (Organica Big)', '', '120', '4920', '0.53%', '153.45', '6291.45', '0.75%', '2020-03-20 14:49:25'),
(1998, 3, 1, 1, 'Organica Smalll (Organica Smalll)', '', '49.95', '3246.75', '0.35%', '72.23', '4694.95', '0.56%', '2020-03-20 14:49:25'),
(1999, 3, 2, 1, '1.2 Small Card (1.2 Small Card)', 'ea', '28.57', '0', '0.00%', '28.57', '0', '0.00%', '2020-03-20 14:50:53'),
(2000, 3, 2, 1, '1.65 Card (1.65 Card)', 'ea', '31.88', '0', '0.00%', '31.88', '0', '0.00%', '2020-03-20 14:50:53'),
(2001, 3, 2, 1, 'Birthday Card (Birthday Card)', 'ea', '60.18', '0', '0.00%', '60.18', '0', '0.00%', '2020-03-20 14:50:53'),
(2002, 3, 2, 1, 'Tumbler (Tumbler)', 'ea', '198.95', '6565.35', '0.71%', '249', '8217', '0.98%', '2020-03-20 14:50:53'),
(2003, 3, 2, 1, 'Umbrella (Umbrella)', 'ea', '149.02', '11623.56', '1.25%', '250', '19500', '2.32%', '2020-03-20 14:50:53'),
(2004, 3, 2, 1, 'Vshape Mug (Vshape Mug)', 'ea', '33.95', '3327.1', '0.36%', '33.95', '3327.1', '0.40%', '2020-03-20 14:50:53'),
(2005, 3, 2, 1, 'Wedding Cups (Wedding Cups)', 'ea', '201.45', '201.45', '0.02%', '250', '250', '0.03%', '2020-03-20 14:50:53'),
(2006, 3, 2, 1, 'Wedding Flower (Wedding Flower)', 'ea', '150', '450', '0.05%', '250', '750', '0.09%', '2020-03-20 14:50:53'),
(2007, 3, 3, 1, '10 Board (Silver) Round (10 Board (Silver) Round)', 'ea', '18', '0', '0.00%', '18', '0', '0.00%', '2020-03-20 14:52:53'),
(2008, 3, 3, 1, '10x10 Base (10x10 Base)', 'ea', '12', '0', '0.00%', '16', '0', '0.00%', '2020-03-20 14:52:53'),
(2009, 3, 3, 1, '10X10X4 Royal Red (10X10X4 Royal Red)', 'ea', '23.5', '0', '0.00%', '24', '0', '0.00%', '2020-03-20 14:52:53'),
(2010, 3, 3, 1, '12x12 Sponge Cake Chocolate (12x12 Sponge Cake Chocolate)', 'ea', '312.44', '312.44', '0.03%', '312.44', '312.44', '0.04%', '2020-03-20 14:52:53'),
(2011, 3, 3, 1, '12x12 Sponge Cake Plain (12x12 Sponge Cake Plain)', 'ea', '267.04', '267.04', '0.03%', '267.05', '267.05', '0.03%', '2020-03-20 14:52:53'),
(2012, 3, 3, 1, '2D poster board for spongebob (2D poster board for spongebob)', 'ea', '0', '0', '0.00%', '20', '0', '0.00%', '2020-03-20 14:52:53'),
(2013, 3, 3, 1, 'Air Bush Color- Black (Air Bush Color- Black)', 'Grms', '1.41', '576', '0.06%', '1.41', '575.28', '0.07%', '2020-03-20 14:52:53'),
(2014, 3, 3, 1, 'Air Bush Color- Blue (Air Bush Color- Blue)', 'Grms', '1.01', '379.52', '0.04%', '1.02', '382.5', '0.05%', '2020-03-20 14:52:53'),
(2015, 3, 3, 1, 'Air Bush Color- Brown (Air Bush Color- Brown)', 'Grms', '1.13', '181.01', '0.02%', '1.27', '203.2', '0.02%', '2020-03-20 14:52:53'),
(2016, 3, 3, 1, 'Air Bush Color- Golden Yellow (Air Bush Color- Golden Yellow)', 'Grms', '1.02', '0', '0.00%', '1.02', '0', '0.00%', '2020-03-20 14:52:53'),
(2017, 3, 3, 1, 'Air Bush Color- Green (Air Bush Color- Green)', 'Grms', '1.02', '477.19', '0.05%', '1.02', '477.36', '0.06%', '2020-03-20 14:52:53'),
(2018, 3, 3, 1, 'Air Bush Color- Orange (Air Bush Color- Orange)', 'Grms', '1.02', '402.78', '0.04%', '1.02', '402.9', '0.05%', '2020-03-20 14:52:53'),
(2019, 3, 3, 1, 'Air Bush Color- Pink (Air Bush Color- Pink)', 'Grms', '1.4', '1080.85', '0.12%', '1.18', '908.6', '0.11%', '2020-03-20 14:52:53'),
(2020, 3, 3, 1, 'Air Bush Color- Red (Air Bush Color- Red)', 'Grms', '1.41', '1291.63', '0.14%', '1.41176', '1291.76', '0.15%', '2020-03-20 14:52:53'),
(2021, 3, 3, 1, 'Air Bush Color- Violet (Air Bush Color- Violet)', 'Grms', '1.41', '514.86', '0.06%', '1.41', '516.06', '0.06%', '2020-03-20 14:52:53'),
(2022, 3, 3, 1, 'Air Bush Color- Yellow (Air Bush Color- Yellow)', 'Grms', '1.02', '329.34', '0.04%', '1.02', '329.46', '0.04%', '2020-03-20 14:52:53'),
(2023, 3, 3, 1, 'Airbrush Blue (Airbrush Blue)', 'Bot', '260', '0', '0.00%', '260', '0', '0.00%', '2020-03-20 14:52:53'),
(2024, 3, 3, 1, 'Airbrush Green (Airbrush Green)', 'Bot', '260', '0', '0.00%', '260', '0', '0.00%', '2020-03-20 14:52:53'),
(2025, 3, 3, 1, 'Airbrush Red (Airbrush Red)', 'Bot', '360', '0', '0.00%', '360', '0', '0.00%', '2020-03-20 14:52:53'),
(2026, 3, 3, 1, 'Airbrush Yellow (Airbrush Yellow)', 'Bot', '260', '0', '0.00%', '260', '0', '0.00%', '2020-03-20 14:52:53'),
(2027, 3, 3, 1, 'Almond Roca Syrup (Torani) (Almond Roca Syrup (Torani))', 'ML', '0.52', '0', '0.00%', '0.52', '0', '0.00%', '2020-03-20 14:52:53'),
(2028, 3, 3, 1, 'American Garden US Ketchup (American Garden US Ketchup 140z)', 'Bot', '89.48', '0', '0.00%', '89.5', '0', '0.00%', '2020-03-20 14:52:53'),
(2029, 3, 3, 1, 'American Lemon (American Lemon)', 'Grms', '0.25', '0', '0.00%', '0.3', '0', '0.00%', '2020-03-20 14:52:53'),
(2030, 3, 3, 1, 'Armanio Honey 250ml (Armanio Honey 250ml)', 'Bot', '190', '0', '0.00%', '250', '0', '0.00%', '2020-03-20 14:52:53'),
(2031, 3, 3, 1, 'Artistic Flexible Straw colored (Artistic Flxble Straw clrd (100\'s))', 'ea', '0.43', '98.06', '0.01%', '0.65', '146.9', '0.02%', '2020-03-20 14:52:53'),
(2032, 3, 3, 1, 'ASSTD. SPRINKLE (ASSTD. SPRINKLE)', 'Grms', '0.35', '0', '0.00%', '0.35', '0', '0.00%', '2020-03-20 14:52:53'),
(2033, 3, 3, 1, 'Batman Fig. ( Imported) (Batman Fig. ( Imported))', 'ea', '53.75', '0', '0.00%', '65', '0', '0.00%', '2020-03-20 14:52:53'),
(2034, 3, 3, 1, 'Batman Figurine Local (Batman Figurine Local  )', 'ea', '31.27', '344', '0.04%', '44.26', '486.86', '0.06%', '2020-03-20 14:52:53'),
(2035, 3, 3, 1, 'Batman Styro (Batman Styro  )', 'ea', '16.02', '224.27', '0.02%', '23.67', '331.38', '0.04%', '2020-03-20 14:52:53'),
(2036, 3, 3, 1, 'Ben 10 (Ben- 10)', 'ea', '15.66', '78.32', '0.01%', '16', '80', '0.01%', '2020-03-20 14:52:53'),
(2037, 3, 3, 1, 'Big Candles (Big Candles)', 'Pck', '22', '0', '0.00%', '22', '0', '0.00%', '2020-03-20 14:52:53'),
(2038, 3, 3, 1, 'Black Forest cake (Black Forest cake)', 'ea', '61.97', '0', '0.00%', '61.97', '0', '0.00%', '2020-03-20 14:52:53'),
(2039, 3, 3, 1, 'Blueberry 595g (Blueberry 595gx12pcs/case  )', 'Grms', '0.38', '1099.79', '0.12%', '0.37', '1080.4', '0.13%', '2020-03-20 14:52:53'),
(2040, 3, 3, 1, 'Blueberry Cheesecake (Blueberry Cheesecake)', 'ea', '55.64', '389.48', '0.04%', '55.64', '389.48', '0.05%', '2020-03-20 14:52:53'),
(2041, 3, 3, 1, 'Blueberry square (Blueberry square)', 'ea', '20.17', '40.34', '0.00%', '20.17', '40.34', '0.01%', '2020-03-20 14:52:53'),
(2042, 3, 3, 1, 'BreakFast Blend (BreakFast Blend)', 'ea', '32.06', '0', '0.00%', '32.06', '0', '0.00%', '2020-03-20 14:52:53'),
(2043, 3, 3, 1, 'Brown Sugar (Brown sugar)', 'Grms', '0.04', '0', '0.00%', '0.04', '0', '0.00%', '2020-03-20 14:52:53'),
(2044, 3, 3, 1, 'Brown Sugar sachet (Brown sugar sachet)', 'ea', '2.15', '0', '0.00%', '2.15', '0', '0.00%', '2020-03-20 14:52:53'),
(2045, 3, 3, 1, 'Butterfly icing (Butterfly icing)', 'Pck', '14', '84', '0.01%', '13.41', '80.46', '0.01%', '2020-03-20 14:52:53'),
(2046, 3, 3, 1, 'Butterfly PlanGer (Butterfly PlanGer 3pcs/set)', 's', '110', '0', '0.00%', '110', '0', '0.00%', '2020-03-20 14:52:53'),
(2047, 3, 3, 1, 'Cafe Latte- Frappes (1360g) (Cafe Latte- Frappes (1360g))', 'Grms', '0.73', '0', '0.00%', '0.73', '0', '0.00%', '2020-03-20 14:52:53'),
(2048, 3, 3, 1, 'Caffe Verona (Caffe Verona)', 'ea', '40', '400', '0.04%', '32.06', '320.6', '0.04%', '2020-03-20 14:52:53'),
(2049, 3, 3, 1, 'Cake Choco 8x12 (Cake Choco 8x12  )', 'ea', '71.34', '0', '0.00%', '71.34', '0', '0.00%', '2020-03-20 14:52:53'),
(2050, 3, 3, 1, 'Cake Plain 8x12 (Cake Plain 8x12  )', 'ea', '60.48', '0', '0.00%', '60.47', '0', '0.00%', '2020-03-20 14:52:53'),
(2051, 3, 3, 1, 'Candle number (Candle number for Cake)', 'ea', '13.01', '2653.13', '0.29%', '13', '2652', '0.32%', '2020-03-20 14:52:53'),
(2052, 3, 3, 1, 'Candle Stick (Candle Stick)', 'Pck', '24', '168', '0.02%', '24', '168', '0.02%', '2020-03-20 14:52:53'),
(2053, 3, 3, 1, 'Caramel Suace (Torani) (Caramel Sauce (Torani))', 'ML', '0.31', '30.75', '0.00%', '0.35', '35', '0.00%', '2020-03-20 14:52:53'),
(2054, 3, 3, 1, 'Carlo Rossi Swt Red 750ml (Carlo Rossi Swt Red 750ml)', 'Bot', '217.85', '0', '0.00%', '217.85', '0', '0.00%', '2020-03-20 14:52:53'),
(2055, 3, 3, 1, 'Carnival bending straw (Carnival bending straw 100pcs/pack  )', 'ea', '0.19', '0', '0.00%', '0.18', '0', '0.00%', '2020-03-20 14:52:53'),
(2056, 3, 3, 1, 'Carrots Cake (Carrots cake)', 'ea', '13.8', '0', '0.00%', '13.8', '0', '0.00%', '2020-03-20 14:52:53'),
(2057, 3, 3, 1, 'CARS figurine local (CARS figurine local  )', 'ea', '31.53', '378.32', '0.04%', '32', '384', '0.05%', '2020-03-20 14:52:53'),
(2058, 3, 3, 1, 'CC Bending straw white (CC Bending straw white 100pcs/Pack  )', 'ea', '0.19', '0', '0.00%', '0.27', '0', '0.00%', '2020-03-20 14:52:53'),
(2059, 3, 3, 1, 'Cebu Mango Gelato (Cebu Mango Gelato)', 'ea', '110', '1100', '0.12%', '110', '1100', '0.13%', '2020-03-20 14:52:53'),
(2060, 3, 3, 1, 'Cellowrapped Toothpick 1000s (Cellowrapped Toothpick 1000s)', 'ea', '0.07', '24.44', '0.00%', '0.065', '24.44', '0.00%', '2020-03-20 14:52:53'),
(2061, 3, 3, 1, 'Cheese Cake Baked Base (heese Cake Baked Base)', 'ea', '316.85', '1267.4', '0.14%', '316.85', '1267.4', '0.15%', '2020-03-20 14:52:53'),
(2062, 3, 3, 1, 'Cheesecake Syrup (Torani) (Cheesecake Syrup (Torani))', 'ML', '0.52', '0', '0.00%', '0.52', '0', '0.00%', '2020-03-20 14:52:53'),
(2063, 3, 3, 1, 'Cherry Cheese cake (Cherry Cheese cake)', 'sli', '45.35', '0', '0.00%', '45.35', '0', '0.00%', '2020-03-20 14:52:53'),
(2064, 3, 3, 1, 'Cherry square (Cherry square)', 'ea', '37.44', '224.64', '0.02%', '37.44', '224.64', '0.03%', '2020-03-20 14:52:53'),
(2065, 3, 3, 1, 'Cherry Tomato (Cherry Tomato)', 'Grms', '0.03', '0', '0.00%', '0.03', '0', '0.00%', '2020-03-20 14:52:53'),
(2066, 3, 3, 1, 'Chili Flakes (Chili Flakes)', 'Grms', '1.44', '0', '0.00%', '1.25', '0', '0.00%', '2020-03-20 14:52:53'),
(2067, 3, 3, 1, 'Chili Sauce 340gms (Chili Sauce 340g/Bot  )', 'Bot', '33.73', '67.46', '0.01%', '31.6', '63.2', '0.01%', '2020-03-20 14:52:53'),
(2068, 3, 3, 1, 'Cho.Fud (Cho.Fud)', 'Grms', '0', '0', '0.00%', '0.23', '0', '0.00%', '2020-03-20 14:52:53'),
(2069, 3, 3, 1, 'Choco Cake 12x12 (Choco Cake 12x12  )', 'ea', '142.69', '0', '0.00%', '142.69', '0', '0.00%', '2020-03-20 14:52:53'),
(2070, 3, 3, 1, 'Choco Moist Base (Choco Moist Base  )', 'ea', '332.7', '0', '0.00%', '117.44', '0', '0.00%', '2020-03-20 14:52:53'),
(2071, 3, 3, 1, 'Chocolate Coins (Chocolate Coins)', 'ea', '0.95', '0', '0.00%', '0.95', '0', '0.00%', '2020-03-20 14:52:53'),
(2072, 3, 3, 1, 'Chocolate Ganache (Chocolate ganache)', 'ea', '19.04', '0', '0.00%', '20', '0', '0.00%', '2020-03-20 14:52:53'),
(2073, 3, 3, 1, 'Chocolate square (Chocolate square)', 'ea', '23.27', '349.05', '0.04%', '23.27', '349.05', '0.04%', '2020-03-20 14:52:53'),
(2074, 3, 3, 1, 'Clara Ole Mrshno Chrs 1050g (Clara Ole Mrshno Chrs 1050g)', 'Bot', '310.9', '0', '0.00%', '310.9', '0', '0.00%', '2020-03-20 14:52:53'),
(2075, 3, 3, 1, 'Coconut Leaves (Coconut Leaves)', 'Pck', '15', '135', '0.02%', '15', '135', '0.02%', '2020-03-20 14:52:53'),
(2076, 3, 3, 1, 'Coconut tree with Fruit (Coconut tree with Fruit)', 'ea', '15', '0', '0.00%', '15', '0', '0.00%', '2020-03-20 14:52:53'),
(2077, 3, 3, 1, 'Coffee Beans - Rabecca Columbia (Coffee Beans - Rabecca Columbia  )', 'Grms', '1.1', '0', '0.00%', '1.1', '0', '0.00%', '2020-03-20 14:52:53'),
(2078, 3, 3, 1, 'Coffee beans Mauro 500gm (Coffee beans Mauro 500gm)', 'Grms', '0.7', '0', '0.00%', '1.09', '0', '0.00%', '2020-03-20 14:52:53'),
(2079, 3, 3, 1, 'Coffee cup cover 12oz (6\'s) (Coffee cup cover 12oz (6\'s))', 'ea', '2.5', '0', '0.00%', '2.5', '0', '0.00%', '2020-03-20 14:52:53'),
(2080, 3, 3, 1, 'Coffee Mate (Coffee Mate 48pcsx20grms/pack  )', 'ea', '1.65', '167.87', '0.02%', '1.64583', '167.87', '0.02%', '2020-03-20 14:52:53'),
(2081, 3, 3, 1, 'Coin Chocolate (Coin Chocolate)', 'ea', '0.95', '0', '0.00%', '1.51', '0', '0.00%', '2020-03-20 14:52:53'),
(2082, 3, 3, 1, 'Coke 1.5L (Coke 1.5L  )', 'Bar', '60', '0', '0.00%', '60', '0', '0.00%', '2020-03-20 14:52:53'),
(2083, 3, 3, 1, 'Coke Light (Coke Light in Can    )', 'Can', '20.2', '0', '0.00%', '21.75', '0', '0.00%', '2020-03-20 14:52:53'),
(2084, 3, 3, 1, 'Coke Regular 2L (Coke Regular 2L)', 'Bot', '69', '1173', '0.13%', '69', '1173', '0.14%', '2020-03-20 14:52:53'),
(2085, 3, 3, 1, 'Coke Regular in Can (Coke Regular in Can    )', 'Can', '24.92', '1470.08', '0.16%', '24.92', '1470.28', '0.18%', '2020-03-20 14:52:53'),
(2086, 3, 3, 1, 'Coke zero can 330ml 1x24 (Coke zero can 330ml 1x24  )', 'Can', '23.71', '1256.54', '0.14%', '23.71', '1256.63', '0.15%', '2020-03-20 14:52:53'),
(2087, 3, 3, 1, 'Comstock Royal Blueberry 210z (Comstock Royal Blueberry 210z)', 'Bot', '196.35', '0', '0.00%', '197.8', '0', '0.00%', '2020-03-20 14:52:53'),
(2088, 3, 3, 1, 'Comstock Strawberry (Comstock Strawberry 21oz.)', 'Bot', '196.96', '0', '0.00%', '167.85', '0', '0.00%', '2020-03-20 14:52:53'),
(2089, 3, 3, 1, 'Cream-O vanilla (Cream-O vanilla  )', 'Pck', '59.45', '0', '0.00%', '59.45', '0', '0.00%', '2020-03-20 14:52:53'),
(2090, 3, 3, 1, 'Creme de Cacao Syrup- Torani (7 (Creme de Cacao Syrup- Torani (750ml))', 'ML', '0.52', '0', '0.00%', '0.52', '0', '0.00%', '2020-03-20 14:52:53'),
(2091, 3, 3, 1, 'Cross Airbrush Color- Red (Cross Airbrush Color- Red)', 'ea', '150', '0', '0.00%', '150', '0', '0.00%', '2020-03-20 14:52:53'),
(2092, 3, 3, 1, 'Crown Chef (Crown Chef (1000pcs/pack))', 'ea', '0.53', '0', '0.00%', '0.53', '0', '0.00%', '2020-03-20 14:52:53'),
(2093, 3, 3, 1, 'CS Edcor American Lemon (CS Edcor American Lemon)', 'Grms', '0.3', '0', '0.00%', '0.3', '0', '0.00%', '2020-03-20 14:52:53'),
(2094, 3, 3, 1, 'Dad Bear Cocktail Picks (Dad Bear Cocktail Picks 200s)', 'Box', '28.95', '0', '0.00%', '48', '0', '0.00%', '2020-03-20 14:52:53'),
(2095, 3, 3, 1, 'Dad Bear Umbrella Picks (Dad Bear Umbrella Picks 50\'s)', 'Box', '135.65', '0', '0.00%', '135.65', '0', '0.00%', '2020-03-20 14:52:53'),
(2096, 3, 3, 1, 'Dark Anods Compound (Dark Anods Compound)', 'Kls', '194', '0', '0.00%', '216', '0', '0.00%', '2020-03-20 14:52:53'),
(2097, 3, 3, 1, 'Dark Choco Gelato (Dark Choco Gelato)', 'ea', '110', '770', '0.08%', '110', '770', '0.09%', '2020-03-20 14:52:53'),
(2098, 3, 3, 1, 'Dark Chocolate Sauce (Dark Chocolate Sauce 1890ml/Bot    )', 'ML', '0.37', '708', '0.08%', '0.37', '699.3', '0.08%', '2020-03-20 14:52:53'),
(2099, 3, 3, 1, 'Decadent cake (Decadent cake)', 'ea', '24.06', '0', '0.00%', '24.06', '0', '0.00%', '2020-03-20 14:52:53'),
(2100, 3, 3, 1, 'Dilmah English Breakfast Tea (Dilmah English Breakfast Tea)', 'ea', '5.6', '649.98', '0.07%', '5.6', '649.6', '0.08%', '2020-03-20 14:52:53'),
(2101, 3, 3, 1, 'Dilmah Pure Cammomile Flowers-T (Dilmah Pure Cammomile Flowers-Tea)', 'ea', '7', '399', '0.04%', '7', '399', '0.05%', '2020-03-20 14:52:53'),
(2102, 3, 3, 1, 'Dilmah Pure Green Tea (Dilmah Pure Green Tea  1000pcs/box  )', 'ea', '5.6', '515.2', '0.06%', '5.6', '515.2', '0.06%', '2020-03-20 14:52:53'),
(2103, 3, 3, 1, 'DM Four Season 1L (DM Four Season 1L)', 'Pck', '70.98', '0', '0.00%', '70.98', '0', '0.00%', '2020-03-20 14:52:53'),
(2104, 3, 3, 1, 'DM four seasons (DM four seasons  )', 'Can', '24.29', '704.29', '0.08%', '23.80917', '690.47', '0.08%', '2020-03-20 14:52:53'),
(2105, 3, 3, 1, 'DM mango juice (DM mango juice  )', 'Can', '29.05', '639.04', '0.07%', '27.61917', '607.62', '0.07%', '2020-03-20 14:52:53'),
(2106, 3, 3, 1, 'DM Orange (DM orange  )', 'Can', '24.24', '727.23', '0.08%', '21.44', '643.2', '0.08%', '2020-03-20 14:52:53'),
(2107, 3, 3, 1, 'DM pineapple orange (DM pineapple orange  )', 'Can', '24.29', '364.29', '0.04%', '23.80917', '357.14', '0.04%', '2020-03-20 14:52:53'),
(2108, 3, 3, 1, 'DM pineapple sweetened (DM pineapple sweetened  )', 'Can', '24.29', '72.86', '0.01%', '23.80917', '71.43', '0.01%', '2020-03-20 14:52:53'),
(2109, 3, 3, 1, 'DM pineapple unsweetened (DM pineapple unsweetened  )', 'Can', '23.33', '396.66', '0.04%', '21.91', '372.47', '0.04%', '2020-03-20 14:52:53'),
(2110, 3, 3, 1, 'DM Sweet Blend Ketchup 320g (DM Sweet Blend Ketchup 320g)', 'Bot', '33.8', '0', '0.00%', '33.8', '0', '0.00%', '2020-03-20 14:52:53'),
(2111, 3, 3, 1, 'DM Sweet Chili Sauce 12oz (DM Sweet Chili Sauce 12oz)', 'Bot', '35.4', '106.2', '0.01%', '31.95', '95.85', '0.01%', '2020-03-20 14:52:53'),
(2112, 3, 3, 1, 'DM Tomato Ketchup 320g/bot (DM Tomato Ketchup 320g/bot)', 'Bot', '43.2', '0', '0.00%', '43.2', '0', '0.00%', '2020-03-20 14:52:53'),
(2113, 3, 3, 1, 'Dole Four Seasons can (Dole Four seasons in can)', 'Can', '21.43', '0', '0.00%', '21.43', '0', '0.00%', '2020-03-20 14:52:53'),
(2114, 3, 3, 1, 'Donut Shop (Donut Shop)', 'ea', '33.14', '0', '0.00%', '22.35', '0', '0.00%', '2020-03-20 14:52:53'),
(2115, 3, 3, 1, 'Durian jam (380g) (Durian jam (380g))', 'Grms', '0.4', '386.53', '0.04%', '0.33', '316.8', '0.04%', '2020-03-20 14:52:53'),
(2116, 3, 3, 1, 'Eight O\'Clock Juice (Eight O\'Clock Juice 350g/pack  )', 'Pck', '91.35', '0', '0.00%', '91.35', '0', '0.00%', '2020-03-20 14:52:53'),
(2117, 3, 3, 1, 'Equal Sugar (Equal Sugar)', 'ea', '2.15', '0', '0.00%', '2.15', '0', '0.00%', '2020-03-20 14:52:53'),
(2118, 3, 3, 1, 'Espreso Blend (250 grams) (Espreso Blend (250 grams)    )', 'Grms', '1.09', '0', '0.00%', '1.1', '0', '0.00%', '2020-03-20 14:52:53'),
(2119, 3, 3, 1, 'Euro Water 500ml (Euro Water 500ml)', 'Bot', '6.5', '26370.5', '2.84%', '6.9', '27993.3', '3.33%', '2020-03-20 14:52:53'),
(2120, 3, 3, 1, 'Evening Blend 10 packs (Evening Blend 10 packs)', 'Kls', '698.41', '9777.75', '1.05%', '700', '9800', '1.17%', '2020-03-20 14:52:53'),
(2121, 3, 3, 1, 'Extra Folded Tissue 50Sheets (Extra Folded Tissue 50Sheets)', 'ea', '0.29', '0', '0.00%', '0.285', '0', '0.00%', '2020-03-20 14:52:53'),
(2122, 3, 3, 1, 'Femme Paper 175s (Femme Paper 175s)', 'Pck', '38', '0', '0.00%', '38', '0', '0.00%', '2020-03-20 14:52:53'),
(2123, 3, 3, 1, 'Ferreraw Gelato (Ferreraw Gelato)', 'ea', '110', '550', '0.06%', '110', '550', '0.07%', '2020-03-20 14:52:53'),
(2124, 3, 3, 1, 'Figurine- Baby on Crib (Figurine- Baby on Crib)', 'ea', '48.47', '0', '0.00%', '48.46', '0', '0.00%', '2020-03-20 14:52:53'),
(2125, 3, 3, 1, 'Figurine- Barney set (Figurine- Barney set)', 'ea', '65', '0', '0.00%', '65', '0', '0.00%', '2020-03-20 14:52:53'),
(2126, 3, 3, 1, 'Figurine- Dora (Figurine- Dora)', 'ea', '25', '0', '0.00%', '25', '0', '0.00%', '2020-03-20 14:52:53'),
(2127, 3, 3, 1, 'Figurine- Horse (Figurine- Horse)', 'ea', '30', '0', '0.00%', '30', '0', '0.00%', '2020-03-20 14:52:53'),
(2128, 3, 3, 1, 'Figurine- Mermaid (Figurine- Mermaid)', 'ea', '30', '120', '0.01%', '30', '120', '0.01%', '2020-03-20 14:52:53'),
(2129, 3, 3, 1, 'Figurine- Minions (Figurine- Minions)', 'ea', '30', '180', '0.02%', '30', '180', '0.02%', '2020-03-20 14:52:53'),
(2130, 3, 3, 1, 'Figurine- Pig (Figurine- Pig)', 'ea', '30', '0', '0.00%', '30', '0', '0.00%', '2020-03-20 14:52:53'),
(2131, 3, 3, 1, 'Figurine- Pooh (Figurine- Pooh)', 'ea', '20', '0', '0.00%', '20', '0', '0.00%', '2020-03-20 14:52:53'),
(2132, 3, 3, 1, 'Figurine- Princess (BIG) (Figurine- Princess (BIG))', 'ea', '57.16', '0', '0.00%', '57.16', '0', '0.00%', '2020-03-20 14:52:53'),
(2133, 3, 3, 1, 'Figurine- Princess (Small) (Figurine- Princess (Small))', 'ea', '25', '350', '0.04%', '30', '420', '0.05%', '2020-03-20 14:52:53'),
(2134, 3, 3, 1, 'Figurine- Sophia (Figurine- Sophia)', 'ea', '38.57', '38.57', '0.00%', '38.57', '38.57', '0.01%', '2020-03-20 14:52:53'),
(2135, 3, 3, 1, 'Figurine- Spongebob (Figurine- Spongebob)', 'ea', '32.85', '131.4', '0.01%', '36.25', '145', '0.02%', '2020-03-20 14:52:53'),
(2136, 3, 3, 1, 'Figurine- Tiger (Figurine- Tiger)', 'ea', '30', '0', '0.00%', '30', '0', '0.00%', '2020-03-20 14:52:53'),
(2137, 3, 3, 1, 'Figurine- Tinkerbell (Figurine- Tinkerbell)', 'ea', '60', '420', '0.05%', '60', '420', '0.05%', '2020-03-20 14:52:53'),
(2138, 3, 3, 1, 'Figurine Aurora Imported (Figurine Aurora Imported)', 'ea', '0', '0', '0.00%', '60', '0', '0.00%', '2020-03-20 14:52:53'),
(2139, 3, 3, 1, 'Figurine Baby Christening (Figurine Baby Christening)', 'ea', '32', '128', '0.01%', '32', '128', '0.02%', '2020-03-20 14:52:53'),
(2140, 3, 3, 1, 'Figurine Beauty (Imported) (Figurine Beauty (Imported))', 'ea', '65', '0', '0.00%', '65', '0', '0.00%', '2020-03-20 14:52:53'),
(2141, 3, 3, 1, 'Figurine Beauty (Local) (Figurine Beauty (Local))', 'ea', '25', '0', '0.00%', '25', '0', '0.00%', '2020-03-20 14:52:53'),
(2142, 3, 3, 1, 'Figurine Belle Imported (Figurine Belle)', 'ea', '60', '0', '0.00%', '60', '0', '0.00%', '2020-03-20 14:52:53'),
(2143, 3, 3, 1, 'Figurine Bells (Local) (Figurine Bells (Local))', 'ea', '25', '0', '0.00%', '25', '0', '0.00%', '2020-03-20 14:52:53'),
(2144, 3, 3, 1, 'Figurine Ben 10 (Figurine- Ben 10)', 'ea', '57.69', '230.77', '0.03%', '57.69', '230.76', '0.03%', '2020-03-20 14:52:53'),
(2145, 3, 3, 1, 'Figurine Cinderella (Figurine Cinderella)', 'ea', '65', '0', '0.00%', '65', '0', '0.00%', '2020-03-20 14:52:53'),
(2146, 3, 3, 1, 'Figurine Elsa (Figurine Elsa)', 'ea', '63.34', '0', '0.00%', '60', '0', '0.00%', '2020-03-20 14:52:53'),
(2147, 3, 3, 1, 'Figurine Elsa (Local) (Figurine Elsa (Local))', 'ea', '33.75', '270', '0.03%', '35', '280', '0.03%', '2020-03-20 14:52:53'),
(2148, 3, 3, 1, 'Figurine Hello Kitty (Figurine Hello Kitty)', 'ea', '29.01', '145.03', '0.02%', '30', '150', '0.02%', '2020-03-20 14:52:53'),
(2149, 3, 3, 1, 'Figurine MickeyMouse (L) (Figurine MickeyMouse (L))', 'ea', '30', '120', '0.01%', '30', '120', '0.01%', '2020-03-20 14:52:53'),
(2150, 3, 3, 1, 'Figurine Minion L (Figurine Minion L)', 'ea', '30', '0', '0.00%', '30', '0', '0.00%', '2020-03-20 14:52:53'),
(2151, 3, 3, 1, 'Figurine Princess (L) (Figurine Princess (L))', 'ea', '65', '0', '0.00%', '65', '0', '0.00%', '2020-03-20 14:52:53'),
(2152, 3, 3, 1, 'Figurine Snow white Imported (Figurine Snow white Imported)', 'ea', '65', '0', '0.00%', '65', '0', '0.00%', '2020-03-20 14:52:53'),
(2153, 3, 3, 1, 'Figurine Spiderman (Figurine Spiderman)', 'ea', '30', '240', '0.03%', '30', '240', '0.03%', '2020-03-20 14:52:53'),
(2154, 3, 3, 1, 'Figurine Superman (Figurine Superman)', 'ea', '46.52', '511.67', '0.06%', '60', '660', '0.08%', '2020-03-20 14:52:53'),
(2155, 3, 3, 1, 'Figurine Superman ( Local) (Figurine Superman ( Local))', 'ea', '30', '0', '0.00%', '30', '0', '0.00%', '2020-03-20 14:52:53'),
(2156, 3, 3, 1, 'Figurine Tinkerbell (L) (Figurine Tinkerbell (L))', 'ea', '65', '0', '0.00%', '65', '0', '0.00%', '2020-03-20 14:52:53'),
(2157, 3, 3, 1, 'Flag Picks Dad Bear (Flag Picks Dad Bear 100\'s)', 'ea', '0.53', '0', '0.00%', '0.53', '0', '0.00%', '2020-03-20 14:52:53'),
(2158, 3, 3, 1, 'Flowerettes (Flowerettes)', 'ea', '16', '400', '0.04%', '16', '400', '0.05%', '2020-03-20 14:52:53'),
(2159, 3, 3, 1, 'Frank further Sausages (Frank further Sausages 1KL/pack X 7pcs 120g    )', 'Grms', '0.34', '-0.01', '0.00%', '0.36', '0', '0.00%', '2020-03-20 14:52:53'),
(2160, 3, 3, 1, 'Frappe Mix Java Chip (Frappe Mix Java Chip 1360ml/Jar  )', 'ML', '0', '0', '0.00%', '0.73', '0', '0.00%', '2020-03-20 14:52:53'),
(2161, 3, 3, 1, 'Fresh Milk -Nestle (Fresh Milk -Nestle  )', 'Pck', '75.45', '528.17', '0.06%', '79.42', '555.94', '0.07%', '2020-03-20 14:52:53'),
(2162, 3, 3, 1, 'Fruitcake', 'ea', '202.78', '0', '0.00%', '202.78', '0', '0.00%', '2020-03-20 14:52:53'),
(2163, 3, 3, 1, 'Fudge Cake- Base (Fudge Cake- Base)', 'ea', '402.42', '0', '0.00%', '402.42', '0', '0.00%', '2020-03-20 14:52:53'),
(2164, 3, 3, 1, 'Ganache Plain (Ganache Plain  )', 'ea', '0', '0', '0.00%', '10.08', '0', '0.00%', '2020-03-20 14:52:53'),
(2165, 3, 3, 1, 'Garlic Stick (1 KILO) (Garlic Stick (1 KILO)  )', 'Kls', '96.38', '239.01', '0.03%', '96.35', '238.95', '0.03%', '2020-03-20 14:52:53'),
(2166, 3, 3, 1, 'Gelatine (Gelatine)', 'Kls', '882.19', '0', '0.00%', '571.12', '0', '0.00%', '2020-03-20 14:52:53'),
(2167, 3, 3, 1, 'Golden Valley Cherry 260z (Golden Valley Cherry 260z)', 'Bot', '210', '1831.2', '0.20%', '252.9', '2205.29', '0.26%', '2020-03-20 14:52:53'),
(2168, 3, 3, 1, 'Green Chocolate (Green Chocolate 500g/bar  )', 'Grms', '0.46', '0', '0.00%', '0.46', '0', '0.00%', '2020-03-20 14:52:53'),
(2169, 3, 3, 1, 'Guava Syrup (Guava Syrup)', 'ML', '0.52', '0', '0.00%', '0.52', '0', '0.00%', '2020-03-20 14:52:53'),
(2170, 3, 3, 1, 'Happy birthday Candles (Happy birthday Candles)', 'Pck', '42.5', '0', '0.00%', '45', '0', '0.00%', '2020-03-20 14:52:53'),
(2171, 3, 3, 1, 'Happy birthday Styro (Happy birthday Styro  )', 'ea', '15', '30', '0.00%', '14', '28', '0.00%', '2020-03-20 14:52:53'),
(2172, 3, 3, 1, 'Happy cake choco (Happy cake choco)', 'ea', '136.42', '136.42', '0.02%', '136.42', '136.42', '0.02%', '2020-03-20 14:52:53'),
(2173, 3, 3, 1, 'Happy cake Plain (Happy cake plain)', 'ea', '136.42', '1500.62', '0.16%', '136.42', '1500.62', '0.18%', '2020-03-20 14:52:53'),
(2174, 3, 3, 1, 'Hazelnut (Hazelnut  750ml/bot  )', 'ML', '0.52', '0', '0.00%', '0.52', '0', '0.00%', '2020-03-20 14:52:53'),
(2175, 3, 3, 1, 'Heart Sprinkles (Heart Sprinkles  )', 'Grms', '0.68', '0', '0.00%', '0.45', '0', '0.00%', '2020-03-20 14:52:53'),
(2176, 3, 3, 1, 'Heinz Ketchup (Heinz Ketchup  )', 'Bot', '129', '0', '0.00%', '100.1', '0', '0.00%', '2020-03-20 14:52:53'),
(2177, 3, 3, 1, 'Heinz Ketchup 300g (Heinz Ketchup 300g)', 'Bot', '45.25', '315.39', '0.03%', '47.3', '329.68', '0.04%', '2020-03-20 14:52:53'),
(2178, 3, 3, 1, 'Hello Kitty fig ( Imported) (Hello Kitty fig ( Imported))', 'ea', '65', '0', '0.00%', '65', '0', '0.00%', '2020-03-20 14:52:53'),
(2179, 3, 3, 1, 'Hello kitty Figurine (Hello kitty Figurine  )', 'ea', '35', '0', '0.00%', '35', '0', '0.00%', '2020-03-20 14:52:53'),
(2180, 3, 3, 1, 'Hello Kitty Styro (Hello Kitty Styro  )', 'ea', '16', '0', '0.00%', '16', '0', '0.00%', '2020-03-20 14:52:53'),
(2181, 3, 3, 1, 'Herbal Pillow-Shoulder patch (Herbal Pillow-Shoulder patch  )', 'ea', '0', '0', '0.00%', '980', '0', '0.00%', '2020-03-20 14:52:53'),
(2182, 3, 3, 1, 'Herbal Pillow-Waist pad (Herbal Pillow-Waist pad   )', 'ea', '0', '0', '0.00%', '1200', '0', '0.00%', '2020-03-20 14:52:53'),
(2183, 3, 3, 1, 'Honey syrup (Honey syrup 1000ML)', 'Bot', '140', '0', '0.00%', '140', '0', '0.00%', '2020-03-20 14:52:53'),
(2184, 3, 3, 1, 'Hot Choco Fudge (Hot Choco Fudge)', 'ea', '31.31', '0', '0.00%', '31.31', '0', '0.00%', '2020-03-20 14:52:53'),
(2185, 3, 3, 1, 'Hugh Blend (Hugh Blend)', 'ea', '19.25', '0', '0.00%', '19.25', '0', '0.00%', '2020-03-20 14:52:53'),
(2186, 3, 3, 1, 'Irish Cream (Irish Cream 750g/bot    )', 'ML', '0.52', '0', '0.00%', '0.52', '0', '0.00%', '2020-03-20 14:52:53'),
(2187, 3, 3, 1, 'Jufran sweet chili sauce (Jufran sweet chili sauce (1oog/bot))', 'Bot', '99.75', '0', '0.00%', '99.75', '0', '0.00%', '2020-03-20 14:52:53'),
(2188, 3, 3, 1, 'Kaiser Buns Small (Kaiser Buns Small)', 'ea', '6.78', '67.8', '0.01%', '6.78', '67.8', '0.01%', '2020-03-20 14:52:53'),
(2189, 3, 3, 1, 'Laughing Man (Laughing Man)', 'ea', '15.59', '31.18', '0.00%', '19.25', '38.5', '0.01%', '2020-03-20 14:52:53'),
(2190, 3, 3, 1, 'Lemon Grass (Lemon Grass)', 'Bundle', '10.04', '31.31', '0.00%', '15.56', '48.55', '0.01%', '2020-03-20 14:52:53'),
(2191, 3, 3, 1, 'Lemon grass Juice (Lemon grass Juice (350g/glass))', 'Grms', '0.2', '0', '0.00%', '0.19', '0', '0.00%', '2020-03-20 14:52:53'),
(2192, 3, 3, 1, 'Macademia nut (Macademia nut)', 'ML', '0.52', '0', '0.00%', '0.52', '0', '0.00%', '2020-03-20 14:52:53'),
(2193, 3, 3, 1, 'Mango Jam (320gm) (Mango Jam (320gm))', 'Grms', '0.26', '0', '0.00%', '0.26', '0', '0.00%', '2020-03-20 14:52:53'),
(2194, 3, 3, 1, 'Mango Nectar Gina 240ml (Mango Nectar Gina 240ml)', 'Can', '31.85', '0', '0.00%', '31.85', '0', '0.00%', '2020-03-20 14:52:53'),
(2195, 3, 3, 1, 'Maple Flavored Pancake Syrup (3 (Maple Flavored Pancake Syrup (355ml))', 'Bot', '86.4', '0', '0.00%', '86.4', '0', '0.00%', '2020-03-20 14:52:53'),
(2196, 3, 3, 1, 'Moist cake base (Moist cake base)', 'ea', '332.7', '665.4', '0.07%', '332.7', '665.4', '0.08%', '2020-03-20 14:52:53'),
(2197, 3, 3, 1, 'Moreau Wine (Moreau Wine 750ml  )', 'Bot', '0', '0', '0.00%', '381.7', '0', '0.00%', '2020-03-20 14:52:53'),
(2198, 3, 3, 1, 'Muscovado sugar (Muscovado sugar)', 'Grms', '0.03', '0', '0.00%', '0.03', '0', '0.00%', '2020-03-20 14:52:53'),
(2199, 3, 3, 1, 'Nescafe Blend & Brew Orig (Nescafe Blend & Brew Orig 8(30x20g))', 'Pck', '5.44', '0', '0.00%', '5.44033', '0', '0.00%', '2020-03-20 14:52:53'),
(2200, 3, 3, 1, 'Nescafe Brew Original (Nescafe Brew Original 36pcs/pack  )', 'ea', '5.44', '1169.67', '0.13%', '5.44033', '1169.67', '0.14%', '2020-03-20 14:52:53'),
(2201, 3, 3, 1, 'Nescafe Sticks 48x2g (Nescafe Sticks 48x2g    )', 'ea', '1.9', '625.1', '0.07%', '1.9', '625.1', '0.07%', '2020-03-20 14:52:53'),
(2202, 3, 3, 1, 'Nestea House Blend 200gx12 (Nestea House Blend 200gx12)', 'Grms', '0.08', '157.91', '0.02%', '0.07897', '157.94', '0.02%', '2020-03-20 14:52:53'),
(2203, 3, 3, 1, 'Nestea Ice Tea (360gm) (Nestea Ice Tea (360gm))', 'Pck', '112.01', '0', '0.00%', '111.95', '0', '0.00%', '2020-03-20 14:52:53'),
(2204, 3, 3, 1, 'Nestea Iced Tea Lemon (Nestea Iced Tea Lemon (450g/pck))', 'Grms', '0.22', '0', '0.00%', '0.22', '0', '0.00%', '2020-03-20 14:52:53');
INSERT INTO `eb_raw_materials` (`PK_raw_materials_id`, `FK_outlet_id`, `FK_category_id`, `status`, `material_name`, `unit`, `average_cost`, `asset_value`, `total_asset_percent`, `sales_price`, `retail_value`, `total_retail_percent`, `date_added`) VALUES
(2205, 3, 3, 1, 'Nestea Restaurant Blend (Nestea Restaurant Blend  )', 'Grms', '0.48', '0', '0.00%', '0.48', '0', '0.00%', '2020-03-20 14:52:53'),
(2206, 3, 3, 1, 'Oreo Choco Creme 9s (Oreo Choco Creme 9s)', 'ea', '7.67', '0', '0.00%', '7.67', '0', '0.00%', '2020-03-20 14:52:53'),
(2207, 3, 3, 1, 'Oreo Vanilla 9s (Oreo Vanilla 9s)', 'Pck', '69', '0', '0.00%', '69', '0', '0.00%', '2020-03-20 14:52:53'),
(2208, 3, 3, 1, 'Paper Doll Frozen/Cindy (Paper Doll Frozen/Cindy)', 'ea', '20', '280', '0.03%', '20', '280', '0.03%', '2020-03-20 14:52:53'),
(2209, 3, 3, 1, 'Paper Topper (Paper Topper)', 'ea', '20', '0', '0.00%', '20', '0', '0.00%', '2020-03-20 14:52:53'),
(2210, 3, 3, 1, 'Paper Towel Tissue (Paper Towel Tissue (30Rolls/Case)  175pcs/pack)', 'Pck', '32.55', '976.5', '0.11%', '32.55', '976.5', '0.12%', '2020-03-20 14:52:53'),
(2211, 3, 3, 1, 'Pastry Bag (Green) (Pastry Bag (Green))', 'ea', '25', '0', '0.00%', '25', '0', '0.00%', '2020-03-20 14:52:53'),
(2212, 3, 3, 1, 'Pauls Pure Full Cream Milk (Pauls Pure Full Cream Milk (1Lx12/case))', 'Pck', '55', '0', '0.00%', '55', '0', '0.00%', '2020-03-20 14:52:53'),
(2213, 3, 3, 1, 'Peppermint   750ml (Peppermint   750ml  )', 'Bot', '392', '0', '0.00%', '392', '0', '0.00%', '2020-03-20 14:52:53'),
(2214, 3, 3, 1, 'Petals (Petals)', 'ea', '13', '0', '0.00%', '14', '0', '0.00%', '2020-03-20 14:52:53'),
(2215, 3, 3, 1, 'Pike Place (Pike Place)', 'ea', '30.33', '0', '0.00%', '30.32', '0', '0.00%', '2020-03-20 14:52:53'),
(2216, 3, 3, 1, 'Pistacchio Gelato (Pistacchio Gelato)', 'ea', '110', '220', '0.02%', '110', '220', '0.03%', '2020-03-20 14:52:53'),
(2217, 3, 3, 1, 'Plain Cake 12x12 (Plain Cake 12x12  )', 'ea', '120.94', '0', '0.00%', '120.94', '0', '0.00%', '2020-03-20 14:52:53'),
(2218, 3, 3, 1, 'Plastic Cup w/lid 12oz (Plastic Cup w/lid 12oz)', 'ea', '3.53', '0', '0.00%', '3.53', '0', '0.00%', '2020-03-20 14:52:53'),
(2219, 3, 3, 1, 'Plastic Leaves (Plastic Leaves)', 'Pck', '13.52', '0', '0.00%', '13.52', '0', '0.00%', '2020-03-20 14:52:53'),
(2220, 3, 3, 1, 'Pointed Flowers (Pointed Flowers)', 'ea', '15', '0', '0.00%', '15', '0', '0.00%', '2020-03-20 14:52:53'),
(2221, 3, 3, 1, 'Powder Sugar (Powder Sugar  )', 'Grms', '0.1', '1148.2', '0.12%', '0.09', '1008', '0.12%', '2020-03-20 14:52:53'),
(2222, 3, 3, 1, 'Precut Napkin 2000s (Precut Napkin 2000s)', 'ea', '0.19', '0', '0.00%', '0.19', '0', '0.00%', '2020-03-20 14:52:53'),
(2223, 3, 3, 1, 'Pretzels Berry Knots (Pretzels Berry Knots 28g)', 'Grms', '0.19', '0', '0.00%', '0.19', '0', '0.00%', '2020-03-20 14:52:53'),
(2224, 3, 3, 1, 'Quaker Instant Oats (Quaker Instant Oats (800g/pck))', 'Grms', '0.12', '0', '0.00%', '0.12', '0', '0.00%', '2020-03-20 14:52:53'),
(2225, 3, 3, 1, 'Rainbow Sprinkles (Rainbow Sprinkles   )', 'Grms', '0.35', '1302', '0.14%', '0.35', '1302', '0.16%', '2020-03-20 14:52:53'),
(2226, 3, 3, 1, 'Red Cherry 595ml (Red Cherry 595ml  )', 'Bot', '197.66', '0', '0.00%', '187.61', '0', '0.00%', '2020-03-20 14:52:53'),
(2227, 3, 3, 1, 'Red Cherry w/ stem 1050 (Red Cherry w/ stem 1050ml  )', 'Bot', '310.88', '621.76', '0.07%', '310.9', '621.8', '0.07%', '2020-03-20 14:52:53'),
(2228, 3, 3, 1, 'Royal in can (330ml 1x24) (Royal in can (330ml 1x24))', 'Can', '24.92', '1021.59', '0.11%', '24.91667', '1021.58', '0.12%', '2020-03-20 14:52:53'),
(2229, 3, 3, 1, 'Salted Caramel Gelato (Salted Caramel Gelato)', 'ea', '123.2', '492.8', '0.05%', '123.2', '492.8', '0.06%', '2020-03-20 14:52:53'),
(2230, 3, 3, 1, 'San Fransisco Bay (San Fransisco Bay)', 'ea', '15.59', '93.54', '0.01%', '15.59', '93.54', '0.01%', '2020-03-20 14:52:53'),
(2231, 3, 3, 1, 'San Mig Light in Can (San Mig Light in Can)', 'Can', '44', '0', '0.00%', '44', '0', '0.00%', '2020-03-20 14:52:53'),
(2232, 3, 3, 1, 'San Mig Pale Pilsen in Can (San Mig Pale Pilsen in Can    )', 'Can', '44', '528', '0.06%', '44', '528', '0.06%', '2020-03-20 14:52:53'),
(2233, 3, 3, 1, 'Savor Classic 130g (Savor Classic 130g  )', 'ea', '35.56', '617.62', '0.07%', '35.54792', '617.47', '0.07%', '2020-03-20 14:52:53'),
(2234, 3, 3, 1, 'Selecta Vanilla (Selecta Vanilla 1.5L)', 'gal', '0', '0', '0.00%', '230', '0', '0.00%', '2020-03-20 14:52:53'),
(2235, 3, 3, 1, 'SMART LOAD (Smart Load)', 'ea', '1', '39886.79', '4.30%', '1', '39886.79', '4.75%', '2020-03-20 14:52:53'),
(2236, 3, 3, 1, 'Sofia Figurine local (Sofia Figurine local  )', 'ea', '32', '256', '0.03%', '35', '280', '0.03%', '2020-03-20 14:52:53'),
(2237, 3, 3, 1, 'Spaghetti MeatSauce (Spaghetti MeatSauce)', 'ea', '50.18', '602.16', '0.07%', '50.18', '602.16', '0.07%', '2020-03-20 14:52:53'),
(2238, 3, 3, 1, 'Spiderman Figurine Imported (Spiderman Figurine Imported)', 'ea', '65', '0', '0.00%', '65', '0', '0.00%', '2020-03-20 14:52:53'),
(2239, 3, 3, 1, 'Spiderman Figurine local (Spiderman Figurine local  )', 'ea', '32', '0', '0.00%', '35', '0', '0.00%', '2020-03-20 14:52:53'),
(2240, 3, 3, 1, 'Spiderman Styro (Spiderman Styro  )', 'ea', '16', '79.99', '0.01%', '16', '80', '0.01%', '2020-03-20 14:52:53'),
(2241, 3, 3, 1, 'Sponge cake Plain (Sponge cake Plain)', 'ea', '136.42', '0', '0.00%', '136.42', '0', '0.00%', '2020-03-20 14:52:53'),
(2242, 3, 3, 1, 'Sprinkle Christmas Tree (Sprinkle Christmas Tree)', 'Pck', '68', '0', '0.00%', '68', '0', '0.00%', '2020-03-20 14:52:53'),
(2243, 3, 3, 1, 'Sprite 2L (Sprite per bottle 2L  )', 'Bot', '0', '0', '0.00%', '51.5', '0', '0.00%', '2020-03-20 14:52:53'),
(2244, 3, 3, 1, 'Sprite in can (Sprite in can)', 'Can', '24.92', '1968.41', '0.21%', '24.91667', '1968.42', '0.23%', '2020-03-20 14:52:53'),
(2245, 3, 3, 1, 'Star Sprinkles (Star Sprinkles  )', 'Grms', '0.68', '136', '0.02%', '0.68', '136', '0.02%', '2020-03-20 14:52:53'),
(2246, 3, 3, 1, 'Stick Candle small (Stick Candle small)', 'ea', '5', '0', '0.00%', '5', '0', '0.00%', '2020-03-20 14:52:53'),
(2247, 3, 3, 1, 'Stick O 480g (Stick O 480g  )', 'ea', '0.51', '0', '0.00%', '0.51', '0', '0.00%', '2020-03-20 14:52:53'),
(2248, 3, 3, 1, 'Stick o Big Choco 850g (Stick o Big Choco 850g)', 'Bot', '109.5', '109.5', '0.01%', '109.5', '109.5', '0.01%', '2020-03-20 14:52:53'),
(2249, 3, 3, 1, 'Strawberry square (Strawberry square)', 'ea', '37.44', '0', '0.00%', '37.44', '0', '0.00%', '2020-03-20 14:52:53'),
(2250, 3, 3, 1, 'Styro Baptismal (Styro Baptismal)', 'ea', '15', '0', '0.00%', '15', '0', '0.00%', '2020-03-20 14:52:53'),
(2251, 3, 3, 1, 'Styro Cars (Styro Cars)', 'ea', '16', '191.96', '0.02%', '16', '192', '0.02%', '2020-03-20 14:52:53'),
(2252, 3, 3, 1, 'Styro Castle (big) (Styro Castle (big))', 'ea', '41.88', '0', '0.00%', '45', '0', '0.00%', '2020-03-20 14:52:53'),
(2253, 3, 3, 1, 'Styro Castle (s) (Styro Castle (s)  )', 'ea', '37.94', '227.64', '0.03%', '38', '228', '0.03%', '2020-03-20 14:52:53'),
(2254, 3, 3, 1, 'Styro Character (Styro Character)', 'ea', '16', '0', '0.00%', '16', '0', '0.00%', '2020-03-20 14:52:53'),
(2255, 3, 3, 1, 'Styro Dora (Styro Dora)', 'ea', '13', '39', '0.00%', '13', '39', '0.01%', '2020-03-20 14:52:53'),
(2256, 3, 3, 1, 'Styro Elsa (Styro Elsa)', 'ea', '15.94', '159.36', '0.02%', '16', '160', '0.02%', '2020-03-20 14:52:53'),
(2257, 3, 3, 1, 'Styro Happy 18th Birthday (Styro Happy 18th Birthday)', 'ea', '14.61', '0', '0.00%', '14.61', '0', '0.00%', '2020-03-20 14:52:53'),
(2258, 3, 3, 1, 'Styro happy Christianing (Styro Happy Christianing)', 'ea', '15.88', '190.59', '0.02%', '16', '192', '0.02%', '2020-03-20 14:52:53'),
(2259, 3, 3, 1, 'Styro Happy Wedding (Styro Happy Wedding)', 'ea', '15', '0', '0.00%', '15', '0', '0.00%', '2020-03-20 14:52:53'),
(2260, 3, 3, 1, 'Styro Hello Kitty (Styro Hello Kitty)', 'ea', '15.83', '221.57', '0.02%', '16', '224', '0.03%', '2020-03-20 14:52:53'),
(2261, 3, 3, 1, 'Styro Mickey Mouse (Styro Mickey Mouse)', 'ea', '15.68', '94.09', '0.01%', '30', '180', '0.02%', '2020-03-20 14:52:53'),
(2262, 3, 3, 1, 'Styro Minions (Styro Minions)', 'ea', '15.37', '138.29', '0.02%', '16', '144', '0.02%', '2020-03-20 14:52:53'),
(2263, 3, 3, 1, 'Styro Pooh (Styro Pooh)', 'ea', '15', '0', '0.00%', '15', '0', '0.00%', '2020-03-20 14:52:53'),
(2264, 3, 3, 1, 'Styro Princess (Styro Princess)', 'ea', '49.5', '396', '0.04%', '49.5', '396', '0.05%', '2020-03-20 14:52:53'),
(2265, 3, 3, 1, 'Styro Sofia (Styro Sofia)', 'ea', '15.33', '276.02', '0.03%', '16', '288', '0.03%', '2020-03-20 14:52:53'),
(2266, 3, 3, 1, 'Styro Spongebob (Styro Spongebob)', 'ea', '16', '112', '0.01%', '16', '112', '0.01%', '2020-03-20 14:52:53'),
(2267, 3, 3, 1, 'Styro Superman (Styro Superman)', 'ea', '16', '112', '0.01%', '15.36', '107.52', '0.01%', '2020-03-20 14:52:53'),
(2268, 3, 3, 1, 'Styro Tinkerbell (Styro Tinkerbell)', 'ea', '15.94', '286.93', '0.03%', '16', '288', '0.03%', '2020-03-20 14:52:53'),
(2269, 3, 3, 1, 'Sugar free straw Berry syrup ( (Sugar free straw Berry syrup (Torani))', 'ML', '0.52', '0', '0.00%', '0.52', '0', '0.00%', '2020-03-20 14:52:53'),
(2270, 3, 3, 1, 'Sugar syrup (Sugar syrup)', 'Grms', '0.06', '0', '0.00%', '0.06', '0', '0.00%', '2020-03-20 14:52:53'),
(2271, 3, 3, 1, 'SUN LOAD (Sun Load)', 'ea', '0.85', '17301.16', '1.86%', '1', '20301.16', '2.42%', '2020-03-20 14:52:53'),
(2272, 3, 3, 1, 'Sunflower icing (Sunflower icing)', 'ea', '17.19', '893.75', '0.10%', '18', '936', '0.11%', '2020-03-20 14:52:53'),
(2273, 3, 3, 1, 'Sunflower PlanGer 4pcs/set (Sunflower PlanGer 4pcs/set)', 's', '325', '0', '0.00%', '325', '0', '0.00%', '2020-03-20 14:52:53'),
(2274, 3, 3, 1, 'Sunflower small (Sunflower small)', 'Pck', '18', '0', '0.00%', '18', '0', '0.00%', '2020-03-20 14:52:53'),
(2275, 3, 3, 1, 'Super Stick Choco 480g (Super Stick Choco 480g)', 'Tumbler', '50.15', '0', '0.00%', '50.15', '0', '0.00%', '2020-03-20 14:52:53'),
(2276, 3, 3, 1, 'Super Stick Choco 960g (Super Stick Choco 960g)', 'Bot', '98.15', '154.09', '0.02%', '98.15', '154.1', '0.02%', '2020-03-20 14:52:53'),
(2277, 3, 3, 1, 'Tang Orange 675g/525g (Tang Orange 675g/525g)', 'Pck', '286.46', '0', '0.00%', '298.5', '0', '0.00%', '2020-03-20 14:52:53'),
(2278, 3, 3, 1, 'Tang Orange Juice (350gm) (Tang orange juice 350gm)', 'Pck', '171.2', '1712', '0.18%', '199.5', '1995', '0.24%', '2020-03-20 14:52:53'),
(2279, 3, 3, 1, 'Tinker Bell Fig. Local (Tinker Bell Fig. Local)', 'ea', '35', '0', '0.00%', '30', '0', '0.00%', '2020-03-20 14:52:53'),
(2280, 3, 3, 1, 'Toasted Marshmallow (Toasted Marshmallow   750ml  )', 'Bot', '392', '0', '0.00%', '392', '0', '0.00%', '2020-03-20 14:52:53'),
(2281, 3, 3, 1, 'Torani Almond Rocca 750ml (Torani Almond Rocca 750ml)', 'Bot', '0', '0', '0.00%', '392', '0', '0.00%', '2020-03-20 14:52:53'),
(2282, 3, 3, 1, 'Torani Hazelnut 750ml (orani Hazelnut 750ml)', 'ML', '0', '0', '0.00%', '0.52', '0', '0.00%', '2020-03-20 14:52:53'),
(2283, 3, 3, 1, 'Umbrella picks (Umbrella picks  )', 'ea', '1.46', '0', '0.00%', '2.71', '0', '0.00%', '2020-03-20 14:52:53'),
(2284, 3, 3, 1, 'Virgies Wild honey 325ml (Virgies Wild honey 325ml)', 'Bot', '103.5', '0', '0.00%', '103.5', '0', '0.00%', '2020-03-20 14:52:53'),
(2285, 3, 3, 1, 'Viva Mineral Water (Viva Mineral Water)', 'Bot', '0', '0', '0.00%', '10.42', '0', '0.00%', '2020-03-20 14:52:53'),
(2286, 3, 3, 1, 'Water refill (Water refill at Warehouse)', 'Cont.', '30', '30', '0.00%', '50', '50', '0.01%', '2020-03-20 14:52:53'),
(2287, 3, 3, 1, 'Waterade 500ml (Waterade 500ml  )', 'Bot', '6.5', '0', '0.00%', '9.5', '0', '0.00%', '2020-03-20 14:52:53'),
(2288, 3, 3, 1, 'White sugar (White sugar)', 'Grms', '0.05', '0', '0.00%', '0.05', '0', '0.00%', '2020-03-20 14:52:53'),
(2289, 3, 3, 1, 'Wilderness Red Ruby Cherry 210o (Wilderness Red Ruby Cherry 210oz)', 'Bot', '163.2', '0', '0.00%', '164.44', '0', '0.00%', '2020-03-20 14:52:53'),
(2290, 3, 3, 1, 'Zest O orange juice (Zest O orange juice (200ml))', 'ea', '5.55', '0', '0.00%', '5.55', '0', '0.00%', '2020-03-20 14:52:53'),
(2291, 3, 4, 1, 'Solaine 11kg (Solaine 11kg)', 'Kls', '85.34', '4693.76', '0.51%', '87.45455', '4810', '0.57%', '2020-03-20 14:57:04'),
(2292, 3, 4, 1, 'Solaine 50kg (Solaine 50kg)', 'Kls', '74.13', '25946.21', '2.80%', '76.2584', '26690.44', '3.18%', '2020-03-20 14:57:04'),
(2293, 3, 5, 1, 'Aji Ginisa Mix 100g (Aji Ginisa Mix 100g)', 'Pck', '20.51', '0', '0.00%', '22.65', '0', '0.00%', '2020-03-20 14:59:36'),
(2294, 3, 5, 1, 'Al Dante Fettuccini (Al Dante Fettuccini)', 'Grms', '0.18', '0', '0.00%', '0.13', '0', '0.00%', '2020-03-20 14:59:36'),
(2295, 3, 5, 1, 'Al Dente Fetuccine Dona Elena (Al Dente Fetuccine Dona Elena 500g)', 'Pck', '66.4', '0', '0.00%', '66.4', '0', '0.00%', '2020-03-20 14:59:36'),
(2296, 3, 5, 1, 'All purpose flour (All Purpose Flour)', 'Grms', '0.04', '0', '0.00%', '0.04', '0', '0.00%', '2020-03-20 14:59:36'),
(2297, 3, 5, 1, 'All Spiced 32g (All Spiced 32g/Bottle)', 'Bot', '0', '0', '0.00%', '62.4', '0', '0.00%', '2020-03-20 14:59:36'),
(2298, 3, 5, 1, 'Almond Sliced (Almond Sliced 100gms/pack  )', 'Grms', '1.11', '0', '0.00%', '1.07', '0', '0.00%', '2020-03-20 14:59:36'),
(2299, 3, 5, 1, 'Alsatian (Alsatian)', 'Ptn', '390.53', '0', '0.00%', '325.1', '0', '0.00%', '2020-03-20 14:59:36'),
(2300, 3, 5, 1, 'Aluminum Foil (Aluminum Foil  )', 'Roll', '674.21', '674.21', '0.07%', '750', '750', '0.09%', '2020-03-20 14:59:36'),
(2301, 3, 5, 1, 'Anchovies (Anchovies  365g/Can     )', 'Grms', '0.59', '0', '0.00%', '1.53', '0', '0.00%', '2020-03-20 14:59:36'),
(2302, 3, 5, 1, 'Apple (Apple)', 'ea', '24.78', '0', '0.00%', '25', '0', '0.00%', '2020-03-20 14:59:36'),
(2303, 3, 5, 1, 'Argentina Corned Beef 150g (Argentina Corned Beef 150g  )', 'Can', '0', '0', '0.00%', '50', '0', '0.00%', '2020-03-20 14:59:36'),
(2304, 3, 5, 1, 'Argentina Corned beef 175g (Argentina Corned beef 175g  )', 'Can', '0', '0', '0.00%', '33.25', '0', '0.00%', '2020-03-20 14:59:36'),
(2305, 3, 5, 1, 'Asparagus (Asparagus  )', 'Grms', '0.2', '0', '0.00%', '0.07', '0', '0.00%', '2020-03-20 14:59:36'),
(2306, 3, 5, 1, 'Atsal (Atsal)', 'Grms', '0.12', '0', '0.00%', '0.04', '0', '0.00%', '2020-03-20 14:59:36'),
(2307, 3, 5, 1, 'Avocado (Avocado)', 'Grms', '0.07', '70', '0.01%', '0.05', '50', '0.01%', '2020-03-20 14:59:36'),
(2308, 3, 5, 1, 'Bacon (Bacon)', 'Grms', '0.36', '2160', '0.23%', '0.36', '2160', '0.26%', '2020-03-20 14:59:36'),
(2309, 3, 5, 1, 'Bariles (Bariles)', 'Grms', '0.16', '0', '0.00%', '0.28', '0', '0.00%', '2020-03-20 14:59:36'),
(2310, 3, 5, 1, 'BBQ Marinated Clara Ole (BBQ Marinated Clara Ole  225g/Pack    )', 'Pck', '0', '0', '0.00%', '35.15', '0', '0.00%', '2020-03-20 14:59:36'),
(2311, 3, 5, 1, 'BBQ Marinated sauce Hickory (BBQ Marinated sauce Hickory 225g/Pack  )', 'Pck', '31.65', '0', '0.00%', '31.65', '0', '0.00%', '2020-03-20 14:59:36'),
(2312, 3, 5, 1, 'BBQ Marinated sauce Mamasitas (BBQ Marinated sauce Mamasitas 680ml/Bot    )', 'Bot', '0', '0', '0.00%', '97.1', '0', '0.00%', '2020-03-20 14:59:36'),
(2313, 3, 5, 1, 'Beef & Herbs Gravy 30g (Beef & Herbs Gravy 30g/Pack  )', 'Pck', '20.8', '0', '0.00%', '20.8', '0', '0.00%', '2020-03-20 14:59:36'),
(2314, 3, 5, 1, 'Beef Cubes (Beef Cubes 60pcsx10gms/pail    )', 'ea', '4.32', '0', '0.00%', '4.73', '0', '0.00%', '2020-03-20 14:59:36'),
(2315, 3, 5, 1, 'Beef Tapa 80gm (Beef Tampa 80gm)', 'Ptn', '40.87', '1266.97', '0.14%', '44.94', '1393.14', '0.17%', '2020-03-20 14:59:36'),
(2316, 3, 5, 1, 'Beef Tocino (245gm/pack) (Beef Tocino (245gm/pack))', 'Pck', '66.15', '0', '0.00%', '66.15', '0', '0.00%', '2020-03-20 14:59:36'),
(2317, 3, 5, 1, 'Beef Tocino 80gm (Beef Tocino 80gm)', 'Ptn', '25.21', '0', '0.00%', '26.28', '0', '0.00%', '2020-03-20 14:59:36'),
(2318, 3, 5, 1, 'Black Olive Slice 165g (Black Olive Slice 165g/bot   )', 'Grms', '0.35', '0', '0.00%', '0.35', '0', '0.00%', '2020-03-20 14:59:36'),
(2319, 3, 5, 1, 'Black Olive Slice 310g (Black Olive Slice 310g/Bot  )', 'Grms', '0.25', '0', '0.00%', '0.29', '0', '0.00%', '2020-03-20 14:59:36'),
(2320, 3, 5, 1, 'Black Pepper (Black Pepper)', 'Grms', '0.54', '86.88', '0.01%', '0.6', '97.2', '0.01%', '2020-03-20 14:59:36'),
(2321, 3, 5, 1, 'Black Pepper 250g (Black Pepper 250g/Pack  )', 'Grms', '0.85', '0', '0.00%', '0.85', '0', '0.00%', '2020-03-20 14:59:36'),
(2322, 3, 5, 1, 'Black Pepper 25g (Black Pepper 25g)', 'Can', '25.75', '0', '0.00%', '25.75', '0', '0.00%', '2020-03-20 14:59:36'),
(2323, 3, 5, 1, 'Black Pepper 500g (Black Pepper 500g/Pack  )', 'Grms', '0.94', '0', '0.00%', '0.94', '0', '0.00%', '2020-03-20 14:59:36'),
(2324, 3, 5, 1, 'Black Pepper 50g (Black Pepper 50g)', 'Bot', '49', '147', '0.02%', '51.5', '154.5', '0.02%', '2020-03-20 14:59:36'),
(2325, 3, 5, 1, 'Bolognaise sauce (Bolognaise sauce)', 'Ptn', '21.81', '0', '0.00%', '21.81', '0', '0.00%', '2020-03-20 14:59:36'),
(2326, 3, 5, 1, 'Brown sauce (Brown sauce)', 'Ptn', '4.84', '150.04', '0.02%', '4.84', '150.04', '0.02%', '2020-03-20 14:59:36'),
(2327, 3, 5, 1, 'Bulalo (Bulalo)', 'Ptn', '198.94', '0', '0.00%', '198.94', '0', '0.00%', '2020-03-20 14:59:36'),
(2328, 3, 5, 1, 'Burger buns Big (Burger buns Big)', 'ea', '14.76', '0', '0.00%', '21.6', '0', '0.00%', '2020-03-20 14:59:36'),
(2329, 3, 5, 1, 'Burger buns Small (Burger buns Small)', 'ea', '6.78', '13.56', '0.00%', '6.78', '13.56', '0.00%', '2020-03-20 14:59:36'),
(2330, 3, 5, 1, 'Cabbage kls (Cabbage kls)', 'Kls', '47.09', '0', '0.00%', '50', '0', '0.00%', '2020-03-20 14:59:36'),
(2331, 3, 5, 1, 'Cabbage Pcs (Cabbage Pcs)', 'ea', '45', '0', '0.00%', '21', '0', '0.00%', '2020-03-20 14:59:36'),
(2332, 3, 5, 1, 'Carrots (Carrots)', 'Grms', '0.05', '11', '0.00%', '0.033', '6.93', '0.00%', '2020-03-20 14:59:36'),
(2333, 3, 5, 1, 'Cashew Nuts (Cashew Nuts  )', 'Grms', '0.48', '0', '0.00%', '0.48', '0', '0.00%', '2020-03-20 14:59:36'),
(2334, 3, 5, 1, 'Ceasar\'s Dressing (Ceasar\'s Dressing)', 'Grms', '0.09', '0', '0.00%', '0.09', '0', '0.00%', '2020-03-20 14:59:36'),
(2335, 3, 5, 1, 'Century Tuna 155g (Century Tuna Flakes in Vege Oil 155g)', 'Can', '27.3', '0', '0.00%', '27.3', '0', '0.00%', '2020-03-20 14:59:36'),
(2336, 3, 5, 1, 'Century Tuna 420g (Century Tuna 420g)', 'Can', '54.4', '0', '0.00%', '54.4', '0', '0.00%', '2020-03-20 14:59:36'),
(2337, 3, 5, 1, 'Century Tuna Chuncks in Water (Century Tuna Chuncks in Water 1705g)', 'Can', '0', '0', '0.00%', '415.45', '0', '0.00%', '2020-03-20 14:59:36'),
(2338, 3, 5, 1, 'Century Tuna Flakes in Oil 180g (Century Tuna Flakes in Oil 180g)', 'Can', '32.55', '0', '0.00%', '33', '0', '0.00%', '2020-03-20 14:59:36'),
(2339, 3, 5, 1, 'Cheese Powder (Cheese Powder 100g/pack    )', 'Grms', '0.11', '0', '0.00%', '0.51', '0', '0.00%', '2020-03-20 14:59:36'),
(2340, 3, 5, 1, 'CheezeMiz Powder 200g (CheezeMiz Powder 200g)', 'Grms', '0.1', '61.2', '0.01%', '0.1071', '64.26', '0.01%', '2020-03-20 14:59:36'),
(2341, 3, 5, 1, 'Chicharon  30g (Chicharon  30g)', 'Pck', '17.05', '0', '0.00%', '17.05', '0', '0.00%', '2020-03-20 14:59:36'),
(2342, 3, 5, 1, 'chicharon (market) (chicharon (market))', 'Kls', '100', '0', '0.00%', '280', '0', '0.00%', '2020-03-20 14:59:36'),
(2343, 3, 5, 1, 'Chick Fill (Sesame Chicken Fillet)', 'Ptn', '9.28', '0', '0.00%', '9.28', '0', '0.00%', '2020-03-20 14:59:36'),
(2344, 3, 5, 1, 'Chicken Cubes (Chicken Cubes  )', 'ea', '4.3', '408.82', '0.04%', '4.30333', '408.82', '0.05%', '2020-03-20 14:59:36'),
(2345, 3, 5, 1, 'Chicken Cubes 60pcs/tumbler (Chicken Cubes 60pcsx10gms/pail)', 'ea', '4.3', '0', '0.00%', '4.30333', '0', '0.00%', '2020-03-20 14:59:36'),
(2346, 3, 5, 1, 'Chicken curry meat 130gm (Chicken curry meat 130gm)', 'Ptn', '41.29', '165.14', '0.02%', '48.83', '195.32', '0.02%', '2020-03-20 14:59:36'),
(2347, 3, 5, 1, 'Chicken Powder (Chicken Powder  )', 'Grms', '0.35', '676.66', '0.07%', '0.3506', '676.66', '0.08%', '2020-03-20 14:59:36'),
(2348, 3, 5, 1, 'Chicken Tandori (Chicken Tandori)', 'Ptn', '51.04', '0', '0.00%', '51.04', '0', '0.00%', '2020-03-20 14:59:36'),
(2349, 3, 5, 1, 'Chicken Tocino 275gm/pack (Chicken Tocino 275gm/pack)', 'Pck', '60.5', '0', '0.00%', '60.5', '0', '0.00%', '2020-03-20 14:59:36'),
(2350, 3, 5, 1, 'Chicken Tocino 90gm (Chicken Tocino 90gm)', 'Ptn', '29.81', '0', '0.00%', '30.81', '0', '0.00%', '2020-03-20 14:59:36'),
(2351, 3, 5, 1, 'Chicken wings 90gm (Chicken wings 90gm)', 'Ptn', '26.92', '0', '0.00%', '33.07', '0', '0.00%', '2020-03-20 14:59:36'),
(2352, 3, 5, 1, 'Chili Flakes 25g (Chili Flakes 25g)', 'Can', '24', '0', '0.00%', '24', '0', '0.00%', '2020-03-20 14:59:36'),
(2353, 3, 5, 1, 'Chili Flakes 35g (Chili Flakes 35g)', 'Bot', '28.75', '86.25', '0.01%', '28.75', '86.25', '0.01%', '2020-03-20 14:59:36'),
(2354, 3, 5, 1, 'Chopsoy Patis 750ml (Chopsoy Patis 750ml)', 'gal', '26.5', '0', '0.00%', '26.5', '0', '0.00%', '2020-03-20 14:59:36'),
(2355, 3, 5, 1, 'Chopsoy Soy Sauce (Chopsoy Soy Sauce (1gal))', 'gal', '79', '0', '0.00%', '79', '0', '0.00%', '2020-03-20 14:59:36'),
(2356, 3, 5, 1, 'Clams (Clams)', 'Grms', '0.12', '0', '0.00%', '0.06', '0', '0.00%', '2020-03-20 14:59:36'),
(2357, 3, 5, 1, 'Colicot (Colicot)', 'Grms', '0.08', '5', '0.00%', '0.07', '4.2', '0.00%', '2020-03-20 14:59:36'),
(2358, 3, 5, 1, 'Corn Oil- Marca Leon 450ml (Corn Oil- Marca Leon 450ml)', 'ML', '0.14', '0', '0.00%', '0.1682', '0', '0.00%', '2020-03-20 14:59:36'),
(2359, 3, 5, 1, 'Cranberries 100g (Cranberries 100g  )', 'Grms', '0.29', '0', '0.00%', '0.29', '0', '0.00%', '2020-03-20 14:59:36'),
(2360, 3, 5, 1, 'Crapers in Vinegar Dona Elena (Crapers in Vinegar Dona Elena 340g/bot)', 'Bot', '136', '0', '0.00%', '141.45', '0', '0.00%', '2020-03-20 14:59:36'),
(2361, 3, 5, 1, 'cs Joms Cheese Powder 30G (cs Joms Cheese Powder 30G)', 'Pck', '11.75', '23.5', '0.00%', '16.5', '33', '0.00%', '2020-03-20 14:59:36'),
(2362, 3, 5, 1, 'CS TJ Cry Powder 25g (CS TJ Cry Powder 25g)', 'Pck', '9.05', '0', '0.00%', '9.05', '0', '0.00%', '2020-03-20 14:59:36'),
(2363, 3, 5, 1, 'Cucumber (Cucumber)', 'Grms', '0.02', '6.12', '0.00%', '0.024', '6.74', '0.00%', '2020-03-20 14:59:36'),
(2364, 3, 5, 1, 'Curry Powder (Curry Powder 539/can    )', 'Grms', '0.81', '0', '0.00%', '1.21', '0', '0.00%', '2020-03-20 14:59:36'),
(2365, 3, 5, 1, 'Curry POwder 50g (Curry POwder 50g)', 'Pck', '43', '0', '0.00%', '43', '0', '0.00%', '2020-03-20 14:59:36'),
(2366, 3, 5, 1, 'Curry Sauce Ptn (Curry Sauce (80g/Ptn))', 'Ptn', '0.13', '0', '0.00%', '0.13', '0', '0.00%', '2020-03-20 14:59:36'),
(2367, 3, 5, 1, 'Dahon Laurel (Dahon Laurel)', 'ea', '5', '0', '0.00%', '0', '0', '0.00%', '2020-03-20 14:59:36'),
(2368, 3, 5, 1, 'Datu Puti Patis 350ml (Datu Puti Patis 350ml)', 'ea', '20.35', '0', '0.00%', '20.35', '0', '0.00%', '2020-03-20 14:59:36'),
(2369, 3, 5, 1, 'Datu Puti Vinegar (Datu Puti Vinegar 1 gal (1893ml))', 'ML', '0.04', '35', '0.00%', '0.03', '30', '0.00%', '2020-03-20 14:59:36'),
(2370, 3, 5, 1, 'Del Monte Carbonara Pasta (Del Monte Carbonara Pasta)', 'Pck', '32.7', '98.1', '0.01%', '32.7', '98.1', '0.01%', '2020-03-20 14:59:36'),
(2371, 3, 5, 1, 'DM Spaghetti (Del Monte Spaghetti)', 'Grms', '0.08', '-0.01', '0.00%', '0.0841', '0', '0.00%', '2020-03-20 14:59:36'),
(2372, 3, 5, 1, 'Donia Elena Fettucini 56g (Donia Elena Fettucini 56g)', 'Pck', '98.8', '0', '0.00%', '98.8', '0', '0.00%', '2020-03-20 14:59:36'),
(2373, 3, 5, 1, 'Durian Preserve CS Jeya (Durian Preserve CS Jeya  120oz/ 340g     )', 'Bot', '0', '0', '0.00%', '125', '0', '0.00%', '2020-03-20 14:59:36'),
(2374, 3, 5, 1, 'Durian Preserve CS Neneng 380g (Durian Preserve CS Neneng  380g     )', 'Bot', '0', '0', '0.00%', '120.4', '0', '0.00%', '2020-03-20 14:59:36'),
(2375, 3, 5, 1, 'Eden Melt Cheese 450g (Eden Melt Cheese 450g)', 'Bar', '163.21', '7018.2', '0.76%', '169.85', '7303.55', '0.87%', '2020-03-20 14:59:36'),
(2376, 3, 5, 1, 'Egg Noodles (Egg Noodles  )', 'Pck', '0', '0', '0.00%', '93', '0', '0.00%', '2020-03-20 14:59:36'),
(2377, 3, 5, 1, 'Egg white (Egg white)', 'Kls', '10', '0', '0.00%', '10', '0', '0.00%', '2020-03-20 14:59:36'),
(2378, 3, 5, 1, 'Egg yolk (Egg yolk)', 'Kls', '20', '0', '0.00%', '20', '0', '0.00%', '2020-03-20 14:59:36'),
(2379, 3, 5, 1, 'Femme Cocktail Table Napkin (Femme Cocktail Table Napkin 2PLY0PL)', 'Pck', '11.5', '506', '0.06%', '11.5', '506', '0.06%', '2020-03-20 14:59:36'),
(2380, 3, 5, 1, 'Fish Pillet 40gm (Fish Pillet 40gm)', 'Ptn', '33.77', '506.55', '0.06%', '37.11', '556.65', '0.07%', '2020-03-20 14:59:36'),
(2381, 3, 5, 1, 'French Fries (French Fries  )', 'Grms', '0.1', '579.64', '0.06%', '0.095', '579.5', '0.07%', '2020-03-20 14:59:36'),
(2382, 3, 5, 1, 'Fried Garlic (Fried Garlic)', 'Grms', '0.27', '68.28', '0.01%', '0.27313', '68.28', '0.01%', '2020-03-20 14:59:36'),
(2383, 3, 5, 1, 'Garlic (Garlic)', 'Grms', '0.17', '493.93', '0.05%', '0.1', '293.3', '0.04%', '2020-03-20 14:59:36'),
(2384, 3, 5, 1, 'Garlic Granulated (Garlic Granulated 45g/bot  )', 'Bot', '0', '0', '0.00%', '71.35', '0', '0.00%', '2020-03-20 14:59:36'),
(2385, 3, 5, 1, 'Gata (Gata)', 'Grms', '0.08', '80', '0.01%', '0.08', '80', '0.01%', '2020-03-20 14:59:36'),
(2386, 3, 5, 1, 'Gelatine (Gelatine  )', 'Grms', '0.07', '49', '0.01%', '0.007', '4.9', '0.00%', '2020-03-20 14:59:36'),
(2387, 3, 5, 1, 'Gideon Chicken (Gideon Chicken)', 'Ptn', '55.39', '0', '0.00%', '55.39', '0', '0.00%', '2020-03-20 14:59:36'),
(2388, 3, 5, 1, 'Ginger (Ginger)', 'Grms', '0.11', '232.7', '0.03%', '0.09', '188.19', '0.02%', '2020-03-20 14:59:36'),
(2389, 3, 5, 1, 'Goat Cheese (Goat Cheese  )', 'Grms', '0.8', '0', '0.00%', '0.8', '0', '0.00%', '2020-03-20 14:59:36'),
(2390, 3, 5, 1, 'Grapes - Pack (Grapes - Pack)', 'Pck', '50', '0', '0.00%', '50', '0', '0.00%', '2020-03-20 14:59:36'),
(2391, 3, 5, 1, 'Gravy Mix Knorr (Gravy Mix Knorr  )', 'Grms', '0.38', '0', '0.00%', '0.38', '0', '0.00%', '2020-03-20 14:59:36'),
(2392, 3, 5, 1, 'Gruyere Block (Gruyere Block  )', 'Grms', '1.16', '0', '0.00%', '1.16', '0', '0.00%', '2020-03-20 14:59:36'),
(2393, 3, 5, 1, 'Gulaman (Gulaman 90g/pack  )', 'Grms', '0.54', '0', '0.00%', '0.54', '0', '0.00%', '2020-03-20 14:59:36'),
(2394, 3, 5, 1, 'Hand towel tissue (Hand towel tissue(30packs/case))', 'Pck', '32.55', '781.2', '0.08%', '43.33', '1039.92', '0.12%', '2020-03-20 14:59:36'),
(2395, 3, 5, 1, 'Hobe Special Bihon 227g (Hobe Special Bihon 227g)', 'Pck', '17', '9.69', '0.00%', '15.4', '8.78', '0.00%', '2020-03-20 14:59:36'),
(2396, 3, 5, 1, 'Hobe Special Palabok 454g (Hobe Special Palabok 454g)', 'Ptn', '29.69', '0', '0.00%', '29.21', '0', '0.00%', '2020-03-20 14:59:36'),
(2397, 3, 5, 1, 'Hoisen Sauce (Hoisen Sauce 240ml/bot  )', 'Bot', '93.76', '0', '0.00%', '93.75', '0', '0.00%', '2020-03-20 14:59:36'),
(2398, 3, 5, 1, 'Honey Cems Prime Brand (Honey Cems Prime Brand 1L  )', 'Bot', '254.5', '509', '0.06%', '237.6', '475.2', '0.06%', '2020-03-20 14:59:36'),
(2399, 3, 5, 1, 'Hungarian Sausages (Hungarian Sausages 1KL/pack X 6pcs    )', 'Grms', '0.08', '0', '0.00%', '0.31', '0', '0.00%', '2020-03-20 14:59:36'),
(2400, 3, 5, 1, 'Italian Seasoning (Italian Seasoning 10g/bot  )', 'Grms', '6.54', '65.4', '0.01%', '6.54', '65.4', '0.01%', '2020-03-20 14:59:36'),
(2401, 3, 5, 1, 'Jams Pork Chicharon 60g (Pork Chicharon 60g)', 'Ptn', '39', '0', '0.00%', '39', '0', '0.00%', '2020-03-20 14:59:36'),
(2402, 3, 5, 1, 'Jams Pork Chicharon 80g (Pork Chicharon 80g)', 'Ptn', '52', '0', '0.00%', '48', '0', '0.00%', '2020-03-20 14:59:36'),
(2403, 3, 5, 1, 'Japanese Chili Pads (Japanese Chili Pads)', 'Pck', '89.95', '89.95', '0.01%', '89.95', '89.95', '0.01%', '2020-03-20 14:59:36'),
(2404, 3, 5, 1, 'Jufran Hot Sauce (Jufran Hot Sauce)', 'Bot', '21.55', '0', '0.00%', '18.1', '0', '0.00%', '2020-03-20 14:59:36'),
(2405, 3, 5, 1, 'Jufran Sweet Chili Sauce (Jufran Sweet Chili Sauce)', 'Bot', '31.52', '0', '0.00%', '19.95', '0', '0.00%', '2020-03-20 14:59:36'),
(2406, 3, 5, 1, 'Katambak (Katambak  )', 'Grms', '0', '0', '0.00%', '0.22', '0', '0.00%', '2020-03-20 14:59:36'),
(2407, 3, 5, 1, 'ketchup 1 gal (ketchup 1 gal)', 'Grms', '0.02', '0', '0.00%', '0.02', '0', '0.00%', '2020-03-20 14:59:36'),
(2408, 3, 5, 1, 'Kewpie Roasted Seasame 1L (Kewpie Roasted Seasame 1L  )', 'Bot', '672.65', '0', '0.00%', '683.65', '0', '0.00%', '2020-03-20 14:59:36'),
(2409, 3, 5, 1, 'Kewpie Roasted Seasame 210ml (Kewpie Roasted Seasame 210ml  )', 'Bot', '160.99', '0', '0.00%', '162.9', '0', '0.00%', '2020-03-20 14:59:36'),
(2410, 3, 5, 1, 'Laurel Leaves 50g (Laurel Leaves 50g)', 'Pck', '19', '19', '0.00%', '18', '18', '0.00%', '2020-03-20 14:59:36'),
(2411, 3, 5, 1, 'Laurel Leaves W/ Seeds (Laurel Leaves W/ Seeds)', 'Pck', '16.75', '0', '0.00%', '16.75', '0', '0.00%', '2020-03-20 14:59:36'),
(2412, 3, 5, 1, 'Lea & Perrins Worcesterchire (Lea & Perrins Worcesterchire 300ml  )', 'Bot', '149.9', '0', '0.00%', '149.9', '0', '0.00%', '2020-03-20 14:59:36'),
(2413, 3, 5, 1, 'Lemon (Lemon)', 'Grms', '0.04', '336.06', '0.04%', '0.02083', '169.16', '0.02%', '2020-03-20 14:59:36'),
(2414, 3, 5, 1, 'Lettuce curl (Lettuce curl)', 'Grms', '0.14', '0', '0.00%', '0.14', '0', '0.00%', '2020-03-20 14:59:36'),
(2415, 3, 5, 1, 'Lettuce Romaine (Lettuce Romaine)', 'Grms', '0.15', '0', '0.00%', '0.14', '0', '0.00%', '2020-03-20 14:59:36'),
(2416, 3, 5, 1, 'Liquid Seasoning Maggi 1L (Liquid Seasoning Maggi 1L  )', 'Bot', '236.3', '0', '0.00%', '236.3', '0', '0.00%', '2020-03-20 14:59:36'),
(2417, 3, 5, 1, 'Liver Spread Argentina (Liver Spread Argentina  )', 'Can', '0', '0', '0.00%', '38', '0', '0.00%', '2020-03-20 14:59:36'),
(2418, 3, 5, 1, 'Longanisa (Longanisa  340g/ pack X 10pcs     )', 'ea', '4', '56', '0.01%', '4', '56', '0.01%', '2020-03-20 14:59:36'),
(2419, 3, 5, 1, 'Maggi Magic Sarap 100G (Maggi Magic Sarap 100G)', 'Pck', '24.58', '0', '0.00%', '28.65', '0', '0.00%', '2020-03-20 14:59:36'),
(2420, 3, 5, 1, 'maggi Magic Sarap 120g (maggi Magic Sarap 120g)', 'Pck', '36.6', '0', '0.00%', '36.6', '0', '0.00%', '2020-03-20 14:59:36'),
(2421, 3, 5, 1, 'Maggi Magic Sarap 15gx10 (Maggi Magic Sarap 15gx10)', 'Pck', '45.5', '0', '0.00%', '45.5', '0', '0.00%', '2020-03-20 14:59:36'),
(2422, 3, 5, 1, 'Maggi Magic Sarap 8g (Maggi Magic Sarap 8g  )', 'ea', '2.94', '0', '0.00%', '2.61', '0', '0.00%', '2020-03-20 14:59:36'),
(2423, 3, 5, 1, 'Maggi Savor Calamansi (Maggi Savor Calamansi)', 'Bot', '31.71', '0', '0.00%', '34', '0', '0.00%', '2020-03-20 14:59:36'),
(2424, 3, 5, 1, 'Maggi Savor Chili 130ml (Maggi Savor Chili 130ml)', 'Bot', '29.74', '0', '0.00%', '29.6', '0', '0.00%', '2020-03-20 14:59:36'),
(2425, 3, 5, 1, 'Maggi Savor Garlic (Maggi Savor Garlic)', 'Bot', '30.48', '0', '0.00%', '34', '0', '0.00%', '2020-03-20 14:59:36'),
(2426, 3, 5, 1, 'Malasugue (Malasugue)', 'Grms', '0.41', '0', '0.00%', '0.42', '0', '0.00%', '2020-03-20 14:59:36'),
(2427, 3, 5, 1, 'Mango (Mango)', 'Kls', '76.74', '262.46', '0.03%', '150', '513', '0.06%', '2020-03-20 14:59:36'),
(2428, 3, 5, 1, 'Mango Chutney (Mango Chutney)', 'Grms', '0.5', '152.11', '0.02%', '0.50367', '152.11', '0.02%', '2020-03-20 14:59:36'),
(2429, 3, 5, 1, 'Mango Jam (Mango Jam 320ml  )', 'Bot', '81.75', '0', '0.00%', '81.75', '0', '0.00%', '2020-03-20 14:59:36'),
(2430, 3, 5, 1, 'Marca Leon Oil (Marca Leon Oil)', 'gal', '890', '0', '0.00%', '890', '0', '0.00%', '2020-03-20 14:59:36'),
(2431, 3, 5, 1, 'Maria Clara  750ml (Maria Clara  750ml   )', 'Bot', '156.95', '0', '0.00%', '156.95', '0', '0.00%', '2020-03-20 14:59:36'),
(2432, 3, 5, 1, 'Marinated chicken for fruity sa (Marinated chicken for fruity salad)', 'Grms', '0.2', '0', '0.00%', '0.2', '0', '0.00%', '2020-03-20 14:59:36'),
(2433, 3, 5, 1, 'Mayonnaise (Home made mayonnaise)', 'Grms', '0.11', '0', '0.00%', '0.11', '0', '0.00%', '2020-03-20 14:59:36'),
(2434, 3, 5, 1, 'MB Hot Sauce 50ml (MB Hot Sauce 50ml)', 'Bot', '14.13', '870.42', '0.09%', '14.45', '890.12', '0.11%', '2020-03-20 14:59:36'),
(2435, 3, 5, 1, 'Mc Cormick Basil Leaves Whole (Mc Cormick Basil Leaves Whole 9g  )', 'Bot', '37.76', '0', '0.00%', '45.7', '0', '0.00%', '2020-03-20 14:59:36'),
(2436, 3, 5, 1, 'Mc Cormick Cry POwder 30g (Mc Cormick Cry POwder 30g)', 'Pck', '43.05', '0', '0.00%', '43.05', '0', '0.00%', '2020-03-20 14:59:36'),
(2437, 3, 5, 1, 'Mc Cormick Ylw Cry Rcpe Mix 28g (Mc Cormick Ylw Cry Rcpe Mix 28g)', 'Pck', '26.45', '0', '0.00%', '26.45', '0', '0.00%', '2020-03-20 14:59:36'),
(2438, 3, 5, 1, 'Memer Pork Chicharon  Hot (Memer Pork Chicharon  Hot)', 'Pck', '56', '0', '0.00%', '43.25', '0', '0.00%', '2020-03-20 14:59:36'),
(2439, 3, 5, 1, 'Mixed Vegetable (Mixed Vegetable  )', 'Grms', '0.14', '34.75', '0.00%', '0.12', '30', '0.00%', '2020-03-20 14:59:36'),
(2440, 3, 5, 1, 'Mongo Paste (Mongo Paste  )', 'Grms', '0.11', '902.02', '0.10%', '0.11', '902', '0.11%', '2020-03-20 14:59:36'),
(2441, 3, 5, 1, 'Mother\'s Best Hot Sauce (Mother\'s Best Hot Sauce)', 'Bot', '19.1', '0', '0.00%', '18.7', '0', '0.00%', '2020-03-20 14:59:36'),
(2442, 3, 5, 1, 'Mushroom Jolly Prm HTKE (Mushroom Jolly Prm HTKE 198g  )', 'Grms', '0.12', '0', '0.00%', '0.14', '0', '0.00%', '2020-03-20 14:59:36'),
(2443, 3, 5, 1, 'Mushroom Shitake (Mushroom Shitake  284g     )', 'Grms', '0.14', '0', '0.00%', '0.18', '0', '0.00%', '2020-03-20 14:59:36'),
(2444, 3, 5, 1, 'Mushroom Sliced (Mushroom Sliced 400g  )', 'Grms', '0.13', '0', '0.00%', '0.12', '0', '0.00%', '2020-03-20 14:59:36'),
(2445, 3, 5, 1, 'Mushroom Straw (Mushroom Straw 200g  )', 'Grms', '0.24', '0', '0.00%', '0.24', '0', '0.00%', '2020-03-20 14:59:36'),
(2446, 3, 5, 1, 'Mushroom Whole 400g (Mushroom Whole 400g)', 'Grms', '0.13', '0', '0.00%', '0.12895', '0', '0.00%', '2020-03-20 14:59:36'),
(2447, 3, 5, 1, 'Mustard (Mustard Dijun 850gm E. Fallot  )', 'Grms', '0.32', '149.61', '0.02%', '0.8541', '400.57', '0.05%', '2020-03-20 14:59:36'),
(2448, 3, 5, 1, 'Mustard American 9oz (Mustard American 9oz Garden Yellow)', 'Bot', '99.37', '0', '0.00%', '89.5', '0', '0.00%', '2020-03-20 14:59:36'),
(2449, 3, 5, 1, 'Napolitana Sauce (Napolitana Sauce)', 'Grms', '0.07', '0', '0.00%', '0.09', '0', '0.00%', '2020-03-20 14:59:36'),
(2450, 3, 5, 1, 'Nutmeg Ground (Nutmeg Ground 375G/BOT  )', 'Bot', '88', '0', '0.00%', '87.95', '0', '0.00%', '2020-03-20 14:59:36'),
(2451, 3, 5, 1, 'Olive Oil 1L (Olive Oil 1L  )', 'Bot', '509', '0', '0.00%', '509.1', '0', '0.00%', '2020-03-20 14:59:36'),
(2452, 3, 5, 1, 'Olive Oil Senorita 500ml (Olive Oil Senorita 500ml)', 'ML', '0.41', '0', '0.00%', '0.41', '0', '0.00%', '2020-03-20 14:59:36'),
(2453, 3, 5, 1, 'Onion (Onion)', 'Grms', '0.06', '117.23', '0.01%', '0.084', '164.3', '0.02%', '2020-03-20 14:59:36'),
(2454, 3, 5, 1, 'Onion Soup (350gm) (Onion Soup (350gm))', 'Ptn', '35.34', '0', '0.00%', '47.55', '0', '0.00%', '2020-03-20 14:59:36'),
(2455, 3, 5, 1, 'Orange (Orange)', 'ea', '23.75', '285', '0.03%', '25', '300', '0.04%', '2020-03-20 14:59:36'),
(2456, 3, 5, 1, 'Oregano Ground (Oregano Ground 10G  )', 'Bot', '85.7', '0', '0.00%', '85.7', '0', '0.00%', '2020-03-20 14:59:36'),
(2457, 3, 5, 1, 'Oyster Sauce Lee Kum Kee 907ml (Oyster Sauce Lee Kum Kee 907ml  )', 'Bot', '172.5', '0', '0.00%', '172.5', '0', '0.00%', '2020-03-20 14:59:36'),
(2458, 3, 5, 1, 'Oyster Sauce Mothers Best (Oyster Sauce Mothers Best 750ml  )', 'Bot', '82.33', '0', '0.00%', '117.8', '0', '0.00%', '2020-03-20 14:59:36'),
(2459, 3, 5, 1, 'Palabok Sauce (Palabok Sauce)', 'Ptn', '14.38', '603.96', '0.07%', '14.38', '603.96', '0.07%', '2020-03-20 14:59:36'),
(2460, 3, 5, 1, 'Paper well chicken box (Paper well chicken box (5pcs/box))', 'ea', '16.32', '0', '0.00%', '16.32', '0', '0.00%', '2020-03-20 14:59:36'),
(2461, 3, 5, 1, 'Paprika Spanish 34g (Paprika Spanish 34g  )', 'Bar', '56.41', '0', '0.00%', '56.4', '0', '0.00%', '2020-03-20 14:59:36'),
(2462, 3, 5, 1, 'Parmesan Cheese (Parmesan Cheese  )', 'Grms', '1.23', '1154.39', '0.12%', '1.19', '1115.03', '0.13%', '2020-03-20 14:59:36'),
(2463, 3, 5, 1, 'Parsley (Parsley)', 'Grms', '0.39', '131.61', '0.01%', '0.18', '61.02', '0.01%', '2020-03-20 14:59:36'),
(2464, 3, 5, 1, 'Pastel (pastel)', 'ea', '106.11', '742.77', '0.08%', '106.11', '742.77', '0.09%', '2020-03-20 14:59:36'),
(2465, 3, 5, 1, 'Patis 1 L (Patis 1 L)', 'Bot', '58.78', '0', '0.00%', '53.8', '0', '0.00%', '2020-03-20 14:59:36'),
(2466, 3, 5, 1, 'Pattie Big 120gm (Pattie Big 120gm)', 'Ptn', '71.23', '0', '0.00%', '45.59', '0', '0.00%', '2020-03-20 14:59:36'),
(2467, 3, 5, 1, 'Pattie Small 80gm (Pattie Small 80gm)', 'Ptn', '56.65', '849.75', '0.09%', '36.26', '543.9', '0.07%', '2020-03-20 14:59:36'),
(2468, 3, 5, 1, 'Pears/ Peras (Pears)', 'ea', '25', '0', '0.00%', '0', '0', '0.00%', '2020-03-20 14:59:36'),
(2469, 3, 5, 1, 'Pickle Relish (Pickle Relish 270g/bot  )', 'Bot', '46.84', '0', '0.00%', '45.8', '0', '0.00%', '2020-03-20 14:59:36'),
(2470, 3, 5, 1, 'Pineapple (Pineapple)', 'Grms', '0.03', '84.61', '0.01%', '0.032', '92.13', '0.01%', '2020-03-20 14:59:36'),
(2471, 3, 5, 1, 'Poached chicken (60gm/portion) (Poached chicken (60gm/portion))', 'Ptn', '31.6', '0', '0.00%', '31.6', '0', '0.00%', '2020-03-20 14:59:36'),
(2472, 3, 5, 1, 'Pork Bratwurst (Pork Bratwurst 1 kl/pck or 6 pcs/pack-130gms    )', 'Grms', '0.39', '0', '0.00%', '0.39', '0', '0.00%', '2020-03-20 14:59:36'),
(2473, 3, 5, 1, 'Pork Chicharon Family (Pork Chicharon Family)', 'Pck', '61.5', '246', '0.03%', '56', '224', '0.03%', '2020-03-20 14:59:36'),
(2474, 3, 5, 1, 'Pork Chop 100gm (Pork Chop 100gm)', 'Ptn', '40.42', '808.4', '0.09%', '40.42', '808.4', '0.10%', '2020-03-20 14:59:36'),
(2475, 3, 5, 1, 'Pork Mandarin Sausage (Pork Mandarin Sausage  )', 'Grms', '0.35', '0', '0.00%', '0.35', '0', '0.00%', '2020-03-20 14:59:36'),
(2476, 3, 5, 1, 'Pork Tapa 80gm (Pork Tapa 80gm)', 'Ptn', '20.06', '220.66', '0.02%', '25.16', '276.76', '0.03%', '2020-03-20 14:59:36'),
(2477, 3, 5, 1, 'Pork Tocino 80gm (Pork Tocino 80gm)', 'Ptn', '16.72', '0', '0.00%', '25.53', '0', '0.00%', '2020-03-20 14:59:36'),
(2478, 3, 5, 1, 'Porky Best Reg. Chicharon (60g) (Pork Chicharon 70g)', 'Ptn', '38.8', '155.2', '0.02%', '39.25', '157', '0.02%', '2020-03-20 14:59:36'),
(2479, 3, 5, 1, 'Potato (Potato)', 'Grms', '0.06', '-0.01', '0.00%', '0.05', '0', '0.00%', '2020-03-20 14:59:36'),
(2480, 3, 5, 1, 'Precut Tissue (Precut Tissue)', 'Roll', '85', '1134.75', '0.12%', '85', '1134.75', '0.14%', '2020-03-20 14:59:36'),
(2481, 3, 5, 1, 'Precut Tissue @P 76.00 (Precut Tissue @P76.00)', 'Pck', '85', '0', '0.00%', '76', '0', '0.00%', '2020-03-20 14:59:36'),
(2482, 3, 5, 1, 'Pumpkin soup 200gm/portion (Pumpkin soup 200gm/portion)', 'Ptn', '20.46', '0', '0.00%', '20.46', '0', '0.00%', '2020-03-20 14:59:36'),
(2483, 3, 5, 1, 'Quick Melt 440g (Quick Melt 440g  )', 'Grms', '0.74', '1406', '0.15%', '0.74', '1406', '0.17%', '2020-03-20 14:59:36'),
(2484, 3, 5, 1, 'RAM Prmm Spaghetti 1kg (RAM Prmm Spaghetti 1kg)', 'Pck', '55.54', '0', '0.00%', '54', '0', '0.00%', '2020-03-20 14:59:37'),
(2485, 3, 5, 1, 'Ram soy Sauce 1L (Ram soy Sauce 1L)', 'gal', '23.68', '54.47', '0.01%', '41.9', '96.37', '0.01%', '2020-03-20 14:59:37'),
(2486, 3, 5, 1, 'Ram Special Bihon 454g (Ram Special Bihon 454g)', 'Pck', '33.5', '0', '0.00%', '33.5', '0', '0.00%', '2020-03-20 14:59:37'),
(2487, 3, 5, 1, 'Ram Vinegar 1L (Ram Vinegar 1L)', 'gal', '28.3', '38.49', '0.00%', '28.3', '38.49', '0.01%', '2020-03-20 14:59:37'),
(2488, 3, 5, 1, 'Rice (Rice)', 'Kls', '33.88', '4637.6', '0.50%', '51.04167', '6987.6', '0.83%', '2020-03-20 14:59:37'),
(2489, 3, 5, 1, 'Rice Wine 700ml (Rice Wine 700ml  )', 'Bot', '76.51', '0', '0.00%', '76.5', '0', '0.00%', '2020-03-20 14:59:37'),
(2490, 3, 5, 1, 'Rosemary 11g (Rosemary 11g  )', 'Bot', '42.46', '0', '0.00%', '42.45', '0', '0.00%', '2020-03-20 14:59:37'),
(2491, 3, 5, 1, 'Royal Spaghetti (Royal Spaghetti  )', 'Pck', '88', '0', '0.00%', '88', '0', '0.00%', '2020-03-20 14:59:37'),
(2492, 3, 5, 1, 'Rufina Patis 325ml (Rufina Patis 325ml)', 'gal', '39.65', '0', '0.00%', '39.65', '0', '0.00%', '2020-03-20 14:59:37'),
(2493, 3, 5, 1, 'Rufina Patis 750ml (Rufina Patis 750ml)', 'Bot', '66.7', '0', '0.00%', '66.7', '0', '0.00%', '2020-03-20 14:59:37'),
(2494, 3, 5, 1, 'Sage Leaves 12g (Sage Leaves 12g  )', 'Bot', '44.25', '0', '0.00%', '44.25', '0', '0.00%', '2020-03-20 14:59:37'),
(2495, 3, 5, 1, 'Salsa berde (Salsa berde)', 'Grms', '0.15', '0', '0.00%', '0.15', '0', '0.00%', '2020-03-20 14:59:37'),
(2496, 3, 5, 1, 'Salt (Salt  )', 'Grms', '0.01', '63.64', '0.01%', '0.01', '54.5', '0.01%', '2020-03-20 14:59:37'),
(2497, 3, 5, 1, 'San Remo Fettuccini (San Remo Fettuccini 500g  )', 'Grms', '0.13', '166.41', '0.02%', '0.13', '167.7', '0.02%', '2020-03-20 14:59:37'),
(2498, 3, 5, 1, 'Seafoods for pasta (Seafoods for pasta (20g/ptn))', 'Ptn', '11.1', '0', '0.00%', '11.1', '0', '0.00%', '2020-03-20 14:59:37'),
(2499, 3, 5, 1, 'Sesame Dressing kewpie(400ml) (Sesame Dressing kewpie(400ml))', 'Grms', '0.59', '0', '0.00%', '0.59', '0', '0.00%', '2020-03-20 14:59:37'),
(2500, 3, 5, 1, 'Sesame Oil (Sesame Oil 115ml    )', 'Bot', '102.72', '0', '0.00%', '102.7', '0', '0.00%', '2020-03-20 14:59:37'),
(2501, 3, 5, 1, 'Sesame Oil Lee Kum Lee 207ml (Sesame Oil Lee Kum Lee 207ml  )', 'Bot', '0', '0', '0.00%', '127.9', '0', '0.00%', '2020-03-20 14:59:37'),
(2502, 3, 5, 1, 'Sesame Oil Mua Yu 500ml (Sesame Oil Mua Yu 500ml  )', 'Bot', '162', '0', '0.00%', '132', '0', '0.00%', '2020-03-20 14:59:37'),
(2503, 3, 5, 1, 'Shrimps (Shrimps  )', 'Grms', '0.56', '0', '0.00%', '0.24', '0', '0.00%', '2020-03-20 14:59:37'),
(2504, 3, 5, 1, 'Sibuyas Dahon (Sibuyas Dahon)', 'Grms', '0.12', '484.43', '0.05%', '0.09', '363.6', '0.04%', '2020-03-20 14:59:37'),
(2505, 3, 5, 1, 'Silver Swan patis 750ml (Silver Swan patis 750ml)', 'gal', '50.65', '0', '0.00%', '50.65', '0', '0.00%', '2020-03-20 14:59:37'),
(2506, 3, 5, 1, 'Silver Swan Sukang 1L (Silver Swan Sukang 1L)', 'gal', '33.16', '0', '0.00%', '32.4', '0', '0.00%', '2020-03-20 14:59:37'),
(2507, 3, 5, 1, 'Silver Swan Swan Soy Sauce 1L (Silver Swan Soy Sauce (1L))', 'Grms', '0.04', '0', '0.00%', '0.04', '0', '0.00%', '2020-03-20 14:59:37'),
(2508, 3, 5, 1, 'Silver Swan Sweet Chili Sauce (Silver Swan Sweet Chili Sauce)', 'Grms', '19.95', '0', '0.00%', '19.95', '0', '0.00%', '2020-03-20 14:59:37'),
(2509, 3, 5, 1, 'Singkamas (Singkamas)', 'Grms', '0.06', '0', '0.00%', '0', '0', '0.00%', '2020-03-20 14:59:37'),
(2510, 3, 5, 1, 'Sizzling Chicken (Sizzling Chicken)', 'Ptn', '30.14', '452.1', '0.05%', '30.14', '452.1', '0.05%', '2020-03-20 14:59:37'),
(2511, 3, 5, 1, 'Sizzling Pork (Sizzling Pork)', 'Ptn', '27.77', '805.33', '0.09%', '22.22', '644.38', '0.08%', '2020-03-20 14:59:37'),
(2512, 3, 5, 1, 'Sliced Black Olive 330gms (Sliced Black Olive 330gms)', 'Bot', '76.65', '0', '0.00%', '76.65', '0', '0.00%', '2020-03-20 14:59:37'),
(2513, 3, 5, 1, 'Sliced Mushroom 284g (Sliced Mushroom 284g)', 'Pck', '42.34', '0', '0.00%', '43.03', '0', '0.00%', '2020-03-20 14:59:37'),
(2514, 3, 5, 1, 'Smoked Ham 50gm (Smoked Ham 50gm)', 'Ptn', '12.46', '0', '0.00%', '13.7', '0', '0.00%', '2020-03-20 14:59:37'),
(2515, 3, 5, 1, 'Smoked Pork Sausage (Smoked Pork Sausage 1KL/pack X 19pcs    )', 'Grms', '0.02', '0', '0.00%', '0.02', '0', '0.00%', '2020-03-20 14:59:37'),
(2516, 3, 5, 1, 'Soy Sauce 500ml (Soy Sauce 500ml  )', 'Bot', '76.7', '0', '0.00%', '57', '0', '0.00%', '2020-03-20 14:59:37'),
(2517, 3, 5, 1, 'Spaghetti Pasta (Spaghetti Pasta)', 'Pck', '67.95', '543.6', '0.06%', '67.95', '543.6', '0.07%', '2020-03-20 14:59:37'),
(2518, 3, 5, 1, 'Spiced Ham (Spiced Ham)', 'Grms', '0.16', '0', '0.00%', '0.16', '0', '0.00%', '2020-03-20 14:59:37'),
(2519, 3, 5, 1, 'Squid (Squid)', 'Grms', '0.16', '0', '0.00%', '0.12', '0', '0.00%', '2020-03-20 14:59:37'),
(2520, 3, 5, 1, 'Star Anis (Star Anis  )', 'Bot', '53.24', '0', '0.00%', '53.25', '0', '0.00%', '2020-03-20 14:59:37'),
(2521, 3, 5, 1, 'Sukang Puti (Sukang Puti)', 'Pck', '15.73', '0', '0.00%', '14.1', '0', '0.00%', '2020-03-20 14:59:37'),
(2522, 3, 5, 1, 'Tauge (Tauge  )', 'Grms', '0', '0', '0.00%', '0.04', '0', '0.00%', '2020-03-20 14:59:37'),
(2523, 3, 5, 1, 'Thyme Leaves (Thyme Leaves 14g  )', 'Bot', '44.3', '0', '0.00%', '44.3', '0', '0.00%', '2020-03-20 14:59:37'),
(2524, 3, 5, 1, 'Tita My Patis 750ml (Tita My Patis 750ml)', 'Bot', '23.68', '125.99', '0.01%', '37.95', '201.89', '0.02%', '2020-03-20 14:59:37'),
(2525, 3, 5, 1, 'Tomato (Tomato)', 'Grms', '0.03', '0', '0.00%', '0.037', '0', '0.00%', '2020-03-20 14:59:37'),
(2526, 3, 5, 1, 'Tomato Paste (Tomato Paste 150g/pack  )', 'Pck', '19.25', '0', '0.00%', '19.25', '0', '0.00%', '2020-03-20 14:59:37'),
(2527, 3, 5, 1, 'Tomato Paste Ram 150g (Tomato Paste Ram 150g)', 'Pck', '22.95', '0', '0.00%', '22.95', '0', '0.00%', '2020-03-20 14:59:37'),
(2528, 3, 5, 1, 'Tomato Sauce (Tomato Sauce)', 'Bot', '15', '0', '0.00%', '15', '0', '0.00%', '2020-03-20 14:59:37'),
(2529, 3, 5, 1, 'Tomato Sauce Clara Ole (Tomato Sauce Clara Ole 1kg  )', 'Pck', '57', '0', '0.00%', '57', '0', '0.00%', '2020-03-20 14:59:37'),
(2530, 3, 5, 1, 'Tomato soup 235gm/portion (Tomato soup 235gm/portion)', 'Ptn', '26.52', '0', '0.00%', '32.51', '0', '0.00%', '2020-03-20 14:59:37'),
(2531, 3, 5, 1, 'Tuna 1705g (Tuna 1705g  )', 'Grms', '0.25', '0', '0.00%', '0.24', '0', '0.00%', '2020-03-20 14:59:37'),
(2532, 3, 5, 1, 'Tuna 184g (Tuna 184g  )', 'Can', '51.5', '0', '0.00%', '51.5', '0', '0.00%', '2020-03-20 14:59:37'),
(2533, 3, 5, 1, 'Turmeric Ground 30g (Turmeric Ground 30g  )', 'Bot', '50.89', '0', '0.00%', '50.9', '0', '0.00%', '2020-03-20 14:59:37'),
(2534, 3, 5, 1, 'US Lemon (US Lemon)', 'ea', '23', '230', '0.03%', '25', '250', '0.03%', '2020-03-20 14:59:37'),
(2535, 3, 5, 1, 'Vegetable oil (Vegetable oil)', 'Grms', '0.05', '0', '0.00%', '0.06', '0', '0.00%', '2020-03-20 14:59:37'),
(2536, 3, 5, 1, 'Vinegar (1.893ml) (Vinegar (1.893ml))', 'Grms', '0.03', '0', '0.00%', '0.03', '0', '0.00%', '2020-03-20 14:59:37'),
(2537, 3, 5, 1, 'Vinegar Balsamic (Vinegar Balsamic 500ml/bot  )', 'Bot', '245', '0', '0.00%', '245', '0', '0.00%', '2020-03-20 14:59:37'),
(2538, 3, 5, 1, 'Vinegar Capers (Vinegar Capers 340g/bot  )', 'Bot', '139.3', '0', '0.00%', '142.6', '0', '0.00%', '2020-03-20 14:59:37'),
(2539, 3, 5, 1, 'Virginia Pasta Spaghetti 1kg (Virginia Pasta Spaghetti 1kg)', 'Pck', '65', '0', '0.00%', '65', '0', '0.00%', '2020-03-20 14:59:37'),
(2540, 3, 5, 1, 'Virginia Salami 1kg (Virginia Salami 1kg)', 'Pck', '220', '0', '0.00%', '185.5', '0', '0.00%', '2020-03-20 14:59:37'),
(2541, 3, 5, 1, 'Watermelon (Watermelon)', 'Grms', '0.03', '0', '0.00%', '0.03', '0', '0.00%', '2020-03-20 14:59:37'),
(2542, 3, 5, 1, 'Wax Paper (HS Wax Paper 25SQFT)', 'Roll', '46', '0', '0.00%', '66', '0', '0.00%', '2020-03-20 14:59:37'),
(2543, 3, 5, 1, 'White Onion (White Onion)', 'Grms', '0.07', '92', '0.01%', '0.068', '95.88', '0.01%', '2020-03-20 14:59:37'),
(2544, 3, 5, 1, 'White Pepper Powder 31g (White Pepper Powder 31g  )', 'Bot', '0', '0', '0.00%', '74.15', '0', '0.00%', '2020-03-20 14:59:37'),
(2545, 3, 5, 1, 'Winner Cooked Ham (Winner Cooked Ham (1kg))', 'Grms', '0.14', '380.92', '0.04%', '0.225', '605.93', '0.07%', '2020-03-20 14:59:37'),
(2546, 3, 5, 1, 'Winner Cooked Ham 250g (Winner Cooked Ham 250g)', 'Grms', '0.24', '0', '0.00%', '0', '0', '0.00%', '2020-03-20 14:59:37'),
(2547, 3, 5, 1, 'Worcester Shire (Worcester Shire)', 'ML', '0.23', '0', '0.00%', '0.23', '0', '0.00%', '2020-03-20 14:59:37'),
(2548, 3, 6, 1, '1 Oz Cup White (1 Oz Cup White)', 'ea', '0', '0', '0.00%', '0.6', '0', '0.00%', '2020-03-20 15:02:44'),
(2549, 3, 6, 1, '1 oz Lid White (1 oz Lid White  )', 'ea', '0', '0', '0.00%', '0.5', '0', '0.00%', '2020-03-20 15:02:44'),
(2550, 3, 6, 1, '10 Cake Box (10 Cake Box  )', 'ea', '8', '0', '0.00%', '8', '0', '0.00%', '2020-03-20 15:02:44'),
(2551, 3, 6, 1, '10x10x15 (10x10x15)', 'ea', '21', '0', '0.00%', '21', '0', '0.00%', '2020-03-20 15:02:44'),
(2552, 3, 6, 1, '10x10x4.5 Cake box (10x10x4.5 Cake box  )', 'ea', '18', '0', '0.00%', '18', '0', '0.00%', '2020-03-20 15:02:44'),
(2553, 3, 6, 1, '10x10x4.5 Tricircle (10\'s) (10x10x4.5 Tricircle (10\'s))', 'ea', '195', '0', '0.00%', '195', '0', '0.00%', '2020-03-20 15:02:44'),
(2554, 3, 6, 1, '10x10x5 Cake Box (10x10x5 Cake Box  )', 'ea', '23', '6900', '0.74%', '23', '6900', '0.82%', '2020-03-20 15:02:44'),
(2555, 3, 6, 1, '10x10x5 Cake Round Board (10x10x5 Cake Round Board  )', 'ea', '12', '14556', '1.57%', '16', '19408', '2.31%', '2020-03-20 15:02:44'),
(2556, 3, 6, 1, '10X10X5 Royal Red (10X10X5 Royal Red)', 's', '23', '0', '0.00%', '23.92', '0', '0.00%', '2020-03-20 15:02:44'),
(2557, 3, 6, 1, '10X14 Board (Silver) (10X14 Board (Silver))', 'ea', '18', '0', '0.00%', '21', '0', '0.00%', '2020-03-20 15:02:44'),
(2558, 3, 6, 1, '10X14 board decorated (10X14 board decorated  )', 'ea', '22', '0', '0.00%', '22', '0', '0.00%', '2020-03-20 15:02:44'),
(2559, 3, 6, 1, '10X14 board thick (10X14 board thick  )', 'ea', '8.5', '0', '0.00%', '8.5', '0', '0.00%', '2020-03-20 15:02:44'),
(2560, 3, 6, 1, '10x14 Cake Board (10x14 Cake Board  )', 'ea', '19.99', '819.76', '0.09%', '20', '820', '0.10%', '2020-03-20 15:02:44'),
(2561, 3, 6, 1, '10x14 Cake Box (10x14 Cake Box)', 'ea', '24.5', '1029', '0.11%', '24', '1008', '0.12%', '2020-03-20 15:02:44'),
(2562, 3, 6, 1, '10x14x5 box red (10x14x5 box red  )', 'ea', '27', '0', '0.00%', '27', '0', '0.00%', '2020-03-20 15:02:44'),
(2563, 3, 6, 1, '12 oz QTC Hot Heads (12 oz QTC Hot Heads  )', 'ea', '0', '0', '0.00%', '2.3', '0', '0.00%', '2020-03-20 15:02:44'),
(2564, 3, 6, 1, '12oz QTC Hot Cup Ripple (12oz QTC Hot Cup  Ripple  )', 'ea', '0', '0', '0.00%', '6.95', '0', '0.00%', '2020-03-20 15:02:44'),
(2565, 3, 6, 1, '14x14 board thin (14x14 board thin  )', 'ea', '13.86', '0', '0.00%', '12.5', '0', '0.00%', '2020-03-20 15:02:44'),
(2566, 3, 6, 1, '14x14 Board White (14x14 Board White)', 'ea', '33', '0', '0.00%', '33', '0', '0.00%', '2020-03-20 15:02:44'),
(2567, 3, 6, 1, '14x14 Cake Board (14x14 Cake Board  )', 'ea', '14.6', '248.18', '0.03%', '14', '238', '0.03%', '2020-03-20 15:02:44'),
(2568, 3, 6, 1, '14x14 Cake Box (14x14 Cake Box)', 'ea', '31.57', '0', '0.00%', '33', '0', '0.00%', '2020-03-20 15:02:44'),
(2569, 3, 6, 1, '14x14x5 Board (14x14x5 Board)', 'ea', '32', '0', '0.00%', '32', '0', '0.00%', '2020-03-20 15:02:44'),
(2570, 3, 6, 1, '14x14x5 cake box red (14x14x5 cake box red  )', 'ea', '36.62', '549.36', '0.06%', '35.75', '536.25', '0.06%', '2020-03-20 15:02:44'),
(2571, 3, 6, 1, '14X18 Board ( B) (14X18 Board ( B))', 'ea', '16', '0', '0.00%', '0', '0', '0.00%', '2020-03-20 15:02:44'),
(2572, 3, 6, 1, '14x18 Cake Board (14x18 Cake Board  )', 'ea', '38.06', '951.5', '0.10%', '38', '950', '0.11%', '2020-03-20 15:02:44'),
(2573, 3, 6, 1, '14x18x5 (red ) box (14x18x5 (red ) box  )', 'ea', '38.89', '427.76', '0.05%', '35', '385', '0.05%', '2020-03-20 15:02:44'),
(2574, 3, 6, 1, '14x18x5 board (14x18x5 board)', 'ea', '38', '0', '0.00%', '38', '0', '0.00%', '2020-03-20 15:02:44'),
(2575, 3, 6, 1, '320cc cup w/ lid (320cc cup w/ lid)', 'ea', '4.6', '0', '0.00%', '4.6', '0', '0.00%', '2020-03-20 15:02:44');
INSERT INTO `eb_raw_materials` (`PK_raw_materials_id`, `FK_outlet_id`, `FK_category_id`, `status`, `material_name`, `unit`, `average_cost`, `asset_value`, `total_asset_percent`, `sales_price`, `retail_value`, `total_retail_percent`, `date_added`) VALUES
(2576, 3, 6, 1, '520 CC W/lid (520 CC W/lid)', 'ea', '5.57', '0', '0.00%', '5.76', '0', '0.00%', '2020-03-20 15:02:44'),
(2577, 3, 6, 1, '520cc Lid (520cc Lid)', 'ea', '1.35', '0', '0.00%', '1.35', '0', '0.00%', '2020-03-20 15:02:44'),
(2578, 3, 6, 1, '7X11 Bag (7X11 Bag)', 'Pck', '200', '0', '0.00%', '200', '0', '0.00%', '2020-03-20 15:02:44'),
(2579, 3, 6, 1, '7X7 Board (7X7 Board)', 'ea', '10.5', '0', '0.00%', '10.5', '0', '0.00%', '2020-03-20 15:02:44'),
(2580, 3, 6, 1, '7x7x4 Cake Box (7x7x4 Cake Box  )', 'ea', '23', '0', '0.00%', '23', '0', '0.00%', '2020-03-20 15:02:44'),
(2581, 3, 6, 1, '880CC Paper Lunch Box Medium (80CC Paper Lunch Box Medium)', 'ea', '10.25', '205', '0.02%', '10.25', '205', '0.02%', '2020-03-20 15:02:44'),
(2582, 3, 6, 1, 'Alpa Plastic bag 4x10 (Alpa Plastic bag 4x10 (100\'s))', 'ea', '0.13', '0', '0.00%', '0', '0', '0.00%', '2020-03-20 15:02:44'),
(2583, 3, 6, 1, 'Alpa Plastic bag 5x8 (Alpa Plastic bag 5x8 (100\'s))', 'ea', '0.12', '0', '0.00%', '0.12', '0', '0.00%', '2020-03-20 15:02:44'),
(2584, 3, 6, 1, 'Baking Cups (2oz.) (Baking Cups (2oz.)  )', 'ea', '0.79', '0', '0.00%', '2.6', '0', '0.00%', '2020-03-20 15:02:44'),
(2585, 3, 6, 1, 'Black straw individual packing (Black straw individual packing (100\'s))', 'ea', '0.55', '9.9', '0.00%', '0.55', '9.9', '0.00%', '2020-03-20 15:02:44'),
(2586, 3, 6, 1, 'Brown Paper #2 (Brown Paper #2)', 'ea', '0.26', '0.02', '0.00%', '0.2633', '0', '0.00%', '2020-03-20 15:02:44'),
(2587, 3, 6, 1, 'C-302 Burger Box Clear (C-302 Burger Box Clear  )', 'ea', '5.15', '6508', '0.70%', '7', '8848', '1.05%', '2020-03-20 15:02:44'),
(2588, 3, 6, 1, 'CBJ Cellophane (CBJ Cellophane  )', 'ea', '0', '0', '0.00%', '1.3', '0', '0.00%', '2020-03-20 15:02:44'),
(2589, 3, 6, 1, 'CBL Cellophane (CBL Cellophane  )', 'ea', '1.15', '0', '0.00%', '1.1', '0', '0.00%', '2020-03-20 15:02:44'),
(2590, 3, 6, 1, 'Cellophane 1x10 (Cellophane 1x10  )', 'Pck', '9.1', '0', '0.00%', '7.15', '0', '0.00%', '2020-03-20 15:02:44'),
(2591, 3, 6, 1, 'Cellophane 8x14/ smoked celloph (Cellophane 8x14/ smoked cellophane  )', 'Pck', '17', '17', '0.00%', '17', '17', '0.00%', '2020-03-20 15:02:44'),
(2592, 3, 6, 1, 'Chicken Box (Chicken Box)', 'ea', '16.32', '0', '0.00%', '16.32', '0', '0.00%', '2020-03-20 15:02:44'),
(2593, 3, 6, 1, 'Chip Board (Chip Board)', 'ea', '19', '0', '0.00%', '19', '0', '0.00%', '2020-03-20 15:02:44'),
(2594, 3, 6, 1, 'ChipBoard #70 (ChipBoard #70)', 'ea', '19', '114', '0.01%', '19', '114', '0.01%', '2020-03-20 15:02:44'),
(2595, 3, 6, 1, 'Clam Shell - Take Out Box (Clam Shell - Take Out Box for Salad  )', 'ea', '9', '0', '0.00%', '9', '0', '0.00%', '2020-03-20 15:02:44'),
(2596, 3, 6, 1, 'Clear Box 5s (Clear Box 5s)', 'ea', '33', '0', '0.00%', '33', '0', '0.00%', '2020-03-20 15:02:44'),
(2597, 3, 6, 1, 'Coffee paper cup 8oz. (10\'s) (Coffee paper cup 8oz. (10\'s))', 'Pck', '60', '0', '0.00%', '60', '0', '0.00%', '2020-03-20 15:02:44'),
(2598, 3, 6, 1, 'Coffee Paper Cup w/ cover 7oz. (Coffee Paper Cup w/ cover 7oz.  )', 'ea', '6.5', '1261', '0.14%', '6.5', '1261', '0.15%', '2020-03-20 15:02:44'),
(2599, 3, 6, 1, 'Croco Waxpaper 12x150mm (Croco Waxpaper 12x150mm)', 'ea', '150', '150', '0.02%', '450', '450', '0.05%', '2020-03-20 15:02:44'),
(2600, 3, 6, 1, 'Disposable Gloves (Disposable Gloves (100\'s/pck)', 'ea', '0.42', '168', '0.02%', '0.42', '168', '0.02%', '2020-03-20 15:02:44'),
(2601, 3, 6, 1, 'Durian plastic container-Clamsh (Durian plastic container-Clamshell  )', 'ea', '0', '0', '0.00%', '9', '0', '0.00%', '2020-03-20 15:02:44'),
(2602, 3, 6, 1, 'French Bread window (Plain) (French Bread window (Plain)  )', 'ea', '5.39', '15153.36', '1.63%', '5.18', '14555.8', '1.73%', '2020-03-20 15:02:44'),
(2603, 3, 6, 1, 'Fruitcake box (Fruitcake box)', 'ea', '18.49', '0', '0.00%', '18.49', '0', '0.00%', '2020-03-20 15:02:44'),
(2604, 3, 6, 1, 'Glassine (Glassine  )', 'ea', '1.53', '0', '0.00%', '1.5', '0', '0.00%', '2020-03-20 15:02:44'),
(2605, 3, 6, 1, 'Gold Wire Twist (Gold Wire Twist)', 'Roll', '75', '750', '0.08%', '75', '750', '0.09%', '2020-03-20 15:02:44'),
(2606, 3, 6, 1, 'Healthy (European) cellophane (Healthy (European) cellophane)', 'ea', '1.2', '1200', '0.13%', '1.08', '1080', '0.13%', '2020-03-20 15:02:44'),
(2607, 3, 6, 1, 'Hopia Box (Hopia Box 5x6 9/4x1 1/2)', 'ea', '6.5', '0', '0.00%', '6.5', '0', '0.00%', '2020-03-20 15:02:44'),
(2608, 3, 6, 1, 'JC-520 Flat Lid Trasparent (JC-520 Flat Lid Trasparent)', 'ea', '2', '400', '0.04%', '2', '400', '0.05%', '2020-03-20 15:02:44'),
(2609, 3, 6, 1, 'Jellycup (Jellycup  )', 'ea', '0', '0', '0.00%', '13', '0', '0.00%', '2020-03-20 15:02:44'),
(2610, 3, 6, 1, 'Jellyroll box (Jellyroll box  )', 'ea', '19.07', '2460.13', '0.27%', '21', '2709', '0.32%', '2020-03-20 15:02:44'),
(2611, 3, 6, 1, 'Jellyroll w/ handle (Jellyroll w/ handle  )', 'ea', '21', '0', '0.00%', '21', '0', '0.00%', '2020-03-20 15:02:44'),
(2612, 3, 6, 1, 'Laminated Comm Packaging (Laminated Comm Packaging)', 'Grms', '0.75', '0', '0.00%', '0.7446', '0', '0.00%', '2020-03-20 15:02:44'),
(2613, 3, 6, 1, 'Matza Cellophane 7x11 (Matza Cellophane 7x11)', 'ea', '2.04', '612', '0.07%', '2', '600', '0.07%', '2020-03-20 15:02:44'),
(2614, 3, 6, 1, 'OPP (OPP  )', 'Grms', '0.23', '2885.58', '0.31%', '0.175', '2152.5', '0.26%', '2020-03-20 15:02:44'),
(2615, 3, 6, 1, 'PA-520ML Paper Bowl (PA-520ML Paper Bowl)', 'ea', '4', '800', '0.09%', '4', '800', '0.10%', '2020-03-20 15:02:44'),
(2616, 3, 6, 1, 'Paper Bowl 520cc (Paper Bowl 520cc)', 'ea', '2.8', '0', '0.00%', '2.8', '0', '0.00%', '2020-03-20 15:02:44'),
(2617, 3, 6, 1, 'Paper cup 25\'s (Paper cup 25\'s  )', 'ea', '4.02', '0', '0.00%', '4.5', '0', '0.00%', '2020-03-20 15:02:44'),
(2618, 3, 6, 1, 'Paper Cup Plain w/ Lid 12oz.X10 (Paper Cup Plain w/ Lid 12oz.X10\'s  )', 'ea', '7.5', '0', '0.00%', '7.5', '0', '0.00%', '2020-03-20 15:02:44'),
(2619, 3, 6, 1, 'Paper cup White 12oz. 25\'s (Paper cup White 12oz. 25\'s)', 'ea', '2.2', '0', '0.00%', '2.2', '0', '0.00%', '2020-03-20 15:02:44'),
(2620, 3, 6, 1, 'Paperwell Coffee Cups 12s (Paperwell Coffee Cups 12s)', 'Pck', '43.55', '0', '0.00%', '87.1', '0', '0.00%', '2020-03-20 15:02:44'),
(2621, 3, 6, 1, 'Parchment Paper (Parchment Paper 30sq 10yd)', 'Roll', '69.75', '0', '0.00%', '69.75', '0', '0.00%', '2020-03-20 15:02:44'),
(2622, 3, 6, 1, 'Plastic Cup (Plastic Cup  )', 'ea', '0.9', '5.4', '0.00%', '0.9', '5.4', '0.00%', '2020-03-20 15:02:44'),
(2623, 3, 6, 1, 'Plastic Fork Medium 25\'s (Plastic Fork Medium 25\'s  )', 'Pck', '12.9', '0', '0.00%', '12.9', '0', '0.00%', '2020-03-20 15:02:44'),
(2624, 3, 6, 1, 'Plastic Fork White (Plastic Fork White)', 'Pck', '16', '5200', '0.56%', '16', '5200', '0.62%', '2020-03-20 15:02:44'),
(2625, 3, 6, 1, 'Plastic Spoon Medium 25\'s (Plastic Spoon Medium 25\'s  )', 'Pck', '12.91', '3550.08', '0.38%', '12.9', '3547.5', '0.42%', '2020-03-20 15:02:44'),
(2626, 3, 6, 1, 'Plastic Spoon White (Plastic Spoon White)', 'Pck', '16', '0', '0.00%', '16', '0', '0.00%', '2020-03-20 15:02:44'),
(2627, 3, 6, 1, 'Rippled Cup- Take out cup (Rippled Cup- Take out cup)', 'ea', '10.05', '0', '0.00%', '10.05', '0', '0.00%', '2020-03-20 15:02:44'),
(2628, 3, 6, 1, 'Round Cake Board (Round Cake Board)', 'ea', '13', '0', '0.00%', '13', '0', '0.00%', '2020-03-20 15:02:44'),
(2629, 3, 6, 1, 'Sando Bag Large (Sando Bag Large  )', 'ea', '1.63', '359.05', '0.04%', '1.6', '352', '0.04%', '2020-03-20 15:02:44'),
(2630, 3, 6, 1, 'Sando Bag Medium (Sando Bag Medium  )', 'ea', '1.3', '28861.26', '3.11%', '1.3', '28861.3', '3.43%', '2020-03-20 15:02:44'),
(2631, 3, 6, 1, 'Sando Bag Tiny (Sando Bag Tiny  )', 'ea', '0.68', '11968.24', '1.29%', '0.8', '14080', '1.68%', '2020-03-20 15:02:44'),
(2632, 3, 6, 1, 'Sando Bag Tiny 100s (4 U) (Sando Bag Tiny 100s (4 U))', 'ea', '0.28', '0', '0.00%', '0.28', '0', '0.00%', '2020-03-20 15:02:44'),
(2633, 3, 6, 1, 'Stirrer (Stirrer  )', 'ea', '0.54', '54', '0.01%', '0.54', '54', '0.01%', '2020-03-20 15:02:44'),
(2634, 3, 6, 1, 'Styro Alexander (Styro Alexander)', 'ea', '38', '0', '0.00%', '35', '0', '0.00%', '2020-03-20 15:02:44'),
(2635, 3, 6, 1, 'Supot # 5 3000s (Supot # 5 3000s)', 'ea', '0.62', '2171.4', '0.23%', '0.496', '1736', '0.21%', '2020-03-20 15:02:44'),
(2636, 3, 6, 1, 'Supot #2 (Supot #2)', 'ea', '0.36', '5763.42', '0.62%', '0.36', '5765.04', '0.69%', '2020-03-20 15:02:44'),
(2637, 3, 6, 1, 'Supot #3 (Supot #3 5000pc/bundle  )', 'ea', '0.4', '6018', '0.65%', '0.4012', '6018', '0.72%', '2020-03-20 15:02:44'),
(2638, 3, 6, 1, 'Supot #6 (Supot #6 3000pcs/bundle)', 'ea', '0.76', '8574.35', '0.92%', '0.757', '8576.81', '1.02%', '2020-03-20 15:02:44'),
(2639, 3, 6, 1, 'Supot #8 (Supot #8)', 'ea', '0.89', '0', '0.00%', '0.884', '0', '0.00%', '2020-03-20 15:02:44'),
(2640, 3, 6, 1, 'Take-out box -cake Single(menro (Take-out box -cake Single(menros)  )', 'ea', '6.38', '0', '0.00%', '6.8', '0', '0.00%', '2020-03-20 15:02:44'),
(2641, 3, 6, 1, 'Take Out bowl (Take Out bowl 5 pcs/pck    )', 'ea', '1.77', '0', '0.00%', '1.77', '0', '0.00%', '2020-03-20 15:02:44'),
(2642, 3, 6, 1, 'Take Out bowl Small (Take Out bowl Small 5 pcs/pck    )', 'ea', '1.14', '0', '0.00%', '1.14', '0', '0.00%', '2020-03-20 15:02:44'),
(2643, 3, 6, 1, 'Take out boxes medium (Take out boxes medium  )', 'ea', '7.5', '45', '0.01%', '7.5', '45', '0.01%', '2020-03-20 15:02:44'),
(2644, 3, 6, 1, 'Take Out Sauce Boat (Take Out Sauce Boat 100pcs/pack    )', 'ea', '0.59', '0', '0.00%', '0.59', '0', '0.00%', '2020-03-20 15:02:44'),
(2645, 3, 6, 1, 'Texas 1 1/4x10 (Texas 1 1/4x10 (100\'s))', 'ea', '0.1', '38.6', '0.00%', '0.091', '36.4', '0.00%', '2020-03-20 15:02:44'),
(2646, 3, 6, 1, 'Texas Cellophane Large (100\'s) (Texas Cellophane Large (100\'s))', 'ea', '1.04', '0', '0.00%', '1.08', '0', '0.00%', '2020-03-20 15:02:44'),
(2647, 3, 6, 1, 'Toasted Siopao Box (Toasted Siopao Box  )', 'ea', '10', '450', '0.05%', '10', '450', '0.05%', '2020-03-20 15:02:44'),
(2648, 3, 6, 1, 'Transparent Plastic Cup 7oz. (Transparent Plastic Cup 7oz.  )', 'ea', '4.5', '0', '0.00%', '4.5', '0', '0.00%', '2020-03-20 15:02:44'),
(2649, 3, 6, 1, 'Unleavened cellophane (Unleavened cellophane)', 'ea', '0.75', '0', '0.00%', '0.75', '0', '0.00%', '2020-03-20 15:02:44'),
(2650, 3, 6, 1, 'White Flexible Straw (100\'s) (White Flexible Straw (100\'s))', 'ea', '0.2', '0', '0.00%', '0.3025', '0', '0.00%', '2020-03-20 15:02:44'),
(2651, 3, 7, 1, 'Chicken Adobo (Chicken Adobo)', 'Ptn', '12.06', '651.25', '0.07%', '12.17', '657.18', '0.08%', '2020-03-20 15:04:10'),
(2652, 3, 7, 1, 'Chicken Alaking (Chicken Alaking)', 'ea', '109.8', '1647', '0.18%', '109.8', '1647', '0.20%', '2020-03-20 15:04:10'),
(2653, 3, 7, 1, 'Chicken Teriyaki (Chicken Teriyaki)', 'Ptn', '33.83', '1725.33', '0.19%', '33.83', '1725.33', '0.21%', '2020-03-20 15:04:10'),
(2654, 3, 7, 1, 'Curry Meat (Curry Meat)', 'Ptn', '41.31', '413.1', '0.05%', '41.31', '413.1', '0.05%', '2020-03-20 15:04:10'),
(2655, 3, 7, 1, 'Hungarian Sausages pcs (Hungarian Sausages pcs)', 'Ptn', '62.4', '1123.2', '0.12%', '0', '0', '0.00%', '2020-03-20 15:04:10'),
(2656, 3, 7, 1, 'MeatBall (MeatBall)', 'Ptn', '57.05', '0', '0.00%', '57.05', '0', '0.00%', '2020-03-20 15:04:10'),
(2657, 3, 7, 1, 'Pork Humba (Pork Humba)', 'ea', '20', '1320', '0.14%', '20', '1320', '0.16%', '2020-03-20 15:04:10'),
(2658, 3, 7, 1, 'Spare Ribs (Spare Ribs)', 'ea', '102.37', '0', '0.00%', '102.37', '0', '0.00%', '2020-03-20 15:04:10'),
(2659, 3, 7, 1, 'Teriyaki Sauce (Teriyaki Sauce)', 'Kls', '86.43', '1901.46', '0.21%', '86.43', '1901.46', '0.23%', '2020-03-20 15:04:10'),
(2660, 3, 8, 1, 'Banana Muffins - MIX (Banana Muffins - MIX)', 'MX', '328.9', '25160.85', '2.71%', '269.87', '20645.06', '2.46%', '2020-03-20 15:05:51'),
(2661, 3, 8, 1, 'Buko Bibingka Mix (Buko Bibingka Mix)', 'MX', '173.09', '10904.67', '1.18%', '151.7', '9557.1', '1.14%', '2020-03-20 15:05:51'),
(2662, 3, 8, 1, 'Cheese filling Kls (Cheese filling Kls)', 'Kls', '775.53', '853.08', '0.09%', '96.64', '106.3', '0.01%', '2020-03-20 15:05:51'),
(2663, 3, 8, 1, 'Cheese filling Mix 8Kls/Min (Cheese filling MIX - 8kls/mix)', 'MX', '798.24', '798.24', '0.09%', '893.47', '893.47', '0.11%', '2020-03-20 15:05:51'),
(2664, 3, 8, 1, 'CheeseLoaf kls (CheeseLoaf kls   )', 'Kls', '75.42', '21268.44', '2.29%', '68.2', '19232.4', '2.29%', '2020-03-20 15:05:51'),
(2665, 3, 8, 1, 'Choco Filling kls (Choco Filling kls)', 'Kls', '228.97', '1195.22', '0.13%', '95.9', '500.6', '0.06%', '2020-03-20 15:05:51'),
(2666, 3, 8, 1, 'Choco Lanay Filling (Choco Lanay Filling   )', 'Kls', '190.06', '0', '0.00%', '83.5', '0', '0.00%', '2020-03-20 15:05:51'),
(2667, 3, 8, 1, 'Cinnamon Filling Mix (Cinnamon Filling)', 'MX', '557.51', '6506.14', '0.70%', '109.17', '1274.01', '0.15%', '2020-03-20 15:05:51'),
(2668, 3, 8, 1, 'Cinnamon with Sugar Filling (Cinnamon with Sugar Filling)', 'Kls', '57.3', '0', '0.00%', '57.3', '0', '0.00%', '2020-03-20 15:05:51'),
(2669, 3, 8, 1, 'Coco Fruit -Mix (Coco Fruit -Mix (4.850kls  )  )', 'MX', '478.47', '0', '0.00%', '553.25', '0', '0.00%', '2020-03-20 15:05:51'),
(2670, 3, 8, 1, 'Coco Fruit Filling -kls (Coco Fruit Filling -kls)', 'Kls', '103.1', '0', '0.00%', '103.09', '0', '0.00%', '2020-03-20 15:05:51'),
(2671, 3, 8, 1, 'Coco Fruit Filling Mix (Coco Fruit Filling -Mix   )', 'MX', '550.37', '1100.74', '0.12%', '569.25', '1138.5', '0.14%', '2020-03-20 15:05:51'),
(2672, 3, 8, 1, 'Dark European (Dark European)', 'MX', '0', '0', '0.00%', '97.52', '0', '0.00%', '2020-03-20 15:05:51'),
(2673, 3, 8, 1, 'Ensaymada kls (Ensaymada kls   )', 'Kls', '95.59', '3632.42', '0.39%', '87.16', '3312.08', '0.39%', '2020-03-20 15:05:51'),
(2674, 3, 8, 1, 'Figue Pie Filling MIX (Figue Pie Filling MIX)', 'MX', '116.04', '2784.96', '0.30%', '97.96', '2351.04', '0.28%', '2020-03-20 15:05:51'),
(2675, 3, 8, 1, 'Figue Pie Kls (Figue Pie  )', 'Kls', '68.66', '3364.34', '0.36%', '65.4', '3204.6', '0.38%', '2020-03-20 15:05:51'),
(2676, 3, 8, 1, 'Fino pandesal Kls (Fino pandesal kls)', 'Kls', '75.92', '7592', '0.82%', '77.59', '7759', '0.92%', '2020-03-20 15:05:51'),
(2677, 3, 8, 1, 'French Bread plain-kls (French Bread plain-kls)', 'Kls', '72.12', '3317.52', '0.36%', '67.97', '3126.62', '0.37%', '2020-03-20 15:05:51'),
(2678, 3, 8, 1, 'Frenchbread W.wheat kls (Frenchbread W.wheat kls  )', 'Kls', '76.57', '3522.22', '0.38%', '70.64', '3249.44', '0.39%', '2020-03-20 15:05:51'),
(2679, 3, 8, 1, 'FruitJohn (3kls/MIX) (FruitJohn (3kls/MIX))', 'MX', '443.78', '266.27', '0.03%', '468.72', '281.23', '0.03%', '2020-03-20 15:05:51'),
(2680, 3, 8, 1, 'Marjorie filling MIX (Marjorie filling Kls)', 'MX', '220.4', '2682.27', '0.29%', '223.64', '2721.7', '0.32%', '2020-03-20 15:05:51'),
(2681, 3, 8, 1, 'Monay premix - kls (Monay premix - kls)', 'Kls', '70.22', '4704.74', '0.51%', '66.97', '4486.99', '0.53%', '2020-03-20 15:05:51'),
(2682, 3, 8, 1, 'Pilipit premix (Pilipit premix)', 'Kls', '70.93', '38940.57', '4.20%', '66.13', '36305.37', '4.32%', '2020-03-20 15:05:51'),
(2683, 3, 8, 1, 'Putok premix (Putok premix)', 'Kls', '76.64', '2644.08', '0.29%', '71.16', '2455.02', '0.29%', '2020-03-20 15:05:51'),
(2684, 3, 8, 1, 'Strussels- mix (Strussels Mix  )', 'MX', '179.93', '1259.51', '0.14%', '237.61', '1663.27', '0.20%', '2020-03-20 15:05:51'),
(2685, 3, 8, 1, 'Strussels MIX (Strussels MIX)', 'MX', '178.2', '0', '0.00%', '1.86', '0', '0.00%', '2020-03-20 15:05:51'),
(2686, 3, 8, 1, 'Sweetdough (Sweetdough   )', 'Kls', '71.84', '39152.8', '4.22%', '59.62', '32492.9', '3.87%', '2020-03-20 15:05:51'),
(2687, 3, 8, 1, 'Whole wheat premix (Whole wheat premix)', 'Kls', '63.11', '5869.23', '0.63%', '58.64', '5453.52', '0.65%', '2020-03-20 15:05:51'),
(2688, 3, 9, 1, 'Alaska Condensed Milk (Condensed Milk Alaska 300ml/can  )', 'Can', '55.08', '2144.26', '0.23%', '51.4', '2001', '0.24%', '2020-03-20 15:07:32'),
(2689, 3, 9, 1, 'All purpose Cream (All purpose Cream	250g X 24 pack  )', 'Pck', '49.39', '493.89', '0.05%', '43.46', '434.6', '0.05%', '2020-03-20 15:07:32'),
(2690, 3, 9, 1, 'All Purpose Flour (All Purpose Flour	25KG / sack  )', 'Grms', '0.04', '0', '0.00%', '0.04', '0', '0.00%', '2020-03-20 15:07:32'),
(2691, 3, 9, 1, 'Angel Condensed (Condensed angel)', 'Pck', '36.93', '553.88', '0.06%', '38', '570', '0.07%', '2020-03-20 15:07:32'),
(2692, 3, 9, 1, 'Baguette Flour (Baguette Flour 10kg/case  )', 'Grms', '0', '0', '0.00%', '0.24', '0', '0.00%', '2020-03-20 15:07:32'),
(2693, 3, 9, 1, 'Baking Powder (Baking Powder  )', 'Grms', '0.11', '204.2', '0.02%', '0.08', '145.6', '0.02%', '2020-03-20 15:07:32'),
(2694, 3, 9, 1, 'Baking Soda (Baking Soda  )', 'Grms', '0.04', '53.68', '0.01%', '0.35', '525', '0.06%', '2020-03-20 15:07:32'),
(2695, 3, 9, 1, 'Banana Fresh (Lakatan) (anana Fresh (Lakatan))', 'Kls', '34.54', '5764.92', '0.62%', '35', '5841.03', '0.70%', '2020-03-20 15:07:32'),
(2696, 3, 9, 1, 'Bread crumbs (Bread crumbs)', 'Grms', '0.05', '642.04', '0.07%', '0.05', '620', '0.07%', '2020-03-20 15:07:32'),
(2697, 3, 9, 1, 'Bread Improver (Bread Improver  )', 'Grms', '0.07', '0', '0.00%', '0.07', '0', '0.00%', '2020-03-20 15:07:32'),
(2698, 3, 9, 1, 'Brown Paper (Brown Paper 500pcs/bundle  )', 'ea', '0', '0', '0.00%', '2.66', '0', '0.00%', '2020-03-20 15:07:32'),
(2699, 3, 9, 1, 'Buko (Buko)', 'Kls', '120', '0', '0.00%', '240', '0', '0.00%', '2020-03-20 15:07:32'),
(2700, 3, 9, 1, 'Buko Meat (Buko Meat)', 'Grms', '0.12', '789.36', '0.09%', '0.12', '789.36', '0.09%', '2020-03-20 15:07:32'),
(2701, 3, 9, 1, 'Butter Oil Substitute(BOS) (Butter Oil Substitute (BOS)  )', 'Grms', '0.18', '422.76', '0.05%', '0.16', '381.12', '0.05%', '2020-03-20 15:07:32'),
(2702, 3, 9, 1, 'Butter Unsalted  20KG (Butter Unsalted  20KG/Case  )', 'Grms', '0', '0', '0.00%', '0.29', '0', '0.00%', '2020-03-20 15:07:32'),
(2703, 3, 9, 1, 'Butter Unsalted 10KG (Butter Unsalted 10KG/case  )', 'Grms', '0.2', '0', '0.00%', '0.33', '0', '0.00%', '2020-03-20 15:07:32'),
(2704, 3, 9, 1, 'Butter Unsalted 225g (Mag Gold Butter Unsalted 225g)', 'Bar', '90.53', '0', '0.00%', '94.3', '0', '0.00%', '2020-03-20 15:07:32'),
(2705, 3, 9, 1, 'Butter Unsalted 227g (Butter Unsalted 227g  )', 'Grms', '0', '0', '0.00%', '0.44', '0', '0.00%', '2020-03-20 15:07:32'),
(2706, 3, 9, 1, 'Buttercup 225g (Buttercup 225g/bar)', 'Bar', '40.54', '1378.21', '0.15%', '39.33333', '1337.33', '0.16%', '2020-03-20 15:07:32'),
(2707, 3, 9, 1, 'Cake Flour (Cake Flour 25KG/Sack  )', 'Grms', '0.04', '816', '0.09%', '0.04', '800', '0.10%', '2020-03-20 15:07:32'),
(2708, 3, 9, 1, 'Cheese Powder 50g (Cheese Powder 50)', 'Pck', '20.27', '0', '0.00%', '26.5', '0', '0.00%', '2020-03-20 15:07:32'),
(2709, 3, 9, 1, 'Cherry with stem (Cherry with stem)', 'ea', '2.72', '48.96', '0.01%', '2.72', '48.96', '0.01%', '2020-03-20 15:07:32'),
(2710, 3, 9, 1, 'Choco Fudge (Choco fudge for pound cake)', 'Grms', '0.24', '0', '0.00%', '0.239', '0', '0.00%', '2020-03-20 15:07:32'),
(2711, 3, 9, 1, 'Chocolate Glazed (Chocolate Glazed 5000/pail  )', 'Grms', '0.31', '18815.15', '2.03%', '0.30464', '18765.82', '2.23%', '2020-03-20 15:07:32'),
(2712, 3, 9, 1, 'Chocolate Sprinkles/ Vermicilli (Chocolate Sprinkles/ Vermicilli  )', 'Grms', '0.35', '1907.5', '0.21%', '0.35', '1907.5', '0.23%', '2020-03-20 15:07:32'),
(2713, 3, 9, 1, 'Cinnamon Powder 1KG (Cinnamon Powder 1KG/Pack  )', 'Grms', '0.33', '264.02', '0.03%', '0.28', '224.84', '0.03%', '2020-03-20 15:07:32'),
(2714, 3, 9, 1, 'Cinnamon Powder 500g (Cinnamon Powder 500g/pack  )', 'Grms', '0.25', '0', '0.00%', '0.25', '0', '0.00%', '2020-03-20 15:07:32'),
(2715, 3, 9, 1, 'Cocoa (Cocoa  )', 'Grms', '0.31', '1612.64', '0.17%', '0.28', '1456', '0.17%', '2020-03-20 15:07:32'),
(2716, 3, 9, 1, 'Corn Oil (Corn Oil  )', 'ML', '0', '0', '0.00%', '1.95', '0', '0.00%', '2020-03-20 15:07:32'),
(2717, 3, 9, 1, 'Corn Oil pack (Corn Oil pack)', 'Pck', '61.8', '0', '0.00%', '61.8', '0', '0.00%', '2020-03-20 15:07:32'),
(2718, 3, 9, 1, 'Cornstarch (Cornstarch  )', 'Grms', '0.02', '41.64', '0.00%', '0.03', '55.23', '0.01%', '2020-03-20 15:07:32'),
(2719, 3, 9, 1, 'Cracked oats (Cracked oats)', 'Grms', '0.11', '30.46', '0.00%', '0.09', '24.3', '0.00%', '2020-03-20 15:07:32'),
(2720, 3, 9, 1, 'Cream Cheese 1.361KG (Cream Cheese 1.361KG  )', 'Grms', '0.36', '0', '0.00%', '0.36', '0', '0.00%', '2020-03-20 15:07:32'),
(2721, 3, 9, 1, 'Cream Cheese 1KG (Cream Cheese 1KG  )', 'Grms', '0.42', '0.01', '0.00%', '0.39', '0', '0.00%', '2020-03-20 15:07:32'),
(2722, 3, 9, 1, 'Cream of Tartar (Cream of Tartar)', 'Grms', '0.29', '304.16', '0.03%', '0.37', '394.05', '0.05%', '2020-03-20 15:07:32'),
(2723, 3, 9, 1, 'Creamfill Vanilla (Creamfill Vanilla 5kls/Pail  )', 'Grms', '0.17', '17303.89', '1.86%', '0.177', '17523', '2.09%', '2020-03-20 15:07:32'),
(2724, 3, 9, 1, 'Dahon Saging (Dahon Saging)', 'Grms', '25', '70000', '7.54%', '0.03', '84', '0.01%', '2020-03-20 15:07:32'),
(2725, 3, 9, 1, 'Danes Cheese 450g (Danes Cheese 450g)', 'Bar', '120', '0', '0.00%', '120', '0', '0.00%', '2020-03-20 15:07:32'),
(2726, 3, 9, 1, 'Demi Glace (Demi Glace  )', 'Grms', '0.51', '0', '0.00%', '0.45', '0', '0.00%', '2020-03-20 15:07:32'),
(2727, 3, 9, 1, 'Dessicated Coconut (Dessicated Coconut  )', 'Grms', '0.15', '740.51', '0.08%', '0.12', '580.8', '0.07%', '2020-03-20 15:07:32'),
(2728, 3, 9, 1, 'DM Extra Ketchup 320g (DM Extra Ketchup 320g)', 'gal', '43.77', '0', '0.00%', '43.6', '0', '0.00%', '2020-03-20 15:07:32'),
(2729, 3, 9, 1, 'DM Pineapple crushed (227gm) (DM Pineapple crushed (227gm))', 'Can', '25.04', '100.14', '0.01%', '22.56', '90.24', '0.01%', '2020-03-20 15:07:32'),
(2730, 3, 9, 1, 'Dole Pineapple Crashed (Dole Pineapple Crashed  439g/can    )', 'Can', '23.7', '0', '0.00%', '41.3', '0', '0.00%', '2020-03-20 15:07:32'),
(2731, 3, 9, 1, 'Dole Pineapple crushed (Dole Pineapple crushed  567g / can    )', 'Can', '51.2', '0', '0.00%', '51.2', '0', '0.00%', '2020-03-20 15:07:32'),
(2732, 3, 9, 1, 'Eden Filled Cheese 440g (Eden Filled Cheese 440g)', 'Bar', '127.05', '1270.5', '0.14%', '114.29', '1142.9', '0.14%', '2020-03-20 15:07:32'),
(2733, 3, 9, 1, 'Eden Queso De Bola 440g (Eden Queso De Bola 440g)', 'Bar', '155.55', '4510.95', '0.49%', '155.55', '4510.95', '0.54%', '2020-03-20 15:07:32'),
(2734, 3, 9, 1, 'Egg Yellow coloring (Egg Yellow coloring  )', 'Grms', '0.16', '88.13', '0.01%', '0.16', '86.4', '0.01%', '2020-03-20 15:07:32'),
(2735, 3, 9, 1, 'Eggs (Eggs)', 'ea', '5.7', '44531.86', '4.80%', '4.83', '37741.62', '4.49%', '2020-03-20 15:07:32'),
(2736, 3, 9, 1, 'El Rancho Spiced Ham (El rancho spiced Ham  )', 'Grms', '0.18', '0', '0.00%', '0.16', '0', '0.00%', '2020-03-20 15:07:32'),
(2737, 3, 9, 1, 'Evaporated Milk 370ml (Evaporated Milk 370ml)', 'Can', '36.05', '0', '0.00%', '36.05', '0', '0.00%', '2020-03-20 15:07:32'),
(2738, 3, 9, 1, 'Filled Cheese (Filled Cheese  )', 'Grms', '0.24', '40536.05', '4.37%', '0.23', '38531.21', '4.59%', '2020-03-20 15:07:32'),
(2739, 3, 9, 1, 'Filled Cheese (case) (Filled Cheese (case))', 'cs', '2575.75', '0', '0.00%', '2575.75', '0', '0.00%', '2020-03-20 15:07:32'),
(2740, 3, 9, 1, 'First Class flour (First Class flour)', 'Grms', '0.03', '3668.9', '0.40%', '0.03', '3300', '0.39%', '2020-03-20 15:07:32'),
(2741, 3, 9, 1, 'Fresh Milk- Conaprole (Fresh Milk- Conaprole  )', 'Pck', '58', '5592.36', '0.60%', '58', '5592.36', '0.67%', '2020-03-20 15:07:32'),
(2742, 3, 9, 1, 'FreshMilk Anchor 12s (FreshMilk Anchor 12s)', 'ea', '58', '0', '0.00%', '65', '0', '0.00%', '2020-03-20 15:07:32'),
(2743, 3, 9, 1, 'Freshmilk Pauls (Freshmilk Pauls)', 'Pck', '55', '0', '0.00%', '55', '0', '0.00%', '2020-03-20 15:07:32'),
(2744, 3, 9, 1, 'FreshMilk Pauls Milk (FreshMilk Pauls Milk 1 liter 12s)', 'cs', '135.2', '0', '0.00%', '718.8', '0', '0.00%', '2020-03-20 15:07:32'),
(2745, 3, 9, 1, 'Glaze Fruit (Glaze Fruit 5kls/Pail  )', 'Grms', '0', '0', '0.00%', '0.06', '0', '0.00%', '2020-03-20 15:07:32'),
(2746, 3, 9, 1, 'Glucose (Glucose)', 'Kls', '65', '0', '0.00%', '65', '0', '0.00%', '2020-03-20 15:07:32'),
(2747, 3, 9, 1, 'Glycerine (Glycerine)', 'Kls', '250', '0', '0.00%', '250', '0', '0.00%', '2020-03-20 15:07:32'),
(2748, 3, 9, 1, 'Hotdog Champion (Hotdog Champion  )', 'Grms', '0.09', '0', '0.00%', '0.09', '0', '0.00%', '2020-03-20 15:07:32'),
(2749, 3, 9, 1, 'Icing (Icing)', 'Kls', '0.23', '562.5', '0.06%', '0.22', '550', '0.07%', '2020-03-20 15:07:32'),
(2750, 3, 9, 1, 'Macapuno (Macapuno Meat)', 'Grms', '0.2', '5600.05', '0.60%', '0.19', '5320', '0.63%', '2020-03-20 15:07:32'),
(2751, 3, 9, 1, 'Magnolia Cheese Reg. 950g/900g (Magnolia Cheese Reg. 950g/900g)', 'Pck', '248.2', '2482', '0.27%', '248.2', '2482', '0.30%', '2020-03-20 15:07:32'),
(2752, 3, 9, 1, 'Mango Puree (Mango Puree  )', 'Grms', '0', '0', '0.00%', '0.13', '0', '0.00%', '2020-03-20 15:07:32'),
(2753, 3, 9, 1, 'Margarine (Margarine   )', 'Grms', '0.08', '440.63', '0.05%', '0.1', '540', '0.06%', '2020-03-20 15:07:32'),
(2754, 3, 9, 1, 'Mayonnaise (Mayonnaise 5kls/Pail  )', 'Grms', '0.12', '1334.61', '0.14%', '0.11707', '1334.6', '0.16%', '2020-03-20 15:07:32'),
(2755, 3, 9, 1, 'Micram (Micram  )', 'Grms', '0', '0', '0.00%', '0.22', '0', '0.00%', '2020-03-20 15:07:32'),
(2756, 3, 9, 1, 'Molasses (Molasses)', 'ML', '0.08', '225.94', '0.02%', '0.07', '210', '0.03%', '2020-03-20 15:07:32'),
(2757, 3, 9, 1, 'Novellino 750ml (Novellino 750ml)', 'Bot', '259', '69.93', '0.01%', '259', '69.93', '0.01%', '2020-03-20 15:07:32'),
(2758, 3, 9, 1, 'Orange Coloring (Orange Coloring 25/PACK  )', 'Grms', '1.29', '0', '0.00%', '1.29', '0', '0.00%', '2020-03-20 15:07:32'),
(2759, 3, 9, 1, 'Palm Oil (Palm Oil)', 'Kls', '44', '0', '0.00%', '44', '0', '0.00%', '2020-03-20 15:07:32'),
(2760, 3, 9, 1, 'Peanut (Peanut  )', 'Grms', '0.09', '1113.82', '0.12%', '0.11', '1430', '0.17%', '2020-03-20 15:07:32'),
(2761, 3, 9, 1, 'Pineapple Crushed (Pineapple Crushed 567g    )', 'Can', '24.55', '0', '0.00%', '51.2', '0', '0.00%', '2020-03-20 15:07:32'),
(2762, 3, 9, 1, 'Powdered Milk (Powdered Milk  )', 'Grms', '0.12', '0', '0.00%', '0.11', '0', '0.00%', '2020-03-20 15:07:32'),
(2763, 3, 9, 1, 'Quaker Instant Oats 800g (Quaker Instant Oats 800g)', 'Pck', '97.81', '0', '0.00%', '98.7', '0', '0.00%', '2020-03-20 15:07:32'),
(2764, 3, 9, 1, 'Raisin 10kg (Raisin 10kg  )', 'Grms', '0.09', '0', '0.00%', '0.08', '0', '0.00%', '2020-03-20 15:07:32'),
(2765, 3, 9, 1, 'Raisin 9kg (Raisin 9kg  )', 'Grms', '0', '0', '0.00%', '0.12', '0', '0.00%', '2020-03-20 15:07:32'),
(2766, 3, 9, 1, 'Ram Oats 500g (Ram Oats 500g)', 'Pck', '52.49', '262.47', '0.03%', '52.5', '262.5', '0.03%', '2020-03-20 15:07:32'),
(2767, 3, 9, 1, 'Red Ruby Cherry (Red Ruby Cherry)', 'Grms', '0.25', '0', '0.00%', '0.32', '0', '0.00%', '2020-03-20 15:07:32'),
(2768, 3, 9, 1, 'Rock Salt (Rock Salt)', 'Grms', '0.03', '174.27', '0.02%', '0.03417', '170.85', '0.02%', '2020-03-20 15:07:32'),
(2769, 3, 9, 1, 'Rye Flour (Rye Flour  )', 'Grms', '0.3', '384.53', '0.04%', '0.26', '338', '0.04%', '2020-03-20 15:07:32'),
(2770, 3, 9, 1, 'Semi-sweet chocolate (Semi-sweet chocolate)', 'Grms', '0.24', '225.21', '0.02%', '0.34', '312.8', '0.04%', '2020-03-20 15:07:32'),
(2771, 3, 9, 1, 'Sesame Seeds (Sesame Seeds  )', 'Grms', '0.16', '375.36', '0.04%', '0.18', '414', '0.05%', '2020-03-20 15:07:32'),
(2772, 3, 9, 1, 'Shortening (Shortening  )', 'Grms', '0.09', '87.42', '0.01%', '0.12', '120', '0.01%', '2020-03-20 15:07:32'),
(2773, 3, 9, 1, 'Sugar Brown (Sugar Brown  )', 'Grms', '0.04', '739.54', '0.08%', '0.04', '774.12', '0.09%', '2020-03-20 15:07:32'),
(2774, 3, 9, 1, 'Sugar White (Sugar White  )', 'Grms', '0.08', '11554.97', '1.25%', '0.05', '7509.7', '0.89%', '2020-03-20 15:07:32'),
(2775, 3, 9, 1, 'Super Syrup (Super Syrup  )', 'Grms', '0.07', '7183.32', '0.77%', '0.075', '7500', '0.89%', '2020-03-20 15:07:32'),
(2776, 3, 9, 1, 'Sweet Ube Jam 1kg (Sweet Ube Jam 1kg  )', 'Grms', '0.13', '0', '0.00%', '0.12895', '0', '0.00%', '2020-03-20 15:07:32'),
(2777, 3, 9, 1, 'Tanduay Rhum 1000ml (Tanduay Rhum 1000ml  )', 'Bot', '102.46', '0', '0.00%', '102.45', '0', '0.00%', '2020-03-20 15:07:32'),
(2778, 3, 9, 1, 'Tanduay Rhum 750ml (Tanduay Rhum 750ml  )', 'Bot', '83', '0', '0.00%', '81', '0', '0.00%', '2020-03-20 15:07:32'),
(2779, 3, 9, 1, 'Third Class flour (Third Class flour  )', 'Grms', '0.03', '6.6', '0.00%', '0.03', '6.6', '0.00%', '2020-03-20 15:07:32'),
(2780, 3, 9, 1, 'Tita My Patis 345ml (Tita My Patis 345ml)', 'ML', '17.85', '0', '0.00%', '17.85', '0', '0.00%', '2020-03-20 15:07:32'),
(2781, 3, 9, 1, 'Ube Flavocol (Ube Flavocol  )', 'ML', '0.45', '0', '0.00%', '0.45', '0', '0.00%', '2020-03-20 15:07:32'),
(2782, 3, 9, 1, 'Ube Paste (Ube Paste  )', 'Grms', '0.11', '1593.19', '0.17%', '0.11', '1562', '0.19%', '2020-03-20 15:07:32'),
(2783, 3, 9, 1, 'Vanilla (Vanilla 3785ml/gal      )', 'ML', '0.03', '125.29', '0.01%', '0.03', '114', '0.01%', '2020-03-20 15:07:32'),
(2784, 3, 9, 1, 'Vegetable Oil (Vegetable Oil  )', 'ML', '0.06', '19770.39', '2.13%', '0.05775', '19894.88', '2.37%', '2020-03-20 15:07:32'),
(2785, 3, 9, 1, 'Virgies Wild Honey (Virgies Wild Honey (325ml/bot))', 'Bot', '103.5', '0', '0.00%', '103.5', '0', '0.00%', '2020-03-20 15:07:32'),
(2786, 3, 9, 1, 'Virginia Honeycorn Bacon 400g (Virginia Honeycorn Bacon 400g)', 'Pck', '235', '0', '0.00%', '235', '0', '0.00%', '2020-03-20 15:07:32'),
(2787, 3, 9, 1, 'Virginia Honeycure Bacon (Virginia Honeycure Bacon  )', 'Grms', '0.49', '0', '0.00%', '0.52', '0', '0.00%', '2020-03-20 15:07:32'),
(2788, 3, 9, 1, 'Whipping Cream (Whipping Cream (5pailsx4.5kl/pail)  )', 'Grms', '0.21', '27504.56', '2.96%', '0.20889', '27469.04', '3.27%', '2020-03-20 15:07:32'),
(2789, 3, 9, 1, 'Whole Wheat Flour (Whole Wheat Flour  )', 'Grms', '0.05', '234.6', '0.03%', '0.05', '230', '0.03%', '2020-03-20 15:07:32'),
(2790, 3, 9, 1, 'Yeast (Yeast  )', 'Grms', '0.21', '7197.13', '0.78%', '0.18', '6048', '0.72%', '2020-03-20 15:07:32'),
(2791, 3, 10, 1, 'Assorted Cookies (Assorted Cookies  )', 'ea', '3.54', '0', '0.00%', '3.54', '0', '0.00%', '2020-03-20 15:09:24'),
(2792, 3, 10, 1, 'Bacon Bread (Bacon Bread  )', 'ea', '23.73', '23.73', '0.00%', '23.73', '23.73', '0.00%', '2020-03-20 15:09:24'),
(2793, 3, 10, 1, 'Bagels (Bagels  )', 'ea', '0', '0', '0.00%', '3.34', '0', '0.00%', '2020-03-20 15:09:24'),
(2794, 3, 10, 1, 'Banana Ketchup Mafran (Banana Ketchup Mafran 3785/Gallon    )', 'Grms', '0.02', '151.5', '0.02%', '0.021', '158.97', '0.02%', '2020-03-20 15:09:24'),
(2795, 3, 10, 1, 'Banana Ketchup Mommy (Banana Ketchup Mommy)', 'gal', '63.85', '0', '0.00%', '82.4', '0', '0.00%', '2020-03-20 15:09:24'),
(2796, 3, 10, 1, 'Banana Ketchup Tita Frita (Banana Ketchup Tita Frita 3785/Gal    )', 'Grms', '0.02', '0', '0.00%', '0.02', '0', '0.00%', '2020-03-20 15:09:24'),
(2797, 3, 10, 1, 'Banana Muffins (Banana Muffins  )', 'ea', '4.91', '638.3', '0.07%', '8', '1040', '0.12%', '2020-03-20 15:09:24'),
(2798, 3, 10, 1, 'Bavarian loaf (Bavarian loaf  )', 'ea', '0', '0', '0.00%', '21.61', '0', '0.00%', '2020-03-20 15:09:24'),
(2799, 3, 10, 1, 'Big Bibingka (Big Bibingka  )', 'ea', '15.69', '0', '0.00%', '15.69', '0', '0.00%', '2020-03-20 15:09:24'),
(2800, 3, 10, 1, 'Binangkal (Binangkal  )', 'ea', '7', '777', '0.08%', '3.09', '342.99', '0.04%', '2020-03-20 15:09:24'),
(2801, 3, 10, 1, 'Biscocho (Biscocho)', 'ea', '3.81', '0', '0.00%', '3.81', '0', '0.00%', '2020-03-20 15:09:24'),
(2802, 3, 10, 1, 'Brownies (Brownies  )', 'ea', '10.2', '0', '0.00%', '10.2', '0', '0.00%', '2020-03-20 15:09:24'),
(2803, 3, 10, 1, 'Buko Bibingka (Buko Bibingka  )', 'ea', '13.08', '169.98', '0.02%', '20', '260', '0.03%', '2020-03-20 15:09:24'),
(2804, 3, 10, 1, 'Burger Buns (6pcs) (Burger Buns (6pcs))', 'Pck', '18.42', '0', '0.00%', '18.42', '0', '0.00%', '2020-03-20 15:09:24'),
(2805, 3, 10, 1, 'Butter Macaroons (Butter Macaroons  )', 'ea', '3.69', '0', '0.00%', '3.69', '0', '0.00%', '2020-03-20 15:09:24'),
(2806, 3, 10, 1, 'Cheese bread (Cheese bread  )', 'ea', '4.28', '38.52', '0.00%', '4.28', '38.52', '0.01%', '2020-03-20 15:09:24'),
(2807, 3, 10, 1, 'Cheese Cake (Cheese Cake  )', 'ea', '8.49', '0', '0.00%', '8.49', '0', '0.00%', '2020-03-20 15:09:24'),
(2808, 3, 10, 1, 'Cheese cross buns (Cheese cross buns  )', 'ea', '20.35', '0', '0.00%', '20.35', '0', '0.00%', '2020-03-20 15:09:24'),
(2809, 3, 10, 1, 'Cheese Monay (Cheese Monay  )', 'ea', '2.46', '0', '0.00%', '2.46', '0', '0.00%', '2020-03-20 15:09:24'),
(2810, 3, 10, 1, 'Cheeseloaf (Cheeseloaf  )', 'ea', '45.13', '315.91', '0.03%', '31.65', '221.55', '0.03%', '2020-03-20 15:09:24'),
(2811, 3, 10, 1, 'Chiffon Cake Large (Chiffon Cake Large  )', 'ea', '109.71', '219.42', '0.02%', '109.71', '219.42', '0.03%', '2020-03-20 15:09:24'),
(2812, 3, 10, 1, 'Chiffon Cake Mini (Chiffon Cake Mini  )', 'ea', '14.87', '14.87', '0.00%', '14.87', '14.87', '0.00%', '2020-03-20 15:09:24'),
(2813, 3, 10, 1, 'Chiffon Cake Small (Chiffon Cake Small  )', 'ea', '67.54', '337.7', '0.04%', '67.54', '337.7', '0.04%', '2020-03-20 15:09:24'),
(2814, 3, 10, 1, 'Chiffon XSmall (Chiffon XSmall)', 'ea', '30.53', '0', '0.00%', '30.53', '0', '0.00%', '2020-03-20 15:09:24'),
(2815, 3, 10, 1, 'Chinese Hopia (Chinese Hopia  )', 'ea', '4.18', '50.16', '0.01%', '4.18', '50.16', '0.01%', '2020-03-20 15:09:24'),
(2816, 3, 10, 1, 'Choco bread (Choco bread  )', 'ea', '6.62', '13.24', '0.00%', '6.62', '13.24', '0.00%', '2020-03-20 15:09:24'),
(2817, 3, 10, 1, 'Choco Crinkles (Choco Crinkles  )', 'ea', '6.35', '6.35', '0.00%', '6.35', '6.35', '0.00%', '2020-03-20 15:09:24'),
(2818, 3, 10, 1, 'Choco flowing (Choco flowing  )', 'ea', '2.74', '0', '0.00%', '2.74', '0', '0.00%', '2020-03-20 15:09:24'),
(2819, 3, 10, 1, 'Choco Ganache Base (Choco Ganache Base  )', 'ea', '0', '0', '0.00%', '11.89', '0', '0.00%', '2020-03-20 15:09:24'),
(2820, 3, 10, 1, 'Choco Lanay Packed (Choco Lanay Packed)', 'Pck', '29.32', '87.96', '0.01%', '29.32', '87.96', '0.01%', '2020-03-20 15:09:24'),
(2821, 3, 10, 1, 'Choco loaf (Choco loaf  )', 'ea', '18.02', '0', '0.00%', '18.02', '0', '0.00%', '2020-03-20 15:09:24'),
(2822, 3, 10, 1, 'Choco Muffins (Choco Muffins  )', 'ea', '0', '0', '0.00%', '7.15', '0', '0.00%', '2020-03-20 15:09:24'),
(2823, 3, 10, 1, 'Choco twirl (Choco twirl  )', 'ea', '5.05', '10.1', '0.00%', '5.05', '10.1', '0.00%', '2020-03-20 15:09:24'),
(2824, 3, 10, 1, 'ChocoMoist Cake (ChocoMoist Cake  )', 'ea', '23.5', '0', '0.00%', '23.5', '0', '0.00%', '2020-03-20 15:09:24'),
(2825, 3, 10, 1, 'Ciabatta (Ciabatta  )', 'ea', '0', '0', '0.00%', '12', '0', '0.00%', '2020-03-20 15:09:24'),
(2826, 3, 10, 1, 'Cinnamon loaf (Cinnamon loaf  )', 'ea', '16.35', '32.7', '0.00%', '16.35', '32.7', '0.00%', '2020-03-20 15:09:24'),
(2827, 3, 10, 1, 'Cinnamon slice (Cinnamon slice  )', 'ea', '7.68', '122.88', '0.01%', '7.68', '122.88', '0.02%', '2020-03-20 15:09:24'),
(2828, 3, 10, 1, 'Cinnamon syrup (Cinnamon syrup  )', 'ea', '7.45', '81.95', '0.01%', '7.45', '81.95', '0.01%', '2020-03-20 15:09:24'),
(2829, 3, 10, 1, 'Coco bread (Coco bread  )', 'ea', '4.74', '28.44', '0.00%', '4.74', '28.44', '0.00%', '2020-03-20 15:09:24'),
(2830, 3, 10, 1, 'Communion Bread (Communion Bread  )', 'ea', '14.98', '3804.92', '0.41%', '14.98', '3804.92', '0.45%', '2020-03-20 15:09:24'),
(2831, 3, 10, 1, 'Cookies & Cream Chilled (Cookies & Cream Chilled  )', 'ea', '18', '0', '0.00%', '18', '0', '0.00%', '2020-03-20 15:09:24'),
(2832, 3, 10, 1, 'Cookies and Cream (Cookies and Cream  )', 'ea', '45.78', '0', '0.00%', '45.78', '0', '0.00%', '2020-03-20 15:09:24'),
(2833, 3, 10, 1, 'Cracked w.wheat (Cracked w.wheat  )', 'ea', '15.95', '15.95', '0.00%', '15.95', '15.95', '0.00%', '2020-03-20 15:09:24'),
(2834, 3, 10, 1, 'Cream Bread Jumbo (Cream Bread Jumbo  )', 'ea', '38.69', '3907.21', '0.42%', '37.29', '3766.29', '0.45%', '2020-03-20 15:09:24'),
(2835, 3, 10, 1, 'Cream Bread Large (Cream Bread Large  )', 'ea', '27.02', '3350.48', '0.36%', '27.02', '3350.48', '0.40%', '2020-03-20 15:09:24'),
(2836, 3, 10, 1, 'Croissant (Croissant    )', 'ea', '0', '0', '0.00%', '7.52', '0', '0.00%', '2020-03-20 15:09:24'),
(2837, 3, 10, 1, 'Crotons (Crotons)', 'Pck', '21.3', '0', '0.00%', '21.3', '0', '0.00%', '2020-03-20 15:09:24'),
(2838, 3, 10, 1, 'Custard Cake (Custard Cake  )', 'ea', '18', '0', '0.00%', '18', '0', '0.00%', '2020-03-20 15:09:24'),
(2839, 3, 10, 1, 'Dark Rye Oats (Dark Rye Oats  )', 'ea', '0', '0', '0.00%', '23.94', '0', '0.00%', '2020-03-20 15:09:24'),
(2840, 3, 10, 1, 'Dinner Roll (Dinner Roll)', 'ea', '19.68', '0', '0.00%', '19.68', '0', '0.00%', '2020-03-20 15:09:24'),
(2841, 3, 10, 1, 'Donut (Donut  )', 'ea', '3.69', '0', '0.00%', '3.69', '0', '0.00%', '2020-03-20 15:09:24'),
(2842, 3, 10, 1, 'Donut with filling- small (Donut with filling- small)', 'ea', '11.22', '22.44', '0.00%', '11.22', '22.44', '0.00%', '2020-03-20 15:09:24'),
(2843, 3, 10, 1, 'Double Body Plain (Double Body Plain  )', 'ea', '7.02', '259.74', '0.03%', '7.02', '259.74', '0.03%', '2020-03-20 15:09:24'),
(2844, 3, 10, 1, 'Double Body Ube (Double Body Ube  )', 'ea', '7.77', '46.62', '0.01%', '7.77', '46.62', '0.01%', '2020-03-20 15:09:24'),
(2845, 3, 10, 1, 'Dummy Cake 12x12 (Dummy Cake 12x12)', 'ea', '237.26', '0', '0.00%', '237.26', '0', '0.00%', '2020-03-20 15:09:24'),
(2846, 3, 10, 1, 'Dummy Cake 12x16 (Dummy Cake 12x16)', 'ea', '339.74', '0', '0.00%', '339.74', '0', '0.00%', '2020-03-20 15:09:24'),
(2847, 3, 10, 1, 'Dummy Cake 8x12 (Dummy Cake 8x12)', 'ea', '185.82', '0', '0.00%', '185.82', '0', '0.00%', '2020-03-20 15:09:24'),
(2848, 3, 10, 1, 'Durian Chilled (Durian Chilled  )', 'ea', '23.84', '2264.8', '0.24%', '20', '1900', '0.23%', '2020-03-20 15:09:24'),
(2849, 3, 10, 1, 'Durian Chocolate (Durian Chocolate  )', 'ea', '58.38', '233.52', '0.03%', '58.38', '233.52', '0.03%', '2020-03-20 15:09:24'),
(2850, 3, 10, 1, 'Dutch WWM (Dutch WWM  )', 'ea', '20.09', '20.09', '0.00%', '20.09', '20.09', '0.00%', '2020-03-20 15:09:24'),
(2851, 3, 10, 1, 'Egg Cracker (Egg Cracker)', 'ea', '16.09', '0', '0.00%', '16.09', '0', '0.00%', '2020-03-20 15:09:24'),
(2852, 3, 10, 1, 'Egg Pandesal (Egg Pandesal)', 'ea', '1.82', '0', '0.00%', '1.82', '0', '0.00%', '2020-03-20 15:09:24'),
(2853, 3, 10, 1, 'Ensaymada big (Ensaymada big  )', 'ea', '0', '0', '0.00%', '22.03', '0', '0.00%', '2020-03-20 15:09:24'),
(2854, 3, 10, 1, 'Ensaymada small (Ensaymada small  )', 'ea', '6.48', '116.64', '0.01%', '6.48', '116.64', '0.01%', '2020-03-20 15:09:24'),
(2855, 3, 10, 1, 'Euro Desal (Euro Desal  )', 'ea', '1.74', '0', '0.00%', '1.74', '0', '0.00%', '2020-03-20 15:09:24'),
(2856, 3, 10, 1, 'Euro loaf (Euro loaf  )', 'ea', '29.37', '0', '0.00%', '29.37', '0', '0.00%', '2020-03-20 15:09:24'),
(2857, 3, 10, 1, 'Figue Pie (Figue Pie  )', 'ea', '3.77', '124.41', '0.01%', '3.77', '124.41', '0.02%', '2020-03-20 15:09:24'),
(2858, 3, 10, 1, 'Fino (Fino  )', 'ea', '1.54', '6.16', '0.00%', '1.54', '6.16', '0.00%', '2020-03-20 15:09:24'),
(2859, 3, 10, 1, 'Food For the Gods (Food For the Gods  )', 'ea', '0', '0', '0.00%', '9.17', '0', '0.00%', '2020-03-20 15:09:24'),
(2860, 3, 10, 1, 'Frances big (Frances big  )', 'ea', '0', '0', '0.00%', '21.26', '0', '0.00%', '2020-03-20 15:09:24'),
(2861, 3, 10, 1, 'Frances small (Frances small  )', 'ea', '0', '0', '0.00%', '6.52', '0', '0.00%', '2020-03-20 15:09:24'),
(2862, 3, 10, 1, 'French Bread Plain Large (French Bread Plain Large  )', 'ea', '16.83', '370.26', '0.04%', '16.83', '370.26', '0.04%', '2020-03-20 15:09:24'),
(2863, 3, 10, 1, 'French Bread WW Large (French Bread WW Large  )', 'ea', '16.81', '336.2', '0.04%', '16.81', '336.2', '0.04%', '2020-03-20 15:09:24'),
(2864, 3, 10, 1, 'French Roast (French Roast)', 'ea', '40', '0', '0.00%', '40', '0', '0.00%', '2020-03-20 15:09:24'),
(2865, 3, 10, 1, 'Fruit John (Fruit John  )', 'ea', '19.13', '19.13', '0.00%', '19.13', '19.13', '0.00%', '2020-03-20 15:09:24'),
(2866, 3, 10, 1, 'Fruit Shake (Fruit Shake)', 'ea', '12', '0', '0.00%', '20', '0', '0.00%', '2020-03-20 15:09:24'),
(2867, 3, 10, 1, 'Fruitty Muffins (Fruitty Muffins  )', 'ea', '0', '0', '0.00%', '6', '0', '0.00%', '2020-03-20 15:09:24'),
(2868, 3, 10, 1, 'Fry Stick Bread Plain (Fry Stick Bread Plain  )', 'ea', '10.06', '0', '0.00%', '10.06', '0', '0.00%', '2020-03-20 15:09:24'),
(2869, 3, 10, 1, 'Fry Stick Bread w/ Cheese (Fry Stick Bread w/ Cheese  )', 'ea', '10.37', '0', '0.00%', '10.37', '0', '0.00%', '2020-03-20 15:09:24'),
(2870, 3, 10, 1, 'Garlic Bread (Garlic Bread)', 'ea', '45.83', '0', '0.00%', '45.83', '0', '0.00%', '2020-03-20 15:09:24'),
(2871, 3, 10, 1, 'Garlic Mint (Garlic Mint  )', 'ea', '0', '0', '0.00%', '3.76', '0', '0.00%', '2020-03-20 15:09:24'),
(2872, 3, 10, 1, 'Garlic slice bread (Garlic slice bread  )', 'ea', '4.65', '106.95', '0.01%', '4.65', '106.95', '0.01%', '2020-03-20 15:09:24'),
(2873, 3, 10, 1, 'Garlic Stick Tumbler (Garlic Stick Tumbler)', 'Tumbler', '45.82', '504.02', '0.05%', '45.82', '504.02', '0.06%', '2020-03-20 15:09:24'),
(2874, 3, 10, 1, 'Ham & egg (Ham & egg  )', 'ea', '5.35', '5.35', '0.00%', '5.35', '5.35', '0.00%', '2020-03-20 15:09:24'),
(2875, 3, 10, 1, 'Ham roll (Ham roll  )', 'ea', '0', '0', '0.00%', '6.14', '0', '0.00%', '2020-03-20 15:09:24'),
(2876, 3, 10, 1, 'Hawaiian upside (Hawaiian upside  )', 'ea', '33.49', '100.47', '0.01%', '33.49', '100.47', '0.01%', '2020-03-20 15:09:24'),
(2877, 3, 10, 1, 'Hopia Mongo (Hopia Mongo  )', 'ea', '1.69', '0', '0.00%', '1.69', '0', '0.00%', '2020-03-20 15:09:24'),
(2878, 3, 10, 1, 'Hopia Ube (Hopia UBE)', 'ea', '1.69', '0', '0.00%', '1.69', '0', '0.00%', '2020-03-20 15:09:24'),
(2879, 3, 10, 1, 'Hotdog delight (Hotdog delight  )', 'ea', '0', '0', '0.00%', '4.09', '0', '0.00%', '2020-03-20 15:09:24'),
(2880, 3, 10, 1, 'Jelly Roll (Jelly Roll  )', 'ea', '109.84', '0', '0.00%', '109.84', '0', '0.00%', '2020-03-20 15:09:24'),
(2881, 3, 10, 1, 'Kaizer buns -big (Kaizer buns -big  )', 'ea', '10.82', '0', '0.00%', '10.14', '0', '0.00%', '2020-03-20 15:09:24'),
(2882, 3, 10, 1, 'Lengua Big (Lengua Big)', 'ea', '56.53', '0', '0.00%', '56.53', '0', '0.00%', '2020-03-20 15:09:24'),
(2883, 3, 10, 1, 'Lengua de Gato (Lengua de Gato)', 'ea', '30.6', '183.57', '0.02%', '60', '360', '0.04%', '2020-03-20 15:09:24'),
(2884, 3, 10, 1, 'Long Pandesal (Long Pandesal  )', 'ea', '2.92', '5.84', '0.00%', '2.92', '5.84', '0.00%', '2020-03-20 15:09:24'),
(2885, 3, 10, 1, 'Macapuno bread (Macapuno bread  )', 'ea', '7.17', '7.17', '0.00%', '7.17', '7.17', '0.00%', '2020-03-20 15:09:24'),
(2886, 3, 10, 1, 'Macapuno Loaf (Macapuno Loaf  )', 'ea', '22.27', '0', '0.00%', '22.27', '0', '0.00%', '2020-03-20 15:09:24'),
(2887, 3, 10, 1, 'Mango Chilled (Mango Chilled  )', 'ea', '18', '0', '0.00%', '18', '0', '0.00%', '2020-03-20 15:09:24'),
(2888, 3, 10, 1, 'Marjorie loaf (Marjorie loaf  )', 'ea', '0', '0', '0.00%', '21.89', '0', '0.00%', '2020-03-20 15:09:24'),
(2889, 3, 10, 1, 'Matzu Biscuit (Matzu Biscuit  )', 'ea', '11.85', '0', '0.00%', '11.85', '0', '0.00%', '2020-03-20 15:09:24'),
(2890, 3, 10, 1, 'Mix Rye (Mix Rye  )', 'ea', '0', '0', '0.00%', '26.69', '0', '0.00%', '2020-03-20 15:09:24'),
(2891, 3, 10, 1, 'Monay big (Monay big  )', 'ea', '0', '0', '0.00%', '19.57', '0', '0.00%', '2020-03-20 15:09:24'),
(2892, 3, 10, 1, 'Monay Del Valle (Monay Del Valle  )', 'ea', '23.24', '0', '0.00%', '23.24', '0', '0.00%', '2020-03-20 15:09:24'),
(2893, 3, 10, 1, 'Monay mini (Monay mini  )', 'ea', '0', '0', '0.00%', '2.5', '0', '0.00%', '2020-03-20 15:09:24'),
(2894, 3, 10, 1, 'Monay small (Monay small  )', 'ea', '0', '0', '0.00%', '6.42', '0', '0.00%', '2020-03-20 15:09:24'),
(2895, 3, 10, 1, 'Mongo bread (Mongo bread  )', 'ea', '4.88', '29.28', '0.00%', '4.88', '29.28', '0.00%', '2020-03-20 15:09:24'),
(2896, 3, 10, 1, 'Mud Bar (Mud Bar  )', 'ea', '0', '0', '0.00%', '9.95', '0', '0.00%', '2020-03-20 15:09:24'),
(2897, 3, 10, 1, 'Multiseeds (Multiseeds  )', 'ea', '0', '0', '0.00%', '25.87', '0', '0.00%', '2020-03-20 15:09:24'),
(2898, 3, 10, 1, 'Mushroom (Mushroom  )', 'ea', '2.7', '0', '0.00%', '2.7', '0', '0.00%', '2020-03-20 15:09:24'),
(2899, 3, 10, 1, 'Pandan Hopia (Pandan Hopia  )', 'ea', '0', '0', '0.00%', '1.41', '0', '0.00%', '2020-03-20 15:09:24'),
(2900, 3, 10, 1, 'Papa Banana Catshup 4KG (Papa Banana Catshup 4KG)', 'gal', '156.36', '0', '0.00%', '137.9', '0', '0.00%', '2020-03-20 15:09:24'),
(2901, 3, 10, 1, 'Papaya (Papaya  )', 'ea', '0', '0', '0.00%', '20.71', '0', '0.00%', '2020-03-20 15:09:24'),
(2902, 3, 10, 1, 'Parsly cheese (Parsly cheese  )', 'ea', '0', '0', '0.00%', '2.46', '0', '0.00%', '2020-03-20 15:09:24'),
(2903, 3, 10, 1, 'Parsly Hotdog (Parsly Hotdog  )', 'ea', '0', '0', '0.00%', '4.89', '0', '0.00%', '2020-03-20 15:09:24'),
(2904, 3, 10, 1, 'Pilipit (Pilipit  )', 'ea', '66.13', '1322.6', '0.14%', '3.69', '73.8', '0.01%', '2020-03-20 15:09:24'),
(2905, 3, 10, 1, 'PineApple Pie (PineApple Pie)', 'ea', '10', '180', '0.02%', '10', '180', '0.02%', '2020-03-20 15:09:24'),
(2906, 3, 10, 1, 'Plain Muffins (Plain Muffins  )', 'ea', '0', '0', '0.00%', '7.25', '0', '0.00%', '2020-03-20 15:09:24'),
(2907, 3, 10, 1, 'Putok (Putok  )', 'ea', '2.77', '36.01', '0.00%', '2.77', '36.01', '0.00%', '2020-03-20 15:09:24'),
(2908, 3, 10, 1, 'Raisin Cake (Raisin Cake  )', 'ea', '0', '0', '0.00%', '7.11', '0', '0.00%', '2020-03-20 15:09:24'),
(2909, 3, 10, 1, 'Revel Bar (Revel Bar  )', 'ea', '8.96', '0', '0.00%', '8.96', '0', '0.00%', '2020-03-20 15:09:24'),
(2910, 3, 10, 1, 'Royal Bibingka (Royal Bibingka  )', 'ea', '11.58', '81.06', '0.01%', '11.58', '81.06', '0.01%', '2020-03-20 15:09:24'),
(2911, 3, 10, 1, 'S.Donut Filling (Donut with Filling - small  )', 'ea', '0', '0', '0.00%', '5.61', '0', '0.00%', '2020-03-20 15:09:24'),
(2912, 3, 10, 1, 'S.Donut with Filling (S.Donut with Filling- Big)', 'ea', '29', '0', '0.00%', '29', '0', '0.00%', '2020-03-20 15:09:24'),
(2913, 3, 10, 1, 'S.Donut with Filling- small (S.Donut with Filling- small)', 'ea', '11.22', '0', '0.00%', '11.22', '0', '0.00%', '2020-03-20 15:09:24'),
(2914, 3, 10, 1, 'Sesame cookies (Sesame cookies)', '', '22.09', '2120.64', '0.23%', '22.09', '2120.64', '0.25%', '2020-03-20 15:09:24'),
(2915, 3, 10, 1, 'Sesame Roll (Sesame Roll  )', 'ea', '0', '0', '0.00%', '2.72', '0', '0.00%', '2020-03-20 15:09:24'),
(2916, 3, 10, 1, 'Sesame Rye (Sesame Rye  )', 'ea', '22.47', '0', '0.00%', '22.47', '0', '0.00%', '2020-03-20 15:09:24'),
(2917, 3, 10, 1, 'Sesame w.wheat (Sesame w.wheat  )', 'ea', '22.25', '0', '0.00%', '22.25', '0', '0.00%', '2020-03-20 15:09:24'),
(2918, 3, 10, 1, 'Slutty Brownies (Slutty Brownies  )', 'ea', '0', '0', '0.00%', '10.85', '0', '0.00%', '2020-03-20 15:09:24'),
(2919, 3, 10, 1, 'Sour Dough Bread (Sour Dough Bread  )', 'ea', '14.95', '0', '0.00%', '14.95', '0', '0.00%', '2020-03-20 15:09:24'),
(2920, 3, 10, 1, 'Spanish bread (Spanish bread  )', 'ea', '3.42', '3.42', '0.00%', '3.42', '3.42', '0.00%', '2020-03-20 15:09:24'),
(2921, 3, 10, 1, 'Special Mamon (Special Mamon  )', 'ea', '10.31', '82.48', '0.01%', '10.31', '82.48', '0.01%', '2020-03-20 15:09:24'),
(2922, 3, 10, 1, 'Star bread big (Star bread big  )', 'ea', '0', '0', '0.00%', '19.68', '0', '0.00%', '2020-03-20 15:09:24'),
(2923, 3, 10, 1, 'Star small (Star small  )', 'ea', '0', '0', '0.00%', '6.42', '0', '0.00%', '2020-03-20 15:09:24'),
(2924, 3, 10, 1, 'Starbread mini (Starbread mini  )', 'ea', '2.5', '35', '0.00%', '2.5', '35', '0.00%', '2020-03-20 15:09:24'),
(2925, 3, 10, 1, 'Stick Bread (Stick Bread  )', 'ea', '17', '0', '0.00%', '17', '0', '0.00%', '2020-03-20 15:09:24'),
(2926, 3, 10, 1, 'Strussels small (Strussels small  )', 'ea', '0', '0', '0.00%', '6.78', '0', '0.00%', '2020-03-20 15:09:24'),
(2927, 3, 10, 1, 'Taipan Loaf (Taipan Loaf  )', 'ea', '0', '0', '0.00%', '23.75', '0', '0.00%', '2020-03-20 15:09:24'),
(2928, 3, 10, 1, 'Toasted Bread (Toasted Bread  )', 'ea', '10.29', '874.65', '0.09%', '11', '935', '0.11%', '2020-03-20 15:09:24'),
(2929, 3, 10, 1, 'Toasted Chiffon (Toasted Chiffon)', 'ea', '11', '0', '0.00%', '11', '0', '0.00%', '2020-03-20 15:09:24'),
(2930, 3, 10, 1, 'Toasted Jelly Roll (Toasted Jelly Roll)', 'ea', '11', '0', '0.00%', '11', '0', '0.00%', '2020-03-20 15:09:24'),
(2931, 3, 10, 1, 'Toasted Siopao Chicken (Toasted Siopao Chicken  )', 'ea', '0', '0', '0.00%', '7.16', '0', '0.00%', '2020-03-20 15:09:24'),
(2932, 3, 10, 1, 'Toasted Siopao Pork (Toasted Siopao Pork  )', 'ea', '7.57', '408.78', '0.04%', '7.57', '408.78', '0.05%', '2020-03-20 15:09:24'),
(2933, 3, 10, 1, 'Ube bread (Ube bread  )', 'ea', '3.35', '0', '0.00%', '3.35', '0', '0.00%', '2020-03-20 15:09:24'),
(2934, 3, 10, 1, 'Ube Chilled (Ube Chilled  )', 'ea', '18', '0', '0.00%', '18', '0', '0.00%', '2020-03-20 15:09:24'),
(2935, 3, 10, 1, 'Ube Hopia (Ube Hopia  )', 'ea', '1.69', '74.36', '0.01%', '1.69', '74.36', '0.01%', '2020-03-20 15:09:24'),
(2936, 3, 10, 1, 'Ube loaf (Ube loaf  )', 'ea', '14.13', '14.13', '0.00%', '14.13', '14.13', '0.00%', '2020-03-20 15:09:24'),
(2937, 3, 10, 1, 'Valentine Cake (Valentine Cake  )', 'ea', '0', '0', '0.00%', '14.42', '0', '0.00%', '2020-03-20 15:09:24'),
(2938, 3, 10, 1, 'W.wheat pandesal (W.wheat pandesal  )', 'ea', '0', '0', '0.00%', '5.86', '0', '0.00%', '2020-03-20 15:09:24'),
(2939, 3, 10, 1, 'White Mongo Hopia (White Mongo Hopia  )', 'ea', '0', '0', '0.00%', '1.41', '0', '0.00%', '2020-03-20 15:09:24'),
(2940, 3, 10, 1, 'Wholewheat Jumbo (Wholewheat Jumbo  )', 'ea', '31.02', '0', '0.00%', '31.02', '0', '0.00%', '2020-03-20 15:09:24'),
(2941, 3, 10, 1, 'Wholewheat Loaf (Wholewheat Loaf  )', 'ea', '17.48', '17.48', '0.00%', '17.48', '17.48', '0.00%', '2020-03-20 15:09:24'),
(2942, 3, 10, 1, 'Yema Cake (Yema Cake  )', 'ea', '8.19', '0', '0.00%', '7.8', '0', '0.00%', '2020-03-20 15:09:24'),
(2943, 3, 10, 1, 'Yema Durian Candy (Yema Durian Candy)', 'Pck', '22.97', '0', '0.00%', '22.97', '0', '0.00%', '2020-03-20 15:09:24'),
(2951, 1, 3, 1, 'test', 'ea', '12', '', '', '12', '', '', '2020-03-23 03:09:37'),
(2952, 1, 5, 1, 'test12', 'ea', '12', '', '', '13', '', '', '2020-03-23 03:10:38'),
(2953, 1, 1, 1, 'asdasd', 'test', '123', '', '', '123', '', '', '2020-03-23 15:31:29');

-- --------------------------------------------------------

--
-- Table structure for table `eb_raw_materials_cat`
--

CREATE TABLE `eb_raw_materials_cat` (
  `PK_category_id` tinyint(4) NOT NULL,
  `category_name` varchar(200) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eb_raw_materials_cat`
--

INSERT INTO `eb_raw_materials_cat` (`PK_category_id`, `category_name`, `date_added`, `date_updated`) VALUES
(1, 'Promotional Items', '2020-03-19 00:00:00', '0000-00-00 00:00:00'),
(2, 'YIWU Purchases', '2020-03-19 00:00:00', '0000-00-00 00:00:00'),
(3, 'CAFE', '2020-03-19 00:00:00', '0000-00-00 00:00:00'),
(4, 'GAS', '2020-03-19 00:00:00', '0000-00-00 00:00:00'),
(5, 'KITCHEN', '2020-03-19 00:00:00', '0000-00-00 00:00:00'),
(6, 'PACKAGING', '2020-03-19 00:00:00', '0000-00-00 00:00:00'),
(7, 'Portion Items', '2020-03-19 00:00:00', '0000-00-00 00:00:00'),
(8, 'PREMIX', '2020-03-19 00:00:00', '0000-00-00 00:00:00'),
(9, 'PRODUCTION', '2020-03-19 00:00:00', '0000-00-00 00:00:00'),
(10, 'SELLING AREA', '2020-03-19 00:00:00', '0000-00-00 00:00:00'),
(11, 'MX3 Inventoriables', '2020-03-19 14:17:08', '0000-00-00 00:00:00'),
(12, 'Organica Peanut Butter (Organica)', '2020-03-19 14:17:08', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `eb_raw_materials_list`
--

CREATE TABLE `eb_raw_materials_list` (
  `PK_raw_materials_id` int(11) NOT NULL,
  `FK_outlet_id` int(11) NOT NULL,
  `FK_category_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `material_name` varchar(250) NOT NULL,
  `unit` varchar(11) NOT NULL,
  `sales_price` varchar(10) NOT NULL,
  `related_item_id` int(11) NOT NULL,
  `min_stock` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eb_raw_materials_list`
--

INSERT INTO `eb_raw_materials_list` (`PK_raw_materials_id`, `FK_outlet_id`, `FK_category_id`, `status`, `material_name`, `unit`, `sales_price`, `related_item_id`, `min_stock`, `date_added`) VALUES
(1, 1, 3, 1, 'Coffee', 'Sack', '10', 1, 10, '2020-07-14 03:53:03'),
(2, 1, 3, 1, 'Milk', 'kg', '30', 2, 5, '2020-07-14 03:53:41'),
(3, 1, 5, 1, 'Sugar', 'Sack', '66', 3, 10, '2020-07-14 03:54:13');

-- --------------------------------------------------------

--
-- Table structure for table `eb_raw_materials_price_logs`
--

CREATE TABLE `eb_raw_materials_price_logs` (
  `PK_log_id` int(11) NOT NULL,
  `FK_raw_material_id` int(11) NOT NULL,
  `previous_price` varchar(10) NOT NULL,
  `current_price` varchar(10) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eb_raw_materials_price_logs`
--

INSERT INTO `eb_raw_materials_price_logs` (`PK_log_id`, `FK_raw_material_id`, `previous_price`, `current_price`, `date_added`) VALUES
(1, 1, '287.87', '287.87', '2020-05-13 18:26:32'),
(2, 2, '311.85', '311.85', '2020-05-13 18:26:32'),
(3, 3, '10.71', '12.21', '2020-05-13 18:27:02'),
(4, 1, '287.87', '300', '2020-05-22 18:40:14'),
(5, 1, '287.87', '300', '2020-05-22 18:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `eb_raw_materials_units`
--

CREATE TABLE `eb_raw_materials_units` (
  `pk_unit_id` int(11) NOT NULL,
  `unit_name` varchar(15) NOT NULL,
  `unit_abbr` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0-deleted 1-Active',
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eb_raw_materials_units`
--

INSERT INTO `eb_raw_materials_units` (`pk_unit_id`, `unit_name`, `unit_abbr`, `status`, `date_added`) VALUES
(1, 'kilograms', 'kg', 1, '2020-04-28 17:17:36'),
(2, 'grams', 'g', 1, '2020-04-28 17:17:36'),
(10, 'test2', 'test', 1, '2020-06-12 05:27:29'),
(11, 'test units', '', 1, '2020-07-02 01:58:17'),
(12, 'test1', '', 1, '2020-07-02 01:58:26');

-- --------------------------------------------------------

--
-- Table structure for table `eb_segment`
--

CREATE TABLE `eb_segment` (
  `PK_segment_id` int(11) NOT NULL,
  `FK_branch_id` int(11) NOT NULL,
  `segment_name` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_segment`
--

INSERT INTO `eb_segment` (`PK_segment_id`, `FK_branch_id`, `segment_name`, `status`, `date_added`) VALUES
(1, 1, 'Kitchen', 1, '2020-04-03 00:19:00'),
(2, 1, 'Hospital', 1, '2020-04-03 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `eb_so_discrepancy_items`
--

CREATE TABLE `eb_so_discrepancy_items` (
  `so_discrepancy_item_id` int(11) NOT NULL,
  `fk_so_discrepancy_id` int(11) NOT NULL,
  `fk_material_id` int(11) NOT NULL,
  `material_name` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `received_qty` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_so_discrepancy_items`
--

INSERT INTO `eb_so_discrepancy_items` (`so_discrepancy_item_id`, `fk_so_discrepancy_id`, `fk_material_id`, `material_name`, `qty`, `received_qty`, `date_added`) VALUES
(1, 3, 11, ' A1 Steak Sauce (A1 Steak Sauce 10oz) ', 3, 1, '2020-04-13 04:02:30'),
(2, 3, 9, ' 8X12X2 Styro (8X12X2 Styro) ', 4, 2, '2020-04-13 04:02:30'),
(3, 4, 7, ' 3D Board Castle (3D Board Castle) ', 1, 0, '2020-04-13 04:04:10'),
(4, 2, 1, ' 12x12  spongecake plain (12x12 spongecake plain) ', 2, 1, '2020-04-13 04:05:09'),
(5, 5, 5, ' 2D poster board for Spongebob (2D poster board for Spongebob) ', 2, 1, '2020-04-13 04:13:14');

-- --------------------------------------------------------

--
-- Table structure for table `eb_stock_out`
--

CREATE TABLE `eb_stock_out` (
  `PK_stock_out_id` int(11) NOT NULL,
  `FK_user_id` int(11) NOT NULL,
  `FK_outlet_id` int(11) NOT NULL,
  `FK_segment_id` int(11) NOT NULL,
  `total_items` int(11) NOT NULL,
  `total_amount` float NOT NULL,
  `status` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_stock_out`
--

INSERT INTO `eb_stock_out` (`PK_stock_out_id`, `FK_user_id`, `FK_outlet_id`, `FK_segment_id`, `total_items`, `total_amount`, `status`, `date_added`) VALUES
(2, 1, 1, 2, 3, 1397.58, 'approved', '2020-04-05 07:35:43'),
(3, 1, 1, 2, 4, 1227.68, 'approved', '2020-04-05 08:26:16'),
(4, 1, 1, 2, 2, 211, 'approved', '2020-04-06 04:06:46'),
(5, 1, 1, 2, 2, 336.43, 'approved', '2020-04-13 04:13:01'),
(6, 3, 1, 2, 1, 287.87, 'approved', '2020-05-06 04:11:47'),
(7, 1, 1, 2, 2, 887.61, 'approved', '2020-05-11 12:48:40'),
(8, 1, 1, 2, 1, 287.87, 'pending', '2020-05-11 01:56:55');

-- --------------------------------------------------------

--
-- Table structure for table `eb_stock_out_approved`
--

CREATE TABLE `eb_stock_out_approved` (
  `pk_stockout_approved_id` int(11) NOT NULL,
  `fk_stockout_id` int(11) NOT NULL,
  `fk_approve_user_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date_approved` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_stock_out_approved`
--

INSERT INTO `eb_stock_out_approved` (`pk_stockout_approved_id`, `fk_stockout_id`, `fk_approve_user_id`, `status`, `date_approved`) VALUES
(2, 3, 1, 1, '2020-04-13 04:02:30'),
(3, 4, 1, 1, '2020-04-13 04:04:10'),
(4, 2, 1, 1, '2020-04-13 04:05:09'),
(5, 5, 1, 1, '2020-04-13 04:13:14'),
(6, 6, 1, 1, '2020-05-06 04:14:27'),
(7, 7, 1, 1, '2020-05-11 01:37:53');

-- --------------------------------------------------------

--
-- Table structure for table `eb_stock_out_discrepancy`
--

CREATE TABLE `eb_stock_out_discrepancy` (
  `pk_so_discrepancy_id` int(11) NOT NULL,
  `fk_stock_out_id` int(11) NOT NULL,
  `reason` text NOT NULL,
  `status` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_stock_out_discrepancy`
--

INSERT INTO `eb_stock_out_discrepancy` (`pk_so_discrepancy_id`, `fk_stock_out_id`, `reason`, `status`, `date_added`) VALUES
(1, 3, 'test asd', 1, '2020-04-13 04:00:50'),
(2, 3, 'asd asd asd', 1, '2020-04-13 04:02:30'),
(3, 4, '', 1, '2020-04-13 04:04:10'),
(4, 2, '', 1, '2020-04-13 04:05:09'),
(5, 5, '', 1, '2020-04-13 04:13:14');

-- --------------------------------------------------------

--
-- Table structure for table `eb_stock_out_items`
--

CREATE TABLE `eb_stock_out_items` (
  `PK_stock_out_item_id` int(11) NOT NULL,
  `FK_stock_out_id` int(11) NOT NULL,
  `FK_raw_material_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` float NOT NULL,
  `item_unit` varchar(55) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_stock_out_items`
--

INSERT INTO `eb_stock_out_items` (`PK_stock_out_item_id`, `FK_stock_out_id`, `FK_raw_material_id`, `quantity`, `amount`, `item_unit`, `date_added`) VALUES
(3, 3, 6, 3, 5.1, 'kg', '2020-04-05 08:26:16'),
(4, 3, 11, 3, 296.44, 'Sack', '2020-04-05 08:26:16'),
(5, 3, 9, 4, 80, 'pc', '2020-04-05 08:26:16'),
(6, 3, 17, 3, 1.02, 'Sack', '2020-04-05 08:26:16'),
(13, 2, 2, 1, 311.85, 'kg', '2020-04-05 09:25:35'),
(14, 2, 1, 2, 287.88, 'kg', '2020-04-05 09:25:35'),
(15, 2, 8, 3, 169.99, 'pc', '2020-04-05 09:25:35'),
(16, 4, 4, 1, 186, 'kg', '2020-04-06 04:06:46'),
(17, 4, 7, 1, 25, 'kg', '2020-04-06 04:06:46'),
(20, 5, 5, 2, 20, 'Sack', '2020-04-13 04:13:08'),
(21, 5, 11, 1, 296.43, 'kg', '2020-04-13 04:13:08'),
(22, 6, 1, 1, 287.87, 'pc', '2020-05-06 04:11:47'),
(24, 7, 1, 2, 287.88, 'kg', '2020-05-11 01:37:47'),
(25, 7, 2, 1, 311.85, 'kg', '2020-05-11 01:37:47'),
(26, 8, 1, 1, 287.87, 'kg', '2020-05-11 01:56:55');

-- --------------------------------------------------------

--
-- Table structure for table `eb_stock_transfer`
--

CREATE TABLE `eb_stock_transfer` (
  `PK_stock_transfer_id` int(11) NOT NULL,
  `FK_user_id` int(11) NOT NULL,
  `FK_origin_branch_id` int(11) NOT NULL,
  `FK_destination_branch_id` int(11) NOT NULL,
  `stock_out` int(11) NOT NULL,
  `status` tinyint(11) NOT NULL COMMENT '0-Pending 1-Delivered',
  `str_no` varchar(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eb_stock_transfer`
--

INSERT INTO `eb_stock_transfer` (`PK_stock_transfer_id`, `FK_user_id`, `FK_origin_branch_id`, `FK_destination_branch_id`, `stock_out`, `status`, `str_no`, `date_added`) VALUES
(8, 1, 1, 2, 8, 1, '', '2020-04-03 18:58:17'),
(9, 1, 1, 2, 6, 1, '', '2020-04-08 18:19:49'),
(10, 1, 1, 2, 2, 1, '', '2020-04-08 18:57:36'),
(11, 1, 1, 2, 8, 1, '', '2020-04-08 18:58:44'),
(12, 1, 1, 2, 2, 1, '', '2020-04-08 19:08:37'),
(13, 1, 1, 2, 6, 1, '', '2020-04-09 08:40:53'),
(14, 1, 1, 2, 19, 1, '', '2020-04-09 08:50:52'),
(15, 1, 1, 2, 4, 1, '', '2020-04-09 13:36:48'),
(16, 1, 1, 2, 5, 1, '', '2020-04-09 14:28:42'),
(17, 1, 1, 2, 2, 1, '', '2020-04-09 15:00:21'),
(18, 1, 1, 2, 3, 1, '', '2020-04-09 15:23:16'),
(19, 1, 2, 1, 2, 0, '', '2020-04-09 15:37:21'),
(20, 1, 1, 2, 2, 0, '', '2020-04-13 20:09:30'),
(21, 1, 1, 2, 2, 1, '123', '2020-04-20 18:37:46'),
(22, 1, 1, 4, 1, 0, '12', '2020-05-18 19:31:49'),
(23, 1, 1, 3, 2, 0, '098', '2020-05-18 19:47:24'),
(24, 1, 1, 3, 1, 0, '-26', '2020-05-22 18:19:52'),
(25, 1, 1, 3, 1, 0, '-26', '2020-05-22 18:20:06'),
(26, 1, 1, 3, 1, 0, '-26', '2020-05-22 18:22:31'),
(27, 1, 1, 3, 1, 0, '-26', '2020-05-22 18:24:22'),
(28, 1, 1, 3, 1, 0, '-26', '2020-05-22 18:24:51'),
(29, 1, 1, 3, 1, 0, '-26', '2020-05-22 18:25:26'),
(30, 1, 1, 3, 1, 0, '-26', '2020-05-22 18:25:39'),
(31, 1, 1, 3, 1, 0, '-26', '2020-05-22 18:26:21'),
(32, 1, 1, 3, 1, 0, '-26', '2020-05-22 18:31:50'),
(33, 1, 1, 3, 1, 0, '-26', '2020-05-22 18:40:14'),
(34, 1, 1, 3, 1, 0, '-26', '2020-05-22 18:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `eb_stock_transfer_items`
--

CREATE TABLE `eb_stock_transfer_items` (
  `PK_transfer_item_id` int(11) NOT NULL,
  `FK_stock_transfer_id` int(11) NOT NULL,
  `FK_raw_material_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0-Pending 1-Delivered',
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `eb_stock_transfer_items`
--

INSERT INTO `eb_stock_transfer_items` (`PK_transfer_item_id`, `FK_stock_transfer_id`, `FK_raw_material_id`, `quantity`, `status`, `date_added`) VALUES
(4, 8, 1, 3, 0, '2020-04-03 18:58:17'),
(5, 8, 2, 5, 0, '2020-04-03 18:58:17'),
(6, 9, 1, 4, 0, '2020-04-08 18:19:49'),
(7, 10, 2, 1, 0, '2020-04-08 18:57:36'),
(8, 11, 2, 7, 0, '2020-04-08 18:58:44'),
(9, 12, 6, 1, 0, '2020-04-08 19:08:37'),
(10, 13, 8, 5, 0, '2020-04-09 08:40:53'),
(11, 14, 6, 8, 0, '2020-04-09 08:50:52'),
(12, 14, 9, 9, 0, '2020-04-09 08:50:52'),
(13, 15, 2, 1, 0, '2020-04-09 13:36:48'),
(14, 15, 1, 1, 0, '2020-04-09 13:36:48'),
(15, 16, 1, 3, 0, '2020-04-09 14:28:42'),
(16, 17, 2, 1, 0, '2020-04-09 15:00:21'),
(17, 18, 1, 2, 0, '2020-04-09 15:23:16'),
(18, 19, 1, 1, 0, '2020-04-09 15:37:21'),
(19, 20, 7, 1, 0, '2020-04-13 20:09:30'),
(20, 21, 3, 1, 0, '2020-04-20 18:37:46'),
(21, 22, 1, 1, 0, '2020-05-18 19:31:49'),
(22, 23, 3, 2, 0, '2020-05-18 19:47:24'),
(23, 34, 1, 1, 0, '2020-05-22 18:40:55');

-- --------------------------------------------------------

--
-- Table structure for table `eb_suppliers`
--

CREATE TABLE `eb_suppliers` (
  `PK_supplier_id` tinyint(4) NOT NULL,
  `supplier_name` varchar(200) NOT NULL,
  `products` text NOT NULL,
  `terms` varchar(20) NOT NULL,
  `address` varchar(200) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1- Active 0-Inactive',
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_suppliers`
--

INSERT INTO `eb_suppliers` (`PK_supplier_id`, `supplier_name`, `products`, `terms`, `address`, `contact_number`, `status`, `date_added`) VALUES
(1, 'Proweaver Supplier', 'test', '15 days', 'Cebu City, Philippines', '09123456781', 1, '2020-03-20 07:17:39'),
(2, 'Web2 Supplier', 'test', '15 days', 'Cebu CIty, Philippines', '09123456782', 1, '2020-03-20 07:17:39'),
(3, 'test1', 'test', '14 days', 'test1', 'test', 1, '2020-03-23 04:04:20'),
(4, 'test', 'test', 'DATED', 'test', '091234567891', 1, '2020-03-23 04:05:46'),
(5, 'asdasd1', 'test', '30 days', 'asd', 'asdasd', 1, '2020-03-23 15:30:34'),
(6, 'tessss', 'jhaskjashf', '12 days', '162 Little Embers Court', '091234567891', 1, '2020-05-22 17:11:33'),
(7, 'Isla Mindanao', 'centralized gasul', '30 days', 'R.Castillo St. ( at the back of Jetti station )', '', 1, '2020-05-22 17:17:59'),
(8, 'Supplier test1', 'da', '14 dayssss', '162 Little Embers Court', '', 1, '2020-05-22 17:37:36'),
(9, '116 Marketing', 'micram / bagutte / creamfil / freshmilk / french fries', '15 days', 'Obrero Davao City', '', 1, '2020-05-22 17:38:16'),
(10, '1st Pinacle', 'bread crates', 'DATED', 'SJRDC Bldg. Dorr 1,3,4 Insular Village Lanang', '', 1, '2020-05-22 17:39:21'),
(11, 'Adoy Ent.', 'cake accessories', '30 days', '#34 Magsaysay Ave.Poblacion District', '', 1, '2020-05-22 17:39:46'),
(12, 'Adsia Eurobakers', 'credo bread improver', '30 days', 'Garcia Highway Davao City', '', 1, '2020-05-22 17:40:09'),
(13, 'JCT ', 'Bakels Phils. Inc. products : fino meal and chocolate glaze', '30 days', '108 Sta.Ana Poblacion District Davao city', '', 1, '2020-05-22 17:40:29'),
(14, 'Baker\'s Basket', 'boxes for happy cake / powder sugar / glaze fruit', '30 days', 'Quirino Ave,Bajada Davao City ( infront Penongs )', '', 1, '2020-05-22 17:40:50'),
(15, 'Baking & Pantry', 'other options for cake accessories', '15 days', 'Acacia St. Bajada', '', 1, '2020-05-22 17:41:14'),
(16, 'Best Buy', 'all bakery equipment and kitchen equipment', 'DATED', 'Obrero infront Ritz Hotel', '', 1, '2020-05-22 17:41:38'),
(17, 'Besterm', 'kitchen and bread equipment', 'DATED', 'Mabini St. Corner avancenia st.', '', 1, '2020-05-22 17:41:57'),
(18, 'Christopher Singcol', 'mascara / ground pork', '30 days', 'Bangkal Davao City', '', 1, '2020-05-22 17:42:21'),
(19, 'Cody Mktg', 'C302  / take out meal box and other packaging supplies', '15 days', 'Door 5,6,7 Alejandra Building Porras St. ', '', 1, '2020-05-22 17:42:47'),
(20, 'D Unibuenas', 'solane - 50kg and 11 kg', '30 days', 'Sobrecary Corner Vinsons st. Obrero', '', 1, '2020-05-22 17:43:28'),
(21, 'D Paragon', 'magic sarap / nestle products', '15 days', 'Sobrecary Corner Vinsons st. Obrero', '', 1, '2020-05-22 17:43:50'),
(22, 'Denchel Ent.', 'flour / bakery raw materials', '30 days', '#42 Monteverde st. Poblacion Davao City', '', 1, '2020-05-22 17:44:12'),
(23, 'Dimdi', 'kitchen and bread equipment', 'DATED', 'Asaje 11 Bldg. San Pedro St. Davao City', '', 1, '2020-05-22 17:44:33'),
(24, 'DSG Grocery ', 'assorted grocery', '14 days', 'Gaisano Mall of Davao - JP Laurel Ave.Bajada', '', 1, '2020-05-22 17:44:54'),
(25, 'Dvo. Asian Dist.', 'alaska condensed and evap', '15 days', 'Asian st. Maa Road  ( at the back of St.Francis Assassi Church )', '', 1, '2020-05-22 17:45:15'),
(26, 'Davao Synthetic', 'shrinkable cellophane', '30 days', '2 ATP Building Km.7 Lanang Angliongto Buhangin Davao City', '', 1, '2020-05-22 17:45:41'),
(27, 'Eblue / Equilibirium', 'Torani products / Tea bag / coffee ', '30 days', 'SRC Bldg.Door 2 and 3 Dacudao ave.(beside yamaha)', '', 1, '2020-05-22 17:45:59'),
(28, 'Integral', 'all computer equipment', '30 days', 'Door 1 Junsay Bldg.71 E.Quirino Avenue', '', 1, '2020-05-22 17:46:17'),
(29, 'GLL Printing Press', 'riso / tarp supplies printing', 'DATED / cash', 'Imperial Bldg. ( infront UM school )', '', 1, '2020-05-22 17:46:38'),
(30, 'IPI ', 'sun valley vegetable oil', '30 days', 'Malagamot road Panacan', '', 1, '2020-05-22 17:46:58'),
(31, 'JNS Global Ent.', 'whole wheat', '30 days', '28 A.T. Monteverde Ave. Davao city', '', 1, '2020-05-22 17:47:15'),
(32, 'Judith Farms ', 'eggs', '23 days', 'Aquino St.Agdao Davao City ( outlet ) / Sirawan Toril (farm)', '', 1, '2020-05-22 17:47:38'),
(33, 'JBBS', 'whole wheat', '30 days', 'Villa Abrille St. Poblacion District Davao city', '', 1, '2020-05-22 17:48:02'),
(34, 'Kitchen & Pantry', 'other options for cake accessories', '30 days', 'Lapu-Lapu St. Agdao Davao City', '', 1, '2020-05-22 17:48:16'),
(35, 'KLG-mop heads', 'mop head', '30 days', 'Door 8 Angliongto Commercial Complex A.Alingiongto Lanang  ', '', 1, '2020-05-22 17:48:40'),
(36, 'Lisa\'s Meat', 'frozen products', '15 days', 'Gaisano Mall of Davao - JP Laurel Ave.Bajada', '', 1, '2020-05-22 17:49:07'),
(37, 'Lui Ent.', 'office supplies', '30 days', 'Gempesaw St. Davao City', '', 1, '2020-05-22 17:49:28'),
(38, 'Metro Plaza', 'kitchen and bread equipment', 'DATED', 'JP Laurel Ave.Bajada Davao City', '', 1, '2020-05-22 17:49:46'),
(39, 'Mindanao Daltan Ent.', 'mongo paste / ube paste / supot / freshmilk / filled cheese / unsalted butter / super syrup / trash bag / rainbow and choco sprinkles / BOS / precut tissue  / cocktail tissue / marca corn oil / cream cheese / spaghetti pasta', '15 days', '#888 Sobrecarey St. cor.Villamor St. Bo. Obrero', '', 1, '2020-05-22 17:50:04'),
(40, 'MJAG', 'all knorr products  ', '30 days', 'Door 19 & 20 Joyfull Village Brgy Cabantian', '', 1, '2020-05-22 17:50:33'),
(41, 'New Lucky Star', 'kitchen and bread equipment', '30 days', 'Ramon Magsaysay Ave. brgy.sta.ana 27-c', '', 1, '2020-05-22 17:50:49'),
(42, 'RM Legacy', 'organica peanut butter ', '30 days', 'Dapitan St.Kalawag 1 Isulan Sultan Kudarat', '', 1, '2020-05-22 17:51:07'),
(43, 'Pantua', 'macapuno preserved', '30 days', '#53 Tulip Drive St. Juna Subd. Matina', '', 1, '2020-05-22 17:51:25'),
(44, 'Press CN', 'accountability forms', '30 days', 'Nissan St.Purok Alicia Pelayo Brgy.Centro Agdao District', '', 1, '2020-05-22 17:51:40'),
(45, 'Rigel Laser Mktg', 'toner', '30 days', 'Door 2 Basa  Building Jose Palma Gil St. Poblacion district', '', 1, '2020-05-22 17:51:58'),
(46, 'Rodsy Mktg', 'all delmonte products  / tuna chunks / Angel condensed', '15 days', '#8 Ruby St. RGA Village Dacudao ', '', 1, '2020-05-22 17:52:21'),
(47, 'Rookies Fruit Preserves', 'ube jam', '15 days', 'Talomo Davao City', '', 1, '2020-05-22 17:52:44'),
(48, 'RPE Printing Press', 'alll accountable forms', '30 days', 'NHA Buhangin', '', 1, '2020-05-22 17:52:53'),
(49, 'Isla Mindanao', 'centralized gasul', '30 days', 'R.Castillo St. ( at the back of Jetti station )', '', 1, '2020-05-22 17:55:47'),
(50, 'Super Savings', 'all coca cola products', '15 days', 'Sobrecary Corner Vinsons st. Obrero', '', 1, '2020-05-22 17:56:08'),
(51, 'Swiss Deli', ' / hungarian sausages / pork knuckles / smoked farmers ham', '15 days', 'RS Compound Km.7 Lanang Davao City', '', 1, '2020-05-22 17:56:22'),
(52, 'TP Foods', 'semi sweet  and unswetened chocolate', 'DATED', '#34 Arturo Drive Bagumbayan Taguig City', '', 1, '2020-05-22 17:56:42'),
(53, 'Durian Marketing', 'nagarosa flour / asstd bakery suppliers', '30 days', 'Purok Mansanitas Gante Road  Magugpo west Tagum city', '', 1, '2020-05-22 17:57:09'),
(54, 'Wealthy Unisavers', 'other alternate if no stock current supplier for cheese', '30 days', 'Panabo City  Road , B/uhangin Davao City', '', 1, '2020-05-22 17:57:27'),
(55, 'Werdenberg', 'saurkraut / parmesan cheese / mustard', '15 days', 'Unit 101 and 102 Two via Condotti JP Laurel Ave. Bajada ', '', 1, '2020-05-22 17:57:44'),
(56, 'WGV Mktg', 'lard / margarine / cocoa / whip crème', '30 days', '#28 Bicol St. Rivera Village Bjada', '', 1, '2020-05-22 17:58:04'),
(57, 'BuyersLink', 'comstock blueberry and red cherry', '30 days', 'Del Pilar St. Poblacion District Davao City', '', 1, '2020-05-22 17:58:20'),
(58, '4U Commercial', 'sando bag generic / bending straw white / disposable gloves ', '30 days', 'SM Village Bangkal Davao City', '', 1, '2020-05-22 17:58:35'),
(59, '3 Apples', 'rice / artistic straw / plastic cup 12oz and 3.5 oz / rippled for coffee / cocktail picks / umbrella picks', '30 days', '#12 Guerero St, Davao City', '', 1, '2020-05-22 17:59:37'),
(60, 'DC Pharma', ' mx3 cooffee and capsule', '15 days', '#777 Kalamansi St. Juna Subdivision Matina', '', 1, '2020-05-22 17:59:56'),
(61, 'KMI', 'bacon / dory fish / ', '15 days', 'Landmark Vista Verde ( at the back of 711 )', '', 1, '2020-05-22 18:00:11'),
(62, 'MERRIAN REFRIGERATION', 'chiller equipment / emergency light', 'DATED', 'Acacia St. Bajada', '', 1, '2020-05-22 18:00:30'),
(63, 'Bloomy Ice cubes', 'dealer for ice cubes . Crushed ice', 'cash basis', 'E11 Lot 38 Saint Barts St. Solariega Talomo ', '', 1, '2020-05-22 18:00:50'),
(64, 'Clean Up', 'diswashing liquid/ hand sanitizer', 'DATED', 'Panabo City', '', 1, '2020-05-22 18:01:10'),
(65, 'Southern synergy', 'journal / other office supplies', '30 days', '#10 Blue Jay St. Belisario Subd.Lanang', '', 1, '2020-05-22 18:01:27'),
(66, 'Flex Solutions', 'packaging materials', '30 days', 'Km.14 Malagamot Road Davao City', '', 1, '2020-05-22 18:01:45');

-- --------------------------------------------------------

--
-- Table structure for table `eb_units`
--

CREATE TABLE `eb_units` (
  `PK_unit_id` int(11) NOT NULL,
  `unit_name` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_units`
--

INSERT INTO `eb_units` (`PK_unit_id`, `unit_name`, `status`, `date_added`) VALUES
(1, 'kg', 1, '2020-04-05 00:00:00'),
(2, 'Sack', 1, '2020-04-05 00:00:00'),
(3, 'pc', 1, '2020-04-05 00:00:00'),
(4, 'box', 1, '2020-04-24 00:00:00'),
(5, 'tesssssss', 0, '0000-00-00 00:00:00'),
(6, 'ea', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `eb_unit_converted`
--

CREATE TABLE `eb_unit_converted` (
  `pk_unit_con_id` int(11) NOT NULL,
  `fk_item_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `total_items` int(11) NOT NULL,
  `date_added` date NOT NULL,
  `date_updated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_unit_converted`
--

INSERT INTO `eb_unit_converted` (`pk_unit_con_id`, `fk_item_id`, `status`, `total_items`, `date_added`, `date_updated`) VALUES
(4, 1, 1, 2, '2020-04-28', '2020-04-29'),
(5, 7, 1, 3, '2020-04-28', '2020-04-29'),
(6, 9, 1, 5, '2020-04-28', '2020-07-02'),
(7, 3, 1, 1, '2020-07-01', '2020-07-01'),
(8, 10, 1, 1, '2020-07-02', '2020-07-02');

-- --------------------------------------------------------

--
-- Table structure for table `eb_unit_coverted_item`
--

CREATE TABLE `eb_unit_coverted_item` (
  `pk_unit_con_item_id` int(11) NOT NULL,
  `fk_unit_con_id` int(11) NOT NULL,
  `fk_new_unit_id` int(11) NOT NULL,
  `uom_value` int(11) NOT NULL,
  `new_unit_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_unit_coverted_item`
--

INSERT INTO `eb_unit_coverted_item` (`pk_unit_con_item_id`, `fk_unit_con_id`, `fk_new_unit_id`, `uom_value`, `new_unit_value`) VALUES
(15, 4, 2, 10, 1),
(16, 4, 4, 65, 1),
(21, 5, 2, 10, 1),
(22, 5, 3, 11, 1),
(23, 5, 4, 22, 1),
(24, 7, 0, 2, 3),
(26, 8, 3, 1, 5),
(32, 6, 2, 11, 1),
(33, 6, 1, 22, 1),
(34, 6, 4, 66, 1),
(35, 6, 3, 666, 1),
(36, 6, 5, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `eb_users`
--

CREATE TABLE `eb_users` (
  `PK_user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_type` int(11) NOT NULL,
  `user_status` int(11) NOT NULL,
  `branch_assigned` varchar(100) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_users`
--

INSERT INTO `eb_users` (`PK_user_id`, `username`, `password`, `user_type`, `user_status`, `branch_assigned`, `date_added`) VALUES
(1, 'admin', '123456', 1, 1, '1', '2020-03-30 00:00:00'),
(2, 'test2', 'password', 2, 1, '1', '2020-03-31 00:00:00'),
(8, 'Matt', 'password', 3, 1, '1', '2020-04-24 17:58:30'),
(9, 'Frank', 'password', 3, 1, '3', '2020-04-24 18:42:22'),
(10, 'admin2', 'password', 1, 1, '4', '2020-04-24 18:58:45'),
(11, 'Brock', 'password', 2, 1, '1', '2020-05-05 18:54:09');

-- --------------------------------------------------------

--
-- Table structure for table `eb_users_meta`
--

CREATE TABLE `eb_users_meta` (
  `PK_user_meta_id` int(11) NOT NULL,
  `FK_user_id` int(11) NOT NULL,
  `firstname` varchar(60) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email_address` varchar(100) NOT NULL,
  `age` varchar(11) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eb_users_meta`
--

INSERT INTO `eb_users_meta` (`PK_user_meta_id`, `FK_user_id`, `firstname`, `lastname`, `email_address`, `age`, `gender`, `address`) VALUES
(1, 1, 'opet', 'vitualla', 'web2.juphetvitualla@gmail.com', '21', 'male', ''),
(2, 2, 'John', 'Doe', 'sample@sample.com', '21', 'male', 'cebu'),
(4, 8, 'Cruiser', 'Marion', 'proweaver@example.com', '0', 'female', '9170 N. Summerhouse St.'),
(5, 9, 'Uy', 'Marion', 'example@proweaver.com', '76', 'female', '7669 Gulf Drive'),
(6, 10, 'Cory', 'Cliff', 'example@proweaver.com', '14', 'female', '9170 N. Summerhouse St.'),
(7, 11, 'Petey', 'Holly', 'proweaver@example.com', 'Mull', 'female', '162 Little Embers Court');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `eb_forgot_password_keys`
--
ALTER TABLE `eb_forgot_password_keys`
  ADD PRIMARY KEY (`PK_forget_id`);

--
-- Indexes for table `eb_inventory_movement`
--
ALTER TABLE `eb_inventory_movement`
  ADD PRIMARY KEY (`pk_inv_move_id`);

--
-- Indexes for table `eb_item_inventory`
--
ALTER TABLE `eb_item_inventory`
  ADD PRIMARY KEY (`PK_inventory_id`);

--
-- Indexes for table `eb_other_outlet_delivery`
--
ALTER TABLE `eb_other_outlet_delivery`
  ADD PRIMARY KEY (`pk_other_deliver_id`);

--
-- Indexes for table `eb_outlet`
--
ALTER TABLE `eb_outlet`
  ADD PRIMARY KEY (`PK_branch_id`);

--
-- Indexes for table `eb_outlets`
--
ALTER TABLE `eb_outlets`
  ADD PRIMARY KEY (`PK_branch_id`);

--
-- Indexes for table `eb_po_discrepancy_items`
--
ALTER TABLE `eb_po_discrepancy_items`
  ADD PRIMARY KEY (`po_discrepancy_item_id`);

--
-- Indexes for table `eb_purchase_order`
--
ALTER TABLE `eb_purchase_order`
  ADD PRIMARY KEY (`PK_purchase_order_id`);

--
-- Indexes for table `eb_purchase_order_discrepancy`
--
ALTER TABLE `eb_purchase_order_discrepancy`
  ADD PRIMARY KEY (`pk_po_discrepancy_id`);

--
-- Indexes for table `eb_purchase_order_item`
--
ALTER TABLE `eb_purchase_order_item`
  ADD PRIMARY KEY (`PK_po_item_id`);

--
-- Indexes for table `eb_purchase_order_received`
--
ALTER TABLE `eb_purchase_order_received`
  ADD PRIMARY KEY (`PK_po_received_id`);

--
-- Indexes for table `eb_raw_materials`
--
ALTER TABLE `eb_raw_materials`
  ADD PRIMARY KEY (`PK_raw_materials_id`);

--
-- Indexes for table `eb_raw_materials_cat`
--
ALTER TABLE `eb_raw_materials_cat`
  ADD PRIMARY KEY (`PK_category_id`);

--
-- Indexes for table `eb_raw_materials_list`
--
ALTER TABLE `eb_raw_materials_list`
  ADD PRIMARY KEY (`PK_raw_materials_id`);

--
-- Indexes for table `eb_raw_materials_price_logs`
--
ALTER TABLE `eb_raw_materials_price_logs`
  ADD PRIMARY KEY (`PK_log_id`);

--
-- Indexes for table `eb_raw_materials_units`
--
ALTER TABLE `eb_raw_materials_units`
  ADD PRIMARY KEY (`pk_unit_id`);

--
-- Indexes for table `eb_segment`
--
ALTER TABLE `eb_segment`
  ADD PRIMARY KEY (`PK_segment_id`);

--
-- Indexes for table `eb_so_discrepancy_items`
--
ALTER TABLE `eb_so_discrepancy_items`
  ADD PRIMARY KEY (`so_discrepancy_item_id`);

--
-- Indexes for table `eb_stock_out`
--
ALTER TABLE `eb_stock_out`
  ADD PRIMARY KEY (`PK_stock_out_id`);

--
-- Indexes for table `eb_stock_out_approved`
--
ALTER TABLE `eb_stock_out_approved`
  ADD PRIMARY KEY (`pk_stockout_approved_id`);

--
-- Indexes for table `eb_stock_out_discrepancy`
--
ALTER TABLE `eb_stock_out_discrepancy`
  ADD PRIMARY KEY (`pk_so_discrepancy_id`);

--
-- Indexes for table `eb_stock_out_items`
--
ALTER TABLE `eb_stock_out_items`
  ADD PRIMARY KEY (`PK_stock_out_item_id`);

--
-- Indexes for table `eb_stock_transfer`
--
ALTER TABLE `eb_stock_transfer`
  ADD PRIMARY KEY (`PK_stock_transfer_id`);

--
-- Indexes for table `eb_stock_transfer_items`
--
ALTER TABLE `eb_stock_transfer_items`
  ADD PRIMARY KEY (`PK_transfer_item_id`);

--
-- Indexes for table `eb_suppliers`
--
ALTER TABLE `eb_suppliers`
  ADD PRIMARY KEY (`PK_supplier_id`);

--
-- Indexes for table `eb_units`
--
ALTER TABLE `eb_units`
  ADD PRIMARY KEY (`PK_unit_id`);

--
-- Indexes for table `eb_unit_converted`
--
ALTER TABLE `eb_unit_converted`
  ADD PRIMARY KEY (`pk_unit_con_id`);

--
-- Indexes for table `eb_unit_coverted_item`
--
ALTER TABLE `eb_unit_coverted_item`
  ADD PRIMARY KEY (`pk_unit_con_item_id`);

--
-- Indexes for table `eb_users`
--
ALTER TABLE `eb_users`
  ADD PRIMARY KEY (`PK_user_id`);

--
-- Indexes for table `eb_users_meta`
--
ALTER TABLE `eb_users_meta`
  ADD PRIMARY KEY (`PK_user_meta_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `eb_forgot_password_keys`
--
ALTER TABLE `eb_forgot_password_keys`
  MODIFY `PK_forget_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eb_inventory_movement`
--
ALTER TABLE `eb_inventory_movement`
  MODIFY `pk_inv_move_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `eb_item_inventory`
--
ALTER TABLE `eb_item_inventory`
  MODIFY `PK_inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `eb_other_outlet_delivery`
--
ALTER TABLE `eb_other_outlet_delivery`
  MODIFY `pk_other_deliver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `eb_outlet`
--
ALTER TABLE `eb_outlet`
  MODIFY `PK_branch_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eb_outlets`
--
ALTER TABLE `eb_outlets`
  MODIFY `PK_branch_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `eb_po_discrepancy_items`
--
ALTER TABLE `eb_po_discrepancy_items`
  MODIFY `po_discrepancy_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `eb_purchase_order`
--
ALTER TABLE `eb_purchase_order`
  MODIFY `PK_purchase_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `eb_purchase_order_discrepancy`
--
ALTER TABLE `eb_purchase_order_discrepancy`
  MODIFY `pk_po_discrepancy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `eb_purchase_order_item`
--
ALTER TABLE `eb_purchase_order_item`
  MODIFY `PK_po_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `eb_purchase_order_received`
--
ALTER TABLE `eb_purchase_order_received`
  MODIFY `PK_po_received_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `eb_raw_materials`
--
ALTER TABLE `eb_raw_materials`
  MODIFY `PK_raw_materials_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2954;

--
-- AUTO_INCREMENT for table `eb_raw_materials_cat`
--
ALTER TABLE `eb_raw_materials_cat`
  MODIFY `PK_category_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `eb_raw_materials_list`
--
ALTER TABLE `eb_raw_materials_list`
  MODIFY `PK_raw_materials_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `eb_raw_materials_price_logs`
--
ALTER TABLE `eb_raw_materials_price_logs`
  MODIFY `PK_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `eb_raw_materials_units`
--
ALTER TABLE `eb_raw_materials_units`
  MODIFY `pk_unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `eb_segment`
--
ALTER TABLE `eb_segment`
  MODIFY `PK_segment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `eb_so_discrepancy_items`
--
ALTER TABLE `eb_so_discrepancy_items`
  MODIFY `so_discrepancy_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `eb_stock_out`
--
ALTER TABLE `eb_stock_out`
  MODIFY `PK_stock_out_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `eb_stock_out_approved`
--
ALTER TABLE `eb_stock_out_approved`
  MODIFY `pk_stockout_approved_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `eb_stock_out_discrepancy`
--
ALTER TABLE `eb_stock_out_discrepancy`
  MODIFY `pk_so_discrepancy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `eb_stock_out_items`
--
ALTER TABLE `eb_stock_out_items`
  MODIFY `PK_stock_out_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `eb_stock_transfer`
--
ALTER TABLE `eb_stock_transfer`
  MODIFY `PK_stock_transfer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `eb_stock_transfer_items`
--
ALTER TABLE `eb_stock_transfer_items`
  MODIFY `PK_transfer_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `eb_suppliers`
--
ALTER TABLE `eb_suppliers`
  MODIFY `PK_supplier_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `eb_units`
--
ALTER TABLE `eb_units`
  MODIFY `PK_unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `eb_unit_converted`
--
ALTER TABLE `eb_unit_converted`
  MODIFY `pk_unit_con_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `eb_unit_coverted_item`
--
ALTER TABLE `eb_unit_coverted_item`
  MODIFY `pk_unit_con_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
