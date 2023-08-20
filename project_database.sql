-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2023 at 08:58 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add admin', 1, 'add_admin'),
(2, 'Can change admin', 1, 'change_admin'),
(3, 'Can delete admin', 1, 'delete_admin'),
(4, 'Can view admin', 1, 'view_admin'),
(5, 'Can add bin', 2, 'add_bin'),
(6, 'Can change bin', 2, 'change_bin'),
(7, 'Can delete bin', 2, 'delete_bin'),
(8, 'Can view bin', 2, 'view_bin'),
(9, 'Can add member', 3, 'add_member'),
(10, 'Can change member', 3, 'change_member'),
(11, 'Can delete member', 3, 'delete_member'),
(12, 'Can view member', 3, 'view_member'),
(13, 'Can add driver', 4, 'add_driver'),
(14, 'Can change driver', 4, 'change_driver'),
(15, 'Can delete driver', 4, 'delete_driver'),
(16, 'Can view driver', 4, 'view_driver'),
(17, 'Can add log entry', 5, 'add_logentry'),
(18, 'Can change log entry', 5, 'change_logentry'),
(19, 'Can delete log entry', 5, 'delete_logentry'),
(20, 'Can view log entry', 5, 'view_logentry'),
(21, 'Can add permission', 6, 'add_permission'),
(22, 'Can change permission', 6, 'change_permission'),
(23, 'Can delete permission', 6, 'delete_permission'),
(24, 'Can view permission', 6, 'view_permission'),
(25, 'Can add group', 7, 'add_group'),
(26, 'Can change group', 7, 'change_group'),
(27, 'Can delete group', 7, 'delete_group'),
(28, 'Can view group', 7, 'view_group'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add content type', 9, 'add_contenttype'),
(34, 'Can change content type', 9, 'change_contenttype'),
(35, 'Can delete content type', 9, 'delete_contenttype'),
(36, 'Can view content type', 9, 'view_contenttype'),
(37, 'Can add session', 10, 'add_session'),
(38, 'Can change session', 10, 'change_session'),
(39, 'Can delete session', 10, 'delete_session'),
(40, 'Can view session', 10, 'view_session'),
(41, 'Can add delivery', 11, 'add_delivery'),
(42, 'Can change delivery', 11, 'change_delivery'),
(43, 'Can delete delivery', 11, 'delete_delivery'),
(44, 'Can view delivery', 11, 'view_delivery'),
(45, 'Can add complaint', 12, 'add_complaint'),
(46, 'Can change complaint', 12, 'change_complaint'),
(47, 'Can delete complaint', 12, 'delete_complaint'),
(48, 'Can view complaint', 12, 'view_complaint'),
(49, 'Can add feedback', 13, 'add_feedback'),
(50, 'Can change feedback', 13, 'change_feedback'),
(51, 'Can delete feedback', 13, 'delete_feedback'),
(52, 'Can view feedback', 13, 'view_feedback'),
(53, 'Can add ananda', 14, 'add_ananda'),
(54, 'Can change ananda', 14, 'change_ananda'),
(55, 'Can delete ananda', 14, 'delete_ananda'),
(56, 'Can view ananda', 14, 'view_ananda');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$PgwN0xKNuh3PKBfiQz62yE$+TrHdPRYAfOEMw18tFUjl9n0+hZIyonqFLz8/JnXOt8=', '2023-08-18 15:54:39.024443', 1, 'user', '', '', '', 1, 1, '2023-08-05 16:00:11.483342');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-08-05 16:01:10.624060', '1', 'ananda', 1, '[{\"added\": {}}]', 1, 1),
(2, '2023-08-05 16:01:23.246166', '2', 'chinmoy', 1, '[{\"added\": {}}]', 1, 1),
(3, '2023-08-05 16:02:29.877084', '3', 'ananna', 1, '[{\"added\": {}}]', 1, 1),
(4, '2023-08-05 16:03:02.418133', '1', 'wahid', 1, '[{\"added\": {}}]', 3, 1),
(5, '2023-08-05 16:03:38.372792', '2', 'puja', 1, '[{\"added\": {}}]', 3, 1),
(6, '2023-08-05 16:05:06.077760', '3', 'evan', 1, '[{\"added\": {}}]', 3, 1),
(7, '2023-08-05 16:14:03.114759', '4', 'ananna', 3, '', 4, 1),
(8, '2023-08-11 16:47:49.173004', '10', 'Complaint object (10)', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 12, 1),
(9, '2023-08-12 13:53:28.585039', '2', 'ananna', 1, '[{\"added\": {}}]', 1, 1),
(10, '2023-08-12 13:53:41.050002', '3', 'chinmoy', 1, '[{\"added\": {}}]', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(5, 'admin', 'logentry'),
(7, 'auth', 'group'),
(6, 'auth', 'permission'),
(8, 'auth', 'user'),
(9, 'contenttypes', 'contenttype'),
(1, 'home', 'admin'),
(14, 'home', 'ananda'),
(2, 'home', 'bin'),
(12, 'home', 'complaint'),
(11, 'home', 'delivery'),
(4, 'home', 'driver'),
(13, 'home', 'feedback'),
(3, 'home', 'member'),
(10, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-08-05 15:56:23.953191'),
(2, 'auth', '0001_initial', '2023-08-05 15:56:24.204747'),
(3, 'admin', '0001_initial', '2023-08-05 15:56:24.269594'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-08-05 15:56:24.274599'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-08-05 15:56:24.278603'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-08-05 15:56:24.317638'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-08-05 15:56:24.345867'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-08-05 15:56:24.369888'),
(9, 'auth', '0004_alter_user_username_opts', '2023-08-05 15:56:24.373892'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-08-05 15:56:24.406922'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-08-05 15:56:24.408083'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-08-05 15:56:24.413089'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-08-05 15:56:24.426101'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-08-05 15:56:24.438854'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-08-05 15:56:24.452866'),
(16, 'auth', '0011_update_proxy_permissions', '2023-08-05 15:56:24.457871'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-08-05 15:56:24.470883'),
(18, 'home', '0001_initial', '2023-08-05 15:56:24.525034'),
(19, 'home', '0002_alter_bin_driver_details', '2023-08-05 15:56:24.786311'),
(20, 'home', '0003_driver_user', '2023-08-05 15:56:24.823859'),
(21, 'home', '0004_remove_driver_user', '2023-08-05 15:56:24.871398'),
(22, 'home', '0005_driver_user', '2023-08-05 15:56:24.902645'),
(23, 'home', '0006_remove_driver_user', '2023-08-05 15:56:24.949013'),
(24, 'home', '0007_delete_driver', '2023-08-05 15:56:24.954017'),
(25, 'home', '0008_driver', '2023-08-05 15:56:24.972034'),
(26, 'sessions', '0001_initial', '2023-08-05 15:56:24.996056'),
(27, 'home', '0009_member_user', '2023-08-05 20:01:49.123828'),
(28, 'home', '0010_remove_member_user_driver_user', '2023-08-05 20:01:50.700334'),
(29, 'home', '0011_remove_driver_user', '2023-08-05 20:35:23.920305'),
(30, 'home', '0012_remove_driver_id_remove_member_id_and_more', '2023-08-09 08:19:46.003135'),
(31, 'home', '0013_delivery', '2023-08-09 08:21:51.952116'),
(32, 'home', '0014_delivery_schedule_delivery_date', '2023-08-09 08:51:23.242273'),
(33, 'home', '0015_complaint', '2023-08-09 17:34:41.104360'),
(34, 'home', '0016_alter_bin_driver_details', '2023-08-09 19:42:50.032531'),
(35, 'home', '0017_complaint_driver', '2023-08-09 19:50:28.354611'),
(36, 'home', '0018_remove_complaint_driver_remove_complaint_latitude_and_more', '2023-08-09 20:02:51.799788'),
(37, 'home', '0019_complaint_completed_at_complaint_status', '2023-08-11 08:19:01.537207'),
(38, 'home', '0020_feedback', '2023-08-11 15:22:12.134340'),
(39, 'home', '0021_alter_feedback_user', '2023-08-11 15:30:34.648405'),
(40, 'home', '0022_alter_complaint_image', '2023-08-11 16:46:46.213628'),
(41, 'home', '0023_delete_feedback', '2023-08-11 17:34:14.808958'),
(42, 'home', '0024_feedback', '2023-08-11 17:34:46.853910'),
(43, 'home', '0025_delete_admin', '2023-08-12 13:49:31.855654'),
(44, 'home', '0026_admin', '2023-08-12 13:50:44.530931'),
(45, 'home', '0027_remove_admin_id_alter_admin_username', '2023-08-12 13:57:57.162041'),
(46, 'home', '0028_bin_admin_details', '2023-08-12 14:02:52.572503'),
(47, 'home', '0029_feedback_average_rating1_feedback_average_rating2_and_more', '2023-08-12 15:02:18.815344'),
(48, 'home', '0030_remove_feedback_average_rating1_and_more', '2023-08-12 16:31:27.354953'),
(49, 'home', '0031_delivery_latitude_delivery_locality_and_more', '2023-08-16 22:18:14.838531'),
(50, 'home', '0032_remove_delivery_latitude_remove_delivery_locality_and_more', '2023-08-16 22:25:48.188646'),
(51, 'home', '0033_complaint_rating', '2023-08-16 23:39:42.910665'),
(52, 'home', '0034_ananda', '2023-08-18 15:59:52.417581'),
(53, 'home', '0035_delete_ananda', '2023-08-18 16:00:56.184077');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('scroddi46bez7wlrxqlqz8sx92g2i3an', '.eJxVjDsOwjAQBe_iGlnxL-ulpOcMltde4wBypDipEHeHSCmgfTPzXiLEba1h67yEKYuzUOL0u1FMD247yPfYbrNMc1uXieSuyIN2eZ0zPy-H-3dQY6_fmr3JgJgGhMIIVIwirZF8ctb6BB7ZuDLaokbyBEUbx1E7UIpBFTOI9wfcdTdp:1qSJhW:TXEyQX5fRZw1ZDngxbEl4bZ4PMcWvj68L8byvVTilC4', '2023-08-19 16:00:22.454345');

-- --------------------------------------------------------

--
-- Table structure for table `home_admin`
--

CREATE TABLE `home_admin` (
  `username` varchar(122) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_admin`
--

INSERT INTO `home_admin` (`username`, `password`) VALUES
('ananda', '21301635'),
('ananna', '20201038'),
('chinmoy', '21301720');

-- --------------------------------------------------------

--
-- Table structure for table `home_bin`
--

CREATE TABLE `home_bin` (
  `id` bigint(20) NOT NULL,
  `area` varchar(500) NOT NULL,
  `locality` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `latitude` varchar(20) NOT NULL,
  `longitude` varchar(20) NOT NULL,
  `driver_details_id` varchar(122) NOT NULL,
  `load_type` varchar(20) NOT NULL,
  `cycle_period` varchar(20) NOT NULL,
  `admin_details_id` varchar(122) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_bin`
--

INSERT INTO `home_bin` (`id`, `area`, `locality`, `city`, `latitude`, `longitude`, `driver_details_id`, `load_type`, `cycle_period`, `admin_details_id`) VALUES
(1, 'Gojnobi road', 'Mohakhali', 'Dhaka', '23.78102373268864', '90.40752681834554', 'rahim', 'Medium', 'Twice', 'ananda'),
(2, 'Gudaraghat', 'Maddhya Badda', 'Dhaka', '23.780496023663975', '90.4215305609171', 'rahim', 'High', 'Weekly', 'ananna'),
(3, 'Mintu avenue', 'Mirpur-13', 'Dhaka', '23.807382270944085', '90.37821248976908', 'rahim', 'High', 'Weekly', 'ananda'),
(4, 'DNCC Market', 'Gulshan-1', 'Dhaka', '23.78021956100412', '90.41561771361344', 'rahim', 'High', 'Weekly', 'chinmoy'),
(8, 'Genda bazaar', 'Anandapur', 'Dhaka', '23.833110972735614', '90.2623875492637', 'rajib', 'High', 'Weekly', 'chinmoy'),
(9, 'Kazipara', 'Mirpur', 'Dhaka', '23.7966915943977', '90.37290448673645', 'rajib', 'Medium', 'Weekly', 'ananda'),
(11, 'Boitakhali', 'East Badda', 'Dhaka', '23.772507153447908', '90.4341653208986', 'rafsan', 'High', 'Weekly', 'ananda');

-- --------------------------------------------------------

--
-- Table structure for table `home_complaint`
--

CREATE TABLE `home_complaint` (
  `id` bigint(20) NOT NULL,
  `area` varchar(500) NOT NULL,
  `locality` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `bin_id` bigint(20) DEFAULT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `rating` int(10) UNSIGNED DEFAULT NULL CHECK (`rating` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_complaint`
--

INSERT INTO `home_complaint` (`id`, `area`, `locality`, `image`, `description`, `created_at`, `user_id`, `bin_id`, `completed_at`, `status`, `rating`) VALUES
(14, 'Gudaraghat', 'Maddhya badda', 'images/images.jpg', 'There has plastics garbage.', '2023-08-12 16:29:44.682436', 'nimbu', 2, '2023-08-12 16:37:06.969211', 'Completed', 5),
(15, 'Gojnobi road', 'Mohakhali', 'images/32607538_2010801005628567_4017498621833379840_n---copy.jpg', 'It should remove.', '2023-08-12 16:33:45.613174', 'nimbu', 1, '2023-08-19 18:30:45.544073', 'Completed', 1),
(16, 'Kazipara', 'Mirpur', 'images/download.jpg', 'At the roadside.', '2023-08-12 16:44:10.919343', 'wahid', 9, '2023-08-19 18:32:09.795415', 'Completed', 1),
(17, 'Boitakhali', 'East Badda', 'images/OIP.jpg', 'Remove the waste', '2023-08-19 18:57:10.249744', 'evan', 11, NULL, 'not_completed', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `home_delivery`
--

CREATE TABLE `home_delivery` (
  `id` bigint(20) NOT NULL,
  `delivery_date` date NOT NULL,
  `plastic_collected` decimal(5,2) NOT NULL,
  `is_scheduled` tinyint(4) NOT NULL,
  `bin_id` bigint(20) NOT NULL,
  `driver_id` varchar(122) NOT NULL,
  `schedule_delivery_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_delivery`
--

INSERT INTO `home_delivery` (`id`, `delivery_date`, `plastic_collected`, `is_scheduled`, `bin_id`, `driver_id`, `schedule_delivery_date`) VALUES
(29, '2023-08-12', '10.00', 0, 2, 'rahim', NULL),
(30, '2023-08-13', '0.00', 1, 2, 'rahim', '2023-08-15'),
(35, '2023-08-17', '0.00', 1, 3, 'rahim', '2023-08-19'),
(36, '2023-08-20', '0.00', 1, 3, 'rahim', '2023-08-22');

-- --------------------------------------------------------

--
-- Table structure for table `home_driver`
--

CREATE TABLE `home_driver` (
  `username` varchar(122) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nid` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_driver`
--

INSERT INTO `home_driver` (`username`, `email`, `nid`, `phone`, `password`) VALUES
('rafsan', 'rafsan@gmail.com', '21635215', '01236547852', '22'),
('rahim', 'rahim@gmail.com', '2103256874', '01836954721', '333'),
('rajib', 'rajib@hotmail.com', '2365410895', '01952417863', '33');

-- --------------------------------------------------------

--
-- Table structure for table `home_feedback`
--

CREATE TABLE `home_feedback` (
  `id` bigint(20) NOT NULL,
  `rating1` int(10) UNSIGNED NOT NULL CHECK (`rating1` >= 0),
  `rating2` int(10) UNSIGNED NOT NULL CHECK (`rating2` >= 0),
  `rating3` int(10) UNSIGNED NOT NULL CHECK (`rating3` >= 0),
  `feedback` longtext NOT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `user_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_feedback`
--

INSERT INTO `home_feedback` (`id`, `rating1`, `rating2`, `rating3`, `feedback`, `submitted_at`, `user_id`) VALUES
(8, 5, 5, 10, 'It should be more smooth.', '2023-08-12 16:07:54.406721', 'nimbu'),
(10, 3, 4, 6, 'The website can be more stylized.', '2023-08-12 16:45:44.393751', 'wahid');

-- --------------------------------------------------------

--
-- Table structure for table `home_member`
--

CREATE TABLE `home_member` (
  `username` varchar(100) NOT NULL,
  `email` varchar(122) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(128) NOT NULL,
  `confirm_password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_member`
--

INSERT INTO `home_member` (`username`, `email`, `phone`, `password`, `confirm_password`) VALUES
('evan', 'evan@yahoo.com', '01365478951', '33', '33'),
('nimbu', 'nimbu@gmail.com', '01325478961', '00', '00'),
('puja', 'puja@gmail.com', '01789632145', '44', '11'),
('wahid', 'wahid@gmail.com', '01726354789', '33', '33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `home_admin`
--
ALTER TABLE `home_admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `home_bin`
--
ALTER TABLE `home_bin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `latitude` (`latitude`),
  ADD UNIQUE KEY `longitude` (`longitude`),
  ADD KEY `home_bin_driver_details_id_eda17660` (`driver_details_id`),
  ADD KEY `home_bin_admin_details_id_fe628468_fk_home_admin_username` (`admin_details_id`);

--
-- Indexes for table `home_complaint`
--
ALTER TABLE `home_complaint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_complaint_user_id_0f6df805_fk_home_member_username` (`user_id`),
  ADD KEY `home_complaint_bin_id_871b245a_fk_home_bin_id` (`bin_id`);

--
-- Indexes for table `home_delivery`
--
ALTER TABLE `home_delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_delivery_bin_id_609cb01e_fk_home_bin_id` (`bin_id`),
  ADD KEY `home_delivery_driver_id_2d3d1f31_fk_home_driver_username` (`driver_id`);

--
-- Indexes for table `home_driver`
--
ALTER TABLE `home_driver`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nid` (`nid`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `home_feedback`
--
ALTER TABLE `home_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_feedback_user_id_56f97b5a_fk_home_member_username` (`user_id`);

--
-- Indexes for table `home_member`
--
ALTER TABLE `home_member`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `home_bin`
--
ALTER TABLE `home_bin`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `home_complaint`
--
ALTER TABLE `home_complaint`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `home_delivery`
--
ALTER TABLE `home_delivery`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `home_feedback`
--
ALTER TABLE `home_feedback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `home_bin`
--
ALTER TABLE `home_bin`
  ADD CONSTRAINT `home_bin_admin_details_id_fe628468_fk_home_admin_username` FOREIGN KEY (`admin_details_id`) REFERENCES `home_admin` (`username`),
  ADD CONSTRAINT `home_bin_driver_details_id_eda17660_fk_home_driver_username` FOREIGN KEY (`driver_details_id`) REFERENCES `home_driver` (`username`);

--
-- Constraints for table `home_complaint`
--
ALTER TABLE `home_complaint`
  ADD CONSTRAINT `home_complaint_bin_id_871b245a_fk_home_bin_id` FOREIGN KEY (`bin_id`) REFERENCES `home_bin` (`id`),
  ADD CONSTRAINT `home_complaint_user_id_0f6df805_fk_home_member_username` FOREIGN KEY (`user_id`) REFERENCES `home_member` (`username`);

--
-- Constraints for table `home_delivery`
--
ALTER TABLE `home_delivery`
  ADD CONSTRAINT `home_delivery_bin_id_609cb01e_fk_home_bin_id` FOREIGN KEY (`bin_id`) REFERENCES `home_bin` (`id`),
  ADD CONSTRAINT `home_delivery_driver_id_2d3d1f31_fk_home_driver_username` FOREIGN KEY (`driver_id`) REFERENCES `home_driver` (`username`);

--
-- Constraints for table `home_feedback`
--
ALTER TABLE `home_feedback`
  ADD CONSTRAINT `home_feedback_user_id_56f97b5a_fk_home_member_username` FOREIGN KEY (`user_id`) REFERENCES `home_member` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
