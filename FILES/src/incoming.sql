-- phpMyAdmin SQL Dump
-- version 2.7.0-pl2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Dec 04, 2007 at 09:38 AM
-- Server version: 5.0.18
-- PHP Version: 5.1.2
-- 
-- Database: `surat`
-- 

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
  `Tanggal_Kirim` date NOT NULL default '0000-00-00',
  `Arsip_pada` varchar(50) NOT NULL default '',
  `Keterangan` varchar(25) default NULL,
  PRIMARY KEY  (`idincoming`)
) TYPE=MyISAM;

-- 
-- Dumping data for table `incoming`
-- 

INSERT INTO `incoming` VALUES (1, '1277', '2007-12-03 00:00:00', 'Deplu', '224/5566/cv/07', '2007-12-03', 'Izin', 'Politik', '0000-00-00', 'Politik', NULL);
INSERT INTO `incoming` VALUES (2, '1230', '2007-12-03 00:00:00', 'Indo', '224/5566/cv/07', '2007-12-03', 'PL', 'Ekonomi', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (3, '1279', '2007-12-03 00:00:00', 'Athan', '2245/XII/07', '2007-12-01', 'Visa', '', '0000-00-00', '', NULL);
INSERT INTO `incoming` VALUES (4, '1279', '2007-12-03 00:00:00', 'Athan', '2245/XII/07', '2007-12-01', 'Visa', '', '0000-00-00', '', NULL);
INSERT INTO `incoming` VALUES (5, '1279', '2007-12-03 00:00:00', 'Athan', '2245/XII/07', '2007-12-01', 'Visa', '', '0000-00-00', '', '');
INSERT INTO `incoming` VALUES (17, '1232', '2007-12-03 00:00:00', 'PIMS', '123/ggm/XII/07', '2007-12-01', 'VISA', 'Protkons', '0000-00-00', 'Protkons', '');
INSERT INTO `incoming` VALUES (7, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', '0000-00-00', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (8, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', '0000-00-00', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (9, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', '0000-00-00', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (10, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', '0000-00-00', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (11, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', '0000-00-00', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (12, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', '0000-00-00', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (13, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', '0000-00-00', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (14, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', '0000-00-00', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (15, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', '0000-00-00', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (16, '1231', '2007-12-03 00:00:00', 'Deplu', 'jfsdkjfdsjfdjsfjdskf', '2007-12-01', 'PL', 'Protkons', '0000-00-00', 'Ekonimi', '');
INSERT INTO `incoming` VALUES (18, '1232', '2007-12-03 00:00:00', 'PIMS', '123/ggm/XII/07', '2007-12-01', 'VISA', 'Protkons', '0000-00-00', 'Protkons', '');
INSERT INTO `incoming` VALUES (19, '1280', '2007-12-03 00:00:00', 'Nort', '226/5566/cv/07', '2007-12-01', 'Visa', 'Protkons', '0000-00-00', 'Protkons', '');
INSERT INTO `incoming` VALUES (20, '1280', '2007-12-03 00:00:00', 'Nort', '226/5566/cv/07', '2007-12-01', 'Visa', 'Protkons', '0000-00-00', 'Protkons', '');
INSERT INTO `incoming` VALUES (21, '1280', '2007-12-03 00:00:00', 'Nort', '226/5566/cv/07', '2007-12-01', 'Visa', 'Protkons', '0000-00-00', 'Protkons', '');
INSERT INTO `incoming` VALUES (22, '1281', '2007-12-03 00:00:00', 'Nort', '226/5566/cv/07', '2007-12-01', 'Visa dan p hdhfdhdhsfj dhsjf dhsf djshfdjshf djfhf', 'Protkons', '0000-00-00', 'Protkons', '');
INSERT INTO `incoming` VALUES (23, '1282', '2007-12-03 00:00:00', 'Siemen', '22tt/556/vb/07', '2007-11-16', 'Undangan', 'Politik', '0000-00-00', 'Politik', '');
INSERT INTO `incoming` VALUES (24, '1283', '2007-12-04 00:00:00', 'Siemen', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (25, '1283', '2007-12-04 00:00:00', 'Siemen', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (26, '1283', '2007-12-04 00:00:00', 'Siemen', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (27, '1283', '2007-12-04 00:00:00', 'Siemen', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (28, '1283', '2007-12-04 00:00:00', 'Siemen', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (29, '1283', '2007-12-04 00:00:00', 'Siemen', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (30, '1283', '2007-12-04 00:00:00', 'Siemen', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (31, '1283', '2007-12-04 00:00:00', 'Siemen', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (32, '1284', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (33, '1285', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (34, '1286', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (35, '1287', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (36, '1288', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (37, '1289', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (39, '1290', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (40, '1290', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (41, '1290', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (42, '1290', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (43, '129', '2007-12-04 00:00:00', 'Nokia', '22tt/556/vb/07', '2007-11-02', 'Undangan', 'Ekonomui', '0000-00-00', 'Ekonomi', '');
INSERT INTO `incoming` VALUES (44, '1282', '2007-12-04 00:00:00', 'Deplu', '12/vii/07', '2007-12-01', 'fdsfdsfdsfsdf', 'politik', '0000-00-00', 'politik', 'OK');
