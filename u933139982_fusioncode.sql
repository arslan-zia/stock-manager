-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 19, 2025 at 03:11 AM
-- Server version: 10.11.10-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u933139982_fusioncode`
--

-- --------------------------------------------------------

--
-- Table structure for table `sma_addresses`
--

CREATE TABLE `sma_addresses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

CREATE TABLE `sma_adjustments` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustment_items`
--

CREATE TABLE `sma_adjustment_items` (
  `id` int(11) NOT NULL,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_attachments`
--

CREATE TABLE `sma_attachments` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `subject_type` varchar(55) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `orig_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_brands`
--

CREATE TABLE `sma_brands` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_brands`
--

INSERT INTO `sma_brands` (`id`, `code`, `name`, `image`, `slug`, `description`) VALUES
(1, 'dgtpos', 'Digit POS', '13f206c01a91a635f8a73eaee16621d7.png', 'digit-pos', 'Digit POS'),
(2, 'brand2', 'Brand 2', NULL, 'brand-2', 'Brand 2'),
(3, 'brand3', 'Brand 3', NULL, 'brand-3', 'Brand 3');

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

CREATE TABLE `sma_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

CREATE TABLE `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

CREATE TABLE `sma_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`, `description`) VALUES
(1, 'ff01', 'Fast Food', 'a710eab583aa54e7c6d66127f36ecac1.png', 0, 'fast-food', 'Fast Food'),
(2, 'm001', 'Meat', '595f7833e2d4554402b2060ad7e88ed2.png', 0, 'meat', 'Meat'),
(3, 'd001', 'Drinks', 'ae6e234c72b3f49ea69111ad73a6f412.png', 0, 'drinks', 'Drinks'),
(4, 'r001', 'Rice', 'e6e588190d81b73d85d7507814c25b39.png', 0, 'rice', 'Rice'),
(5, 'b001', 'Bread', '5f807bb9ce3fd0201f1762af72c750d6.png', 0, 'bread', 'Bread');

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

CREATE TABLE `sma_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

