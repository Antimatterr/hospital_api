-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2022 at 09:28 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lattice_assgmt`
--

-- --------------------------------------------------------

--
-- Table structure for table `lattice_hospital`
--

CREATE TABLE `lattice_hospital` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lattice_hospital`
--

INSERT INTO `lattice_hospital` (`id`, `name`) VALUES
(1, 'Apollo Hospital'),
(2, 'Jawaharlal Nehru Medical College and Hospital'),
(3, 'Indira Gandhi Institute of Medical Sciences (IGIMS)'),
(4, 'AIIMS - All India Institute Of Medical Science');

-- --------------------------------------------------------

--
-- Table structure for table `lattice_patient`
--

CREATE TABLE `lattice_patient` (
  `id` int(11) NOT NULL,
  `psych_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lattice_patient`
--

INSERT INTO `lattice_patient` (`id`, `psych_id`, `hospital_id`, `name`, `email`, `address`, `phone`, `password`, `image`) VALUES
(1, 1, 1, 'sid', 'sid@gmail.com', 'sanjaynagar banagalroe', '+917888887651', 'secret', NULL),
(2, 2, 1, 'asdasda', 'sid@gmail.com', 'asdad', '+917888887651', 'dadas', 'wdaadada'),
(3, 3, 1, 'dafsfdfsdfsd', 'ssfdfsd', 'sdfsfsfs', '234342432342', 'asaasda', 'qqdd'),
(4, 4, 1, 'wwwwwwwwwwwwww', 'wwwwwwwwwwwwww', 'wwwwwwwwwwww', '242343242', '2342dadasd', 'qwed'),
(5, 5, 1, 'finn', 'fin@gmail.com', 'delhi a hsi haoh', '+916756758944', 'Secret2', NULL),
(6, 6, 2, 'sam', 'sam@gmail.com', 'hni 23  bengaluru idiranaagar', '+911231231234', 'Secret23', 'http://localhost:3000/uploads\\\\1660931067072-94271322.jpg'),
(7, 7, 2, 'sam', 'sam@gmail.com', 'hni 23  bengaluru idiranaagar', '+911231231234', 'Secret23', 'http://localhost:3000/uploads\\\\1660931067072-94271322.jpg'),
(8, 8, 2, 'sam', 'sam@gmail.com', 'hni 23 bengaluru idiranaagar', '+911231231234', 'Secret23', 'http://localhost:3000/uploads\\\\1660931067072-94271322.jpg'),
(9, 9, 2, 'sam', 'sam@gmail.com', 'hni 23 bengaluru idiranaagar', '+911231231234', 'Secret23', 'http://localhost:3000/uploads\\\\1660931067072-94271322.jpg'),
(10, 10, 2, 'sam', 'sam@gmail.com', 'hni 23 bengaluru idiranaagar', '+911231231234', 'Secret23', 'http://localhost:3000/uploads\\\\1660931067072-94271322.jpg'),
(11, 11, 3, 'sam', 'sam@gmail.com', 'hni 23 bengaluru idiranaagar', '+911231231234', 'Secret23', 'http://localhost:3000/uploads\\\\1660931067072-94271322.jpg'),
(12, 12, 3, 'sam', 'sam@gmail.com', 'hni 23 bengaluru idiranaagar', '+911231231234', 'Secret23', 'http://localhost:3000/uploads\\\\1660931067072-94271322.jpg'),
(13, 13, 3, 'sam', 'sam@gmail.com', 'hni 23 bengaluru idiranaagar', '+911231231234', 'Secret23', 'http://localhost:3000/uploads\\\\1660931067072-94271322.jpg'),
(14, 14, 3, 'sam', 'sam@gmail.com', 'hni 23 bengaluru idiranaagar', '+911231231234', 'Secret23', 'http://localhost:3000/uploads\\\\1660931067072-94271322.jpg'),
(15, 15, 3, 'sam', 'sam@gmail.com', 'hni 23 bengaluru idiranaagar', '+911231231234', 'Secret23', 'http://localhost:3000/uploads\\\\1660931067072-94271322.jpg'),
(16, 16, 4, 'sam', 'sam@gmail.com', 'hni 23 bengaluru idiranaagar', '+911231231234', 'Secret23', 'http://localhost:3000/uploads\\\\1660931067072-94271322.jpg'),
(17, 17, 4, 'sam', 'sam@gmail.com', 'hni 23 bengaluru idiranaagar', '+911231231234', 'Secret23', 'http://localhost:3000/uploads\\\\1660931067072-94271322.jpg'),
(18, 18, 4, 'sam', 'sam@gmail.com', 'hni 23 bengaluru idiranaagar', '+911231231234', 'Secret23', 'http://localhost:3000/uploads\\\\1660931067072-94271322.jpg'),
(19, 19, 4, 'sam', 'sam@gmail.com', 'hni 23 bengaluru idiranaagar', '+911231231234', 'Secret23', 'http://localhost:3000/uploads\\\\1660931067072-94271322.jpg'),
(20, 20, 4, 'sam', 'sam@gmail.com', 'hni 23 bengaluru idiranaagar', '+911231231234', 'Secret23', 'http://localhost:3000/uploads\\\\1660931067072-94271322.jpg'),
(21, 1, 1, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$tT0pX4COl.kBRu82YJBcQOi1sMkFGKEr8onxgxld1vAk2hMrwfQXK', 'http://localhost:3000/uploads\\1660980013556-529519841.jpg'),
(22, 2, 1, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$oxLkpYjUt.N7UvGDl6hTOe12CZUZeq/Cvc0WIz3yZkzTC4XE8yZcC', 'http://localhost:3000/uploads\\1660980041797-959359806.jpg'),
(23, 3, 1, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$kNEmc4IEgZ.lM/dM83GHweIZkv7hJfzSmUGxlUCGWz10nbv1vXz6W', 'http://localhost:3000/uploads\\1660980044891-551140427.jpg'),
(24, 4, 1, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$FjPpDgv4NsrU1zeYLx5jUOG8hghDJM/5XNwYBaAescZ5MxY/xGDx6', 'http://localhost:3000/uploads\\1660980047888-666698077.jpg'),
(25, 5, 1, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$/ChUAuo50YH224hjz3QsmOC43U4TiKMuKoFnk7pNOwHComokiqExO', 'http://localhost:3000/uploads\\1660980051385-873519894.jpg'),
(26, 5, 1, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$4r/2cI1jRwg5KsmFoPMMdOwJCr3imdlWrMSNJu3lUmZHjIMjelVtu', 'http://localhost:3000/uploads\\1660980052135-792386502.jpg'),
(27, 6, 2, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$wD.Nng6JoT2Eg0gh41LhA.T5grnOsj/bWQfLKmD897yL/XMIBUCTm', 'http://localhost:3000/uploads\\1660980057939-338114293.jpg'),
(28, 7, 2, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$tlrA9VaduP4phuaS8RQaDu2qwX/CeToTjuiqc1MIODPC0AUloUsty', 'http://localhost:3000/uploads\\1660980060923-714442511.jpg'),
(29, 8, 2, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$UF3wkeSGyH0zqO2xq59vHem40A2g5DlGaPSneFo03EzjGTHeYZzBG', 'http://localhost:3000/uploads\\1660980063579-103426454.jpg'),
(30, 9, 2, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$y5xgmvL1amEbAa7DERH68.OkJ2W92yH6zVMmeOWf.QSWBs9H1GgxO', 'http://localhost:3000/uploads\\1660980066717-462355954.jpg'),
(31, 10, 2, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$a/mD.N572Qo955jQ94apbeXXyXY5yfTyKbARRXaX4vnduG42wLHK.', 'http://localhost:3000/uploads\\1660980069635-286389488.jpg'),
(32, 11, 3, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$GcJA4DUWk4TChG7pl8hxsueFT0lj7YTlf06SBHUTJHpoVI4YzRwGa', 'http://localhost:3000/uploads\\1660980073132-400306624.jpg'),
(33, 12, 3, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$STwbelzGBpr.qjAzsJYJWuskdjIjXxgZ7VuwtCxbuggTU9e/NG2Eq', 'http://localhost:3000/uploads\\1660980076214-531930524.jpg'),
(34, 13, 3, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$blGMSp6Qz6Z7zdc865GY3uhKYVy05Tb/2WNOgF9gMy8OtvqZOchle', 'http://localhost:3000/uploads\\1660980079277-771814009.jpg'),
(35, 13, 3, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$0jd2iBeoShTkeWHdunw.U.lndEolmD0JoDZskgTDjfP1HclfHOt6y', 'http://localhost:3000/uploads\\1660980080047-817184640.jpg'),
(36, 14, 3, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$haL8Zfwtj8jbTPZ5pvqAwuqip71LBTJPG0IFoZlgKmWsFTvIJkeUS', 'http://localhost:3000/uploads\\1660980083076-651273572.jpg'),
(37, 14, 3, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$ieu971oi7iLzoBcYkCinCudMglM/d9dXlehcmJXADTjptUqFzlngK', 'http://localhost:3000/uploads\\1660980083767-92252418.jpg'),
(38, 15, 3, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$LalxO0bvWEn85FfNlaHgM.kLuX738jvA.dfvSsx4xnNSy0ao94RGm', 'http://localhost:3000/uploads\\1660980086933-445127100.jpg'),
(39, 16, 4, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$9O0H28PjSVvdYm/bFJu9e.ofRpjv1S9GKemXg2eP4NKNPkRU9uIP2', 'http://localhost:3000/uploads\\1660980090239-462519176.jpg'),
(40, 17, 4, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$VWkhEd.KzkM9hKGeNeOOXOZyz/bGN8UGffYpG1Lon3yj7x7gzY0bu', 'http://localhost:3000/uploads\\1660980092969-4978422.jpg'),
(41, 18, 4, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$T/iqEh75iKXSKj9NljLTYeSftwQyIaVVLLHn.Em//6RTkj0fVidpS', 'http://localhost:3000/uploads\\1660980095863-314336676.jpg'),
(42, 19, 4, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$xlkcG7RPcYuvwO5CvXeYSOyXpLnnEYVYR/uE73Q370tCoZ9YOxKcS', 'http://localhost:3000/uploads\\1660980098663-93261037.jpg'),
(43, 20, 4, 'test12', 'ss222g@gmail.com', 'bangalore marathalli sanjayanagarar ', '+18618990122', '$2b$10$RjdWQ43nYfd11sBRd9NBSurXlJG4Y7CK3bB9HCVNGJeQ0nZa9eOgK', 'http://localhost:3000/uploads\\1660980102679-963161313.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `lattice_psychiatrist`
--

CREATE TABLE `lattice_psychiatrist` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `patient_count` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lattice_psychiatrist`
--

INSERT INTO `lattice_psychiatrist` (`id`, `name`, `patient_count`, `hospital_id`) VALUES
(1, 'rohit mehra', 2, 1),
(2, 'sameer', 2, 1),
(3, 'gandhi', 2, 1),
(4, 'kaka', 2, 1),
(5, 'sid', 3, 1),
(6, 'raj', 2, 2),
(7, 'prasad', 2, 2),
(8, 'dhruv', 2, 2),
(9, 'kiran', 2, 2),
(10, 'mihir', 2, 2),
(11, 'adi', 2, 3),
(12, 'sumit', 2, 3),
(13, 'amit', 3, 3),
(14, 'leela', 3, 3),
(15, 'rajni', 2, 3),
(16, 'shushe', 2, 4),
(17, 'rishi', 2, 4),
(18, 'jay', 2, 4),
(19, 'pooja', 2, 4),
(20, 'masni', 2, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lattice_hospital`
--
ALTER TABLE `lattice_hospital`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lattice_patient`
--
ALTER TABLE `lattice_patient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lattice_psychiatrist`
--
ALTER TABLE `lattice_psychiatrist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lattice_hospital`
--
ALTER TABLE `lattice_hospital`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lattice_patient`
--
ALTER TABLE `lattice_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `lattice_psychiatrist`
--
ALTER TABLE `lattice_psychiatrist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
