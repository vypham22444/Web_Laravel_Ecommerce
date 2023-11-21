-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 21, 2023 lúc 04:56 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopping`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'NAM', 0, 'nam', '2021-11-08 11:59:15', '2021-11-08 11:59:15', NULL),
(2, 'NỮ', 0, 'nu', '2021-11-08 11:59:26', '2021-11-08 11:59:26', NULL),
(3, 'TRẺ EM', 0, 'tre-em', '2021-11-08 11:59:40', '2021-11-08 11:59:40', NULL),
(4, 'TÚI', 0, 'tui', '2021-11-08 12:00:57', '2021-11-08 12:00:57', NULL),
(5, 'ĐÔI GIÀY', 0, 'doi-giay', '2021-11-08 12:01:06', '2021-11-08 12:01:06', NULL),
(6, 'QUẦN ÁO', 0, 'quan-ao', '2021-11-08 12:01:20', '2021-11-08 12:01:20', NULL),
(7, 'QUẦN ÁO THỂ THAO', 0, 'quan-ao-the-thao', '2021-11-08 12:01:35', '2021-11-08 12:01:35', NULL),
(8, 'ĐỒ ĐÔI', 0, 'do-doi', '2021-11-08 12:11:56', '2021-11-08 12:11:56', NULL),
(9, 'ÁO-NAM', 1, 'ao-nam', '2021-11-08 12:12:15', '2021-11-08 12:12:15', NULL),
(10, 'QUẦN-NAM', 1, 'quan-nam', '2021-11-08 12:12:25', '2021-11-08 12:12:25', NULL),
(11, 'ÁO-NỮ', 2, 'ao-nu', '2021-11-08 12:12:33', '2021-11-08 12:12:33', NULL),
(12, 'QUẦN-NỮ', 2, 'quan-nu', '2021-11-08 12:12:50', '2021-11-08 12:12:50', NULL),
(13, 'ĐẦM ĐẸP', 2, 'dam-dep', '2021-11-08 12:14:37', '2021-11-08 12:14:37', NULL),
(14, 'VÁY ĐẸP', 2, 'vay-dep', '2021-11-08 12:14:45', '2021-11-09 10:03:21', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `name`, `email`, `comment`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'hoa', 'hoa@localhost.com', 'san phảm', 5, '2021-11-18 08:15:08', '2021-11-18 08:15:08'),
(2, 'bi', 'bi@localhost.com', 'Đẹp', 5, '2021-11-18 08:16:27', '2021-11-18 08:16:27'),
(3, 'nam', 'name@localhost.com', 'Áo đẹp quá', 2, '2021-11-18 08:25:54', '2021-11-18 08:25:54'),
(4, 'bi', NULL, 'chất lượng tốt', 2, '2021-12-08 09:02:02', '2021-12-08 09:02:02'),
(5, 'bo', NULL, 'quá vừa ý', 1, '2021-12-19 10:18:27', '2021-12-19 10:18:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'an', 'an@gmail.com', 'an', '0987654321', NULL, NULL),
(3, 'bi', 'bi@gmail.com', '99d4fb3db1563c87da2cdfc0158b37c3', '0123456788', NULL, NULL),
(4, 'bo', 'bo@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0123456788', NULL, NULL),
(7, 'vy', 'vy@gmail.com', '9495fa6cfd7a03125bce7141b6d931a6', '0987654321', NULL, NULL),
(8, 'vy', 'vy@gmail.com', '9495fa6cfd7a03125bce7141b6d931a6', '012345678', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menus`
--

