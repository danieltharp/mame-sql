-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2018 at 04:40 PM
-- Server version: 5.7.22
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mame`
--
CREATE DATABASE IF NOT EXISTS `mame` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mame`;

-- --------------------------------------------------------

--
-- Table structure for table `adjuster`
--

CREATE TABLE `adjuster` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `default` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `adjuster`:
--   `machine_id`
--       `machine` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `analog`
--

CREATE TABLE `analog` (
  `id` int(10) UNSIGNED NOT NULL,
  `port_id` int(10) UNSIGNED NOT NULL,
  `mask` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `analog`:
--   `port_id`
--       `port` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `biosset`
--

CREATE TABLE `biosset` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(30) NOT NULL,
  `default` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `biosset`:
--   `machine_id`
--       `machine` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `chip`
--

CREATE TABLE `chip` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `tag` varchar(30) DEFAULT NULL,
  `type` enum('cpu','audio') NOT NULL,
  `clock` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `chip`:
--   `machine_id`
--       `machine` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `condition`
--

CREATE TABLE `condition` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `parent_type` varchar(30) NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(30) NOT NULL,
  `mask` varchar(30) NOT NULL,
  `relation` enum('eq','ne','gt','le','lt','ge') NOT NULL,
  `value` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `condition`:
--   `machine_id`
--       `machine` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `tag` varchar(30) NOT NULL,
  `mask` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `configuration`:
--   `machine_id`
--       `machine` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `conflocation`
--

CREATE TABLE `conflocation` (
  `id` int(10) UNSIGNED NOT NULL,
  `configuration_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `number` varchar(30) NOT NULL,
  `inverted` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `conflocation`:
--   `configuration_id`
--       `configuration` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `confsetting`
--

CREATE TABLE `confsetting` (
  `id` int(10) UNSIGNED NOT NULL,
  `configuration_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `value` varchar(30) NOT NULL,
  `default` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `confsetting`:
--   `configuration_id`
--       `configuration` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `control`
--

CREATE TABLE `control` (
  `id` int(10) UNSIGNED NOT NULL,
  `input_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(30) NOT NULL,
  `player` varchar(30) DEFAULT NULL,
  `buttons` varchar(30) DEFAULT NULL,
  `reqbuttons` varchar(30) DEFAULT NULL,
  `minimum` varchar(30) DEFAULT NULL,
  `maximum` varchar(30) DEFAULT NULL,
  `sensitivity` varchar(30) DEFAULT NULL,
  `keydelta` varchar(30) DEFAULT NULL,
  `reverse` enum('yes','no') NOT NULL DEFAULT 'no',
  `ways` varchar(30) DEFAULT NULL,
  `ways2` varchar(30) DEFAULT NULL,
  `ways3` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `control`:
--   `input_id`
--       `input` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE `device` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(30) NOT NULL,
  `tag` varchar(30) DEFAULT NULL,
  `fixed_image` varchar(30) DEFAULT NULL,
  `mandatory` varchar(30) DEFAULT NULL,
  `interface` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `device`:
--   `machine_id`
--       `machine` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `device_ref`
--

CREATE TABLE `device_ref` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `device_ref`:
--   `machine_id`
--       `machine` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `diplocation`
--

CREATE TABLE `diplocation` (
  `id` int(10) UNSIGNED NOT NULL,
  `dipswitch_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `number` varchar(30) NOT NULL,
  `inverted` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `diplocation`:
--   `dipswitch_id`
--       `dipswitch` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `dipswitch`
--

CREATE TABLE `dipswitch` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `tag` varchar(30) NOT NULL,
  `mask` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `dipswitch`:
--   `machine_id`
--       `machine` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `dipvalue`
--

CREATE TABLE `dipvalue` (
  `id` int(10) UNSIGNED NOT NULL,
  `dipswitch_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `value` varchar(30) NOT NULL,
  `default` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `dipvalue`:
--   `dipswitch_id`
--       `dipswitch` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `disk`
--

CREATE TABLE `disk` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sha1` varchar(40) DEFAULT NULL,
  `merge` varchar(30) DEFAULT NULL,
  `region` varchar(30) DEFAULT NULL,
  `index` varchar(30) DEFAULT NULL,
  `writable` enum('yes','no') NOT NULL DEFAULT 'no',
  `status` enum('baddump','nodump','good') NOT NULL DEFAULT 'good',
  `optional` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `disk`:
--   `machine_id`
--       `machine` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `display`
--

CREATE TABLE `display` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(30) DEFAULT NULL,
  `type` enum('raster','vector','lcd','svg','unknown') NOT NULL,
  `rotate` enum('0','90','180','270') DEFAULT NULL,
  `flipx` enum('yes','no') NOT NULL DEFAULT 'no',
  `width` varchar(30) DEFAULT NULL,
  `height` varchar(30) DEFAULT NULL,
  `refresh` varchar(30) NOT NULL,
  `pixclock` varchar(30) DEFAULT NULL,
  `htotal` varchar(30) DEFAULT NULL,
  `hbend` varchar(30) DEFAULT NULL,
  `hbstart` varchar(30) DEFAULT NULL,
  `vtotal` varchar(30) DEFAULT NULL,
  `vbend` varchar(30) DEFAULT NULL,
  `vbstart` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `display`:
--   `machine_id`
--       `machine` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `status` enum('good','imperfect','preliminary') NOT NULL,
  `emulation` enum('good','imperfect','preliminary') NOT NULL,
  `cocktail` enum('good','imperfect','preliminary') NOT NULL,
  `savestate` enum('supported','unsupported') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `driver`:
--   `machine_id`
--       `machine` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `extension`
--

CREATE TABLE `extension` (
  `id` int(10) UNSIGNED NOT NULL,
  `device_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `extension`:
--   `device_id`
--       `device` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `feature`
--

CREATE TABLE `feature` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `type` enum('protection','palette','graphics','sound','controle','keyboard','mouse','microphone','camera','disk','printer','lan','wan','timing') NOT NULL,
  `status` enum('unemulated','imperfect') DEFAULT NULL,
  `overall` enum('unemulated','imperfect') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `feature`:
--   `machine_id`
--       `machine` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `input`
--

CREATE TABLE `input` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `service` enum('yes','no') NOT NULL DEFAULT 'no',
  `tilt` enum('yes','no') NOT NULL DEFAULT 'no',
  `players` varchar(30) NOT NULL,
  `coins` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `input`:
--   `machine_id`
--       `machine` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `instance`
--

CREATE TABLE `instance` (
  `id` int(10) UNSIGNED NOT NULL,
  `device_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `briefname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `instance`:
--   `device_id`
--       `device` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `machine`
--

CREATE TABLE `machine` (
  `id` int(10) UNSIGNED NOT NULL,
  `mame_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `sourcefile` varchar(30) DEFAULT NULL,
  `isbios` enum('yes','no') NOT NULL DEFAULT 'no',
  `isdevice` enum('yes','no') NOT NULL DEFAULT 'no',
  `ismechanical` enum('yes','no') NOT NULL DEFAULT 'no',
  `runnable` enum('yes','no') NOT NULL DEFAULT 'yes',
  `cloneof` varchar(30) DEFAULT NULL,
  `romof` varchar(30) DEFAULT NULL,
  `sampleof` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `machine`:
--   `cloneof`
--       `machine` -> `name`
--   `romof`
--       `machine` -> `name`
--   `sampleof`
--       `machine` -> `name`
--   `mame_id`
--       `mame` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `mame`
--

CREATE TABLE `mame` (
  `id` int(10) UNSIGNED NOT NULL,
  `build` varchar(30) NOT NULL,
  `debug` enum('yes','no') NOT NULL DEFAULT 'no',
  `mameconfig` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `mame`:
--

-- --------------------------------------------------------

--
-- Table structure for table `port`
--

CREATE TABLE `port` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `port`:
--

-- --------------------------------------------------------

--
-- Table structure for table `ramoption`
--

CREATE TABLE `ramoption` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `data` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `default` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `ramoption`:
--   `machine_id`
--       `machine` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `rom`
--

CREATE TABLE `rom` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `bios` varchar(30) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `crc` varchar(8) DEFAULT NULL,
  `sha1` varchar(40) DEFAULT NULL,
  `merge` varchar(30) DEFAULT NULL,
  `region` varchar(30) DEFAULT NULL,
  `offset` varchar(30) DEFAULT NULL,
  `status` enum('baddump','nodump','good') NOT NULL DEFAULT 'good',
  `optional` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `rom`:
--

-- --------------------------------------------------------

--
-- Table structure for table `sample`
--

CREATE TABLE `sample` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `sample`:
--   `machine_id`
--       `machine` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `slot`
--

CREATE TABLE `slot` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `slot`:
--   `machine_id`
--       `machine` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `slotoption`
--

CREATE TABLE `slotoption` (
  `id` int(10) UNSIGNED NOT NULL,
  `slot_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `devname` varchar(30) NOT NULL,
  `default` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `slotoption`:
--   `slot_id`
--       `slot` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `softwarelist`
--

CREATE TABLE `softwarelist` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `status` enum('original','compatible') NOT NULL,
  `filter` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `softwarelist`:
--   `machine_id`
--       `machine` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `sound`
--

CREATE TABLE `sound` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `channels` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `sound`:
--   `machine_id`
--       `machine` -> `id`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adjuster`
--
ALTER TABLE `adjuster`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjuster_machine_id` (`machine_id`);

--
-- Indexes for table `analog`
--
ALTER TABLE `analog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `analog_port_id` (`port_id`);

--
-- Indexes for table `biosset`
--
ALTER TABLE `biosset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `biosset_machine_id` (`machine_id`);

--
-- Indexes for table `chip`
--
ALTER TABLE `chip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chip_machine_id` (`machine_id`);

--
-- Indexes for table `condition`
--
ALTER TABLE `condition`
  ADD PRIMARY KEY (`id`),
  ADD KEY `condition_machine_id` (`machine_id`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `configuration_machine_id` (`machine_id`);

--
-- Indexes for table `conflocation`
--
ALTER TABLE `conflocation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conflocation_configuration_id` (`configuration_id`);

--
-- Indexes for table `confsetting`
--
ALTER TABLE `confsetting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `confsetting_configuration_id` (`configuration_id`);

--
-- Indexes for table `control`
--
ALTER TABLE `control`
  ADD PRIMARY KEY (`id`),
  ADD KEY `control_input_id` (`input_id`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_machine_id` (`machine_id`);

--
-- Indexes for table `device_ref`
--
ALTER TABLE `device_ref`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_ref_machine_id` (`machine_id`);

--
-- Indexes for table `diplocation`
--
ALTER TABLE `diplocation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diplocation_dipswitch_id` (`dipswitch_id`);

--
-- Indexes for table `dipswitch`
--
ALTER TABLE `dipswitch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dipswitch_machine_id` (`machine_id`);

--
-- Indexes for table `dipvalue`
--
ALTER TABLE `dipvalue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dipvalue_dipswitch_id` (`dipswitch_id`);

--
-- Indexes for table `disk`
--
ALTER TABLE `disk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disk_machine_id` (`machine_id`);

--
-- Indexes for table `display`
--
ALTER TABLE `display`
  ADD PRIMARY KEY (`id`),
  ADD KEY `display_machine_id` (`machine_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_machine_id` (`machine_id`);

--
-- Indexes for table `extension`
--
ALTER TABLE `extension`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extension_device_id` (`device_id`);

--
-- Indexes for table `feature`
--
ALTER TABLE `feature`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feature_machine_id` (`machine_id`);

--
-- Indexes for table `input`
--
ALTER TABLE `input`
  ADD PRIMARY KEY (`id`),
  ADD KEY `input_machine_id` (`machine_id`);

--
-- Indexes for table `instance`
--
ALTER TABLE `instance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instance_device_id` (`device_id`);

--
-- Indexes for table `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `machine_name` (`name`),
  ADD KEY `machine_mame_id` (`mame_id`);

--
-- Indexes for table `mame`
--
ALTER TABLE `mame`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `port`
--
ALTER TABLE `port`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ramoption`
--
ALTER TABLE `ramoption`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ramoption_machine_id` (`machine_id`);

--
-- Indexes for table `rom`
--
ALTER TABLE `rom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sample`
--
ALTER TABLE `sample`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sample_machine_id` (`machine_id`);

--
-- Indexes for table `slot`
--
ALTER TABLE `slot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slot_machine_id` (`machine_id`);

--
-- Indexes for table `slotoption`
--
ALTER TABLE `slotoption`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slotoption_slot_id` (`slot_id`);

--
-- Indexes for table `softwarelist`
--
ALTER TABLE `softwarelist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `softwarelist_machine_id` (`machine_id`);

--
-- Indexes for table `sound`
--
ALTER TABLE `sound`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sound_machine_id` (`machine_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adjuster`
--
ALTER TABLE `adjuster`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `analog`
--
ALTER TABLE `analog`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `biosset`
--
ALTER TABLE `biosset`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chip`
--
ALTER TABLE `chip`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `condition`
--
ALTER TABLE `condition`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `conflocation`
--
ALTER TABLE `conflocation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `confsetting`
--
ALTER TABLE `confsetting`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `control`
--
ALTER TABLE `control`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `device_ref`
--
ALTER TABLE `device_ref`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `diplocation`
--
ALTER TABLE `diplocation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dipswitch`
--
ALTER TABLE `dipswitch`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dipvalue`
--
ALTER TABLE `dipvalue`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `disk`
--
ALTER TABLE `disk`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `display`
--
ALTER TABLE `display`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `extension`
--
ALTER TABLE `extension`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `feature`
--
ALTER TABLE `feature`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `input`
--
ALTER TABLE `input`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `instance`
--
ALTER TABLE `instance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `machine`
--
ALTER TABLE `machine`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mame`
--
ALTER TABLE `mame`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `port`
--
ALTER TABLE `port`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ramoption`
--
ALTER TABLE `ramoption`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rom`
--
ALTER TABLE `rom`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sample`
--
ALTER TABLE `sample`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `slot`
--
ALTER TABLE `slot`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `slotoption`
--
ALTER TABLE `slotoption`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `softwarelist`
--
ALTER TABLE `softwarelist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sound`
--
ALTER TABLE `sound`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `adjuster`
--
ALTER TABLE `adjuster`
  ADD CONSTRAINT `adjuster_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`);

--
-- Constraints for table `analog`
--
ALTER TABLE `analog`
  ADD CONSTRAINT `analog_port_id` FOREIGN KEY (`port_id`) REFERENCES `port` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `biosset`
--
ALTER TABLE `biosset`
  ADD CONSTRAINT `biosset_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chip`
--
ALTER TABLE `chip`
  ADD CONSTRAINT `chip_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `condition`
--
ALTER TABLE `condition`
  ADD CONSTRAINT `condition_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `configuration`
--
ALTER TABLE `configuration`
  ADD CONSTRAINT `configuration_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `conflocation`
--
ALTER TABLE `conflocation`
  ADD CONSTRAINT `conflocation_configuration_id` FOREIGN KEY (`configuration_id`) REFERENCES `configuration` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `confsetting`
--
ALTER TABLE `confsetting`
  ADD CONSTRAINT `confsetting_configuration_id` FOREIGN KEY (`configuration_id`) REFERENCES `configuration` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `control`
--
ALTER TABLE `control`
  ADD CONSTRAINT `control_input_id` FOREIGN KEY (`input_id`) REFERENCES `input` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `device`
--
ALTER TABLE `device`
  ADD CONSTRAINT `device_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `device_ref`
--
ALTER TABLE `device_ref`
  ADD CONSTRAINT `device_ref_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `diplocation`
--
ALTER TABLE `diplocation`
  ADD CONSTRAINT `diplocation_dipswitch_id` FOREIGN KEY (`dipswitch_id`) REFERENCES `dipswitch` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dipswitch`
--
ALTER TABLE `dipswitch`
  ADD CONSTRAINT `dipswitch_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`);

--
-- Constraints for table `dipvalue`
--
ALTER TABLE `dipvalue`
  ADD CONSTRAINT `dipvalue_dipswitch_id` FOREIGN KEY (`dipswitch_id`) REFERENCES `dipswitch` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `disk`
--
ALTER TABLE `disk`
  ADD CONSTRAINT `disk_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `display`
--
ALTER TABLE `display`
  ADD CONSTRAINT `display_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `extension`
--
ALTER TABLE `extension`
  ADD CONSTRAINT `extension_device_id` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feature`
--
ALTER TABLE `feature`
  ADD CONSTRAINT `feature_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `input`
--
ALTER TABLE `input`
  ADD CONSTRAINT `input_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `instance`
--
ALTER TABLE `instance`
  ADD CONSTRAINT `instance_device_id` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `machine`
--
ALTER TABLE `machine`
  ADD CONSTRAINT `machine_mame_id` FOREIGN KEY (`mame_id`) REFERENCES `mame` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ramoption`
--
ALTER TABLE `ramoption`
  ADD CONSTRAINT `ramoption_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sample`
--
ALTER TABLE `sample`
  ADD CONSTRAINT `sample_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `slot`
--
ALTER TABLE `slot`
  ADD CONSTRAINT `slot_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `slotoption`
--
ALTER TABLE `slotoption`
  ADD CONSTRAINT `slotoption_slot_id` FOREIGN KEY (`slot_id`) REFERENCES `slot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `softwarelist`
--
ALTER TABLE `softwarelist`
  ADD CONSTRAINT `softwarelist_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sound`
--
ALTER TABLE `sound`
  ADD CONSTRAINT `sound_machine_id` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
