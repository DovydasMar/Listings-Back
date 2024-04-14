-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 14, 2024 at 06:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baigiamasis`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `main_img_url` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `type` enum('sell','buy','rent') NOT NULL,
  `town_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `is_published` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `title`, `main_img_url`, `description`, `price`, `phone`, `type`, `town_id`, `user_id`, `category_id`, `created_at`, `is_published`) VALUES
(1, 'Skalbimo mašina', 'https://aws-obg-image-lb-2.tcl.com/content/dam/brandsite/region/in/blog/pc/detail/blog-october/the-history-of-the-washing-machine-banner.jpg', 'parduodama puiki skalbimo mašina, su džiovykle ir rūbų sulankstymo funkcija', 200, 861234567, 'sell', 1, 6, 1, '2024-04-04', 1),
(2, 'Senovinis televizorius', 'https://images.pexels.com/photos/5721808/pexels-photo-5721808.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'Minimaliai naudotas senovinis televizorius labai nebrangi nuoma', 300, 861234567, 'rent', 2, 7, 2, '2024-04-04', 1),
(3, 'Apvalus stalas', 'https://www.unisonhome.com/media/catalog/product/1/0/101135_gallery_1.jpg?quality=80&fit=bounds&height=700&width=700&canvas=700:700', 'Parduodame gražų apvalų stalą, tiks svetainėje ar valgomajame', 100, 861234567, 'sell', 3, 7, 3, '2024-04-04', 1),
(4, 'Marškinėliai', 'https://store.nytimes.com/cdn/shop/products/mens-1619-shirt-back_1024x1024.jpg?v=1580755800', 'Pirkčiau marškinėlius xl dydžio', 20, 861234567, 'buy', 4, 8, 4, '2024-04-04', 1),
(5, 'Kvapni žvakė', 'https://images.pexels.com/photos/1832562/pexels-photo-1832562.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'Parduodu savo gamybos kvepiančias žvakes', 5, 861234567, 'sell', 5, 8, 5, '2024-04-04', 1),
(6, 'Šaldytuvas', 'https://images.thdstatic.com/productImages/81464031-2c38-4d27-970f-97c23f9336d7/svn/platinum-steel-magic-chef-mini-fridges-hmdr45ps-64_600.jpg', 'Parduodu naujos gamybos šaldytuvą', 300, 861234567, 'sell', 1, 6, 1, '2024-04-04', 1),
(15, 'Laptop', 'https://www.varle.lt/static/uploads/products/281/nes/nesiojamas-kompiuteris-acer-aspire-5-a515-56-72mp_RE29RWc.jpg', 'parduodamas laptopas su gera vaizdo plokšte ir interneto jungtuku', 500, 861234567, 'sell', 2, 6, 2, '2024-04-12', 1),
(16, 'kėdė', 'https://www.easebaldai.lt/uploads/_CGSmartImage/kiruna-kede-ease-baldai_1604221407-3f019643347c29647010dd0aabc69455.jpg', 'parduodu labai patogią kėdę', 50, 861234567, 'sell', 5, 7, 3, '2024-04-12', 1),
(17, 'Menora', 'https://www.traveler.lt/Hanukkah-menorah-sidabro-spalvos-pilno-dyd%C5%BEio-ne-apjuodinti-thumb_298659/1-cdn.jpeg', ' septynšakė žvakidė', 20, 867654321, 'buy', 3, 7, 5, '2024-04-12', 1),
(18, 'plaukų džiovintuvas', 'https://m.media-amazon.com/images/I/51-Psx9gzfL._AC_SX679_.jpg', 'Dyson plaukų džiovintuvas, žmona liks laiminga', 899, 867654321, 'sell', 1, 8, 2, '2024-04-12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ads_pic`
--

CREATE TABLE `ads_pic` (
  `id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL,
  `ad_pic_1` varchar(255) NOT NULL,
  `ad_pic_2` varchar(255) NOT NULL,
  `ad_pic_3` varchar(255) NOT NULL,
  `ad_pic_4` varchar(255) NOT NULL,
  `ad_pic_5` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ads_pic`
--

INSERT INTO `ads_pic` (`id`, `ad_id`, `ad_pic_1`, `ad_pic_2`, `ad_pic_3`, `ad_pic_4`, `ad_pic_5`) VALUES
(1, 1, 'https://images.pexels.com/photos/6492062/pexels-photo-6492062.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/4824683/pexels-photo-4824683.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/5591460/pexels-photo-5591460.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/3935334/pexels-photo-3935334.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/7195881/pexels-photo-7195881.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(2, 2, 'https://images.pexels.com/photos/333984/pexels-photo-333984.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/3764958/pexels-photo-3764958.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/5721899/pexels-photo-5721899.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/5721862/pexels-photo-5721862.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/704555/pexels-photo-704555.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(3, 3, 'https://images.pexels.com/photos/1826387/pexels-photo-1826387.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/7303982/pexels-photo-7303982.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/5546848/pexels-photo-5546848.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/5712533/pexels-photo-5712533.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/6373308/pexels-photo-6373308.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(4, 4, 'https://images.pexels.com/photos/12738120/pexels-photo-12738120.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/18178451/pexels-photo-18178451/free-photo-of-man-in-a-black-t-shirt-and-white-shorts.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/18727927/pexels-photo-18727927/free-photo-of-man-with-bag-on-head.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/5055438/pexels-photo-5055438.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/13457430/pexels-photo-13457430.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(5, 5, 'https://images.pexels.com/photos/5782652/pexels-photo-5782652.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/6311837/pexels-photo-6311837.jpeg', 'https://images.pexels.com/photos/6798396/pexels-photo-6798396.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/6798410/pexels-photo-6798410.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/7532475/pexels-photo-7532475.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(6, 6, 'https://images.pexels.com/photos/2343467/pexels-photo-2343467.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/9031968/pexels-photo-9031968.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/7534209/pexels-photo-7534209.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/6994185/pexels-photo-6994185.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', 'https://images.pexels.com/photos/5824883/pexels-photo-5824883.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Namų priežiūra'),
(2, 'Elektronika'),
(3, 'Baldai'),
(4, 'Rūbai'),
(5, 'Žvakės');

-- --------------------------------------------------------

--
-- Table structure for table `towns`
--

CREATE TABLE `towns` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `population` int(11) NOT NULL,
  `area` int(11) NOT NULL,
  `img_url` varchar(255) NOT NULL,
  `img_1` varchar(255) NOT NULL,
  `img_2` varchar(255) NOT NULL,
  `img_3` varchar(255) NOT NULL,
  `isDeleted` int(11) NOT NULL DEFAULT 0,
  `description` varchar(350) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `towns`
--

INSERT INTO `towns` (`id`, `name`, `population`, `area`, `img_url`, `img_1`, `img_2`, `img_3`, `isDeleted`, `description`) VALUES
(1, 'Vilnius', 580020, 401, 'https://i.guim.co.uk/img/media/f5c68e604a3362e94b269355bbef7df8f0d5a3bb/0_358_5364_3218/master/5364.jpg?width=1200&quality=85&auto=format&fit=max&s=525140f3898526e42a9f96491492c322', 'https://upload.wikimedia.org/wikipedia/commons/2/2a/Vilnius_old_town_by_Augustas_Didzgalvis.jpg', 'https://www.nordicexperience.com/wp-content/uploads/2018/03/AdobeStock_121560526-1619x1080.jpeg', 'https://s3.eu-central-1.wasabisys.com/alkas/alkas.lt/1/2023/02/GoVilniusJanuary25thVilnius700thBirthdayCelebrationGabrielKhiterer4.jpg', 0, 'Vilnius – Lietuvos sostinė. Vilniaus apskrities, Vilniaus rajono savivaldybės ir Vilniaus miesto savivaldybės centras, yra 20 seniūnijų. Arkivyskupijos centras, nuo 1579 m. – universitetinis miestas. Sostinėje veikia aukščiausios valdžios institucijos.'),
(2, 'Kaunas', 300000, 157, 'https://adventures.com/media/20342/s-kaunas-city-panoramic-view-summer-church-architecture-buildings-old-town-lithuania.jpg', 'https://www.stenalinetravel.com/content/dam/stenaline/en/images/destinations/lithuania/20160816_kaunas-castle.jpeg', 'https://api.delfi.lt/media-api-image-cropper/v1/b4423050-7d6c-11ed-a027-29ed55e34c8c.jpg?w=1200&h=800&fx=0.5&fy=0.25', 'https://visit.kaunas.lt/assets/NAUJOS-NUOTRAUKOS/_resampled/FillWyIxMDUwIiwiNTI1Il0/oldtown-20210000.jpg', 0, 'Kaunas – antrasis pagal dydį Lietuvos miestas šalies centrinėje dalyje, Nemuno ir Neries santakoje. Svarbus pramonės, transporto, mokslo ir kultūros centras, Laikinoji sostinė. Kauno miesto savivaldybė, Kauno rajono savivaldybės centras, katalikų arkivyskupijos centras.'),
(3, 'Klaipėda', 150000, 98, 'https://api.delfi.lt/media-api-image-cropper/v1/306bbdc0-d9c7-11ed-8d57-417dbd941fdd.jpg?noup&w=1200&h=711&ch=1&cw=0.9978&cx=0.0022&cy=0&r=16:9&fx=0.5&fy=0.25', 'https://workinlithuania.com/app/uploads/2022/10/DJI_0457-HDR-scaled.jpg', 'https://www.vle.lt/uploads/_CGSmartImage/45896_1-2cdb56a6819f3e474b72f20fed692157.jpg', 'https://klaipeda.diena.lt/sites/default/files/Vilniausdiena/Vartotoju%20zona/V.Oskominiene%40diena.lt/20230207dji_0240.jpg', 0, 'Klaipėda – trečias pagal gyventojų skaičių ir plotą Lietuvos miestas, įsikūręs Vakarų Lietuvoje, Pajūrio žemumoje, ties Kuršių marių ir Baltijos jūros santakos vieta. Miestas taip pat yra Klaipėdos apskrities administracinis centras.'),
(4, 'Šiauliai', 100000, 81, 'https://www.siauliai.lt/upload/photos/imagetools1-608f97377e0c21.78726427.jpg', 'https://www.vietosdvasia.lt/wp-content/uploads/2022/06/Siauliai.jpg', 'https://www.siauliai.lt/upload/files/2023/03/01/t310413538-518885983426904-1897579326575088744-n.jpg', 'https://pastataikalba.lt/siauliai/wp-content/uploads/sites/5/2022/08/vandentiekio-bokstas_%C2%A9Norbert-Tukaj-IMG_3707-scaled.jpeg', 0, 'Šiauliai – miestas šiaurės Lietuvoje, ketvirtasis pagal gyventojų skaičių šalies miestas. Šiaulių apskrities ir Šiaulių rajono savivaldybės administracinis centras, Šiaulių miesto savivaldybė. Šiauliai yra svarbus ekonominis ir susisiekimo centras, jame veikia Vilniaus universiteto Šiaulių akademija, miestas yra katalikiškos vyskupystės centras.'),
(5, 'Panevėžys', 90000, 50, 'https://www.lrt.lt/img/2023/09/05/1581765-441765-756x425.jpg', 'https://cdn.britannica.com/04/145304-050-0E8CE127/St-Peter-Pauls-Church-Lith-Panevezys.jpg', 'https://alkas.lt/wp-content/uploads/2021/08/IMG_4288-1000x570.jpg', 'https://sekunde.lt/content/uploads/2017/05/Panevezys-is-lektuvo-4-gint-virsus.jpg', 0, 'Panevėžys – šiaurės Lietuvos miestas. Išsidėstęs abipus Nevėžio, dešiniajame krante – Panevėžio senamiestis, kairiajame – Naujamiestis, dabartinis miesto centras.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar_url` varchar(255) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `avatar_url`, `created_at`) VALUES
(6, 'Dovydelis', 'Dovydas@margarian.lt', '$2b$10$WCwyMAHEvHuHmc5JmRcECOx2dR/yq5o1Vcg3Z/pMY1wszGsFgVpuK', 'test', '2024-04-04'),
(7, 'Augustina', 'Augustina@margarian.lt', '$2b$10$E6kDZQq9urxaTalwaNHPUOd3RqRqdsFj06LliPoijvXCKp4pDEBLO', '', '2024-04-04'),
(8, 'Dovydas', 'email@mail.com', '$2b$10$7eS3pPRyDNERRJKevcOdTOmlXaO4X35xPzYQfDxcIzfYcSktevrGu', 'https://images.pexels.com/photos/2380792/pexels-photo-2380792.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', '2024-04-09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ads_pic`
--
ALTER TABLE `ads_pic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `towns`
--
ALTER TABLE `towns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ads_pic`
--
ALTER TABLE `ads_pic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `towns`
--
ALTER TABLE `towns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
