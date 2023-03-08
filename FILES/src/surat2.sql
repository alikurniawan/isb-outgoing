-- phpMyAdmin SQL Dump
-- version 2.7.0-pl2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Dec 04, 2007 at 08:57 AM
-- Server version: 5.0.18
-- PHP Version: 5.1.2
-- 
-- Database: `surat`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `fungsi`
-- 

CREATE TABLE `fungsi` (
  `idfungsi` tinyint(4) NOT NULL,
  `nama` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`idfungsi`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `fungsi`
-- 

INSERT INTO `fungsi` VALUES (1, 'Dubes');
INSERT INTO `fungsi` VALUES (2, 'Fungsi Politik');
INSERT INTO `fungsi` VALUES (3, 'Fungsi Ekonomi');
INSERT INTO `fungsi` VALUES (4, 'Fungsi Pensosbud');
INSERT INTO `fungsi` VALUES (5, 'Protkons');
INSERT INTO `fungsi` VALUES (6, 'Tata Usaha');
INSERT INTO `fungsi` VALUES (7, 'Komunikasi');
INSERT INTO `fungsi` VALUES (8, 'Atase Pertahanan');

-- --------------------------------------------------------

-- 
-- Table structure for table `fungsi2`
-- 

CREATE TABLE `fungsi2` (
  `idfungsi` tinyint(4) NOT NULL,
  `nama` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`idfungsi`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `fungsi2`
-- 

INSERT INTO `fungsi2` VALUES (1, 'Dubes');
INSERT INTO `fungsi2` VALUES (2, 'Fungsi Politik');
INSERT INTO `fungsi2` VALUES (3, 'Fungsi Ekonomi');
INSERT INTO `fungsi2` VALUES (4, 'Fungsi Pensosbud');
INSERT INTO `fungsi2` VALUES (5, 'Protkons');
INSERT INTO `fungsi2` VALUES (6, 'Tata Usaha');
INSERT INTO `fungsi2` VALUES (7, 'Komunikasi');
INSERT INTO `fungsi2` VALUES (8, 'Atase Pertahanan');

-- --------------------------------------------------------

-- 
-- Table structure for table `incoming`
-- 

CREATE TABLE `incoming` (
  `idincoming` int(11) NOT NULL,
  `Nomor_Agenda` varchar(50) NOT NULL default '',
  `Tanggal` datetime NOT NULL default '0000-00-00 00:00:00',
  `Surat_Dari` varchar(50) NOT NULL default '',
  `Nomor_Surat` varchar(50) NOT NULL default '',
  `Tanggal_Surat` date NOT NULL default '0000-00-00',
  `Perihal` varchar(100) NOT NULL default '',
  `Ditujukan` varchar(50) NOT NULL default '',
  `Arsip_pada` varchar(50) NOT NULL default '',
  `Keterangan` varchar(25) default NULL,
  PRIMARY KEY  (`idincoming`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `incoming`
-- 

INSERT INTO `incoming` VALUES (1, '1277', '2007-12-03 00:00:00', 'Deplu', '224/5566/cv/07', '2007-12-03', 'Izin', 'Politik', 'Politik', NULL);
INSERT INTO `incoming` VALUES (2, '1230', '2007-12-03 00:00:00', 'Indo', '224/5566/cv/07', '2007-12-03', 'PL', 'Ekonomi', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (3, '1279', '2007-12-03 00:00:00', 'Athan', '2245/XII/07', '2007-12-01', 'Visa', '', '', NULL);
INSERT INTO `incoming` VALUES (4, '1279', '2007-12-03 00:00:00', 'Athan', '2245/XII/07', '2007-12-01', 'Visa', '', '', NULL);
INSERT INTO `incoming` VALUES (5, '1279', '2007-12-03 00:00:00', 'Athan', '2245/XII/07', '2007-12-01', 'Visa', '', '', '');
INSERT INTO `incoming` VALUES (17, '1232', '2007-12-03 00:00:00', 'PIMS', '123/ggm/XII/07', '2007-12-01', 'VISA', 'Protkons', 'Protkons', '');
INSERT INTO `incoming` VALUES (7, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (8, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (9, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (10, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (11, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (12, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (13, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (14, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (15, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (16, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (18, '1232', '2007-12-03 00:00:00', 'PIMS', '123/ggm/XII/07', '2007-12-01', 'VISA', 'Protkons', 'Protkons', '');
INSERT INTO `incoming` VALUES (19, '1280', '2007-12-03 00:00:00', 'Nort', '226/5566/cv/07', '2007-12-01', 'Visa', 'Protkons', 'Protkons', '');
INSERT INTO `incoming` VALUES (20, '1280', '2007-12-03 00:00:00', 'Nort', '226/5566/cv/07', '2007-12-01', 'Visa', 'Protkons', 'Protkons', '');
INSERT INTO `incoming` VALUES (21, '1280', '2007-12-03 00:00:00', 'Nort', '226/5566/cv/07', '2007-12-01', 'Visa', 'Protkons', 'Protkons', '');
INSERT INTO `incoming` VALUES (22, '1281', '2007-12-03 00:00:00', 'Nort', '226/5566/cv/07', '2007-12-01', 'Visa dan p hdhfdhdhsfj dhsjf dhsf djshfdjshf djfhf', 'Protkons', 'Protkons', '');
INSERT INTO `incoming` VALUES (23, '1282', '2007-12-03 00:00:00', 'Siemen', '22tt/556/vb/07', '2007-11-16', 'Undangan', 'Politik', 'Politik', '');
INSERT INTO `incoming` VALUES (24, '1283', '2007-12-04 00:00:00', 'Siemen', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (25, '1283', '2007-12-04 00:00:00', 'Siemen', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (26, '1283', '2007-12-04 00:00:00', 'Siemen', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (27, '1283', '2007-12-04 00:00:00', 'Siemen', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (28, '1283', '2007-12-04 00:00:00', 'Siemen', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (29, '1283', '2007-12-04 00:00:00', 'Siemen', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (30, '1283', '2007-12-04 00:00:00', 'Siemen', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (31, '1283', '2007-12-04 00:00:00', 'Siemen', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (32, '1284', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (33, '1285', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (34, '1286', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (35, '1287', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (36, '1288', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (37, '1289', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (39, '1290', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (40, '1290', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (41, '1290', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (42, '1290', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (43, '129', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (44, '1282', '2007-12-04 00:00:00', 'Deplu', '12/vii/07', '2007-12-01', 'fdsfdsfdsfsdf', 'politik', 'politik', 'OK');

-- --------------------------------------------------------

-- 
-- Table structure for table `outgoing`
-- 

CREATE TABLE `outgoing` (
  `idoutgoing` int(11) NOT NULL,
  `Nomor_Agenda` varchar(50) NOT NULL default '',
  `Tanggal` datetime NOT NULL default '0000-00-00 00:00:00',
  `Pembuat` varchar(50) NOT NULL default '',
  `Perihal` varchar(100) NOT NULL default '',
  `Ditujukan` varchar(50) NOT NULL default '',
  `Arsip_pada` varchar(50) NOT NULL default '',
  `Kirim_Via` varchar(20) NOT NULL default '',
  `Keterangan` varchar(25) default NULL,
  PRIMARY KEY  (`idoutgoing`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `outgoing`
-- 

INSERT INTO `outgoing` VALUES (1, '1235/EK/ISL/XII/07', '2007-12-03 00:00:00', '1', 'Bisa', 'Deplu', '1', '1', 'OK');
INSERT INTO `outgoing` VALUES (2, '1236', '2007-12-03 00:00:00', '1', 'Bisa', 'Deplu', '1', '1', 'OK');
INSERT INTO `outgoing` VALUES (3, '1237', '2007-12-03 00:00:00', '1', 'Bisa', 'Deplu', '1', '3', 'OK');
INSERT INTO `outgoing` VALUES (4, '1238', '2007-12-03 00:00:00', '3', 'Bisa', 'Deplu', '3', '3', 'OK');
INSERT INTO `outgoing` VALUES (5, '1239', '2007-12-03 00:00:00', '1', 'Bisa', 'Deplu', '1', '1', 'OK');
INSERT INTO `outgoing` VALUES (6, '1239', '2007-12-03 00:00:00', '1', 'Bisa', 'Deplu', '1', '1', 'OK');
INSERT INTO `outgoing` VALUES (7, '1239', '2007-12-03 00:00:00', '1', 'Bisa', 'Deplu', '1', '1', 'OK');
INSERT INTO `outgoing` VALUES (8, '1239', '2007-12-03 00:00:00', '1', 'Bisa', 'Deplu', '1', '1', 'OK');
INSERT INTO `outgoing` VALUES (9, '1239', '2007-12-03 00:00:00', '1', 'Bisa', 'Deplu', '1', '1', 'OK');
INSERT INTO `outgoing` VALUES (10, '1239', '2007-12-03 00:00:00', '1', 'Bisa', 'Deplu', '1', '1', 'OK');
INSERT INTO `outgoing` VALUES (11, '1239', '2007-12-03 00:00:00', '1', 'Bisa', 'Deplu', '1', '2', 'OK');

-- --------------------------------------------------------

-- 
-- Table structure for table `via`
-- 

CREATE TABLE `via` (
  `idvia` tinyint(4) NOT NULL,
  `nama` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`idvia`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `via`
-- 

INSERT INTO `via` VALUES (1, 'Post');
INSERT INTO `via` VALUES (2, 'Diplomatic Bag');
INSERT INTO `via` VALUES (3, 'Hand/Courier');