CREATE TABLE `sma_companies` (
  `id` int(11) NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text DEFAULT NULL,
  `payment_term` int(11) DEFAULT 0,
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT 0,
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL,
  `gst_no` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`, `gst_no`) VALUES
(1, 3, 'customer', 1, 'General', 'Noman', 'Softianz', '', 'Customer Address', 'New York City', 'New York, NY', '10003', 'USA', '+1 321 710 3816', 'contact@softianz.com', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, ''),
(2, 4, 'supplier', NULL, NULL, 'Farjad', 'Supplier Company Name', '', 'Supplier Address', 'New York City', 'New York, NY', '10003', 'USA', '+1 321 710 3816', 'contact@softianz.com', '-', '-', '-', '-', '-', '-', NULL, 0, 'logo.png', 0, NULL, NULL, NULL, ''),
(3, NULL, 'biller', NULL, NULL, 'Adeel', 'Digitrillion', '5555', 'Biller adddress', 'City', '', '', 'Country', '+1 321 710 3816', 'contact@softianz.com', '', '', '', '', '', '', ' Thank you for shopping with us. Please come again', 0, 'logo1.png', 0, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

CREATE TABLE `sma_costing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT 0,
  `overselling` tinyint(1) DEFAULT 0,
  `option_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_costing`
--

INSERT INTO `sma_costing` (`id`, `date`, `product_id`, `sale_item_id`, `sale_id`, `purchase_item_id`, `quantity`, `purchase_net_unit_cost`, `purchase_unit_cost`, `sale_net_unit_price`, `sale_unit_price`, `quantity_balance`, `inventory`, `overselling`, `option_id`, `purchase_id`, `transfer_id`) VALUES
(1, '2024-10-18', 1, 1, 1, NULL, 2.0000, 80.0000, 80.0000, 100.0000, 100.0000, -2.0000, 1, 1, NULL, NULL, NULL),
(2, '2024-10-25', 2, 2, 2, NULL, 100.0000, 70.0000, 70.0000, 3.0000, 3.0000, -100.0000, 1, 1, NULL, NULL, NULL),
(3, '2024-10-25', 3, 3, 2, NULL, 100.0000, 80.0000, 80.0000, 100.0000, 100.0000, -100.0000, 1, 1, NULL, NULL, NULL),
(4, '2024-10-24', 1, 4, 3, 1, -2.0000, 80.0000, 80.0000, 100.0000, 100.0000, 0.0000, 1, 0, NULL, NULL, NULL),
(5, '2024-10-24', 1, 4, 3, NULL, 4.0000, 80.0000, 80.0000, 100.0000, 100.0000, -4.0000, 1, 1, NULL, NULL, NULL),
(6, '2024-10-26', 4, 5, 4, NULL, 1.0000, 180.0000, 180.0000, 200.0000, 200.0000, -1.0000, 1, 1, NULL, NULL, NULL),
(7, '2024-10-26', 11, 6, 4, NULL, 1.0000, 10.0000, 10.6000, 20.0000, 21.2000, -1.0000, 1, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

CREATE TABLE `sma_currencies` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT 0,
  `symbol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES
(1, 'USD', 'US Dollar', 1.0000, 0, NULL),
(2, 'EUR', 'EURO', 0.7340, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

CREATE TABLE `sma_customer_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL,
  `discount` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`, `discount`) VALUES
(1, 'General', 0, NULL),
(2, 'Reseller', -5, NULL),
(3, 'Distributor', -15, NULL),
(4, 'New Customer (+10)', 10, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

CREATE TABLE `sma_date_format` (
  `id` int(11) NOT NULL,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

CREATE TABLE `sma_deliveries` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_deposits`
--

CREATE TABLE `sma_deposits` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

CREATE TABLE `sma_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expense_categories`
--

CREATE TABLE `sma_expense_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

CREATE TABLE `sma_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_card_topups`
--

CREATE TABLE `sma_gift_card_topups` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

CREATE TABLE `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

CREATE TABLE `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_login_attempts`
--

INSERT INTO `sma_login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(7, 0x37302e32342e3135372e323432, 'softainz', 1731809964),
(8, 0x37322e3235352e35382e323535, 'admin', 1752894316),
(9, 0x37322e3235352e35382e323535, 'admin', 1752894327),
(10, 0x37322e3235352e35382e323535, 'admin', 1752894337);

-- --------------------------------------------------------

--
-- Table structure for table `sma_logs`
--

CREATE TABLE `sma_logs` (
  `id` int(11) NOT NULL,
  `detail` varchar(190) NOT NULL,
  `model` longtext DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_logs`
--

INSERT INTO `sma_logs` (`id`, `detail`, `model`, `date`) VALUES
(1, 'POS Bill is being deleted by softianz (User Id: 1)', '{\"model\":{\"id\":\"1\",\"date\":\"2024-10-17 23:39:22\",\"customer_id\":\"1\",\"customer\":\"Walk-in Customer\",\"count\":\"2\",\"order_discount_id\":\"\",\"order_tax_id\":\"1\",\"total\":\"200.0000\",\"biller_id\":\"3\",\"warehouse_id\":\"1\",\"created_by\":\"1\",\"suspend_note\":\"table 1\",\"shipping\":\"0.0000\",\"cgst\":null,\"sgst\":null,\"igst\":null},\"items\":[{\"id\":\"1\",\"suspend_id\":\"1\",\"product_id\":\"1\",\"product_code\":\"63980977\",\"product_name\":\"Product 1\",\"net_unit_price\":\"100.0000\",\"unit_price\":\"100.0000\",\"quantity\":\"2.0000\",\"warehouse_id\":\"1\",\"item_tax\":\"0.0000\",\"tax_rate_id\":\"1\",\"tax\":\"0\",\"discount\":\"0\",\"item_discount\":\"0.0000\",\"subtotal\":\"200.0000\",\"serial_no\":\"\",\"option_id\":null,\"product_type\":\"standard\",\"real_unit_price\":\"100.0000\",\"product_unit_id\":\"1\",\"product_unit_code\":\"unit1\",\"unit_quantity\":\"2.0000\",\"comment\":\"\",\"gst\":null,\"cgst\":null,\"sgst\":null,\"igst\":null}]}', '2024-10-24 19:15:37');

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

CREATE TABLE `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

CREATE TABLE `sma_notifications` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_notifications`
--

INSERT INTO `sma_notifications` (`id`, `comment`, `date`, `from_date`, `till_date`, `scope`) VALUES
(1, '<p>Thank you for using Softianz Inventory Management. Please do not forget to check the documentation in help folder. If you find any error/bug, please email to contact@softianz.com with details. You can send us your valued suggestions/feedback too.</p>', '2014-08-15 13:00:57', '2015-01-01 00:00:00', '2017-01-01 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

CREATE TABLE `sma_order_ref` (
  `ref_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT 1,
  `qu` int(11) NOT NULL DEFAULT 1,
  `po` int(11) NOT NULL DEFAULT 1,
  `to` int(11) NOT NULL DEFAULT 1,
  `pos` int(11) NOT NULL DEFAULT 1,
  `do` int(11) NOT NULL DEFAULT 1,
  `pay` int(11) NOT NULL DEFAULT 1,
  `re` int(11) NOT NULL DEFAULT 1,
  `rep` int(11) NOT NULL DEFAULT 1,
  `ex` int(11) NOT NULL DEFAULT 1,
  `ppay` int(11) NOT NULL DEFAULT 1,
  `qa` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2015-03-01', 2, 1, 1, 1, 3, 1, 4, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

CREATE TABLE `sma_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT 0.0000,
  `pos_balance` decimal(25,4) DEFAULT 0.0000,
  `approval_code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_payments`
--

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`) VALUES
(1, '2024-10-18 08:27:00', 1, NULL, NULL, 'IPAY2024/10/0001', NULL, 'cash', '', '', '', '', '', 'Visa', 200.0000, NULL, 1, NULL, 'received', '', 0.0000, 0.0000, NULL),
(2, '2024-10-25 00:10:00', 2, NULL, NULL, '3123', NULL, 'Cheque', '3121231', '', '', '', '', 'Visa', 2500.0000, NULL, 1, NULL, 'received', '', 0.0000, 0.0000, NULL),
(3, '2024-10-24 15:15:37', 3, NULL, NULL, 'IPAY2024/10/0002', NULL, 'cash', '', '', '', '', '', '', 200.0000, NULL, 1, NULL, 'received', '', 500.0000, 300.0000, NULL),
(4, '2024-10-26 15:32:28', 4, NULL, NULL, 'IPAY2024/10/0003', NULL, 'cash', '', '', '', '', '', '', 221.2000, NULL, 1, NULL, 'received', '', 500.0000, 278.8000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

CREATE TABLE `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT 2.0000,
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT 3.9000,
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT 4.4000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', 0.0000, 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

CREATE TABLE `sma_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT 0,
  `products-add` tinyint(1) DEFAULT 0,
  `products-edit` tinyint(1) DEFAULT 0,
  `products-delete` tinyint(1) DEFAULT 0,
  `products-cost` tinyint(1) DEFAULT 0,
  `products-price` tinyint(1) DEFAULT 0,
  `quotes-index` tinyint(1) DEFAULT 0,
  `quotes-add` tinyint(1) DEFAULT 0,
  `quotes-edit` tinyint(1) DEFAULT 0,
  `quotes-pdf` tinyint(1) DEFAULT 0,
  `quotes-email` tinyint(1) DEFAULT 0,
  `quotes-delete` tinyint(1) DEFAULT 0,
  `sales-index` tinyint(1) DEFAULT 0,
  `sales-add` tinyint(1) DEFAULT 0,
  `sales-edit` tinyint(1) DEFAULT 0,
  `sales-pdf` tinyint(1) DEFAULT 0,
  `sales-email` tinyint(1) DEFAULT 0,
  `sales-delete` tinyint(1) DEFAULT 0,
  `purchases-index` tinyint(1) DEFAULT 0,
  `purchases-add` tinyint(1) DEFAULT 0,
  `purchases-edit` tinyint(1) DEFAULT 0,
  `purchases-pdf` tinyint(1) DEFAULT 0,
  `purchases-email` tinyint(1) DEFAULT 0,
  `purchases-delete` tinyint(1) DEFAULT 0,
  `transfers-index` tinyint(1) DEFAULT 0,
  `transfers-add` tinyint(1) DEFAULT 0,
  `transfers-edit` tinyint(1) DEFAULT 0,
  `transfers-pdf` tinyint(1) DEFAULT 0,
  `transfers-email` tinyint(1) DEFAULT 0,
  `transfers-delete` tinyint(1) DEFAULT 0,
  `customers-index` tinyint(1) DEFAULT 0,
  `customers-add` tinyint(1) DEFAULT 0,
  `customers-edit` tinyint(1) DEFAULT 0,
  `customers-delete` tinyint(1) DEFAULT 0,
  `suppliers-index` tinyint(1) DEFAULT 0,
  `suppliers-add` tinyint(1) DEFAULT 0,
  `suppliers-edit` tinyint(1) DEFAULT 0,
  `suppliers-delete` tinyint(1) DEFAULT 0,
  `sales-deliveries` tinyint(1) DEFAULT 0,
  `sales-add_delivery` tinyint(1) DEFAULT 0,
  `sales-edit_delivery` tinyint(1) DEFAULT 0,
  `sales-delete_delivery` tinyint(1) DEFAULT 0,
  `sales-email_delivery` tinyint(1) DEFAULT 0,
  `sales-pdf_delivery` tinyint(1) DEFAULT 0,
  `sales-gift_cards` tinyint(1) DEFAULT 0,
  `sales-add_gift_card` tinyint(1) DEFAULT 0,
  `sales-edit_gift_card` tinyint(1) DEFAULT 0,
  `sales-delete_gift_card` tinyint(1) DEFAULT 0,
  `pos-index` tinyint(1) DEFAULT 0,
  `sales-return_sales` tinyint(1) DEFAULT 0,
  `reports-index` tinyint(1) DEFAULT 0,
  `reports-warehouse_stock` tinyint(1) DEFAULT 0,
  `reports-quantity_alerts` tinyint(1) DEFAULT 0,
  `reports-expiry_alerts` tinyint(1) DEFAULT 0,
  `reports-products` tinyint(1) DEFAULT 0,
  `reports-daily_sales` tinyint(1) DEFAULT 0,
  `reports-monthly_sales` tinyint(1) DEFAULT 0,
  `reports-sales` tinyint(1) DEFAULT 0,
  `reports-payments` tinyint(1) DEFAULT 0,
  `reports-purchases` tinyint(1) DEFAULT 0,
  `reports-profit_loss` tinyint(1) DEFAULT 0,
  `reports-customers` tinyint(1) DEFAULT 0,
  `reports-suppliers` tinyint(1) DEFAULT 0,
  `reports-staff` tinyint(1) DEFAULT 0,
  `reports-register` tinyint(1) DEFAULT 0,
  `sales-payments` tinyint(1) DEFAULT 0,
  `purchases-payments` tinyint(1) DEFAULT 0,
  `purchases-expenses` tinyint(1) DEFAULT 0,
  `products-adjustments` tinyint(1) NOT NULL DEFAULT 0,
  `bulk_actions` tinyint(1) NOT NULL DEFAULT 0,
  `customers-deposits` tinyint(1) NOT NULL DEFAULT 0,
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT 0,
  `products-barcode` tinyint(1) NOT NULL DEFAULT 0,
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT 0,
  `reports-expenses` tinyint(1) NOT NULL DEFAULT 0,
  `reports-daily_purchases` tinyint(1) DEFAULT 0,
  `reports-monthly_purchases` tinyint(1) DEFAULT 0,
  `products-stock_count` tinyint(1) DEFAULT 0,
  `edit_price` tinyint(1) DEFAULT 0,
  `returns-index` tinyint(1) DEFAULT 0,
  `returns-add` tinyint(1) DEFAULT 0,
  `returns-edit` tinyint(1) DEFAULT 0,
  `returns-delete` tinyint(1) DEFAULT 0,
  `returns-email` tinyint(1) DEFAULT 0,
  `returns-pdf` tinyint(1) DEFAULT 0,
  `reports-tax` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`, `returns-index`, `returns-add`, `returns-edit`, `returns-delete`, `returns-email`, `returns-pdf`, `reports-tax`) VALUES
(1, 5, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

CREATE TABLE `sma_pos_register` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2024-07-02 10:23:55', 1, 100.0000, 'close', 300.0000, 0, 0, 300.0000, 0, 0, '', '2024-10-17 23:37:11', NULL, 1),
(2, '2024-10-17 23:37:55', 1, 500.0000, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

CREATE TABLE `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT 1,
  `paypal_pro` tinyint(1) DEFAULT 0,
  `stripe` tinyint(1) DEFAULT 0,
  `rounding` tinyint(1) DEFAULT 0,
  `char_per_line` tinyint(4) DEFAULT 42,
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.5.2',
  `after_sale_page` tinyint(1) DEFAULT 0,
  `item_order` tinyint(1) DEFAULT 0,
  `authorize` tinyint(1) DEFAULT 0,
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT 1,
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT 0,
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `customer_details`, `local_printers`) VALUES
(1, 22, 20, 1, 1, 3, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', 'BIXOLON SRP-350II', 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 1, 'BIXOLON SRP-350II, BIXOLON SRP-350II', 0, 'default', 1, 0, 0, 0, 42, NULL, 'purchase_code', 'envato_username', '3.5.2', 0, 0, 0, NULL, 1, NULL, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_price_groups`
--

CREATE TABLE `sma_price_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_price_groups`
--

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `sma_printers`
--

CREATE TABLE `sma_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

CREATE TABLE `sma_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT 20.0000,
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT 0.0000,
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT 1,
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT 0,
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT 0,
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `hsn_code` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `hide` tinyint(1) NOT NULL DEFAULT 0,
  `second_name` varchar(255) DEFAULT NULL,
  `hide_pos` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `hsn_code`, `views`, `hide`, `second_name`, `hide_pos`) VALUES
(1, '63980977', 'Bread', 1, 2.0000, 3.0000, 5.0000, '2be5d27ee6c920d963cf17ea6340d811.png', 5, NULL, '', '', '', '', '', '', -4.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 2, 80.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '12345678', NULL, NULL, NULL, NULL, 1, 1, 1, 'bread', 1, 0.0000, NULL, 0, 0, '', 0),
(2, '47129389', 'Bun', 1, 2.0000, 3.0000, 5.0000, '70a99053835678c312baf12f4229b4de.png', 5, NULL, '', '', '', '', '', '', -100.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 2, 70.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '87654321', NULL, NULL, NULL, NULL, 0, 0, 1, 'bun', 1, 0.0000, NULL, 0, 0, '', 0),
(3, '80666128', 'Sandwiches', 1, 80.0000, 100.0000, 0.0000, '4c121699359587f77c46c34e17d3a026.png', 1, NULL, '', '', '', '', '', '', -100.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1, '80666128', 1, 0.0000, NULL, 0, 0, '', 0),
(4, '49360124', 'Zinger Burger', 1, 180.0000, 200.0000, 0.0000, '4bfe32a92b4c4e0f45ff481d849aa5b3.png', 1, NULL, '', '', '', '', '', '', -1.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 1, 'zinger-burger', 1, 0.0000, NULL, 0, 0, '', 0),
(5, '70541989', 'Chinese Rice', 1, 10.0000, 13.0000, 5.0000, 'cfa9ae93bc172c6a78bc40049c9788cf.png', 4, NULL, '', '', '', '', '', '', 0.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 2, 80.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 1, 'chinese-rice', 1, 0.0000, NULL, 0, 0, '', 0),
(6, '43579937', 'BBQ Beef Brisket', 1, 15.0000, 18.0000, 5.0000, '1305a7738a64839ddaf36361a98c6844.png', 2, NULL, '', '', '', '', '', '', 0.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 2, 70.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1, '43579937', 1, 0.0000, NULL, 0, 0, '', 0),
(7, '18038135', 'Oven BBQ Chicken', 1, 15.0000, 18.0000, 5.0000, 'aa92e889d1486887496e7ac39d752aca.png', 2, NULL, '', '', '', '', '', '', 0.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 2, 70.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1, '18038135', 1, 0.0000, NULL, 0, 0, '', 0),
(8, '80475577', 'Strawberry Pink Drink', 1, 3.0000, 5.0000, 5.0000, '2e86242b67cdb162947dc4a56428a73c.png', 3, NULL, '', '', '', '', '', '', 0.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 2, 70.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1, 'strawberry-pink-drink', 1, 0.0000, NULL, 0, 0, '', 0),
(9, '28112823', 'Mango Milkshake', 1, 3.0000, 5.0000, 5.0000, 'b5869151c4103178bc17bdad297099be.png', 3, NULL, '', '', '', '', '', '', 0.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 2, 70.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1, 'mango-milkshake', 1, 0.0000, NULL, 0, 0, '', 0),
(10, '95743393', 'Oven BBQ Chicken II', 1, 15.5000, 18.5000, 5.0000, '7b62c391f2e33597f11c4f32323119d9.png', 2, NULL, '', '', '', '', '', '', 0.0000, 1, 1, '', NULL, 'code128', '', '', 1, 'standard', 2, 70.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 1, '95743393', 1, 0.0000, NULL, 0, 0, '', 0),
(11, '1', 'Beef Burger', 1, 10.0000, 20.0000, 0.0000, '219e1a6242ba407810fe1b5d7439465e.jpg', 1, NULL, '', '', '', '', '', '', -1.0000, 3, 0, '', NULL, 'code128', '', '', 1, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 1, 1, 0, 'beef-burger', NULL, 0.0000, NULL, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

CREATE TABLE `sma_product_photos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_product_photos`
--

INSERT INTO `sma_product_photos` (`id`, `product_id`, `photo`) VALUES
(1, 3, 'f820553bc97046c56cec68a0ffd2d584.png'),
(2, 4, '89d6b1f4f73f7e5a23db88f2d4f88c62.png'),
(3, 1, '2444cf76742f86a0750db3545ffa230d.png'),
(4, 2, 'b0299848c54d4d911047771e3ee6a920.png'),
(5, 5, '1f7af15fd9381a11c92db5ebe6fd8b05.png'),
(6, 6, '059fd76c6220c0f56f49e40af4d266d1.png'),
(7, 7, '843de33542ab8a436b1370d838ce20a6.png'),
(8, 8, '937d6ad7136fe2e9c62ea0fea2328b53.png'),
(9, 9, '2612e31bdf1c64699e4d6d94420b9e5b.png');

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_prices`
--

CREATE TABLE `sma_product_prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

CREATE TABLE `sma_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_promos`
--

CREATE TABLE `sma_promos` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `product2buy` int(11) NOT NULL,
  `product2get` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

CREATE TABLE `sma_purchases` (
  `id` int(11) NOT NULL,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

CREATE TABLE `sma_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT 0.0000,
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `base_unit_cost` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `gst`, `cgst`, `sgst`, `igst`, `base_unit_cost`) VALUES
(1, NULL, NULL, 1, '', '', NULL, 0.0000, 0.0000, 1, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, -4.0000, '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, 2, '', '', NULL, 0.0000, 0.0000, 1, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, -100.0000, '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, 3, '', '', NULL, 0.0000, 0.0000, 1, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, -100.0000, '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, 4, '', '', NULL, 0.0000, 0.0000, 1, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, -1.0000, '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, 11, '', '', NULL, 0.0000, 0.0000, 1, 0.0000, NULL, NULL, NULL, NULL, NULL, 0.0000, -1.0000, '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

CREATE TABLE `sma_quotes` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

CREATE TABLE `sma_quote_items` (
  `id` int(11) NOT NULL,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_returns`
--

CREATE TABLE `sma_returns` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT 0.0000,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_return_items`
--

CREATE TABLE `sma_return_items` (
  `id` int(11) NOT NULL,
  `return_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

CREATE TABLE `sma_sales` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT 0.0000,
  `order_discount` decimal(25,4) DEFAULT 0.0000,
  `product_tax` decimal(25,4) DEFAULT 0.0000,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT 0.0000,
  `total_tax` decimal(25,4) DEFAULT 0.0000,
  `shipping` decimal(25,4) DEFAULT 0.0000,
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT 0,
  `paid` decimal(25,4) DEFAULT 0.0000,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT 0,
  `shop` tinyint(1) DEFAULT 0,
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `manual_payment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL,
  `payment_method` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_sales`
--

INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `attachment`, `return_sale_ref`, `sale_id`, `return_sale_total`, `rounding`, `suspend_note`, `api`, `shop`, `address_id`, `reserve_id`, `hash`, `manual_payment`, `cgst`, `sgst`, `igst`, `payment_method`) VALUES
(1, '2024-10-18 08:27:00', 'SALE2024/10/0001', 1, 'Walk-in Customer', 3, 'Test Biller', 1, '', '', 200.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 200.0000, 'completed', 'paid', 0, NULL, 1, NULL, NULL, 2, 0, 200.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 0, NULL, NULL, 'c9ab0f7e2ed4501d24bdb27b813aa1d0512fa2e32f6b6ab55490bd7e2a07ccc6', NULL, NULL, NULL, NULL, NULL),
(2, '2024-10-25 00:10:00', '12312', 1, 'Softianz', 3, 'Digitrillion', 1, '', '', 10300.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 10300.0000, 'completed', 'due', 0, NULL, 1, NULL, NULL, 200, 0, 2500.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, NULL, NULL, 0, 0, NULL, NULL, '8c5f7b7ce72e2f52b9e26cb5ea744c3407304a323f40c51f6c89c1f1204fb419', NULL, NULL, NULL, NULL, NULL),
(3, '2024-10-24 15:15:37', 'SALE/POS2024/10/0001', 1, 'Softianz', 3, 'Digitrillion', 1, '', '', 200.0000, 0.0000, '', 0.0000, 0.0000, 0.0000, 1, 0.0000, 0.0000, 0.0000, 200.0000, 'completed', 'paid', 0, NULL, 1, NULL, NULL, 2, 1, 200.0000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, NULL, 0, 0, NULL, NULL, '1b1e1860b9dac326faa7c6a0158fc1711d728a23e353be0c2179e028f803f8d1', NULL, NULL, NULL, NULL, NULL),
(4, '2024-10-26 15:32:28', 'SALE/POS2024/10/0002', 1, 'Softianz', 3, 'Digitrillion', 1, '', '', 220.0000, 0.0000, '', 0.0000, 0.0000, 1.2000, 1, 0.0000, 1.2000, 0.0000, 221.2000, 'completed', 'paid', 0, NULL, 1, NULL, NULL, 2, 1, 221.2000, NULL, 0.0000, NULL, NULL, NULL, 0.0000, 0.0000, NULL, 0, 0, NULL, NULL, '28896d2af8ee53b32ff38ee54815f9ca79daac440a1abf62fa6201fa368b588f', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

CREATE TABLE `sma_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_sale_items`
--

INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `sale_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `comment`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(1, 1, 1, '63980977', 'Product 1', 'standard', NULL, 100.0000, 100.0000, 2.0000, 1, 0.0000, 1, '0', '0', 0.0000, 200.0000, '', 100.0000, NULL, 1, 'unit1', 2.0000, NULL, NULL, NULL, NULL, NULL),
(2, 2, 2, '47129389', 'Bun', 'standard', NULL, 3.0000, 3.0000, 100.0000, 1, 0.0000, 1, '0', '0', 0.0000, 300.0000, '', 3.0000, NULL, 1, 'kg', 100.0000, NULL, NULL, NULL, NULL, NULL),
(3, 2, 3, '80666128', 'Sandwiches', 'standard', NULL, 100.0000, 100.0000, 100.0000, 1, 0.0000, 1, '0', '0', 0.0000, 10000.0000, '', 100.0000, NULL, 1, 'kg', 100.0000, NULL, NULL, NULL, NULL, NULL),
(4, 3, 1, '63980977', 'Product 1', 'standard', 0, 100.0000, 100.0000, 2.0000, 1, 0.0000, 1, '0', '0', 0.0000, 200.0000, '', 100.0000, NULL, 1, 'kg', 2.0000, '', NULL, NULL, NULL, NULL),
(5, 4, 4, '49360124', 'Zinger Burger', 'standard', 0, 200.0000, 200.0000, 1.0000, 1, 0.0000, 1, '0', '0', 0.0000, 200.0000, '', 200.0000, NULL, 1, 'kg', 1.0000, '', NULL, NULL, NULL, NULL),
(6, 4, 11, '1', 'Beef Burger', 'standard', 0, 20.0000, 21.2000, 1.0000, 1, 1.2000, 3, '6%', '0', 0.0000, 21.2000, '', 20.0000, NULL, 1, 'kg', 1.0000, '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

CREATE TABLE `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('00o7rvcjdcpm1m9soi3e13mmgrov1pi2', '110.38.243.176', 1736431726, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733363433313732363b),
('04i115k3kp11laq6b4ar8atdsht7cph0', '110.38.243.192', 1737985737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733373938353733373b),
('04m0g344mbmft3jfggncbqg38k7eu6j8', '110.38.244.77', 1733323326, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733333332333332363b),
('09mhfp5ipnvgn2tvhpr77l7tjemjde78', '54.36.148.227', 1748895965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734383839353936353b),
('0egg5bq09a6gheop359li7se94dee01l', '110.38.243.26', 1738181807, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733383138313830373b),
('0f7pd20k2q560reb6p51v5ac4et9ivoe', '54.36.149.52', 1737853076, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733373835333037363b6572726f727c4e3b),
('0ms8jin98b64g4losrvrfe7r5ou64ene', '110.38.243.176', 1736260605, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733363236303630353b),
('16i1mrcv9ilr42j1ugbc3ogdakh3738s', '202.59.15.72', 1730818062, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733303831383036323b),
('1fqugpr8b8red8d3gspgvm4558hgl2k2', '110.38.243.38', 1738589822, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733383538393832323b),
('1v8sgt8m7i35qb7bqb2geshu4khp9frh', '202.59.15.72', 1730126107, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733303132363031383b),
('23fpisv94l3noh98fj3g2di112but1qs', '20.171.207.122', 1749103137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734393130333133373b),
('26bdht6rrt2n5fvivdkl6s316vi6859t', '110.38.244.162', 1740594989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303539343938393b),
('29iaaukqb2cbdovjt73e4hrv15ddqppb', '70.31.147.81', 1729970448, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732393937303434383b6964656e746974797c733a383a22736f667469616e7a223b757365726e616d657c733a383a22736f667469616e7a223b656d61696c7c733a32303a22636f6e7461637440736f667469616e7a2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373239393436303332223b6c6173745f69707c733a31313a2233392e35312e31342e3338223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313732393937303331393b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d31302d31372032333a33373a3535223b),
('2ecn6ab3kdddd0ctqe87j4h69lapkgju', '110.38.243.180', 1741185641, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313138353634313b),
('2hh0fe665ri0a9lin9bcenhufcl57j6e', '110.38.244.227', 1733242616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733333234323631363b),
('2l9k9tam9287grt9mcr1ve3vgtl07206', '193.56.22.61', 1751983972, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735313938333937323b),
('2nrj9jb8t4gmc00v9ij2dbja7k1dm9i5', '110.38.243.109', 1737120395, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733373132303339353b),
('2rp83bqo48mcn4jbelutbsqnab8lrkl8', '54.36.149.97', 1739121725, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393132313732353b),
('2ui7jp71q1mkd919gvmcl7n5sidvq59c', '174.94.30.180', 1749742945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734393734323934353b),
('333taq78aah4aju4kbnj7llhjtqjt3nk', '202.59.15.73', 1732214939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733323231343933393b),
('33h0snoasjavvrtbidutlc5m4ed7ajvc', '110.38.243.1', 1741616504, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313631363530343b),
('35ccrgfrq6ej50rkj2pjk1kpg8fqccoh', '207.46.13.31', 1744363052, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343336333034323b6572726f727c4e3b),
('3birflt207ukdl3bpithi2o7ebf8flqm', '2001:4860:7:802::ff', 1752259869, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735323235393836383b),
('3cl0qaatla5bl0qun5ahrco9gia7jmgm', '202.59.15.73', 1732592589, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733323539323538393b),
('3fb9j40c8ujh1he8qn3mjpevbcm9gjfn', '66.249.64.36', 1752884967, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735323838343936373b),
('3hfvdgdcru5ti50fp8onmskl7v8agab6', '54.36.149.32', 1742463292, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734323436333239323b6572726f727c4e3b),
('3jrm8d75hkvc5bimi9i0c371f54aq02d', '58.27.225.4', 1738849709, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733383834393730393b),
('3mpe6tq2prft21rggsk5qgvg36gp99j8', '54.36.149.55', 1739146823, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393134363832333b),
('3non3jpud6vq9atb2f3gppmohs86m6i1', '54.203.242.6', 1729864737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732393836343733373b),
('46ds6hsdk9hf9vud62uh955lfpqbtijp', '202.59.15.72', 1730901473, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733303930313437333b),
('47vq766tst7mdqfn9ufr84o7vm55efia', '110.38.243.22', 1735825968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733353832353936383b),
('48s0m6c8rmuscqvsqe1fbaoatjaekv5v', '39.51.16.234', 1732019033, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733323031393033333b7265717565737465645f706167657c733a353a2261646d696e223b),
('4auv5j8fdethuiuq7cts41k27ki7c4tk', '51.222.253.14', 1745603846, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734353630333834363b),
('4p1aq1bfqiilbo7o1iiu2j2r9lnv7q3s', '35.155.66.123', 1741897914, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313839373931343b),
('4phrc5q998pspnm6h5uhr8l21nghflkk', '70.31.147.81', 1729970141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732393937303134313b6964656e746974797c733a383a22736f667469616e7a223b757365726e616d657c733a383a22736f667469616e7a223b656d61696c7c733a32303a22636f6e7461637440736f667469616e7a2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373239393436303332223b6c6173745f69707c733a31313a2233392e35312e31342e3338223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313732393936393932373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d31302d31372032333a33373a3535223b),
('564ukkipfgv6r5nffjp9cms5upv5so02', '110.38.244.162', 1740753759, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303735333735393b),
('57q610rprktgnsg0iufb7ib7rm8lnio4', '110.38.244.45', 1743085276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333038353237363b),
('585cok58khi63rk8e2p84jbr303h6fbu', '110.38.243.1', 1741705572, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313730353337363b),
('59ljhu1s8eriecjku6hm19ig80bd1ohv', '54.203.242.6', 1729864738, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732393836343733383b),
('5g8gdh605ublfkkcb69v1go6pce19jme', '110.38.244.162', 1740769255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303736393235353b),
('5hibmr4goahfljeog8svroe3gseg9pg0', '39.51.0.126', 1730022774, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733303032323737343b6964656e746974797c733a383a22736f667469616e7a223b757365726e616d657c733a383a22736f667469616e7a223b656d61696c7c733a32303a22636f6e7461637440736f667469616e7a2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373239393639373936223b6c6173745f69707c733a31323a2237302e33312e3134372e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('5mgj8vb87evchmskvnp0iq6ae6vn4a02', '110.38.243.1', 1741876817, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313837363831363b),
('5mh84tn6qe3l79cjtjutj17hufpt9n6u', '110.38.243.121', 1734017239, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733343031373233393b),
('5mtktn3o34tr1181ffv330704oupno1c', '110.38.244.227', 1733234409, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733333233343430393b),
('5so3eu4ado2c67vvvc1l0kptev85sigp', '110.38.243.176', 1736353589, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733363335333538393b),
('5tlji0dp3o3cpp2g0u4aljj81f050upb', '70.31.147.81', 1729973932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732393937333930313b6964656e746974797c733a383a22736f667469616e7a223b757365726e616d657c733a383a22736f667469616e7a223b656d61696c7c733a32303a22636f6e7461637440736f667469616e7a2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373239393436303332223b6c6173745f69707c733a31313a2233392e35312e31342e3338223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313732393937313134383b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d31302d31372032333a33373a3535223b72656d6f76655f706f736c737c693a313b),
('5v7e5r87fqrpuu2nv66nbnofvo20pq9t', '34.78.49.210', 1751983971, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735313938333937313b),
('64ebodnlnokk1ldjcta2lo8s1vfg0519', '202.59.15.72', 1730024490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733303032343439303b),
('654mmpgo8ap9ln6j11fklk5dmilhvo4f', '20.171.207.192', 1739501268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393530313236383b),
('6auaom4eu4e4g0guduq0mtsfrhi6sjq5', '110.38.244.254', 1734703668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733343730333636383b),
('6chqqoeiu6t8cq28gde4fjrn7io1b03c', '38.75.72.234', 1750046276, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735303034363237363b),
('6fhjeu0goom8vl8diprhrba2oai43sig', '54.36.149.42', 1748553616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734383535333631363b),
('6fo08pnv6iesmbgp2juqmjk30v1hbvsg', '110.38.244.104', 1736892718, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733363839323731383b),
('6gn92plta8lo2q4qt8ed2o5t87b7bln2', '2a02:4780:11:15::2', 1729864729, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732393836343732363b7265717565737465645f706167657c733a353a2261646d696e223b),
('6kmjqk41mta36tub6jikg1t4gkmaqal3', '202.59.15.73', 1732286295, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733323238363239353b),
('6pjvq1jndr53e2c23lb4fv1c9lmv92hj', '110.38.243.71', 1742222043, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734323232323034333b),
('702piu37ueesgaceo1g3nkj7lv7p5od0', '110.38.244.162', 1740663593, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303636333539333b),
('7265p9p9a5pcavct60ehb46cua9o6l7g', '110.38.243.156', 1738849707, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733383834393730373b),
('72pdf8jh4fg3j6m9t673qeeu2tt7tq3e', '110.38.243.178', 1738089302, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733383038393330323b),
('7dbl3gk4pbbvl0rj32gbj7si15206rvh', '110.38.244.162', 1740594989, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303539343938393b),
('7h7kif096k9829ktmkdflh706krn4c0d', '52.167.144.191', 1743534481, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333533343438313b),
('7ht7fambtd5ue5st7htgb6d54g3o2cqn', '202.59.15.72', 1730981160, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733303938313136303b),
('7j66h0p3vue4rvgkph0hovdasrcmtsen', '151.248.84.183', 1740043508, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303034333530383b),
('7mbs4jjfsh396gup77cqtdqvggsq2m2i', '110.38.243.84', 1737560780, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733373536303738303b),
('7n0ig1ms169s6cfit7oklukcnrd1773q', '110.38.243.26', 1738257624, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733383235373632343b),
('7o42j4nvgj38e5aeabtoijqh78te12j4', '110.38.243.22', 1735654613, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733353635343631333b),
('7qa4bfnrs6lql7ik0r65brfr6tu6cvgt', '110.38.243.178', 1737985737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733373938353733373b),
('8098gjgb7o6r3dlalkgekpun8k4cm97i', '2001:4860:7:806::f7', 1751773165, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735313737333136353b),
('887v7rrvjonb0n7nofmnnvdelhs9h58h', '202.59.15.73', 1731513406, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733313531333430363b),
('88e0nm6a3q64ee3kdflk5jl7b0vr10ag', '202.59.15.73', 1732487095, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733323438373039353b),
('8f0d5p0djokh7p37i2g4u8emsjr6upb9', '110.38.244.8', 1742827189, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734323832373138393b),
('8iq7hffi9dkn61pjtt1h29rgib1flq00', '110.38.244.104', 1736892718, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733363839323731383b),
('8n0ped5cgojlog9jl6nptda0polvsp39', '110.38.243.176', 1736176229, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733363137363232393b),
('8qgv22ch814p97hjojnl5s6glia5o0ko', '66.249.70.5', 1750465290, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735303436353238383b7265717565737465645f706167657c733a353a2261646d696e223b),
('8sits82keb2504373cltsnkbuhtbvd55', '139.171.120.3', 1742007475, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734323030373437353b),
('98kkoqibadsnupo7rss89olk53u56qp2', '110.38.244.162', 1739799651, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393739393635313b),
('9e3dbtmsdpajdkoe5cudbnimubf548ml', '54.36.148.162', 1746899605, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363839393630353b),
('9eepaki1tmpi2agr3rqdptun4gur9h87', '70.31.147.81', 1729973901, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732393937333930313b6964656e746974797c733a383a22736f667469616e7a223b757365726e616d657c733a383a22736f667469616e7a223b656d61696c7c733a32303a22636f6e7461637440736f667469616e7a2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373239393436303332223b6c6173745f69707c733a31313a2233392e35312e31342e3338223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313732393937313134383b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d31302d31372032333a33373a3535223b72656d6f76655f706f736c737c693a313b),
('9lvlpqagj7q1achjv6vlfp4mo09u3n7b', '202.59.15.73', 1731526760, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733313532363634373b),
('9mkci6v3m3trmfvkp91ohs8g3t6fh60j', '20.171.207.97', 1752016367, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735323031363239373b7265717565737465645f706167657c733a353a2261646d696e223b),
('9t0vamjms0qs91c4ngg601m5rlvusd82', '2001:4860:7:406::ce', 1751269712, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735313236393731323b),
('9t684mq0alfp950lvjjto3j3eatpf1o4', '39.50.180.4', 1732120379, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733323132303337393b),
('9v3tcbloc8s1stfou9ltgl3m8is6gomk', '2001:4860:7:505::ce', 1750605184, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735303630353138343b),
('a5cokd5ck5g7s4shseoq4vkj7dktvdeq', '110.38.243.114', 1742913711, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734323931333731313b),
('a5hk8romcm12acmt9gpuukh0960s73b6', '23.110.171.165', 1738662218, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733383636323231383b),
('aapvctrv68mvlnulic3dvsfdflf4isva', '110.38.243.180', 1741270330, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313237303333303b),
('ajgtsqk0ohb95qmd8jtcen0v3ih3r9si', '66.249.64.41', 1748535588, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734383533353538383b7265717565737465645f706167657c733a353a2261646d696e223b),
('ajir8i7aq5t4moe1a4m3n0mv689p5la8', '54.36.149.81', 1747441447, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734373434313434373b),
('asa6l6rgtf5knfhpqn9jj3i52gspsbvf', '110.38.244.226', 1735047998, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733353034373939383b),
('aso6tt5aqgfj1raqj21b6kq8vcfd6gfj', '202.59.15.73', 1731328867, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733313332383836373b),
('b1gjmb97hjaao7cmb75gt7ghlf0co8a1', '110.38.244.1', 1735221138, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733353232313133383b),
('b64n6cejrnok3puashsmujde7p33qs6i', '110.38.243.121', 1734097654, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733343039373635343b),
('b8kddc3s2qrc6teopd43li2sec0bo61e', '54.203.242.6', 1729864738, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732393836343733383b),
('b97t6g8g9qprvka08umujp8rtgl73i8q', '110.38.244.162', 1740492540, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303439323534303b),
('bhm8gun60ercisra8na6gragpvu5udej', '72.255.58.255', 1752894338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735323839343330333b7265717565737465645f706167657c733a353a2261646d696e223b6572726f727c733a33373a223c703e4c6f67696e204661696c65642c20506c656173652074727920616761696e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('binudhi3gpleh2qg46i33qjqv8ev6qep', '110.38.244.162', 1739455050, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393435353035303b),
('bpd4ntqhhmk6olvt83pvc97cemqhs00t', '54.36.149.51', 1752019966, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735323031393936363b),
('bs0t3it7te1s5vc2vejahdst328vmbq6', '202.59.15.73', 1732296856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733323239363835363b),
('bvnnfgbnthjqvctjtbkpntpm8mm96cnf', '70.24.157.242', 1731810500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733313831303530303b6964656e746974797c733a383a22736f667469616e7a223b757365726e616d657c733a383a22736f667469616e7a223b656d61696c7c733a32303a22636f6e7461637440736f667469616e7a2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373330313439373438223b6c6173745f69707c733a31323a2233392e35312e34322e313833223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('c47ljoecvt8a3v9tg373kv7rnevvjl3f', '110.38.244.186', 1735563187, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733353536333138373b),
('cdd47i9217b6cuo35a758ndfkgeet0a3', '202.59.15.73', 1731681093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733313638313039333b),
('cfcdi3m8ctbqrvjuplei5ovml03lb0tf', '54.36.148.254', 1743957826, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333935373832363b),
('cid7bie1llbsh8pubmvpbe2t1mf99epr', '54.36.149.22', 1749646689, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734393634363638393b),
('ckngr3jjce6jtcuvckfdk9tjr5325l39', '110.38.244.162', 1739894869, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393839343836393b),
('d1f6p5ifmur5ncmk1213t1p9vmmnv335', '110.38.244.37', 1733398849, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733333339383834393b),
('da8o23bb8uba2tu8mm5jfmbbvcq3thts', '142.91.118.169', 1752046051, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735323034363035313b),
('dba2tvk63qtf0hpdcb2nrabmk8duq3gi', '174.94.30.180', 1749742945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734393734323934353b),
('df1q235jeff8ef8pttmi5l9ev7lego5u', '110.38.244.162', 1740061351, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303036313335313b),
('dfumbqftte40idj0m1fq5qifkvs6jptu', '110.38.243.156', 1739294981, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393239343938313b),
('dgim2gpbv5cnufmnbnk1hafckvmod9tl', '207.46.13.154', 1744845893, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343834353839333b),
('dhou6e8crk2u6988oa4oaiir633h65u6', '110.38.244.23', 1735237202, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733353233373230323b),
('dj8noqnv4rl5eju7o7ref9cpeku55vop', '2001:4860:7:402::f5', 1752596363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735323539363332393b),
('dmeard1gi2sjlrp32ihiqrrdur2dc53m', '110.38.243.1', 1741806534, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313830363533343b),
('dn27h35k835hrdldnrbhsml3m3410067', '110.38.243.107', 1733931342, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733333933313334323b),
('dnaqc0rq0it0p7pld2umivrhmrbp7bjb', '20.171.207.150', 1739226478, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393232363437383b),
('dr0vvo8vsfeum9f8j8bi9547hc55mc84', '40.77.167.4', 1747182965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734373138323936353b),
('e0uioedn5qq5tecsn8aas3agbjl8v5aa', '110.38.243.1', 1741789091, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313738393039313b),
('e1b4p8iaq1p2akldh75rbtfrbk3ueav8', '54.36.149.7', 1752741518, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735323734313531383b),
('e5rjgro7liia0u9124rq3dvde22p2uq1', '66.249.72.6', 1748515470, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734383531353437303b),
('e7gd6elt531fqlef8lnuubp4cvh3bbd7', '39.51.42.183', 1730149781, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733303134393731303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a383a22736f667469616e7a223b757365726e616d657c733a383a22736f667469616e7a223b656d61696c7c733a32303a22636f6e7461637440736f667469616e7a2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373330303231313131223b6c6173745f69707c733a31313a2233392e35312e302e313236223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313733303134393738313b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d31302d31372032333a33373a3535223b),
('e9h0qae9u8liqfrc732un3cnil4f9v8v', '110.38.244.8', 1742491605, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734323439313630353b),
('edkji002mgdhsu9fmpl1ce8qkd6p1rui', '110.38.244.234', 1741098850, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313039383835303b),
('eghpokdr37kgpp7cd599gomkle7s5kug', '54.36.149.10', 1742320461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734323332303436313b),
('enkh3vq2voq9a5rbm9ea3gm74mqssibo', '184.154.76.11', 1746666904, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363636363930343b),
('es3vjov92o3e0h7g4m7k9qo4s7iicvs6', '110.38.243.96', 1733406951, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733333430363935313b),
('esl5od35vtg2u3tqcdfviflgd8e55jgl', '110.38.243.71', 1742308547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734323330383534373b),
('f0oh2u2mjd1as6jorf2c29lld8bkuje5', '20.171.207.178', 1744921886, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343932313838363b),
('f1v7uih9p8a18n4bdg60g132ufo7q3kd', '110.38.243.176', 1736631616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733363633313631363b),
('f212p6d4tc2p27asqrs9hodm0gqs2i53', '51.222.253.4', 1748182304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734383138323330343b6572726f727c4e3b),
('fari3srp4t3eaa0rd3s9repe1u16a7ts', '202.59.15.72', 1729961550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732393936313535303b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b),
('fbrrec3g8cv03c1crn7a4ohku1oojd15', '66.249.70.7', 1750595826, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735303539353832353b7265717565737465645f706167657c733a353a2261646d696e223b),
('fk40h3neb3ud695fq3fbsin19vset39c', '110.38.244.162', 1740682335, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303638323333353b),
('flqeir00sirnep43n2suidel1u7qmmec', '70.31.147.81', 1729971118, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732393937313131383b6964656e746974797c733a383a22736f667469616e7a223b757365726e616d657c733a383a22736f667469616e7a223b656d61696c7c733a32303a22636f6e7461637440736f667469616e7a2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373239393436303332223b6c6173745f69707c733a31313a2233392e35312e31342e3338223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313732393937303534393b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d31302d31372032333a33373a3535223b),
('fnsr6h1n3rpa8sr5ad98j38cgvdojp89', '110.38.243.156', 1738936742, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733383933363734323b),
('fodp9ccd87r0kkrvj6ssa102jg7rbd26', '202.59.15.73', 1732197220, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733323139373232303b),
('fvjdd5ll96bi76ldpj5pv3tonnkeec74', '202.59.15.73', 1731938174, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733313933383137343b),
('g3t1ur05h29l35kcceuuhsafrvnfqv3f', '185.255.164.0', 1752077628, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735323037373632383b),
('g5vlhfifj2vrlkdl1fbdlq1cuh1s70ca', '23.105.144.11', 1746024380, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734363032343338303b),
('g7qq67ta599s5pikmpuga5khkmtk8j5p', '23.82.40.230', 1749023575, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734393032333537353b),
('g8u0ijq78it665g0ilom139cs5dd0bcj', '202.59.15.72', 1730215548, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733303231353438313b),
('gc4f8urot9pkk5i2qn9tqti5gpjcn4h9', '110.38.244.162', 1739542091, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393534323039313b),
('gk5sdo6phtlf0tfclh5okbqiran2joum', '54.36.148.247', 1751991594, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735313939313539343b6572726f727c4e3b),
('guv760u6knulf39gga6h5rae5fgjdviq', '23.81.63.166', 1747121500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734373132313530303b),
('gvaj4nurms7b0vh1dsfg6jdu8jhaa1a0', '110.38.244.66', 1735308878, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733353330383837383b),
('h151eu6tjpbh4crirf3jv5rech2qem35', '110.38.244.162', 1740147882, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303134373838323b),
('h6kq0bn09mr4dpe57vrfchen97pu82jb', '54.36.149.19', 1740334725, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303333343732353b),
('hfeosvj12lcc4l55hhs35d1fe4m0vfa0', '54.36.148.207', 1741097542, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313039373534323b),
('hfr3rh72l78ghn6raturifkq0al46l3p', '34.78.49.210', 1751983959, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735313938333935393b),
('hfvh8noe3sqpkmbe2qjn513jcnrmfp3s', '216.73.216.16', 1749338729, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734393333383732393b),
('hjabf594fcjl1j0pi3fpggv8qteoiqln', '157.55.39.196', 1736546910, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733363534363930393b),
('hlv8uq609mo02evdds725fd0nrnfmcvd', '110.38.243.156', 1738764978, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733383736343937383b),
('hmtqnnftlau4v1gcu3psochpktef5g3t', '110.38.243.22', 1735738730, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733353733383733303b),
('hr4ec8pvved7a8u5ibmoscn7lf0rim1n', '202.59.15.72', 1730469770, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733303436393733353b),
('i3s7drif1ar1mkbuun43dkniiu3fl5rp', '54.36.148.202', 1749798703, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734393739383730333b),
('i4ai698fru0gv2celc5gaf3g1sllk7pq', '52.89.103.56', 1729864737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732393836343733373b),
('i6ohvvadb9no5ol497u6lvume2vothv8', '110.38.243.3', 1737414874, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733373431343837343b),
('icn4g4htp8n944c3v629u82fv5tj63hf', '2001:41d0:303:363::1', 1733469115, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733333436393131353b),
('iiusnbjgs8p192o5ku0a0529r82614br', '54.36.149.0', 1751515376, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735313531353337363b),
('j5pgu5blepm618u4ocihj958anl51ral', '110.38.243.107', 1733924002, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733333932343030323b),
('j8lo23go6gvin58egklic7u4k8f7v737', '110.38.243.184', 1736631616, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733363633313631363b),
('jc7p1gr77ogk8ibuifp9prbcekujfm4q', '20.171.207.150', 1739226490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393232363439303b),
('jjbgu7be4djkfot7u5jbcjmaq889249s', '70.49.241.175', 1732299913, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733323239393931333b),
('jmcrnak8skiatsr34gn9qc8tr3hn8eul', '110.38.244.162', 1740406469, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303430363436393b),
('joeh8r0870441li2nnoptf2uh3rn3b0u', '110.38.244.162', 1740157126, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303135373132363b),
('jtnnt9alkj9mb0t5d4lo2p9eiglgfeo7', '110.38.243.3', 1737297950, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733373239373935303b),
('k5bvm9m85kc7868g2svfcluka29via75', '51.222.253.3', 1752554428, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735323535343432383b),
('k9e497ca7ker003toel2kg0c5bp4er7o', '54.36.148.147', 1737594140, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733373539343134303b),
('kecua9hnp6hr5g6e1t1akp9sc2pv1e5a', '110.38.243.156', 1738764978, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733383736343937383b),
('kg3a7bncpb8hrirh2s7734lbibaum5bq', '110.38.243.71', 1742394108, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734323339343130383b),
('ki3fa9jttoj63ghqquf0ks1rhlv1sjce', '40.77.167.14', 1740928545, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303932383534353b),
('kk1e3r6c7s53i40lmflf0io1botjhgk7', '110.38.243.3', 1737467077, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733373436373037373b),
('kl7juaoui5ojnjbclc711hf9d3v06gss', '111.119.161.8', 1732214943, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733323231343934333b),
('klm1eppbqd4td74cgpf8sv1gg9lk7iaa', '51.222.253.20', 1740158692, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734303135383639323b),
('km2s9mbe4vualvsalosck1lk7d9bmvun', '110.38.244.91', 1734373397, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733343337333339373b),
('kr7isv1va79ofu43v07oed370dio34u4', '202.59.15.72', 1730818062, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733303831383036323b),
('lc9mthpfe4cv35ma8hmrj5pjdomlqpod', '202.59.15.72', 1730296891, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733303239363839313b),
('lolqsdn93t26bjg3saan9p5ecnmvskia', '110.38.244.162', 1739972332, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393937323333323b),
('lqtle03hv9v426vtuedj1e87ivhlcl71', '2a02:4780:11:13::2', 1729863382, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732393836333338303b7265717565737465645f706167657c733a31333a2261646d696e2f77656c636f6d65223b),
('ls6vvn2sm4ifl4cgdk5f0evofin49pdg', '54.36.148.7', 1744160342, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343136303334323b),
('ltbt2v073ld8tdro3ug533s1nspaigbv', '110.38.244.162', 1741020175, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313032303137353b),
('lvd22brfppinv4fjk0fnjk7o7dr0u49r', '202.59.15.74', 1729890848, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732393839303639383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a383a22736f667469616e7a223b757365726e616d657c733a383a22736f667469616e7a223b656d61696c7c733a32303a22636f6e7461637440736f667469616e7a2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373239383036303232223b6c6173745f69707c733a31383a22326130323a343738303a31313a31353a3a32223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313732393839303834383b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d31302d31372032333a33373a3535223b),
('m0520q49dqpkccacmthkl4koc3681m0v', '202.59.15.73', 1731421467, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733313432313436373b),
('m1u43vp0ks5n7f4p2sehafp8jelg73ce', '110.38.244.37', 1733337395, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733333333373339353b),
('meds1inq7rmhpsfi7fgr61jcg216d385', '20.171.207.73', 1741128030, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313132383033303b7265717565737465645f706167657c733a353a2261646d696e223b),
('mgn9pm57gvpn9holssuc40clte96v5bp', '110.38.244.162', 1741020175, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313032303137353b),
('mlsqk4kac5fo7iqot346gkmpe5l0cgfc', '202.59.15.73', 1732197220, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733323139373232303b),
('mn8sc22kc4i5aouaoeik5aut7kc9e3c2', '110.38.244.58', 1733499907, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733333439393930373b),
('mo6preqercbl2kp4agmp3lcqmdpa34ms', '110.38.244.226', 1734989349, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733343938393334393b),
('mo9f540uhi8jlh7ja7bpnvg1jnpe32m3', '110.38.243.156', 1739294981, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393239343938313b),
('mp7oqml0hmmguonftumba6ita3n04sj4', '202.59.15.72', 1731077008, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733313037373030383b),
('mq31s1ekol58elg8n89c4h8h12eap9af', '110.38.243.216', 1738674507, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733383637343530373b),
('mqfoma03tputvfigkg4hc7lq76oglka1', '39.51.14.38', 1729962395, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732393936323339303b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b),
('n4geq9u05q0s97p2o5k5cf3b88lbn3bm', '39.51.16.234', 1732019033, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733323031393033333b7265717565737465645f706167657c733a353a2261646d696e223b),
('n86g3q5q43124goosvsro31r3u62dr3j', '39.51.0.126', 1730022774, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733303032323737343b6964656e746974797c733a383a22736f667469616e7a223b757365726e616d657c733a383a22736f667469616e7a223b656d61696c7c733a32303a22636f6e7461637440736f667469616e7a2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373239393639373936223b6c6173745f69707c733a31323a2237302e33312e3134372e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('npolipjj312cm4mr6f81fs351mvootie', '207.46.13.64', 1739163975, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393136333937353b6572726f727c4e3b),
('o34t74vc526v2e3ru60dib2iqb4cvjsj', '202.59.15.73', 1733149350, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733333134393335303b),
('o7set7b8dkrhcbvat986oja7gpasa3a3', '54.36.148.234', 1745374402, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734353337343430323b),
('o81v14ffi1idjfjfb8o0pmo2m81kccb0', '207.170.176.22', 1741065584, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313036353538343b),
('oanjrabcvs1dgdvbj3kqjnabgkahkq9m', '23.80.146.170', 1744086776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343038363737363b),
('oarr4k71p9l17tn798domdsp57oj9eb4', '110.38.243.3', 1737330624, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733373333303632343b),
('ojdef8a5b7pta8rg9gtrumj7tt87krrg', '110.38.243.156', 1739369292, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393336393239323b),
('om6m6919nt6fc9eurlrkbot2mvffldjt', '54.36.148.154', 1751434311, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735313433343331313b),
('on8v8h9btli5ppo1laneo43238853d9h', '66.249.64.36', 1751722732, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735313732323733323b7265717565737465645f706167657c733a353a2261646d696e223b),
('opjdkfro9l8478846eomudc9m15aba5b', '184.154.76.12', 1747364722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734373336343732323b),
('p6pbhfejsrms6vm6k3rmhrc7kl82m93t', '47.128.124.121', 1747976896, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734373937363839363b),
('p7ates3u4jujg6r7vmucm0ucqa5vepm7', '110.38.244.37', 1733398849, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733333339383834393b),
('p7q8esjo37rm77q7e8gm2hce5gutp5n3', '23.81.152.107', 1747996187, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734373939363138373b),
('p8vmquis59tefjt0cp5v73t2bqpkq27g', '151.248.87.15', 1743041776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333034313737363b),
('pjc93onbl2skhf26u0vgghvncobocgnr', '110.38.243.212', 1736780418, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733363738303431383b),
('pkp3pbgusen2dvqiqcsk9ndb6ccragqt', '110.38.244.252', 1733752358, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733333735323335383b),
('pnf6mtns3hrvslt87ble9pm28kpr7kb4', '39.51.14.38', 1729946038, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732393934363030393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a383a22736f667469616e7a223b757365726e616d657c733a383a22736f667469616e7a223b656d61696c7c733a32303a22636f6e7461637440736f667469616e7a2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373239383930373532223b6c6173745f69707c733a31323a223230322e35392e31352e3734223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6c6173745f61637469766974797c693a313732393934363033373b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d31302d31372032333a33373a3535223b),
('po5dp3cqiq24f4e5ijmdv8mtth1nkagh', '110.38.244.252', 1733844061, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733333834343036313b),
('q1udtckr48cvfg1065oo1u4c518beohe', '202.59.15.72', 1729961550, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732393936313535303b7265717565737465645f706167657c733a393a2261646d696e2f706f73223b),
('q8uvg2r79lduudukvhbp7te9qun3bbqh', '216.73.172.245', 1750965034, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735303936353033343b),
('qhdpmi1o3b9f31vfao37fg646gkmdeec', '110.38.244.91', 1734444061, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733343434343036313b),
('qk0nfii94k0bdqfho88bj5foktvm474s', '70.31.147.81', 1730737936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733303733373933363b),
('qp8rvbkp2qlc5ancd7m25hj1kdmvdqd8', '54.36.148.8', 1752133987, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735323133333938373b),
('qt4nq9an99mrsiibgue137jdkdemc583', '66.249.70.5', 1750594330, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735303539343333303b),
('qtdnmit2fvo2j651gqdku93e7ieug05f', '110.38.243.156', 1739196142, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393139363134323b),
('r80vjub98p78ubumvi2g6uon12f56o6j', '110.38.243.180', 1741358836, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313335383833363b),
('ra60vk26e4uiaanqesta563igia4lvbm', '202.59.15.73', 1732887765, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733323838373736353b),
('rd4ocmhhljbp774nitg552r3lelhn04c', '54.36.148.96', 1737853939, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733373835333933393b),
('revuh0hobuqb6gqk4obs8dhhrpunava4', '110.38.243.180', 1741109971, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313130393937313b),
('ro4a7tdkcldn69osan574p7msvpld82u', '51.222.253.18', 1741363047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313336333034373b),
('rqu648aksuocs5gd9la69dcac7fj6g8k', '202.59.15.73', 1732028876, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733323032383837363b),
('rs4eeekpllderl7u51fl9eked8e39o9q', '110.38.243.3', 1737385214, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733373338353231343b),
('s0vshadajshlj01po0vr3mif2gj806nu', '202.59.15.73', 1732454420, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733323435343432303b),
('s30mukn10nqorjgln0jo6cni3qctslmq', '20.171.207.150', 1739242807, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393234323830373b7265717565737465645f706167657c733a353a2261646d696e223b),
('s5oncavuaik8ol09ih3engtteeji1kot', '70.24.157.242', 1731810500, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733313831303530303b6964656e746974797c733a383a22736f667469616e7a223b757365726e616d657c733a383a22736f667469616e7a223b656d61696c7c733a32303a22636f6e7461637440736f667469616e7a2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373330313439373438223b6c6173745f69707c733a31323a2233392e35312e34322e313833223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('s85c0t1vrah6494pjbdf33hi52d03n6r', '110.38.243.22', 1735907999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733353930373939393b),
('sa3aqibavgduhvr1a364b2880vuodmdp', '39.51.0.126', 1730021092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733303032313039323b),
('sa74bvugbtnjlfvu1olp2cm0ub71mrfa', '66.249.64.34', 1751799836, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735313739393833363b),
('sce4t0a48oola20h1vpinumu3km6lo07', '147.93.144.85', 1743926283, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734333932363238333b),
('sdter3tmmcvn7k8dsuvkm9dj488f4p38', '54.36.148.14', 1742485109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734323438353130393b),
('se3f39utv3dq0u8okb3rsh1a8tv4a4ie', '23.81.62.205', 1744954774, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734343935343737343b),
('sp3ojveu6dtku3hcq1apfv6h5nfe8bvg', '110.38.243.180', 1741358836, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313335383833363b),
('suuuq9dqr0ot0lku7qn82a21j6q3i669', '202.59.15.73', 1731616274, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733313631363237343b),
('t0cmt8qbb0j7c837spuhcsoqki3h2rfu', '51.222.253.9', 1748192832, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734383139323833323b),
('t5cocvt9jcn2vj03ki5gniq0ckfstg94', '202.59.15.73', 1733149350, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733333134393335303b),
('t76213uadog5ngj5a0gkdmcq8oqko78e', '202.59.15.73', 1732114878, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733323131343837383b),
('t8cdt17e6a7srdp1e6ljpf51p56vo30o', '2a03:2880:f806:15::', 1739444363, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393434343336333b),
('tahvv01bokqarue6dh953ikmm76oh8tn', '202.59.15.73', 1732802169, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733323830323136393b),
('tbsagmac5kqql2e0t0ek51rcuqri0m4c', '202.59.15.72', 1730370781, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733303337303738313b),
('tr3q8oiv3d0kavbnlf4p3h807p9mu05o', '20.171.207.192', 1739501248, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393530313234383b),
('trfkg5v60srkrd2s3ml73meajr90fsrq', '110.38.243.3', 1737330624, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733373333303632343b),
('tsn8crgnn2cbagjcukah163sprc041nh', '110.38.243.180', 1741192879, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313139323837393b),
('u65n7u4en9ujrovgjd2b3rfgt5k9h1op', '40.77.167.11', 1737541171, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733373534313137313b),
('udqgfj1o6pnh0f7dspqrt6dvgsa65act', '110.38.243.109', 1736957117, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733363935373131373b),
('ukag1ljl4bopcdjghf50mr3pv0p8782j', '87.200.130.159', 1729930754, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732393933303735343b),
('upikpfjq9h9q8ct973gdl3kc34paa5b2', '20.171.207.122', 1749103455, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734393130333435343b7265717565737465645f706167657c733a353a2261646d696e223b),
('usmjf16uib6prh6ckghv8j533g0j6ea6', '34.217.253.81', 1729864757, 0x5f5f63695f6c6173745f726567656e65726174657c693a313732393836343735373b),
('usoefdrjr8137cfh9h2cb0h0jmvdm6mf', '110.38.243.109', 1737035662, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733373033353636323b),
('v966t9h52f2vp0jnob9v5tk0h6hlm7bu', '110.38.243.1', 1741962786, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313936323738363b),
('vbil1t0gpddunf7hkvceqeu3degucj3h', '20.171.207.150', 1739237870, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733393233373837303b6572726f727c4e3b),
('vje1d3rrbum4b8ontr0k5mmjngp91j74', '20.171.207.73', 1741116988, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734313131363938383b),
('vrl6diuc7jelbejtkori05n287k0ilcp', '111.119.161.6', 1736176232, 0x5f5f63695f6c6173745f726567656e65726174657c693a313733363137363233323b),
('vrovhpkk4ttovcgpn0srl045kjijvae5', '110.38.244.8', 1742567208, 0x5f5f63695f6c6173745f726567656e65726174657c693a313734323536373230383b);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

CREATE TABLE `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT 0,
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT 0,
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT 0,
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT 0,
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT 0,
  `restrict_user` tinyint(4) NOT NULL DEFAULT 0,
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT 0,
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT 0,
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT 0,
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT 0,
  `captcha` tinyint(1) NOT NULL DEFAULT 1,
  `reference_format` tinyint(1) NOT NULL DEFAULT 1,
  `racks` tinyint(1) DEFAULT 0,
  `attributes` tinyint(1) NOT NULL DEFAULT 0,
  `product_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `decimals` tinyint(2) NOT NULL DEFAULT 2,
  `qty_decimals` tinyint(2) NOT NULL DEFAULT 2,
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT 0,
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT 0,
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT 0,
  `sac` tinyint(1) DEFAULT 0,
  `display_all_products` tinyint(1) DEFAULT 0,
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT 0,
  `barcode_separator` varchar(2) NOT NULL DEFAULT '-',
  `set_focus` tinyint(1) NOT NULL DEFAULT 0,
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT 1,
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT 90,
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT 0,
  `state` varchar(100) DEFAULT NULL,
  `pdf_lib` varchar(20) DEFAULT 'dompdf',
  `use_code_for_slug` tinyint(1) DEFAULT NULL,
  `ws_barcode_type` varchar(10) DEFAULT 'weight',
  `ws_barcode_chars` tinyint(4) DEFAULT NULL,
  `flag_chars` tinyint(4) DEFAULT NULL,
  `item_code_start` tinyint(4) DEFAULT NULL,
  `item_code_chars` tinyint(4) DEFAULT NULL,
  `price_start` tinyint(4) DEFAULT NULL,
  `price_chars` tinyint(4) DEFAULT NULL,
  `price_divide_by` int(11) DEFAULT NULL,
  `weight_start` tinyint(4) DEFAULT NULL,
  `weight_chars` tinyint(4) DEFAULT NULL,
  `weight_divide_by` int(11) DEFAULT NULL,
  `ksa_qrcode` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `apis`, `state`, `pdf_lib`, `use_code_for_slug`, `ws_barcode_type`, `ws_barcode_chars`, `flag_chars`, `item_code_start`, `item_code_chars`, `price_start`, `price_chars`, `price_divide_by`, `weight_start`, `weight_chars`, `weight_divide_by`, `ksa_qrcode`) VALUES
(1, 'logo2.png', 'logo3.png', 'Digit POS', 'english', 1, 2, 'USD', 1, 10, '3.5.2', 1, 5, 'SALE', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 0, 'default', 1, 1, 1, 1, 1, 1, 1, 1, 0, 'America/New_York', 800, 800, 150, 150, 0, 0, 0, 0, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@softianz.com', '12345678', '25', NULL, NULL, 1, 'contact@softianz.com', 0, 4, 1, 0, 2, 1, 1, 0, 2, 2, '.', ',', 0, 3, 'iWEBCRUX', '5d6fc57d-99ea-4127-8757-7110e365f846', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '', 0, '-', 0, 1, 1, 'POP', 90, '', 0, 0, 'AN', 'dompdf', 0, 'weight', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

CREATE TABLE `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', 0.0000, 0.0000, 0.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_counts`
--

CREATE TABLE `sma_stock_counts` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_count_items`
--

CREATE TABLE `sma_stock_count_items` (
  `id` int(11) NOT NULL,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

CREATE TABLE `sma_suspended_bills` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT 0.0000,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_suspended_bills`
--

INSERT INTO `sma_suspended_bills` (`id`, `date`, `customer_id`, `customer`, `count`, `order_discount_id`, `order_tax_id`, `total`, `biller_id`, `warehouse_id`, `created_by`, `suspend_note`, `shipping`, `cgst`, `sgst`, `igst`) VALUES
(2, '2024-10-17 23:47:46', 1, 'Walk-in Customer', 2, '', 1, 190.0000, 3, 1, 1, 'table 2', 0.0000, NULL, NULL, NULL),
(3, '2024-10-17 23:47:46', 1, 'Walk-in Customer', 2, '', 1, 190.0000, 3, 1, 1, 'table 2', 0.0000, NULL, NULL, NULL),
(4, '2024-10-24 15:14:32', 1, 'Softianz', 4, '', 1, 37.0000, 3, 1, 1, 'table 1', 0.0000, NULL, NULL, NULL),
(5, '2024-10-26 15:17:16', 1, 'Softianz', 3, '', 1, 321.2000, 3, 1, 1, 'Test Order', 0.0000, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

CREATE TABLE `sma_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT 0.0000,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_suspended_items`
--

INSERT INTO `sma_suspended_items` (`id`, `suspend_id`, `product_id`, `product_code`, `product_name`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `option_id`, `product_type`, `real_unit_price`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `comment`, `gst`, `cgst`, `sgst`, `igst`) VALUES
(2, 2, 1, '63980977', 'Product 1', 100.0000, 100.0000, 1.0000, 1, 0.0000, 1, '0', '0', 0.0000, 100.0000, '', NULL, 'standard', 100.0000, 1, 'unit1', 1.0000, '', NULL, NULL, NULL, NULL),
(3, 2, 2, '47129389', 'Product 2', 90.0000, 90.0000, 1.0000, 1, 0.0000, 1, '0', '0', 0.0000, 90.0000, '', NULL, 'standard', 90.0000, 1, 'unit1', 1.0000, '', NULL, NULL, NULL, NULL),
(4, 3, 1, '63980977', 'Product 1', 100.0000, 100.0000, 1.0000, 1, 0.0000, 1, '0', '0', 0.0000, 100.0000, '', NULL, 'standard', 100.0000, 1, 'unit1', 1.0000, '', NULL, NULL, NULL, NULL),
(5, 3, 2, '47129389', 'Product 2', 90.0000, 90.0000, 1.0000, 1, 0.0000, 1, '0', '0', 0.0000, 90.0000, '', NULL, 'standard', 90.0000, 1, 'unit1', 1.0000, '', NULL, NULL, NULL, NULL),
(6, 4, 1, '63980977', 'Bread', 3.0000, 3.0000, 1.0000, 1, 0.0000, 1, '0', '0', 0.0000, 3.0000, '', NULL, 'standard', 3.0000, 1, 'kg', 1.0000, '', NULL, NULL, NULL, NULL),
(7, 4, 2, '47129389', 'Bun', 3.0000, 3.0000, 1.0000, 1, 0.0000, 1, '0', '0', 0.0000, 3.0000, '', NULL, 'standard', 3.0000, 1, 'kg', 1.0000, '', NULL, NULL, NULL, NULL),
(8, 4, 5, '70541989', 'Chinese Rice', 13.0000, 13.0000, 1.0000, 1, 0.0000, 1, '0', '0', 0.0000, 13.0000, '', NULL, 'standard', 13.0000, 1, 'kg', 1.0000, '', NULL, NULL, NULL, NULL),
(9, 4, 7, '18038135', 'Oven BBQ Chicken', 18.0000, 18.0000, 1.0000, 1, 0.0000, 1, '0', '0', 0.0000, 18.0000, '', NULL, 'standard', 18.0000, 1, 'kg', 1.0000, '', NULL, NULL, NULL, NULL),
(10, 5, 4, '49360124', 'Zinger Burger', 200.0000, 200.0000, 1.0000, 1, 0.0000, 1, '0', '0', 0.0000, 200.0000, '', NULL, 'standard', 200.0000, 1, 'kg', 1.0000, '', NULL, NULL, NULL, NULL),
(11, 5, 11, '1', 'Beef Burger', 20.0000, 21.2000, 1.0000, 1, 1.2000, 3, '6%', '0', 0.0000, 21.2000, '', NULL, 'standard', 20.0000, 1, 'kg', 1.0000, '', NULL, NULL, NULL, NULL),
(12, 5, 3, '80666128', 'Sandwiches', 100.0000, 100.0000, 1.0000, 1, 0.0000, 1, '0', '0', 0.0000, 100.0000, '', NULL, 'standard', 100.0000, 1, 'kg', 1.0000, '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

CREATE TABLE `sma_tax_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', 0.0000, '2'),
(2, 'VAT @10%', 'VAT10', 10.0000, '1'),
(3, 'GST @6%', 'GST', 6.0000, '1'),
(4, 'VAT @20%', 'VT20', 20.0000, '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

CREATE TABLE `sma_transfers` (
  `id` int(11) NOT NULL,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT 0.0000,
  `attachment` varchar(55) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

CREATE TABLE `sma_transfer_items` (
  `id` int(11) NOT NULL,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `gst` varchar(20) DEFAULT NULL,
  `cgst` decimal(25,4) DEFAULT NULL,
  `sgst` decimal(25,4) DEFAULT NULL,
  `igst` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_units`
--

CREATE TABLE `sma_units` (
  `id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES
(1, 'kg', 'Kg', NULL, NULL, NULL, NULL),
(2, 'gm', 'Gram', 1, '*', NULL, '1000'),
(3, 'lit', 'Litre', NULL, NULL, NULL, NULL),
(4, 'ml', 'Milli Litre', 3, '*', NULL, '1000'),
(5, 'Ltkg', 'Litre to Kg', 1, '*', NULL, '1030');

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

CREATE TABLE `sma_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT 0,
  `show_price` tinyint(1) DEFAULT 0,
  `award_points` int(11) DEFAULT 0,
  `view_right` tinyint(1) NOT NULL DEFAULT 0,
  `edit_right` tinyint(1) NOT NULL DEFAULT 0,
  `allow_discount` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`) VALUES
(1, 0x37302e32342e3135372e323432, 0x0000, 'softianz', '2c8ab736b2ccab4f50e72d5fd7d21020cbb77ae7', NULL, 'contact@softianz.com', NULL, NULL, NULL, '6e5e2f4c47ba10736e92891840965955f42f6f45', 1351661704, 1731809993, 1, 'Arslan ', 'Zia', 'Softianz', '+1 321 710 3816', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

CREATE TABLE `sma_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x33392e35312e33362e323039, 'softianz', '2024-06-17 23:24:06'),
(2, 1, NULL, 0x33392e35312e32362e323431, 'softianz', '2024-06-18 17:59:03'),
(3, 1, NULL, 0x33392e35312e32362e323431, 'softianz', '2024-06-21 18:12:54'),
(4, 1, NULL, 0x33392e35312e31342e3839, 'softianz', '2024-07-02 10:23:29'),
(5, 1, NULL, 0x33392e35312e31342e3839, 'softianz', '2024-07-02 10:29:56'),
(6, 1, NULL, 0x3138322e3137382e3132312e3630, 'softianz', '2024-07-17 13:18:09'),
(7, 1, NULL, 0x33392e35312e33352e323135, 'softianz', '2024-07-31 14:03:46'),
(8, 1, NULL, 0x33392e35312e33352e323135, 'softianz', '2024-07-31 14:06:21'),
(9, 1, NULL, 0x3230322e35392e31352e3734, 'Softianz', '2024-08-01 18:31:01'),
(10, 1, NULL, 0x3139322e3232382e3133342e313937, 'softianz', '2024-08-01 21:08:30'),
(11, 1, NULL, 0x33392e35312e39332e313935, 'softianz', '2024-08-13 13:16:46'),
(12, 1, NULL, 0x33392e35312e31322e313037, 'softianz', '2024-08-22 20:18:28'),
(13, 1, NULL, 0x3130332e3136312e34382e313132, 'softianz', '2024-08-22 20:21:00'),
(14, 1, NULL, 0x3230322e35392e31352e3734, 'Softianz', '2024-08-22 20:24:37'),
(15, 1, NULL, 0x33392e35312e31382e3237, 'softianz', '2024-09-02 20:26:57'),
(16, 1, NULL, 0x33392e35312e33362e313039, 'softianz', '2024-09-10 06:36:58'),
(17, 1, NULL, 0x33392e35312e31362e3639, 'softianz', '2024-10-03 02:03:55'),
(18, 1, NULL, 0x33392e35312e31322e3539, 'softianz', '2024-10-09 02:34:17'),
(19, 1, NULL, 0x33392e35312e34332e3536, 'softianz', '2024-10-17 23:25:04'),
(20, 1, NULL, 0x36392e31372e3132382e36, 'softianz', '2024-10-17 23:26:21'),
(21, 1, NULL, 0x326130323a343738303a31313a31353a, 'softianz', '2024-10-21 19:37:08'),
(22, 1, NULL, 0x326130323a343738303a31313a31353a, 'softianz', '2024-10-22 06:36:08'),
(23, 1, NULL, 0x326130323a343738303a31313a31353a, 'softianz', '2024-10-22 08:25:59'),
(24, 1, NULL, 0x326130323a343738303a31313a31333a, 'softianz', '2024-10-22 09:57:38'),
(25, 1, NULL, 0x326130323a343738303a31313a31333a, 'softianz', '2024-10-22 10:34:36'),
(26, 1, NULL, 0x3230322e35392e31352e3734, 'softianz', '2024-10-22 17:11:59'),
(27, 1, NULL, 0x323630303a313031323a613130343a39, 'softianz', '2024-10-22 17:33:14'),
(28, 1, NULL, 0x3230322e35392e31352e3734, 'softianz', '2024-10-23 12:37:54'),
(29, 1, NULL, 0x326130323a343738303a31313a31353a, 'softianz', '2024-10-23 20:15:07'),
(30, 1, NULL, 0x33372e3233312e3235322e313736, 'Softianz', '2024-10-24 10:41:46'),
(31, 1, NULL, 0x3230322e35392e31352e3734, 'softianz', '2024-10-24 10:42:29'),
(32, 1, NULL, 0x33392e35312e32352e323038, 'softianz', '2024-10-24 14:30:36'),
(33, 1, NULL, 0x33392e35312e32352e323038, 'softianz', '2024-10-24 15:07:54'),
(34, 1, NULL, 0x326130323a343738303a31313a31353a, 'softianz', '2024-10-24 17:40:22'),
(35, 1, NULL, 0x3230322e35392e31352e3734, 'softianz', '2024-10-25 17:12:32'),
(36, 1, NULL, 0x33392e35312e31342e3338, 'softianz', '2024-10-26 08:33:52'),
(37, 1, NULL, 0x37302e33312e3134372e3831, 'softianz', '2024-10-26 15:09:56'),
(38, 1, NULL, 0x33392e35312e302e313236, 'softianz', '2024-10-27 05:25:11'),
(39, 1, NULL, 0x33392e35312e34322e313833, 'softianz', '2024-10-28 17:09:08'),
(40, 1, NULL, 0x37302e32342e3135372e323432, 'softianz', '2024-11-16 21:19:53');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

CREATE TABLE `sma_variants` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

CREATE TABLE `sma_warehouses` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(1, 'WHI', 'Warehouse 1', '<p>Address, City</p>', NULL, '+1 321 710 3816', 'contact@softianz.com', 0),
(2, 'WHII', 'Warehouse 2', '<p>10003 NYC, USA</p>', NULL, '+10529212234', 'contact@softianz.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

CREATE TABLE `sma_warehouses_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(1, 1, 1, -4.0000, NULL, 80.0000),
(2, 1, 2, 0.0000, NULL, 80.0000),
(3, 2, 1, -100.0000, NULL, 70.0000),
(4, 2, 2, 0.0000, NULL, 70.0000),
(5, 3, 1, -100.0000, NULL, 80.0000),
(6, 3, 2, 0.0000, NULL, 80.0000),
(7, 4, 1, -1.0000, NULL, 180.0000),
(8, 4, 2, 0.0000, NULL, 180.0000),
(9, 5, 1, 0.0000, NULL, 10.0000),
(10, 5, 2, 0.0000, NULL, 10.0000),
(11, 6, 1, 0.0000, NULL, 15.0000),
(12, 6, 2, 0.0000, NULL, 15.0000),
(13, 7, 1, 0.0000, NULL, 15.0000),
(14, 7, 2, 0.0000, NULL, 15.0000),
(15, 8, 1, 0.0000, NULL, 3.0000),
(16, 8, 2, 0.0000, NULL, 3.0000),
(17, 9, 1, 0.0000, NULL, 3.0000),
(18, 9, 2, 0.0000, NULL, 3.0000),
(19, 10, 1, 0.0000, NULL, 15.5000),
(20, 10, 2, 0.0000, NULL, 15.5000),
(21, 11, 1, -1.0000, NULL, 10.0000),
(22, 11, 2, 0.0000, NULL, 10.0000);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

CREATE TABLE `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_id` (`adjustment_id`);

--
-- Indexes for table `sma_attachments`
--
ALTER TABLE `sma_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_brands`
--
ALTER TABLE `sma_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `sma_categories`
--
ALTER TABLE `sma_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_companies`
--
ALTER TABLE `sma_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `group_id_2` (`group_id`);

--
-- Indexes for table `sma_costing`
--
ALTER TABLE `sma_costing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `card_id` (`card_id`);

--
-- Indexes for table `sma_groups`
--
ALTER TABLE `sma_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_logs`
--
ALTER TABLE `sma_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  ADD PRIMARY KEY (`ref_id`);

--
-- Indexes for table `sma_payments`
--
ALTER TABLE `sma_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_paypal`
--
ALTER TABLE `sma_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_pos_settings`
--
ALTER TABLE `sma_pos_settings`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `sma_printers`
--
ALTER TABLE `sma_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_products`
--
ALTER TABLE `sma_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `category_id_2` (`category_id`),
  ADD KEY `unit` (`unit`),
  ADD KEY `brand` (`brand`);

--
-- Indexes for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `price_group_id` (`price_group_id`);

--
-- Indexes for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_product_id_name` (`product_id`,`name`);

--
-- Indexes for table `sma_promos`
--
ALTER TABLE `sma_promos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_id` (`quote_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_returns`
--
ALTER TABLE `sma_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `return_id` (`return_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`return_id`),
  ADD KEY `return_id_2` (`return_id`,`product_id`);

--
-- Indexes for table `sma_sales`
--
ALTER TABLE `sma_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `product_id_2` (`product_id`,`sale_id`),
  ADD KEY `sale_id_2` (`sale_id`,`product_id`);

--
-- Indexes for table `sma_sessions`
--
ALTER TABLE `sma_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `sma_settings`
--
ALTER TABLE `sma_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sma_skrill`
--
ALTER TABLE `sma_skrill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_count_id` (`stock_count_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfer_id` (`transfer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `sma_units`
--
ALTER TABLE `sma_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `base_unit` (`base_unit`);

--
-- Indexes for table `sma_users`
--
ALTER TABLE `sma_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  ADD KEY `group_id_2` (`group_id`,`company_id`);

--
-- Indexes for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_variants`
--
ALTER TABLE `sma_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sma_addresses`
--
ALTER TABLE `sma_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_adjustments`
--
ALTER TABLE `sma_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_adjustment_items`
--
ALTER TABLE `sma_adjustment_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_attachments`
--
ALTER TABLE `sma_attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_brands`
--
ALTER TABLE `sma_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_calendar`
--
ALTER TABLE `sma_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_captcha`
--
ALTER TABLE `sma_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_categories`
--
ALTER TABLE `sma_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_combo_items`
--
ALTER TABLE `sma_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_companies`
--
ALTER TABLE `sma_companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sma_costing`
--
ALTER TABLE `sma_costing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sma_currencies`
--
ALTER TABLE `sma_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_customer_groups`
--
ALTER TABLE `sma_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_date_format`
--
ALTER TABLE `sma_date_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sma_deliveries`
--
ALTER TABLE `sma_deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_deposits`
--
ALTER TABLE `sma_deposits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_expenses`
--
ALTER TABLE `sma_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_expense_categories`
--
ALTER TABLE `sma_expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_gift_cards`
--
ALTER TABLE `sma_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_gift_card_topups`
--
ALTER TABLE `sma_gift_card_topups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_groups`
--
ALTER TABLE `sma_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_login_attempts`
--
ALTER TABLE `sma_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sma_logs`
--
ALTER TABLE `sma_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_notifications`
--
ALTER TABLE `sma_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_order_ref`
--
ALTER TABLE `sma_order_ref`
  MODIFY `ref_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_payments`
--
ALTER TABLE `sma_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_permissions`
--
ALTER TABLE `sma_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_pos_register`
--
ALTER TABLE `sma_pos_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_price_groups`
--
ALTER TABLE `sma_price_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_printers`
--
ALTER TABLE `sma_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_products`
--
ALTER TABLE `sma_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sma_product_photos`
--
ALTER TABLE `sma_product_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sma_product_prices`
--
ALTER TABLE `sma_product_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_product_variants`
--
ALTER TABLE `sma_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_promos`
--
ALTER TABLE `sma_promos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_purchases`
--
ALTER TABLE `sma_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_purchase_items`
--
ALTER TABLE `sma_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_quotes`
--
ALTER TABLE `sma_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_quote_items`
--
ALTER TABLE `sma_quote_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_returns`
--
ALTER TABLE `sma_returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_return_items`
--
ALTER TABLE `sma_return_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_sales`
--
ALTER TABLE `sma_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_sale_items`
--
ALTER TABLE `sma_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sma_stock_counts`
--
ALTER TABLE `sma_stock_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_stock_count_items`
--
ALTER TABLE `sma_stock_count_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_suspended_bills`
--
ALTER TABLE `sma_suspended_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_suspended_items`
--
ALTER TABLE `sma_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sma_tax_rates`
--
ALTER TABLE `sma_tax_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sma_transfers`
--
ALTER TABLE `sma_transfers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_transfer_items`
--
ALTER TABLE `sma_transfer_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_units`
--
ALTER TABLE `sma_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sma_users`
--
ALTER TABLE `sma_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sma_user_logins`
--
ALTER TABLE `sma_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `sma_variants`
--
ALTER TABLE `sma_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sma_warehouses`
--
ALTER TABLE `sma_warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sma_warehouses_products`
--
ALTER TABLE `sma_warehouses_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `sma_warehouses_products_variants`
--
ALTER TABLE `sma_warehouses_products_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