INSERT INTO `menus` (`id`, `name`, `parent_id`, `created_at`, `updated_at`, `slug`, `deleted_at`) VALUES
(1, 'Menu 1', 0, NULL, '2021-10-20 07:59:50', 'menu-1', '2021-10-20 07:59:50'),
(2, 'Menu 2', 0, NULL, '2021-10-20 07:36:44', '', '2021-10-20 07:36:44'),
(3, 'Menu 3', 0, NULL, '2021-10-20 07:35:38', '', '2021-10-20 07:35:38'),
(4, 'Menu 1.1', 1, NULL, '2021-10-20 07:20:45', '', '2021-10-20 07:20:45'),
(5, 'Menu 1.1.1', 4, NULL, '2021-10-20 07:11:39', '', '2021-10-20 07:11:39'),
(6, 'Menu 2.1', 2, NULL, '2021-10-20 07:36:18', '', '2021-10-20 07:36:18'),
(7, 'Menu 2.1.1', 6, '2021-09-14 06:05:05', '2021-10-20 07:30:34', '', '2021-10-20 07:30:34'),
(8, 'Menu 3.1', 3, '2021-09-14 06:05:27', '2021-10-20 07:08:50', '', '2021-10-20 07:08:50'),
(9, 'Menu 3.1.1', 8, '2021-09-14 06:41:29', '2021-09-14 08:07:23', 'menu-311', '2021-09-14 08:07:23'),
(10, 'Menu 1.1.1', 4, '2021-09-14 07:39:14', '2021-10-20 07:35:34', 'menu-111', '2021-10-20 07:35:34'),
(11, 'tfhd', 1, '2021-10-20 07:15:52', '2021-10-20 07:35:53', 'tfhd', '2021-10-20 07:35:53'),
(12, 'Menu 2', 0, '2021-10-20 08:52:09', '2021-11-02 11:05:26', 'menu-2', NULL),
(13, 'Menu 2', 0, '2021-10-20 08:52:20', '2021-10-22 09:07:53', 'menu-2', '2021-10-22 09:07:53'),
(14, 'Menu 1', 0, '2021-11-02 11:05:39', '2021-11-02 11:05:39', 'menu-1', NULL),
(15, 'Menu 3', 0, '2021-11-02 11:14:42', '2021-11-02 11:14:42', 'menu-3', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_09_03_164443_create_categories_table', 1),
(6, '2021_09_13_153630_add_column_deleted_at_table_categories', 1),
(7, '2021_09_13_155551_create_menus_table', 2),
(8, '2021_09_14_133408_add_column_slug_to_menus_table', 3),
(9, '2021_09_14_150416_add_column_soft_deleted_to_menus_table', 4),
(10, '2021_09_17_155115_create_products_table', 5),
(11, '2021_09_17_155444_create_product_images_table', 5),
(12, '2021_09_17_155750_create_tags_table', 5),
(13, '2021_09_17_155911_create_product_tags_table', 5),
(14, '2021_09_23_154414_add_comlumn_feature_image_name', 6),
(15, '2021_09_23_161456_add_comlumn_image_name_to_table_product_image', 7),
(16, '2021_10_07_165951_add_column_delete_at_to_product_table', 8),
(17, '2021_10_08_143301_create_sliders_table', 9),
(18, '2021_10_08_181713_add_column_delete_at_to_sliders', 10),
(19, '2021_10_09_075159_create_settings_table', 11),
(20, '2021_10_19_151721_add_column_type_settings_table', 12),
(21, '2021_10_24_173453_create_roles_table', 13),
(22, '2021_10_24_173559_create_permissions_table', 13),
(23, '2021_10_24_173816_create_table_user_role', 13),
(24, '2021_10_24_174250_create_table_permission_role', 13),
(25, '2021_10_26_051530_add_column_deleted_at_table_users', 14),
(26, '2021_10_29_170155_add_column_parent_id_permission', 15),
(27, '2021_10_29_181046_add_column_key_permission', 16),
(28, '2021_11_04_044550_add_views_products', 17),
(29, '2021_11_18_143959_create_comments_table', 18),
(30, '2021_11_21_152939_create_customers_table', 19),
(31, '2021_11_21_162602_create_shippings_table', 20),
(32, '2021_11_21_164254_create_shippings_table', 21),
(33, '2021_12_06_202221_create_orders_table', 22),
(34, '2021_12_06_202342_create_order_details_table', 22),
(35, '2021_12_12_041444_create_thong_kes_table', 23);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `order_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `shipping_id`, `order_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 11, '7e8d6', 1, '2021-12-06 15:35:12', '2021-12-06 15:35:12'),
(2, 3, 12, 'f87a2', 1, '2021-12-06 15:35:20', '2021-12-06 15:35:20'),
(3, 3, 13, '9d493', 1, '2021-12-06 15:35:24', '2021-12-06 15:35:24'),
(4, 3, 14, '979b4', 1, '2021-12-06 15:50:18', '2021-12-06 15:50:18'),
(5, 3, 15, 'f294c', 1, '2021-12-06 15:50:40', '2021-12-06 15:50:40'),
(6, 3, 16, 'a3c3a', 1, '2021-12-06 16:09:42', '2021-12-06 16:09:42'),
(7, 3, 17, '0f7e3', 1, '2021-12-06 16:11:35', '2021-12-06 16:11:35'),
(8, 3, 18, '2f4dd', 1, '2021-12-06 16:14:40', '2021-12-06 16:14:40'),
(9, 3, 19, '016bf', 1, '2021-12-06 16:18:47', '2021-12-06 16:18:47'),
(10, 3, 20, '6fcbd', 1, '2021-12-06 16:25:51', '2021-12-06 16:25:51'),
(11, 3, 21, 'd97f0', 1, '2021-12-06 16:26:10', '2021-12-06 16:26:10'),
(12, 3, 22, '04a9b', 1, '2021-12-06 16:26:59', '2021-12-06 16:26:59'),
(13, 3, 23, '34f87', 1, '2021-12-06 16:27:18', '2021-12-06 16:27:18'),
(14, 3, 24, '8d1c1', 1, '2021-12-06 16:30:13', '2021-12-06 16:30:13'),
(15, 3, 25, 'f87be', 1, '2021-12-06 16:30:18', '2021-12-06 16:30:18'),
(16, 3, 26, 'b0efc', 1, '2021-12-06 16:32:55', '2021-12-06 16:32:55'),
(17, 3, 27, '02727', 1, '2021-12-06 16:36:23', '2021-12-06 16:36:23'),
(18, 3, 28, '8efc9', 1, '2021-12-06 16:38:31', '2021-12-06 16:38:31'),
(19, 3, 29, 'dfdec', 1, '2021-12-06 16:43:06', '2021-12-06 16:43:06'),
(20, 3, 30, 'a426b', 1, '2021-12-06 16:44:17', '2021-12-06 16:44:17'),
(21, 3, 31, '6ec62', 1, '2021-12-06 16:47:43', '2021-12-06 16:47:43'),
(22, 3, 32, '14e89', 1, '2021-12-06 16:47:56', '2021-12-06 16:47:56'),
(23, 3, 33, '7a7cf', 1, '2021-12-06 16:55:08', '2021-12-06 16:55:08'),
(24, 3, 34, 'd1ddb', 1, '2021-12-06 16:56:02', '2021-12-06 16:56:02'),
(25, 3, 35, 'af917', 1, '2021-12-06 16:59:45', '2021-12-06 16:59:45'),
(26, 3, 36, 'f85e9', 1, '2021-12-06 23:04:37', '2021-12-06 23:04:37'),
(27, 3, 37, 'ec661', 1, '2021-12-06 23:04:59', '2021-12-06 23:04:59'),
(28, 3, 38, '1c07f', 1, '2021-12-06 23:26:53', '2021-12-06 23:26:53'),
(29, 3, 39, '6ea99', 1, '2021-12-06 23:27:38', '2021-12-06 23:27:38'),
(30, 3, 40, '1d421', 2, '2021-12-07 00:46:49', '2021-12-13 10:47:10'),
(31, 4, 41, '8459d', 2, '2021-12-07 00:58:33', '2021-12-13 10:42:07'),
(32, 4, 42, '06bac', 2, '2021-12-07 01:11:36', '2021-12-13 10:38:45'),
(33, 4, 43, '11493', 2, '2021-12-07 01:15:03', '2021-12-13 10:40:52'),
(34, 4, 44, '38096', 2, '2021-12-07 08:56:11', '2021-12-13 10:55:21'),
(35, 4, 45, 'b7ff6', 2, '2021-12-07 08:59:33', '2021-12-09 11:55:25'),
(36, 4, 46, 'a905c', 2, '2021-12-07 09:00:30', '2021-12-13 10:51:30'),
(37, 4, 47, '2cbfc', 2, '2021-12-07 09:13:08', '2021-12-13 11:04:14'),
(38, 4, 48, '4f778', 2, '2021-12-07 09:13:08', '2021-12-13 11:00:09'),
(39, 4, 50, 'c74bb', 2, '2021-12-07 16:14:26', '2021-12-13 11:06:19'),
(40, 4, 51, '04851', 2, '2021-12-07 16:14:49', '2021-12-10 06:47:27'),
(41, 4, 52, '47c3a', 3, '2021-12-08 18:24:27', '2021-12-21 22:36:35'),
(42, 4, 53, '40e2e', 2, '2021-12-21 10:25:51', '2021-12-21 03:26:33'),
(43, 7, 54, '49fdb', 2, '2021-12-21 11:12:50', '2021-12-21 10:28:13'),
(44, 7, 55, '4ead6', 2, '2021-12-21 11:15:47', '2021-12-21 22:20:55'),
(45, 7, 56, 'a30e6', 2, '2021-12-22 02:41:37', '2021-12-21 19:42:05'),
(46, 7, 57, 'a0661', 1, '2021-12-22 02:42:12', '2021-12-22 08:24:53'),
(47, 7, 58, '743db', 1, '2021-12-22 15:42:42', '2021-12-22 08:46:28'),
(48, 7, 59, 'ac88d', 2, '2021-12-22 15:46:38', '2021-12-22 08:48:04'),
(49, 8, 60, 'cd4c1', 1, '2023-11-13 18:19:45', '2023-11-13 18:19:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_sales_quatity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_code`, `product_id`, `product_name`, `product_price`, `product_sales_quatity`, `created_at`, `updated_at`) VALUES
(1, '1d421', 27, 'Boot đen', '250000', 1, '2021-12-07 00:46:49', '2021-12-07 00:46:49'),
(2, '1d421', 28, 'ĐỒ NAM', '200000', 2, '2021-12-07 00:46:49', '2021-12-07 00:46:49'),
(3, '1d421', 22, 'Áo len vặn thừng đồ đôi thu đông', '250000', 1, '2021-12-07 00:46:49', '2021-12-07 00:46:49'),
(4, '8459d', 3, 'Bộ Quần Áo Nam Áo Thun Dài Tay', '89000', 1, '2021-12-07 00:58:33', '2021-12-07 00:58:33'),
(5, '8459d', 18, '𝐒𝐄𝐓 𝐁𝐎𝐃𝐘 𝐕𝐀́𝐘 𝐕𝐎𝐀𝐍+𝐓𝐔𝐑𝐁𝐀𝐍', '160000', 1, '2021-12-07 00:58:33', '2021-12-07 00:58:33'),
(6, '06bac', 3, 'Bộ Quần Áo Nam Áo Thun Dài Tay', '89000', 1, '2021-12-07 01:11:36', '2021-12-07 01:11:36'),
(7, '06bac', 18, '𝐒𝐄𝐓 𝐁𝐎𝐃𝐘 𝐕𝐀́𝐘 𝐕𝐎𝐀𝐍+𝐓𝐔𝐑𝐁𝐀𝐍', '160000', 1, '2021-12-07 01:11:36', '2021-12-07 01:11:36'),
(8, '11493', 23, 'Váy thun đôi', '280000', 1, '2021-12-07 01:15:03', '2021-12-07 01:15:03'),
(9, '38096', 23, 'Váy thun đôi', '280000', 1, '2021-12-07 08:56:11', '2021-12-07 08:56:11'),
(10, '38096', 18, 'Set baby váy voan+turban trắng', '160000', 1, '2021-12-07 08:56:11', '2021-12-07 08:56:11'),
(11, 'b7ff6', 15, 'bộ đồ carot', '70000', 3, '2021-12-07 08:59:33', '2021-12-07 08:59:33'),
(12, 'b7ff6', 16, 'baby gấu kẻ ngang', '130000', 1, '2021-12-07 08:59:33', '2021-12-07 08:59:33'),
(13, 'b7ff6', 18, 'Set baby váy voan+turban trắng', '160000', 2, '2021-12-07 08:59:33', '2021-12-07 08:59:33'),
(14, 'b7ff6', 14, '𝐁𝐨𝐝𝐲 𝐠𝐚̂́𝐮 𝐧𝐠𝐮̛̣𝐜', '110000', 1, '2021-12-07 08:59:33', '2021-12-07 08:59:33'),
(15, 'a905c', 15, 'bộ đồ carot', '70000', 3, '2021-12-07 09:00:30', '2021-12-07 09:00:30'),
(16, 'a905c', 16, 'baby gấu kẻ ngang', '130000', 1, '2021-12-07 09:00:30', '2021-12-07 09:00:30'),
(17, 'a905c', 18, 'Set baby váy voan+turban trắng', '160000', 2, '2021-12-07 09:00:30', '2021-12-07 09:00:30'),
(18, 'a905c', 14, '𝐁𝐨𝐝𝐲 𝐠𝐚̂́𝐮 𝐧𝐠𝐮̛̣𝐜', '110000', 1, '2021-12-07 09:00:30', '2021-12-07 09:00:30'),
(19, '2cbfc', 15, 'bộ đồ carot', '70000', 3, '2021-12-07 09:13:08', '2021-12-07 09:13:08'),
(20, '2cbfc', 16, 'baby gấu kẻ ngang', '130000', 1, '2021-12-07 09:13:08', '2021-12-07 09:13:08'),
(21, '2cbfc', 18, 'Set baby váy voan+turban trắng', '160000', 2, '2021-12-07 09:13:08', '2021-12-07 09:13:08'),
(22, '2cbfc', 14, '𝐁𝐨𝐝𝐲 𝐠𝐚̂́𝐮 𝐧𝐠𝐮̛̣𝐜', '110000', 1, '2021-12-07 09:13:08', '2021-12-07 09:13:08'),
(23, '4f778', 15, 'bộ đồ carot', '70000', 3, '2021-12-07 09:13:08', '2021-12-07 09:13:08'),
(24, '4f778', 16, 'baby gấu kẻ ngang', '130000', 1, '2021-12-07 09:13:08', '2021-12-07 09:13:08'),
(25, '4f778', 18, 'Set baby váy voan+turban trắng', '160000', 2, '2021-12-07 09:13:08', '2021-12-07 09:13:08'),
(26, '4f778', 14, '𝐁𝐨𝐝𝐲 𝐠𝐚̂́𝐮 𝐧𝐠𝐮̛̣𝐜', '110000', 1, '2021-12-07 09:13:08', '2021-12-07 09:13:08'),
(27, 'c74bb', 15, 'bộ đồ carot', '70000', 3, '2021-12-07 16:14:26', '2021-12-07 16:14:26'),
(28, 'c74bb', 16, 'baby gấu kẻ ngang', '130000', 1, '2021-12-07 16:14:26', '2021-12-07 16:14:26'),
(29, 'c74bb', 18, 'Set baby váy voan+turban trắng', '160000', 2, '2021-12-07 16:14:26', '2021-12-07 16:14:26'),
(30, 'c74bb', 14, '𝐁𝐨𝐝𝐲 𝐠𝐚̂́𝐮 𝐧𝐠𝐮̛̣𝐜', '110000', 1, '2021-12-07 16:14:26', '2021-12-07 16:14:26'),
(31, '04851', 15, 'bộ đồ carot', '70000', 3, '2021-12-07 16:14:49', '2021-12-07 16:14:49'),
(32, '04851', 16, 'baby gấu kẻ ngang', '130000', 1, '2021-12-07 16:14:49', '2021-12-07 16:14:49'),
(33, '04851', 18, 'Set baby váy voan+turban trắng', '160000', 2, '2021-12-07 16:14:49', '2021-12-07 16:14:49'),
(34, '04851', 14, '𝐁𝐨𝐝𝐲 𝐠𝐚̂́𝐮 𝐧𝐠𝐮̛̣𝐜', '110000', 1, '2021-12-07 16:14:49', '2021-12-07 16:14:49'),
(35, '47c3a', 15, 'bộ đồ carot', '70000', 3, '2021-12-08 18:24:27', '2021-12-08 18:24:27'),
(36, '47c3a', 16, 'baby gấu kẻ ngang', '130000', 1, '2021-12-08 18:24:27', '2021-12-08 18:24:27'),
(37, '47c3a', 28, 'ĐỒ NAM', '200000', 2, '2021-12-08 18:24:27', '2021-12-08 18:24:27'),
(38, '47c3a', 27, 'Boot đen', '250000', 1, '2021-12-08 18:24:27', '2021-12-08 18:24:27'),
(39, '47c3a', 26, 'Giày đế cao', '190000', 1, '2021-12-08 18:24:27', '2021-12-08 18:24:27'),
(40, '47c3a', 22, 'Áo len vặn thừng đồ đôi thu đông', '250000', 1, '2021-12-08 18:24:27', '2021-12-08 18:24:27'),
(41, '47c3a', 20, 'Áo váy đôi đi tiệc', '300000', 1, '2021-12-08 18:24:27', '2021-12-08 18:24:27'),
(42, '40e2e', 38, 'Giày hồng', '110000', 2, '2021-12-21 10:25:51', '2021-12-21 10:25:51'),
(43, '49fdb', 25, 'Áo khoác đôi', '340000', 2, '2021-12-21 11:12:50', '2021-12-21 11:12:50'),
(44, '49fdb', 10, 'đầm tiểu thư', '190000', 1, '2021-12-21 11:12:50', '2021-12-21 11:12:50'),
(45, '49fdb', 11, 'Quần sọt', '120000', 3, '2021-12-21 11:12:50', '2021-12-21 11:12:50'),
(46, '49fdb', 18, 'Set baby váy voan+turban trắng', '160000', 1, '2021-12-21 11:12:50', '2021-12-21 11:12:50'),
(47, '4ead6', 28, 'ĐỒ NAM', '200000', 1, '2021-12-21 11:15:47', '2021-12-21 11:15:47'),
(48, 'a30e6', 38, 'Giày hồng', '110000', 2, '2021-12-22 02:41:37', '2021-12-22 02:41:37'),
(49, 'a30e6', 1, 'ÁO thun polo', '79000', 1, '2021-12-22 02:41:37', '2021-12-22 02:41:37'),
(50, 'a0661', 38, 'Giày hồng', '110000', 2, '2021-12-22 02:42:12', '2021-12-22 02:42:12'),
(51, 'a0661', 1, 'ÁO thun polo', '79000', 1, '2021-12-22 02:42:12', '2021-12-22 02:42:12'),
(52, '743db', 25, 'Áo khoác đôi', '340000', 1, '2021-12-22 15:42:42', '2021-12-22 15:42:42'),
(53, '743db', 28, 'ĐỒ NAM', '200000', 2, '2021-12-22 15:42:42', '2021-12-22 15:42:42'),
(54, '743db', 14, '𝐁𝐨𝐝𝐲 𝐠𝐚̂́𝐮 𝐧𝐠𝐮̛̣𝐜', '110000', 3, '2021-12-22 15:42:42', '2021-12-22 15:42:42'),
(55, '743db', 27, 'Boot đen', '250000', 1, '2021-12-22 15:42:42', '2021-12-22 15:42:42'),
(56, 'ac88d', 25, 'Áo khoác đôi', '340000', 1, '2021-12-22 15:46:38', '2021-12-22 15:46:38'),
(57, 'ac88d', 28, 'ĐỒ NAM', '200000', 2, '2021-12-22 15:46:38', '2021-12-22 15:46:38'),
(58, 'ac88d', 14, '𝐁𝐨𝐝𝐲 𝐠𝐚̂́𝐮 𝐧𝐠𝐮̛̣𝐜', '110000', 3, '2021-12-22 15:46:39', '2021-12-22 15:46:39'),
(59, 'ac88d', 27, 'Boot đen', '250000', 1, '2021-12-22 15:46:39', '2021-12-22 15:46:39'),
(60, 'cd4c1', 27, 'Boot đen', '250000', 2, '2023-11-13 18:19:45', '2023-11-13 18:19:45'),
(61, 'cd4c1', 23, 'Váy thun đôi', '280000', 1, '2023-11-13 18:19:45', '2023-11-13 18:19:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `key_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `created_at`, `updated_at`, `parent_id`, `key_code`) VALUES
(1, 'category', 'category', '2021-11-01 09:12:19', '2021-11-01 09:12:19', 0, ''),
(2, 'list', 'list', '2021-11-01 09:12:19', '2021-11-01 09:12:19', 1, 'category_list'),
(3, 'add', 'add', '2021-11-01 09:12:19', '2021-11-01 09:12:19', 1, 'category_add'),
(4, 'edit', 'edit', '2021-11-01 09:12:19', '2021-11-01 09:12:19', 1, 'category_edit'),
(5, 'delete', 'delete', '2021-11-01 09:12:19', '2021-11-01 09:12:19', 1, 'category_delete'),
(6, 'slider', 'slider', '2021-11-01 09:12:25', '2021-11-01 09:12:25', 0, ''),
(7, 'list', 'list', '2021-11-01 09:12:25', '2021-11-01 09:12:25', 6, 'slider_list'),
(8, 'add', 'add', '2021-11-01 09:12:25', '2021-11-01 09:12:25', 6, 'slider_add'),
(9, 'edit', 'edit', '2021-11-01 09:12:25', '2021-11-01 09:12:25', 6, 'slider_edit'),
(10, 'delete', 'delete', '2021-11-01 09:12:25', '2021-11-01 09:12:25', 6, 'slider_delete'),
(11, 'menu', 'menu', '2021-11-01 09:13:19', '2021-11-01 09:13:19', 0, ''),
(12, 'list', 'list', '2021-11-01 09:13:19', '2021-11-01 09:13:19', 11, 'menu_list'),
(13, 'add', 'add', '2021-11-01 09:13:19', '2021-11-01 09:13:19', 11, 'menu_add'),
(14, 'edit', 'edit', '2021-11-01 09:13:19', '2021-11-01 09:13:19', 11, 'menu_edit'),
(15, 'delete', 'delete', '2021-11-01 09:13:19', '2021-11-01 09:13:19', 11, 'menu_delete'),
(16, 'product', 'product', '2021-11-01 09:13:24', '2021-11-01 09:13:24', 0, ''),
(17, 'list', 'list', '2021-11-01 09:13:24', '2021-11-01 09:13:24', 16, 'product_list'),
(18, 'add', 'add', '2021-11-01 09:13:24', '2021-11-01 09:13:24', 16, 'product_add'),
(19, 'edit', 'edit', '2021-11-01 09:13:24', '2021-11-01 09:13:24', 16, 'product_edit'),
(20, 'delete', 'delete', '2021-11-01 09:13:24', '2021-11-01 09:13:24', 16, 'product_delete'),
(21, 'setting', 'setting', '2021-11-01 09:13:29', '2021-11-01 09:13:29', 0, ''),
(22, 'list', 'list', '2021-11-01 09:13:29', '2021-11-01 09:13:29', 21, 'setting_list'),
(23, 'add', 'add', '2021-11-01 09:13:29', '2021-11-01 09:13:29', 21, 'setting_add'),
(24, 'edit', 'edit', '2021-11-01 09:13:29', '2021-11-01 09:13:29', 21, 'setting_edit'),
(25, 'delete', 'delete', '2021-11-01 09:13:29', '2021-11-01 09:13:29', 21, 'setting_delete'),
(26, 'user', 'user', '2021-11-01 09:13:33', '2021-11-01 09:13:33', 0, ''),
(27, 'list', 'list', '2021-11-01 09:13:33', '2021-11-01 09:13:33', 26, 'user_list'),
(28, 'add', 'add', '2021-11-01 09:13:33', '2021-11-01 09:13:33', 26, 'user_add'),
(29, 'edit', 'edit', '2021-11-01 09:13:33', '2021-11-01 09:13:33', 26, 'user_edit'),
(30, 'delete', 'delete', '2021-11-01 09:13:33', '2021-11-01 09:13:33', 26, 'user_delete'),
(31, 'role', 'role', '2021-11-01 09:13:37', '2021-11-01 09:13:37', 0, ''),
(32, 'list', 'list', '2021-11-01 09:13:37', '2021-11-01 09:13:37', 31, 'role_list'),
(33, 'add', 'add', '2021-11-01 09:13:37', '2021-11-01 09:13:37', 31, 'role_add'),
(34, 'edit', 'edit', '2021-11-01 09:13:37', '2021-11-01 09:13:37', 31, 'role_edit'),
(35, 'delete', 'delete', '2021-11-01 09:13:37', '2021-11-01 09:13:37', 31, 'role_delete');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permission_role`
--

INSERT INTO `permission_role` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 5, 2, NULL, NULL),
(2, 5, 3, NULL, NULL),
(3, 5, 4, NULL, NULL),
(4, 5, 5, NULL, NULL),
(5, 5, 8, NULL, NULL),
(6, 5, 9, NULL, NULL),
(7, 5, 13, NULL, NULL),
(19, 2, 3, NULL, NULL),
(17, 2, 2, NULL, NULL),
(20, 2, 17, NULL, NULL),
(13, 3, 7, NULL, NULL),
(21, 2, 18, NULL, NULL),
(22, 2, 19, NULL, NULL),
(23, 1, 2, NULL, NULL),
(24, 1, 3, NULL, NULL),
(25, 1, 4, NULL, NULL),
(26, 1, 5, NULL, NULL),
(27, 1, 7, NULL, NULL),
(28, 1, 8, NULL, NULL),
(29, 1, 9, NULL, NULL),
(30, 1, 10, NULL, NULL),
(31, 1, 12, NULL, NULL),
(32, 1, 13, NULL, NULL),
(33, 1, 14, NULL, NULL),
(34, 1, 15, NULL, NULL),
(35, 1, 17, NULL, NULL),
(36, 1, 18, NULL, NULL),
(37, 1, 19, NULL, NULL),
(38, 1, 20, NULL, NULL),
(39, 1, 22, NULL, NULL),
(40, 1, 23, NULL, NULL),
(41, 1, 24, NULL, NULL),
(42, 1, 25, NULL, NULL),
(43, 1, 27, NULL, NULL),
(44, 1, 28, NULL, NULL),
(45, 1, 29, NULL, NULL),
(46, 1, 30, NULL, NULL),
(47, 1, 32, NULL, NULL),
(48, 1, 33, NULL, NULL),
(49, 1, 34, NULL, NULL),
(50, 1, 35, NULL, NULL),
(51, 2, 12, NULL, NULL),
(52, 2, 13, NULL, NULL),
(53, 2, 14, NULL, NULL),
(54, 2, 15, NULL, NULL),
(55, 2, 20, NULL, NULL),
(56, 2, 4, NULL, NULL),
(57, 2, 5, NULL, NULL),
(58, 2, 7, NULL, NULL),
(59, 2, 8, NULL, NULL),
(60, 2, 9, NULL, NULL),
(61, 2, 10, NULL, NULL),
(62, 2, 22, NULL, NULL),
(63, 2, 23, NULL, NULL),
(64, 2, 24, NULL, NULL),
(65, 2, 25, NULL, NULL),
(66, 2, 27, NULL, NULL),
(67, 2, 28, NULL, NULL),
(68, 2, 29, NULL, NULL),
(69, 2, 30, NULL, NULL),
(70, 2, 32, NULL, NULL),
(71, 2, 33, NULL, NULL),
(72, 2, 34, NULL, NULL),
(73, 2, 35, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_quantity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_da_ban` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature_image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `feature_image_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `views_count` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `product_quantity`, `price`, `product_da_ban`, `feature_image_path`, `content`, `user_id`, `category_id`, `created_at`, `updated_at`, `feature_image_name`, `deleted_at`, `views_count`) VALUES
(1, 'ÁO thun polo', '0', '79000', '1', '/storage/product/1/d6lyaf6y3zgGU62k1iIb.png', '<p>Th&ocirc;ng tin sản phẩm: &Aacute;o ph&ocirc;ng nam cổ bẻ việt nam xuất khẩu</p>\r\n<p>- &Aacute;o cotton cổ bẻ, ngắn tay.</p>\r\n<p>- M&agrave;u sắc: Đen, trắng, ghi x&aacute;m, ghi s&aacute;ng, xanh đậm.</p>\r\n<p>- Made in Vietnam.</p>\r\n<p>- Form d&aacute;ng body vừa người , ph&ugrave; hợp du lịch, du xu&acirc;n, dạo phố, picnic, cafe....</p>\r\n<p>- &Aacute;othun nam cổ bẻ họa tiết trẻ trung. - &Aacute;o thun nam l&agrave; trang phục gi&uacute;p c&aacute;c ch&agrave;ng trai l&agrave;m mới phong c&aacute;ch của ch&iacute;nh m&igrave;nh.</p>\r\n<p>- Thiết kế cổ bẻ xẻ trụ đơn giản, cực kỳ năng động, khỏe khoắn, nhưng vẫn kh&ocirc;ng k&eacute;m phần s&agrave;nh điệu, hợp mốt.</p>\r\n<p>- Chất liệu thun cao cấp mềm mại, th&ocirc;ng tho&aacute;ng v&agrave; co gi&atilde;n tối ưu, lu&ocirc;n tạo cảm gi&aacute;c thoải m&aacute;i khi mặc.</p>\r\n<p>- M&agrave;u sắc trẻ trung, dễ d&agrave;ng phối c&ugrave;ng nhiều kiểu jeans bụi phủi, kaki lịch l&atilde;m. - H&agrave;ng c&oacute; sẵn đủ size: M, L, XL, XX</p>', 1, 9, '2021-11-08 12:26:10', '2021-12-22 08:24:53', 'ao_thun_polo_1.png', NULL, 0),
(2, 'Áo SWEATER', '21', '149000', '0', '/storage/product/1/Q8q89V8FuaWvBVvY6wlw.png', '<p>NHỮNG CHIẾC &Aacute;O STYLE STREETWEAR MỚI NHẤT Đ&Atilde; VỀ H&Agrave;NG PHỤC VỤ CẢ NH&Agrave;.</p>\r\n<p>&Aacute;o hoddie của shop đ&aacute;p ứng ti&ecirc;u ch&iacute;:</p>\r\n<p>● Thiết kế mới nhất</p>\r\n<p>● Chất &aacute;o nỉ Poly cực mịn mềm đẹp k phai x&ugrave;&nbsp;</p>', 1, 9, '2021-11-08 12:31:31', '2021-11-09 10:52:26', 'ao_sweater_2.png', NULL, 0),
(3, 'Bộ Quần Áo Nam Áo Thun Dài Tay', '22', '89000', '2', '/storage/product/1/QgFZ9XuBF19S54yPNq9D.jpg', '<ul class=\"\">\r\n<li class=\"\" data-spm-anchor-id=\"a2o4n.pdp_revamp.product_detail.i0.37c27193bWpDo2\">Chất vải: Vải tổng hợp trơn mềm mại c&oacute; co gi&atilde;n</li>\r\n<li class=\"\">Thiết kế : Ph&ugrave; hợp phong c&aacute;ch giới trẻ hiện đại</li>\r\n<li class=\"\">Kiểu d&aacute;ng gọn nhẹ, năng động</li>\r\n<li class=\"\">Ph&ugrave; hợp nhiều ho&agrave;n cảnh: mặc nh&agrave;, đi học, đi chơi, du lịch...</li>\r\n<li class=\"\" data-spm-anchor-id=\"a2o4n.pdp_revamp.product_detail.i1.37c27193bWpDo2\">Xuất xứ: Việt Nam</li>\r\n</ul>', 1, 6, '2021-11-08 12:37:15', '2021-12-13 10:42:07', 'quan_ao_nam_dai_tay_1.jpg', NULL, 0),
(4, 'Quần áo nam', '12', '200000', '0', '/storage/product/1/P7Uq4auHXkMy2XCVR9No.jpg', '<p>Thiết kế : Ph&ugrave; hợp phong c&aacute;ch giới trẻ hiện đại</p>\r\n<p>Kiểu d&aacute;ng gọn nhẹ, năng động</p>', 1, 6, '2021-11-08 12:39:35', '2021-11-19 09:57:58', 'quan_ao_nam1.jpg', NULL, 0),
(5, 'Quần Dài Nam', '8', '150000', '0', '/storage/product/1/eg9TBGIOvNMvbP9N0Ot4.jpg', '<p><span data-spm-anchor-id=\"a2o4n.pdp_revamp.product_detail.i2.3725ba335w2ben\">Chất vải: Vải Thun mềm mại c&oacute; co gi&atilde;n</span><br /><br />Thiết kế : Ph&ugrave; hợp phong c&aacute;ch giới trẻ hiện đại<br /><br />Kiểu d&aacute;ng gọn nhẹ, năng động<br /><br />Ph&ugrave; hợp nhiều ho&agrave;n cảnh: mặc nh&agrave;, đi học, đi chơi, du lịch...<br /><br />Xuất xứ: Việt Nam</p>', 1, 10, '2021-11-08 12:42:33', '2021-11-09 10:53:02', 'quan_dai_nam_1.jpg', NULL, 0),
(6, 'túi đeo chéo', '6', '250000', '0', '/storage/product/1/MVavGAC02DHoHDwihynn.jpg', '<p>T&uacute;i đ&eacute;o ch&eacute;p hồng, thon gọn, đẹp, chất lượng</p>', 1, 4, '2021-11-08 12:43:57', '2021-11-09 10:52:41', 'tui-deo-cheo.jpg', NULL, 0),
(7, 'Đầm đỏ', '20', '250000', '0', '/storage/product/1/h3eKjBNOfoIDl5585mxU.jpg', '<p>Chất liệu thun g&acirc;n d&agrave;y, form chuẩn v&ocirc; c&ugrave;ng t&ocirc;n d&aacute;ng.</p>', 1, 13, '2021-11-09 10:03:09', '2021-11-09 10:52:50', 'vay_do_1.jpg', NULL, 0),
(8, 'Áo form', '15', '150000', '0', '/storage/product/1/3I3cOWBx45F3tnk0MEGl.jpg', '<p>&Aacute;o form oversize n&ecirc;n nam nữ mặc đều thoải m&aacute;i.</p>', 1, 11, '2021-11-09 10:04:36', '2021-11-09 10:54:01', 'ao_xam.jpg', NULL, 0),
(9, 'Set vest kèm quần', '10', '200000', '0', '/storage/product/1/5xx0A8zcNtmtyVmN970f.jpg', '<div class=\"kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\">\r\n<div dir=\"auto\">Set vest k&egrave;m quần giả v&aacute;y đắp ch&eacute;o</div>\r\n<div dir=\"auto\">Style n&agrave;y vừa đơn giản, vừa thanh lịch ấn tượng qu&aacute; n&egrave; c&aacute;c n&agrave;ng</div>\r\n</div>', 1, 14, '2021-11-09 10:07:32', '2021-11-09 10:53:54', 'Set _vest.jpg', NULL, 0),
(10, 'đầm tiểu thư', '19', '190000', '1', '/storage/product/1/kPiqR8QZkQkCITLOzauk.jpg', '<div class=\"kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\">\r\n<div dir=\"auto\">Ng&agrave;n tim cho chiếc đầm tiểu thư c&ocirc;ng ch&uacute;a nhẹ nh&agrave;ng như thế n&agrave;y.</div>\r\n</div>\r\n<div class=\"o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\">\r\n<div dir=\"auto\">Với chất liệu vải voan điểm xuyến th&ecirc;m chấm bi c&ugrave;ng m&agrave;u tạo cảm gi&aacute;c trẻ trung đ&aacute;ng iu đến người mặc.</div>\r\n</div>', 1, 13, '2021-11-09 10:08:53', '2021-12-21 10:28:13', 'dam_tieu_thu.jpg', NULL, 0),
(11, 'Quần sọt', '27', '120000', '3', '/storage/product/1/uFYtwC90lZGjJQGMAB8w.jpg', '<div class=\"kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\">\r\n<div dir=\"auto\">Quần sọt ngố đơn giản c&aacute; t&iacute;nh</div>\r\n</div>\r\n<div class=\"o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\">\r\n<div dir=\"auto\">Chờ m&atilde;i cuối c&ugrave;ng mấy em jean ngố n&agrave;y mới về tới, mở ra xem thử m&agrave; h&agrave;i l&ograve;ng về d&aacute;ng v&agrave; chất qu&aacute; trời lu&ocirc;n &aacute; mọi người.</div>\r\n</div>', 1, 12, '2021-11-09 10:10:25', '2021-12-21 10:28:13', 'Quan_sot.jpg', NULL, 0),
(12, 'quần jean dài', '10', '150000', '0', '/storage/product/1/2jEh3fJuzBXTBRD1uZqX.jpg', '<p>Một em quần jean d&agrave;i basic vừa cập b&ecirc;n đ&acirc;y c&aacute;c t&igrave;nh iu ơi. Chất lượng quần jean b&ecirc;n em th&igrave; khỏi b&agrave;n rồi, lu&ocirc;n đảm bảo h&agrave;ng xịn mịn gi&aacute; lại mềm qtqđ lu&ocirc;n n&egrave;.</p>', 1, 12, '2021-11-09 10:12:20', '2021-11-09 10:53:30', 'quan_jean_dai.jpg', NULL, 0),
(13, 'Quần ống suông', '15', '90000', '0', '/storage/product/1/eJWXJZlCMbsC8E9KX2NV.jpg', '<div class=\"kvgmc6g5 cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\">\r\n<div dir=\"auto\">Quần ống su&ocirc;ng bao hack d&aacute;ng lu&ocirc;n n&egrave; c&aacute;c n&agrave;ng</div>\r\n</div>\r\n<div class=\"o9v6fnle cxmmr5t8 oygrvhab hcukyx3x c1et5uql ii04i59q\">\r\n<div dir=\"auto\">Chất vải quần t&acirc;y m&aacute;t mịn, mềm tạo tạo cảm gi&aacute;c thoải m&aacute;i, quần c&oacute; xăng tia ph&iacute;a sau t&ocirc;n d&aacute;ng cực k&igrave; tinh tế.</div>\r\n</div>', 1, 12, '2021-11-09 10:13:52', '2021-11-09 10:22:14', 'quan_ong_suong.jpg', NULL, 0),
(14, '𝐁𝐨𝐝𝐲 𝐠𝐚̂́𝐮 𝐧𝐠𝐮̛̣𝐜', '6', '110000', '8', '/storage/product/1/KQCX2P6bnYAuOlCQLTj2.jpg', '<div dir=\"auto\">Chất liệu: Nỉ mềm</div>\r\n<div dir=\"auto\">M&agrave;u sắc: Hồng</div>\r\n<div dir=\"auto\">Size: 5-7kg / 7-9kg / 9-12kg</div>', 1, 3, '2021-11-09 10:17:05', '2021-12-22 08:48:04', 'baby_gau_nguc.jpg', NULL, 0),
(15, 'bộ đồ carot', '23', '70000', '18', '/storage/product/1/mBcW8PfxIQKEqLKRVsu8.png', '<p>Chất nỉ mềm mại v&agrave; an to&agrave;n cho l&agrave;n da nhạy cảm của b&eacute; n&ecirc;n ba mẹ y&ecirc;n t&acirc;m cho b&eacute; diện nh&eacute;, vừa đảm bảo sức khỏe lại xinh, mặc đi học - đi chơi đều oki ạ!</p>', 1, 3, '2021-11-09 10:18:18', '2021-12-21 22:36:35', 'carot.png', NULL, 0),
(16, 'baby gấu kẻ ngang', '4', '130000', '6', '/storage/product/1/Zgja6hVLMHjTyRb4KZux.jpg', '<div dir=\"auto\">Chất liệu: Nỉ da c&aacute;</div>\r\n<div dir=\"auto\">M&agrave;u sắc: V&agrave;ng kẻ x&aacute;m</div>\r\n<div dir=\"auto\">Size: 5-7kg / 7-9kg / 9-12kg</div>', 1, 3, '2021-11-09 10:19:39', '2021-12-21 22:36:35', 'baby_gau_ke_ngang.jpg', NULL, 0),
(17, 'Cadigan', '9', '100000', '0', '/storage/product/1/28O99iyo1mqdi5rR8llY.jpg', '<div dir=\"auto\">C&aacute;c mẫu đều được l&agrave;m từ chất liệu len mềm mại, an to&agrave;n cho da b&eacute;, họa tiết v&agrave; m&agrave;u sắc xinh xắn, dễ mặc cực k&igrave;.</div>\r\n<div dir=\"auto\">Thu se lạnh th&igrave; cứ kho&aacute;c 1 em &aacute;o n&agrave;y b&ecirc;n ngo&agrave;i l&agrave; vừa đảm bảo sức khỏe vừa xinh cho b&eacute; mom nhỉ ^^</div>', 1, 3, '2021-11-09 10:21:19', '2021-11-09 10:21:19', '𝑪𝒂𝒅𝒊𝒈𝒂𝒏1.jpg', NULL, 0),
(18, 'Set baby váy voan+turban trắng', '0', '160000', '15', '/storage/product/1/Pj7pJ9UL1wyt1bTyfygM.jpg', '<div dir=\"auto\">Chất liệu: Thun mix voan</div>\r\n<div dir=\"auto\">M&agrave;u sắc: Trắng</div>\r\n<div dir=\"auto\">Size: 3-5kg / 5-7kg / 7-9kg / 9-12kg</div>\r\n<div dir=\"auto\">Phụ kiện đi k&egrave;m: Turban nơ</div>', 1, 3, '2021-11-09 10:23:50', '2021-12-21 10:28:13', 'set_body.jpg', NULL, 0),
(19, 'Áo váy đôi thu đông', '10', '320000', '0', '/storage/product/1/GxMT5A9YspAGWo9iaKBR.jpg', '<p>C&oacute; đ&acirc;u gần 50 mẫu đồ đ&ocirc;i cho c&aacute;c anh em - 320k/1 cặp &aacute;p dụng mua tại cửa h&agrave;ng</p>\r\n<p>Size nữ: S ( dưới 50kg, ngực 86 eo 70), M ( dưới 55kg, ngực 90 eo 74), L ( dưới 60kg, ngực 94 eo 78)</p>\r\n<p>Size nam: M ( dưới 65kg, ngực 98 bụng 94), L ( dưới 75kg, ngực 102 bụng 98), XL ( dưới 80kg, ngực 106 bụng 102)</p>\r\n<p>Để đảm bảo an to&agrave;n thời điểm nhạy cảm: anh em n&ecirc;n đặt h&agrave;ng online để shop ship nh&eacute;</p>', 1, 8, '2021-11-09 10:27:49', '2021-11-09 10:27:49', 'ao_vay_doi_thu_dong.jpg', NULL, 0),
(20, 'Áo váy đôi đi tiệc', '9', '300000', '1', '/storage/product/1/aJUaWT5t52G5pUsbvfnu.jpg', 'Size nữ: S ( dưới 50kg, ngực 86 eo 68), M ( dưới 55kg, ngực 88 eo 72), L ( dưới 60kg, ngực 90 eo 76) - tuỳ form sẽ có số đo rộng hơn. \r\nSize nam: M ( dưới 65kg, ngực 98 bụng 94), L ( dưới 75kg, ngực 102 bụng 98), XL ( dưới 80kg, ngực 106 bụng 102)', 1, 8, '2021-11-09 10:29:36', '2021-12-21 22:36:36', 'ao_vay_doi_di_tiec.jpg', NULL, 0),
(21, 'SET ĐÔI NUDE DÀI TAY CỘT EO', '10', '300000', '0', '/storage/product/1/l1QNzYUXHRxkGQuHgZrG.jpg', '<p>Size nữ: S M L</p>\r\n<p>Size nam: M L XL</p>', 1, 8, '2021-11-09 10:31:27', '2021-11-09 10:31:27', 'do_doi_nude.jpg', NULL, 0),
(22, 'Áo len vặn thừng đồ đôi thu đông', '8', '250000', '2', '/storage/product/1/6LYA2ANMa0CbjIsZYiYR.jpg', '<p>Chất len d&agrave;y dặn kh&ocirc;ng x&ugrave; l&ocirc;ng&nbsp;</p>', 1, 8, '2021-11-09 10:33:28', '2021-12-21 22:36:36', 'ao_len_doi.jpg', NULL, 0),
(23, 'Váy thun đôi', '10', '280000', '2', '/storage/product/1/q83kpb4gunwzg7w2vt9e.jpg', '<p>Chất liệu: thun da c&aacute; cao cấp, bề mặt mềm v&agrave; mịn, d&agrave;y dặn</p>', 1, 8, '2021-11-09 10:36:34', '2021-12-13 10:55:21', 'vay_thun_doi.jpg', NULL, 0),
(24, 'Áo thun khủng long đôi', '13', '200000', '0', '/storage/product/1/yaCIFcAdA5mOO5yhAlYK.jpg', '<p>Size nữ: S ( dưới 50kg, ngực 86 eo 70), M ( dưới 55kg, ngực 90 eo 74), L ( dưới 60kg, ngực 94 eo 78)</p>\r\n<p>Size nam: M ( dưới 65kg, ngực 98 bụng 94), L ( dưới 75kg, ngực 102 bụng 98), XL ( dưới 80kg, ngực 106 bụng 102)</p>', 1, 8, '2021-11-09 10:39:09', '2021-11-09 10:39:09', 'quan-ao1.jpg', NULL, 0),
(25, 'Áo khoác đôi', '5', '340000', '3', '/storage/product/1/83imGfylYAWmJZ44oPds.jpg', '<p>Size nữ: S ( dưới 50kg, ngực 86 eo 70), M ( dưới 55kg, ngực 90 eo 74), L ( dưới 60kg, ngực 94 eo 78)</p>\r\n<p>Size nam: M ( dưới 65kg, ngực 98 bụng 94), L ( dưới 75kg, ngực 102 bụng 98), XL ( dưới 80kg, ngực 106 bụng 102)</p>', 1, 8, '2021-11-09 10:40:31', '2021-12-22 08:48:04', 'quan-ao2.jpg', NULL, 0),
(26, 'Giày đế cao', '4', '190000', '1', '/storage/product/1/5GUgfFyMaOASPcp7yhs0.jpg', '<p>Th&ocirc;ng tin sản phẩm:</p>\r\n<p>- M&atilde; sản phẩm: GB00106</p>\r\n<p>- Chất liệu: Da nh&acirc;n tạo&nbsp;</p>\r\n<p>- Full size: 35 - 36 - 37 - 38 - 39</p>\r\n<p>- M&agrave;u sắc : Đen - Trắng</p>\r\n<p>- Độ cao đế : 5 cm</p>\r\n<p>- Xuất xứ: Việt Nam</p>', 1, 5, '2021-11-09 10:46:44', '2021-12-21 22:36:35', 'giay_de_cao.jpg', NULL, 0),
(27, 'Boot đen', '9', '250000', '3', '/storage/product/1/uS8baPnZXwSF4xKbb4wc.jpg', '<p>Loại sản phẩm: Gi&agrave;y Boots ✔ Chất liệu: - Th&acirc;n gi&agrave;y: Da PU tổng hợp - Đế gi&agrave;y: Đ&uacute;c cao su non ✔ M&agrave;u: Đen ✔ Size: 35 36 37 38 39 40 ✔ Chiều cao: 15 cm (T&iacute;nh từ đến cổ gi&agrave;y) ✔ Đế cao: 4 cm</p>', 1, 5, '2021-11-09 10:49:16', '2021-12-22 08:48:04', 'boot_den.jpg', NULL, 0),
(28, 'ĐỒ NAM', '3', '200000', '7', '/storage/product/1/DM6q4EYwWVD4Rw2S6kkY.jpg', '<p>Thoải m&aacute;i khi mặc, sang trọng</p>', 1, 1, '2021-11-19 09:37:05', '2023-11-13 09:02:29', 's4.jpg', NULL, 0),
(38, 'Giày hồng', '12', '110000', '4', '/storage/product/1/Fp2IgebVS3P44BxQsw3L.jpg', '<p>Gi&agrave;y</p>\r\n<p>&nbsp;</p>', 1, 5, '2021-12-17 13:46:12', '2023-11-13 09:01:54', 'sn5.jpg', '2023-11-13 09:01:54', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_images`
--

INSERT INTO `product_images` (`id`, `image_path`, `product_id`, `created_at`, `updated_at`, `image_name`) VALUES
(1, '/storage/product/1/1bvoiMEqKda9cd2Kprf5.png', 1, '2021-11-08 12:26:10', '2021-11-08 12:26:10', 'ao_thun_polo_1.png'),
(2, '/storage/product/1/wOjO7MwmsRK1S3z2f24L.png', 1, '2021-11-08 12:26:10', '2021-11-08 12:26:10', 'ao_thun_polo_2.png'),
(3, '/storage/product/1/51shWHYqBwkMqoyLwP6f.png', 1, '2021-11-08 12:26:10', '2021-11-08 12:26:10', 'ao_thun_polo_3.png'),
(4, '/storage/product/1/siqVLe1MJndn2SCNbxhP.png', 2, '2021-11-08 12:31:31', '2021-11-08 12:31:31', 'ao_sweater_1.png'),
(5, '/storage/product/1/t4xyiJubBiXeA7Lp2OSm.png', 2, '2021-11-08 12:31:31', '2021-11-08 12:31:31', 'ao_sweater_2.png'),
(6, '/storage/product/1/rYP8XKtQM1PxxTVb8kJn.jpg', 5, '2021-11-08 12:42:33', '2021-11-08 12:42:33', 'quan_dai_nam_1.jpg'),
(7, '/storage/product/1/238QLwFLfbiE0Oj73dtP.jpg', 5, '2021-11-08 12:42:33', '2021-11-08 12:42:33', 'quan_dai_nam_2.jpg'),
(8, '/storage/product/1/XrTPC6xej9bKn0DgttGO.jpg', 7, '2021-11-09 10:03:09', '2021-11-09 10:03:09', 'vay_do_1.jpg'),
(9, '/storage/product/1/zioJSy8ejHpFEkjE2PhO.jpg', 7, '2021-11-09 10:03:09', '2021-11-09 10:03:09', 'vay_do_2.jpg'),
(10, '/storage/product/1/ihOYGafRA7I6qVHBkSiO.jpg', 17, '2021-11-09 10:21:19', '2021-11-09 10:21:19', '𝑪𝒂𝒅𝒊𝒈𝒂𝒏1.jpg'),
(11, '/storage/product/1/kmk89Q2aOCCHbL66xuZ9.jpg', 17, '2021-11-09 10:21:19', '2021-11-09 10:21:19', '𝑪𝒂𝒅𝒊𝒈𝒂𝒏2.jpg'),
(12, '/storage/product/1/e1QxuQFYyJuKinkkkDIn.jpg', 22, '2021-11-09 10:33:28', '2021-11-09 10:33:28', 'ao_len_doi.jpg'),
(13, '/storage/product/1/Xe39yDX6VfhufWHy1jYs.jpg', 22, '2021-11-09 10:33:28', '2021-11-09 10:33:28', 'ao_len_doi2.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_tags`
--

CREATE TABLE `product_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_tags`
--

INSERT INTO `product_tags` (`id`, `product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-11-08 12:26:10', '2021-11-08 12:26:10'),
(2, 1, 2, '2021-11-08 12:26:10', '2021-11-08 12:26:10'),
(3, 1, 3, '2021-11-08 12:26:10', '2021-11-08 12:26:10'),
(4, 2, 4, '2021-11-08 12:31:31', '2021-11-08 12:31:31'),
(5, 2, 2, '2021-11-08 12:31:31', '2021-11-08 12:31:31'),
(6, 2, 5, '2021-11-08 12:31:31', '2021-11-08 12:31:31'),
(7, 3, 6, '2021-11-08 12:37:15', '2021-11-08 12:37:15'),
(8, 3, 7, '2021-11-08 12:37:15', '2021-11-08 12:37:15'),
(9, 3, 8, '2021-11-08 12:37:15', '2021-11-08 12:37:15'),
(10, 4, 6, '2021-11-08 12:39:35', '2021-11-08 12:39:35'),
(11, 4, 7, '2021-11-08 12:39:35', '2021-11-08 12:39:35'),
(12, 5, 9, '2021-11-08 12:42:33', '2021-11-08 12:42:33'),
(13, 6, 10, '2021-11-08 12:43:57', '2021-11-08 12:43:57'),
(14, 7, 11, '2021-11-09 10:03:09', '2021-11-09 10:03:09'),
(15, 8, 12, '2021-11-09 10:04:36', '2021-11-09 10:04:36'),
(16, 9, 13, '2021-11-09 10:07:32', '2021-11-09 10:07:32'),
(17, 10, 14, '2021-11-09 10:08:53', '2021-11-09 10:08:53'),
(18, 11, 15, '2021-11-09 10:10:25', '2021-11-09 10:10:25'),
(19, 12, 16, '2021-11-09 10:12:20', '2021-11-09 10:12:20'),
(20, 13, 17, '2021-11-09 10:13:52', '2021-11-09 10:13:52'),
(21, 14, 18, '2021-11-09 10:17:05', '2021-11-09 10:17:05'),
(22, 15, 19, '2021-11-09 10:18:18', '2021-11-09 10:18:18'),
(23, 16, 20, '2021-11-09 10:19:39', '2021-11-09 10:19:39'),
(24, 17, 21, '2021-11-09 10:21:19', '2021-11-09 10:21:19'),
(25, 18, 22, '2021-11-09 10:23:50', '2021-11-09 10:23:50'),
(26, 20, 23, '2021-11-09 10:29:36', '2021-11-09 10:29:36'),
(27, 21, 24, '2021-11-09 10:31:27', '2021-11-09 10:31:27'),
(28, 22, 25, '2021-11-09 10:33:28', '2021-11-09 10:33:28'),
(29, 23, 26, '2021-11-09 10:36:34', '2021-11-09 10:36:34'),
(30, 24, 27, '2021-11-09 10:39:09', '2021-11-09 10:39:09'),
(31, 26, 28, '2021-11-09 10:46:44', '2021-11-09 10:46:44'),
(32, 28, 7, '2021-11-19 09:37:05', '2021-11-19 09:37:05'),
(33, 37, 29, '2021-12-17 13:38:57', '2021-12-17 13:38:57'),
(34, 38, 30, '2021-12-17 13:46:12', '2021-12-17 13:46:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Quản trị hệ thống', NULL, NULL),
(2, 'guest', 'Khách hàng', NULL, NULL),
(3, 'developer', 'Phát triển hệ thống', NULL, NULL),
(4, 'content', 'Chỉnh sửa nội dung', NULL, NULL),
(5, 'editor', 'Người soạn thảo văn bản', '2021-10-29 11:39:13', '2021-10-29 11:39:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, NULL, NULL),
(7, 1, 1, NULL, NULL),
(4, 3, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `config_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `config_key`, `config_value`, `created_at`, `updated_at`, `type`) VALUES
(1, 'phone', '0796842836', '2021-10-15 08:39:45', '2021-10-15 08:39:45', ''),
(3, 'shopee_key', 'https://shopee.vn/product/299276369/7453402382', '2021-10-17 07:57:30', '2021-10-17 07:57:30', ''),
(4, 'link_shopee', 'https://shopee.vn/product/299276369/7453402382', '2021-10-17 08:00:17', '2021-10-17 08:00:17', ''),
(9, 'email', 'user@gmail.com', '2021-11-04 12:20:03', '2021-11-04 12:20:03', 'Text');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `shippings`
--

INSERT INTO `shippings` (`id`, `name`, `address`, `phone`, `email`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'bi', '428/13 khu vực 7', '0123456788', 'bi@gmail.com', 'giao lẹ', NULL, NULL),
(2, 'bi', '428/13 khu vực 7', '0123456788', 'bi@gmail.com', 'giao lẹ', NULL, NULL),
(3, 'bi', 'an binh', '0123456788', 'bi@gmail.com', 'giao nhanh', NULL, NULL),
(4, 'bi', 'an binh', '0123456788', 'bi@gmail.com', 'giao lẹ', NULL, NULL),
(5, 'bi', 'an binh', '0987654321', 'bi@gmail.com', 'lẹ', NULL, NULL),
(6, 'bi', 'an binh', '0123456788', 'bi@gmail.com', 'fđgdf', '2021-12-06 15:07:28', '2021-12-06 15:07:28'),
(7, 'bi', '428/13 khu vực 7', '0987654321', 'bi@gmail.com', 'kyygh', '2021-12-06 15:08:35', '2021-12-06 15:08:35'),
(8, 'Túi', '428/13 khu vực 7', '0987654321', 'bi@gmail.com', 'nhanh gọn lẹ', '2021-12-06 15:24:27', '2021-12-06 15:24:27'),
(9, 'Túi', '428/13 khu vực 7', '0987654321', 'bi@gmail.com', 'nhanh gọn lẹ', '2021-12-06 15:24:54', '2021-12-06 15:24:54'),
(10, 'bi', '428/13 khu vực 7', '0987654321', 'bi@gmail.com', 'vgvbhj', '2021-12-06 15:33:44', '2021-12-06 15:33:44'),
(11, 'bi', '428/13 khu vực 7', '0987654321', 'bi@gmail.com', 'vgvbhj', '2021-12-06 15:35:12', '2021-12-06 15:35:12'),
(12, 'bi', '428/13 khu vực 7', '0987654321', 'bi@gmail.com', 'vgvbhj', '2021-12-06 15:35:19', '2021-12-06 15:35:19'),
(13, 'bi', '428/13 khu vực 7', '0987654321', 'bi@gmail.com', 'vgvbhj', '2021-12-06 15:35:24', '2021-12-06 15:35:24'),
(14, 'bi', '428/13 khu vực 7', '0987654321', 'bi@gmail.com', 'vgvbhj', '2021-12-06 15:50:18', '2021-12-06 15:50:18'),
(15, 'Túi nữ 123', '428/13 khu vực 7', '0784637294', 'admin@localhost', 'erwr', '2021-12-06 15:50:40', '2021-12-06 15:50:40'),
(16, 'Túi', 'an binh', '0123456788', 'admin@localhost.com', 'frfr', '2021-12-06 16:09:42', '2021-12-06 16:09:42'),
(17, 'gtdrgg', '428/13 khu vực 7', '0123456788', 'admin@localhost.com', 'fvdg', '2021-12-06 16:11:35', '2021-12-06 16:11:35'),
(18, 'bi', 'an binh', '0987654321', 'vypham@gmail.com', 'hgh', '2021-12-06 16:14:40', '2021-12-06 16:14:40'),
(19, 'bi', '428/13 khu vực 7', '0123456788', 'admin@localhost.com', 'j', '2021-12-06 16:18:47', '2021-12-06 16:18:47'),
(20, 'bi', '428/13 khu vực 7', '0123456788', 'admin@localhost.com', 'j', '2021-12-06 16:25:51', '2021-12-06 16:25:51'),
(21, 'bi', '428/13 khu vực 7', '0123456788', 'admin@localhost.com', 'j', '2021-12-06 16:26:10', '2021-12-06 16:26:10'),
(22, 'bi', '428/13 khu vực 7', '0123456788', 'admin@localhost.com', 'j', '2021-12-06 16:26:59', '2021-12-06 16:26:59'),
(23, 'Quần áo đẹp', '428/13 khu vực 7', '0784637294', '0796842836', 'jjh', '2021-12-06 16:27:18', '2021-12-06 16:27:18'),
(24, 'bi', '428/13 khu vực 7', '0123456788', 'bi@gmail.com', 'gfgf', '2021-12-06 16:30:13', '2021-12-06 16:30:13'),
(25, 'bi', '428/13 khu vực 7', '0123456788', 'bi@gmail.com', 'gfgf', '2021-12-06 16:30:18', '2021-12-06 16:30:18'),
(26, 'gtdrgg', '428/13 khu vực 7', '0123456788', 'admin@localhost.com', 'kj', '2021-12-06 16:32:55', '2021-12-06 16:32:55'),
(27, 'gtdrgg', '428/13 khu vực 7', '0123456788', 'admin@localhost.com', 'fdgd', '2021-12-06 16:36:23', '2021-12-06 16:36:23'),
(28, 'gtdrgg', '428/13 khu vực 7', '0123456788', 'admin@localhost.com', 'dsfsf', '2021-12-06 16:38:31', '2021-12-06 16:38:31'),
(29, 'bi', '428/13 khu vực 7', '0123456788', 'admin@localhost', 'jhjg', '2021-12-06 16:43:06', '2021-12-06 16:43:06'),
(30, 'bi', '428/13 khu vực 7', '0123456788', 'admin@localhost', 'jhjg', '2021-12-06 16:44:17', '2021-12-06 16:44:17'),
(31, 'bi', '428/13 khu vực 7', '0123456788', 'admin@localhost', 'jhjg', '2021-12-06 16:47:43', '2021-12-06 16:47:43'),
(32, 'bi', '428/13 khu vực 7', '0123456788', 'admin@localhost', 'jhjg', '2021-12-06 16:47:56', '2021-12-06 16:47:56'),
(33, 'bi', '428/13 khu vực 7', '0123456788', 'bi@gmail.com', 'fdfd', '2021-12-06 16:55:08', '2021-12-06 16:55:08'),
(34, 'bi', '428/13 khu vực 7', '0123456788', 'bi@gmail.com', 'fdfd', '2021-12-06 16:56:02', '2021-12-06 16:56:02'),
(35, 'bi', '428/13 khu vực 7', '0123456788', 'bi@gmail.com', 'fdfd', '2021-12-06 16:59:45', '2021-12-06 16:59:45'),
(36, 'bi', '428/13 khu vực 7', '0123456788', 'bi@gmail.com', 'fdfd', '2021-12-06 23:04:37', '2021-12-06 23:04:37'),
(37, 'bi', '428/13 khu vực 7', '0123456788', 'bi@gmail.com', 'fdfd', '2021-12-06 23:04:59', '2021-12-06 23:04:59'),
(38, 'bi', '428/13 khu vực 7', '0123456788', 'bi@gmail.com', 'fdfd', '2021-12-06 23:26:53', '2021-12-06 23:26:53'),
(39, 'bi', '428/13 khu vực 7', '0123456788', 'bi@gmail.com', 'fdfd', '2021-12-06 23:27:38', '2021-12-06 23:27:38'),
(40, 'bi', '428/13 khu vực 7', '0123456788', 'bi@gmail.com', 'fdfd', '2021-12-07 00:46:49', '2021-12-07 00:46:49'),
(41, 'gtdrgg', '428/13 khu vực 7', '0123456788', 'admin@localhost.com', 'fgfgfhf', '2021-12-07 00:58:33', '2021-12-07 00:58:33'),
(42, 'gtdrgg', '428/13 khu vực 7', '0123456788', 'admin@localhost.com', 'fgfgfhf', '2021-12-07 01:11:36', '2021-12-07 01:11:36'),
(43, 'gtdrgg', 'ad', '0123456788', 'vypham@gmail.com', 'fdfdfd', '2021-12-07 01:15:03', '2021-12-07 01:15:03'),
(44, 'bi123456', 'ad', '0127645345', 'admin@localhost', 'bị bom', '2021-12-07 08:56:11', '2021-12-07 08:56:11'),
(45, 'bi123', 'adđasdsds', '0127645345', 'admin@localhost', 'dddddd', '2021-12-07 08:59:33', '2021-12-07 08:59:33'),
(46, 'bi123', 'adđasdsds', '0127645345', 'admin@localhost', 'dddddd', '2021-12-07 09:00:30', '2021-12-07 09:00:30'),
(47, 'bi123', 'adđasdsds', '0127645345', 'admin@localhost', 'dddddd', '2021-12-07 09:13:08', '2021-12-07 09:13:08'),
(48, 'bi123', 'adđasdsds', '0127645345', 'admin@localhost', 'dddddd', '2021-12-07 09:13:08', '2021-12-07 09:13:08'),
(49, 'bi123', 'adđasdsds', '0127645345', 'admin@localhost', 'dddddd', '2021-12-07 09:14:05', '2021-12-07 09:14:05'),
(50, 'bi123', 'adđasdsds', '0127645345', 'admin@localhost', 'dddddd', '2021-12-07 09:14:26', '2021-12-07 09:14:26'),
(51, 'bi', '428/13 khu vực 7', '0123456788', 'admin@localhost', 'gfgdg', '2021-12-07 09:14:49', '2021-12-07 09:14:49'),
(52, 'bi', '428/13 khu vực 7', '0123456788', 'admin@localhost.com', 'ty', '2021-12-08 11:24:27', '2021-12-08 11:24:27'),
(53, 'bo', 'an binh', '0987654321', 'bo@gmail.com', 'làm ơn giao nhanh', '2021-12-21 03:25:51', '2021-12-21 03:25:51'),
(54, 'vy', '428/13 khu vực 5', '0987654321', 'vypham@gmail.com', 'ok', '2021-12-21 04:12:50', '2021-12-21 04:12:50'),
(55, 'bi', 'an binh', '0784637294', 'admin@localhost', 'ok', '2021-12-21 04:15:47', '2021-12-21 04:15:47'),
(56, 'vy', 'an binh', '0987654321', 'vypham@gmail.com', 'giao  nhanh', '2021-12-21 19:41:37', '2021-12-21 19:41:37'),
(57, 'vy', 'an binh', '0987654321', 'vypham@gmail.com', 'giao  nhanh', '2021-12-21 19:42:12', '2021-12-21 19:42:12'),
(58, 'vy', 'an binh', '0987654321', 'vypham@gmail.com', 'lẹ', '2021-12-22 08:42:42', '2021-12-22 08:42:42'),
(59, 'vy', 'an binh', '0987654321', 'vypham@gmail.com', 'lẹ', '2021-12-22 08:46:38', '2021-12-22 08:46:38'),
(60, 'vy', 'HCM', '0123456789', 'vy@gmail.com', 'a', '2023-11-13 11:19:45', '2023-11-13 11:19:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `description`, `image_path`, `image_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'slider 2', 'sfdfsgdg', '/storage/slider/1/PCwD0cZJZEdr8OKIkZ2u.jpg', 'quan_ao_nam1.jpg', '2021-10-08 10:30:57', '2021-10-08 11:18:55', '2021-10-08 11:18:55'),
(3, 'slider 1', 'slider 1', '/storage/slider/1/3OLyALivGut6VHbfdNAL.jpg', 'tui-deo-cheo.jpg', '2021-10-09 00:33:03', '2021-10-20 07:22:21', '2021-10-20 07:22:21'),
(4, 'slider 2r55525', 'sfsfa', '/storage/slider/1/zBDgA3Swa05YBdxluLjl.jpeg', 'dep1.jpeg', '2021-10-20 08:53:07', '2021-10-20 08:53:22', '2021-10-20 08:53:22'),
(5, 'GIẢM GIÁ', 'mua 2 tặng 1', '/storage/slider/1/wi2pIdaS3QXtCxl2cQVI.jpg', 'ao_len_doi.jpg', '2021-10-20 08:53:19', '2021-11-09 11:05:32', NULL),
(6, '100% Responsive Design', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '/storage/slider/1/nZgoNIyELwjLyIZTfpPj.jpg', 'girl2.jpg', '2021-11-03 09:39:14', '2021-11-09 11:06:36', '2021-11-09 11:06:36'),
(7, 'Free Ecommerce Template', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '/storage/slider/1/y0k3cSZwlAnnEdiTUmp6.jpg', 'girl3.jpg', '2021-11-03 09:42:29', '2021-11-09 11:06:32', '2021-11-09 11:06:32'),
(8, 'Free E-Commerce Template', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', '/storage/slider/1/XzgydkWBK2HY0w368N6S.jpg', 'girl1.jpg', '2021-11-03 09:42:50', '2021-11-09 11:06:29', '2021-11-09 11:06:29'),
(9, 'GIẢM GIÁ', 'Ngày phụ nữ giảm 50%', '/storage/slider/1/HWZzsPDhqU9fppzGus8Q.jpg', 'vay_do_1.jpg', '2021-11-06 08:27:32', '2021-11-09 11:07:07', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tags`
--

INSERT INTO `tags` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'aothun', '2021-11-08 12:26:10', '2021-11-08 12:26:10'),
(2, 'thoitrangnam', '2021-11-08 12:26:10', '2021-11-08 12:26:10'),
(3, 'aothunnam', '2021-11-08 12:26:10', '2021-11-08 12:26:10'),
(4, 'aohoodie', '2021-11-08 12:31:31', '2021-11-08 12:31:31'),
(5, 'streetwea', '2021-11-08 12:31:31', '2021-11-08 12:31:31'),
(6, 'quanao', '2021-11-08 12:37:15', '2021-11-08 12:37:15'),
(7, 'nam', '2021-11-08 12:37:15', '2021-11-08 12:37:15'),
(8, 'bộ', '2021-11-08 12:37:15', '2021-11-08 12:37:15'),
(9, 'quannam', '2021-11-08 12:42:33', '2021-11-08 12:42:33'),
(10, 'tuideocheo', '2021-11-08 12:43:57', '2021-11-08 12:43:57'),
(11, 'do', '2021-11-09 10:03:09', '2021-11-09 10:03:09'),
(12, 'aoxam', '2021-11-09 10:04:36', '2021-11-09 10:04:36'),
(13, 'setvest', '2021-11-09 10:07:32', '2021-11-09 10:07:32'),
(14, 'damtrang', '2021-11-09 10:08:53', '2021-11-09 10:08:53'),
(15, 'quansot', '2021-11-09 10:10:25', '2021-11-09 10:10:25'),
(16, 'quanjeandai', '2021-11-09 10:12:20', '2021-11-09 10:12:20'),
(17, 'quanongsuong', '2021-11-09 10:13:52', '2021-11-09 10:13:52'),
(18, 'babygaunguc', '2021-11-09 10:17:05', '2021-11-09 10:17:05'),
(19, 'carot', '2021-11-09 10:18:18', '2021-11-09 10:18:18'),
(20, 'babygaukengang', '2021-11-09 10:19:39', '2021-11-09 10:19:39'),
(21, '𝑪𝒂𝒅𝒊𝒈𝒂𝒏', '2021-11-09 10:21:19', '2021-11-09 10:21:19'),
(22, 'setbody', '2021-11-09 10:23:50', '2021-11-09 10:23:50'),
(23, 'aovaydoiditiec', '2021-11-09 10:29:36', '2021-11-09 10:29:36'),
(24, 'nude', '2021-11-09 10:31:27', '2021-11-09 10:31:27'),
(25, 'lendoi', '2021-11-09 10:33:28', '2021-11-09 10:33:28'),
(26, 'vaythundoi', '2021-11-09 10:36:34', '2021-11-09 10:36:34'),
(27, 'khunglong', '2021-11-09 10:39:09', '2021-11-09 10:39:09'),
(28, 'giaydecao', '2021-11-09 10:46:44', '2021-11-09 10:46:44'),
(29, 'rt', '2021-12-17 13:38:57', '2021-12-17 13:38:57'),
(30, 'rf', '2021-12-17 13:46:12', '2021-12-17 13:46:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thong_kes`
--

CREATE TABLE `thong_kes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ngay_order` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doanh_so` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `tong_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `thong_kes`
--

INSERT INTO `thong_kes` (`id`, `ngay_order`, `doanh_so`, `quantity`, `tong_order`, `created_at`, `updated_at`) VALUES
(1, '2023-01-01', '2000000', 90, 10, NULL, NULL),
(2, '2021-01-02', '6800000', 60, 8, NULL, NULL),
(3, '2021-02-03', '3000000', 45, 7, NULL, NULL),
(4, '2021-03-15', '4500000', 30, 9, NULL, NULL),
(5, '2021-06-01', '3000000', 15, 12, NULL, NULL),
(6, '2021-09-12', '8000000', 65, 30, NULL, NULL),
(7, '2021-10-01', '2800000', 32, 20, NULL, NULL),
(8, '2021-11-20', '2500000', 7, 6, NULL, NULL),
(9, '2021-11-23', '3600000', 40, 15, NULL, NULL),
(10, '2021-12-01', '5000000', 89, 19, NULL, NULL),
(15, '2021-12-21', '1810000', 10, 3, '2021-12-21 03:26:33', '2021-12-21 22:20:55'),
(11, '2021-12-03', '3240000', 13, 2, '2021-12-13 10:38:45', '2021-12-13 10:38:45'),
(12, '2021-12-06', '1132000', 12, 2, '2021-12-13 10:42:07', '2021-12-13 10:42:07'),
(13, '2021-12-07', '3450000', 51, 12, '2021-12-13 10:47:10', '2021-12-13 11:06:19'),
(14, '2021-12-09', '1730000', 10, 1, '2021-12-13 11:08:03', '2021-12-13 11:08:03'),
(16, '2021-12-22', '6228000', 50, 14, '2021-12-21 19:42:05', '2021-12-22 08:48:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'vy pham', 'vypham@gmail.com', NULL, '$2y$10$SdYOBqWTppEOesIi6eUPauNe2.KTmwpE.qx1Xi3RJWs.uQu7ttXt6', 'Cw1BgFjrAc5jNeecldp3ASToqfwwPajQpRxZPV8CsXZrt6jNYhOXXpW5PXzl', NULL, '2021-11-02 12:03:07', NULL),
(2, 'bi', 'bi@gmail.com', NULL, '$2y$10$HM8UH3coyVRGkj6xEFo4euW8vxPQbG/XBhXRrJAlixLW2rXu.8mA.', NULL, '2021-10-24 23:13:46', '2021-11-02 12:03:02', NULL),
(3, 'bi123456', 'bi123@gmail.com', NULL, '$2y$10$I.Hp6SvJOjVOB4N.8GcVeeZDpB1ZEc6hrrx4O5WPYw1YLXoS9rMwG', NULL, '2021-10-25 21:45:27', '2021-10-25 22:28:33', '2021-10-25 22:28:33'),
(4, 'bi123', 'bi123bhbgg@gmail.com', NULL, '$2y$10$L.iGI30AVUi0eKO1rFKeL.ViodCpsxZxLnCrd3AJmwe0KqNVWsApG', NULL, '2021-10-25 22:33:35', '2021-10-25 22:37:06', '2021-10-25 22:37:06');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `thong_kes`
--
ALTER TABLE `thong_kes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `thong_kes`
--
ALTER TABLE `thong_kes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
