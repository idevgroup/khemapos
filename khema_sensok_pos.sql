-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 23, 2019 at 03:12 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `khema_sensok_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type` enum('saving_current','capital') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

DROP TABLE IF EXISTS `account_transactions`;
CREATE TABLE IF NOT EXISTS `account_transactions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_payment_id` int(11) DEFAULT NULL,
  `transfer_transaction_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_transactions_account_id_index` (`account_id`),
  KEY `account_transactions_transaction_id_index` (`transaction_id`),
  KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  KEY `account_transactions_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
CREATE TABLE IF NOT EXISTS `activity_log` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

DROP TABLE IF EXISTS `barcodes`;
CREATE TABLE IF NOT EXISTS `barcodes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `width` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `paper_width` double(8,2) DEFAULT NULL,
  `paper_height` double(8,2) DEFAULT NULL,
  `top_margin` double(8,2) DEFAULT NULL,
  `left_margin` double(8,2) DEFAULT NULL,
  `row_distance` double(8,2) DEFAULT NULL,
  `col_distance` double(8,2) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_continuous` tinyint(1) NOT NULL DEFAULT '0',
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barcodes_business_id_foreign` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 4\" x 1\"\\r\\nLabels per sheet: 20', 3.75, 1.00, 8.50, 11.00, 0.50, 0.50, 0.00, 0.16, 2, 0, 0, 20, NULL, '2017-12-17 23:13:44', '2017-12-17 23:13:44'),
(2, '30 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2.625\" x 1\"\\r\\nLabels per sheet: 30', 2.62, 1.00, 8.50, 11.00, 0.50, 0.22, 0.00, 0.14, 3, 0, 0, 30, NULL, '2017-12-17 23:04:39', '2017-12-17 23:10:40'),
(3, '32 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2\" x 1.25\"\\r\\nLabels per sheet: 32', 2.00, 1.25, 8.50, 11.00, 0.50, 0.25, 0.00, 0.00, 4, 0, 0, 32, NULL, '2017-12-17 22:55:40', '2017-12-17 22:55:40'),
(4, '40 Labels per sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2\" x 1\"\\r\\nLabels per sheet: 40', 2.00, 1.00, 8.50, 11.00, 0.50, 0.25, 0.00, 0.00, 4, 0, 0, 40, NULL, '2017-12-17 22:58:40', '2017-12-17 22:58:40'),
(5, '50 Labels per Sheet - (8.5\" x 11\")', 'Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 1.5\" x 1\"\\r\\nLabels per sheet: 50', 1.50, 1.00, 8.50, 11.00, 0.50, 0.50, 0.00, 0.00, 5, 0, 0, 50, NULL, '2017-12-17 22:51:10', '2017-12-17 22:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm\\r\\nGap: 3.18mm', 1.25, 1.00, 1.25, 0.00, 0.12, 0.00, 0.12, 0.00, 1, 0, 1, NULL, NULL, '2017-12-17 22:51:10', '2017-12-17 22:51:10'),
(7, 'SME10-A8', 'Giraffe SME LABEL A8', 1.55, 1.00, 8.30, 11.70, 0.10, 0.00, 0.15, 0.10, 5, 1, 0, 50, 1, '2019-10-13 11:58:43', '2019-10-13 12:19:33');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `waiter_id` int(10) UNSIGNED DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `booking_status` enum('booked','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_contact_id_foreign` (`contact_id`),
  KEY `bookings_business_id_foreign` (`business_id`),
  KEY `bookings_created_by_foreign` (`created_by`),
  KEY `bookings_table_id_index` (`table_id`),
  KEY `bookings_waiter_id_index` (`waiter_id`),
  KEY `bookings_location_id_index` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brands_business_id_foreign` (`business_id`),
  KEY `brands_created_by_foreign` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
CREATE TABLE IF NOT EXISTS `business` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int(10) UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT '0.00',
  `owner_id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT '1',
  `accounting_method` enum('fifo','lifo','avco') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(22,4) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `expiry_type` enum('add_expiry','add_manufacturing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT '1',
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `transaction_edit_days` int(10) UNSIGNED NOT NULL DEFAULT '30',
  `stock_expiry_alert_days` int(10) UNSIGNED NOT NULL DEFAULT '30',
  `keyboard_shortcuts` text COLLATE utf8mb4_unicode_ci,
  `pos_settings` text COLLATE utf8mb4_unicode_ci,
  `enable_brand` tinyint(1) NOT NULL DEFAULT '1',
  `enable_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT '1',
  `enable_purchase_status` tinyint(1) DEFAULT '1',
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT '0',
  `default_unit` int(11) DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT '0',
  `enable_racks` tinyint(1) NOT NULL DEFAULT '0',
  `enable_row` tinyint(1) NOT NULL DEFAULT '0',
  `enable_position` tinyint(1) NOT NULL DEFAULT '0',
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT '1',
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT '1',
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT '1',
  `currency_symbol_placement` enum('before','after') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text COLLATE utf8mb4_unicode_ci,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `ref_no_prefixes` text COLLATE utf8mb4_unicode_ci,
  `theme_color` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) DEFAULT '1.0000',
  `min_order_total_for_rp` decimal(22,4) DEFAULT '1.0000',
  `max_rp_per_order` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) DEFAULT '1.0000',
  `min_order_total_for_redeem` decimal(22,4) DEFAULT '1.0000',
  `min_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text COLLATE utf8mb4_unicode_ci,
  `sms_settings` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_owner_id_foreign` (`owner_id`),
  KEY `business_currency_id_foreign` (`currency_id`),
  KEY `business_default_sales_tax_foreign` (`default_sales_tax`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `ref_no_prefixes`, `theme_color`, `created_by`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'KHEMA SENSOK', 124, '2019-09-09', NULL, NULL, NULL, NULL, NULL, 100.00, 1, 'Asia/Phnom_Penh', 1, 'fifo', '0.0000', 'includes', NULL, NULL, 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, '1.000', 30, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 1, NULL, 1, 0, 'before', NULL, 'm/d/Y', '24', '{\"purchase\":\"PO\",\"purchase_return\":null,\"stock_transfer\":\"ST\",\"stock_adjustment\":\"SA\",\"sell_return\":\"CN\",\"expense\":\"EP\",\"contacts\":\"CO\",\"purchase_payment\":\"PP\",\"sell_payment\":\"SP\",\"expense_payment\":null,\"business_location\":\"BL\",\"username\":null,\"subscription\":null}', NULL, NULL, 0, NULL, '1.0000', '1.0000', NULL, '1.0000', '1.0000', NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":null,\"mail_port\":null,\"mail_username\":null,\"mail_password\":null,\"mail_encryption\":null,\"mail_from_address\":null,\"mail_from_name\":null}', '{\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', 1, '2019-09-18 12:19:43', '2019-11-23 11:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

DROP TABLE IF EXISTS `business_locations`;
CREATE TABLE IF NOT EXISTS `business_locations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int(10) UNSIGNED NOT NULL,
  `invoice_layout_id` int(10) UNSIGNED NOT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT '1',
  `receipt_printer_type` enum('browser','printer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_locations_business_id_index` (`business_id`),
  KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `invoice_layout_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'KHEMA SENSOK', 'SENSOK', 'Cambodia', 'Phnom Penh', 'Phnom Penh', '12000', 1, 1, 1, 'browser', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, '2019-09-18 12:19:43', '2019-09-18 12:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

DROP TABLE IF EXISTS `cash_registers`;
CREATE TABLE IF NOT EXISTS `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('close','open') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) DEFAULT '0.0000',
  `total_card_slips` int(11) NOT NULL DEFAULT '0',
  `total_cheques` int(11) NOT NULL DEFAULT '0',
  `closing_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_registers_business_id_foreign` (`business_id`),
  KEY `cash_registers_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

DROP TABLE IF EXISTS `cash_register_transactions`;
CREATE TABLE IF NOT EXISTS `cash_register_transactions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cash_register_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(22,4) DEFAULT '0.0000',
  `pay_method` enum('cash','card','cheque','bank_transfer','custom_pay_1','custom_pay_2','custom_pay_3','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` enum('initial','sell','transfer','refund') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  KEY `cash_register_transactions_transaction_id_index` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_business_id_foreign` (`business_id`),
  KEY `categories_created_by_foreign` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `business_id`, `short_code`, `parent_id`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Jewelry', 1, NULL, 0, 1, NULL, '2019-10-13 08:05:03', '2019-10-13 08:05:03'),
(2, 'Bag', 1, NULL, 0, 1, NULL, '2019-10-13 08:05:21', '2019-10-13 08:05:21'),
(3, 'Wedding Clothes', 1, NULL, 0, 1, NULL, '2019-10-13 08:05:42', '2019-10-13 08:05:42'),
(4, 'Clothes', 1, NULL, 0, 1, NULL, '2019-10-13 08:05:50', '2019-10-13 08:05:50');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('supplier','customer','both') COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `total_rp` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contacts_business_id_foreign` (`business_id`),
  KEY `contacts_created_by_foreign` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `supplier_business_name`, `name`, `email`, `contact_id`, `tax_number`, `city`, `state`, `country`, `landmark`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer', NULL, 'Walk-In Customer', NULL, 'CO0001', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-18 12:19:43', '2019-09-18 12:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHC', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MX', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NG', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

DROP TABLE IF EXISTS `customer_groups`;
CREATE TABLE IF NOT EXISTS `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5,2) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_groups_business_id_foreign` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
CREATE TABLE IF NOT EXISTS `discounts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT '0.0000',
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `applicable_in_spg` tinyint(1) DEFAULT '0',
  `applicable_in_cg` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discounts_business_id_index` (`business_id`),
  KEY `discounts_brand_id_index` (`brand_id`),
  KEY `discounts_category_id_index` (`category_id`),
  KEY `discounts_location_id_index` (`location_id`),
  KEY `discounts_priority_index` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

DROP TABLE IF EXISTS `expense_categories`;
CREATE TABLE IF NOT EXISTS `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_categories_business_id_foreign` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

DROP TABLE IF EXISTS `group_sub_taxes`;
CREATE TABLE IF NOT EXISTS `group_sub_taxes` (
  `group_tax_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL,
  KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  KEY `group_sub_taxes_tax_id_foreign` (`tax_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

DROP TABLE IF EXISTS `invoice_layouts`;
CREATE TABLE IF NOT EXISTS `invoice_layouts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text COLLATE utf8mb4_unicode_ci,
  `invoice_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_due_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT '0',
  `client_id_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT '1',
  `show_brand` tinyint(1) NOT NULL DEFAULT '0',
  `show_sku` tinyint(1) NOT NULL DEFAULT '1',
  `show_cat_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `show_lot` tinyint(1) NOT NULL DEFAULT '0',
  `show_image` tinyint(1) NOT NULL DEFAULT '0',
  `show_sale_description` tinyint(1) NOT NULL DEFAULT '0',
  `sales_person_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT '0',
  `table_product_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_qty_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_unit_price_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_code_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT '0',
  `show_business_name` tinyint(1) NOT NULL DEFAULT '0',
  `show_location_name` tinyint(1) NOT NULL DEFAULT '1',
  `show_landmark` tinyint(1) NOT NULL DEFAULT '1',
  `show_city` tinyint(1) NOT NULL DEFAULT '1',
  `show_state` tinyint(1) NOT NULL DEFAULT '1',
  `show_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_country` tinyint(1) NOT NULL DEFAULT '1',
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT '1',
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT '0',
  `show_email` tinyint(1) NOT NULL DEFAULT '0',
  `show_tax_1` tinyint(1) NOT NULL DEFAULT '1',
  `show_tax_2` tinyint(1) NOT NULL DEFAULT '0',
  `show_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `show_payments` tinyint(1) NOT NULL DEFAULT '0',
  `show_customer` tinyint(1) NOT NULL DEFAULT '0',
  `customer_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT '0',
  `highlight_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `module_info` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `business_id` int(10) UNSIGNED NOT NULL,
  `design` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT 'classic',
  `cn_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_amount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_tax_headings` text COLLATE utf8mb4_unicode_ci,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT '0',
  `prev_bal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `contact_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `location_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_layouts_business_id_foreign` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `is_default`, `business_id`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Default', NULL, 'Invoice No.', NULL, 'Invoice', NULL, NULL, NULL, NULL, NULL, '', '', NULL, 'Subtotal', 'Discount', 'Tax', 'Total', 'Total Due', 'Total Paid', 0, NULL, NULL, 'Date', NULL, 1, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 'Product', 'Quantity', 'Unit Price', 'Subtotal', NULL, NULL, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 1, 'Customer', 0, '#000000', '', NULL, 1, 1, 'classic', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2019-09-18 12:19:43', '2019-09-18 12:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

DROP TABLE IF EXISTS `invoice_schemes`;
CREATE TABLE IF NOT EXISTS `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT '0',
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_schemes_business_id_foreign` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Default', 'blank', '', 1, 0, 4, 1, '2019-09-18 12:19:43', '2019-09-18 12:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_07_05_071953_create_currencies_table', 1),
(4, '2017_07_05_073658_create_business_table', 1),
(5, '2017_07_22_075923_add_business_id_users_table', 1),
(6, '2017_07_23_113209_create_brands_table', 1),
(7, '2017_07_26_083429_create_permission_tables', 1),
(8, '2017_07_26_110000_create_tax_rates_table', 1),
(9, '2017_07_26_122313_create_units_table', 1),
(10, '2017_07_27_075706_create_contacts_table', 1),
(11, '2017_08_04_071038_create_categories_table', 1),
(12, '2017_08_08_115903_create_products_table', 1),
(13, '2017_08_09_061616_create_variation_templates_table', 1),
(14, '2017_08_09_061638_create_variation_value_templates_table', 1),
(15, '2017_08_10_061146_create_product_variations_table', 1),
(16, '2017_08_10_061216_create_variations_table', 1),
(17, '2017_08_19_054827_create_transactions_table', 1),
(18, '2017_08_31_073533_create_purchase_lines_table', 1),
(19, '2017_10_15_064638_create_transaction_payments_table', 1),
(20, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(21, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(22, '2017_11_20_063603_create_transaction_sell_lines', 1),
(23, '2017_11_21_064540_create_barcodes_table', 1),
(24, '2017_11_23_181237_create_invoice_schemes_table', 1),
(25, '2017_12_25_122822_create_business_locations_table', 1),
(26, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(27, '2017_12_25_163227_create_variation_location_details_table', 1),
(28, '2018_01_04_115627_create_sessions_table', 1),
(29, '2018_01_05_112817_create_invoice_layouts_table', 1),
(30, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(31, '2018_01_08_104124_create_expense_categories_table', 1),
(32, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(33, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(34, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(35, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(36, '2018_01_27_184322_create_printers_table', 1),
(37, '2018_01_30_181442_create_cash_registers_table', 1),
(38, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(39, '2018_02_07_173326_modify_business_table', 1),
(40, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(41, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(42, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(43, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(44, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(45, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(46, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(47, '2018_02_13_183323_alter_decimal_fields_size', 1),
(48, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(49, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(50, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(51, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(52, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(53, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(54, '2018_02_21_105329_create_system_table', 1),
(55, '2018_02_23_100549_version_1_2', 1),
(56, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(57, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(58, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(59, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(60, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(61, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(62, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(63, '2018_03_06_210206_modify_product_barcode_types', 1),
(64, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(65, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(66, '2018_03_19_113601_add_business_settings_options', 1),
(67, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(68, '2018_03_26_165350_create_customer_groups_table', 1),
(69, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(70, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(71, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(72, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(73, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(74, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(75, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(76, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(77, '2018_04_17_123122_add_lot_number_to_business', 1),
(78, '2018_04_17_160845_add_product_racks_table', 1),
(79, '2018_04_20_182015_create_res_tables_table', 1),
(80, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(81, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(82, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(83, '2018_04_27_132653_quotation_related_change', 1),
(84, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(85, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(86, '2018_05_14_114027_add_rows_positions_for_products', 1),
(87, '2018_05_14_125223_add_weight_to_products_table', 1),
(88, '2018_05_14_164754_add_opening_stock_permission', 1),
(89, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(90, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(91, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(92, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(93, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(94, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(95, '2018_05_22_123527_create_reference_counts_table', 1),
(96, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(97, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(98, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(99, '2018_05_25_180603_create_modifiers_related_table', 1),
(100, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(101, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(102, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(103, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(104, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(105, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(106, '2018_06_07_182258_add_image_field_to_products_table', 1),
(107, '2018_06_13_133705_create_bookings_table', 1),
(108, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(109, '2018_06_27_182835_add_superadmin_related_fields_business', 1),
(110, '2018_07_10_101913_add_custom_fields_to_products_table', 1),
(111, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1),
(112, '2018_07_17_120612_change_all_quantity_field_type_to_decimal', 1),
(113, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1),
(114, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1),
(115, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1),
(116, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1),
(117, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1),
(118, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1),
(119, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1),
(120, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1),
(121, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1),
(122, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1),
(123, '2018_09_04_155900_create_accounts_table', 1),
(124, '2018_09_06_114438_create_selling_price_groups_table', 1),
(125, '2018_09_06_154057_create_variation_group_prices_table', 1),
(126, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1),
(127, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1),
(128, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1),
(129, '2018_09_10_152703_create_account_transactions_table', 1),
(130, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1),
(131, '2018_09_19_123914_create_notification_templates_table', 1),
(132, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1),
(133, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1),
(134, '2018_09_26_105557_add_transaction_payments_for_existing_expenses', 1),
(135, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1),
(136, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1),
(137, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1),
(138, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1),
(139, '2018_10_03_185947_add_default_notification_templates_to_database', 1),
(140, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1),
(141, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1),
(142, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1),
(143, '2018_10_22_134428_modify_variable_product_data', 1),
(144, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1),
(145, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1),
(146, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1),
(147, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1),
(148, '2018_10_31_175627_add_user_contact_access', 1),
(149, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1),
(150, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1),
(151, '2018_11_08_105621_add_role_permissions', 1),
(152, '2018_11_26_114135_add_is_suspend_column_to_transactions_table', 1),
(153, '2018_11_28_104410_modify_units_table_for_multi_unit', 1),
(154, '2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines', 1),
(155, '2018_11_29_115918_add_primary_key_in_system_table', 1),
(156, '2018_12_03_185546_add_product_description_column_to_products_table', 1),
(157, '2018_12_06_114937_modify_system_table_and_users_table', 1),
(158, '2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table', 1),
(159, '2018_12_14_103307_modify_system_table', 1),
(160, '2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table', 1),
(161, '2018_12_18_170656_add_invoice_token_column_to_transaction_table', 1),
(162, '2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table', 1),
(163, '2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table', 1),
(164, '2018_12_24_154933_create_notifications_table', 1),
(165, '2019_01_08_112015_add_document_column_to_transaction_payments_table', 1),
(166, '2019_01_10_124645_add_account_permission', 1),
(167, '2019_01_16_125825_add_subscription_no_column_to_transactions_table', 1),
(168, '2019_01_28_111647_add_order_addresses_column_to_transactions_table', 1),
(169, '2019_02_13_173821_add_is_inactive_column_to_products_table', 1),
(170, '2019_02_19_103118_create_discounts_table', 1),
(171, '2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table', 1),
(172, '2019_02_21_134324_add_permission_for_discount', 1),
(173, '2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table', 1),
(174, '2019_03_09_102425_add_sub_type_column_to_transactions_table', 1),
(175, '2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table', 1),
(176, '2019_03_12_120336_create_activity_log_table', 1),
(177, '2019_03_15_132925_create_media_table', 1),
(178, '2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table', 1),
(179, '2019_05_10_132311_add_missing_column_indexing', 1),
(180, '2019_05_14_091812_add_show_image_column_to_invoice_layouts_table', 1),
(181, '2019_05_25_104922_add_view_purchase_price_permission', 1),
(182, '2019_06_17_103515_add_profile_informations_columns_to_users_table', 1),
(183, '2019_06_18_135524_add_permission_to_view_own_sales_only', 1),
(184, '2019_06_19_112058_add_database_changes_for_reward_points', 1),
(185, '2019_06_28_133732_change_type_column_to_string_in_transactions_table', 1),
(186, '2019_07_13_111420_add_is_created_from_api_column_to_transactions_table', 1),
(187, '2019_07_15_165136_add_fields_for_combo_product', 1),
(188, '2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table', 1),
(189, '2019_07_22_152649_add_not_for_selling_in_product_table', 1),
(190, '2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table', 1),
(191, '2019_08_08_162302_add_sub_units_related_fields', 1),
(192, '2019_08_26_133419_update_price_fields_decimal_point', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_id`, `model_type`) VALUES
(1, 1, 'App\\User'),
(2, 2, 'App\\User'),
(1, 3, 'App\\User');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

DROP TABLE IF EXISTS `notification_templates`;
CREATE TABLE IF NOT EXISTS `notification_templates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `sms_body` text COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT '0',
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `subject`, `auto_send`, `auto_send_sms`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {paid_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', 'Thank you from {business_name}', 0, 0, '2019-09-18 12:19:43', '2019-09-18 12:19:43'),
(2, 1, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {paid_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {paid_amount}. {business_name}', 'Payment Received, from {business_name}', 0, 0, '2019-09-18 12:19:43', '2019-09-18 12:19:43'),
(3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', 'Payment Reminder, from {business_name}', 0, 0, '2019-09-18 12:19:43', '2019-09-18 12:19:43'),
(4, 1, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', 'Booking Confirmed - {business_name}', 0, 0, '2019-09-18 12:19:43', '2019-09-18 12:19:43'),
(5, 1, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {invoice_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {invoice_number}. Kindly process the products as soon as possible. {business_name}', 'New Order, from {business_name}', 0, 0, '2019-09-18 12:19:43', '2019-09-18 12:19:43'),
(6, 1, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {invoice_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {invoice_number}.\n                    Kindly note it down. {business_name}', 'Payment Paid, from {business_name}', 0, 0, '2019-09-18 12:19:43', '2019-09-18 12:19:43'),
(7, 1, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {invoice_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {invoice_number}. Thank you for processing it. {business_name}', 'Items received, from {business_name}', 0, 0, '2019-09-18 12:19:43', '2019-09-18 12:19:43'),
(8, 1, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {invoice_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {invoice_number} . Please process it as soon as possible.{business_name}', 'Items Pending, from {business_name}', 0, 0, '2019-09-18 12:19:43', '2019-09-18 12:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2019-09-18 12:16:40', NULL),
(2, 'direct_sell.access', 'web', '2019-09-18 12:16:40', NULL),
(3, 'product.opening_stock', 'web', '2019-09-18 12:16:42', '2019-09-18 12:16:42'),
(4, 'crud_all_bookings', 'web', '2019-09-18 12:16:43', '2019-09-18 12:16:43'),
(5, 'crud_own_bookings', 'web', '2019-09-18 12:16:43', '2019-09-18 12:16:43'),
(6, 'access_default_selling_price', 'web', '2019-09-18 12:16:45', '2019-09-18 12:16:45'),
(7, 'purchase.payments', 'web', '2019-09-18 12:16:46', '2019-09-18 12:16:46'),
(8, 'sell.payments', 'web', '2019-09-18 12:16:46', '2019-09-18 12:16:46'),
(9, 'edit_product_price_from_sale_screen', 'web', '2019-09-18 12:16:46', '2019-09-18 12:16:46'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2019-09-18 12:16:46', '2019-09-18 12:16:46'),
(11, 'roles.view', 'web', '2019-09-18 12:16:46', '2019-09-18 12:16:46'),
(12, 'roles.create', 'web', '2019-09-18 12:16:46', '2019-09-18 12:16:46'),
(13, 'roles.update', 'web', '2019-09-18 12:16:46', '2019-09-18 12:16:46'),
(14, 'roles.delete', 'web', '2019-09-18 12:16:46', '2019-09-18 12:16:46'),
(15, 'account.access', 'web', '2019-09-18 12:16:47', '2019-09-18 12:16:47'),
(16, 'discount.access', 'web', '2019-09-18 12:16:47', '2019-09-18 12:16:47'),
(17, 'view_purchase_price', 'web', '2019-09-18 12:16:48', '2019-09-18 12:16:48'),
(18, 'view_own_sell_only', 'web', '2019-09-18 12:16:48', '2019-09-18 12:16:48'),
(19, 'user.view', 'web', '2019-09-18 12:16:51', NULL),
(20, 'user.create', 'web', '2019-09-18 12:16:51', NULL),
(21, 'user.update', 'web', '2019-09-18 12:16:51', NULL),
(22, 'user.delete', 'web', '2019-09-18 12:16:51', NULL),
(23, 'supplier.view', 'web', '2019-09-18 12:16:51', NULL),
(24, 'supplier.create', 'web', '2019-09-18 12:16:51', NULL),
(25, 'supplier.update', 'web', '2019-09-18 12:16:51', NULL),
(26, 'supplier.delete', 'web', '2019-09-18 12:16:51', NULL),
(27, 'customer.view', 'web', '2019-09-18 12:16:51', NULL),
(28, 'customer.create', 'web', '2019-09-18 12:16:51', NULL),
(29, 'customer.update', 'web', '2019-09-18 12:16:51', NULL),
(30, 'customer.delete', 'web', '2019-09-18 12:16:51', NULL),
(31, 'product.view', 'web', '2019-09-18 12:16:51', NULL),
(32, 'product.create', 'web', '2019-09-18 12:16:51', NULL),
(33, 'product.update', 'web', '2019-09-18 12:16:51', NULL),
(34, 'product.delete', 'web', '2019-09-18 12:16:51', NULL),
(35, 'purchase.view', 'web', '2019-09-18 12:16:51', NULL),
(36, 'purchase.create', 'web', '2019-09-18 12:16:51', NULL),
(37, 'purchase.update', 'web', '2019-09-18 12:16:51', NULL),
(38, 'purchase.delete', 'web', '2019-09-18 12:16:51', NULL),
(39, 'sell.view', 'web', '2019-09-18 12:16:51', NULL),
(40, 'sell.create', 'web', '2019-09-18 12:16:51', NULL),
(41, 'sell.update', 'web', '2019-09-18 12:16:51', NULL),
(42, 'sell.delete', 'web', '2019-09-18 12:16:51', NULL),
(43, 'purchase_n_sell_report.view', 'web', '2019-09-18 12:16:51', NULL),
(44, 'contacts_report.view', 'web', '2019-09-18 12:16:51', NULL),
(45, 'stock_report.view', 'web', '2019-09-18 12:16:51', NULL),
(46, 'tax_report.view', 'web', '2019-09-18 12:16:51', NULL),
(47, 'trending_product_report.view', 'web', '2019-09-18 12:16:51', NULL),
(48, 'register_report.view', 'web', '2019-09-18 12:16:51', NULL),
(49, 'sales_representative.view', 'web', '2019-09-18 12:16:51', NULL),
(50, 'expense_report.view', 'web', '2019-09-18 12:16:51', NULL),
(51, 'business_settings.access', 'web', '2019-09-18 12:16:51', NULL),
(52, 'barcode_settings.access', 'web', '2019-09-18 12:16:51', NULL),
(53, 'invoice_settings.access', 'web', '2019-09-18 12:16:51', NULL),
(54, 'brand.view', 'web', '2019-09-18 12:16:51', NULL),
(55, 'brand.create', 'web', '2019-09-18 12:16:51', NULL),
(56, 'brand.update', 'web', '2019-09-18 12:16:51', NULL),
(57, 'brand.delete', 'web', '2019-09-18 12:16:51', NULL),
(58, 'tax_rate.view', 'web', '2019-09-18 12:16:51', NULL),
(59, 'tax_rate.create', 'web', '2019-09-18 12:16:51', NULL),
(60, 'tax_rate.update', 'web', '2019-09-18 12:16:51', NULL),
(61, 'tax_rate.delete', 'web', '2019-09-18 12:16:51', NULL),
(62, 'unit.view', 'web', '2019-09-18 12:16:51', NULL),
(63, 'unit.create', 'web', '2019-09-18 12:16:51', NULL),
(64, 'unit.update', 'web', '2019-09-18 12:16:51', NULL),
(65, 'unit.delete', 'web', '2019-09-18 12:16:51', NULL),
(66, 'category.view', 'web', '2019-09-18 12:16:51', NULL),
(67, 'category.create', 'web', '2019-09-18 12:16:51', NULL),
(68, 'category.update', 'web', '2019-09-18 12:16:51', NULL),
(69, 'category.delete', 'web', '2019-09-18 12:16:51', NULL),
(70, 'expense.access', 'web', '2019-09-18 12:16:51', NULL),
(71, 'access_all_locations', 'web', '2019-09-18 12:16:51', NULL),
(72, 'dashboard.data', 'web', '2019-09-18 12:16:51', NULL),
(73, 'location.1', 'web', '2019-09-18 12:19:43', '2019-09-18 12:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

DROP TABLE IF EXISTS `printers`;
CREATE TABLE IF NOT EXISTS `printers` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `printers_business_id_foreign` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int(11) UNSIGNED DEFAULT NULL,
  `sub_unit_ids` text COLLATE utf8mb4_unicode_ci,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT '0',
  `alert_quantity` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT '0',
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT '0',
  `not_for_selling` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_sub_category_id_foreign` (`sub_category_id`),
  KEY `products_tax_foreign` (`tax`),
  KEY `products_name_index` (`name`),
  KEY `products_business_id_index` (`business_id`),
  KEY `products_unit_id_index` (`unit_id`),
  KEY `products_created_by_index` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `product_description`, `created_by`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(1, 'Feiman Dress 0001', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0001', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 08:31:08', '2019-10-13 08:31:08'),
(2, 'Han Queen Dress 0002', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0002', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 08:32:46', '2019-10-13 08:32:46'),
(3, 'Dress 0003', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0003', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 08:36:23', '2019-10-13 08:36:23'),
(4, 'J&J Dress 0004', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0004', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 08:40:09', '2019-10-13 08:40:09'),
(5, 'Shirt 0005', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0005', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 08:47:40', '2019-10-13 08:47:40'),
(6, 'SET 0006', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0006', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 08:54:27', '2019-10-13 08:54:27'),
(7, 'Dress 0007', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0007', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 09:08:34', '2019-10-13 09:08:34'),
(8, 'SET 0008', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0008', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 09:13:25', '2019-10-13 09:13:25'),
(9, 'SET 0009', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0009', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 09:18:56', '2019-10-13 09:18:56'),
(10, 'Dress 0010', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0010', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 09:23:17', '2019-10-13 09:23:17'),
(11, 'Dress 0011', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0011', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 09:49:24', '2019-10-13 09:49:24'),
(12, 'Dress 0012', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0012', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 09:58:29', '2019-10-13 09:58:29'),
(13, 'Set 0013', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0013', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 10:00:11', '2019-10-13 10:00:11'),
(14, 'DRESS 0014', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0014', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 10:06:10', '2019-10-13 10:06:10'),
(15, 'SHIRT 0015', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0015', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 10:11:06', '2019-10-13 10:11:06'),
(16, 'SHIRT 0016', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0016', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 10:13:42', '2019-10-13 10:13:42'),
(17, 'SHIRT 0017', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0017', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 10:19:51', '2019-10-13 10:19:51'),
(18, 'SHIRT 0018', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0018', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 10:28:43', '2019-10-13 10:28:43'),
(19, 'SHIRT 0019', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0019', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 10:30:02', '2019-10-13 10:30:02'),
(20, 'SHIRT 0020', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0020', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 10:32:11', '2019-10-13 10:32:11'),
(21, 'SHIRT 0021', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0021', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 10:33:35', '2019-10-13 10:33:35'),
(22, 'SHIRT 0022', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0022', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 10:37:17', '2019-10-13 10:37:17'),
(23, 'SHIRT 0023', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0023', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 10:46:34', '2019-10-13 10:46:34'),
(24, 'DRESS 0024', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0024', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 10:48:48', '2019-10-13 10:48:48'),
(25, 'SHIRT 0025', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0025', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 10:50:12', '2019-10-13 10:50:12'),
(26, 'DRESS 0026', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0026', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 10:52:28', '2019-10-13 10:52:28'),
(27, 'DRESS 0027', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0027', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 10:53:56', '2019-10-13 10:53:56'),
(28, 'DRESS 0028', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0028', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 10:55:38', '2019-10-13 10:55:38'),
(29, 'SHIRT 0029', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0029', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 10:58:58', '2019-10-13 10:58:58'),
(30, 'DRESS 0030', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0030', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 11:01:53', '2019-10-13 11:01:53'),
(31, 'SHIRT 0031', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0031', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 11:06:56', '2019-10-13 11:06:56'),
(32, 'SET 0032', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0032', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 11:09:17', '2019-10-13 11:09:17'),
(33, 'SHIRT 0033', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0033', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 11:12:52', '2019-10-13 11:12:52'),
(34, 'SHIRT 0034', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0034', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, '2019-10-13 11:13:42', '2019-10-13 11:13:42'),
(35, 'Dress 0035', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0035', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-11 05:19:48', '2019-11-11 05:19:48'),
(36, 'Dress 0036', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0036', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-11 05:23:36', '2019-11-11 05:23:36'),
(37, 'Dress 0037', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0037', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-11 05:26:12', '2019-11-11 05:26:12'),
(38, 'Jeans 0038', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0038', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-11 05:31:19', '2019-11-11 05:31:19'),
(39, 'Dress 0039', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0039', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-11 05:33:11', '2019-11-11 05:33:11'),
(40, 'Pants 0040', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0040', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-11 05:35:17', '2019-11-11 05:35:17'),
(41, 'T-Shirt 0041', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0041', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-11 06:52:33', '2019-11-11 06:52:33'),
(42, 'Pants 0042', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0042', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-11 06:58:54', '2019-11-11 07:02:22'),
(43, 'Pants 0043', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0043', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-11 07:09:39', '2019-11-11 07:09:39'),
(44, 'Dress 0044', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0044', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-11 07:14:05', '2019-11-11 07:14:32'),
(45, 'Dress 0045', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0045', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-11 07:16:49', '2019-11-11 07:16:49'),
(46, 'Jeans 0046', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0046', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-11 07:23:18', '2019-11-11 07:23:18'),
(47, 'Dress 0047', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0047', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-11 07:57:08', '2019-11-11 07:57:08'),
(48, 'Skirt 0048', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0048', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-11 07:59:34', '2019-11-11 07:59:34'),
(49, 'Skirt 0049', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0049', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 13:22:08', '2019-11-12 13:22:08'),
(50, 'Set 0050', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0050', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 13:28:12', '2019-11-12 13:28:12'),
(51, 'Dress 0051', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0051', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 13:32:27', '2019-11-12 13:32:27'),
(52, 'Set 0052', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0052', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 13:39:56', '2019-11-12 13:39:56'),
(53, 'Set 0053', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0053', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 13:42:53', '2019-11-12 13:42:53'),
(54, 'T-Shirt 0054', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0054', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 13:51:54', '2019-11-12 13:51:54'),
(55, 'Dress 0055', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0055', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 13:56:44', '2019-11-12 13:56:44'),
(56, 'Set 0056', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0056', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 14:00:45', '2019-11-12 14:00:45'),
(57, 'Dress 0057', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0057', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 14:02:32', '2019-11-12 14:02:32'),
(58, 'T-Shirt 0058', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0058', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 14:04:15', '2019-11-12 14:04:15'),
(59, 'Shirt 0059', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0059', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 14:10:08', '2019-11-12 14:10:08'),
(60, 'Set 0060', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0060', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 14:17:22', '2019-11-12 14:17:22'),
(61, 'T-Shirt 0061', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0061', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 14:23:47', '2019-11-12 14:23:47'),
(62, 'T-Shirt 0062', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0062', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 14:26:11', '2019-11-12 14:26:11'),
(63, 'T-Shirt 0063', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0063', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 14:28:44', '2019-11-12 14:28:44'),
(64, 'T-Shirt 0064', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0064', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 14:31:15', '2019-11-12 14:31:15'),
(65, 'Shirt 0065', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0065', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 14:33:55', '2019-11-12 14:33:55'),
(66, 'T-Shirt 0066', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0066', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 14:36:42', '2019-11-12 14:36:42'),
(67, 'T-Shirt 0067', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0067', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 14:38:53', '2019-11-12 14:38:53'),
(68, 'T-Shirt 0068', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0068', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 14:39:44', '2019-11-12 14:39:44'),
(69, 'T-Shirt 0069', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0069', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 14:41:12', '2019-11-12 14:41:12'),
(70, 'T-Shirt 0070', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0070', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 14:42:55', '2019-11-12 14:42:55'),
(71, 'T-Shirt 0071', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0071', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 14:44:39', '2019-11-12 14:44:39'),
(72, 'Set 0072', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0072', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-12 15:02:16', '2019-11-16 16:07:18'),
(73, 'Set 0073', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0073', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-16 15:38:36', '2019-11-16 16:08:43'),
(74, 'Dress 0074', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0074', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-16 15:45:18', '2019-11-16 15:45:18'),
(75, 'Set 0075', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0075', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-16 15:55:13', '2019-11-16 15:55:13'),
(76, 'Set 0076', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0076', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-16 16:05:44', '2019-11-16 16:10:23'),
(77, 'Set 0077', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0077', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-20 10:36:56', '2019-11-20 10:36:56'),
(78, 'Dress 0078', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0078', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-20 10:43:41', '2019-11-20 10:43:41'),
(79, 'Dress 0079', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0079', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-20 10:50:09', '2019-11-20 10:50:09'),
(80, 'Dress 0080', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0080', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-20 10:52:16', '2019-11-20 10:52:16'),
(81, 'Dress 0081', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0081', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-20 10:54:19', '2019-11-20 10:54:19'),
(82, 'T-Shirt 0082', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0082', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-20 10:58:10', '2019-11-20 10:58:10'),
(83, 'Set 0083', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0083', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-20 10:59:50', '2019-11-20 10:59:50'),
(84, 'Dress 0084', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0084', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-20 11:02:37', '2019-11-20 11:02:37'),
(85, 'Shirt 0085', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0085', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-21 02:12:55', '2019-11-21 02:12:55'),
(86, 'Pants 0086', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0086', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-21 02:14:14', '2019-11-21 02:14:14'),
(87, 'T-Shirt 0087', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0087', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-21 02:20:30', '2019-11-21 02:20:30'),
(88, 'Set 0088', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0088', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-21 02:23:34', '2019-11-21 02:23:34'),
(89, 'Dress 0089', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0089', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-21 02:50:07', '2019-11-21 02:50:07'),
(90, 'Dress 0090', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0090', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-21 02:51:46', '2019-11-21 02:51:46'),
(91, 'T-Shirt 0091', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0091', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-21 04:29:04', '2019-11-21 04:29:04'),
(92, 'T-Shirt 0092', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0092', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-21 04:36:07', '2019-11-21 04:36:07'),
(93, 'T-Shirt 0093', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0093', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-21 04:40:10', '2019-11-21 04:40:10'),
(94, 'Dress 0094', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0094', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-21 04:57:55', '2019-11-21 04:57:55'),
(95, 'Set 0095', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0095', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-21 05:00:30', '2019-11-21 05:00:30'),
(96, 'Dress 0096', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0096', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 10:57:05', '2019-11-23 10:57:05'),
(97, 'Dress 0097', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0097', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 10:58:59', '2019-11-23 10:58:59'),
(98, 'Dress 0098', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0098', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 10:59:48', '2019-11-23 10:59:48'),
(99, 'Dress 0099', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0099', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 11:00:30', '2019-11-23 11:00:30'),
(100, 'Dress 0100', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0100', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 11:02:01', '2019-11-23 11:02:01'),
(101, 'Dress 0101', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0101', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 11:03:02', '2019-11-23 11:03:02'),
(102, 'Dress 0102', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0102', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 11:04:57', '2019-11-23 11:04:57'),
(103, 'Dress 0103', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0103', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 11:06:32', '2019-11-23 11:06:32'),
(104, 'Dress 0104', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0104', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 11:08:49', '2019-11-23 11:08:49'),
(105, 'Dress 0105', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0105', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 11:29:46', '2019-11-23 11:29:46'),
(106, 'Dress 0106', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0106', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 11:31:17', '2019-11-23 11:31:17'),
(107, 'Dress 0107', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0107', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 11:32:47', '2019-11-23 11:32:47'),
(108, 'Dress 0108', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0108', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 11:34:18', '2019-11-23 11:34:18'),
(109, 'Dress 0109', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0109', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 11:35:05', '2019-11-23 11:35:05'),
(110, 'Dress 0110', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0110', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 11:35:49', '2019-11-23 11:35:49'),
(111, 'Dress 0111', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0111', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 11:36:20', '2019-11-23 11:36:20'),
(112, 'Dress 0112', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0112', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 11:36:48', '2019-11-23 11:36:48'),
(113, 'Dress 0113', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0113', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 11:37:36', '2019-11-23 11:37:36'),
(114, 'Dress 0114', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0114', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 11:38:10', '2019-11-23 11:38:10'),
(115, 'Dress 0115', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0115', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 11:38:52', '2019-11-23 11:38:52'),
(116, 'Dress 0116', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0116', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 11:39:12', '2019-11-23 11:39:12'),
(117, 'Dress 0117', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0117', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 12:08:54', '2019-11-23 12:08:54'),
(118, 'Dress 0118', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0118', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 12:09:21', '2019-11-23 12:09:21'),
(119, 'Dress 0119', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0119', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 12:09:43', '2019-11-23 12:09:43'),
(120, 'Dress 0120', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0120', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 12:10:20', '2019-11-23 12:10:20'),
(121, 'Dress 0121', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0121', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 12:10:44', '2019-11-23 12:10:44'),
(122, 'Dress 0122', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0122', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 12:11:04', '2019-11-23 12:11:04'),
(123, 'Dress 0123', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0123', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 12:11:23', '2019-11-23 12:11:23'),
(124, 'Dress 0124', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0124', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 12:11:54', '2019-11-23 12:11:54'),
(125, 'Dress 0125', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0125', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 12:12:53', '2019-11-23 12:12:53'),
(126, 'Dress 0126', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0126', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 12:14:55', '2019-11-23 12:14:55'),
(127, 'Dress 0127', 1, 'variable', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, 0, '0127', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, '2019-11-23 12:15:58', '2019-11-23 12:15:58');

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

DROP TABLE IF EXISTS `product_racks`;
CREATE TABLE IF NOT EXISTS `product_racks` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rack` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

DROP TABLE IF EXISTS `product_variations`;
CREATE TABLE IF NOT EXISTS `product_variations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variations_name_index` (`name`),
  KEY `product_variations_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(1, NULL, 'DUMMY', 1, 1, '2019-10-13 08:31:08', '2019-10-13 08:31:08'),
(2, NULL, 'DUMMY', 2, 1, '2019-10-13 08:32:47', '2019-10-13 08:32:47'),
(3, 2, 'Size', 3, 0, '2019-10-13 08:36:23', '2019-10-13 08:36:23'),
(4, 2, 'Size', 4, 0, '2019-10-13 08:40:09', '2019-10-13 08:40:09'),
(5, 2, 'Size', 5, 0, '2019-10-13 08:47:40', '2019-10-13 08:47:40'),
(6, 2, 'Size', 6, 0, '2019-10-13 08:54:27', '2019-10-13 08:54:27'),
(7, 2, 'Size', 7, 0, '2019-10-13 09:08:34', '2019-10-13 09:08:34'),
(8, 1, 'Color', 8, 0, '2019-10-13 09:13:25', '2019-10-13 09:13:25'),
(9, 1, 'Color', 9, 0, '2019-10-13 09:18:56', '2019-10-13 09:18:56'),
(10, NULL, 'DUMMY', 10, 1, '2019-10-13 09:23:17', '2019-10-13 09:23:17'),
(15, 5, 'Size White', 11, 0, '2019-10-13 09:49:24', '2019-10-13 09:49:24'),
(16, 4, 'Size Black', 12, 0, '2019-10-13 09:58:29', '2019-10-13 09:58:29'),
(17, 7, 'Size Blue', 12, 0, '2019-10-13 09:58:29', '2019-10-13 09:58:29'),
(18, 8, 'Size Pink', 12, 0, '2019-10-13 09:58:29', '2019-10-13 09:58:29'),
(19, 9, 'Size Brown', 13, 0, '2019-10-13 10:00:11', '2019-10-13 10:00:11'),
(20, 2, 'Size', 14, 0, '2019-10-13 10:06:10', '2019-10-13 10:06:10'),
(21, 4, 'Size Black', 5, 0, '2019-10-13 10:08:03', '2019-10-13 10:08:03'),
(22, 5, 'Size White', 5, 0, '2019-10-13 10:08:03', '2019-10-13 10:08:03'),
(23, 6, 'Size Yellow', 15, 0, '2019-10-13 10:11:06', '2019-10-13 10:11:06'),
(24, 10, 'SIZE', 16, 0, '2019-10-13 10:13:42', '2019-10-13 10:13:42'),
(25, 4, 'Size Black', 17, 0, '2019-10-13 10:19:51', '2019-10-13 10:19:51'),
(26, 5, 'Size White', 17, 0, '2019-10-13 10:19:51', '2019-10-13 10:19:51'),
(27, 12, 'Size Red', 18, 0, '2019-10-13 10:28:43', '2019-10-13 10:28:43'),
(28, 11, 'Size Orange', 18, 0, '2019-10-13 10:28:43', '2019-10-13 10:28:43'),
(29, 10, 'SIZE', 19, 0, '2019-10-13 10:30:02', '2019-10-13 10:30:02'),
(30, 10, 'SIZE', 20, 0, '2019-10-13 10:32:11', '2019-10-13 10:32:11'),
(31, 10, 'SIZE', 21, 0, '2019-10-13 10:33:35', '2019-10-13 10:33:35'),
(32, 1, 'Color', 22, 0, '2019-10-13 10:37:17', '2019-10-13 10:37:17'),
(33, 10, 'SIZE', 23, 0, '2019-10-13 10:46:34', '2019-10-13 10:46:34'),
(34, 10, 'SIZE', 24, 0, '2019-10-13 10:48:48', '2019-10-13 10:48:48'),
(35, NULL, 'DUMMY', 25, 1, '2019-10-13 10:50:12', '2019-10-13 10:50:12'),
(36, 10, 'SIZE', 26, 0, '2019-10-13 10:52:28', '2019-10-13 10:52:28'),
(37, 10, 'SIZE', 27, 0, '2019-10-13 10:53:56', '2019-10-13 10:53:56'),
(38, 10, 'SIZE', 28, 0, '2019-10-13 10:55:38', '2019-10-13 10:55:38'),
(39, 10, 'SIZE', 29, 0, '2019-10-13 10:58:58', '2019-10-13 10:58:58'),
(40, 10, 'SIZE', 30, 0, '2019-10-13 11:01:53', '2019-10-13 11:01:53'),
(41, 8, 'Size Pink', 31, 0, '2019-10-13 11:06:56', '2019-10-13 11:06:56'),
(42, 13, 'Size Grey', 31, 0, '2019-10-13 11:06:56', '2019-10-13 11:06:56'),
(43, 4, 'Size Black', 32, 0, '2019-10-13 11:09:17', '2019-10-13 11:09:17'),
(44, 7, 'Size Blue', 32, 0, '2019-10-13 11:09:17', '2019-10-13 11:09:17'),
(45, 10, 'SIZE', 33, 0, '2019-10-13 11:12:52', '2019-10-13 11:12:52'),
(46, 10, 'SIZE', 34, 0, '2019-10-13 11:13:42', '2019-10-13 11:13:42'),
(47, NULL, 'DUMMY', 35, 1, '2019-11-11 05:19:48', '2019-11-11 05:19:48'),
(48, 7, 'Size Blue', 36, 0, '2019-11-11 05:23:36', '2019-11-11 05:23:36'),
(49, 13, 'Size Grey', 37, 0, '2019-11-11 05:26:12', '2019-11-11 05:26:12'),
(50, 10, 'SIZE', 38, 0, '2019-11-11 05:31:19', '2019-11-11 05:31:19'),
(51, 10, 'SIZE', 39, 0, '2019-11-11 05:33:11', '2019-11-11 05:33:11'),
(52, 10, 'SIZE', 40, 0, '2019-11-11 05:35:17', '2019-11-11 05:35:17'),
(53, 5, 'Size White', 41, 0, '2019-11-11 06:52:33', '2019-11-11 06:52:33'),
(54, 13, 'Size Grey', 41, 0, '2019-11-11 06:52:33', '2019-11-11 06:52:33'),
(55, 4, 'Size Black', 42, 0, '2019-11-11 06:58:54', '2019-11-11 06:58:54'),
(56, 7, 'Size Blue', 42, 0, '2019-11-11 06:58:54', '2019-11-11 06:58:54'),
(57, 4, 'Size Black', 43, 0, '2019-11-11 07:09:39', '2019-11-11 07:09:39'),
(58, NULL, 'DUMMY', 44, 1, '2019-11-11 07:14:05', '2019-11-11 07:14:05'),
(59, 4, 'Size Black', 45, 0, '2019-11-11 07:16:49', '2019-11-11 07:16:49'),
(60, 6, 'Size Yellow', 45, 0, '2019-11-11 07:19:29', '2019-11-11 07:19:29'),
(61, 4, 'Size Black', 46, 0, '2019-11-11 07:23:18', '2019-11-11 07:23:18'),
(62, 8, 'Size Pink', 47, 0, '2019-11-11 07:57:08', '2019-11-11 07:57:08'),
(63, 8, 'Size Pink', 48, 0, '2019-11-11 07:59:34', '2019-11-11 07:59:34'),
(64, 7, 'Size Blue', 48, 0, '2019-11-11 08:00:52', '2019-11-11 08:00:52'),
(65, 4, 'Size Black', 49, 0, '2019-11-12 13:22:08', '2019-11-12 13:22:08'),
(66, 7, 'Size Blue', 49, 0, '2019-11-12 13:22:08', '2019-11-12 13:22:08'),
(67, 10, 'SIZE', 50, 0, '2019-11-12 13:28:12', '2019-11-12 13:28:12'),
(68, 10, 'SIZE', 51, 0, '2019-11-12 13:32:27', '2019-11-12 13:32:27'),
(69, 4, 'Size Black', 52, 0, '2019-11-12 13:39:56', '2019-11-12 13:39:56'),
(70, 5, 'Size White', 52, 0, '2019-11-12 13:39:56', '2019-11-12 13:39:56'),
(71, 6, 'Size Yellow', 52, 0, '2019-11-12 13:39:56', '2019-11-12 13:39:56'),
(72, 7, 'Size Blue', 52, 0, '2019-11-12 13:39:56', '2019-11-12 13:39:56'),
(73, 10, 'SIZE', 53, 0, '2019-11-12 13:42:53', '2019-11-12 13:42:53'),
(74, NULL, 'DUMMY', 54, 1, '2019-11-12 13:51:54', '2019-11-12 13:51:54'),
(75, 4, 'Size Black', 55, 0, '2019-11-12 13:56:44', '2019-11-12 13:56:44'),
(76, 5, 'Size White', 55, 0, '2019-11-12 13:56:44', '2019-11-12 13:56:44'),
(77, 11, 'Size Orange', 56, 0, '2019-11-12 14:00:45', '2019-11-12 14:00:45'),
(78, 7, 'Size Blue', 56, 0, '2019-11-12 14:00:45', '2019-11-12 14:00:45'),
(79, NULL, 'DUMMY', 57, 1, '2019-11-12 14:02:32', '2019-11-12 14:02:32'),
(80, 10, 'SIZE', 58, 0, '2019-11-12 14:04:15', '2019-11-12 14:04:15'),
(81, 8, 'Size Pink', 59, 0, '2019-11-12 14:10:08', '2019-11-12 14:10:08'),
(82, 11, 'Size Orange', 59, 0, '2019-11-12 14:10:08', '2019-11-12 14:10:08'),
(83, 4, 'Size Black', 59, 0, '2019-11-12 14:10:08', '2019-11-12 14:10:08'),
(84, 8, 'Size Pink', 60, 0, '2019-11-12 14:17:22', '2019-11-12 14:17:22'),
(85, 6, 'Size Yellow', 60, 0, '2019-11-12 14:17:22', '2019-11-12 14:17:22'),
(86, 12, 'Size Red', 60, 0, '2019-11-12 14:17:22', '2019-11-12 14:17:22'),
(87, NULL, 'DUMMY', 61, 1, '2019-11-12 14:23:47', '2019-11-12 14:23:47'),
(88, 10, 'SIZE', 62, 0, '2019-11-12 14:26:11', '2019-11-12 14:26:11'),
(89, 10, 'SIZE', 63, 0, '2019-11-12 14:28:44', '2019-11-12 14:28:44'),
(90, 10, 'SIZE', 64, 0, '2019-11-12 14:31:15', '2019-11-12 14:31:15'),
(91, 12, 'Size Red', 65, 0, '2019-11-12 14:33:55', '2019-11-12 14:33:55'),
(92, 5, 'Size White', 65, 0, '2019-11-12 14:33:55', '2019-11-12 14:33:55'),
(93, 5, 'Size White', 66, 0, '2019-11-12 14:36:42', '2019-11-12 14:36:42'),
(94, 8, 'Size Pink', 66, 0, '2019-11-12 14:36:42', '2019-11-12 14:36:42'),
(95, 4, 'Size Black', 67, 0, '2019-11-12 14:38:53', '2019-11-12 14:38:53'),
(96, 5, 'Size White', 67, 0, '2019-11-12 14:38:53', '2019-11-12 14:38:53'),
(97, NULL, 'DUMMY', 68, 1, '2019-11-12 14:39:44', '2019-11-12 14:39:44'),
(98, 10, 'SIZE', 69, 0, '2019-11-12 14:41:12', '2019-11-12 14:41:12'),
(99, 10, 'SIZE', 70, 0, '2019-11-12 14:42:55', '2019-11-12 14:42:55'),
(100, 10, 'SIZE', 71, 0, '2019-11-12 14:44:39', '2019-11-12 14:44:39'),
(101, 5, 'Size White', 72, 0, '2019-11-12 15:02:16', '2019-11-12 15:02:16'),
(102, 7, 'Size Blue', 72, 0, '2019-11-12 15:02:16', '2019-11-12 15:02:16'),
(103, NULL, 'DUMMY', 73, 1, '2019-11-16 15:38:36', '2019-11-16 15:38:36'),
(104, 5, 'Size White', 74, 0, '2019-11-16 15:45:18', '2019-11-16 15:45:18'),
(105, 4, 'Size Black', 74, 0, '2019-11-16 15:45:18', '2019-11-16 15:45:18'),
(106, 7, 'Size Blue', 74, 0, '2019-11-16 15:45:18', '2019-11-16 15:45:18'),
(107, 8, 'Size Pink', 74, 0, '2019-11-16 15:45:18', '2019-11-16 15:45:18'),
(108, 12, 'Size Red', 75, 0, '2019-11-16 15:55:13', '2019-11-16 15:55:13'),
(109, 7, 'Size Blue', 75, 0, '2019-11-16 15:55:13', '2019-11-16 15:55:13'),
(110, 8, 'Size Pink', 76, 0, '2019-11-16 16:05:44', '2019-11-16 16:05:44'),
(111, 4, 'Size Black', 76, 0, '2019-11-16 16:05:44', '2019-11-16 16:05:44'),
(112, 7, 'Size Blue', 76, 0, '2019-11-16 16:05:44', '2019-11-16 16:05:44'),
(113, 15, 'Size Caramel', 77, 0, '2019-11-20 10:36:56', '2019-11-20 10:36:56'),
(114, 4, 'Size Black', 77, 0, '2019-11-20 10:36:56', '2019-11-20 10:36:56'),
(115, 15, 'Size Caramel', 78, 0, '2019-11-20 10:43:41', '2019-11-20 10:43:41'),
(116, 4, 'Size Black', 78, 0, '2019-11-20 10:43:41', '2019-11-20 10:43:41'),
(117, 15, 'Size Caramel', 79, 0, '2019-11-20 10:50:09', '2019-11-20 10:50:09'),
(118, 4, 'Size Black', 79, 0, '2019-11-20 10:50:09', '2019-11-20 10:50:09'),
(119, 15, 'Size Caramel', 80, 0, '2019-11-20 10:52:16', '2019-11-20 10:52:16'),
(120, NULL, 'DUMMY', 81, 1, '2019-11-20 10:54:19', '2019-11-20 10:54:19'),
(121, 14, 'COLOR', 82, 0, '2019-11-20 10:58:10', '2019-11-20 10:58:10'),
(122, NULL, 'DUMMY', 83, 1, '2019-11-20 10:59:50', '2019-11-20 10:59:50'),
(123, 4, 'Size Black', 84, 0, '2019-11-20 11:02:37', '2019-11-20 11:02:37'),
(124, 6, 'Size Yellow', 85, 0, '2019-11-21 02:12:55', '2019-11-21 02:12:55'),
(125, 8, 'Size Pink', 85, 0, '2019-11-21 02:12:55', '2019-11-21 02:12:55'),
(126, 10, 'SIZE', 86, 0, '2019-11-21 02:14:14', '2019-11-21 02:14:14'),
(127, 10, 'SIZE', 87, 0, '2019-11-21 02:20:30', '2019-11-21 02:20:30'),
(128, 11, 'Size Orange', 88, 0, '2019-11-21 02:23:34', '2019-11-21 02:23:34'),
(129, 4, 'Size Black', 88, 0, '2019-11-21 02:23:34', '2019-11-21 02:23:34'),
(130, 16, 'Size Green', 88, 0, '2019-11-21 02:26:55', '2019-11-21 02:26:55'),
(131, 14, 'COLOR', 89, 0, '2019-11-21 02:50:07', '2019-11-21 02:50:07'),
(132, 10, 'SIZE', 90, 0, '2019-11-21 02:51:46', '2019-11-21 02:51:46'),
(133, 14, 'COLOR', 91, 0, '2019-11-21 04:29:04', '2019-11-21 04:29:04'),
(134, 14, 'COLOR', 92, 0, '2019-11-21 04:36:07', '2019-11-21 04:36:07'),
(135, 14, 'COLOR', 93, 0, '2019-11-21 04:40:10', '2019-11-21 04:40:10'),
(136, 10, 'SIZE', 94, 0, '2019-11-21 04:57:55', '2019-11-21 04:57:55'),
(137, 10, 'SIZE', 95, 0, '2019-11-21 05:00:30', '2019-11-21 05:00:30'),
(138, 15, 'Size Caramel', 96, 0, '2019-11-23 10:57:05', '2019-11-23 10:57:05'),
(139, 4, 'Size Black', 96, 0, '2019-11-23 10:57:05', '2019-11-23 10:57:05'),
(140, NULL, 'DUMMY', 97, 1, '2019-11-23 10:58:59', '2019-11-23 10:58:59'),
(141, NULL, 'DUMMY', 98, 1, '2019-11-23 10:59:48', '2019-11-23 10:59:48'),
(142, NULL, 'DUMMY', 99, 1, '2019-11-23 11:00:30', '2019-11-23 11:00:30'),
(143, 10, 'SIZE', 100, 0, '2019-11-23 11:02:01', '2019-11-23 11:02:01'),
(144, NULL, 'DUMMY', 101, 1, '2019-11-23 11:03:02', '2019-11-23 11:03:02'),
(145, 10, 'SIZE', 102, 0, '2019-11-23 11:04:57', '2019-11-23 11:04:57'),
(146, 10, 'SIZE', 103, 0, '2019-11-23 11:06:32', '2019-11-23 11:06:32'),
(147, 10, 'SIZE', 104, 0, '2019-11-23 11:08:49', '2019-11-23 11:08:49'),
(148, NULL, 'DUMMY', 105, 1, '2019-11-23 11:29:46', '2019-11-23 11:29:46'),
(149, 10, 'SIZE', 106, 0, '2019-11-23 11:31:17', '2019-11-23 11:31:17'),
(150, 10, 'SIZE', 107, 0, '2019-11-23 11:32:47', '2019-11-23 11:32:47'),
(151, 10, 'SIZE', 108, 0, '2019-11-23 11:34:18', '2019-11-23 11:34:18'),
(152, NULL, 'DUMMY', 109, 1, '2019-11-23 11:35:05', '2019-11-23 11:35:05'),
(153, NULL, 'DUMMY', 110, 1, '2019-11-23 11:35:49', '2019-11-23 11:35:49'),
(154, NULL, 'DUMMY', 111, 1, '2019-11-23 11:36:20', '2019-11-23 11:36:20'),
(155, NULL, 'DUMMY', 112, 1, '2019-11-23 11:36:48', '2019-11-23 11:36:48'),
(156, NULL, 'DUMMY', 113, 1, '2019-11-23 11:37:36', '2019-11-23 11:37:36'),
(157, NULL, 'DUMMY', 114, 1, '2019-11-23 11:38:10', '2019-11-23 11:38:10'),
(158, NULL, 'DUMMY', 115, 1, '2019-11-23 11:38:52', '2019-11-23 11:38:52'),
(159, NULL, 'DUMMY', 116, 1, '2019-11-23 11:39:12', '2019-11-23 11:39:12'),
(160, NULL, 'DUMMY', 117, 1, '2019-11-23 12:08:54', '2019-11-23 12:08:54'),
(161, NULL, 'DUMMY', 118, 1, '2019-11-23 12:09:21', '2019-11-23 12:09:21'),
(162, NULL, 'DUMMY', 119, 1, '2019-11-23 12:09:43', '2019-11-23 12:09:43'),
(163, NULL, 'DUMMY', 120, 1, '2019-11-23 12:10:20', '2019-11-23 12:10:20'),
(164, NULL, 'DUMMY', 121, 1, '2019-11-23 12:10:44', '2019-11-23 12:10:44'),
(165, NULL, 'DUMMY', 122, 1, '2019-11-23 12:11:04', '2019-11-23 12:11:04'),
(166, NULL, 'DUMMY', 123, 1, '2019-11-23 12:11:23', '2019-11-23 12:11:23'),
(167, NULL, 'DUMMY', 124, 1, '2019-11-23 12:11:54', '2019-11-23 12:11:54'),
(168, 10, 'SIZE', 125, 0, '2019-11-23 12:12:53', '2019-11-23 12:12:53'),
(169, 14, 'COLOR', 126, 0, '2019-11-23 12:14:55', '2019-11-23 12:14:55'),
(170, 10, 'SIZE', 127, 0, '2019-11-23 12:15:58', '2019-11-23 12:15:58');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

DROP TABLE IF EXISTS `purchase_lines`;
CREATE TABLE IF NOT EXISTS `purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(20,4) NOT NULL,
  `pp_without_discount` decimal(22,4) DEFAULT '0.0000',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) DEFAULT NULL,
  `purchase_price_inc_tax` decimal(22,4) DEFAULT '0.0000',
  `item_tax` decimal(22,4) DEFAULT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `quantity_sold` decimal(20,4) DEFAULT '0.0000',
  `quantity_adjusted` decimal(20,4) DEFAULT '0.0000',
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `mfg_quantity_used` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  KEY `purchase_lines_product_id_foreign` (`product_id`),
  KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 08:31:20', '2019-10-13 08:31:20'),
(2, 2, 2, 2, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 08:32:50', '2019-10-13 08:32:50'),
(3, 3, 3, 3, '2.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 08:36:29', '2019-10-13 08:36:29'),
(4, 3, 3, 4, '2.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 08:36:29', '2019-10-13 08:36:29'),
(5, 3, 3, 5, '2.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 08:36:29', '2019-10-13 08:36:29'),
(6, 4, 4, 6, '4.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 08:40:25', '2019-10-13 08:40:25'),
(7, 4, 4, 7, '2.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 08:40:25', '2019-10-13 08:40:25'),
(8, 4, 4, 8, '2.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 08:40:25', '2019-10-13 08:40:25'),
(15, 6, 6, 15, '1.0000', '31.0000', '0.00', '31.0000', '31.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 08:55:02', '2019-10-13 08:55:02'),
(16, 6, 6, 16, '1.0000', '31.0000', '0.00', '31.0000', '31.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 08:55:02', '2019-10-13 08:55:02'),
(17, 6, 6, 17, '1.0000', '31.0000', '0.00', '31.0000', '31.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 08:55:02', '2019-10-13 08:55:02'),
(18, 6, 6, 18, '1.0000', '31.0000', '0.00', '31.0000', '31.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 08:55:02', '2019-10-13 08:55:02'),
(19, 6, 6, 19, '1.0000', '31.0000', '0.00', '31.0000', '31.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 08:55:02', '2019-10-13 08:55:02'),
(20, 6, 6, 20, '1.0000', '31.0000', '0.00', '31.0000', '31.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 08:55:02', '2019-10-13 08:55:02'),
(21, 6, 6, 21, '1.0000', '31.0000', '0.00', '31.0000', '31.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 08:55:02', '2019-10-13 08:55:02'),
(22, 7, 7, 22, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:08:42', '2019-10-13 09:08:42'),
(23, 7, 7, 23, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:08:42', '2019-10-13 09:08:42'),
(24, 7, 7, 24, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:08:42', '2019-10-13 09:08:42'),
(25, 7, 7, 25, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:08:42', '2019-10-13 09:08:42'),
(26, 8, 8, 26, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:13:33', '2019-10-13 09:13:33'),
(27, 8, 8, 27, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:13:33', '2019-10-13 09:13:33'),
(28, 8, 8, 28, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:13:33', '2019-10-13 09:13:33'),
(29, 8, 8, 29, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:13:33', '2019-10-13 09:13:33'),
(30, 8, 8, 30, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:13:33', '2019-10-13 09:13:33'),
(31, 8, 8, 31, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:13:33', '2019-10-13 09:13:33'),
(32, 8, 8, 32, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:13:33', '2019-10-13 09:13:33'),
(33, 8, 8, 33, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:13:33', '2019-10-13 09:13:33'),
(36, 9, 9, 36, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:19:04', '2019-10-13 09:19:04'),
(37, 9, 9, 37, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:19:04', '2019-10-13 09:19:04'),
(38, 9, 9, 38, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:19:04', '2019-10-13 09:19:04'),
(39, 9, 9, 39, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:19:04', '2019-10-13 09:19:04'),
(40, 9, 9, 40, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:19:04', '2019-10-13 09:19:04'),
(41, 9, 9, 41, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:19:04', '2019-10-13 09:19:04'),
(42, 9, 9, 42, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:19:04', '2019-10-13 09:19:04'),
(43, 9, 9, 43, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:19:04', '2019-10-13 09:19:04'),
(44, 10, 10, 44, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:23:24', '2019-10-13 09:23:24'),
(54, 13, 11, 58, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:49:28', '2019-10-13 09:49:28'),
(55, 13, 11, 59, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:49:28', '2019-10-13 09:49:28'),
(56, 13, 11, 60, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:49:28', '2019-10-13 09:49:28'),
(57, 11, 12, 61, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(58, 11, 12, 62, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(59, 11, 12, 63, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(60, 11, 12, 64, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(61, 11, 12, 65, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(62, 11, 12, 66, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(63, 11, 12, 67, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(64, 11, 12, 68, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(65, 11, 12, 69, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(66, 11, 12, 70, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(67, 12, 13, 71, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:00:17', '2019-10-13 10:00:17'),
(68, 12, 13, 72, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:00:17', '2019-10-13 10:00:17'),
(69, 12, 13, 73, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:00:17', '2019-10-13 10:00:17'),
(70, 12, 13, 74, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:00:17', '2019-10-13 10:00:17'),
(71, 14, 14, 75, '1.0000', '23.0000', '0.00', '23.0000', '23.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:06:23', '2019-10-13 10:06:23'),
(72, 14, 14, 76, '1.0000', '23.0000', '0.00', '23.0000', '23.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:06:23', '2019-10-13 10:06:23'),
(73, 14, 14, 77, '1.0000', '23.0000', '0.00', '23.0000', '23.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:06:23', '2019-10-13 10:06:23'),
(74, 5, 5, 78, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:08:51', '2019-10-13 10:08:51'),
(75, 5, 5, 79, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:08:51', '2019-10-13 10:08:51'),
(76, 5, 5, 80, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:08:51', '2019-10-13 10:08:51'),
(77, 5, 5, 81, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:08:51', '2019-10-13 10:08:51'),
(78, 5, 5, 82, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:08:51', '2019-10-13 10:08:51'),
(79, 5, 5, 83, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:08:51', '2019-10-13 10:08:51'),
(80, 5, 5, 84, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:08:51', '2019-10-13 10:08:51'),
(81, 5, 5, 85, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:08:51', '2019-10-13 10:08:51'),
(82, 15, 15, 86, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:11:14', '2019-10-13 10:11:14'),
(83, 15, 15, 87, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:11:14', '2019-10-13 10:11:14'),
(84, 15, 15, 88, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:11:14', '2019-10-13 10:11:14'),
(85, 15, 15, 89, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:11:14', '2019-10-13 10:11:14'),
(86, 16, 16, 90, '1.0000', '18.0000', '0.00', '18.0000', '18.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:13:47', '2019-10-13 10:13:47'),
(87, 16, 16, 91, '1.0000', '18.0000', '0.00', '18.0000', '18.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:13:47', '2019-10-13 10:13:47'),
(88, 16, 16, 92, '1.0000', '18.0000', '0.00', '18.0000', '18.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:13:47', '2019-10-13 10:13:47'),
(89, 16, 16, 93, '1.0000', '18.0000', '0.00', '18.0000', '18.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:13:47', '2019-10-13 10:13:47'),
(90, 17, 17, 94, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:19:59', '2019-10-13 10:19:59'),
(91, 17, 17, 95, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:19:59', '2019-10-13 10:19:59'),
(92, 17, 17, 96, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:19:59', '2019-10-13 10:19:59'),
(93, 17, 17, 97, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:19:59', '2019-10-13 10:19:59'),
(94, 17, 17, 98, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:19:59', '2019-10-13 10:19:59'),
(95, 17, 17, 99, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:19:59', '2019-10-13 10:19:59'),
(96, 17, 17, 100, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:19:59', '2019-10-13 10:19:59'),
(97, 18, 18, 101, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:28:54', '2019-10-13 10:28:54'),
(98, 18, 18, 102, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:28:54', '2019-10-13 10:28:54'),
(99, 18, 18, 103, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:28:54', '2019-10-13 10:28:54'),
(100, 18, 18, 104, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:28:54', '2019-10-13 10:28:54'),
(101, 18, 18, 105, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:28:54', '2019-10-13 10:28:54'),
(102, 18, 18, 106, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:28:54', '2019-10-13 10:28:54'),
(103, 18, 18, 107, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:28:54', '2019-10-13 10:28:54'),
(104, 19, 19, 108, '1.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:30:08', '2019-10-13 11:11:17'),
(105, 19, 19, 109, '1.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:30:08', '2019-10-13 11:11:17'),
(106, 19, 19, 110, '1.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:30:08', '2019-10-13 11:11:17'),
(107, 19, 19, 111, '1.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:30:08', '2019-10-13 11:11:17'),
(108, 20, 20, 112, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:32:16', '2019-10-13 10:32:16'),
(109, 20, 20, 113, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:32:16', '2019-10-13 10:32:16'),
(110, 20, 20, 114, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:32:16', '2019-10-13 10:32:16'),
(111, 20, 20, 115, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:32:16', '2019-10-13 10:32:16'),
(112, 21, 21, 116, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:33:39', '2019-10-13 10:33:39'),
(113, 21, 21, 117, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:33:39', '2019-10-13 10:33:39'),
(114, 21, 21, 118, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:33:39', '2019-10-13 10:33:39'),
(115, 21, 21, 119, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:33:39', '2019-10-13 10:33:39'),
(116, 22, 22, 120, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:37:23', '2019-10-13 10:37:23'),
(117, 22, 22, 121, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:37:23', '2019-10-13 10:37:23'),
(118, 22, 22, 122, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:37:23', '2019-10-13 10:37:23'),
(119, 23, 23, 123, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:46:40', '2019-10-13 10:46:40'),
(120, 23, 23, 124, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:46:40', '2019-10-13 10:46:40'),
(121, 23, 23, 125, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:46:40', '2019-10-13 10:46:40'),
(122, 23, 23, 126, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:46:40', '2019-10-13 10:46:40'),
(123, 24, 24, 127, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:48:53', '2019-10-13 10:48:53'),
(124, 24, 24, 128, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:48:53', '2019-10-13 10:48:53'),
(125, 24, 24, 129, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:48:53', '2019-10-13 10:48:53'),
(126, 25, 25, 130, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:50:17', '2019-10-13 10:50:17'),
(127, 26, 26, 131, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:52:33', '2019-10-13 10:52:33'),
(128, 26, 26, 132, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:52:33', '2019-10-13 10:52:33'),
(129, 26, 26, 133, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:52:33', '2019-10-13 10:52:33'),
(130, 26, 26, 134, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:52:33', '2019-10-13 10:52:33'),
(131, 27, 27, 135, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:54:01', '2019-10-13 10:54:01'),
(132, 27, 27, 136, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:54:01', '2019-10-13 10:54:01'),
(133, 27, 27, 137, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:54:01', '2019-10-13 10:54:01'),
(134, 28, 28, 138, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:55:44', '2019-10-13 10:55:44'),
(135, 28, 28, 139, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:55:44', '2019-10-13 10:55:44'),
(136, 28, 28, 140, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:55:44', '2019-10-13 10:55:44'),
(137, 28, 28, 141, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:55:44', '2019-10-13 10:55:44'),
(138, 29, 29, 142, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:59:03', '2019-10-13 10:59:03'),
(139, 29, 29, 143, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:59:03', '2019-10-13 10:59:03'),
(140, 29, 29, 144, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:59:03', '2019-10-13 10:59:03'),
(141, 29, 29, 145, '1.0000', '19.0000', '0.00', '19.0000', '19.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 10:59:03', '2019-10-13 10:59:03'),
(142, 30, 30, 146, '1.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:02:00', '2019-10-13 11:02:00'),
(143, 30, 30, 147, '1.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:02:00', '2019-10-13 11:02:00'),
(144, 30, 30, 148, '1.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:02:00', '2019-10-13 11:02:00'),
(145, 30, 30, 149, '1.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:02:00', '2019-10-13 11:02:00'),
(146, 30, 30, 150, '1.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:02:00', '2019-10-13 11:02:00'),
(147, 31, 31, 151, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:07:13', '2019-10-13 11:07:13'),
(148, 31, 31, 152, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:07:13', '2019-10-13 11:07:13'),
(149, 31, 31, 153, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:07:13', '2019-10-13 11:07:13'),
(150, 31, 31, 154, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:07:13', '2019-10-13 11:07:13'),
(151, 31, 31, 155, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:07:13', '2019-10-13 11:07:13'),
(152, 31, 31, 156, '2.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:07:13', '2019-10-13 11:07:13'),
(153, 32, 32, 157, '2.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:09:27', '2019-10-13 11:09:27'),
(154, 32, 32, 158, '2.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:09:27', '2019-10-13 11:09:27'),
(155, 32, 32, 159, '2.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:09:27', '2019-10-13 11:09:27'),
(156, 32, 32, 160, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:09:27', '2019-10-13 11:09:27'),
(157, 32, 32, 161, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:09:27', '2019-10-13 11:09:27'),
(158, 32, 32, 162, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:09:27', '2019-10-13 11:09:27'),
(159, 19, 19, 163, '1.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:11:17', '2019-10-13 11:11:17'),
(160, 33, 33, 164, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:12:57', '2019-10-13 11:12:57'),
(161, 33, 33, 165, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:12:57', '2019-10-13 11:12:57'),
(162, 33, 33, 166, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:12:57', '2019-10-13 11:12:57'),
(163, 34, 34, 167, '1.0000', '18.0000', '0.00', '18.0000', '18.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:13:46', '2019-10-13 11:13:46'),
(164, 34, 34, 168, '1.0000', '18.0000', '0.00', '18.0000', '18.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-10-13 11:13:46', '2019-10-13 11:13:46'),
(165, 35, 36, 170, '1.0000', '285.0000', '0.00', '285.0000', '285.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 05:23:45', '2019-11-11 05:23:45'),
(166, 35, 36, 171, '1.0000', '285.0000', '0.00', '285.0000', '285.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 05:23:45', '2019-11-11 05:23:45'),
(167, 36, 35, 169, '1.0000', '266.0000', '0.00', '266.0000', '266.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 05:24:09', '2019-11-11 05:24:09'),
(168, 37, 37, 172, '1.0000', '255.0000', '0.00', '255.0000', '255.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 05:26:17', '2019-11-11 05:26:17'),
(169, 37, 37, 173, '1.0000', '255.0000', '0.00', '255.0000', '255.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 05:26:17', '2019-11-11 05:26:17'),
(170, 38, 38, 174, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 05:31:25', '2019-11-11 05:31:25'),
(171, 38, 38, 175, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 05:31:25', '2019-11-11 05:31:25'),
(172, 38, 38, 176, '2.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 05:31:25', '2019-11-11 05:31:25'),
(173, 39, 39, 177, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 05:33:16', '2019-11-11 05:33:16'),
(174, 39, 39, 178, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 05:33:16', '2019-11-11 05:33:16'),
(175, 40, 40, 179, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 05:35:23', '2019-11-11 05:35:23'),
(176, 40, 40, 180, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 05:35:23', '2019-11-11 05:35:23'),
(177, 40, 40, 181, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 05:35:23', '2019-11-11 05:35:23'),
(178, 40, 40, 182, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 05:35:23', '2019-11-11 05:35:23'),
(179, 41, 41, 183, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 06:52:46', '2019-11-11 06:52:46'),
(180, 41, 41, 184, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 06:52:46', '2019-11-11 06:52:46'),
(181, 42, 42, 185, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 06:59:16', '2019-11-11 06:59:16'),
(182, 42, 42, 186, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 06:59:16', '2019-11-11 06:59:16'),
(183, 42, 42, 187, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 06:59:16', '2019-11-11 06:59:16'),
(184, 42, 42, 188, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 06:59:16', '2019-11-11 06:59:16'),
(185, 42, 42, 189, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 06:59:16', '2019-11-11 06:59:16'),
(186, 42, 42, 190, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 06:59:16', '2019-11-11 06:59:16'),
(187, 43, 43, 191, '2.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 07:09:55', '2019-11-11 07:09:55'),
(188, 43, 43, 192, '2.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 07:09:55', '2019-11-11 07:09:55'),
(189, 43, 43, 193, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 07:09:55', '2019-11-11 07:09:55'),
(190, 43, 43, 194, '2.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 07:09:55', '2019-11-11 07:09:55'),
(191, 44, 44, 195, '1.0000', '23.0000', '0.00', '23.0000', '23.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 07:14:10', '2019-11-11 07:14:10'),
(192, 45, 45, 196, '1.0000', '32.0000', '0.00', '32.0000', '32.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 07:19:45', '2019-11-11 07:19:45'),
(193, 45, 45, 197, '1.0000', '32.0000', '0.00', '32.0000', '32.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 07:19:45', '2019-11-11 07:19:45'),
(194, 45, 45, 198, '1.0000', '32.0000', '0.00', '32.0000', '32.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 07:19:45', '2019-11-11 07:19:45'),
(195, 45, 45, 199, '1.0000', '32.0000', '0.00', '32.0000', '32.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 07:19:45', '2019-11-11 07:19:45'),
(196, 45, 45, 200, '1.0000', '32.0000', '0.00', '32.0000', '32.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 07:19:45', '2019-11-11 07:19:45'),
(197, 46, 46, 201, '1.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 07:23:25', '2019-11-11 07:23:25'),
(198, 46, 46, 202, '1.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 07:23:25', '2019-11-11 07:23:25'),
(199, 46, 46, 203, '1.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 07:23:25', '2019-11-11 07:23:25'),
(200, 47, 47, 204, '1.0000', '21.0000', '0.00', '21.0000', '21.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 07:57:14', '2019-11-11 07:57:14'),
(201, 47, 47, 205, '1.0000', '21.0000', '0.00', '21.0000', '21.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 07:57:14', '2019-11-11 07:57:14'),
(202, 48, 48, 206, '1.0000', '10.0000', '0.00', '10.0000', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 07:59:38', '2019-11-11 08:01:00'),
(203, 48, 48, 207, '1.0000', '10.0000', '0.00', '10.0000', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 08:01:00', '2019-11-11 08:01:00'),
(204, 48, 48, 208, '1.0000', '10.0000', '0.00', '10.0000', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 08:01:00', '2019-11-11 08:01:00'),
(205, 48, 48, 209, '1.0000', '10.0000', '0.00', '10.0000', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-11 08:01:00', '2019-11-11 08:01:00'),
(206, 49, 49, 210, '1.0000', '10.0000', '0.00', '10.0000', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:22:21', '2019-11-12 13:22:21'),
(207, 49, 49, 211, '1.0000', '10.0000', '0.00', '10.0000', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:22:21', '2019-11-12 13:22:21'),
(208, 49, 49, 212, '1.0000', '10.0000', '0.00', '10.0000', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:22:21', '2019-11-12 13:22:21'),
(209, 49, 49, 213, '1.0000', '10.0000', '0.00', '10.0000', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:22:21', '2019-11-12 13:22:21'),
(210, 49, 49, 214, '1.0000', '10.0000', '0.00', '10.0000', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:22:21', '2019-11-12 13:22:21'),
(211, 49, 49, 215, '1.0000', '10.0000', '0.00', '10.0000', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:22:21', '2019-11-12 13:22:21'),
(212, 49, 49, 216, '1.0000', '10.0000', '0.00', '10.0000', '10.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:22:21', '2019-11-12 13:22:21'),
(213, 50, 50, 217, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:28:43', '2019-11-12 13:28:43'),
(214, 50, 50, 218, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:28:43', '2019-11-12 13:28:43'),
(215, 51, 51, 219, '1.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:32:36', '2019-11-12 13:32:36'),
(216, 51, 51, 220, '1.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:32:36', '2019-11-12 13:32:36'),
(217, 52, 52, 221, '1.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(218, 52, 52, 222, '1.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(219, 52, 52, 223, '1.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(220, 52, 52, 224, '1.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(221, 52, 52, 225, '1.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(222, 52, 52, 226, '1.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(223, 52, 52, 227, '1.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(224, 52, 52, 228, '1.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(225, 52, 52, 229, '1.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(226, 52, 52, 230, '1.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(227, 53, 53, 231, '1.0000', '23.0000', '0.00', '23.0000', '23.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:43:01', '2019-11-12 13:43:01'),
(228, 53, 53, 232, '1.0000', '23.0000', '0.00', '23.0000', '23.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:43:01', '2019-11-12 13:43:01'),
(229, 54, 54, 233, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:52:00', '2019-11-12 13:52:00'),
(230, 55, 55, 234, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:57:06', '2019-11-12 13:57:06'),
(231, 55, 55, 235, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:57:06', '2019-11-12 13:57:06'),
(232, 55, 55, 236, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:57:06', '2019-11-12 13:57:06'),
(233, 55, 55, 237, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 13:57:06', '2019-11-12 13:57:06'),
(234, 56, 56, 238, '1.0000', '26.0000', '0.00', '26.0000', '26.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:00:51', '2019-11-12 14:00:51'),
(235, 56, 56, 239, '1.0000', '26.0000', '0.00', '26.0000', '26.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:00:51', '2019-11-12 14:00:51'),
(236, 56, 56, 240, '1.0000', '26.0000', '0.00', '26.0000', '26.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:00:51', '2019-11-12 14:00:51'),
(237, 57, 57, 241, '1.0000', '7.0000', '0.00', '7.0000', '7.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:02:38', '2019-11-12 14:02:38'),
(238, 58, 58, 242, '1.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:04:21', '2019-11-12 14:04:21'),
(239, 58, 58, 243, '1.0000', '20.0000', '0.00', '20.0000', '20.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:04:21', '2019-11-12 14:04:21'),
(240, 59, 59, 244, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:10:17', '2019-11-12 14:10:17'),
(241, 59, 59, 245, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:10:17', '2019-11-12 14:10:17'),
(242, 59, 59, 246, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:10:17', '2019-11-12 14:10:17'),
(243, 59, 59, 247, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:10:17', '2019-11-12 14:10:17'),
(244, 59, 59, 248, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:10:17', '2019-11-12 14:10:17'),
(245, 60, 60, 249, '1.0000', '23.0000', '0.00', '23.0000', '23.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:17:36', '2019-11-12 14:17:36'),
(246, 60, 60, 250, '1.0000', '23.0000', '0.00', '23.0000', '23.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:17:36', '2019-11-12 14:17:36'),
(247, 60, 60, 251, '1.0000', '23.0000', '0.00', '23.0000', '23.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:17:36', '2019-11-12 14:17:36'),
(248, 60, 60, 252, '1.0000', '23.0000', '0.00', '23.0000', '23.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:17:36', '2019-11-12 14:17:36'),
(249, 60, 60, 253, '1.0000', '23.0000', '0.00', '23.0000', '23.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:17:36', '2019-11-12 14:17:36'),
(250, 60, 60, 254, '1.0000', '23.0000', '0.00', '23.0000', '23.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:17:36', '2019-11-12 14:17:36'),
(251, 61, 61, 255, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:23:52', '2019-11-12 14:23:52'),
(252, 62, 62, 256, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:26:18', '2019-11-12 14:26:18'),
(253, 62, 62, 257, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:26:18', '2019-11-12 14:26:18'),
(254, 63, 63, 258, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:28:49', '2019-11-12 14:28:49'),
(255, 63, 63, 259, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:28:49', '2019-11-12 14:28:49'),
(256, 64, 64, 260, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:31:20', '2019-11-12 14:31:20'),
(257, 64, 64, 261, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:31:20', '2019-11-12 14:31:20'),
(258, 65, 65, 262, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:34:05', '2019-11-12 14:34:05'),
(259, 65, 65, 263, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:34:05', '2019-11-12 14:34:05'),
(260, 65, 65, 264, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:34:05', '2019-11-12 14:34:05'),
(261, 65, 65, 265, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:34:05', '2019-11-12 14:34:05'),
(262, 66, 66, 266, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:36:47', '2019-11-12 14:36:47'),
(263, 66, 66, 267, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:36:47', '2019-11-12 14:36:47'),
(264, 67, 67, 268, '1.0000', '11.0000', '0.00', '11.0000', '11.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:38:58', '2019-11-12 14:38:58'),
(265, 67, 67, 269, '1.0000', '11.0000', '0.00', '11.0000', '11.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:38:58', '2019-11-12 14:38:58'),
(266, 68, 68, 270, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:39:48', '2019-11-12 14:39:48'),
(267, 69, 69, 271, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:41:25', '2019-11-12 14:41:25'),
(268, 69, 69, 272, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:41:25', '2019-11-12 14:41:25'),
(269, 70, 70, 273, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:43:01', '2019-11-12 14:43:01'),
(270, 70, 70, 274, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:43:01', '2019-11-12 14:43:01'),
(271, 71, 71, 275, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:44:49', '2019-11-12 14:44:49'),
(272, 71, 71, 276, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 14:44:49', '2019-11-12 14:44:49');
INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(273, 72, 72, 277, '1.0000', '22.0000', '0.00', '22.0000', '22.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 15:02:41', '2019-11-12 15:02:41'),
(274, 72, 72, 278, '1.0000', '22.0000', '0.00', '22.0000', '22.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 15:02:41', '2019-11-12 15:02:41'),
(275, 72, 72, 279, '1.0000', '22.0000', '0.00', '22.0000', '22.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 15:02:41', '2019-11-12 15:02:41'),
(276, 72, 72, 280, '1.0000', '22.0000', '0.00', '22.0000', '22.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 15:02:41', '2019-11-12 15:02:41'),
(277, 72, 72, 281, '1.0000', '22.0000', '0.00', '22.0000', '22.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 15:02:41', '2019-11-12 15:02:41'),
(278, 72, 72, 282, '1.0000', '22.0000', '0.00', '22.0000', '22.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-12 15:02:41', '2019-11-12 15:02:41'),
(279, 73, 73, 283, '1.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 15:38:44', '2019-11-16 15:38:44'),
(280, 74, 74, 284, '2.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 15:45:31', '2019-11-16 15:46:23'),
(281, 74, 74, 285, '2.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 15:45:31', '2019-11-16 15:46:23'),
(282, 74, 74, 286, '2.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 15:45:31', '2019-11-16 15:46:23'),
(283, 74, 74, 287, '2.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 15:45:31', '2019-11-16 15:46:23'),
(284, 74, 74, 288, '2.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 15:45:31', '2019-11-16 15:46:23'),
(285, 74, 74, 289, '2.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 15:45:31', '2019-11-16 15:46:23'),
(286, 74, 74, 290, '2.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 15:45:31', '2019-11-16 15:46:23'),
(287, 74, 74, 291, '2.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 15:45:31', '2019-11-16 15:46:23'),
(288, 75, 75, 292, '1.0000', '32.0000', '0.00', '32.0000', '32.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 15:55:25', '2019-11-16 15:55:25'),
(289, 75, 75, 293, '1.0000', '32.0000', '0.00', '32.0000', '32.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 15:55:25', '2019-11-16 15:55:25'),
(290, 75, 75, 294, '1.0000', '32.0000', '0.00', '32.0000', '32.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 15:55:25', '2019-11-16 15:55:25'),
(291, 75, 75, 295, '1.0000', '32.0000', '0.00', '32.0000', '32.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 15:55:25', '2019-11-16 15:55:25'),
(292, 75, 75, 296, '1.0000', '32.0000', '0.00', '32.0000', '32.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 15:55:25', '2019-11-16 15:55:25'),
(293, 75, 75, 297, '1.0000', '32.0000', '0.00', '32.0000', '32.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 15:55:25', '2019-11-16 15:55:25'),
(294, 75, 75, 298, '1.0000', '32.0000', '0.00', '32.0000', '32.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 15:55:25', '2019-11-16 15:55:25'),
(295, 76, 76, 299, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(296, 76, 76, 300, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(297, 76, 76, 301, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(298, 76, 76, 302, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(299, 76, 76, 303, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(300, 76, 76, 304, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(301, 76, 76, 305, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(302, 76, 76, 306, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(303, 76, 76, 307, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(304, 76, 76, 308, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(305, 76, 76, 309, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(306, 76, 76, 310, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(307, 77, 77, 311, '1.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:38:22', '2019-11-20 10:38:22'),
(308, 77, 77, 312, '2.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:38:22', '2019-11-20 10:38:22'),
(309, 77, 77, 313, '2.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:38:22', '2019-11-20 10:38:22'),
(310, 77, 77, 314, '3.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:38:22', '2019-11-20 10:38:22'),
(311, 77, 77, 315, '2.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:38:22', '2019-11-20 10:38:22'),
(312, 77, 77, 316, '2.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:38:22', '2019-11-20 10:38:22'),
(313, 77, 77, 317, '2.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:38:22', '2019-11-20 10:38:22'),
(314, 77, 77, 318, '2.0000', '25.0000', '0.00', '25.0000', '25.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:38:22', '2019-11-20 10:38:22'),
(315, 78, 78, 319, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:43:50', '2019-11-20 10:43:50'),
(316, 78, 78, 320, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:43:50', '2019-11-20 10:43:50'),
(317, 78, 78, 321, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:43:50', '2019-11-20 10:43:50'),
(318, 78, 78, 322, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:43:50', '2019-11-20 10:43:50'),
(319, 78, 78, 323, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:43:50', '2019-11-20 10:43:50'),
(320, 78, 78, 324, '1.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:43:50', '2019-11-20 10:43:50'),
(321, 79, 79, 325, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:50:16', '2019-11-20 10:50:16'),
(322, 79, 79, 326, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:50:16', '2019-11-20 10:50:16'),
(323, 79, 79, 327, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:50:16', '2019-11-20 10:50:16'),
(324, 79, 79, 328, '1.0000', '13.0000', '0.00', '13.0000', '13.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:50:16', '2019-11-20 10:50:16'),
(325, 80, 80, 329, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:52:27', '2019-11-20 10:52:27'),
(326, 80, 80, 330, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:52:27', '2019-11-20 10:52:27'),
(327, 80, 80, 331, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:52:27', '2019-11-20 10:52:27'),
(328, 81, 81, 332, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:54:24', '2019-11-20 10:54:24'),
(329, 82, 82, 333, '1.0000', '11.0000', '0.00', '11.0000', '11.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:58:16', '2019-11-20 10:58:16'),
(330, 82, 82, 334, '1.0000', '11.0000', '0.00', '11.0000', '11.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 10:58:16', '2019-11-20 10:58:16'),
(331, 83, 83, 335, '1.0000', '28.0000', '0.00', '28.0000', '28.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 11:00:29', '2019-11-20 11:00:29'),
(332, 84, 84, 336, '1.0000', '29.0000', '0.00', '29.0000', '29.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 11:02:43', '2019-11-20 11:02:43'),
(333, 84, 84, 337, '1.0000', '29.0000', '0.00', '29.0000', '29.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-20 11:02:43', '2019-11-20 11:02:43'),
(334, 85, 85, 338, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 02:13:03', '2019-11-21 02:13:03'),
(335, 85, 85, 339, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 02:13:03', '2019-11-21 02:13:03'),
(336, 85, 85, 340, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 02:13:03', '2019-11-21 02:13:03'),
(337, 85, 85, 341, '1.0000', '16.0000', '0.00', '16.0000', '16.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 02:13:04', '2019-11-21 02:13:04'),
(338, 86, 86, 342, '1.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 02:14:20', '2019-11-21 02:14:20'),
(339, 86, 86, 343, '1.0000', '17.0000', '0.00', '17.0000', '17.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 02:14:20', '2019-11-21 02:14:20'),
(340, 87, 87, 344, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 02:20:37', '2019-11-21 02:20:37'),
(341, 87, 87, 345, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 02:20:37', '2019-11-21 02:20:37'),
(342, 87, 87, 346, '1.0000', '12.0000', '0.00', '12.0000', '12.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 02:20:37', '2019-11-21 02:20:37'),
(343, 88, 88, 347, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 02:27:23', '2019-11-21 02:27:23'),
(344, 88, 88, 348, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 02:27:23', '2019-11-21 02:27:23'),
(345, 88, 88, 349, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 02:27:23', '2019-11-21 02:27:23'),
(346, 88, 88, 350, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 02:27:23', '2019-11-21 02:27:23'),
(347, 88, 88, 351, '1.0000', '14.0000', '0.00', '14.0000', '14.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 02:27:23', '2019-11-21 02:27:23'),
(348, 89, 89, 352, '3.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 02:50:13', '2019-11-21 02:50:13'),
(349, 89, 89, 353, '3.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 02:50:13', '2019-11-21 02:50:13'),
(350, 90, 90, 354, '2.0000', '15.0000', '0.00', '15.0000', '15.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 02:51:54', '2019-11-21 02:51:54'),
(351, 91, 91, 355, '2.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 04:29:15', '2019-11-21 04:29:15'),
(352, 91, 91, 356, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 04:29:15', '2019-11-21 04:29:15'),
(353, 91, 91, 357, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 04:29:15', '2019-11-21 04:29:15'),
(354, 92, 92, 358, '1.0000', '5.0000', '0.00', '5.0000', '5.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 04:36:36', '2019-11-21 04:36:36'),
(355, 92, 92, 359, '1.0000', '5.0000', '0.00', '5.0000', '5.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 04:36:36', '2019-11-21 04:36:36'),
(356, 92, 92, 360, '2.0000', '5.0000', '0.00', '5.0000', '5.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 04:36:36', '2019-11-21 04:36:36'),
(357, 92, 92, 361, '1.0000', '5.0000', '0.00', '5.0000', '5.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 04:36:36', '2019-11-21 04:36:36'),
(358, 93, 93, 362, '1.0000', '8.0000', '0.00', '8.0000', '8.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 04:40:20', '2019-11-21 04:40:20'),
(359, 93, 93, 363, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 04:40:20', '2019-11-21 04:40:20'),
(360, 93, 93, 364, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 04:40:20', '2019-11-21 04:40:20'),
(361, 93, 93, 365, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 04:40:20', '2019-11-21 04:40:20'),
(362, 93, 93, 366, '1.0000', '9.0000', '0.00', '9.0000', '9.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 04:40:20', '2019-11-21 04:40:20'),
(363, 94, 94, 367, '1.0000', '36.0000', '0.00', '36.0000', '36.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 04:58:02', '2019-11-21 04:58:02'),
(364, 94, 94, 368, '1.0000', '36.0000', '0.00', '36.0000', '36.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 04:58:02', '2019-11-21 04:58:02'),
(365, 95, 95, 369, '1.0000', '36.0000', '0.00', '36.0000', '36.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 05:00:36', '2019-11-21 05:00:36'),
(366, 95, 95, 370, '1.0000', '36.0000', '0.00', '36.0000', '36.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-21 05:00:36', '2019-11-21 05:00:36'),
(367, 96, 96, 371, '2.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 10:57:23', '2019-11-23 10:57:23'),
(368, 96, 96, 372, '2.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 10:57:23', '2019-11-23 10:57:23'),
(369, 96, 96, 373, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 10:57:23', '2019-11-23 10:57:23'),
(370, 96, 96, 374, '2.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 10:57:23', '2019-11-23 10:57:23'),
(371, 97, 97, 375, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 10:59:03', '2019-11-23 10:59:03'),
(372, 98, 98, 376, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 10:59:51', '2019-11-23 10:59:51'),
(373, 99, 99, 377, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:00:34', '2019-11-23 11:00:34'),
(374, 100, 100, 378, '2.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:02:06', '2019-11-23 11:02:06'),
(375, 100, 100, 379, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:02:06', '2019-11-23 11:02:06'),
(376, 101, 101, 380, '2.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:03:05', '2019-11-23 11:03:05'),
(377, 102, 102, 381, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:05:03', '2019-11-23 11:05:03'),
(378, 102, 102, 382, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:05:03', '2019-11-23 11:05:03'),
(379, 102, 102, 383, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:05:03', '2019-11-23 11:05:03'),
(380, 103, 103, 384, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:06:37', '2019-11-23 11:06:37'),
(381, 103, 103, 385, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:06:37', '2019-11-23 11:06:37'),
(382, 103, 103, 386, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:06:37', '2019-11-23 11:06:37'),
(383, 104, 104, 387, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:08:56', '2019-11-23 11:08:56'),
(384, 104, 104, 388, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:08:56', '2019-11-23 11:08:56'),
(385, 104, 104, 389, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:08:56', '2019-11-23 11:08:56'),
(386, 104, 104, 390, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:08:56', '2019-11-23 11:08:56'),
(387, 105, 105, 391, '3.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:29:51', '2019-11-23 11:29:51'),
(388, 106, 106, 392, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:31:23', '2019-11-23 11:31:23'),
(389, 106, 106, 393, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:31:23', '2019-11-23 11:31:23'),
(390, 106, 106, 394, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:31:23', '2019-11-23 11:31:23'),
(391, 106, 106, 395, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:31:23', '2019-11-23 11:31:23'),
(392, 107, 107, 396, '2.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:32:54', '2019-11-23 11:32:54'),
(393, 107, 107, 397, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:32:54', '2019-11-23 11:32:54'),
(394, 107, 107, 398, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:32:54', '2019-11-23 11:32:54'),
(395, 108, 108, 399, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:34:22', '2019-11-23 11:34:22'),
(396, 108, 108, 400, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:34:22', '2019-11-23 11:34:22'),
(397, 109, 109, 401, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:35:09', '2019-11-23 11:35:09'),
(398, 110, 110, 402, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:35:53', '2019-11-23 11:35:53'),
(399, 111, 111, 403, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:36:24', '2019-11-23 11:36:24'),
(400, 112, 112, 404, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:36:52', '2019-11-23 11:36:52'),
(401, 113, 113, 405, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:37:40', '2019-11-23 11:37:40'),
(402, 114, 114, 406, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:38:14', '2019-11-23 11:38:14'),
(403, 115, 115, 407, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:38:55', '2019-11-23 11:38:55'),
(404, 116, 116, 408, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 11:39:15', '2019-11-23 11:39:15'),
(405, 117, 117, 409, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 12:08:58', '2019-11-23 12:08:58'),
(406, 118, 118, 410, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 12:09:25', '2019-11-23 12:09:25'),
(407, 119, 119, 411, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 12:09:47', '2019-11-23 12:09:47'),
(408, 120, 120, 412, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 12:10:25', '2019-11-23 12:10:25'),
(409, 121, 121, 413, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 12:10:47', '2019-11-23 12:10:47'),
(410, 122, 122, 414, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 12:11:07', '2019-11-23 12:11:07'),
(411, 123, 123, 415, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 12:11:27', '2019-11-23 12:11:27'),
(412, 124, 124, 416, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 12:11:58', '2019-11-23 12:11:58'),
(413, 125, 125, 417, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 12:12:58', '2019-11-23 12:12:58'),
(414, 125, 125, 418, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 12:12:58', '2019-11-23 12:12:58'),
(415, 126, 126, 419, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 12:15:00', '2019-11-23 12:15:00'),
(416, 126, 126, 420, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 12:15:00', '2019-11-23 12:15:00'),
(417, 126, 126, 421, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 12:15:00', '2019-11-23 12:15:00'),
(418, 127, 127, 422, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 12:16:02', '2019-11-23 12:16:02'),
(419, 127, 127, 423, '1.0000', '40.0000', '0.00', '40.0000', '40.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', NULL, NULL, NULL, NULL, '2019-11-23 12:16:02', '2019-11-23 12:16:02');

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

DROP TABLE IF EXISTS `reference_counts`;
CREATE TABLE IF NOT EXISTS `reference_counts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ref_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 1, 1, '2019-09-18 12:19:43', '2019-09-18 12:19:43'),
(2, 'business_location', 1, 1, '2019-09-18 12:19:43', '2019-09-18 12:19:43'),
(3, 'username', 2, 1, '2019-09-25 16:28:03', '2019-10-13 13:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

DROP TABLE IF EXISTS `res_product_modifier_sets`;
CREATE TABLE IF NOT EXISTS `res_product_modifier_sets` (
  `modifier_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product',
  KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

DROP TABLE IF EXISTS `res_tables`;
CREATE TABLE IF NOT EXISTS `res_tables` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `res_tables_business_id_foreign` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_service_staff` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_business_id_foreign` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2019-09-18 12:19:43', '2019-09-18 12:19:43'),
(2, 'Cashier#1', 'web', 1, 0, 0, '2019-09-18 12:19:43', '2019-09-18 12:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(71, 2);

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

DROP TABLE IF EXISTS `selling_price_groups`;
CREATE TABLE IF NOT EXISTS `selling_price_groups` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `selling_price_groups_business_id_foreign` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

DROP TABLE IF EXISTS `stock_adjustments_temp`;
CREATE TABLE IF NOT EXISTS `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

DROP TABLE IF EXISTS `stock_adjustment_lines`;
CREATE TABLE IF NOT EXISTS `stock_adjustment_lines` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(20,4) NOT NULL,
  `unit_price` decimal(22,4) DEFAULT NULL,
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
CREATE TABLE IF NOT EXISTS `system` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '2.16.2'),
(2, 'default_business_active_status', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
CREATE TABLE IF NOT EXISTS `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_rates_business_id_foreign` (`business_id`),
  KEY `tax_rates_created_by_foreign` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `res_table_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('received','pending','ordered','draft','final') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT '0',
  `payment_status` enum('paid','due','partial') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int(11) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) DEFAULT '0.0000',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) DEFAULT '0.0000',
  `discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rp_redeemed` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) DEFAULT '0.0000',
  `shipping_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charges` decimal(22,4) DEFAULT '0.0000',
  `additional_notes` text COLLATE utf8mb4_unicode_ci,
  `staff_note` text COLLATE utf8mb4_unicode_ci,
  `final_total` decimal(22,4) DEFAULT '0.0000',
  `expense_category_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspend` tinyint(1) NOT NULL DEFAULT '0',
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `total_amount_recovered` decimal(22,4) DEFAULT NULL,
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT '0',
  `rp_earned` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `order_addresses` text COLLATE utf8mb4_unicode_ci,
  `is_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `recur_interval` double(8,2) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recur_repetitions` int(11) DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int(11) DEFAULT NULL,
  `invoice_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_tax_id_foreign` (`tax_id`),
  KEY `transactions_business_id_index` (`business_id`),
  KEY `transactions_type_index` (`type`),
  KEY `transactions_contact_id_index` (`contact_id`),
  KEY `transactions_transaction_date_index` (`transaction_date`),
  KEY `transactions_created_by_index` (`created_by`),
  KEY `transactions_location_id_index` (`location_id`),
  KEY `transactions_expense_for_foreign` (`expense_for`),
  KEY `transactions_expense_category_id_index` (`expense_category_id`),
  KEY `transactions_sub_type_index` (`sub_type`),
  KEY `transactions_return_parent_id_index` (`return_parent_id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_charges`, `additional_notes`, `staff_note`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 15:31:20', '16.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '16.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 1, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 08:31:20', '2019-10-13 08:31:20'),
(2, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 15:32:50', '15.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '15.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 2, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 08:32:50', '2019-10-13 08:32:50'),
(3, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 15:36:29', '96.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '96.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 3, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 08:36:29', '2019-10-13 08:36:29'),
(4, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 15:40:25', '128.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '128.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 4, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 08:40:25', '2019-10-13 08:40:25'),
(5, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 15:47:48', '200.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '200.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 5, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 08:47:48', '2019-10-13 10:08:51'),
(6, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 15:55:02', '217.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '217.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 6, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 08:55:02', '2019-10-13 08:55:02'),
(7, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 16:08:42', '100.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 7, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 09:08:42', '2019-10-13 09:08:42'),
(8, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 16:13:33', '224.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '224.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 8, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 09:13:33', '2019-10-13 09:13:33'),
(9, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 16:19:04', '224.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '224.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 9, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 09:19:04', '2019-10-13 09:19:04'),
(10, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 16:23:24', '16.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '16.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 10, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 09:23:24', '2019-10-13 09:23:24'),
(11, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 16:32:57', '280.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '280.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 12, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 09:32:57', '2019-10-13 09:58:39'),
(12, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 16:42:53', '64.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '64.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 13, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 09:42:53', '2019-10-13 10:00:17'),
(13, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 16:49:28', '75.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '75.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 11, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 09:49:28', '2019-10-13 09:49:28'),
(14, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:06:23', '69.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '69.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 14, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 10:06:23', '2019-10-13 10:06:23'),
(15, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:11:14', '36.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '36.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 15, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 10:11:14', '2019-10-13 10:11:14'),
(16, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:13:47', '72.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '72.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 16, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 10:13:47', '2019-10-13 10:13:47'),
(17, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:19:59', '133.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '133.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 17, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 10:19:59', '2019-10-13 10:19:59'),
(18, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:28:54', '91.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '91.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 18, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 10:28:54', '2019-10-13 10:28:54'),
(19, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:30:08', '100.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 19, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 10:30:08', '2019-10-13 11:11:17'),
(20, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:32:16', '52.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '52.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 20, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 10:32:16', '2019-10-13 10:32:16'),
(21, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:33:39', '76.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '76.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 21, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 10:33:39', '2019-10-13 10:33:39'),
(22, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:37:23', '39.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '39.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 22, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 10:37:23', '2019-10-13 10:37:23'),
(23, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:46:40', '76.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '76.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 23, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 10:46:40', '2019-10-13 10:46:40'),
(24, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:48:53', '48.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '48.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 24, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 10:48:53', '2019-10-13 10:48:53'),
(25, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:50:17', '13.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '13.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 25, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 10:50:17', '2019-10-13 10:50:17'),
(26, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:52:33', '64.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '64.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 26, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 10:52:33', '2019-10-13 10:52:33'),
(27, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:54:01', '45.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '45.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 27, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 10:54:01', '2019-10-13 10:54:01'),
(28, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:55:44', '56.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '56.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 28, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 10:55:44', '2019-10-13 10:55:44'),
(29, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:59:03', '76.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '76.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 29, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 10:59:03', '2019-10-13 10:59:03'),
(30, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:02:00', '100.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '100.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 30, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 11:02:00', '2019-10-13 11:02:00'),
(31, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:07:13', '91.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '91.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 31, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 11:07:13', '2019-10-13 11:07:13'),
(32, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:09:27', '225.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '225.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 32, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 11:09:27', '2019-10-13 11:09:27'),
(33, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:12:57', '42.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '42.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 33, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 11:12:57', '2019-10-13 11:12:57'),
(34, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:13:46', '36.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '36.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 34, 1, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-13 11:13:46', '2019-10-13 11:13:46'),
(35, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 12:23:45', '570.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '570.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 36, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-11 05:23:45', '2019-11-11 05:23:45'),
(36, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 12:24:09', '266.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '266.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 35, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-11 05:24:09', '2019-11-11 05:24:09'),
(37, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 12:26:17', '510.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '510.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 37, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-11 05:26:17', '2019-11-11 05:26:17'),
(38, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 12:31:25', '52.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '52.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 38, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-11 05:31:25', '2019-11-11 05:31:25'),
(39, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 12:33:16', '28.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '28.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 39, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-11 05:33:16', '2019-11-11 05:33:16'),
(40, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 12:35:23', '48.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '48.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 40, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-11 05:35:23', '2019-11-11 05:35:23'),
(41, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 13:52:46', '24.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '24.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 41, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-11 06:52:46', '2019-11-11 06:52:46'),
(42, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 13:59:16', '150.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '150.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 42, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-11 06:59:16', '2019-11-11 06:59:16'),
(43, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 14:09:55', '91.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '91.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 43, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-11 07:09:55', '2019-11-11 07:09:55'),
(44, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 14:14:10', '23.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '23.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 44, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-11 07:14:10', '2019-11-11 07:14:10'),
(45, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 14:19:45', '160.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '160.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 45, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-11 07:19:45', '2019-11-11 07:19:45'),
(46, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 14:23:25', '51.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '51.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 46, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-11 07:23:25', '2019-11-11 07:23:25'),
(47, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 14:57:14', '42.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '42.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 47, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-11 07:57:14', '2019-11-11 07:57:14'),
(48, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 14:59:38', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 48, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-11 07:59:38', '2019-11-11 08:01:00'),
(49, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 20:22:21', '70.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '70.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 49, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 13:22:21', '2019-11-12 13:22:21'),
(50, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 20:28:43', '56.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '56.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 50, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 13:28:43', '2019-11-12 13:28:43'),
(51, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 20:32:36', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 51, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 13:32:36', '2019-11-12 13:32:36'),
(52, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 20:40:11', '170.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '170.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 52, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(53, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 20:43:01', '46.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '46.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 53, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 13:43:01', '2019-11-12 13:43:01'),
(54, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 20:52:00', '16.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '16.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 54, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 13:52:00', '2019-11-12 13:52:00'),
(55, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 20:57:06', '48.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '48.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 55, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 13:57:06', '2019-11-12 13:57:06'),
(56, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 21:00:51', '78.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '78.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 56, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 14:00:51', '2019-11-12 14:00:51'),
(57, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 21:02:38', '7.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '7.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 57, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 14:02:38', '2019-11-12 14:02:38'),
(58, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 21:04:21', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 58, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 14:04:21', '2019-11-12 14:04:21'),
(59, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 21:10:17', '45.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '45.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 59, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 14:10:17', '2019-11-12 14:10:17'),
(60, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 21:17:36', '138.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '138.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 60, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 14:17:36', '2019-11-12 14:17:36'),
(61, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 21:23:52', '16.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '16.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 61, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 14:23:52', '2019-11-12 14:23:52'),
(62, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 21:26:18', '28.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '28.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 62, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 14:26:18', '2019-11-12 14:26:18'),
(63, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 21:28:49', '24.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '24.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 63, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 14:28:49', '2019-11-12 14:28:49'),
(64, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 21:31:20', '28.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '28.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 64, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 14:31:20', '2019-11-12 14:31:20'),
(65, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 21:34:05', '36.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '36.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 65, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 14:34:05', '2019-11-12 14:34:05'),
(66, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 21:36:47', '24.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '24.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 66, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 14:36:47', '2019-11-12 14:36:47'),
(67, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 21:38:58', '22.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '22.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 67, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 14:38:58', '2019-11-12 14:38:58'),
(68, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 21:39:48', '13.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '13.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 68, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 14:39:48', '2019-11-12 14:39:48'),
(69, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 21:41:25', '24.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '24.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 69, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 14:41:25', '2019-11-12 14:41:25'),
(70, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 21:43:01', '28.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '28.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 70, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 14:43:01', '2019-11-12 14:43:01'),
(71, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 21:44:49', '26.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '26.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 71, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 14:44:49', '2019-11-12 14:44:49'),
(72, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 22:02:41', '132.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '132.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 72, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-12 15:02:41', '2019-11-12 15:02:41'),
(73, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 22:38:44', '17.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '17.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 73, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-16 15:38:44', '2019-11-16 15:38:44'),
(74, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 22:45:31', '144.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '144.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 74, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-16 15:45:31', '2019-11-16 15:46:23'),
(75, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 22:55:24', '224.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '224.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 75, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-16 15:55:25', '2019-11-16 15:55:25'),
(76, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 23:06:01', '336.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '336.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 76, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(77, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:38:22', '400.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '400.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 77, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-20 10:38:22', '2019-11-20 10:38:22'),
(78, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:43:50', '90.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '90.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 78, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-20 10:43:50', '2019-11-20 10:43:50'),
(79, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:50:16', '52.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '52.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 79, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-20 10:50:16', '2019-11-20 10:50:16'),
(80, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:52:27', '48.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '48.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 80, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-20 10:52:27', '2019-11-20 10:52:27'),
(81, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:54:24', '12.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '12.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 81, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-20 10:54:24', '2019-11-20 10:54:24'),
(82, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:58:16', '22.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '22.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 82, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-20 10:58:16', '2019-11-20 10:58:16'),
(83, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:00:29', '28.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '28.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 83, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-20 11:00:29', '2019-11-20 11:00:29'),
(84, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:02:43', '58.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '58.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 84, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-20 11:02:43', '2019-11-20 11:02:43'),
(85, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 09:13:03', '64.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '64.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 85, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 02:13:03', '2019-11-21 02:13:03'),
(86, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 09:14:20', '34.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '34.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 86, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 02:14:20', '2019-11-21 02:14:20'),
(87, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 09:20:37', '36.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '36.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 87, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 02:20:37', '2019-11-21 02:20:37'),
(88, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 09:27:23', '70.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '70.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 88, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 02:27:23', '2019-11-21 02:27:23'),
(89, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 09:50:13', '54.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '54.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 89, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 02:50:13', '2019-11-21 02:50:13'),
(90, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 09:51:54', '30.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '30.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 90, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 02:51:54', '2019-11-21 02:51:54'),
(91, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 11:29:15', '36.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '36.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 91, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 04:29:15', '2019-11-21 04:29:15'),
(92, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 11:36:36', '25.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '25.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 92, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 04:36:36', '2019-11-21 04:36:36'),
(93, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 11:40:20', '44.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '44.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 93, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 04:40:20', '2019-11-21 04:40:20'),
(94, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 11:58:02', '72.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '72.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 94, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 04:58:02', '2019-11-21 04:58:02'),
(95, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 12:00:36', '72.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '72.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 95, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-21 05:00:36', '2019-11-21 05:00:36'),
(96, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:57:23', '280.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '280.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 96, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 10:57:23', '2019-11-23 10:57:23'),
(97, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:59:03', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 97, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 10:59:03', '2019-11-23 10:59:03'),
(98, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 17:59:51', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 98, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 10:59:51', '2019-11-23 10:59:51'),
(99, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:00:34', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 99, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 11:00:34', '2019-11-23 11:00:34'),
(100, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:02:06', '120.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '120.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 100, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 11:02:06', '2019-11-23 11:02:06'),
(101, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:03:05', '80.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '80.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 101, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 11:03:05', '2019-11-23 11:03:05'),
(102, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:05:03', '120.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '120.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 102, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 11:05:03', '2019-11-23 11:05:03'),
(103, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:06:37', '120.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '120.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 103, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 11:06:37', '2019-11-23 11:06:37'),
(104, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:08:56', '160.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '160.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 104, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 11:08:56', '2019-11-23 11:08:56'),
(105, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:29:51', '120.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '120.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 105, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 11:29:51', '2019-11-23 11:29:51'),
(106, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:31:23', '160.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '160.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 106, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 11:31:23', '2019-11-23 11:31:23'),
(107, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:32:54', '160.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '160.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 107, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 11:32:54', '2019-11-23 11:32:54'),
(108, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:34:22', '80.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '80.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 108, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 11:34:22', '2019-11-23 11:34:22'),
(109, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:35:09', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 109, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 11:35:09', '2019-11-23 11:35:09'),
(110, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:35:53', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 110, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 11:35:53', '2019-11-23 11:35:53'),
(111, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:36:24', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 111, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 11:36:24', '2019-11-23 11:36:24'),
(112, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:36:52', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 112, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 11:36:52', '2019-11-23 11:36:52'),
(113, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:37:40', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 113, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 11:37:40', '2019-11-23 11:37:40'),
(114, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:38:14', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 114, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 11:38:14', '2019-11-23 11:38:14'),
(115, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:38:55', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 115, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 11:38:55', '2019-11-23 11:38:55'),
(116, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 18:39:15', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 116, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 11:39:15', '2019-11-23 11:39:15'),
(117, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 19:08:58', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 117, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 12:08:58', '2019-11-23 12:08:58'),
(118, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 19:09:25', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 118, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 12:09:25', '2019-11-23 12:09:25'),
(119, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 19:09:47', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 119, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 12:09:47', '2019-11-23 12:09:47'),
(120, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 19:10:25', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 120, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 12:10:25', '2019-11-23 12:10:25'),
(121, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 19:10:47', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 121, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 12:10:47', '2019-11-23 12:10:47');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_charges`, `additional_notes`, `staff_note`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(122, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 19:11:07', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 122, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 12:11:07', '2019-11-23 12:11:07'),
(123, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 19:11:27', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 123, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 12:11:27', '2019-11-23 12:11:27'),
(124, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 19:11:58', '40.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '40.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 124, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 12:11:58', '2019-11-23 12:11:58'),
(125, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 19:12:58', '80.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '80.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 125, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 12:12:58', '2019-11-23 12:12:58'),
(126, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 19:15:00', '120.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '120.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 126, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 12:15:00', '2019-11-23 12:15:00'),
(127, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-01 19:16:02', '80.0000', NULL, '0.0000', NULL, NULL, 0, '0.0000', NULL, '0.0000', NULL, NULL, '80.0000', NULL, NULL, NULL, NULL, 0, 0, '1.000', NULL, NULL, NULL, 127, 3, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-23 12:16:02', '2019-11-23 12:16:02');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

DROP TABLE IF EXISTS `transaction_payments`;
CREATE TABLE IF NOT EXISTS `transaction_payments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) UNSIGNED DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) DEFAULT '0.0000',
  `method` enum('cash','card','cheque','bank_transfer','custom_pay_1','custom_pay_2','custom_pay_3','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_security` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `payment_for` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_payments_created_by_index` (`created_by`),
  KEY `transaction_payments_parent_id_index` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

DROP TABLE IF EXISTS `transaction_sell_lines`;
CREATE TABLE IF NOT EXISTS `transaction_sell_lines` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(20,4) NOT NULL,
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `unit_price_before_discount` decimal(22,4) DEFAULT '0.0000',
  `unit_price` decimal(22,4) DEFAULT NULL,
  `line_discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_discount_amount` decimal(22,4) DEFAULT '0.0000',
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL,
  `item_tax` decimal(22,4) DEFAULT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text COLLATE utf8mb4_unicode_ci,
  `res_service_staff_id` int(11) DEFAULT NULL,
  `res_line_order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `children_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  KEY `transaction_sell_lines_children_type_index` (`children_type`),
  KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

DROP TABLE IF EXISTS `transaction_sell_lines_purchase_lines`;
CREATE TABLE IF NOT EXISTS `transaction_sell_lines_purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sell_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(20,4) NOT NULL,
  `qty_returned` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sell_line_id` (`sell_line_id`),
  KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  KEY `purchase_line_id` (`purchase_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
CREATE TABLE IF NOT EXISTS `units` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `actual_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `units_business_id_foreign` (`business_id`),
  KEY `units_created_by_foreign` (`created_by`),
  KEY `units_base_unit_id_index` (`base_unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pieces', 'Pc(s)', 0, NULL, NULL, 1, NULL, '2019-09-18 12:19:43', '2019-09-18 12:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `surname` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `contact_no` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive','terminated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT '0',
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT '0.00',
  `selected_contacts` tinyint(1) NOT NULL DEFAULT '0',
  `dob` date DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8mb4_unicode_ci,
  `current_address` text COLLATE utf8mb4_unicode_ci,
  `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` longtext COLLATE utf8mb4_unicode_ci,
  `id_proof_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_business_id_foreign` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `status`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `marital_status`, `blood_group`, `contact_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Mr', 'Jacky', 'James', 'jacky2james', 'jacky2james@gmail.com', '$2y$10$q/8KTHH1SMSnS.ji9eobp.1VppqXBvMc9lxz1F/5M5NKQ5LHiQSKK', 'en', NULL, NULL, '7hICN0YcA2lwWhAPUDAQRtOy0jPRz4Wz5CLCCSCfvcwTLNnaktX6MghNIwGL', 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-09-18 12:19:43', '2019-09-18 12:19:43'),
(2, NULL, 'Cashier', NULL, 'cashier', 'cashier@gmail.com', '$2y$10$RijghVeKTLlUV4Z7uuGnieyk8vSokAkoJDlUuy9mqdTXIxQrlSBou', 'en', NULL, NULL, '7Zz6nP1ReuS2abvi3c4w6Wk9N477b1tWorPZuYYDOTOATbQb0dwnKFiFbOJK', 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2019-09-25 16:28:03', '2019-09-25 16:28:03'),
(3, NULL, 'keang', NULL, 'keang', 'keang@gmail.com', '$2y$10$uGYDDiODhqjJ4s6GZ8drfOr6PLp3XcWre0di0L6sHiPHPGQtlzfi6', 'en', NULL, NULL, 'Yg1nurKZZBvPOTTUwmsNBwChjnEvvjBjo3OBlUM2nh1QjLBZDdzoPAZmGqeU', 1, 'active', 0, '0.00', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2019-10-13 13:40:00', '2019-11-11 05:12:43');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

DROP TABLE IF EXISTS `user_contact_access`;
CREATE TABLE IF NOT EXISTS `user_contact_access` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

DROP TABLE IF EXISTS `variations`;
CREATE TABLE IF NOT EXISTS `variations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sub_sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) DEFAULT '0.0000',
  `profit_percent` decimal(22,4) DEFAULT '0.0000',
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text COLLATE utf8mb4_unicode_ci COMMENT 'Contains the combo variation details',
  PRIMARY KEY (`id`),
  KEY `variations_product_id_foreign` (`product_id`),
  KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  KEY `variations_name_index` (`name`),
  KEY `variations_sub_sku_index` (`sub_sku`),
  KEY `variations_variation_value_id_index` (`variation_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=424 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(1, 'DUMMY', 1, '0001', 1, NULL, '16.0000', '16.0000', '125.0000', '36.0000', '36.0000', '2019-10-13 08:31:08', '2019-10-13 08:31:08', NULL, '[]'),
(2, 'DUMMY', 2, '0002', 2, NULL, '15.0000', '15.0000', '140.0000', '36.0000', '36.0000', '2019-10-13 08:32:47', '2019-10-13 08:32:47', NULL, '[]'),
(3, 'M', 3, '0003M', 3, 17, '16.0000', '16.0000', '125.0000', '36.0000', '36.0000', '2019-10-13 08:36:23', '2019-10-13 08:36:23', NULL, NULL),
(4, 'L', 3, '0003L', 3, 18, '16.0000', '16.0000', '125.0000', '36.0000', '36.0000', '2019-10-13 08:36:23', '2019-10-13 08:36:23', NULL, NULL),
(5, 'XL', 3, '0003XL', 3, 19, '16.0000', '16.0000', '125.0000', '36.0000', '36.0000', '2019-10-13 08:36:23', '2019-10-13 08:36:23', NULL, NULL),
(6, 'S', 4, '0004S', 4, 16, '16.0000', '16.0000', '125.0000', '36.0000', '36.0000', '2019-10-13 08:40:09', '2019-10-13 08:40:09', NULL, NULL),
(7, 'M', 4, '0004M', 4, 17, '16.0000', '16.0000', '125.0000', '36.0000', '36.0000', '2019-10-13 08:40:09', '2019-10-13 08:40:09', NULL, NULL),
(8, 'L', 4, '0004L', 4, 18, '16.0000', '16.0000', '125.0000', '36.0000', '36.0000', '2019-10-13 08:40:09', '2019-10-13 08:40:09', NULL, NULL),
(9, 'MB', 5, '0005MB', 5, 39, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 08:47:40', '2019-10-13 09:15:38', NULL, NULL),
(10, 'LB', 5, '0005LB', 5, 40, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 08:47:40', '2019-10-13 09:15:38', NULL, NULL),
(11, 'XLB', 5, '0005XLB', 5, 41, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 08:47:40', '2019-10-13 09:15:38', NULL, NULL),
(12, 'MW', 5, '0005MW', 5, 42, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 08:47:40', '2019-10-13 09:15:38', NULL, NULL),
(13, 'LW', 5, '0005LW', 5, 43, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 08:47:40', '2019-10-13 09:15:38', NULL, NULL),
(14, 'XLW', 5, '0005XLW', 5, 44, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 08:47:40', '2019-10-13 09:15:38', NULL, NULL),
(15, 'MY', 6, '0006MY', 6, 45, '31.0000', '31.0000', '119.3500', '68.0000', '68.0000', '2019-10-13 08:54:27', '2019-10-13 08:54:27', NULL, NULL),
(16, 'XLY', 6, '0006XLY', 6, 46, '31.0000', '31.0000', '119.3500', '68.0000', '68.0000', '2019-10-13 08:54:27', '2019-10-13 08:54:27', NULL, NULL),
(17, '2XLY', 6, '00062XLY', 6, 47, '31.0000', '31.0000', '119.3500', '68.0000', '68.0000', '2019-10-13 08:54:27', '2019-10-13 08:54:27', NULL, NULL),
(18, 'MP', 6, '0006MP', 6, 48, '31.0000', '31.0000', '119.3500', '68.0000', '68.0000', '2019-10-13 08:54:27', '2019-10-13 08:54:27', NULL, NULL),
(19, 'LP', 6, '0006LP', 6, 49, '31.0000', '31.0000', '119.3500', '68.0000', '68.0000', '2019-10-13 08:54:27', '2019-10-13 08:54:27', NULL, NULL),
(20, 'XLP', 6, '0006XLP', 6, 50, '31.0000', '31.0000', '119.3500', '68.0000', '68.0000', '2019-10-13 08:54:27', '2019-10-13 08:54:27', NULL, NULL),
(21, '2XLP', 6, '00062XLP', 6, 51, '31.0000', '31.0000', '119.3500', '68.0000', '68.0000', '2019-10-13 08:54:27', '2019-10-13 08:54:27', NULL, NULL),
(22, 'SB', 7, '0007SB', 7, 52, '25.0000', '25.0000', '116.0000', '54.0000', '54.0000', '2019-10-13 09:08:34', '2019-10-13 09:08:34', NULL, NULL),
(23, 'MB', 7, '0007MB', 7, 39, '25.0000', '25.0000', '116.0000', '54.0000', '54.0000', '2019-10-13 09:08:34', '2019-10-13 09:08:34', NULL, NULL),
(24, 'SP', 7, '0007SP', 7, 53, '25.0000', '25.0000', '116.0000', '54.0000', '54.0000', '2019-10-13 09:08:34', '2019-10-13 09:08:34', NULL, NULL),
(25, 'MP', 7, '0007MP', 7, 48, '25.0000', '25.0000', '116.0000', '54.0000', '54.0000', '2019-10-13 09:08:34', '2019-10-13 09:08:34', NULL, NULL),
(26, 'MY', 8, '0008MY', 8, 54, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:13:25', '2019-10-13 09:13:25', NULL, NULL),
(27, 'LY', 8, '0008LY', 8, 55, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:13:25', '2019-10-13 09:13:25', NULL, NULL),
(28, 'XLY', 8, '0008XLY', 8, 56, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:13:25', '2019-10-13 09:13:25', NULL, NULL),
(29, '2XLY', 8, '00082XLY', 8, 57, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:13:25', '2019-10-13 09:13:25', NULL, NULL),
(30, 'MB', 8, '0008MB', 8, 58, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:13:25', '2019-10-13 09:13:25', NULL, NULL),
(31, 'LB', 8, '0008LB', 8, 59, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:13:25', '2019-10-13 09:13:25', NULL, NULL),
(32, 'XLB', 8, '0008XLB', 8, 60, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:13:25', '2019-10-13 09:13:25', NULL, NULL),
(33, '2XLB', 8, '00082XLB', 8, 61, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:13:25', '2019-10-13 09:13:25', NULL, NULL),
(34, 'SB', 5, '0005SB', 5, 52, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 09:15:38', '2019-10-13 09:15:38', NULL, NULL),
(35, 'SW', 5, '0005SW', 5, 62, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 09:15:38', '2019-10-13 09:15:38', NULL, NULL),
(36, 'MY', 9, '0009MY', 9, 54, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:18:56', '2019-10-13 09:18:56', NULL, NULL),
(37, 'LY', 9, '0009LY', 9, 55, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:18:56', '2019-10-13 09:18:56', NULL, NULL),
(38, 'XLY', 9, '0009XLY', 9, 56, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:18:56', '2019-10-13 09:18:56', NULL, NULL),
(39, '2XLY', 9, '00092XLY', 9, 57, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:18:56', '2019-10-13 09:18:56', NULL, NULL),
(40, 'MB', 9, '0009MB', 9, 58, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:18:56', '2019-10-13 09:18:56', NULL, NULL),
(41, 'LB', 9, '0009LB', 9, 59, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:18:56', '2019-10-13 09:18:56', NULL, NULL),
(42, 'XLB', 9, '0009XLB', 9, 60, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:18:56', '2019-10-13 09:18:56', NULL, NULL),
(43, '2XLB', 9, '00092XLB', 9, 61, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:18:56', '2019-10-13 09:18:56', NULL, NULL),
(44, 'DUMMY', 10, '0010', 10, NULL, '16.0000', '16.0000', '125.0000', '36.0000', '36.0000', '2019-10-13 09:23:17', '2019-10-13 09:23:17', NULL, '[]'),
(58, 'S-WHI', 11, '0011SW', 15, 67, '25.0000', '25.0000', '116.0000', '54.0000', '54.0000', '2019-10-13 09:49:24', '2019-10-13 09:53:10', NULL, NULL),
(59, 'M-WHI', 11, '0011MW', 15, 68, '25.0000', '25.0000', '116.0000', '54.0000', '54.0000', '2019-10-13 09:49:24', '2019-10-13 09:53:10', NULL, NULL),
(60, 'L-WHI', 11, '0011LW', 15, 69, '25.0000', '25.0000', '116.0000', '54.0000', '54.0000', '2019-10-13 09:49:24', '2019-10-13 09:53:10', NULL, NULL),
(61, 'M-BLA', 12, '0012-M-BLA', 16, 64, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:58:29', '2019-10-13 09:58:29', NULL, NULL),
(62, 'L-BLA', 12, '0012-L-BLA', 16, 65, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:58:29', '2019-10-13 09:58:29', NULL, NULL),
(63, '2XL-BLA', 12, '0012-2XL-BLA', 16, 87, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:58:29', '2019-10-13 09:58:29', NULL, NULL),
(64, 'M-BLU', 12, '0012-M-BLU', 17, 76, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:58:29', '2019-10-13 09:58:29', NULL, NULL),
(65, 'L-BLU', 12, '0012-L-BLU', 17, 77, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:58:29', '2019-10-13 09:58:29', NULL, NULL),
(66, 'XL-BLU', 12, '0012-XL-BLU', 17, 78, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:58:29', '2019-10-13 09:58:29', NULL, NULL),
(67, 'M-PIN', 12, '0012-M-PIN', 18, 80, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:58:29', '2019-10-13 09:58:29', NULL, NULL),
(68, 'L-PIN', 12, '0012-L-PIN', 18, 81, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:58:29', '2019-10-13 09:58:29', NULL, NULL),
(69, 'XL-PIN', 12, '0012-XL-PIN', 18, 82, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:58:29', '2019-10-13 09:58:29', NULL, NULL),
(70, '2XL-PIN', 12, '0012-2XL-PIN', 18, 88, '28.0000', '28.0000', '114.2900', '60.0000', '60.0000', '2019-10-13 09:58:29', '2019-10-13 09:58:29', NULL, NULL),
(71, 'M-BRO', 13, '0013-M-BRO', 19, 84, '16.0000', '16.0000', '150.0000', '40.0000', '40.0000', '2019-10-13 10:00:11', '2019-10-13 10:00:11', NULL, NULL),
(72, 'L-BRO', 13, '0013-L-BRO', 19, 85, '16.0000', '16.0000', '150.0000', '40.0000', '40.0000', '2019-10-13 10:00:11', '2019-10-13 10:00:11', NULL, NULL),
(73, 'XL-BRO', 13, '0013-XL-BRO', 19, 86, '16.0000', '16.0000', '150.0000', '40.0000', '40.0000', '2019-10-13 10:00:11', '2019-10-13 10:00:11', NULL, NULL),
(74, '2XL-BRO', 13, '0013-2XL-BRO', 19, 89, '16.0000', '16.0000', '150.0000', '40.0000', '40.0000', '2019-10-13 10:00:11', '2019-10-13 10:00:11', NULL, NULL),
(75, 'S', 14, '0014-S', 20, 16, '23.0000', '23.0000', '108.7000', '48.0000', '48.0000', '2019-10-13 10:06:10', '2019-10-13 10:06:10', NULL, NULL),
(76, 'M', 14, '0014-M', 20, 17, '23.0000', '23.0000', '108.7000', '48.0000', '48.0000', '2019-10-13 10:06:10', '2019-10-13 10:06:10', NULL, NULL),
(77, 'L', 14, '0014-L', 20, 18, '23.0000', '23.0000', '108.7000', '48.0000', '48.0000', '2019-10-13 10:06:10', '2019-10-13 10:06:10', NULL, NULL),
(78, 'S-BLA', 5, '0005-S-BLA', 21, 63, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 10:08:03', '2019-10-13 10:08:03', NULL, NULL),
(79, 'M-BLA', 5, '0005-M-BLA', 21, 64, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 10:08:03', '2019-10-13 10:08:03', NULL, NULL),
(80, 'L-BLA', 5, '0005-L-BLA', 21, 65, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 10:08:03', '2019-10-13 10:08:03', NULL, NULL),
(81, 'XL-BLA', 5, '0005-XL-BLA', 21, 66, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 10:08:03', '2019-10-13 10:08:03', NULL, NULL),
(82, 'S-WHI', 5, '0005-S-WHI', 22, 67, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 10:08:03', '2019-10-13 10:08:03', NULL, NULL),
(83, 'M-WHI', 5, '0005-M-WHI', 22, 68, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 10:08:03', '2019-10-13 10:08:03', NULL, NULL),
(84, 'L-WHI', 5, '0005-L-WHI', 22, 69, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 10:08:03', '2019-10-13 10:08:03', NULL, NULL),
(85, 'XL-WHI', 5, '0005-XL-WHI', 22, 70, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 10:08:03', '2019-10-13 10:08:03', NULL, NULL),
(86, 'M-YEL', 15, '0015-M', 23, 72, '9.0000', '9.0000', '166.6700', '24.0000', '24.0000', '2019-10-13 10:11:06', '2019-10-13 10:11:06', NULL, NULL),
(87, 'L-YEL', 15, '0015-L', 23, 73, '9.0000', '9.0000', '166.6700', '24.0000', '24.0000', '2019-10-13 10:11:06', '2019-10-13 10:11:06', NULL, NULL),
(88, 'XL-YEL', 15, '0015-XL', 23, 74, '9.0000', '9.0000', '166.6700', '24.0000', '24.0000', '2019-10-13 10:11:06', '2019-10-13 10:11:06', NULL, NULL),
(89, '2XL-YEL', 15, '0015-2XL', 23, 90, '9.0000', '9.0000', '166.6700', '24.0000', '24.0000', '2019-10-13 10:11:06', '2019-10-13 10:11:06', NULL, NULL),
(90, 'M', 16, '0016-M', 24, 92, '18.0000', '18.0000', '111.1100', '38.0000', '38.0000', '2019-10-13 10:13:42', '2019-10-13 10:13:42', NULL, NULL),
(91, 'L', 16, '0016-L', 24, 93, '18.0000', '18.0000', '111.1100', '38.0000', '38.0000', '2019-10-13 10:13:42', '2019-10-13 10:13:42', NULL, NULL),
(92, 'XL', 16, '0016-XL', 24, 94, '18.0000', '18.0000', '111.1100', '38.0000', '38.0000', '2019-10-13 10:13:42', '2019-10-13 10:13:42', NULL, NULL),
(93, '2XL', 16, '0016-2XL', 24, 95, '18.0000', '18.0000', '111.1100', '38.0000', '38.0000', '2019-10-13 10:13:42', '2019-10-13 10:13:42', NULL, NULL),
(94, 'M-BLA', 17, '0017-M-BLA', 25, 64, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:19:51', '2019-10-13 10:19:51', NULL, NULL),
(95, 'L-BLA', 17, '0017-L-BLA', 25, 65, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:19:51', '2019-10-13 10:19:51', NULL, NULL),
(96, 'XL-BLA', 17, '0017-XL-BLA', 25, 66, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:19:51', '2019-10-13 10:19:51', NULL, NULL),
(97, '2XL-BLA', 17, '0017-2XL-BLA', 25, 87, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:19:51', '2019-10-13 10:19:51', NULL, NULL),
(98, 'L-WHI', 17, '0017-L-WHI', 26, 69, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:19:51', '2019-10-13 10:19:51', NULL, NULL),
(99, 'XL-WHI', 17, '0017-XL-WHI', 26, 70, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:19:51', '2019-10-13 10:19:51', NULL, NULL),
(100, '2XL-WHI', 17, '0017-2XL-WHI', 26, 96, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:19:51', '2019-10-13 10:19:51', NULL, NULL),
(101, 'L-RED', 18, '0018-L-RED', 27, 103, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 10:28:43', '2019-10-13 10:28:43', NULL, NULL),
(102, 'XL-RED', 18, '0018-XL-RED', 27, 104, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 10:28:43', '2019-10-13 10:28:43', NULL, NULL),
(103, '2XL-RED', 18, '0018-2XL-RED', 27, 105, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 10:28:43', '2019-10-13 10:28:43', NULL, NULL),
(104, 'M-ORA', 18, '0018-M-ORA', 28, 98, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 10:28:43', '2019-10-13 10:28:43', NULL, NULL),
(105, 'L-ORA', 18, '0018-L-ORA', 28, 99, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 10:28:43', '2019-10-13 10:28:43', NULL, NULL),
(106, 'XL-ORA', 18, '0018-XL-ORA', 28, 100, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 10:28:43', '2019-10-13 10:28:43', NULL, NULL),
(107, '2XL-ORA', 18, '0018-2XL-ORA', 28, 106, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 10:28:43', '2019-10-13 10:28:43', NULL, NULL),
(108, 'M', 19, '0019-M', 29, 92, '20.0000', '20.0000', '120.0000', '44.0000', '44.0000', '2019-10-13 10:30:02', '2019-10-13 11:11:13', NULL, NULL),
(109, 'L', 19, '0019-L', 29, 93, '20.0000', '20.0000', '120.0000', '44.0000', '44.0000', '2019-10-13 10:30:02', '2019-10-13 11:11:13', NULL, NULL),
(110, 'XL', 19, '0019-XL', 29, 94, '20.0000', '20.0000', '120.0000', '44.0000', '44.0000', '2019-10-13 10:30:02', '2019-10-13 11:11:13', NULL, NULL),
(111, '2XL', 19, '0019-2XL', 29, 95, '20.0000', '20.0000', '120.0000', '44.0000', '44.0000', '2019-10-13 10:30:02', '2019-10-13 11:11:13', NULL, NULL),
(112, 'M', 20, '0020-M', 30, 92, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 10:32:11', '2019-10-13 10:32:11', NULL, NULL),
(113, 'L', 20, '0020-L', 30, 93, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 10:32:11', '2019-10-13 10:32:11', NULL, NULL),
(114, 'XL', 20, '0020-XL', 30, 94, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 10:32:11', '2019-10-13 10:32:11', NULL, NULL),
(115, '2XL', 20, '0020-2XL', 30, 95, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 10:32:11', '2019-10-13 10:32:11', NULL, NULL),
(116, 'M', 21, '0021-M', 31, 92, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:33:35', '2019-10-13 10:33:35', NULL, NULL),
(117, 'L', 21, '0021-L', 31, 93, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:33:35', '2019-10-13 10:33:35', NULL, NULL),
(118, 'XL', 21, '0021-XL', 31, 94, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:33:35', '2019-10-13 10:33:35', NULL, NULL),
(119, '2XL', 21, '0021-2XL', 31, 95, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:33:35', '2019-10-13 10:33:35', NULL, NULL),
(120, 'White', 22, '0022-WHI', 32, 1, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 10:37:18', '2019-10-13 10:37:18', NULL, NULL),
(121, 'Pink', 22, '0022-PIN', 32, 6, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 10:37:18', '2019-10-13 10:37:18', NULL, NULL),
(122, 'Blue', 22, '0022-BLU', 32, 13, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 10:37:18', '2019-10-13 10:37:18', NULL, NULL),
(123, 'M', 23, '0023-M', 33, 92, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:46:34', '2019-10-13 10:46:34', NULL, NULL),
(124, 'L', 23, '0023-L', 33, 93, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:46:34', '2019-10-13 10:46:34', NULL, NULL),
(125, 'XL', 23, '0023-XL', 33, 94, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:46:34', '2019-10-13 10:46:34', NULL, NULL),
(126, '2XL', 23, '0023-2XL', 33, 95, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:46:34', '2019-10-13 10:46:34', NULL, NULL),
(127, 'M', 24, '0024-M', 34, 92, '16.0000', '16.0000', '137.5000', '38.0000', '38.0000', '2019-10-13 10:48:48', '2019-10-13 10:48:48', NULL, NULL),
(128, 'L', 24, '0024-L', 34, 93, '16.0000', '16.0000', '137.5000', '38.0000', '38.0000', '2019-10-13 10:48:48', '2019-10-13 10:48:48', NULL, NULL),
(129, 'XL', 24, '0024-XL', 34, 94, '16.0000', '16.0000', '137.5000', '38.0000', '38.0000', '2019-10-13 10:48:48', '2019-10-13 10:48:48', NULL, NULL),
(130, 'DUMMY', 25, '0025', 35, NULL, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 10:50:12', '2019-10-13 10:50:12', NULL, '[]'),
(131, 'M', 26, '0026-M', 36, 92, '16.0000', '16.0000', '150.0000', '40.0000', '40.0000', '2019-10-13 10:52:28', '2019-10-13 10:52:28', NULL, NULL),
(132, 'L', 26, '0026-L', 36, 93, '16.0000', '16.0000', '150.0000', '40.0000', '40.0000', '2019-10-13 10:52:28', '2019-10-13 10:52:28', NULL, NULL),
(133, 'XL', 26, '0026-XL', 36, 94, '16.0000', '16.0000', '150.0000', '40.0000', '40.0000', '2019-10-13 10:52:28', '2019-10-13 10:52:28', NULL, NULL),
(134, '2XL', 26, '0026-2XL', 36, 95, '16.0000', '16.0000', '150.0000', '40.0000', '40.0000', '2019-10-13 10:52:28', '2019-10-13 10:52:28', NULL, NULL),
(135, 'M', 27, '0027-M', 37, 92, '15.0000', '15.0000', '160.0000', '39.0000', '39.0000', '2019-10-13 10:53:56', '2019-10-13 10:53:56', NULL, NULL),
(136, 'L', 27, '0027-L', 37, 93, '15.0000', '15.0000', '160.0000', '39.0000', '39.0000', '2019-10-13 10:53:56', '2019-10-13 10:53:56', NULL, NULL),
(137, 'XL', 27, '0027-XL', 37, 94, '15.0000', '15.0000', '160.0000', '39.0000', '39.0000', '2019-10-13 10:53:56', '2019-10-13 10:53:56', NULL, NULL),
(138, 'S', 28, '0028-S', 38, 91, '14.0000', '14.0000', '178.5700', '39.0000', '39.0000', '2019-10-13 10:55:38', '2019-10-13 10:55:38', NULL, NULL),
(139, 'M', 28, '0028-M', 38, 92, '14.0000', '14.0000', '178.5700', '39.0000', '39.0000', '2019-10-13 10:55:38', '2019-10-13 10:55:38', NULL, NULL),
(140, 'L', 28, '0028-L', 38, 93, '14.0000', '14.0000', '178.5700', '39.0000', '39.0000', '2019-10-13 10:55:38', '2019-10-13 10:55:38', NULL, NULL),
(141, 'XL', 28, '0028-XL', 38, 94, '14.0000', '14.0000', '178.5700', '39.0000', '39.0000', '2019-10-13 10:55:38', '2019-10-13 10:55:38', NULL, NULL),
(142, 'S', 29, '0029-S', 39, 91, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:58:58', '2019-10-13 10:58:58', NULL, NULL),
(143, 'M', 29, '0029-M', 39, 92, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:58:58', '2019-10-13 10:58:58', NULL, NULL),
(144, 'L', 29, '0029-L', 39, 93, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:58:58', '2019-10-13 10:58:58', NULL, NULL),
(145, 'XL', 29, '0029-XL', 39, 94, '19.0000', '19.0000', '110.5300', '40.0000', '40.0000', '2019-10-13 10:58:58', '2019-10-13 10:58:58', NULL, NULL),
(146, 'S', 30, '0030-S', 40, 91, '20.0000', '20.0000', '130.0000', '46.0000', '46.0000', '2019-10-13 11:01:53', '2019-10-13 11:01:53', NULL, NULL),
(147, 'M', 30, '0030-M', 40, 92, '20.0000', '20.0000', '130.0000', '46.0000', '46.0000', '2019-10-13 11:01:53', '2019-10-13 11:01:53', NULL, NULL),
(148, 'L', 30, '0030-L', 40, 93, '20.0000', '20.0000', '130.0000', '46.0000', '46.0000', '2019-10-13 11:01:53', '2019-10-13 11:01:53', NULL, NULL),
(149, 'XL', 30, '0030-XL', 40, 94, '20.0000', '20.0000', '130.0000', '46.0000', '46.0000', '2019-10-13 11:01:53', '2019-10-13 11:01:53', NULL, NULL),
(150, '2XL', 30, '0030-2XL', 40, 95, '20.0000', '20.0000', '130.0000', '46.0000', '46.0000', '2019-10-13 11:01:53', '2019-10-13 11:01:53', NULL, NULL),
(151, 'M-PIN', 31, '0031-M-PIN', 41, 80, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 11:06:56', '2019-10-13 11:06:56', NULL, NULL),
(152, 'L-PIN', 31, '0031-L-PIN', 41, 81, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 11:06:56', '2019-10-13 11:06:56', NULL, NULL),
(153, 'XL-PIN', 31, '0031-XL-PIN', 41, 82, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 11:06:56', '2019-10-13 11:06:56', NULL, NULL),
(154, 'M-GREY', 31, '0031-M-GREY', 42, 108, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 11:06:56', '2019-10-13 11:06:56', NULL, NULL),
(155, 'L-GREY', 31, '0031-L-GREY', 42, 109, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 11:06:56', '2019-10-13 11:06:56', NULL, NULL),
(156, 'XL-GREY', 31, '0031-XL-GREY', 42, 110, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-10-13 11:06:56', '2019-10-13 11:06:56', NULL, NULL),
(157, 'S-BLA', 32, '0032-S-BLA', 43, 63, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 11:09:17', '2019-10-13 11:09:17', NULL, NULL),
(158, 'M-BLA', 32, '0032-M-BLA', 43, 64, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 11:09:17', '2019-10-13 11:09:17', NULL, NULL),
(159, 'L-BLA', 32, '0032-L-BLA', 43, 65, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 11:09:17', '2019-10-13 11:09:17', NULL, NULL),
(160, 'S-BLU', 32, '0032-S-BLU', 44, 75, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 11:09:17', '2019-10-13 11:09:17', NULL, NULL),
(161, 'M-BLU', 32, '0032-M-BLU', 44, 76, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 11:09:17', '2019-10-13 11:09:17', NULL, NULL),
(162, 'L-BLU', 32, '0032-L-BLU', 44, 77, '25.0000', '25.0000', '132.0000', '58.0000', '58.0000', '2019-10-13 11:09:17', '2019-10-13 11:09:17', NULL, NULL),
(163, 'S', 19, '0019-S', 29, 91, '20.0000', '20.0000', '120.0000', '44.0000', '44.0000', '2019-10-13 11:11:13', '2019-10-13 11:11:13', NULL, NULL),
(164, 'M', 33, '0033-M', 45, 92, '14.0000', '14.0000', '128.5700', '32.0000', '32.0000', '2019-10-13 11:12:52', '2019-10-13 11:12:52', NULL, NULL),
(165, 'L', 33, '0033-L', 45, 93, '14.0000', '14.0000', '128.5700', '32.0000', '32.0000', '2019-10-13 11:12:52', '2019-10-13 11:12:52', NULL, NULL),
(166, 'XL', 33, '0033-XL', 45, 94, '14.0000', '14.0000', '128.5700', '32.0000', '32.0000', '2019-10-13 11:12:52', '2019-10-13 11:12:52', NULL, NULL),
(167, 'M', 34, '0034-M', 46, 92, '18.0000', '18.0000', '116.6700', '39.0000', '39.0000', '2019-10-13 11:13:42', '2019-10-13 11:13:42', NULL, NULL),
(168, 'L', 34, '0034-L', 46, 93, '18.0000', '18.0000', '116.6700', '39.0000', '39.0000', '2019-10-13 11:13:42', '2019-10-13 11:13:42', NULL, NULL),
(169, 'DUMMY', 35, '0035', 47, NULL, '266.0000', '266.0000', '103.0100', '540.0000', '540.0000', '2019-11-11 05:19:48', '2019-11-11 05:24:04', NULL, '[]'),
(170, 'S-BLU', 36, '0036-S-BLU', 48, 75, '285.0000', '285.0000', '103.5100', '580.0000', '580.0000', '2019-11-11 05:23:36', '2019-11-11 05:23:36', NULL, NULL),
(171, 'M-BLU', 36, '0036-M-BLU', 48, 76, '285.0000', '285.0000', '103.5100', '580.0000', '580.0000', '2019-11-11 05:23:36', '2019-11-11 05:23:36', NULL, NULL),
(172, 'S-GREY', 37, '0037-S-GREY', 49, 107, '255.0000', '255.0000', '127.4500', '580.0000', '580.0000', '2019-11-11 05:26:12', '2019-11-11 05:26:12', NULL, NULL),
(173, 'M-GREY', 37, '0037-M-GREY', 49, 108, '255.0000', '255.0000', '127.4500', '580.0000', '580.0000', '2019-11-11 05:26:12', '2019-11-11 05:26:12', NULL, NULL),
(174, 'M', 38, '0038-M', 50, 92, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-11-11 05:31:19', '2019-11-11 05:31:19', NULL, NULL),
(175, 'L', 38, '0038-L', 50, 93, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-11-11 05:31:19', '2019-11-11 05:31:19', NULL, NULL),
(176, 'XL', 38, '0038-XL', 50, 94, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-11-11 05:31:19', '2019-11-11 05:31:19', NULL, NULL),
(177, 'M', 39, '0039-M', 51, 92, '14.0000', '14.0000', '114.2900', '30.0000', '30.0000', '2019-11-11 05:33:11', '2019-11-11 05:33:11', NULL, NULL),
(178, 'L', 39, '0039-L', 51, 93, '14.0000', '14.0000', '114.2900', '30.0000', '30.0000', '2019-11-11 05:33:11', '2019-11-11 05:33:11', NULL, NULL),
(179, 'S', 40, '0040-S', 52, 91, '12.0000', '12.0000', '116.6700', '26.0000', '26.0000', '2019-11-11 05:35:17', '2019-11-11 05:35:17', NULL, NULL),
(180, 'M', 40, '0040-M', 52, 92, '12.0000', '12.0000', '116.6700', '26.0000', '26.0000', '2019-11-11 05:35:17', '2019-11-11 05:35:17', NULL, NULL),
(181, 'L', 40, '0040-L', 52, 93, '12.0000', '12.0000', '116.6700', '26.0000', '26.0000', '2019-11-11 05:35:17', '2019-11-11 05:35:17', NULL, NULL),
(182, 'XL', 40, '0040-XL', 52, 94, '12.0000', '12.0000', '116.6700', '26.0000', '26.0000', '2019-11-11 05:35:17', '2019-11-11 05:35:17', NULL, NULL),
(183, 'M-WHI', 41, '0041-M-WHI', 53, 68, '12.0000', '12.0000', '108.3300', '25.0000', '25.0000', '2019-11-11 06:52:33', '2019-11-11 06:52:33', NULL, NULL),
(184, 'L-GREY', 41, '0041-L-GREY', 54, 109, '12.0000', '12.0000', '108.3300', '25.0000', '25.0000', '2019-11-11 06:52:33', '2019-11-11 06:52:33', NULL, NULL),
(185, 'S-BLA', 42, '0042-S-BLA', 55, 63, '25.0000', '25.0000', '100.0000', '50.0000', '50.0000', '2019-11-11 06:58:54', '2019-11-11 07:06:24', NULL, NULL),
(186, 'M-BLA', 42, '0042-M-BLA', 55, 64, '25.0000', '25.0000', '100.0000', '50.0000', '50.0000', '2019-11-11 06:58:54', '2019-11-11 07:06:24', NULL, NULL),
(187, 'L-BLA', 42, '0042-L-BLA', 55, 65, '25.0000', '25.0000', '100.0000', '50.0000', '50.0000', '2019-11-11 06:58:54', '2019-11-11 07:06:24', NULL, NULL),
(188, 'S-BLU', 42, '0042-S-BLU', 56, 75, '25.0000', '25.0000', '100.0000', '50.0000', '50.0000', '2019-11-11 06:58:54', '2019-11-11 07:06:24', NULL, NULL),
(189, 'M-BLU', 42, '0042-M-BLU', 56, 76, '25.0000', '25.0000', '100.0000', '50.0000', '50.0000', '2019-11-11 06:58:54', '2019-11-11 07:06:24', NULL, NULL),
(190, 'L-BLU', 42, '0042-L-BLU', 56, 77, '25.0000', '25.0000', '100.0000', '50.0000', '50.0000', '2019-11-11 06:58:54', '2019-11-11 07:06:24', NULL, NULL),
(191, 'S-BLA', 43, '0043-S-BLA', 57, 63, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-11-11 07:09:39', '2019-11-11 07:09:39', NULL, NULL),
(192, 'M-BLA', 43, '0043-M-BLA', 57, 64, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-11-11 07:09:39', '2019-11-11 07:09:39', NULL, NULL),
(193, 'L-BLA', 43, '0043-L-BLA', 57, 65, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-11-11 07:09:39', '2019-11-11 07:09:39', NULL, NULL),
(194, 'XL-BLA', 43, '0043-XL-BLA', 57, 66, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-11-11 07:09:39', '2019-11-11 07:09:39', NULL, NULL),
(195, 'DUMMY', 44, '0044', 58, NULL, '23.0000', '23.0000', '108.7000', '48.0000', '48.0000', '2019-11-11 07:14:05', '2019-11-11 07:14:32', NULL, '[]'),
(196, 'S-BLA', 45, '0045-S-BLA', 59, 63, '32.0000', '32.0000', '106.2500', '66.0000', '66.0000', '2019-11-11 07:16:49', '2019-11-11 07:19:29', NULL, NULL),
(197, 'M-BLA', 45, '0045-M-BLA', 59, 64, '32.0000', '32.0000', '106.2500', '66.0000', '66.0000', '2019-11-11 07:16:49', '2019-11-11 07:19:29', NULL, NULL),
(198, 'L-BLA', 45, '0045-L-BLA', 59, 65, '32.0000', '32.0000', '106.2500', '66.0000', '66.0000', '2019-11-11 07:16:49', '2019-11-11 07:19:29', NULL, NULL),
(199, 'S-YEL', 45, '0045-S-YEL', 60, 71, '32.0000', '32.0000', '106.2500', '66.0000', '66.0000', '2019-11-11 07:19:29', '2019-11-11 07:19:29', NULL, NULL),
(200, 'M-YEL', 45, '0045-M-YEL', 60, 72, '32.0000', '32.0000', '106.2500', '66.0000', '66.0000', '2019-11-11 07:19:29', '2019-11-11 07:19:29', NULL, NULL),
(201, 'S-BLA', 46, '0046-S-BLA', 61, 63, '17.0000', '17.0000', '111.7600', '36.0000', '36.0000', '2019-11-11 07:23:18', '2019-11-11 07:23:18', NULL, NULL),
(202, 'M-BLA', 46, '0046-M-BLA', 61, 64, '17.0000', '17.0000', '111.7600', '36.0000', '36.0000', '2019-11-11 07:23:18', '2019-11-11 07:23:18', NULL, NULL),
(203, 'L-BLA', 46, '0046-L-BLA', 61, 65, '17.0000', '17.0000', '111.7600', '36.0000', '36.0000', '2019-11-11 07:23:18', '2019-11-11 07:23:18', NULL, NULL),
(204, 'M-PIN', 47, '0047-M-PIN', 62, 80, '21.0000', '21.0000', '109.5200', '44.0000', '44.0000', '2019-11-11 07:57:08', '2019-11-11 07:57:08', NULL, NULL),
(205, 'L-PIN', 47, '0047-L-PIN', 62, 81, '21.0000', '21.0000', '109.5200', '44.0000', '44.0000', '2019-11-11 07:57:08', '2019-11-11 07:57:08', NULL, NULL),
(206, 'L-PIN', 48, '0048-L-PIN', 63, 81, '10.0000', '10.0000', '120.0000', '22.0000', '22.0000', '2019-11-11 07:59:34', '2019-11-11 08:00:52', NULL, NULL),
(207, 'S-BLU', 48, '0048-S-BLU', 64, 75, '10.0000', '10.0000', '120.0000', '22.0000', '22.0000', '2019-11-11 08:00:52', '2019-11-11 08:00:52', NULL, NULL),
(208, 'M-BLU', 48, '0048-M-BLU', 64, 76, '10.0000', '10.0000', '120.0000', '22.0000', '22.0000', '2019-11-11 08:00:52', '2019-11-11 08:00:52', NULL, NULL),
(209, 'L-BLU', 48, '0048-L-BLU', 64, 77, '10.0000', '10.0000', '120.0000', '22.0000', '22.0000', '2019-11-11 08:00:52', '2019-11-11 08:00:52', NULL, NULL),
(210, 'S-BLA', 49, '0049-S-BLA', 65, 63, '10.0000', '10.0000', '120.0000', '22.0000', '22.0000', '2019-11-12 13:22:08', '2019-11-12 13:22:08', NULL, NULL),
(211, 'M-BLA', 49, '0049-M-BLA', 65, 64, '10.0000', '10.0000', '120.0000', '22.0000', '22.0000', '2019-11-12 13:22:08', '2019-11-12 13:22:08', NULL, NULL),
(212, 'L-BLA', 49, '0049-L-BLA', 65, 65, '10.0000', '10.0000', '120.0000', '22.0000', '22.0000', '2019-11-12 13:22:08', '2019-11-12 13:22:08', NULL, NULL),
(213, 'XL-BLA', 49, '0049-XL-BLA', 65, 66, '10.0000', '10.0000', '120.0000', '22.0000', '22.0000', '2019-11-12 13:22:08', '2019-11-12 13:22:08', NULL, NULL),
(214, 'S-BLU', 49, '0049-S-BLU', 66, 75, '10.0000', '10.0000', '120.0000', '22.0000', '22.0000', '2019-11-12 13:22:08', '2019-11-12 13:22:08', NULL, NULL),
(215, 'L-BLU', 49, '0049-L-BLU', 66, 77, '10.0000', '10.0000', '120.0000', '22.0000', '22.0000', '2019-11-12 13:22:08', '2019-11-12 13:22:08', NULL, NULL),
(216, 'XL-BLU', 49, '0049-XL-BLU', 66, 78, '10.0000', '10.0000', '120.0000', '22.0000', '22.0000', '2019-11-12 13:22:08', '2019-11-12 13:22:08', NULL, NULL),
(217, 'M', 50, '0050-M', 67, 92, '28.0000', '28.0000', '100.0000', '56.0000', '56.0000', '2019-11-12 13:28:12', '2019-11-12 13:28:12', NULL, NULL),
(218, 'L', 50, '0050-L', 67, 93, '28.0000', '28.0000', '100.0000', '56.0000', '56.0000', '2019-11-12 13:28:12', '2019-11-12 13:28:12', NULL, NULL),
(219, 'XL', 51, '0051-XL', 68, 94, '20.0000', '20.0000', '100.0000', '40.0000', '40.0000', '2019-11-12 13:32:27', '2019-11-12 13:32:27', NULL, NULL),
(220, '2XL', 51, '0051-2XL', 68, 95, '20.0000', '20.0000', '100.0000', '40.0000', '40.0000', '2019-11-12 13:32:27', '2019-11-12 13:32:27', NULL, NULL),
(221, 'S-BLA', 52, '0052-S-BLA', 69, 63, '17.0000', '17.0000', '111.7600', '36.0000', '36.0000', '2019-11-12 13:39:56', '2019-11-12 13:39:56', NULL, NULL),
(222, 'M-BLA', 52, '0052-M-BLA', 69, 64, '17.0000', '17.0000', '111.7600', '36.0000', '36.0000', '2019-11-12 13:39:56', '2019-11-12 13:39:56', NULL, NULL),
(223, 'L-BLA', 52, '0052-L-BLA', 69, 65, '17.0000', '17.0000', '111.7600', '36.0000', '36.0000', '2019-11-12 13:39:56', '2019-11-12 13:39:56', NULL, NULL),
(224, 'S-WHI', 52, '0052-S-WHI', 70, 67, '17.0000', '17.0000', '111.7600', '36.0000', '36.0000', '2019-11-12 13:39:56', '2019-11-12 13:39:56', NULL, NULL),
(225, 'L-WHI', 52, '0052-L-WHI', 70, 69, '17.0000', '17.0000', '111.7600', '36.0000', '36.0000', '2019-11-12 13:39:56', '2019-11-12 13:39:56', NULL, NULL),
(226, 'S-YEL', 52, '0052-S-YEL', 71, 71, '17.0000', '17.0000', '111.7600', '36.0000', '36.0000', '2019-11-12 13:39:56', '2019-11-12 13:39:56', NULL, NULL),
(227, 'M-YEL', 52, '0052-M-YEL', 71, 72, '17.0000', '17.0000', '111.7600', '36.0000', '36.0000', '2019-11-12 13:39:56', '2019-11-12 13:39:56', NULL, NULL),
(228, 'L-YEL', 52, '0052-L-YEL', 71, 73, '17.0000', '17.0000', '111.7600', '36.0000', '36.0000', '2019-11-12 13:39:56', '2019-11-12 13:39:56', NULL, NULL),
(229, 'S-BLU', 52, '0052-S-BLU', 72, 75, '17.0000', '17.0000', '111.7600', '36.0000', '36.0000', '2019-11-12 13:39:56', '2019-11-12 13:39:56', NULL, NULL),
(230, 'L-BLU', 52, '0052-L-BLU', 72, 77, '17.0000', '17.0000', '111.7600', '36.0000', '36.0000', '2019-11-12 13:39:56', '2019-11-12 13:39:56', NULL, NULL),
(231, 'XL', 53, '0053-XL', 73, 94, '23.0000', '23.0000', '108.7000', '48.0000', '48.0000', '2019-11-12 13:42:53', '2019-11-12 13:42:53', NULL, NULL),
(232, '2XL', 53, '0053-2XL', 73, 95, '23.0000', '23.0000', '108.7000', '48.0000', '48.0000', '2019-11-12 13:42:53', '2019-11-12 13:42:53', NULL, NULL),
(233, 'DUMMY', 54, '0054', 74, NULL, '16.0000', '16.0000', '100.0000', '32.0000', '32.0000', '2019-11-12 13:51:54', '2019-11-12 14:22:51', NULL, '[]'),
(234, 'M-BLA', 55, '0055-M-BLA', 75, 64, '12.0000', '12.0000', '116.6700', '26.0000', '26.0000', '2019-11-12 13:56:44', '2019-11-12 13:56:44', NULL, NULL),
(235, 'L-BLA', 55, '0055-L-BLA', 75, 65, '12.0000', '12.0000', '116.6700', '26.0000', '26.0000', '2019-11-12 13:56:44', '2019-11-12 13:56:44', NULL, NULL),
(236, 'M-WHI', 55, '0055-M-WHI', 76, 68, '12.0000', '12.0000', '116.6700', '26.0000', '26.0000', '2019-11-12 13:56:44', '2019-11-12 13:56:44', NULL, NULL),
(237, 'L-WHI', 55, '0055-L-WHI', 76, 69, '12.0000', '12.0000', '116.6700', '26.0000', '26.0000', '2019-11-12 13:56:44', '2019-11-12 13:56:44', NULL, NULL),
(238, 'M-ORA', 56, '0056-M-ORA', 77, 98, '26.0000', '26.0000', '100.0000', '52.0000', '52.0000', '2019-11-12 14:00:45', '2019-11-12 14:00:45', NULL, NULL),
(239, 'S-BLU', 56, '0056-S-BLU', 78, 75, '26.0000', '26.0000', '100.0000', '52.0000', '52.0000', '2019-11-12 14:00:45', '2019-11-12 14:00:45', NULL, NULL),
(240, 'M-BLU', 56, '0056-M-BLU', 78, 76, '26.0000', '26.0000', '100.0000', '52.0000', '52.0000', '2019-11-12 14:00:45', '2019-11-12 14:00:45', NULL, NULL),
(241, 'DUMMY', 57, '0057', 79, NULL, '7.0000', '7.0000', '242.8600', '24.0000', '24.0000', '2019-11-12 14:02:32', '2019-11-12 14:02:32', NULL, '[]'),
(242, 'S', 58, '0058-S', 80, 91, '20.0000', '20.0000', '100.0000', '40.0000', '40.0000', '2019-11-12 14:04:15', '2019-11-12 14:04:15', NULL, NULL),
(243, 'M', 58, '0058-M', 80, 92, '20.0000', '20.0000', '100.0000', '40.0000', '40.0000', '2019-11-12 14:04:15', '2019-11-12 14:04:15', NULL, NULL),
(244, 'S-PIN', 59, '0059-S-PIN', 81, 79, '9.0000', '9.0000', '100.0000', '18.0000', '18.0000', '2019-11-12 14:10:08', '2019-11-12 14:10:47', NULL, NULL),
(245, 'M-PIN', 59, '0059-M-PIN', 81, 80, '9.0000', '9.0000', '100.0000', '18.0000', '18.0000', '2019-11-12 14:10:08', '2019-11-12 14:10:47', NULL, NULL),
(246, 'S-ORA', 59, '0059-S-ORA', 82, 97, '9.0000', '9.0000', '100.0000', '18.0000', '18.0000', '2019-11-12 14:10:08', '2019-11-12 14:10:47', NULL, NULL),
(247, 'S-BLA', 59, '0059-S-BLA', 83, 63, '9.0000', '9.0000', '100.0000', '18.0000', '18.0000', '2019-11-12 14:10:08', '2019-11-12 14:10:47', NULL, NULL),
(248, 'M-BLA', 59, '0059-M-BLA', 83, 64, '9.0000', '9.0000', '100.0000', '18.0000', '18.0000', '2019-11-12 14:10:08', '2019-11-12 14:10:47', NULL, NULL),
(249, 'S-PIN', 60, '0060-S-PIN', 84, 79, '23.0000', '23.0000', '152.1700', '58.0000', '58.0000', '2019-11-12 14:17:22', '2019-11-12 14:17:22', NULL, NULL),
(250, 'M-PIN', 60, '0060-M-PIN', 84, 80, '23.0000', '23.0000', '152.1700', '58.0000', '58.0000', '2019-11-12 14:17:22', '2019-11-12 14:17:22', NULL, NULL),
(251, 'S-YEL', 60, '0060-S-YEL', 85, 71, '23.0000', '23.0000', '152.1700', '58.0000', '58.0000', '2019-11-12 14:17:22', '2019-11-12 14:17:22', NULL, NULL),
(252, 'M-YEL', 60, '0060-M-YEL', 85, 72, '23.0000', '23.0000', '152.1700', '58.0000', '58.0000', '2019-11-12 14:17:22', '2019-11-12 14:17:22', NULL, NULL),
(253, 'S-RED', 60, '0060-S-RED', 86, 101, '23.0000', '23.0000', '152.1700', '58.0000', '58.0000', '2019-11-12 14:17:22', '2019-11-12 14:17:22', NULL, NULL),
(254, 'M-RED', 60, '0060-M-RED', 86, 102, '23.0000', '23.0000', '152.1700', '58.0000', '58.0000', '2019-11-12 14:17:22', '2019-11-12 14:17:22', NULL, NULL),
(255, 'DUMMY', 61, '0061', 87, NULL, '16.0000', '16.0000', '100.0000', '32.0000', '32.0000', '2019-11-12 14:23:47', '2019-11-12 14:23:47', NULL, '[]'),
(256, 'M', 62, '0062-M', 88, 92, '14.0000', '14.0000', '100.0000', '28.0000', '28.0000', '2019-11-12 14:26:11', '2019-11-12 14:26:11', NULL, NULL),
(257, 'L', 62, '0062-L', 88, 93, '14.0000', '14.0000', '100.0000', '28.0000', '28.0000', '2019-11-12 14:26:11', '2019-11-12 14:26:11', NULL, NULL),
(258, 'S', 63, '0063-S', 89, 91, '12.0000', '12.0000', '100.0000', '24.0000', '24.0000', '2019-11-12 14:28:44', '2019-11-12 14:28:44', NULL, NULL),
(259, 'M', 63, '0063-M', 89, 92, '12.0000', '12.0000', '100.0000', '24.0000', '24.0000', '2019-11-12 14:28:44', '2019-11-12 14:28:44', NULL, NULL),
(260, 'S', 64, '0064-S', 90, 91, '14.0000', '14.0000', '100.0000', '28.0000', '28.0000', '2019-11-12 14:31:15', '2019-11-12 14:31:15', NULL, NULL),
(261, 'M', 64, '0064-M', 90, 92, '14.0000', '14.0000', '100.0000', '28.0000', '28.0000', '2019-11-12 14:31:15', '2019-11-12 14:31:15', NULL, NULL),
(262, 'L-RED', 65, '0065-L-RED', 91, 103, '9.0000', '9.0000', '100.0000', '18.0000', '18.0000', '2019-11-12 14:33:55', '2019-11-12 14:33:55', NULL, NULL),
(263, 'XL-RED', 65, '0065-XL-RED', 91, 104, '9.0000', '9.0000', '100.0000', '18.0000', '18.0000', '2019-11-12 14:33:55', '2019-11-12 14:33:55', NULL, NULL),
(264, 'L-WHI', 65, '0065-L-WHI', 92, 69, '9.0000', '9.0000', '100.0000', '18.0000', '18.0000', '2019-11-12 14:33:55', '2019-11-12 14:33:55', NULL, NULL),
(265, 'XL-WHI', 65, '0065-XL-WHI', 92, 70, '9.0000', '9.0000', '100.0000', '18.0000', '18.0000', '2019-11-12 14:33:55', '2019-11-12 14:33:55', NULL, NULL),
(266, 'M-WHI', 66, '0066-M-WHI', 93, 68, '12.0000', '12.0000', '116.6700', '26.0000', '26.0000', '2019-11-12 14:36:42', '2019-11-12 14:36:42', NULL, NULL),
(267, 'M-PIN', 66, '0066-M-PIN', 94, 80, '12.0000', '12.0000', '116.6700', '26.0000', '26.0000', '2019-11-12 14:36:42', '2019-11-12 14:36:42', NULL, NULL),
(268, 'M-BLA', 67, '0067-M-BLA', 95, 64, '11.0000', '11.0000', '118.1800', '24.0000', '24.0000', '2019-11-12 14:38:53', '2019-11-12 14:38:53', NULL, NULL),
(269, 'M-WHI', 67, '0067-M-BLA', 96, 68, '11.0000', '11.0000', '118.1800', '24.0000', '24.0000', '2019-11-12 14:38:53', '2019-11-12 14:38:53', NULL, NULL),
(270, 'DUMMY', 68, '0068', 97, NULL, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-11-12 14:39:44', '2019-11-12 14:39:44', NULL, '[]'),
(271, 'S', 69, '0069-S', 98, 91, '12.0000', '12.0000', '116.6700', '26.0000', '26.0000', '2019-11-12 14:41:12', '2019-11-12 14:41:12', NULL, NULL),
(272, 'M', 69, '0069-M', 98, 92, '12.0000', '12.0000', '116.6700', '26.0000', '26.0000', '2019-11-12 14:41:12', '2019-11-12 14:41:12', NULL, NULL),
(273, 'M', 70, '0070-M', 99, 92, '14.0000', '14.0000', '100.0000', '28.0000', '28.0000', '2019-11-12 14:42:55', '2019-11-12 14:42:55', NULL, NULL),
(274, 'L', 70, '0070-L', 99, 93, '14.0000', '14.0000', '100.0000', '28.0000', '28.0000', '2019-11-12 14:42:55', '2019-11-12 14:42:55', NULL, NULL),
(275, 'L', 71, '0071-L', 100, 93, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-11-12 14:44:39', '2019-11-12 14:44:39', NULL, NULL),
(276, 'XL', 71, '0071-XL', 100, 94, '13.0000', '13.0000', '115.3800', '28.0000', '28.0000', '2019-11-12 14:44:39', '2019-11-12 14:44:39', NULL, NULL),
(277, 'M-WHI', 72, '0072-M-WHI', 101, 68, '22.0000', '22.0000', '109.0900', '46.0000', '46.0000', '2019-11-12 15:02:16', '2019-11-16 16:07:18', NULL, NULL),
(278, 'L-WHI', 72, '0072-L-WHI', 101, 69, '22.0000', '22.0000', '109.0900', '46.0000', '46.0000', '2019-11-12 15:02:16', '2019-11-16 16:07:18', NULL, NULL),
(279, 'XL-WHI', 72, '0072-XL-WHI', 101, 70, '22.0000', '22.0000', '109.0900', '46.0000', '46.0000', '2019-11-12 15:02:16', '2019-11-16 16:07:18', NULL, NULL),
(280, 'M-BLU', 72, '0072-M-BLU', 102, 76, '22.0000', '22.0000', '109.0900', '46.0000', '46.0000', '2019-11-12 15:02:16', '2019-11-16 16:07:18', NULL, NULL),
(281, 'L-BLU', 72, '0072-L-BLU', 102, 77, '22.0000', '22.0000', '109.0900', '46.0000', '46.0000', '2019-11-12 15:02:16', '2019-11-16 16:07:18', NULL, NULL),
(282, 'XL-BLU', 72, '0072-XL-BLU', 102, 78, '22.0000', '22.0000', '109.0900', '46.0000', '46.0000', '2019-11-12 15:02:16', '2019-11-16 16:07:18', NULL, NULL),
(283, 'DUMMY', 73, '0073', 103, NULL, '17.0000', '17.0000', '111.7600', '36.0000', '36.0000', '2019-11-16 15:38:36', '2019-11-16 16:08:43', NULL, '[]'),
(284, 'M-WHI', 74, '0074-M-WHI', 104, 68, '9.0000', '9.0000', '144.4400', '22.0000', '22.0000', '2019-11-16 15:45:18', '2019-11-16 15:45:48', NULL, NULL),
(285, 'L-WHI', 74, '0074-L-WHI', 104, 69, '9.0000', '9.0000', '144.4400', '22.0000', '22.0000', '2019-11-16 15:45:18', '2019-11-16 15:45:48', NULL, NULL),
(286, 'M-BLA', 74, '0074-M-BLA', 105, 64, '9.0000', '9.0000', '144.4400', '22.0000', '22.0000', '2019-11-16 15:45:18', '2019-11-16 15:45:48', NULL, NULL),
(287, 'L-BLA', 74, '0074-L-BLA', 105, 65, '9.0000', '9.0000', '144.4400', '22.0000', '22.0000', '2019-11-16 15:45:18', '2019-11-16 15:45:48', NULL, NULL),
(288, 'M-BLU', 74, '0074-M-BLU', 106, 76, '9.0000', '9.0000', '144.4400', '22.0000', '22.0000', '2019-11-16 15:45:18', '2019-11-16 15:45:48', NULL, NULL),
(289, 'L-BLU', 74, '0074-L-BLU', 106, 77, '9.0000', '9.0000', '144.4400', '22.0000', '22.0000', '2019-11-16 15:45:18', '2019-11-16 15:45:48', NULL, NULL),
(290, 'M-PIN', 74, '0074-M-PIN', 107, 80, '9.0000', '9.0000', '144.4400', '22.0000', '22.0000', '2019-11-16 15:45:18', '2019-11-16 15:45:48', NULL, NULL),
(291, 'L-PIN', 74, '0074-L-PIN', 107, 81, '9.0000', '9.0000', '144.4400', '22.0000', '22.0000', '2019-11-16 15:45:18', '2019-11-16 15:45:48', NULL, NULL),
(292, 'M-RED', 75, '0075-M-RED', 108, 102, '32.0000', '32.0000', '106.2500', '66.0000', '66.0000', '2019-11-16 15:55:13', '2019-11-16 15:55:13', NULL, NULL),
(293, 'XL-RED', 75, '0075-XL-RED', 108, 104, '32.0000', '32.0000', '106.2500', '66.0000', '66.0000', '2019-11-16 15:55:13', '2019-11-16 15:55:13', NULL, NULL),
(294, '2XL-RED', 75, '0075-2XL-RED', 108, 105, '32.0000', '32.0000', '106.2500', '66.0000', '66.0000', '2019-11-16 15:55:13', '2019-11-16 15:55:13', NULL, NULL),
(295, 'M-BLU', 75, '0075-M-BLU', 109, 76, '32.0000', '32.0000', '106.2500', '66.0000', '66.0000', '2019-11-16 15:55:13', '2019-11-16 15:55:13', NULL, NULL),
(296, 'L-BLU', 75, '0075-L-BLU', 109, 77, '32.0000', '32.0000', '106.2500', '66.0000', '66.0000', '2019-11-16 15:55:13', '2019-11-16 15:55:13', NULL, NULL),
(297, 'XL-BLU', 75, '0075-XL-BLU', 109, 78, '32.0000', '32.0000', '106.2500', '66.0000', '66.0000', '2019-11-16 15:55:13', '2019-11-16 15:55:13', NULL, NULL),
(298, '2XL-BLU', 75, '0075-2XL-BLU', 109, 113, '32.0000', '32.0000', '106.2500', '66.0000', '66.0000', '2019-11-16 15:55:13', '2019-11-16 15:55:13', NULL, NULL),
(299, 'M-PIN', 76, '0076-M-PIN', 110, 80, '28.0000', '28.0000', '107.1400', '58.0000', '58.0000', '2019-11-16 16:05:44', '2019-11-16 16:10:23', NULL, NULL),
(300, 'L-PIN', 76, '0076-L-PIN', 110, 81, '28.0000', '28.0000', '107.1400', '58.0000', '58.0000', '2019-11-16 16:05:44', '2019-11-16 16:10:23', NULL, NULL),
(301, 'XL-PIN', 76, '0076-XL-PIN', 110, 82, '28.0000', '28.0000', '107.1400', '58.0000', '58.0000', '2019-11-16 16:05:44', '2019-11-16 16:10:23', NULL, NULL),
(302, '2XL-PIN', 76, '0076-2XL-PIN', 110, 88, '28.0000', '28.0000', '107.1400', '58.0000', '58.0000', '2019-11-16 16:05:44', '2019-11-16 16:10:23', NULL, NULL),
(303, 'M-BLA', 76, '0076-M-BLA', 111, 64, '28.0000', '28.0000', '107.1400', '58.0000', '58.0000', '2019-11-16 16:05:44', '2019-11-16 16:10:23', NULL, NULL),
(304, 'L-BLA', 76, '0076-L-BLA', 111, 65, '28.0000', '28.0000', '107.1400', '58.0000', '58.0000', '2019-11-16 16:05:44', '2019-11-16 16:10:23', NULL, NULL),
(305, 'XL-BLA', 76, '0076-XL-BLA', 111, 66, '28.0000', '28.0000', '107.1400', '58.0000', '58.0000', '2019-11-16 16:05:44', '2019-11-16 16:10:23', NULL, NULL),
(306, '2XL-BLA', 76, '0076-2XL-BLA', 111, 87, '28.0000', '28.0000', '107.1400', '58.0000', '58.0000', '2019-11-16 16:05:44', '2019-11-16 16:10:23', NULL, NULL),
(307, 'M-BLU', 76, '0076-M-BLU', 112, 76, '28.0000', '28.0000', '107.1400', '58.0000', '58.0000', '2019-11-16 16:05:44', '2019-11-16 16:10:23', NULL, NULL),
(308, 'L-BLU', 76, '0076-L-BLU', 112, 77, '28.0000', '28.0000', '107.1400', '58.0000', '58.0000', '2019-11-16 16:05:44', '2019-11-16 16:10:23', NULL, NULL),
(309, 'XL-BLU', 76, '0076-XL-BLU', 112, 78, '28.0000', '28.0000', '107.1400', '58.0000', '58.0000', '2019-11-16 16:05:44', '2019-11-16 16:10:23', NULL, NULL),
(310, '2XL-BLU', 76, '0076-2XL-BLU', 112, 113, '28.0000', '28.0000', '107.1400', '58.0000', '58.0000', '2019-11-16 16:05:44', '2019-11-16 16:10:23', NULL, NULL),
(311, 'S-CRM', 77, '0077-S-CRM', 113, 114, '25.0000', '25.0000', '140.0000', '60.0000', '60.0000', '2019-11-20 10:36:56', '2019-11-20 10:36:56', NULL, NULL),
(312, 'M-CRM', 77, '0077-M-CRM', 113, 115, '25.0000', '25.0000', '140.0000', '60.0000', '60.0000', '2019-11-20 10:36:56', '2019-11-20 10:36:56', NULL, NULL),
(313, 'L-CRM', 77, '0077-L-CRM', 113, 116, '25.0000', '25.0000', '140.0000', '60.0000', '60.0000', '2019-11-20 10:36:56', '2019-11-20 10:36:56', NULL, NULL),
(314, 'XL-CRM', 77, '0077-XL-CRM', 113, 117, '25.0000', '25.0000', '140.0000', '60.0000', '60.0000', '2019-11-20 10:36:56', '2019-11-20 10:36:56', NULL, NULL),
(315, 'S-BLA', 77, '0077-S-BLA', 114, 63, '25.0000', '25.0000', '140.0000', '60.0000', '60.0000', '2019-11-20 10:36:56', '2019-11-20 10:36:56', NULL, NULL),
(316, 'M-BLA', 77, '0077-M-BLA', 114, 64, '25.0000', '25.0000', '140.0000', '60.0000', '60.0000', '2019-11-20 10:36:56', '2019-11-20 10:36:56', NULL, NULL),
(317, 'L-BLA', 77, '0077-L-BLA', 114, 65, '25.0000', '25.0000', '140.0000', '60.0000', '60.0000', '2019-11-20 10:36:56', '2019-11-20 10:36:56', NULL, NULL),
(318, 'XL-BLA', 77, '0077-XL-BLA', 114, 66, '25.0000', '25.0000', '140.0000', '60.0000', '60.0000', '2019-11-20 10:36:56', '2019-11-20 10:36:56', NULL, NULL),
(319, 'S-CRM', 78, '0078-S-CRM', 115, 114, '15.0000', '15.0000', '126.6700', '34.0000', '34.0000', '2019-11-20 10:43:41', '2019-11-20 10:43:41', NULL, NULL),
(320, 'M-CRM', 78, '0078-M-CRM', 115, 115, '15.0000', '15.0000', '126.6700', '34.0000', '34.0000', '2019-11-20 10:43:41', '2019-11-20 10:43:41', NULL, NULL),
(321, 'L-CRM', 78, '0078-M-CRM', 115, 116, '15.0000', '15.0000', '126.6700', '34.0000', '34.0000', '2019-11-20 10:43:41', '2019-11-20 10:43:41', NULL, NULL),
(322, 'S-BLA', 78, '0078-S-BLA', 116, 63, '15.0000', '15.0000', '126.6700', '34.0000', '34.0000', '2019-11-20 10:43:41', '2019-11-20 10:43:41', NULL, NULL),
(323, 'M-BLA', 78, '0078-M-BLA', 116, 64, '15.0000', '15.0000', '126.6700', '34.0000', '34.0000', '2019-11-20 10:43:41', '2019-11-20 10:43:41', NULL, NULL),
(324, 'L-BLA', 78, '0078-L-BLA', 116, 65, '15.0000', '15.0000', '126.6700', '34.0000', '34.0000', '2019-11-20 10:43:41', '2019-11-20 10:43:41', NULL, NULL),
(325, 'S-CRM', 79, '0079-S-CRM', 117, 114, '13.0000', '13.0000', '130.7700', '30.0000', '30.0000', '2019-11-20 10:50:09', '2019-11-20 10:50:09', NULL, NULL),
(326, 'M-CRM', 79, '0079-M-CRM', 117, 115, '13.0000', '13.0000', '130.7700', '30.0000', '30.0000', '2019-11-20 10:50:09', '2019-11-20 10:50:09', NULL, NULL),
(327, 'S-BLA', 79, '0079-S-BLA', 118, 63, '13.0000', '13.0000', '130.7700', '30.0000', '30.0000', '2019-11-20 10:50:09', '2019-11-20 10:50:09', NULL, NULL),
(328, 'M-BLA', 79, '0079-M-BLA', 118, 64, '13.0000', '13.0000', '130.7700', '30.0000', '30.0000', '2019-11-20 10:50:09', '2019-11-20 10:50:09', NULL, NULL),
(329, 'S-CRM', 80, '0080-S-CRM', 119, 114, '16.0000', '16.0000', '150.0000', '40.0000', '40.0000', '2019-11-20 10:52:16', '2019-11-20 10:52:16', NULL, NULL),
(330, 'M-CRM', 80, '0080-M-CRM', 119, 115, '16.0000', '16.0000', '150.0000', '40.0000', '40.0000', '2019-11-20 10:52:16', '2019-11-20 10:52:16', NULL, NULL),
(331, 'L-CRM', 80, '0080-L-CRM', 119, 116, '16.0000', '16.0000', '150.0000', '40.0000', '40.0000', '2019-11-20 10:52:16', '2019-11-20 10:52:16', NULL, NULL),
(332, 'DUMMY', 81, '0081', 120, NULL, '12.0000', '12.0000', '133.3300', '28.0000', '28.0000', '2019-11-20 10:54:19', '2019-11-20 10:54:19', NULL, '[]'),
(333, 'Snow Corn', 82, '0082-SNC', 121, 119, '11.0000', '11.0000', '100.0000', '22.0000', '22.0000', '2019-11-20 10:58:10', '2019-11-20 10:58:10', NULL, NULL),
(334, 'Pink', 82, '0082-PIN', 121, 120, '11.0000', '11.0000', '100.0000', '22.0000', '22.0000', '2019-11-20 10:58:10', '2019-11-20 10:58:10', NULL, NULL),
(335, 'DUMMY', 83, '0083', 122, NULL, '28.0000', '28.0000', '107.1400', '58.0000', '58.0000', '2019-11-20 10:59:50', '2019-11-20 11:00:24', NULL, '[]'),
(336, 'S-BLA', 84, '0084-S-BLA', 123, 63, '29.0000', '29.0000', '100.0000', '58.0000', '58.0000', '2019-11-20 11:02:37', '2019-11-20 11:02:37', NULL, NULL),
(337, 'M-BLA', 84, '0084-M-BLA', 123, 64, '29.0000', '29.0000', '100.0000', '58.0000', '58.0000', '2019-11-20 11:02:37', '2019-11-20 11:02:37', NULL, NULL),
(338, 'S-YEL', 85, '0085-S-YEL', 124, 71, '16.0000', '16.0000', '112.5000', '34.0000', '34.0000', '2019-11-21 02:12:55', '2019-11-21 02:12:55', NULL, NULL),
(339, 'M-YEL', 85, '0085-M-YEL', 124, 72, '16.0000', '16.0000', '112.5000', '34.0000', '34.0000', '2019-11-21 02:12:55', '2019-11-21 02:12:55', NULL, NULL),
(340, 'S-PIN', 85, '0085-S-PIN', 125, 79, '16.0000', '16.0000', '112.5000', '34.0000', '34.0000', '2019-11-21 02:12:55', '2019-11-21 02:12:55', NULL, NULL),
(341, 'M-PIN', 85, '0085-M-PIN', 125, 80, '16.0000', '16.0000', '112.5000', '34.0000', '34.0000', '2019-11-21 02:12:55', '2019-11-21 02:12:55', NULL, NULL);
INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(342, 'S', 86, '0086-S', 126, 91, '17.0000', '17.0000', '111.7600', '36.0000', '36.0000', '2019-11-21 02:14:14', '2019-11-21 02:14:14', NULL, NULL),
(343, 'M', 86, '0086-M', 126, 92, '17.0000', '17.0000', '111.7600', '36.0000', '36.0000', '2019-11-21 02:14:14', '2019-11-21 02:14:14', NULL, NULL),
(344, 'S', 87, '0087-S', 127, 91, '12.0000', '12.0000', '100.0000', '24.0000', '24.0000', '2019-11-21 02:20:30', '2019-11-21 02:20:30', NULL, NULL),
(345, 'M', 87, '0087-M', 127, 92, '12.0000', '12.0000', '100.0000', '24.0000', '24.0000', '2019-11-21 02:20:30', '2019-11-21 02:20:30', NULL, NULL),
(346, 'L', 87, '0087-L', 127, 93, '12.0000', '12.0000', '100.0000', '24.0000', '24.0000', '2019-11-21 02:20:30', '2019-11-21 02:20:30', NULL, NULL),
(347, 'M-ORA', 88, '0088-M-ORA', 128, 98, '14.0000', '14.0000', '114.2900', '30.0000', '30.0000', '2019-11-21 02:23:34', '2019-11-21 02:26:55', NULL, NULL),
(348, 'S-BLA', 88, '0088-S-BLA', 129, 63, '14.0000', '14.0000', '114.2900', '30.0000', '30.0000', '2019-11-21 02:23:34', '2019-11-21 02:26:55', NULL, NULL),
(349, 'M-BLA', 88, '0088-M-BLA', 129, 64, '14.0000', '14.0000', '114.2900', '30.0000', '30.0000', '2019-11-21 02:23:34', '2019-11-21 02:26:55', NULL, NULL),
(350, 'S-GRE', 88, '0088-S-GRE', 130, 121, '14.0000', '14.0000', '114.2900', '30.0000', '30.0000', '2019-11-21 02:26:55', '2019-11-21 02:26:55', NULL, NULL),
(351, 'M-GRE', 88, '0088-M-GRE', 130, 122, '14.0000', '14.0000', '114.2900', '30.0000', '30.0000', '2019-11-21 02:26:55', '2019-11-21 02:26:55', NULL, NULL),
(352, 'Pink', 89, '0089-Pink', 131, 120, '9.0000', '9.0000', '144.4400', '22.0000', '22.0000', '2019-11-21 02:50:07', '2019-11-21 04:44:32', NULL, NULL),
(353, 'Yellow', 89, '0089-Yellow', 131, 126, '9.0000', '9.0000', '144.4400', '22.0000', '22.0000', '2019-11-21 02:50:07', '2019-11-21 04:44:32', NULL, NULL),
(354, 'S', 90, '0090-S', 132, 91, '15.0000', '15.0000', '126.6700', '34.0000', '34.0000', '2019-11-21 02:51:46', '2019-11-21 02:51:46', NULL, NULL),
(355, 'White', 91, '0091-White', 133, 111, '9.0000', '9.0000', '100.0000', '18.0000', '18.0000', '2019-11-21 04:29:04', '2019-11-21 04:29:04', NULL, NULL),
(356, 'Snow Corn', 91, '0091-Snow Corn', 133, 119, '9.0000', '9.0000', '100.0000', '18.0000', '18.0000', '2019-11-21 04:29:04', '2019-11-21 04:29:04', NULL, NULL),
(357, 'Black', 91, '0091-Black', 133, 127, '9.0000', '9.0000', '100.0000', '18.0000', '18.0000', '2019-11-21 04:29:04', '2019-11-21 04:29:04', NULL, NULL),
(358, 'Yellow', 92, '0092-Yellow', 134, 126, '5.0000', '5.0000', '100.0000', '10.0000', '10.0000', '2019-11-21 04:36:07', '2019-11-21 04:36:07', NULL, NULL),
(359, 'Red', 92, '0092-Red', 134, 128, '5.0000', '5.0000', '100.0000', '10.0000', '10.0000', '2019-11-21 04:36:07', '2019-11-21 04:36:07', NULL, NULL),
(360, 'Green', 92, '0092-Green', 134, 129, '5.0000', '5.0000', '100.0000', '10.0000', '10.0000', '2019-11-21 04:36:07', '2019-11-21 04:36:07', NULL, NULL),
(361, 'Cornsilk', 92, '0092-Cornsilk', 134, 130, '5.0000', '5.0000', '100.0000', '10.0000', '10.0000', '2019-11-21 04:36:07', '2019-11-21 04:36:07', NULL, NULL),
(362, 'White', 93, '0093-White', 135, 111, '8.0000', '8.0000', '125.0000', '18.0000', '18.0000', '2019-11-21 04:40:10', '2019-11-21 04:40:10', NULL, NULL),
(363, 'Pink', 93, '0093-Pink', 135, 120, '9.0000', '9.0000', '100.0000', '18.0000', '18.0000', '2019-11-21 04:40:10', '2019-11-21 04:40:10', NULL, NULL),
(364, 'Yellow', 93, '0093-Yellow', 135, 126, '9.0000', '9.0000', '100.0000', '18.0000', '18.0000', '2019-11-21 04:40:10', '2019-11-21 04:40:10', NULL, NULL),
(365, 'Black', 93, '0093-Black', 135, 127, '9.0000', '9.0000', '100.0000', '18.0000', '18.0000', '2019-11-21 04:40:10', '2019-11-21 04:40:10', NULL, NULL),
(366, 'DarkRed', 93, '0093-DarkRed', 135, 131, '9.0000', '9.0000', '100.0000', '18.0000', '18.0000', '2019-11-21 04:40:10', '2019-11-21 04:40:10', NULL, NULL),
(367, 'S', 94, '0094-S', 136, 91, '36.0000', '36.0000', '105.5600', '74.0000', '74.0000', '2019-11-21 04:57:55', '2019-11-21 04:57:55', NULL, NULL),
(368, 'M', 94, '0094-M', 136, 92, '36.0000', '36.0000', '105.5600', '74.0000', '74.0000', '2019-11-21 04:57:55', '2019-11-21 04:57:55', NULL, NULL),
(369, 'S', 95, '0095', 137, 91, '36.0000', '36.0000', '105.5600', '74.0000', '74.0000', '2019-11-21 05:00:30', '2019-11-21 05:00:30', NULL, NULL),
(370, 'M', 95, '0095', 137, 92, '36.0000', '36.0000', '105.5600', '74.0000', '74.0000', '2019-11-21 05:00:30', '2019-11-21 05:00:30', NULL, NULL),
(371, 'S-CRM', 96, '0096-S-CRM', 138, 114, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 10:57:05', '2019-11-23 10:57:05', NULL, NULL),
(372, 'S-BLA', 96, '0096-S-BLA', 139, 63, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 10:57:05', '2019-11-23 10:57:05', NULL, NULL),
(373, 'M-BLA', 96, '0096-M-BLA', 139, 64, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 10:57:05', '2019-11-23 10:57:05', NULL, NULL),
(374, 'L-BLA', 96, '0096-L-BLA', 139, 65, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 10:57:05', '2019-11-23 10:57:05', NULL, NULL),
(375, 'DUMMY', 97, '0097', 140, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 10:58:59', '2019-11-23 10:58:59', NULL, '[]'),
(376, 'DUMMY', 98, '0098', 141, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 10:59:48', '2019-11-23 10:59:48', NULL, '[]'),
(377, 'DUMMY', 99, '0099', 142, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:00:30', '2019-11-23 11:00:30', NULL, '[]'),
(378, 'M', 100, '0100-M', 143, 92, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:02:01', '2019-11-23 11:02:01', NULL, NULL),
(379, 'L', 100, '0100-L', 143, 93, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:02:01', '2019-11-23 11:02:01', NULL, NULL),
(380, 'DUMMY', 101, '0101', 144, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:03:02', '2019-11-23 11:03:02', NULL, '[]'),
(381, 'S', 102, '0102-S', 145, 91, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:04:57', '2019-11-23 11:04:57', NULL, NULL),
(382, 'M', 102, '0102-M', 145, 92, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:04:57', '2019-11-23 11:04:57', NULL, NULL),
(383, 'L', 102, '0102-L', 145, 93, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:04:57', '2019-11-23 11:04:57', NULL, NULL),
(384, 'S', 103, '0103-S', 146, 91, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:06:32', '2019-11-23 11:06:32', NULL, NULL),
(385, 'M', 103, '0103-M', 146, 92, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:06:32', '2019-11-23 11:06:32', NULL, NULL),
(386, 'L', 103, '0103-L', 146, 93, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:06:32', '2019-11-23 11:06:32', NULL, NULL),
(387, 'S', 104, '0104-S', 147, 91, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:08:49', '2019-11-23 11:08:49', NULL, NULL),
(388, 'M', 104, '0104-M', 147, 92, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:08:49', '2019-11-23 11:08:49', NULL, NULL),
(389, 'L', 104, '0104-L', 147, 93, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:08:49', '2019-11-23 11:08:49', NULL, NULL),
(390, 'XL', 104, '0104-XL', 147, 94, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:08:49', '2019-11-23 11:08:49', NULL, NULL),
(391, 'DUMMY', 105, '0105', 148, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:29:46', '2019-11-23 11:29:46', NULL, '[]'),
(392, 'S', 106, '0106-S', 149, 91, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:31:17', '2019-11-23 11:31:17', NULL, NULL),
(393, 'M', 106, '0106-M', 149, 92, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:31:17', '2019-11-23 11:31:17', NULL, NULL),
(394, 'L', 106, '0106-L', 149, 93, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:31:17', '2019-11-23 11:31:17', NULL, NULL),
(395, 'XL', 106, '0106-XL', 149, 94, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:31:17', '2019-11-23 11:31:17', NULL, NULL),
(396, 'S', 107, '0107-S', 150, 91, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:32:47', '2019-11-23 11:32:47', NULL, NULL),
(397, 'M', 107, '0107-M', 150, 92, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:32:47', '2019-11-23 11:32:47', NULL, NULL),
(398, 'L', 107, '0107-L', 150, 93, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:32:47', '2019-11-23 11:32:47', NULL, NULL),
(399, 'S', 108, '0108-S', 151, 91, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:34:18', '2019-11-23 11:34:18', NULL, NULL),
(400, 'M', 108, '0108-M', 151, 92, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:34:18', '2019-11-23 11:34:18', NULL, NULL),
(401, 'DUMMY', 109, '0109', 152, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:35:05', '2019-11-23 11:35:05', NULL, '[]'),
(402, 'DUMMY', 110, '0110', 153, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:35:49', '2019-11-23 11:35:49', NULL, '[]'),
(403, 'DUMMY', 111, '0111', 154, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:36:20', '2019-11-23 11:36:20', NULL, '[]'),
(404, 'DUMMY', 112, '0112', 155, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:36:48', '2019-11-23 11:36:48', NULL, '[]'),
(405, 'DUMMY', 113, '0113', 156, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:37:36', '2019-11-23 11:37:36', NULL, '[]'),
(406, 'DUMMY', 114, '0114', 157, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:38:10', '2019-11-23 11:38:10', NULL, '[]'),
(407, 'DUMMY', 115, '0115', 158, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:38:52', '2019-11-23 11:38:52', NULL, '[]'),
(408, 'DUMMY', 116, '0116', 159, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 11:39:12', '2019-11-23 11:39:12', NULL, '[]'),
(409, 'DUMMY', 117, '0117', 160, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 12:08:54', '2019-11-23 12:08:54', NULL, '[]'),
(410, 'DUMMY', 118, '0118', 161, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 12:09:21', '2019-11-23 12:09:21', NULL, '[]'),
(411, 'DUMMY', 119, '0119', 162, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 12:09:43', '2019-11-23 12:09:43', NULL, '[]'),
(412, 'DUMMY', 120, '0120', 163, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 12:10:20', '2019-11-23 12:10:20', NULL, '[]'),
(413, 'DUMMY', 121, '0121', 164, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 12:10:44', '2019-11-23 12:10:44', NULL, '[]'),
(414, 'DUMMY', 122, '0122', 165, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 12:11:04', '2019-11-23 12:11:04', NULL, '[]'),
(415, 'DUMMY', 123, '0123', 166, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 12:11:23', '2019-11-23 12:11:23', NULL, '[]'),
(416, 'DUMMY', 124, '0124', 167, NULL, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 12:11:54', '2019-11-23 12:11:54', NULL, '[]'),
(417, 'S', 125, '0125-S', 168, 91, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 12:12:53', '2019-11-23 12:12:53', NULL, NULL),
(418, 'M', 125, '0125-M', 168, 92, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 12:12:53', '2019-11-23 12:12:53', NULL, NULL),
(419, 'White', 126, '0126-White', 169, 111, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 12:14:55', '2019-11-23 12:14:55', NULL, NULL),
(420, 'Pink', 126, '0126-Pink', 169, 120, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 12:14:55', '2019-11-23 12:14:55', NULL, NULL),
(421, 'Black', 126, '0126-Black', 169, 127, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 12:14:55', '2019-11-23 12:14:55', NULL, NULL),
(422, 'S', 127, '0127-S', 170, 91, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 12:15:58', '2019-11-23 12:15:58', NULL, NULL),
(423, 'M', 127, '0127-M', 170, 92, '40.0000', '40.0000', '95.0000', '78.0000', '78.0000', '2019-11-23 12:15:58', '2019-11-23 12:15:58', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

DROP TABLE IF EXISTS `variation_group_prices`;
CREATE TABLE IF NOT EXISTS `variation_group_prices` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `price_group_id` int(10) UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

DROP TABLE IF EXISTS `variation_location_details`;
CREATE TABLE IF NOT EXISTS `variation_location_details` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `qty_available` decimal(20,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_location_details_location_id_foreign` (`location_id`),
  KEY `variation_location_details_product_id_index` (`product_id`),
  KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  KEY `variation_location_details_variation_id_index` (`variation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, '1.0000', '2019-10-13 08:31:20', '2019-10-13 08:31:20'),
(2, 2, 2, 2, 1, '1.0000', '2019-10-13 08:32:50', '2019-10-13 08:32:50'),
(3, 3, 3, 3, 1, '2.0000', '2019-10-13 08:36:29', '2019-10-13 08:36:29'),
(4, 3, 3, 4, 1, '2.0000', '2019-10-13 08:36:29', '2019-10-13 08:36:29'),
(5, 3, 3, 5, 1, '2.0000', '2019-10-13 08:36:29', '2019-10-13 08:36:29'),
(6, 4, 4, 6, 1, '4.0000', '2019-10-13 08:40:25', '2019-10-13 08:40:25'),
(7, 4, 4, 7, 1, '2.0000', '2019-10-13 08:40:25', '2019-10-13 08:40:25'),
(8, 4, 4, 8, 1, '2.0000', '2019-10-13 08:40:25', '2019-10-13 08:40:25'),
(9, 5, 5, 9, 1, '0.0000', '2019-10-13 08:47:48', '2019-10-13 10:08:51'),
(10, 5, 5, 10, 1, '0.0000', '2019-10-13 08:47:48', '2019-10-13 10:08:51'),
(11, 5, 5, 11, 1, '0.0000', '2019-10-13 08:47:48', '2019-10-13 10:08:51'),
(12, 5, 5, 12, 1, '0.0000', '2019-10-13 08:47:48', '2019-10-13 10:08:51'),
(13, 5, 5, 13, 1, '0.0000', '2019-10-13 08:47:48', '2019-10-13 10:08:51'),
(14, 5, 5, 14, 1, '0.0000', '2019-10-13 08:47:48', '2019-10-13 10:08:51'),
(15, 6, 6, 15, 1, '1.0000', '2019-10-13 08:55:02', '2019-10-13 08:55:02'),
(16, 6, 6, 16, 1, '1.0000', '2019-10-13 08:55:02', '2019-10-13 08:55:02'),
(17, 6, 6, 17, 1, '1.0000', '2019-10-13 08:55:02', '2019-10-13 08:55:02'),
(18, 6, 6, 18, 1, '1.0000', '2019-10-13 08:55:02', '2019-10-13 08:55:02'),
(19, 6, 6, 19, 1, '1.0000', '2019-10-13 08:55:02', '2019-10-13 08:55:02'),
(20, 6, 6, 20, 1, '1.0000', '2019-10-13 08:55:02', '2019-10-13 08:55:02'),
(21, 6, 6, 21, 1, '1.0000', '2019-10-13 08:55:02', '2019-10-13 08:55:02'),
(22, 7, 7, 22, 1, '1.0000', '2019-10-13 09:08:42', '2019-10-13 09:08:42'),
(23, 7, 7, 23, 1, '1.0000', '2019-10-13 09:08:42', '2019-10-13 09:08:42'),
(24, 7, 7, 24, 1, '1.0000', '2019-10-13 09:08:42', '2019-10-13 09:08:42'),
(25, 7, 7, 25, 1, '1.0000', '2019-10-13 09:08:42', '2019-10-13 09:08:42'),
(26, 8, 8, 26, 1, '1.0000', '2019-10-13 09:13:33', '2019-10-13 09:13:33'),
(27, 8, 8, 27, 1, '1.0000', '2019-10-13 09:13:33', '2019-10-13 09:13:33'),
(28, 8, 8, 28, 1, '1.0000', '2019-10-13 09:13:33', '2019-10-13 09:13:33'),
(29, 8, 8, 29, 1, '1.0000', '2019-10-13 09:13:33', '2019-10-13 09:13:33'),
(30, 8, 8, 30, 1, '1.0000', '2019-10-13 09:13:33', '2019-10-13 09:13:33'),
(31, 8, 8, 31, 1, '1.0000', '2019-10-13 09:13:33', '2019-10-13 09:13:33'),
(32, 8, 8, 32, 1, '1.0000', '2019-10-13 09:13:33', '2019-10-13 09:13:33'),
(33, 8, 8, 33, 1, '1.0000', '2019-10-13 09:13:33', '2019-10-13 09:13:33'),
(34, 5, 5, 34, 1, '0.0000', '2019-10-13 09:15:43', '2019-10-13 10:08:51'),
(35, 5, 5, 35, 1, '0.0000', '2019-10-13 09:15:43', '2019-10-13 10:08:51'),
(36, 9, 9, 36, 1, '1.0000', '2019-10-13 09:19:04', '2019-10-13 09:19:04'),
(37, 9, 9, 37, 1, '1.0000', '2019-10-13 09:19:04', '2019-10-13 09:19:04'),
(38, 9, 9, 38, 1, '1.0000', '2019-10-13 09:19:04', '2019-10-13 09:19:04'),
(39, 9, 9, 39, 1, '1.0000', '2019-10-13 09:19:04', '2019-10-13 09:19:04'),
(40, 9, 9, 40, 1, '1.0000', '2019-10-13 09:19:04', '2019-10-13 09:19:04'),
(41, 9, 9, 41, 1, '1.0000', '2019-10-13 09:19:04', '2019-10-13 09:19:04'),
(42, 9, 9, 42, 1, '1.0000', '2019-10-13 09:19:04', '2019-10-13 09:19:04'),
(43, 9, 9, 43, 1, '1.0000', '2019-10-13 09:19:04', '2019-10-13 09:19:04'),
(44, 10, 10, 44, 1, '1.0000', '2019-10-13 09:23:24', '2019-10-13 09:23:24'),
(54, 11, 15, 58, 1, '1.0000', '2019-10-13 09:49:28', '2019-10-13 09:49:28'),
(55, 11, 15, 59, 1, '1.0000', '2019-10-13 09:49:28', '2019-10-13 09:49:28'),
(56, 11, 15, 60, 1, '1.0000', '2019-10-13 09:49:28', '2019-10-13 09:49:28'),
(57, 12, 16, 61, 1, '1.0000', '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(58, 12, 16, 62, 1, '1.0000', '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(59, 12, 16, 63, 1, '1.0000', '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(60, 12, 17, 64, 1, '1.0000', '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(61, 12, 17, 65, 1, '1.0000', '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(62, 12, 17, 66, 1, '1.0000', '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(63, 12, 18, 67, 1, '1.0000', '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(64, 12, 18, 68, 1, '1.0000', '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(65, 12, 18, 69, 1, '1.0000', '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(66, 12, 18, 70, 1, '1.0000', '2019-10-13 09:58:39', '2019-10-13 09:58:39'),
(67, 13, 19, 71, 1, '1.0000', '2019-10-13 10:00:17', '2019-10-13 10:00:17'),
(68, 13, 19, 72, 1, '1.0000', '2019-10-13 10:00:17', '2019-10-13 10:00:17'),
(69, 13, 19, 73, 1, '1.0000', '2019-10-13 10:00:17', '2019-10-13 10:00:17'),
(70, 13, 19, 74, 1, '1.0000', '2019-10-13 10:00:17', '2019-10-13 10:00:17'),
(71, 14, 20, 75, 1, '1.0000', '2019-10-13 10:06:23', '2019-10-13 10:06:23'),
(72, 14, 20, 76, 1, '1.0000', '2019-10-13 10:06:23', '2019-10-13 10:06:23'),
(73, 14, 20, 77, 1, '1.0000', '2019-10-13 10:06:23', '2019-10-13 10:06:23'),
(74, 5, 21, 78, 1, '1.0000', '2019-10-13 10:08:51', '2019-10-13 10:08:51'),
(75, 5, 21, 79, 1, '1.0000', '2019-10-13 10:08:51', '2019-10-13 10:08:51'),
(76, 5, 21, 80, 1, '1.0000', '2019-10-13 10:08:51', '2019-10-13 10:08:51'),
(77, 5, 21, 81, 1, '1.0000', '2019-10-13 10:08:51', '2019-10-13 10:08:51'),
(78, 5, 22, 82, 1, '1.0000', '2019-10-13 10:08:51', '2019-10-13 10:08:51'),
(79, 5, 22, 83, 1, '1.0000', '2019-10-13 10:08:51', '2019-10-13 10:08:51'),
(80, 5, 22, 84, 1, '1.0000', '2019-10-13 10:08:51', '2019-10-13 10:08:51'),
(81, 5, 22, 85, 1, '1.0000', '2019-10-13 10:08:51', '2019-10-13 10:08:51'),
(82, 15, 23, 86, 1, '1.0000', '2019-10-13 10:11:14', '2019-10-13 10:11:14'),
(83, 15, 23, 87, 1, '1.0000', '2019-10-13 10:11:14', '2019-10-13 10:11:14'),
(84, 15, 23, 88, 1, '1.0000', '2019-10-13 10:11:14', '2019-10-13 10:11:14'),
(85, 15, 23, 89, 1, '1.0000', '2019-10-13 10:11:14', '2019-10-13 10:11:14'),
(86, 16, 24, 90, 1, '1.0000', '2019-10-13 10:13:47', '2019-10-13 10:13:47'),
(87, 16, 24, 91, 1, '1.0000', '2019-10-13 10:13:47', '2019-10-13 10:13:47'),
(88, 16, 24, 92, 1, '1.0000', '2019-10-13 10:13:47', '2019-10-13 10:13:47'),
(89, 16, 24, 93, 1, '1.0000', '2019-10-13 10:13:47', '2019-10-13 10:13:47'),
(90, 17, 25, 94, 1, '1.0000', '2019-10-13 10:19:59', '2019-10-13 10:19:59'),
(91, 17, 25, 95, 1, '1.0000', '2019-10-13 10:19:59', '2019-10-13 10:19:59'),
(92, 17, 25, 96, 1, '1.0000', '2019-10-13 10:19:59', '2019-10-13 10:19:59'),
(93, 17, 25, 97, 1, '1.0000', '2019-10-13 10:19:59', '2019-10-13 10:19:59'),
(94, 17, 26, 98, 1, '1.0000', '2019-10-13 10:19:59', '2019-10-13 10:19:59'),
(95, 17, 26, 99, 1, '1.0000', '2019-10-13 10:19:59', '2019-10-13 10:19:59'),
(96, 17, 26, 100, 1, '1.0000', '2019-10-13 10:19:59', '2019-10-13 10:19:59'),
(97, 18, 27, 101, 1, '1.0000', '2019-10-13 10:28:54', '2019-10-13 10:28:54'),
(98, 18, 27, 102, 1, '1.0000', '2019-10-13 10:28:54', '2019-10-13 10:28:54'),
(99, 18, 27, 103, 1, '1.0000', '2019-10-13 10:28:54', '2019-10-13 10:28:54'),
(100, 18, 28, 104, 1, '1.0000', '2019-10-13 10:28:54', '2019-10-13 10:28:54'),
(101, 18, 28, 105, 1, '1.0000', '2019-10-13 10:28:54', '2019-10-13 10:28:54'),
(102, 18, 28, 106, 1, '1.0000', '2019-10-13 10:28:54', '2019-10-13 10:28:54'),
(103, 18, 28, 107, 1, '1.0000', '2019-10-13 10:28:54', '2019-10-13 10:28:54'),
(104, 19, 29, 108, 1, '1.0000', '2019-10-13 10:30:08', '2019-10-13 10:30:08'),
(105, 19, 29, 109, 1, '1.0000', '2019-10-13 10:30:08', '2019-10-13 10:30:08'),
(106, 19, 29, 110, 1, '1.0000', '2019-10-13 10:30:08', '2019-10-13 10:30:08'),
(107, 19, 29, 111, 1, '1.0000', '2019-10-13 10:30:08', '2019-10-13 10:30:08'),
(108, 20, 30, 112, 1, '1.0000', '2019-10-13 10:32:16', '2019-10-13 10:32:16'),
(109, 20, 30, 113, 1, '1.0000', '2019-10-13 10:32:16', '2019-10-13 10:32:16'),
(110, 20, 30, 114, 1, '1.0000', '2019-10-13 10:32:16', '2019-10-13 10:32:16'),
(111, 20, 30, 115, 1, '1.0000', '2019-10-13 10:32:16', '2019-10-13 10:32:16'),
(112, 21, 31, 116, 1, '1.0000', '2019-10-13 10:33:39', '2019-10-13 10:33:39'),
(113, 21, 31, 117, 1, '1.0000', '2019-10-13 10:33:39', '2019-10-13 10:33:39'),
(114, 21, 31, 118, 1, '1.0000', '2019-10-13 10:33:39', '2019-10-13 10:33:39'),
(115, 21, 31, 119, 1, '1.0000', '2019-10-13 10:33:39', '2019-10-13 10:33:39'),
(116, 22, 32, 120, 1, '1.0000', '2019-10-13 10:37:23', '2019-10-13 10:37:23'),
(117, 22, 32, 121, 1, '1.0000', '2019-10-13 10:37:23', '2019-10-13 10:37:23'),
(118, 22, 32, 122, 1, '1.0000', '2019-10-13 10:37:23', '2019-10-13 10:37:23'),
(119, 23, 33, 123, 1, '1.0000', '2019-10-13 10:46:40', '2019-10-13 10:46:40'),
(120, 23, 33, 124, 1, '1.0000', '2019-10-13 10:46:40', '2019-10-13 10:46:40'),
(121, 23, 33, 125, 1, '1.0000', '2019-10-13 10:46:40', '2019-10-13 10:46:40'),
(122, 23, 33, 126, 1, '1.0000', '2019-10-13 10:46:40', '2019-10-13 10:46:40'),
(123, 24, 34, 127, 1, '1.0000', '2019-10-13 10:48:53', '2019-10-13 10:48:53'),
(124, 24, 34, 128, 1, '1.0000', '2019-10-13 10:48:53', '2019-10-13 10:48:53'),
(125, 24, 34, 129, 1, '1.0000', '2019-10-13 10:48:53', '2019-10-13 10:48:53'),
(126, 25, 35, 130, 1, '1.0000', '2019-10-13 10:50:17', '2019-10-13 10:50:17'),
(127, 26, 36, 131, 1, '1.0000', '2019-10-13 10:52:33', '2019-10-13 10:52:33'),
(128, 26, 36, 132, 1, '1.0000', '2019-10-13 10:52:33', '2019-10-13 10:52:33'),
(129, 26, 36, 133, 1, '1.0000', '2019-10-13 10:52:33', '2019-10-13 10:52:33'),
(130, 26, 36, 134, 1, '1.0000', '2019-10-13 10:52:33', '2019-10-13 10:52:33'),
(131, 27, 37, 135, 1, '1.0000', '2019-10-13 10:54:01', '2019-10-13 10:54:01'),
(132, 27, 37, 136, 1, '1.0000', '2019-10-13 10:54:01', '2019-10-13 10:54:01'),
(133, 27, 37, 137, 1, '1.0000', '2019-10-13 10:54:01', '2019-10-13 10:54:01'),
(134, 28, 38, 138, 1, '1.0000', '2019-10-13 10:55:44', '2019-10-13 10:55:44'),
(135, 28, 38, 139, 1, '1.0000', '2019-10-13 10:55:44', '2019-10-13 10:55:44'),
(136, 28, 38, 140, 1, '1.0000', '2019-10-13 10:55:44', '2019-10-13 10:55:44'),
(137, 28, 38, 141, 1, '1.0000', '2019-10-13 10:55:44', '2019-10-13 10:55:44'),
(138, 29, 39, 142, 1, '1.0000', '2019-10-13 10:59:03', '2019-10-13 10:59:03'),
(139, 29, 39, 143, 1, '1.0000', '2019-10-13 10:59:03', '2019-10-13 10:59:03'),
(140, 29, 39, 144, 1, '1.0000', '2019-10-13 10:59:03', '2019-10-13 10:59:03'),
(141, 29, 39, 145, 1, '1.0000', '2019-10-13 10:59:03', '2019-10-13 10:59:03'),
(142, 30, 40, 146, 1, '1.0000', '2019-10-13 11:02:00', '2019-10-13 11:02:00'),
(143, 30, 40, 147, 1, '1.0000', '2019-10-13 11:02:00', '2019-10-13 11:02:00'),
(144, 30, 40, 148, 1, '1.0000', '2019-10-13 11:02:00', '2019-10-13 11:02:00'),
(145, 30, 40, 149, 1, '1.0000', '2019-10-13 11:02:00', '2019-10-13 11:02:00'),
(146, 30, 40, 150, 1, '1.0000', '2019-10-13 11:02:00', '2019-10-13 11:02:00'),
(147, 31, 41, 151, 1, '1.0000', '2019-10-13 11:07:13', '2019-10-13 11:07:13'),
(148, 31, 41, 152, 1, '1.0000', '2019-10-13 11:07:13', '2019-10-13 11:07:13'),
(149, 31, 41, 153, 1, '1.0000', '2019-10-13 11:07:13', '2019-10-13 11:07:13'),
(150, 31, 42, 154, 1, '1.0000', '2019-10-13 11:07:13', '2019-10-13 11:07:13'),
(151, 31, 42, 155, 1, '1.0000', '2019-10-13 11:07:13', '2019-10-13 11:07:13'),
(152, 31, 42, 156, 1, '2.0000', '2019-10-13 11:07:13', '2019-10-13 11:07:13'),
(153, 32, 43, 157, 1, '2.0000', '2019-10-13 11:09:27', '2019-10-13 11:09:27'),
(154, 32, 43, 158, 1, '2.0000', '2019-10-13 11:09:27', '2019-10-13 11:09:27'),
(155, 32, 43, 159, 1, '2.0000', '2019-10-13 11:09:27', '2019-10-13 11:09:27'),
(156, 32, 44, 160, 1, '1.0000', '2019-10-13 11:09:27', '2019-10-13 11:09:27'),
(157, 32, 44, 161, 1, '1.0000', '2019-10-13 11:09:27', '2019-10-13 11:09:27'),
(158, 32, 44, 162, 1, '1.0000', '2019-10-13 11:09:27', '2019-10-13 11:09:27'),
(159, 19, 29, 163, 1, '1.0000', '2019-10-13 11:11:17', '2019-10-13 11:11:17'),
(160, 33, 45, 164, 1, '1.0000', '2019-10-13 11:12:57', '2019-10-13 11:12:57'),
(161, 33, 45, 165, 1, '1.0000', '2019-10-13 11:12:57', '2019-10-13 11:12:57'),
(162, 33, 45, 166, 1, '1.0000', '2019-10-13 11:12:57', '2019-10-13 11:12:57'),
(163, 34, 46, 167, 1, '1.0000', '2019-10-13 11:13:46', '2019-10-13 11:13:46'),
(164, 34, 46, 168, 1, '1.0000', '2019-10-13 11:13:46', '2019-10-13 11:13:46'),
(165, 36, 48, 170, 1, '1.0000', '2019-11-11 05:23:45', '2019-11-11 05:23:45'),
(166, 36, 48, 171, 1, '1.0000', '2019-11-11 05:23:45', '2019-11-11 05:23:45'),
(167, 35, 47, 169, 1, '1.0000', '2019-11-11 05:24:09', '2019-11-11 05:24:09'),
(168, 37, 49, 172, 1, '1.0000', '2019-11-11 05:26:17', '2019-11-11 05:26:17'),
(169, 37, 49, 173, 1, '1.0000', '2019-11-11 05:26:17', '2019-11-11 05:26:17'),
(170, 38, 50, 174, 1, '1.0000', '2019-11-11 05:31:25', '2019-11-11 05:31:25'),
(171, 38, 50, 175, 1, '1.0000', '2019-11-11 05:31:25', '2019-11-11 05:31:25'),
(172, 38, 50, 176, 1, '2.0000', '2019-11-11 05:31:25', '2019-11-11 05:31:25'),
(173, 39, 51, 177, 1, '1.0000', '2019-11-11 05:33:16', '2019-11-11 05:33:16'),
(174, 39, 51, 178, 1, '1.0000', '2019-11-11 05:33:16', '2019-11-11 05:33:16'),
(175, 40, 52, 179, 1, '1.0000', '2019-11-11 05:35:23', '2019-11-11 05:35:23'),
(176, 40, 52, 180, 1, '1.0000', '2019-11-11 05:35:23', '2019-11-11 05:35:23'),
(177, 40, 52, 181, 1, '1.0000', '2019-11-11 05:35:23', '2019-11-11 05:35:23'),
(178, 40, 52, 182, 1, '1.0000', '2019-11-11 05:35:23', '2019-11-11 05:35:23'),
(179, 41, 53, 183, 1, '1.0000', '2019-11-11 06:52:46', '2019-11-11 06:52:46'),
(180, 41, 54, 184, 1, '1.0000', '2019-11-11 06:52:46', '2019-11-11 06:52:46'),
(181, 42, 55, 185, 1, '1.0000', '2019-11-11 06:59:16', '2019-11-11 06:59:16'),
(182, 42, 55, 186, 1, '1.0000', '2019-11-11 06:59:16', '2019-11-11 06:59:16'),
(183, 42, 55, 187, 1, '1.0000', '2019-11-11 06:59:16', '2019-11-11 06:59:16'),
(184, 42, 56, 188, 1, '1.0000', '2019-11-11 06:59:16', '2019-11-11 06:59:16'),
(185, 42, 56, 189, 1, '1.0000', '2019-11-11 06:59:16', '2019-11-11 06:59:16'),
(186, 42, 56, 190, 1, '1.0000', '2019-11-11 06:59:16', '2019-11-11 06:59:16'),
(187, 43, 57, 191, 1, '2.0000', '2019-11-11 07:09:55', '2019-11-11 07:09:55'),
(188, 43, 57, 192, 1, '2.0000', '2019-11-11 07:09:55', '2019-11-11 07:09:55'),
(189, 43, 57, 193, 1, '1.0000', '2019-11-11 07:09:55', '2019-11-11 07:09:55'),
(190, 43, 57, 194, 1, '2.0000', '2019-11-11 07:09:55', '2019-11-11 07:09:55'),
(191, 44, 58, 195, 1, '1.0000', '2019-11-11 07:14:10', '2019-11-11 07:14:10'),
(192, 45, 59, 196, 1, '1.0000', '2019-11-11 07:19:45', '2019-11-11 07:19:45'),
(193, 45, 59, 197, 1, '1.0000', '2019-11-11 07:19:45', '2019-11-11 07:19:45'),
(194, 45, 59, 198, 1, '1.0000', '2019-11-11 07:19:45', '2019-11-11 07:19:45'),
(195, 45, 60, 199, 1, '1.0000', '2019-11-11 07:19:45', '2019-11-11 07:19:45'),
(196, 45, 60, 200, 1, '1.0000', '2019-11-11 07:19:45', '2019-11-11 07:19:45'),
(197, 46, 61, 201, 1, '1.0000', '2019-11-11 07:23:25', '2019-11-11 07:23:25'),
(198, 46, 61, 202, 1, '1.0000', '2019-11-11 07:23:25', '2019-11-11 07:23:25'),
(199, 46, 61, 203, 1, '1.0000', '2019-11-11 07:23:25', '2019-11-11 07:23:25'),
(200, 47, 62, 204, 1, '1.0000', '2019-11-11 07:57:14', '2019-11-11 07:57:14'),
(201, 47, 62, 205, 1, '1.0000', '2019-11-11 07:57:14', '2019-11-11 07:57:14'),
(202, 48, 63, 206, 1, '1.0000', '2019-11-11 07:59:38', '2019-11-11 07:59:38'),
(203, 48, 64, 207, 1, '1.0000', '2019-11-11 08:01:00', '2019-11-11 08:01:00'),
(204, 48, 64, 208, 1, '1.0000', '2019-11-11 08:01:00', '2019-11-11 08:01:00'),
(205, 48, 64, 209, 1, '1.0000', '2019-11-11 08:01:00', '2019-11-11 08:01:00'),
(206, 49, 65, 210, 1, '1.0000', '2019-11-12 13:22:21', '2019-11-12 13:22:21'),
(207, 49, 65, 211, 1, '1.0000', '2019-11-12 13:22:21', '2019-11-12 13:22:21'),
(208, 49, 65, 212, 1, '1.0000', '2019-11-12 13:22:21', '2019-11-12 13:22:21'),
(209, 49, 65, 213, 1, '1.0000', '2019-11-12 13:22:21', '2019-11-12 13:22:21'),
(210, 49, 66, 214, 1, '1.0000', '2019-11-12 13:22:21', '2019-11-12 13:22:21'),
(211, 49, 66, 215, 1, '1.0000', '2019-11-12 13:22:21', '2019-11-12 13:22:21'),
(212, 49, 66, 216, 1, '1.0000', '2019-11-12 13:22:21', '2019-11-12 13:22:21'),
(213, 50, 67, 217, 1, '1.0000', '2019-11-12 13:28:43', '2019-11-12 13:28:43'),
(214, 50, 67, 218, 1, '1.0000', '2019-11-12 13:28:43', '2019-11-12 13:28:43'),
(215, 51, 68, 219, 1, '1.0000', '2019-11-12 13:32:36', '2019-11-12 13:32:36'),
(216, 51, 68, 220, 1, '1.0000', '2019-11-12 13:32:36', '2019-11-12 13:32:36'),
(217, 52, 69, 221, 1, '1.0000', '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(218, 52, 69, 222, 1, '1.0000', '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(219, 52, 69, 223, 1, '1.0000', '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(220, 52, 70, 224, 1, '1.0000', '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(221, 52, 70, 225, 1, '1.0000', '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(222, 52, 71, 226, 1, '1.0000', '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(223, 52, 71, 227, 1, '1.0000', '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(224, 52, 71, 228, 1, '1.0000', '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(225, 52, 72, 229, 1, '1.0000', '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(226, 52, 72, 230, 1, '1.0000', '2019-11-12 13:40:11', '2019-11-12 13:40:11'),
(227, 53, 73, 231, 1, '1.0000', '2019-11-12 13:43:01', '2019-11-12 13:43:01'),
(228, 53, 73, 232, 1, '1.0000', '2019-11-12 13:43:01', '2019-11-12 13:43:01'),
(229, 54, 74, 233, 1, '1.0000', '2019-11-12 13:52:00', '2019-11-12 13:52:00'),
(230, 55, 75, 234, 1, '1.0000', '2019-11-12 13:57:06', '2019-11-12 13:57:06'),
(231, 55, 75, 235, 1, '1.0000', '2019-11-12 13:57:06', '2019-11-12 13:57:06'),
(232, 55, 76, 236, 1, '1.0000', '2019-11-12 13:57:06', '2019-11-12 13:57:06'),
(233, 55, 76, 237, 1, '1.0000', '2019-11-12 13:57:06', '2019-11-12 13:57:06'),
(234, 56, 77, 238, 1, '1.0000', '2019-11-12 14:00:51', '2019-11-12 14:00:51'),
(235, 56, 78, 239, 1, '1.0000', '2019-11-12 14:00:51', '2019-11-12 14:00:51'),
(236, 56, 78, 240, 1, '1.0000', '2019-11-12 14:00:51', '2019-11-12 14:00:51'),
(237, 57, 79, 241, 1, '1.0000', '2019-11-12 14:02:38', '2019-11-12 14:02:38'),
(238, 58, 80, 242, 1, '1.0000', '2019-11-12 14:04:21', '2019-11-12 14:04:21'),
(239, 58, 80, 243, 1, '1.0000', '2019-11-12 14:04:21', '2019-11-12 14:04:21'),
(240, 59, 81, 244, 1, '1.0000', '2019-11-12 14:10:17', '2019-11-12 14:10:17'),
(241, 59, 81, 245, 1, '1.0000', '2019-11-12 14:10:17', '2019-11-12 14:10:17'),
(242, 59, 82, 246, 1, '1.0000', '2019-11-12 14:10:17', '2019-11-12 14:10:17'),
(243, 59, 83, 247, 1, '1.0000', '2019-11-12 14:10:17', '2019-11-12 14:10:17'),
(244, 59, 83, 248, 1, '1.0000', '2019-11-12 14:10:17', '2019-11-12 14:10:17'),
(245, 60, 84, 249, 1, '1.0000', '2019-11-12 14:17:36', '2019-11-12 14:17:36'),
(246, 60, 84, 250, 1, '1.0000', '2019-11-12 14:17:36', '2019-11-12 14:17:36'),
(247, 60, 85, 251, 1, '1.0000', '2019-11-12 14:17:36', '2019-11-12 14:17:36'),
(248, 60, 85, 252, 1, '1.0000', '2019-11-12 14:17:36', '2019-11-12 14:17:36'),
(249, 60, 86, 253, 1, '1.0000', '2019-11-12 14:17:36', '2019-11-12 14:17:36'),
(250, 60, 86, 254, 1, '1.0000', '2019-11-12 14:17:36', '2019-11-12 14:17:36'),
(251, 61, 87, 255, 1, '1.0000', '2019-11-12 14:23:52', '2019-11-12 14:23:52'),
(252, 62, 88, 256, 1, '1.0000', '2019-11-12 14:26:18', '2019-11-12 14:26:18'),
(253, 62, 88, 257, 1, '1.0000', '2019-11-12 14:26:18', '2019-11-12 14:26:18'),
(254, 63, 89, 258, 1, '1.0000', '2019-11-12 14:28:49', '2019-11-12 14:28:49'),
(255, 63, 89, 259, 1, '1.0000', '2019-11-12 14:28:49', '2019-11-12 14:28:49'),
(256, 64, 90, 260, 1, '1.0000', '2019-11-12 14:31:20', '2019-11-12 14:31:20'),
(257, 64, 90, 261, 1, '1.0000', '2019-11-12 14:31:20', '2019-11-12 14:31:20'),
(258, 65, 91, 262, 1, '1.0000', '2019-11-12 14:34:05', '2019-11-12 14:34:05'),
(259, 65, 91, 263, 1, '1.0000', '2019-11-12 14:34:05', '2019-11-12 14:34:05'),
(260, 65, 92, 264, 1, '1.0000', '2019-11-12 14:34:05', '2019-11-12 14:34:05'),
(261, 65, 92, 265, 1, '1.0000', '2019-11-12 14:34:05', '2019-11-12 14:34:05'),
(262, 66, 93, 266, 1, '1.0000', '2019-11-12 14:36:47', '2019-11-12 14:36:47'),
(263, 66, 94, 267, 1, '1.0000', '2019-11-12 14:36:47', '2019-11-12 14:36:47'),
(264, 67, 95, 268, 1, '1.0000', '2019-11-12 14:38:58', '2019-11-12 14:38:58'),
(265, 67, 96, 269, 1, '1.0000', '2019-11-12 14:38:58', '2019-11-12 14:38:58'),
(266, 68, 97, 270, 1, '1.0000', '2019-11-12 14:39:48', '2019-11-12 14:39:48'),
(267, 69, 98, 271, 1, '1.0000', '2019-11-12 14:41:25', '2019-11-12 14:41:25'),
(268, 69, 98, 272, 1, '1.0000', '2019-11-12 14:41:25', '2019-11-12 14:41:25'),
(269, 70, 99, 273, 1, '1.0000', '2019-11-12 14:43:01', '2019-11-12 14:43:01'),
(270, 70, 99, 274, 1, '1.0000', '2019-11-12 14:43:01', '2019-11-12 14:43:01'),
(271, 71, 100, 275, 1, '1.0000', '2019-11-12 14:44:49', '2019-11-12 14:44:49'),
(272, 71, 100, 276, 1, '1.0000', '2019-11-12 14:44:49', '2019-11-12 14:44:49'),
(273, 72, 101, 277, 1, '1.0000', '2019-11-12 15:02:41', '2019-11-12 15:02:41'),
(274, 72, 101, 278, 1, '1.0000', '2019-11-12 15:02:41', '2019-11-12 15:02:41'),
(275, 72, 101, 279, 1, '1.0000', '2019-11-12 15:02:41', '2019-11-12 15:02:41'),
(276, 72, 102, 280, 1, '1.0000', '2019-11-12 15:02:41', '2019-11-12 15:02:41'),
(277, 72, 102, 281, 1, '1.0000', '2019-11-12 15:02:41', '2019-11-12 15:02:41'),
(278, 72, 102, 282, 1, '1.0000', '2019-11-12 15:02:41', '2019-11-12 15:02:41'),
(279, 73, 103, 283, 1, '1.0000', '2019-11-16 15:38:44', '2019-11-16 15:38:44'),
(280, 74, 104, 284, 1, '2.0000', '2019-11-16 15:45:31', '2019-11-16 15:46:23'),
(281, 74, 104, 285, 1, '2.0000', '2019-11-16 15:45:31', '2019-11-16 15:46:23'),
(282, 74, 105, 286, 1, '2.0000', '2019-11-16 15:45:31', '2019-11-16 15:46:23'),
(283, 74, 105, 287, 1, '2.0000', '2019-11-16 15:45:31', '2019-11-16 15:46:23'),
(284, 74, 106, 288, 1, '2.0000', '2019-11-16 15:45:31', '2019-11-16 15:46:23'),
(285, 74, 106, 289, 1, '2.0000', '2019-11-16 15:45:31', '2019-11-16 15:46:23'),
(286, 74, 107, 290, 1, '2.0000', '2019-11-16 15:45:31', '2019-11-16 15:46:23'),
(287, 74, 107, 291, 1, '2.0000', '2019-11-16 15:45:31', '2019-11-16 15:46:23'),
(288, 75, 108, 292, 1, '1.0000', '2019-11-16 15:55:24', '2019-11-16 15:55:24'),
(289, 75, 108, 293, 1, '1.0000', '2019-11-16 15:55:24', '2019-11-16 15:55:24'),
(290, 75, 108, 294, 1, '1.0000', '2019-11-16 15:55:24', '2019-11-16 15:55:24'),
(291, 75, 109, 295, 1, '1.0000', '2019-11-16 15:55:24', '2019-11-16 15:55:24'),
(292, 75, 109, 296, 1, '1.0000', '2019-11-16 15:55:25', '2019-11-16 15:55:25'),
(293, 75, 109, 297, 1, '1.0000', '2019-11-16 15:55:25', '2019-11-16 15:55:25'),
(294, 75, 109, 298, 1, '1.0000', '2019-11-16 15:55:25', '2019-11-16 15:55:25'),
(295, 76, 110, 299, 1, '1.0000', '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(296, 76, 110, 300, 1, '1.0000', '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(297, 76, 110, 301, 1, '1.0000', '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(298, 76, 110, 302, 1, '1.0000', '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(299, 76, 111, 303, 1, '1.0000', '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(300, 76, 111, 304, 1, '1.0000', '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(301, 76, 111, 305, 1, '1.0000', '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(302, 76, 111, 306, 1, '1.0000', '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(303, 76, 112, 307, 1, '1.0000', '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(304, 76, 112, 308, 1, '1.0000', '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(305, 76, 112, 309, 1, '1.0000', '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(306, 76, 112, 310, 1, '1.0000', '2019-11-16 16:06:01', '2019-11-16 16:06:01'),
(307, 77, 113, 311, 1, '1.0000', '2019-11-20 10:38:22', '2019-11-20 10:38:22'),
(308, 77, 113, 312, 1, '2.0000', '2019-11-20 10:38:22', '2019-11-20 10:38:22'),
(309, 77, 113, 313, 1, '2.0000', '2019-11-20 10:38:22', '2019-11-20 10:38:22'),
(310, 77, 113, 314, 1, '3.0000', '2019-11-20 10:38:22', '2019-11-20 10:38:22'),
(311, 77, 114, 315, 1, '2.0000', '2019-11-20 10:38:22', '2019-11-20 10:38:22'),
(312, 77, 114, 316, 1, '2.0000', '2019-11-20 10:38:22', '2019-11-20 10:38:22'),
(313, 77, 114, 317, 1, '2.0000', '2019-11-20 10:38:22', '2019-11-20 10:38:22'),
(314, 77, 114, 318, 1, '2.0000', '2019-11-20 10:38:22', '2019-11-20 10:38:22'),
(315, 78, 115, 319, 1, '1.0000', '2019-11-20 10:43:50', '2019-11-20 10:43:50'),
(316, 78, 115, 320, 1, '1.0000', '2019-11-20 10:43:50', '2019-11-20 10:43:50'),
(317, 78, 115, 321, 1, '1.0000', '2019-11-20 10:43:50', '2019-11-20 10:43:50'),
(318, 78, 116, 322, 1, '1.0000', '2019-11-20 10:43:50', '2019-11-20 10:43:50'),
(319, 78, 116, 323, 1, '1.0000', '2019-11-20 10:43:50', '2019-11-20 10:43:50'),
(320, 78, 116, 324, 1, '1.0000', '2019-11-20 10:43:50', '2019-11-20 10:43:50'),
(321, 79, 117, 325, 1, '1.0000', '2019-11-20 10:50:16', '2019-11-20 10:50:16'),
(322, 79, 117, 326, 1, '1.0000', '2019-11-20 10:50:16', '2019-11-20 10:50:16'),
(323, 79, 118, 327, 1, '1.0000', '2019-11-20 10:50:16', '2019-11-20 10:50:16'),
(324, 79, 118, 328, 1, '1.0000', '2019-11-20 10:50:16', '2019-11-20 10:50:16'),
(325, 80, 119, 329, 1, '1.0000', '2019-11-20 10:52:27', '2019-11-20 10:52:27'),
(326, 80, 119, 330, 1, '1.0000', '2019-11-20 10:52:27', '2019-11-20 10:52:27'),
(327, 80, 119, 331, 1, '1.0000', '2019-11-20 10:52:27', '2019-11-20 10:52:27'),
(328, 81, 120, 332, 1, '1.0000', '2019-11-20 10:54:24', '2019-11-20 10:54:24'),
(329, 82, 121, 333, 1, '1.0000', '2019-11-20 10:58:16', '2019-11-20 10:58:16'),
(330, 82, 121, 334, 1, '1.0000', '2019-11-20 10:58:16', '2019-11-20 10:58:16'),
(331, 83, 122, 335, 1, '1.0000', '2019-11-20 11:00:29', '2019-11-20 11:00:29'),
(332, 84, 123, 336, 1, '1.0000', '2019-11-20 11:02:43', '2019-11-20 11:02:43'),
(333, 84, 123, 337, 1, '1.0000', '2019-11-20 11:02:43', '2019-11-20 11:02:43'),
(334, 85, 124, 338, 1, '1.0000', '2019-11-21 02:13:03', '2019-11-21 02:13:03'),
(335, 85, 124, 339, 1, '1.0000', '2019-11-21 02:13:03', '2019-11-21 02:13:03'),
(336, 85, 125, 340, 1, '1.0000', '2019-11-21 02:13:03', '2019-11-21 02:13:03'),
(337, 85, 125, 341, 1, '1.0000', '2019-11-21 02:13:03', '2019-11-21 02:13:03'),
(338, 86, 126, 342, 1, '1.0000', '2019-11-21 02:14:20', '2019-11-21 02:14:20'),
(339, 86, 126, 343, 1, '1.0000', '2019-11-21 02:14:20', '2019-11-21 02:14:20'),
(340, 87, 127, 344, 1, '1.0000', '2019-11-21 02:20:37', '2019-11-21 02:20:37'),
(341, 87, 127, 345, 1, '1.0000', '2019-11-21 02:20:37', '2019-11-21 02:20:37'),
(342, 87, 127, 346, 1, '1.0000', '2019-11-21 02:20:37', '2019-11-21 02:20:37'),
(343, 88, 128, 347, 1, '1.0000', '2019-11-21 02:27:23', '2019-11-21 02:27:23'),
(344, 88, 129, 348, 1, '1.0000', '2019-11-21 02:27:23', '2019-11-21 02:27:23'),
(345, 88, 129, 349, 1, '1.0000', '2019-11-21 02:27:23', '2019-11-21 02:27:23'),
(346, 88, 130, 350, 1, '1.0000', '2019-11-21 02:27:23', '2019-11-21 02:27:23'),
(347, 88, 130, 351, 1, '1.0000', '2019-11-21 02:27:23', '2019-11-21 02:27:23'),
(348, 89, 131, 352, 1, '3.0000', '2019-11-21 02:50:13', '2019-11-21 02:50:13'),
(349, 89, 131, 353, 1, '3.0000', '2019-11-21 02:50:13', '2019-11-21 02:50:13'),
(350, 90, 132, 354, 1, '2.0000', '2019-11-21 02:51:54', '2019-11-21 02:51:54'),
(351, 91, 133, 355, 1, '2.0000', '2019-11-21 04:29:15', '2019-11-21 04:29:15'),
(352, 91, 133, 356, 1, '1.0000', '2019-11-21 04:29:15', '2019-11-21 04:29:15'),
(353, 91, 133, 357, 1, '1.0000', '2019-11-21 04:29:15', '2019-11-21 04:29:15'),
(354, 92, 134, 358, 1, '1.0000', '2019-11-21 04:36:36', '2019-11-21 04:36:36'),
(355, 92, 134, 359, 1, '1.0000', '2019-11-21 04:36:36', '2019-11-21 04:36:36'),
(356, 92, 134, 360, 1, '2.0000', '2019-11-21 04:36:36', '2019-11-21 04:36:36'),
(357, 92, 134, 361, 1, '1.0000', '2019-11-21 04:36:36', '2019-11-21 04:36:36'),
(358, 93, 135, 362, 1, '1.0000', '2019-11-21 04:40:20', '2019-11-21 04:40:20'),
(359, 93, 135, 363, 1, '1.0000', '2019-11-21 04:40:20', '2019-11-21 04:40:20'),
(360, 93, 135, 364, 1, '1.0000', '2019-11-21 04:40:20', '2019-11-21 04:40:20'),
(361, 93, 135, 365, 1, '1.0000', '2019-11-21 04:40:20', '2019-11-21 04:40:20'),
(362, 93, 135, 366, 1, '1.0000', '2019-11-21 04:40:20', '2019-11-21 04:40:20'),
(363, 94, 136, 367, 1, '1.0000', '2019-11-21 04:58:02', '2019-11-21 04:58:02'),
(364, 94, 136, 368, 1, '1.0000', '2019-11-21 04:58:02', '2019-11-21 04:58:02'),
(365, 95, 137, 369, 1, '1.0000', '2019-11-21 05:00:36', '2019-11-21 05:00:36'),
(366, 95, 137, 370, 1, '1.0000', '2019-11-21 05:00:36', '2019-11-21 05:00:36'),
(367, 96, 138, 371, 1, '2.0000', '2019-11-23 10:57:23', '2019-11-23 10:57:23'),
(368, 96, 139, 372, 1, '2.0000', '2019-11-23 10:57:23', '2019-11-23 10:57:23'),
(369, 96, 139, 373, 1, '1.0000', '2019-11-23 10:57:23', '2019-11-23 10:57:23'),
(370, 96, 139, 374, 1, '2.0000', '2019-11-23 10:57:23', '2019-11-23 10:57:23'),
(371, 97, 140, 375, 1, '1.0000', '2019-11-23 10:59:03', '2019-11-23 10:59:03'),
(372, 98, 141, 376, 1, '1.0000', '2019-11-23 10:59:51', '2019-11-23 10:59:51'),
(373, 99, 142, 377, 1, '1.0000', '2019-11-23 11:00:34', '2019-11-23 11:00:34'),
(374, 100, 143, 378, 1, '2.0000', '2019-11-23 11:02:06', '2019-11-23 11:02:06'),
(375, 100, 143, 379, 1, '1.0000', '2019-11-23 11:02:06', '2019-11-23 11:02:06'),
(376, 101, 144, 380, 1, '2.0000', '2019-11-23 11:03:05', '2019-11-23 11:03:05'),
(377, 102, 145, 381, 1, '1.0000', '2019-11-23 11:05:03', '2019-11-23 11:05:03'),
(378, 102, 145, 382, 1, '1.0000', '2019-11-23 11:05:03', '2019-11-23 11:05:03'),
(379, 102, 145, 383, 1, '1.0000', '2019-11-23 11:05:03', '2019-11-23 11:05:03'),
(380, 103, 146, 384, 1, '1.0000', '2019-11-23 11:06:37', '2019-11-23 11:06:37'),
(381, 103, 146, 385, 1, '1.0000', '2019-11-23 11:06:37', '2019-11-23 11:06:37'),
(382, 103, 146, 386, 1, '1.0000', '2019-11-23 11:06:37', '2019-11-23 11:06:37'),
(383, 104, 147, 387, 1, '1.0000', '2019-11-23 11:08:56', '2019-11-23 11:08:56'),
(384, 104, 147, 388, 1, '1.0000', '2019-11-23 11:08:56', '2019-11-23 11:08:56'),
(385, 104, 147, 389, 1, '1.0000', '2019-11-23 11:08:56', '2019-11-23 11:08:56'),
(386, 104, 147, 390, 1, '1.0000', '2019-11-23 11:08:56', '2019-11-23 11:08:56'),
(387, 105, 148, 391, 1, '3.0000', '2019-11-23 11:29:51', '2019-11-23 11:29:51'),
(388, 106, 149, 392, 1, '1.0000', '2019-11-23 11:31:23', '2019-11-23 11:31:23'),
(389, 106, 149, 393, 1, '1.0000', '2019-11-23 11:31:23', '2019-11-23 11:31:23'),
(390, 106, 149, 394, 1, '1.0000', '2019-11-23 11:31:23', '2019-11-23 11:31:23'),
(391, 106, 149, 395, 1, '1.0000', '2019-11-23 11:31:23', '2019-11-23 11:31:23'),
(392, 107, 150, 396, 1, '2.0000', '2019-11-23 11:32:54', '2019-11-23 11:32:54'),
(393, 107, 150, 397, 1, '1.0000', '2019-11-23 11:32:54', '2019-11-23 11:32:54'),
(394, 107, 150, 398, 1, '1.0000', '2019-11-23 11:32:54', '2019-11-23 11:32:54'),
(395, 108, 151, 399, 1, '1.0000', '2019-11-23 11:34:22', '2019-11-23 11:34:22'),
(396, 108, 151, 400, 1, '1.0000', '2019-11-23 11:34:22', '2019-11-23 11:34:22'),
(397, 109, 152, 401, 1, '1.0000', '2019-11-23 11:35:09', '2019-11-23 11:35:09'),
(398, 110, 153, 402, 1, '1.0000', '2019-11-23 11:35:53', '2019-11-23 11:35:53'),
(399, 111, 154, 403, 1, '1.0000', '2019-11-23 11:36:24', '2019-11-23 11:36:24'),
(400, 112, 155, 404, 1, '1.0000', '2019-11-23 11:36:52', '2019-11-23 11:36:52'),
(401, 113, 156, 405, 1, '1.0000', '2019-11-23 11:37:40', '2019-11-23 11:37:40'),
(402, 114, 157, 406, 1, '1.0000', '2019-11-23 11:38:14', '2019-11-23 11:38:14'),
(403, 115, 158, 407, 1, '1.0000', '2019-11-23 11:38:55', '2019-11-23 11:38:55'),
(404, 116, 159, 408, 1, '1.0000', '2019-11-23 11:39:15', '2019-11-23 11:39:15'),
(405, 117, 160, 409, 1, '1.0000', '2019-11-23 12:08:58', '2019-11-23 12:08:58'),
(406, 118, 161, 410, 1, '1.0000', '2019-11-23 12:09:25', '2019-11-23 12:09:25'),
(407, 119, 162, 411, 1, '1.0000', '2019-11-23 12:09:47', '2019-11-23 12:09:47'),
(408, 120, 163, 412, 1, '1.0000', '2019-11-23 12:10:25', '2019-11-23 12:10:25'),
(409, 121, 164, 413, 1, '1.0000', '2019-11-23 12:10:47', '2019-11-23 12:10:47'),
(410, 122, 165, 414, 1, '1.0000', '2019-11-23 12:11:07', '2019-11-23 12:11:07'),
(411, 123, 166, 415, 1, '1.0000', '2019-11-23 12:11:27', '2019-11-23 12:11:27'),
(412, 124, 167, 416, 1, '1.0000', '2019-11-23 12:11:58', '2019-11-23 12:11:58'),
(413, 125, 168, 417, 1, '1.0000', '2019-11-23 12:12:58', '2019-11-23 12:12:58'),
(414, 125, 168, 418, 1, '1.0000', '2019-11-23 12:12:58', '2019-11-23 12:12:58'),
(415, 126, 169, 419, 1, '1.0000', '2019-11-23 12:15:00', '2019-11-23 12:15:00'),
(416, 126, 169, 420, 1, '1.0000', '2019-11-23 12:15:00', '2019-11-23 12:15:00'),
(417, 126, 169, 421, 1, '1.0000', '2019-11-23 12:15:00', '2019-11-23 12:15:00'),
(418, 127, 170, 422, 1, '1.0000', '2019-11-23 12:16:02', '2019-11-23 12:16:02'),
(419, 127, 170, 423, 1, '1.0000', '2019-11-23 12:16:02', '2019-11-23 12:16:02');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

DROP TABLE IF EXISTS `variation_templates`;
CREATE TABLE IF NOT EXISTS `variation_templates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_templates_business_id_foreign` (`business_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_templates`
--

INSERT INTO `variation_templates` (`id`, `name`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'Color', 1, '2019-10-13 08:10:31', '2019-10-13 08:10:31'),
(2, 'Size', 1, '2019-10-13 08:11:51', '2019-10-13 08:11:51'),
(3, 'Size Digits', 1, '2019-10-13 08:12:54', '2019-10-13 08:12:54'),
(4, 'Size Black', 1, '2019-10-13 09:25:34', '2019-10-13 09:25:34'),
(5, 'Size White', 1, '2019-10-13 09:26:06', '2019-10-13 09:26:06'),
(6, 'Size Yellow', 1, '2019-10-13 09:26:50', '2019-10-13 09:26:50'),
(7, 'Size Blue', 1, '2019-10-13 09:28:30', '2019-10-13 09:28:30'),
(8, 'Size Pink', 1, '2019-10-13 09:35:01', '2019-10-13 09:35:01'),
(9, 'Size Brown', 1, '2019-10-13 09:51:46', '2019-10-13 09:51:46'),
(10, 'SIZE', 1, '2019-10-13 10:12:32', '2019-10-13 10:12:32'),
(11, 'Size Orange', 1, '2019-10-13 10:22:18', '2019-10-13 10:22:18'),
(12, 'Size Red', 1, '2019-10-13 10:25:48', '2019-10-13 10:25:48'),
(13, 'Size Grey', 1, '2019-10-13 11:05:11', '2019-10-13 11:05:11'),
(14, 'COLOR', 1, '2019-11-11 06:48:17', '2019-11-11 06:48:17'),
(15, 'Size Caramel', 1, '2019-11-20 10:32:47', '2019-11-20 10:32:47'),
(16, 'Size Green', 1, '2019-11-21 02:25:59', '2019-11-21 02:25:59');

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

DROP TABLE IF EXISTS `variation_value_templates`;
CREATE TABLE IF NOT EXISTS `variation_value_templates` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_value_templates_name_index` (`name`),
  KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_value_templates`
--

INSERT INTO `variation_value_templates` (`id`, `name`, `variation_template_id`, `created_at`, `updated_at`) VALUES
(1, 'White', 1, '2019-10-13 08:10:31', '2019-10-13 08:10:31'),
(2, 'Black', 1, '2019-10-13 08:10:31', '2019-10-13 08:10:31'),
(3, 'Red', 1, '2019-10-13 08:10:31', '2019-10-13 08:10:31'),
(4, 'Yellow', 1, '2019-10-13 08:10:31', '2019-10-13 08:10:31'),
(5, 'Brown', 1, '2019-10-13 08:10:31', '2019-10-13 08:10:31'),
(6, 'Pink', 1, '2019-10-13 08:10:31', '2019-10-13 08:10:31'),
(7, 'Rose Gold', 1, '2019-10-13 08:10:31', '2019-10-13 08:10:31'),
(8, 'Gold', 1, '2019-10-13 08:10:31', '2019-10-13 08:10:31'),
(9, 'Silver', 1, '2019-10-13 08:10:31', '2019-10-13 08:10:31'),
(10, 'Grey', 1, '2019-10-13 08:10:31', '2019-10-13 08:10:31'),
(11, 'Purple', 1, '2019-10-13 08:10:31', '2019-10-13 08:10:31'),
(12, 'Green', 1, '2019-10-13 08:10:31', '2019-10-13 08:10:31'),
(13, 'Blue', 1, '2019-10-13 08:10:31', '2019-10-13 08:10:31'),
(14, 'Orange', 1, '2019-10-13 08:10:31', '2019-10-13 08:10:31'),
(15, 'XS', 2, '2019-10-13 08:11:51', '2019-10-13 08:11:51'),
(16, 'S', 2, '2019-10-13 08:11:51', '2019-10-13 08:11:51'),
(17, 'M', 2, '2019-10-13 08:11:51', '2019-10-13 08:11:51'),
(18, 'L', 2, '2019-10-13 08:11:51', '2019-10-13 08:11:51'),
(19, 'XL', 2, '2019-10-13 08:11:51', '2019-10-13 08:11:51'),
(20, '2XL', 2, '2019-10-13 08:11:51', '2019-10-13 08:11:51'),
(21, '3XL', 2, '2019-10-13 08:11:51', '2019-10-13 08:11:51'),
(22, '4XL', 2, '2019-10-13 08:11:51', '2019-10-13 08:11:51'),
(23, '25', 3, '2019-10-13 08:12:54', '2019-10-13 08:12:54'),
(24, '26', 3, '2019-10-13 08:12:54', '2019-10-13 08:12:54'),
(25, '27', 3, '2019-10-13 08:12:54', '2019-10-13 08:12:54'),
(26, '28', 3, '2019-10-13 08:12:54', '2019-10-13 08:12:54'),
(27, '29', 3, '2019-10-13 08:12:54', '2019-10-13 08:12:54'),
(28, '30', 3, '2019-10-13 08:12:54', '2019-10-13 08:12:54'),
(29, '31', 3, '2019-10-13 08:12:54', '2019-10-13 08:12:54'),
(30, '32', 3, '2019-10-13 08:12:54', '2019-10-13 08:12:54'),
(31, '33', 3, '2019-10-13 08:12:54', '2019-10-13 08:12:54'),
(32, '34', 3, '2019-10-13 08:12:54', '2019-10-13 08:12:54'),
(33, '35', 3, '2019-10-13 08:12:54', '2019-10-13 08:12:54'),
(34, '36', 3, '2019-10-13 08:12:54', '2019-10-13 08:12:54'),
(35, '37', 3, '2019-10-13 08:12:54', '2019-10-13 08:12:54'),
(36, '38', 3, '2019-10-13 08:12:54', '2019-10-13 08:12:54'),
(37, '39', 3, '2019-10-13 08:12:54', '2019-10-13 08:12:54'),
(38, '40', 3, '2019-10-13 08:12:54', '2019-10-13 08:12:54'),
(39, 'MB', 2, '2019-10-13 08:47:40', '2019-10-13 08:47:40'),
(40, 'LB', 2, '2019-10-13 08:47:40', '2019-10-13 08:47:40'),
(41, 'XLB', 2, '2019-10-13 08:47:40', '2019-10-13 08:47:40'),
(42, 'MW', 2, '2019-10-13 08:47:40', '2019-10-13 08:47:40'),
(43, 'LW', 2, '2019-10-13 08:47:40', '2019-10-13 08:47:40'),
(44, 'XLW', 2, '2019-10-13 08:47:40', '2019-10-13 08:47:40'),
(45, 'MY', 2, '2019-10-13 08:54:27', '2019-10-13 08:54:27'),
(46, 'XLY', 2, '2019-10-13 08:54:27', '2019-10-13 08:54:27'),
(47, '2XLY', 2, '2019-10-13 08:54:27', '2019-10-13 08:54:27'),
(48, 'MP', 2, '2019-10-13 08:54:27', '2019-10-13 08:54:27'),
(49, 'LP', 2, '2019-10-13 08:54:27', '2019-10-13 08:54:27'),
(50, 'XLP', 2, '2019-10-13 08:54:27', '2019-10-13 08:54:27'),
(51, '2XLP', 2, '2019-10-13 08:54:27', '2019-10-13 08:54:27'),
(52, 'SB', 2, '2019-10-13 09:08:34', '2019-10-13 09:08:34'),
(53, 'SP', 2, '2019-10-13 09:08:34', '2019-10-13 09:08:34'),
(54, 'MY', 1, '2019-10-13 09:13:25', '2019-10-13 09:13:25'),
(55, 'LY', 1, '2019-10-13 09:13:25', '2019-10-13 09:13:25'),
(56, 'XLY', 1, '2019-10-13 09:13:25', '2019-10-13 09:13:25'),
(57, '2XLY', 1, '2019-10-13 09:13:25', '2019-10-13 09:13:25'),
(58, 'MB', 1, '2019-10-13 09:13:25', '2019-10-13 09:13:25'),
(59, 'LB', 1, '2019-10-13 09:13:25', '2019-10-13 09:13:25'),
(60, 'XLB', 1, '2019-10-13 09:13:25', '2019-10-13 09:13:25'),
(61, '2XLB', 1, '2019-10-13 09:13:25', '2019-10-13 09:13:25'),
(62, 'SW', 2, '2019-10-13 09:15:38', '2019-10-13 09:15:38'),
(63, 'S-BLA', 4, '2019-10-13 09:25:34', '2019-10-13 09:53:26'),
(64, 'M-BLA', 4, '2019-10-13 09:25:34', '2019-10-13 09:53:26'),
(65, 'L-BLA', 4, '2019-10-13 09:25:34', '2019-10-13 09:53:26'),
(66, 'XL-BLA', 4, '2019-10-13 09:25:34', '2019-10-13 09:53:26'),
(67, 'S-WHI', 5, '2019-10-13 09:26:06', '2019-10-13 09:53:10'),
(68, 'M-WHI', 5, '2019-10-13 09:26:06', '2019-10-13 09:53:10'),
(69, 'L-WHI', 5, '2019-10-13 09:26:06', '2019-10-13 09:53:10'),
(70, 'XL-WHI', 5, '2019-10-13 09:26:06', '2019-10-13 09:53:10'),
(71, 'S-YEL', 6, '2019-10-13 09:26:50', '2019-10-13 09:52:30'),
(72, 'M-YEL', 6, '2019-10-13 09:26:50', '2019-10-13 09:52:30'),
(73, 'L-YEL', 6, '2019-10-13 09:26:50', '2019-10-13 09:52:30'),
(74, 'XL-YEL', 6, '2019-10-13 09:26:50', '2019-10-13 09:52:30'),
(75, 'S-BLU', 7, '2019-10-13 09:28:30', '2019-10-13 09:28:30'),
(76, 'M-BLU', 7, '2019-10-13 09:28:30', '2019-10-13 09:28:30'),
(77, 'L-BLU', 7, '2019-10-13 09:28:30', '2019-10-13 09:28:30'),
(78, 'XL-BLU', 7, '2019-10-13 09:28:30', '2019-10-13 09:28:30'),
(79, 'S-PIN', 8, '2019-10-13 09:35:01', '2019-10-13 09:52:04'),
(80, 'M-PIN', 8, '2019-10-13 09:35:01', '2019-10-13 09:52:04'),
(81, 'L-PIN', 8, '2019-10-13 09:35:01', '2019-10-13 09:52:04'),
(82, 'XL-PIN', 8, '2019-10-13 09:35:01', '2019-10-13 09:52:04'),
(83, 'S-BRO', 9, '2019-10-13 09:51:46', '2019-10-13 09:51:46'),
(84, 'M-BRO', 9, '2019-10-13 09:51:46', '2019-10-13 09:51:46'),
(85, 'L-BRO', 9, '2019-10-13 09:51:46', '2019-10-13 09:51:46'),
(86, 'XL-BRO', 9, '2019-10-13 09:51:46', '2019-10-13 09:51:46'),
(87, '2XL-BLA', 4, '2019-10-13 09:58:29', '2019-10-13 09:58:29'),
(88, '2XL-PIN', 8, '2019-10-13 09:58:29', '2019-10-13 09:58:29'),
(89, '2XL-BRO', 9, '2019-10-13 10:00:11', '2019-10-13 10:00:11'),
(90, '2XL-YEL', 6, '2019-10-13 10:11:06', '2019-10-13 10:11:06'),
(91, 'S', 10, '2019-10-13 10:12:32', '2019-10-13 10:12:32'),
(92, 'M', 10, '2019-10-13 10:12:32', '2019-10-13 10:12:32'),
(93, 'L', 10, '2019-10-13 10:12:32', '2019-10-13 10:12:32'),
(94, 'XL', 10, '2019-10-13 10:12:32', '2019-10-13 10:12:32'),
(95, '2XL', 10, '2019-10-13 10:13:42', '2019-10-13 10:13:42'),
(96, '2XL-WHI', 5, '2019-10-13 10:19:51', '2019-10-13 10:19:51'),
(97, 'S-ORA', 11, '2019-10-13 10:22:18', '2019-10-13 10:22:18'),
(98, 'M-ORA', 11, '2019-10-13 10:22:18', '2019-10-13 10:22:18'),
(99, 'L-ORA', 11, '2019-10-13 10:22:18', '2019-10-13 10:22:18'),
(100, 'XL-ORA', 11, '2019-10-13 10:22:18', '2019-10-13 10:22:18'),
(101, 'S-RED', 12, '2019-10-13 10:25:48', '2019-10-13 10:25:48'),
(102, 'M-RED', 12, '2019-10-13 10:25:48', '2019-10-13 10:25:48'),
(103, 'L-RED', 12, '2019-10-13 10:25:48', '2019-10-13 10:25:48'),
(104, 'XL-RED', 12, '2019-10-13 10:25:48', '2019-10-13 10:25:48'),
(105, '2XL-RED', 12, '2019-10-13 10:28:43', '2019-10-13 10:28:43'),
(106, '2XL-ORA', 11, '2019-10-13 10:28:43', '2019-10-13 10:28:43'),
(107, 'S-GREY', 13, '2019-10-13 11:05:11', '2019-10-13 11:05:11'),
(108, 'M-GREY', 13, '2019-10-13 11:05:11', '2019-10-13 11:05:11'),
(109, 'L-GREY', 13, '2019-10-13 11:05:11', '2019-10-13 11:05:11'),
(110, 'XL-GREY', 13, '2019-10-13 11:05:11', '2019-10-13 11:05:11'),
(111, 'White', 14, '2019-11-11 06:48:17', '2019-11-11 06:48:17'),
(112, 'Grey', 14, '2019-11-11 06:48:17', '2019-11-11 06:48:17'),
(113, '2XL-BLU', 7, '2019-11-16 15:55:13', '2019-11-16 15:55:13'),
(114, 'S-CRM', 15, '2019-11-20 10:32:47', '2019-11-20 10:32:47'),
(115, 'M-CRM', 15, '2019-11-20 10:32:47', '2019-11-20 10:32:47'),
(116, 'L-CRM', 15, '2019-11-20 10:32:47', '2019-11-20 10:32:47'),
(117, 'XL-CRM', 15, '2019-11-20 10:32:47', '2019-11-20 10:32:47'),
(118, '2XL-CRM', 15, '2019-11-20 10:32:47', '2019-11-20 10:32:47'),
(119, 'Snow Corn', 14, '2019-11-20 10:58:10', '2019-11-20 10:58:10'),
(120, 'Pink', 14, '2019-11-20 10:58:10', '2019-11-20 10:58:10'),
(121, 'S-GRE', 16, '2019-11-21 02:25:59', '2019-11-21 02:25:59'),
(122, 'M-GRE', 16, '2019-11-21 02:25:59', '2019-11-21 02:25:59'),
(123, 'L-GRE', 16, '2019-11-21 02:25:59', '2019-11-21 02:25:59'),
(124, 'XL-GRE', 16, '2019-11-21 02:25:59', '2019-11-21 02:25:59'),
(125, '2XL-GRE', 16, '2019-11-21 02:25:59', '2019-11-21 02:25:59'),
(126, 'Yellow', 14, '2019-11-21 02:50:07', '2019-11-21 02:50:07'),
(127, 'Black', 14, '2019-11-21 04:29:04', '2019-11-21 04:29:04'),
(128, 'Red', 14, '2019-11-21 04:36:07', '2019-11-21 04:36:07'),
(129, 'Green', 14, '2019-11-21 04:36:07', '2019-11-21 04:36:07'),
(130, 'Cornsilk', 14, '2019-11-21 04:36:07', '2019-11-21 04:36:07'),
(131, 'DarkRed', 14, '2019-11-21 04:40:10', '2019-11-21 04:40:10');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD CONSTRAINT `variation_group_prices_price_group_id_foreign` FOREIGN KEY (`price_group_id`) REFERENCES `selling_price_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variation_group_prices_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);

--
-- Constraints for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
