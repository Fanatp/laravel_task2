-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Вер 05 2021 р., 18:04
-- Версія сервера: 8.0.19
-- Версія PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `laravel_task2`
--

-- --------------------------------------------------------

--
-- Структура таблиці `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2021-09-05 07:55:43', '2021-09-05 07:55:43'),
(2, NULL, 1, 'Category 2', 'category-2', '2021-09-05 07:55:43', '2021-09-05 07:55:43');

-- --------------------------------------------------------

--
-- Структура таблиці `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int UNSIGNED NOT NULL,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'voyager::seeders.data_rows.roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(61, 7, 'institut_belongstomany_profession_relationship', 'relationship', 'professions', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Profession\",\"table\":\"professions\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"institut_profession\",\"pivot\":\"1\",\"taggable\":\"0\"}', 3),
(63, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(64, 10, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(65, 10, 'skill_belongstomany_profession_relationship', 'relationship', 'professions', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Profession\",\"table\":\"professions\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"profession_skill\",\"pivot\":\"1\",\"taggable\":\"0\"}', 3),
(66, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(67, 11, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(68, 11, 'profession_belongstomany_institut_relationship', 'relationship', 'instituts', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Institut\",\"table\":\"instituts\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"institut_profession\",\"pivot\":\"1\",\"taggable\":null}', 3);

-- --------------------------------------------------------

--
-- Структура таблиці `data_types`
--

CREATE TABLE `data_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2021-09-05 07:55:43', '2021-09-05 07:55:43'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2021-09-05 07:55:43', '2021-09-05 07:55:43'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(7, 'instituts', 'instituts', 'Institut', 'Instituts', 'voyager-company', 'App\\Models\\Institut', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-09-05 11:21:24', '2021-09-05 11:50:22'),
(10, 'skills', 'skills', 'Skill', 'Skills', NULL, 'App\\Models\\Skill', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2021-09-05 11:32:59', '2021-09-05 11:34:43'),
(11, 'professions', 'professions', 'Profession', 'Professions', 'voyager-key', 'App\\Models\\Profession', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":\"name\",\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-09-05 11:47:50', '2021-09-05 11:47:50');

-- --------------------------------------------------------

--
-- Структура таблиці `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `instituts`
--

CREATE TABLE `instituts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `instituts`
--

INSERT INTO `instituts` (`id`, `name`) VALUES
(1, 'Institut_Ernest Thiel'),
(2, 'Institut_Liliane Price'),
(3, 'Institut_Prof. Nasir Gutkowski Sr.'),
(4, 'Institut_Angelo Ebert MD'),
(5, 'Institut_Dee Larkin II'),
(6, 'Institut_Ernest Rau'),
(7, 'Institut_Elfrieda Mraz III'),
(8, 'Institut_Mr. Kaley Goldner IV'),
(9, 'Institut_Prof. Lavon Effertz'),
(10, 'Institut_Jacinto Stiedemann'),
(11, 'Institut_Maribel Robel I'),
(12, 'Institut_Laisha Satterfield'),
(13, 'Institut_Helene Conroy'),
(14, 'Institut_Nasir Hackett'),
(15, 'Institut_Marjorie Cummings'),
(16, 'Institut_Kara Batz'),
(17, 'Institut_Hugh Crona IV'),
(18, 'Institut_Mrs. Carmen Jerde'),
(19, 'Institut_Mr. Brenden Beahan V'),
(20, 'Institut_Gloria Hyatt'),
(21, 'Institut_Adriel Corwin'),
(22, 'Institut_Kaya Altenwerth'),
(23, 'Institut_Tomas Ward'),
(24, 'Institut_Sterling Herman'),
(25, 'Institut_Dan Crooks'),
(26, 'Institut_Mr. Ezekiel Dare'),
(27, 'Institut_Arthur Wunsch'),
(28, 'Institut_Reina Fahey'),
(29, 'Institut_Leann Wilderman'),
(30, 'Institut_Abbigail O\'Keefe');

-- --------------------------------------------------------

--
-- Структура таблиці `institut_profession`
--

CREATE TABLE `institut_profession` (
  `id` bigint UNSIGNED NOT NULL,
  `profession_id` bigint UNSIGNED NOT NULL,
  `institut_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `institut_profession`
--

INSERT INTO `institut_profession` (`id`, `profession_id`, `institut_id`, `created_at`, `updated_at`) VALUES
(1, 28, 5, NULL, NULL),
(2, 16, 5, NULL, NULL),
(3, 30, 20, NULL, NULL),
(4, 16, 20, NULL, NULL),
(5, 16, 12, NULL, NULL),
(6, 27, 12, NULL, NULL),
(7, 27, 21, NULL, NULL),
(8, 27, 21, NULL, NULL),
(9, 22, 25, NULL, NULL),
(10, 22, 27, NULL, NULL),
(11, 22, 29, NULL, NULL),
(12, 19, 22, NULL, NULL),
(13, 2, 24, NULL, NULL),
(14, 5, 24, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2021-09-05 07:55:42', '2021-09-05 07:55:42');

-- --------------------------------------------------------

--
-- Структура таблиці `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int UNSIGNED NOT NULL,
  `menu_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2021-09-05 07:55:42', '2021-09-05 07:55:42', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2021-09-05 07:55:42', '2021-09-05 07:55:42', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2021-09-05 07:55:42', '2021-09-05 07:55:42', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2021-09-05 07:55:42', '2021-09-05 07:55:42', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2021-09-05 07:55:42', '2021-09-05 07:55:42', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2021-09-05 07:55:42', '2021-09-05 07:55:42', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2021-09-05 07:55:42', '2021-09-05 07:55:42', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2021-09-05 07:55:42', '2021-09-05 07:55:42', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2021-09-05 07:55:42', '2021-09-05 07:55:42', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2021-09-05 07:55:42', '2021-09-05 07:55:42', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 8, '2021-09-05 07:55:43', '2021-09-05 07:55:43', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 6, '2021-09-05 07:55:43', '2021-09-05 07:55:43', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 7, '2021-09-05 07:55:44', '2021-09-05 07:55:44', 'voyager.pages.index', NULL),
(14, 1, 'Instituts', '', '_self', 'voyager-company', '#000000', NULL, 15, '2021-09-05 11:21:24', '2021-09-05 11:51:13', 'voyager.instituts.index', 'null'),
(16, 1, 'Skills', '', '_self', 'voyager-params', '#000000', NULL, 17, '2021-09-05 11:33:00', '2021-09-05 11:51:35', 'voyager.skills.index', 'null'),
(17, 1, 'Professions', '', '_self', 'voyager-key', NULL, NULL, 18, '2021-09-05 11:47:50', '2021-09-05 11:47:50', 'voyager.professions.index', NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(29, '2021_09_05_110728_create_skills_table', 3),
(30, '2021_09_05_110754_create_professions_table', 3),
(31, '2021_09_05_110831_create_instituts_table', 3),
(32, '2021_09_05_111102_create_skill_profession_institut_table', 3),
(33, '2021_09_05_114850_create_skill_profession_institut_table', 4),
(34, '2021_09_05_120835_create_profession_skill_table', 5),
(35, '2021_09_05_120947_create_profession_institut_table', 5),
(36, '2021_09_05_122013_create_profession_skill_table', 6),
(37, '2021_09_05_123023_create_institut_profession_table', 7);

-- --------------------------------------------------------

--
-- Структура таблиці `pages`
--

CREATE TABLE `pages` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-09-05 07:55:44', '2021-09-05 07:55:44');

-- --------------------------------------------------------

--
-- Структура таблиці `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблиці `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(2, 'browse_bread', NULL, '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(3, 'browse_database', NULL, '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(4, 'browse_media', NULL, '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(5, 'browse_compass', NULL, '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(6, 'browse_menus', 'menus', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(7, 'read_menus', 'menus', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(8, 'edit_menus', 'menus', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(9, 'add_menus', 'menus', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(10, 'delete_menus', 'menus', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(11, 'browse_roles', 'roles', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(12, 'read_roles', 'roles', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(13, 'edit_roles', 'roles', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(14, 'add_roles', 'roles', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(15, 'delete_roles', 'roles', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(16, 'browse_users', 'users', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(17, 'read_users', 'users', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(18, 'edit_users', 'users', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(19, 'add_users', 'users', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(20, 'delete_users', 'users', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(21, 'browse_settings', 'settings', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(22, 'read_settings', 'settings', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(23, 'edit_settings', 'settings', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(24, 'add_settings', 'settings', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(25, 'delete_settings', 'settings', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(26, 'browse_categories', 'categories', '2021-09-05 07:55:43', '2021-09-05 07:55:43'),
(27, 'read_categories', 'categories', '2021-09-05 07:55:43', '2021-09-05 07:55:43'),
(28, 'edit_categories', 'categories', '2021-09-05 07:55:43', '2021-09-05 07:55:43'),
(29, 'add_categories', 'categories', '2021-09-05 07:55:43', '2021-09-05 07:55:43'),
(30, 'delete_categories', 'categories', '2021-09-05 07:55:43', '2021-09-05 07:55:43'),
(31, 'browse_posts', 'posts', '2021-09-05 07:55:43', '2021-09-05 07:55:43'),
(32, 'read_posts', 'posts', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(33, 'edit_posts', 'posts', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(34, 'add_posts', 'posts', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(35, 'delete_posts', 'posts', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(36, 'browse_pages', 'pages', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(37, 'read_pages', 'pages', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(38, 'edit_pages', 'pages', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(39, 'add_pages', 'pages', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(40, 'delete_pages', 'pages', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(41, 'browse_instituts', 'instituts', '2021-09-05 11:21:24', '2021-09-05 11:21:24'),
(42, 'read_instituts', 'instituts', '2021-09-05 11:21:24', '2021-09-05 11:21:24'),
(43, 'edit_instituts', 'instituts', '2021-09-05 11:21:24', '2021-09-05 11:21:24'),
(44, 'add_instituts', 'instituts', '2021-09-05 11:21:24', '2021-09-05 11:21:24'),
(45, 'delete_instituts', 'instituts', '2021-09-05 11:21:24', '2021-09-05 11:21:24'),
(51, 'browse_skills', 'skills', '2021-09-05 11:33:00', '2021-09-05 11:33:00'),
(52, 'read_skills', 'skills', '2021-09-05 11:33:00', '2021-09-05 11:33:00'),
(53, 'edit_skills', 'skills', '2021-09-05 11:33:00', '2021-09-05 11:33:00'),
(54, 'add_skills', 'skills', '2021-09-05 11:33:00', '2021-09-05 11:33:00'),
(55, 'delete_skills', 'skills', '2021-09-05 11:33:00', '2021-09-05 11:33:00'),
(56, 'browse_professions', 'professions', '2021-09-05 11:47:50', '2021-09-05 11:47:50'),
(57, 'read_professions', 'professions', '2021-09-05 11:47:50', '2021-09-05 11:47:50'),
(58, 'edit_professions', 'professions', '2021-09-05 11:47:50', '2021-09-05 11:47:50'),
(59, 'add_professions', 'professions', '2021-09-05 11:47:50', '2021-09-05 11:47:50'),
(60, 'delete_professions', 'professions', '2021-09-05 11:47:50', '2021-09-05 11:47:50');

-- --------------------------------------------------------

--
-- Структура таблиці `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', 'a059b11c7d1d4e7f9dbc924598df2b2b45314ad1faae1fbab62ee49e6800721e', '[\"*\"]', NULL, '2021-09-05 10:08:42', '2021-09-05 10:08:42'),
(2, 'App\\Models\\User', 1, 'auth_token', '9fbb66bc62ea47721bebef141b4d64c3619c2baa8111371bb7c63f726cfcd790', '[\"*\"]', '2021-09-05 11:03:23', '2021-09-05 10:09:59', '2021-09-05 11:03:23');

-- --------------------------------------------------------

--
-- Структура таблиці `posts`
--

CREATE TABLE `posts` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2021-09-05 07:55:44', '2021-09-05 07:55:44');

-- --------------------------------------------------------

--
-- Структура таблиці `professions`
--

CREATE TABLE `professions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `professions`
--

INSERT INTO `professions` (`id`, `name`) VALUES
(1, 'Profession_Jewel Dickinson'),
(2, 'Profession_Rex Predovic'),
(3, 'Profession_Kurtis Lehner'),
(4, 'Profession_Thad Metz Jr.'),
(5, 'Profession_Jeanie Runolfsdottir II'),
(6, 'Profession_Ms. Amira Cronin I'),
(7, 'Profession_Layne Schinner'),
(8, 'Profession_Emilia Stracke'),
(9, 'Profession_Elton Stark DVM'),
(10, 'Profession_Dr. Saige Hirthe'),
(11, 'Profession_Stella Hammes'),
(12, 'Profession_Mr. Adan Abshire Jr.'),
(13, 'Profession_Prof. Ramiro Howell'),
(14, 'Profession_Prof. Marc Bahringer V'),
(15, 'Profession_Yasmin Pouros'),
(16, 'Profession_Dr. Jennyfer Volkman'),
(17, 'Profession_Miss Ebba Reilly'),
(18, 'Profession_Lyric Mohr'),
(19, 'Profession_Dr. Greta Kemmer V'),
(20, 'Profession_Prof. Magnus Romaguera PhD'),
(21, 'Profession_Mekhi Wyman'),
(22, 'Profession_Miss Leora Yost'),
(23, 'Profession_Shaylee Beer'),
(24, 'Profession_Marlee Schulist'),
(25, 'Profession_Brandi Sipes'),
(26, 'Profession_Vernie Bergnaum Jr.'),
(27, 'Profession_Abbey Kris'),
(28, 'Profession_Charity Crooks'),
(29, 'Profession_Prof. Camryn Cormier'),
(30, 'Profession_Dr. Minerva Goodwin');

-- --------------------------------------------------------

--
-- Структура таблиці `profession_skill`
--

CREATE TABLE `profession_skill` (
  `id` bigint UNSIGNED NOT NULL,
  `profession_id` bigint UNSIGNED NOT NULL,
  `skill_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `profession_skill`
--

INSERT INTO `profession_skill` (`id`, `profession_id`, `skill_id`, `created_at`, `updated_at`) VALUES
(1, 27, 5, NULL, NULL),
(2, 27, 17, NULL, NULL),
(3, 27, 5, NULL, NULL),
(4, 27, 17, NULL, NULL),
(5, 28, 10, NULL, NULL),
(6, 9, 28, NULL, NULL),
(7, 25, 19, NULL, NULL),
(8, 25, 26, NULL, NULL),
(9, 25, 6, NULL, NULL),
(10, 22, 19, NULL, NULL),
(11, 17, 9, NULL, NULL),
(12, 17, 26, NULL, NULL),
(13, 17, 9, NULL, NULL),
(14, 17, 26, NULL, NULL),
(15, 22, 26, NULL, NULL),
(16, 22, 26, NULL, NULL),
(17, 30, 26, NULL, NULL),
(18, 13, 26, NULL, NULL),
(19, 19, 26, NULL, NULL),
(20, 1, 8, NULL, NULL),
(21, 1, 29, NULL, NULL),
(22, 3, 29, NULL, NULL),
(23, 18, 29, NULL, NULL),
(24, 29, 29, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблиці `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2021-09-05 07:55:42', '2021-09-05 07:55:42'),
(2, 'user', 'Normal User', '2021-09-05 07:55:42', '2021-09-05 07:55:42');

-- --------------------------------------------------------

--
-- Структура таблиці `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Структура таблиці `skills`
--

CREATE TABLE `skills` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `skills`
--

INSERT INTO `skills` (`id`, `name`) VALUES
(1, 'Skill_Mrs. Carlie McKenzie Sr.'),
(2, 'Skill_Jacinthe Little'),
(3, 'Skill_Jakayla Schroeder V'),
(4, 'Skill_Mrs. Marianna Rice V'),
(5, 'Skill_Cooper Volkman'),
(6, 'Skill_Charity Huel'),
(7, 'Skill_Prof. Monique Powlowski PhD'),
(8, 'Skill_Amya Rutherford'),
(9, 'Skill_Duane Corkery'),
(10, 'Skill_Arely Turcotte'),
(11, 'Skill_Mossie Effertz'),
(12, 'Skill_Mr. Jerome Schaefer'),
(13, 'Skill_Lucious Morissette MD'),
(14, 'Skill_Dr. Dominic Marquardt'),
(15, 'Skill_Lori Stark'),
(16, 'Skill_Prof. Haskell Rohan'),
(17, 'Skill_Mina Rodriguez'),
(18, 'Skill_Joannie Kautzer'),
(19, 'Skill_George Steuber'),
(20, 'Skill_Warren Hintz'),
(21, 'Skill_River Grady'),
(22, 'Skill_Prof. Ruthie Wiza II'),
(23, 'Skill_Adrienne Barrows'),
(24, 'Skill_Mr. Ray Kulas'),
(25, 'Skill_Herminio Weimann'),
(26, 'Skill_Monserrat Schuster'),
(27, 'Skill_Sonia Graham'),
(28, 'Skill_Damien Borer'),
(29, 'Skill_Jerome Donnelly'),
(30, 'Skill_Alexanne Klocko');

-- --------------------------------------------------------

--
-- Структура таблиці `translations`
--

CREATE TABLE `translations` (
  `id` int UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2021-09-05 07:55:44', '2021-09-05 07:55:44'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2021-09-05 07:55:44', '2021-09-05 07:55:44');

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$m0npJyMPP62u5B20xKkxlecOqvd7YIO7WF9ZoiI9kzY6T42PlYv9q', 'oUcWTCrbFzBPSGPQMLPPYQgm6wqqVcXmWUKEL9VFAsgSAxV9J7PnHPTAPXKd', '{\"locale\":\"ru\"}', '2021-09-05 07:55:43', '2021-09-05 11:57:45'),
(2, 1, 'Василь', 'fanatu072@gmail.com', 'users/default.png', NULL, '$2y$10$QQcQJOEtKeRokxH6ueh1gu4HXpjSdggTSSJlZudRk3/hDxNAsT6vO', NULL, '{\"locale\":\"ru\"}', '2021-09-05 11:59:24', '2021-09-05 11:59:24');

-- --------------------------------------------------------

--
-- Структура таблиці `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Індекси таблиці `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Індекси таблиці `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Індекси таблиці `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Індекси таблиці `instituts`
--
ALTER TABLE `instituts`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `institut_profession`
--
ALTER TABLE `institut_profession`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institut_profession_profession_id_foreign` (`profession_id`),
  ADD KEY `institut_profession_institut_id_foreign` (`institut_id`);

--
-- Індекси таблиці `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Індекси таблиці `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Індекси таблиці `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Індекси таблиці `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Індекси таблиці `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Індекси таблиці `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Індекси таблиці `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Індекси таблиці `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Індекси таблиці `professions`
--
ALTER TABLE `professions`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `profession_skill`
--
ALTER TABLE `profession_skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profession_skill_profession_id_foreign` (`profession_id`),
  ADD KEY `profession_skill_skill_id_foreign` (`skill_id`);

--
-- Індекси таблиці `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Індекси таблиці `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Індекси таблиці `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Індекси таблиці `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT для таблиці `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблиці `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблиці `instituts`
--
ALTER TABLE `instituts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблиці `institut_profession`
--
ALTER TABLE `institut_profession`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблиці `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблиці `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT для таблиці `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT для таблиці `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `professions`
--
ALTER TABLE `professions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблиці `profession_skill`
--
ALTER TABLE `profession_skill`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблиці `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблиці `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблиці `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `institut_profession`
--
ALTER TABLE `institut_profession`
  ADD CONSTRAINT `institut_profession_institut_id_foreign` FOREIGN KEY (`institut_id`) REFERENCES `instituts` (`id`),
  ADD CONSTRAINT `institut_profession_profession_id_foreign` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `profession_skill`
--
ALTER TABLE `profession_skill`
  ADD CONSTRAINT `profession_skill_profession_id_foreign` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`id`),
  ADD CONSTRAINT `profession_skill_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
