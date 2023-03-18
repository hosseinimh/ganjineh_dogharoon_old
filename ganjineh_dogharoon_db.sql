-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 18, 2023 at 04:16 PM
-- Server version: 8.0.11
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ganjineh_dogharoon_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2023_03_16_000001_create_tbl_errors_table', 1),
(3, '2023_03_16_000002_create_tbl_users_table', 1),
(4, '2023_03_16_000003_create_tbl_villages_table', 1),
(5, '2023_03_16_000004_create_tbl_banks_table', 1),
(6, '2023_03_16_000005_create_tbl_relationships_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_banks`
--

CREATE TABLE `tbl_banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_banks`
--

INSERT INTO `tbl_banks` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'وجستا کیان', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(2, 'دولت میزبانی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(3, 'مهندس ژیله باطنی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(4, 'استاد وفا هدایت', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(5, 'شورانگیز خدایی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(6, 'آفری دانایی‌فر', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(7, 'کامکار شیرمحمدی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(8, 'سمیر لاجوردی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(9, 'روزبه آریان‌پور', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(10, 'دکتر آران فاطمی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(11, 'ویس سحاب', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(12, 'ارشد بیگی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(13, 'نیماد شاملو', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(14, 'رازان موحد', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(15, 'آقای مرتضی خوئینی‌ها', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(16, 'فرجاد هومن', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(17, 'شیده چگنی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(18, 'پرتام الهام', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(19, 'معین کاشی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(20, 'فریان فتاحی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(21, 'هیرمند پستا', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(22, 'رفا مفتح', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(23, 'امیربانو سروستانی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(24, 'دکتر مستانه کاشی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(25, 'رامتین فنایی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(26, 'آفاق افخم', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(27, 'بختیار یلدا', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(28, 'آیسان فولادوند', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(29, 'آرین طالقانی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(30, 'نوبان زارع', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(31, 'مهندس ارشن گل', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(32, 'رخسارا ترکاشوند', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(33, 'یکتا فرشیدورد', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(34, 'مهلقا زهرایی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(35, 'خانم راشین محجوب', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(36, 'مرتضی اشکوری', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(37, 'نازک قنبری', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(38, 'افسون مجتبوی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(39, 'استاد تابان نیلوفری', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(40, 'مرجانه برزویی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(41, 'فریده قهستانی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(42, 'فروردین بختیاری', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(43, 'گرزم حجتی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(44, 'منصور شجاعی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(45, 'فرنود سبزواری', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(46, 'استاد تینا محجوبی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(47, 'سرواد چگنی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(48, 'مهرگان یلدا', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(49, 'کورنگ سروش', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(50, 'افشین بدخشانی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_errors`
--

CREATE TABLE `tbl_errors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_relationships`
--

CREATE TABLE `tbl_relationships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_relationships`
--

INSERT INTO `tbl_relationships` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'سلم تبریزی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(2, 'دکتر ساویز رسولی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(3, 'کیان بیگی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(4, 'استاد مانا ظریف', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(5, 'یامین مجتبوی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(6, 'پرنگ فانی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(7, 'ستاه عقیلی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(8, 'ایمان رفیعی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(9, 'مرزبان کاملی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(10, 'فروردین مرتضوی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(11, 'یوسف خوئینی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(12, 'نازآفرین خدایی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(13, 'رادمهر جمادی', '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(14, 'نوژان حائری', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(15, 'جلیله علی‌زمانی', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(16, 'رشاد عقیلی', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(17, 'سنجر صدیقی', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(18, 'پرشاد سبحانی', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(19, 'کرشمه شادمهر', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(20, 'دارمان حبیبی', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(21, 'خانم بوران افخم', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(22, 'آوین دستغیب', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(23, 'تیکا مجاهد', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(24, 'فریدون چلبی', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(25, 'مهفام سیف‌زاده', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(26, 'اوشنر پایدار', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(27, 'سوگل هراتی', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(28, 'استاد پیوند هاشمی', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(29, 'تابش مصاحب', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(30, 'جوانه اللهیاری', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(31, 'بهفر جهانبگلو', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(32, 'لسان مصباح‌زاده', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(33, 'دکتر ماهرخ اعتبار', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(34, 'ایران بانو ترکاشوند', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(35, 'هادی محدثی', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(36, 'دریا باغچه‌بان', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(37, 'هما انوار', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(38, 'نادی مصاحب', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(39, 'سلم اللهیاری', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(40, 'فاتک خسروپناه', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(41, 'دکتر شیروان اعلم', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(42, 'کیومرث رحمانیان', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(43, 'فردوس فنی‌زاده', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(44, 'آوین هروی', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(45, 'فرنام ابوذر', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(46, 'مهندس شیوا حقیقی', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(47, 'لیما سپه‌وند', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(48, 'طلعت خوئینی', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(49, 'مهرام نهاوندی', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(50, 'وینا گنجی', '2023-03-16 16:56:27', '2023-03-16 16:56:27', NULL),
(51, 'ااااا2', '2023-03-16 20:27:18', '2023-03-16 20:27:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `is_active` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `username`, `password`, `name`, `family`, `mobile`, `role`, `is_active`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'dzare@example.com', '$2y$10$MxOAgGPl.nBWEzdrXbJUHeC7TH4cb7BophdhQpd.VSeRjYB1ZFgai', 'کلباد', 'فانی', '84865284827', 2, 1, 'PyaRSGk37CXgeEoqaSNfDp9hOBOR1qUaF7etPtsO9WEmjkElNXhFtx4myouN', '2023-03-16 16:56:20', '2023-03-16 16:56:20', NULL),
(2, 'vrahmani@example.com', '$2y$10$aq09N2k0VqSny9/kDJEGV.4ML5z91xuYOny.QAH3/.MIJfzqINBQW', 'پاتونه', 'رحماندوست', '50009384308', 2, 1, 'd3mU06C760Oz5EZ8X40YUabvOD7wDU8ivf8acbGwiMMi4b268yaEdiBT8gHn', '2023-03-16 16:56:21', '2023-03-16 16:56:21', NULL),
(3, 'jyazdani@example.org', '$2y$10$M3awmAbm94qORN8DTeiFUe9WG.BlXScIsKwELxTxvRa77szhQmXc6', 'شیدا', 'نقدی', '58046317136', 2, 1, 'kpp8CqQMdn', '2023-03-16 16:56:21', '2023-03-16 16:56:21', NULL),
(4, 'farsi.milad@example.net', '$2y$10$3tUQ1ue/hSlQZnjQv/7KGuUhRkXjOJkbWgzYjCtdWBb.ujzaVMSSK', 'آذرگون', 'مجتبایی', '52785039677', 1, 0, '0Lh7EqLBru', '2023-03-16 16:56:21', '2023-03-16 16:56:21', NULL),
(5, 'rajaei.pedram@example.net', '$2y$10$F6VZ5QnLvpK16TFSeeWa6eidU95D5WipGxlruqk69YQYtvKkX3gIu', 'فرناز', 'غضنفری', '84558881260', 1, 0, 'V1uibFmilf', '2023-03-16 16:56:21', '2023-03-16 16:56:21', NULL),
(6, 'maryam.yazdi@example.net', '$2y$10$XIh4g4T/S/R.ipVYFUeS1u3TRoztYJyzI4h4IZ3OO5tnsKD6RT6Um', 'مهروند', 'ندوشن', '31135519309', 1, 0, 'nVmFhuWvPu', '2023-03-16 16:56:21', '2023-03-16 16:56:21', NULL),
(7, 'nasrin65@example.net', '$2y$10$ijCAlOTttnTWxRebMcm17OBfUlSZl.caN954DawhRIAN.VevthKhe', 'سهند', 'طالقانی', '68347103074', 2, 0, 'KlKUSNW8s3', '2023-03-16 16:56:21', '2023-03-16 16:56:21', NULL),
(8, 'ffarsi@example.org', '$2y$10$3aBf0T7aTOFN2jh5xzuTzOaSC8c6y6GD3qu0mFWTZUM7k2p/9TIDq', 'فردید', 'سحاب', '76650621973', 2, 1, 'W4h4qSbnIf', '2023-03-16 16:56:21', '2023-03-16 16:56:21', NULL),
(9, 'farzaneh16@example.net', '$2y$10$/lmDwhDue6Dz.Mu38qCy1OHYMR2vnzROH5HKQB4QdMytnAL5n/dZC', 'شیدفر', 'عالی', '87549642822', 1, 1, 'nh2avXAEYi', '2023-03-16 16:56:21', '2023-03-16 16:56:21', NULL),
(10, 'aria69@example.net', '$2y$10$aiW8tk6nQsF6WK6mX8kl7.TYmzupu4w4mvZCp/98Ra64AHOIOZN46', 'پرشاد', 'پناهنده', '37384693780', 2, 1, 'pbAV8bECOK', '2023-03-16 16:56:21', '2023-03-16 16:56:21', NULL),
(11, 'younes.qazwini@example.org', '$2y$10$9J5JvEjyTjbCF0xwFZbnJu.Dr3iTX7EPWjn36XgL3ckc7yB334VUO', 'شریفه', 'بیگی', '39954345030', 1, 0, 'ZHz5Is4Pfa', '2023-03-16 16:56:21', '2023-03-16 16:56:21', NULL),
(12, 'qalizadeh@example.net', '$2y$10$6//WD1LIPAWRocd9OzNT0eZ2aOYkbvlYU0CbUVEREMKkRLbi/eH22', 'بهاک', 'بزرگی', '63966552208', 1, 1, '2B3MU2Q67H', '2023-03-16 16:56:21', '2023-03-16 16:56:21', NULL),
(13, 'khomeini.rostam@example.org', '$2y$10$8eqVmSsCOjiW1Mc20MgNg.sI49VTzJGGgaoum6UilbSXHecesXGh2', 'بنان', 'علی‌آبادی', '86185291973', 2, 0, 'JrmuhAEkEf', '2023-03-16 16:56:21', '2023-03-16 16:56:21', NULL),
(14, 'atoosa.ghorbani@example.com', '$2y$10$UKDZE/Q9kogwNBk4g3hOfuFGW1bVHuujpKJqRpuRo6pye96t6k1Yy', 'موسی', 'همدانی', '85366538897', 1, 1, '1meEdeEZkE', '2023-03-16 16:56:21', '2023-03-16 16:56:21', NULL),
(15, 'zandi.shapour@example.net', '$2y$10$BqC8rOKdxRVRJB74y4NrAOZBx457pNJ7GVJl.r1Ab9CsbCz.4ZChO', 'سیتا', 'شیخ‌الاسلامی', '30346705965', 2, 1, 'uVpUNUWaIx', '2023-03-16 16:56:22', '2023-03-16 16:56:22', NULL),
(16, 'ramin.shirazi@example.org', '$2y$10$CbVV0xLxWiICAM3ChmWBy.IMdf0m.b7kR1lIimajnO8lwrH7B3LKm', 'آذرداد', 'واعظ‌زاده', '17339335310', 2, 0, 'FSVNrpFwjz', '2023-03-16 16:56:22', '2023-03-16 16:56:22', NULL),
(17, 'shervin82@example.com', '$2y$10$sMAxmKAyuHfy4DZfgJknm.I3C8EQfi3sLccZVbefsiEj.pLMZu6Tu', 'درنا', 'اشتری', '79935556917', 1, 0, 'nWNgWsw6ai', '2023-03-16 16:56:22', '2023-03-16 16:56:22', NULL),
(18, 'nasrin30@example.com', '$2y$10$WQu6Fj4El4uYQRUWA1LPiu2W5w81h89A1KLFI79qNXywCZb6PND/W', 'نازیتا', 'هاشمی', '51335656941', 2, 0, 'bNFZsL8ZgG', '2023-03-16 16:56:22', '2023-03-16 16:56:22', NULL),
(19, 'majidi.babak@example.org', '$2y$10$A8PPjCwZIyNtTCXHmPwWr.2jSEUgcfbW3KHto7b9jCNXJXsSpkbVG', 'جعفر', 'جمادی', '68335671839', 2, 1, 'P1YOwR0nlj', '2023-03-16 16:56:22', '2023-03-16 16:56:22', NULL),
(20, 'saman.karimi@example.org', '$2y$10$fhJAoAG8XIzZRGDPJ01gPebUKW0QeW4AFz3R5D3iwhh942f79b94m', 'شاندیز', 'باطنی', '17432156293', 2, 0, 'FJBxBKtuyf', '2023-03-16 16:56:22', '2023-03-16 16:56:22', NULL),
(21, 'salari.farrokh@example.com', '$2y$10$2yzC7NIsvrR0NdHoiZxVp.UsS7oO7321IewgHtM.iSqo15taKaYxO', 'سلماز', 'میرسپاسی', '30191368151', 2, 0, 'kOmcjjhDIm', '2023-03-16 16:56:22', '2023-03-16 16:56:22', NULL),
(22, 'mohammady.kazem@example.com', '$2y$10$A5e28avi/Xj2clmwL.0KV.8B/lkaf3aVNoO5dnh6QU1wP2GNpcrfW', 'مهسا', 'بهاور', '70781320039', 1, 1, 'jY9ZkNu67G', '2023-03-16 16:56:22', '2023-03-16 16:56:22', NULL),
(23, 'mithra.namazi@example.net', '$2y$10$yNAmH6E2JF3pYh/.mS5gp.wFrlMVDjZzB8YOkxv1NUzNTzX/m7W/G', 'فریّن چهر', 'طالب‌زاده', '54898443554', 2, 0, 'uqC4HmEgHa', '2023-03-16 16:56:22', '2023-03-16 16:56:22', NULL),
(24, 'maziar.talebi@example.com', '$2y$10$POIYT4dOvYqMq1RC/lo2tu7p17E93PQmrILmbEdUBnHDHpFPbXsoW', 'رویا', 'فانی', '48728765118', 2, 1, 'lSeAjZdJBz', '2023-03-16 16:56:22', '2023-03-16 16:56:22', NULL),
(25, 'amir93@example.org', '$2y$10$qK75rtuhM6ibQ/wOeucqWuppV2O7bEmusw4GT0dirXOFhPp/DeA0O', 'رسول', 'سرمد', '34796394309', 2, 0, 'b3UUQrNoUm', '2023-03-16 16:56:22', '2023-03-16 16:56:22', NULL),
(26, 'mahmoud.ghasemi@example.org', '$2y$10$0h8qAAsG1NpeM9PQJCY5bu9qCDDBQo7W.8m8urMPJISUmP/hoZRi6', 'فریّن چهر', 'حائری', '79135479939', 2, 0, 'WB29nUB0xl', '2023-03-16 16:56:22', '2023-03-16 16:56:22', NULL),
(27, 'tabatabaei.farhad@example.com', '$2y$10$vwQNwqIqC6JHzEVlJuTtXOQ7/hd6l2TKqccGe7ws6zn6dkkWQOsNi', 'دولت', 'لنکرانی', '19124649445', 2, 0, 'kR8kXe2Hzs', '2023-03-16 16:56:22', '2023-03-16 16:56:22', NULL),
(28, 'pghasemi@example.org', '$2y$10$57W4Ag0H0wibP6szt0USr.JquYNiyuroGJrgKlL9.OPy0GM9Mh6RW', 'کوشا', 'قنبری', '23340342547', 1, 1, 'ul6hEpcfZK', '2023-03-16 16:56:22', '2023-03-16 16:56:22', NULL),
(29, 'ajavadi@example.com', '$2y$10$y6/KyUUl8kvhVEo//WltGufaXHP3QyA10OaJhqSrueBkwy2SbFY/y', 'بلاش', 'انوار', '80149189124', 1, 1, 'QGS323u6TS', '2023-03-16 16:56:23', '2023-03-16 16:56:23', NULL),
(30, 'ghorbani.soraya@example.org', '$2y$10$Zhn1vUXZS1vyK.9/4cjPE.TmkB7H399h1RXNSpD8k7SJaVZVyd4se', 'نازگل', 'هراتی', '18802926552', 2, 0, 'ktCrczDAPq', '2023-03-16 16:56:23', '2023-03-16 16:56:23', NULL),
(31, 'qyazdani@example.com', '$2y$10$27OjLzrJitETvL8Fncyqc.59DtsQQ56Ly1BvOpUGxF5kJsspxEx.W', 'گلرخ', 'رهنما', '60265757718', 2, 1, 'w095g3C6Me', '2023-03-16 16:56:23', '2023-03-16 16:56:23', NULL),
(32, 'tousi.sohrab@example.com', '$2y$10$VUfGegZCxzwU.cPMy6k2UOMo6RBNarNBYcp0cMDhp/pd7BSV8FOqO', 'فریبرز', 'قنبری', '95628577154', 2, 0, 'B6GX9mGila', '2023-03-16 16:56:23', '2023-03-16 16:56:23', NULL),
(33, 'hijazi.roksaneh@example.net', '$2y$10$dgKPfqBa/ONGcEhOsBo4C.1k.nUjl60XnYf9oHpIpp6.iaSWiIlfe', 'حور', 'پازوکی', '87409725603', 1, 1, 'Ii4nhJeXz3', '2023-03-16 16:56:23', '2023-03-16 16:56:23', NULL),
(34, 'kyazdi@example.com', '$2y$10$7SsE5v9KlEoR8e5DzSbLeemozdPZachh6AhGXelCuZQsvMaertV9m', 'کوشیار', 'مهدی‌پور', '73714286214', 1, 1, '0qmFl5sjAx', '2023-03-16 16:56:23', '2023-03-16 16:56:23', NULL),
(35, 'rostam27@example.net', '$2y$10$0ZvuEwUUXwQUXyhj4ILzz./y4vwnYPpI6diiVOklyGt6unscLzVmy', 'توران', 'ناظری', '56976506720', 2, 0, '0aIhYzlqIj', '2023-03-16 16:56:23', '2023-03-16 16:56:23', NULL),
(36, 'davoud.abdullahi@example.com', '$2y$10$g9E64QZNT6zPpniSFs6KluTN5wTazvrj5Fw6RRnK0EEjD5OGUxfvy', 'تیرداد', 'واعظ‌زاده', '80729870248', 1, 0, 'c8mZCHyD6i', '2023-03-16 16:56:23', '2023-03-16 16:56:23', NULL),
(37, 'mina.abdullahi@example.com', '$2y$10$SPyDCJKDoWL.zUTznma//.OuB8OYqgPsfajWqiolYS5RCNwv6yxAi', 'عزیزه', 'مرتضوی', '91480771335', 2, 0, 'Wpts1Gtunu', '2023-03-16 16:56:23', '2023-03-16 16:56:23', NULL),
(38, 'abedini.hossein@example.com', '$2y$10$S/KXr0eS07RCTY.y7Cnra.0aLf.JZC7FH0FyTtskHPXaPj5Nd7VuS', 'مهربانو', 'کاکاوند', '57144361862', 2, 1, 'p898v7nGX5', '2023-03-16 16:56:23', '2023-03-16 16:56:23', NULL),
(39, 'hsalemi@example.com', '$2y$10$L3AfxhW8zYGwoUomy6QosOWsTNS7qR51TDkHmZ/3ZYu2qhviiKycO', 'فرزان', 'میرباقری', '91846221176', 1, 0, 'ASunHVMjkd', '2023-03-16 16:56:23', '2023-03-16 16:56:23', NULL),
(40, 'laleh.rezaei@example.org', '$2y$10$wMjeDsfxxTAJxK3Xg2V/re13vkLMtj2Uxf948OMMKFNJOvJOx169O', 'آران', 'کاملی', '44876685971', 2, 0, 'JdWWeZ6waC', '2023-03-16 16:56:23', '2023-03-16 16:56:23', NULL),
(41, 'mahmoudieh.arian@example.com', '$2y$10$Npp2MKVhvsLRjTjF48DOQenjUCw5ySKgrgCTuKQN/FBkksT9vlyPi', 'مجید', 'مجتهد', '62225623385', 2, 0, 'vXzt8GjIXx', '2023-03-16 16:56:23', '2023-03-16 16:56:23', NULL),
(42, 'gasadi@example.org', '$2y$10$94jeh6fFH9BrUCLCo26hfuNtfyBTqDj/IX7WbPUXt3.cVn.UDJ35W', 'ایده', 'صباغ', '45224784013', 1, 1, 'LzHNQTaQi4', '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(43, 'niloufar14@example.com', '$2y$10$b45oLFd7cDLxK1sfintgBugMtPJlm5klqPrUjWFvHEhBoRtY/h5ie', 'ملیک', 'گل', '16885261194', 2, 0, '3IcQD8qzBP', '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(44, 'farahani.fereshteh@example.org', '$2y$10$7YQ5Q3rbM10T/GmIBS6EzObLPb1ca3JKLONv9uAKUlIS/ewRLFmRq', 'بینا', 'آهی', '28872973394', 1, 1, 'vYjSitnh4h', '2023-03-16 16:56:24', '2023-03-17 20:30:14', NULL),
(45, 'vsoroush@example.net', '$2y$10$ReuGOYnIXTIuMpAz.bnXSe0A.Y8AJy6W0H0swG4nUW9nJKKcCLcGe', 'پرخیده', 'لاهوتی', '26605617883', 1, 0, '4Mc7t3c1N9', '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(46, 'kazem85@example.com', '$2y$10$3SBn0p9YW1rPVH7Igsm5PevZqsKQrMgBWi5DicasiN1RJwpqda6hO', 'سوگلی', 'قانعی', '75517954037', 2, 0, 'OJ5CBGMOZT', '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(47, 'hoda.tousi@example.net', '$2y$10$vWCHFDi1lz7O33BbD3ohb.JQMzwI106/5UFBQt0If7tZ25FX50MDq', 'میلاد', 'نیلوفری', '72020766733', 2, 0, '0QROJk28Tp', '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(48, 'nalci.niloufar@example.com', '$2y$10$sEiQOZ5TZLOixzN6R9TlbeQzJOfJYKtPE9m2y1fGB5ccnJexixM/S', 'شیوه', 'حیاتی', '87989120040', 2, 1, 'ngWwUrISFN', '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(49, 'farhad.yazdi@example.org', '$2y$10$w2r9gwfUOWDG74zvYNpGPuC6tBhjHba/DLgbfZ32hRbX67STisj/O', 'فراز', 'روحانی', '99676856313', 1, 0, 'vpq1auqOnx', '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(50, 'shervin.kadivar@example.org', '$2y$10$1JOERjzb32pqf3B9jEF8nO9MTvcbrkIzBEMs0C/yMW1UZze8mfg8.', 'کیهان', 'لنکرانی', '59115909671', 1, 0, 'viwSwpq4iE', '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_villages`
--

CREATE TABLE `tbl_villages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_villages`
--

INSERT INTO `tbl_villages` (`id`, `name`, `district_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'جهانیار خدایی', 2, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(2, 'میثاق شاملو', 1, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(3, 'آریانو فرمانفرمائیان', 2, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(4, 'گشتاسب محمدی', 2, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(5, 'هوشنگ آیتی', 2, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(6, 'هیربد باغچه‌بان', 1, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(7, 'سمراد اعتبار', 1, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(8, 'سامین نجفی', 2, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(9, 'کاوان پایدار', 1, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(10, 'سلم راسخ', 1, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(11, 'آتوسا خیابانی', 1, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(12, 'مهندس آرتای محمدی', 1, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(13, 'شهیار ابطحی', 2, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(14, 'فریمان میرباقری', 1, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(15, 'شیرین بانو خسروپناه', 2, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(16, 'آیه خسروپناه', 2, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(17, 'خانم جلوه اوستا', 1, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(18, 'مهرام هومن', 1, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(19, 'دینا فرامرزی', 2, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(20, 'نشواد واعظ', 1, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(21, 'فرّخ محمدی', 2, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(22, 'تینا شیخ‌الاسلامی', 1, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(23, 'رامین دخت سراج', 2, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(24, 'مهداد خمسه', 1, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(25, 'نازیتا دستغیب', 2, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(26, 'پردیس شریعتمداری', 2, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(27, 'بهامین زین‌الدین', 2, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(28, 'مهندس نرسی مظفر', 2, '2023-03-16 16:56:24', '2023-03-16 16:56:24', NULL),
(29, 'زری سبزواری', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(30, 'سپنتا همدانی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(31, 'زند اصفهانی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(32, 'سلمه شیدا', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(33, 'انوشیروان استادی', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(34, 'پدرام افخمی', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(35, 'به آذین حقانی', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(36, 'دلبر لنکرانی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(37, 'شادی پازارگاد', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(38, 'درنا معارف', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(39, 'نیاز همدانی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(40, 'خانم ریماز میردامادی', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(41, 'نرسی نیشابوری', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(42, 'عزیزه انوار', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(43, 'فرلاس صانعی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(44, 'آویده لاهوتی', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(45, 'دکتر رشاد فروتن', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(46, 'ارجمند چنگیزی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(47, 'پیرایه آهی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(48, 'مهندس آراد میرباقری', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(49, 'ایرج شیخ‌الاسلامی', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(50, 'توکا سروستانی', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(51, 'فرزان ابوذر', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(52, 'فرنگ الهام', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(53, 'راهزاد صدیق', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(54, 'شهرا خاموشی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(55, 'شوکا واعظی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(56, 'حریره قمیشی', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(57, 'پورکار جهانبگلو', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(58, 'گیو بهاور', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(59, 'دریا دل شعبانی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(60, 'خانم نیکدخت زنوزی', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(61, 'پرشاد معین', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(62, 'لیلاس عقیلی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(63, 'استاد شاهد خاتمی', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(64, 'استاد مهتاب دستغیب', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(65, 'نادر خوئینی‌ها', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(66, 'میثم انوار', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(67, 'ملکه مفتاح', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(68, 'شادورد آقاجری', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(69, 'محسن رحمانیان', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(70, 'زراسب ارسباران', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(71, 'استاد نصیر پیوندی', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(72, 'آقای کیومرث رفیعی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(73, 'جواد روحانی', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(74, 'شمسا بزرگیان', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(75, 'فرنگ میزبانی', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(76, 'دکتر آریان موسوی', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(77, 'بهمنیار اعتبار', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(78, 'سیتا خراسانی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(79, 'ظریفه آهنگری', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(80, 'جهان بانو تبریزی', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(81, 'سوسنک آهنگری', 2, '2023-03-16 16:56:25', '2023-03-17 14:34:29', NULL),
(82, 'غنچه کلباسی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(83, 'مهندس رامونا علی‌آبادی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(84, 'برسام روحانی', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(85, 'هومان عصار', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(86, 'شیرزاد شادمهر', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(87, 'آذربُد امین‌زاده', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(88, 'زرّین تاج عبادی', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(89, 'عفت رجایی', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(90, 'کلباد هاشمی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(91, 'دکتر مهراشک سحابی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(92, 'مهندس شبپر جنتی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(93, 'نازبانو پیران', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(94, 'نادی پازارگاد', 2, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(95, 'سروش انتظامی', 1, '2023-03-16 16:56:25', '2023-03-16 16:56:25', NULL),
(96, 'آقای زروان پستا', 1, '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(97, 'آذرگل سیف‌زاده', 1, '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(98, 'نصرت اعتماد', 2, '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(99, 'یاوند کاکاوند', 1, '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(100, 'مهرآرا جنتی', 2, '2023-03-16 16:56:26', '2023-03-16 16:56:26', NULL),
(101, 'fffff', 2, '2023-03-17 11:23:58', '2023-03-17 14:13:41', NULL),
(102, '32e32e32e', 2, '2023-03-17 11:24:07', '2023-03-17 11:24:07', NULL),
(103, '0000', 1, '2023-03-17 14:39:22', '2023-03-17 14:39:22', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `tbl_banks`
--
ALTER TABLE `tbl_banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_errors`
--
ALTER TABLE `tbl_errors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_relationships`
--
ALTER TABLE `tbl_relationships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tbl_users_username_unique` (`username`);

--
-- Indexes for table `tbl_villages`
--
ALTER TABLE `tbl_villages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_banks`
--
ALTER TABLE `tbl_banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tbl_errors`
--
ALTER TABLE `tbl_errors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_relationships`
--
ALTER TABLE `tbl_relationships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `tbl_villages`
--
ALTER TABLE `tbl_villages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
