-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 12, 2017 at 03:03 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `surat_2017`
--

-- --------------------------------------------------------

--
-- Table structure for table `fungsi`
--

CREATE TABLE `fungsi` (
  `idfungsi` tinyint(4) NOT NULL,
  `nama` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fungsi`
--

INSERT INTO `fungsi` (`idfungsi`, `nama`) VALUES
(1, 'Dubes'),
(2, 'Fungsi Politik'),
(3, 'Fungsi Ekonomi'),
(4, 'Fungsi Pensosbud'),
(5, 'Protkons'),
(6, 'Tata Usaha'),
(7, 'Komunikasi'),
(8, 'Konsuler'),
(9, 'HOC'),
(10, 'Sekpri Dubes'),
(11, 'DWP');

-- --------------------------------------------------------

--
-- Table structure for table `fungsi2`
--

CREATE TABLE `fungsi2` (
  `idfungsi` tinyint(4) NOT NULL,
  `nama` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fungsi2`
--

INSERT INTO `fungsi2` (`idfungsi`, `nama`) VALUES
(1, 'Dubes'),
(2, 'Fungsi Politik'),
(3, 'Fungsi Ekonomi'),
(4, 'Fungsi Pensosbud'),
(5, 'Protkons'),
(6, 'Tata Usaha'),
(7, 'Komunikasi'),
(8, 'Konsuler');

-- --------------------------------------------------------

--
-- Table structure for table `incoming`
--

CREATE TABLE `incoming` (
  `idincoming` int(11) DEFAULT NULL,
  `Nomor_Agenda` int(10) NOT NULL,
  `Tanggal` date NOT NULL DEFAULT '2008-00-00',
  `Surat_Dari` varchar(50) NOT NULL DEFAULT '',
  `Nomor_Surat` varchar(50) NOT NULL DEFAULT '',
  `Tanggal_Surat` date NOT NULL DEFAULT '2008-00-00',
  `Perihal` varchar(100) NOT NULL DEFAULT '',
  `Ditujukan` varchar(50) NOT NULL DEFAULT '',
  `Tanggal_Kirim` date NOT NULL DEFAULT '2008-00-00',
  `Arsip_pada` varchar(50) NOT NULL DEFAULT '',
  `Keterangan` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1 PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Table structure for table `outgoing`
--

CREATE TABLE `outgoing` (
  `idoutgoing` int(11) NOT NULL DEFAULT '0',
  `Nomor_Agenda` int(10) NOT NULL,
  `Kode_Bidang` varchar(20) NOT NULL DEFAULT '',
  `Tanggal` date NOT NULL DEFAULT '0000-00-00',
  `Pembuat` varchar(50) NOT NULL DEFAULT '',
  `Perihal` varchar(100) NOT NULL DEFAULT '',
  `Ditujukan` varchar(100) NOT NULL DEFAULT '',
  `Arsip_pada` varchar(50) NOT NULL DEFAULT '',
  `Kirim_Via` varchar(20) NOT NULL DEFAULT '',
  `Keterangan` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1 PACK_KEYS=0;

--
-- Dumping data for table `outgoing`
--

INSERT INTO `outgoing` (`idoutgoing`, `Nomor_Agenda`, `Kode_Bidang`, `Tanggal`, `Pembuat`, `Perihal`, `Ditujukan`, `Arsip_pada`, `Kirim_Via`, `Keterangan`) VALUES
(0, 1, '/KU/ISL/I/2017', '2017-01-04', '9', 'Pengambilan KB', 'General Manager PT Bank BNI Singapore', '6', '6', 'KU'),
(0, 2, '/KU/ISL/I/2017', '2017-01-04', '6', 'Surat tugas ke Jakarta dan Singapura', 'Karo Keuangan', '6', '3', 'KU'),
(0, 3, '/EK/ISL/I/2017', '2017-01-04', '1', 'Kunjungan Kerja Duta Besar RI Islamabad', 'Dirjen PPI, Kemendag', '3', '5', 'Sekpri'),
(0, 4, '/EK/ISL/I/2017', '2017-01-04', '1', 'Kunjungan Kerja Duta Besar RI Islamabad', 'Dirut BPDP Sawit', '3', '5', 'Sekpri'),
(0, 5, '/EK/ISL/I/2017', '2017-01-04', '1', 'Kunjungan Kerja Duta Besar RI Islamabad', 'Dirjen Hortikultura, Kementan', '3', '5', 'Sekpri'),
(0, 6, '/EK/ISL/I/2017', '2017-01-04', '1', 'Kunjungan Kerja Duta Besar RI Islamabad', 'Ka-BAIS TNI', '3', '5', 'Sekpri'),
(0, 7, '/KU/ISL/I/17', '2017-01-04', '9', 'SPJK bulan Desember 2016', 'Karo keuangan Up kabag Verifikasi', '6', '3', 'KU'),
(0, 8, '/SB/ISL/I/17 ', '2017-01-05', '4', 'Undangan seminar', 'Nota', '4', '3', 'Yudi'),
(0, 9, 'PK/ISL/I/17', '2017-01-05', '5', 'sutat ket. adnin zahir', 'iiu islamabad', '5', '3', 'oz'),
(0, 10, 'PK/ISL/I/17', '2017-01-05', '5', 'surat ket keterangan nama mus`ab ibnu mujahid', 'surat keterangan', '5', '3', 'oz'),
(0, 11, 'PK/ISL/I/17', '2017-01-05', '5', 'surat ket keterangan nama muhammad ibnu mujahid', 'surat keterangan', '5', '3', 'oz'),
(0, 12, '/EK/ISL/I/17', '2017-01-05', '3', 'Nota Dinas jaldis ke Sargodha Chamber of Commerce &Industries', 'Dubes RI Islamabad', '3', '3', 'MLD'),
(0, 13, 'PK/ISL/I/17', '2017-01-05', '5', 'DC and SC KRI Iskandar Muda 367', 'MOFA', '5', '3', 'oz'),
(0, 14, '/PK/ISL/I/17', '2017-01-05', '5', 'exemption for personal car of Maj. Deden', 'MOFA', '5', '3', 'ali shan'),
(0, 15, '/EK/ISL/I/17', '2017-01-03', '3', 'usulan jaldis ke jakarta dalam rangka pendekatan kepada pemangku kepentingan di indonesia untuk peng', 'Dubes; cc: HOC; BPKRT', '3', '3', 'Ari'),
(0, 16, '/PK/ISL/I/17', '2017-01-06', '5', 'visa request for Col Rachmadsyah Lubis', 'E/o Tajikistan Isb', '5', '3', 'ali shan'),
(0, 17, '/PK/ISL/I/17', '2017-01-06', '5', 'visa request for Col Rachmadsyah Lubis', 'E/o Russian Federation Isb', '5', '3', 'ali shan'),
(0, 18, '/EK/ISL/I/17', '2017-01-06', '3', 'surat tugas jaldis 6-16 januari 2017', 'dubes', '3', '3', 'Ari'),
(0, 19, '19/SB/ISL/I/17', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 20, '/PK/ISL/I/17', '2017-01-09', '5', 'H.E. Amb will be out of country', 'mofa, all dip missions Isb.', '5', '3', 'ali shan'),
(0, 21, '21/SB/ISL/I/16', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 22, '21/SB/ISL/I/16', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 23, '/EK/ISL/I/17', '2017-01-10', '3', 'Undangan hadiri PEOC', 'Dirjen PPI Kemendag', '3', '5', 'Zaenal Abidin'),
(0, 24, '/PK/ISL/I/17', '2017-01-11', '5', 'Noc for H.E. Amb. Sargodha visit', 'MOFA', '5', '3', 'ali shan'),
(0, 25, '/PK/ISL/I/17', '2017-01-11', '5', 'temporary pass', 'MOFA', '5', '3', 'ali shan'),
(0, 26, 'PK/ISL/I/17', '2017-01-13', '5', 'surat ket an. rosidin', 'ibcc', '5', '3', 'oz'),
(0, 27, 'PK/ISL/I/17', '2017-01-13', '5', 'surat ket an. wirna hayati', 'hec', '5', '3', 'oz'),
(0, 28, '/PK/ISL/I/17', '2017-01-13', '5', 'export permit Mr. Rudy', 'MOFA', '5', '3', 'ali shan'),
(0, 29, 'PK/ISL/I/17', '2017-01-16', '5', 'surat ket. an. pirna nur rahman', 'to whom it may concern', '5', '3', 'oz'),
(0, 30, 'POL/ISL/I/17', '2017-01-17', '2', 'Bali proses Task Force meeting', 'DG-EAF', '2', '3', 'arif'),
(0, 31, 'ADM/ISL/I/2017', '2017-01-18', '6', 'Surat Tugas', '', '6', '3', 'Adhi - Admin'),
(0, 32, 'PK/ISL/I/17', '2017-01-17', '5', 'data senjata tem exercise aman 2017', 'mofa', '5', '3', 'oz'),
(0, 33, '/ADM/ISL/I/17', '2017-01-18', '9', 'Deposit USD', 'Manager Standard CB', '6', '3', 'adm'),
(0, 34, 'PK/ISL/I/17', '2017-01-17', '5', 'permohonan visa keluarga adhi yusetiadi', 'pakistan embassy jakarta', '5', '3', 'oz'),
(0, 35, '/PK/ISL/I/17', '2017-01-18', '5', 'verification of bank statement', 'MCB Bank Rwp.', '5', '1', 'ali shan'),
(0, 36, '/PK/ISL/I/17', '2017-01-18', '5', 'verification of bank statement', 'Meezan Bank Rwp', '5', '1', 'ali shan'),
(0, 37, '/PK/ISL/I/17', '2017-01-18', '5', 'visa extension request for Mr. Khaleed Ardian Ali', 'MOFA', '5', '3', 'ali shan'),
(0, 38, '/PK/ISL/I/17', '2017-01-17', '5', 'H.E. Amb has returned back', 'mofa, all dip missions Isb.', '5', '3', 'ali shan'),
(0, 39, '/ADM/ISL/I/17', '2017-01-19', '9', 'PU USD ke VS', 'Manager Standard CB', '6', '3', 'adm'),
(0, 40, '/SB/ISL/I/17 ', '2017-01-19', '4', 'Nota', 'Dubes RI', '4', '3', 'Yudi'),
(0, 41, '/PK/ISL/I/17', '2017-01-19', '5', 'Request for Mr. Faisol Amir visa', 'E/o Pakistan Jkt.', '5', '5', 'ali shan'),
(0, 42, '/PK/ISL/I/17', '2017-01-20', '5', 'Jaldis Sheikhupura', 'Dubes', '5', '3', 'Faiez'),
(0, 43, '/PK/ISL/I/17', '2017-01-17', '5', 'airport pass 2017', 'MOFA', '5', '3', 'ali shan'),
(0, 44, '/ADM/ISL/I/17', '2017-01-20', '6', 'Surat tugas', 'Dubes', '6', '3', ''),
(0, 45, '/EK/ISL/I/17', '2017-01-17', '3', 'Usulan Perjalanan Dinas menghadiri Pakistan Edible Oil Conference dan Forum Bisnis Minyak Sawit, dan', 'dubes cc: hoc, bpkrt', '3', '3', 'ari'),
(0, 46, '/EK/ISL/I/17', '2017-01-17', '3', 'surat tugas jaldis ke Karachi, 20-23 Januari 2017', 'dubes', '3', '3', 'ari'),
(0, 47, '/PK/ISL/I/17', '2017-01-20', '5', 'Noc for Ibu Ibu visit to taxila', 'MOFA', '5', '3', 'ali shan'),
(0, 48, 'PK/ISL/I/17', '2017-01-23', '5', 'surat ket an. Nurwahidah Choirunnisa', 'ibcc', '5', '3', 'oz'),
(0, 49, 'PK/ISL/I/17', '2017-01-23', '5', 'surat ket an. taufik maulana', 'ibcc', '5', '3', 'oz'),
(0, 50, 'PK/ISL/I/17', '2017-01-23', '5', 'surat ket an. Habib Suroso Nardi', 'ibcc', '5', '3', 'oz'),
(0, 51, 'PK/ISL/I/17', '2017-01-23', '5', 'surat ket. an. muhammad haisyam', 'ibcc', '5', '3', 'oz'),
(0, 52, '52/XX/ISL/I/15', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 53, '/PK/ISL/I/17', '2017-01-24', '5', 'Request for approval for Mr. Andi & Faisol', 'MOFA', '5', '3', 'ali shan'),
(0, 54, '/ADM/ISL/I/17', '2017-01-24', '6', 'Nota', 'Dubes RI', '6', '3', 'Andi'),
(0, 55, '/POL/ISL/I/17', '2017-01-24', '2', 'Thanks letter from Jokowi to Nawaz regarding Aceh eartquake', 'DCP A&F Mofa', '2', '3', 'arifs'),
(0, 56, '/PK/ISL/I/17', '2017-01-24', '5', 'visa request for Col Putut', 'E/o Afghanistan Isb.', '5', '3', 'ali shan'),
(0, 57, '/PK/ISL/I/17', '2017-01-25', '5', 'Laporan', 'Dubes', '5', '3', 'Faiez'),
(0, 58, '/SB/ISL/I/17 ', '2017-01-25', '4', 'Nota', 'MOFA', '4', '3', 'Yudi'),
(0, 59, '59/XX/ISL/I/15', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 60, '/PK/ISL/I/17', '2017-01-26', '5', 'visa request for Mr. Ari father in law', 'E/o Pakistan Jkt.', '5', '5', 'ali shan'),
(0, 61, 'PK/ISL/I/17', '2017-01-26', '5', 'surat ket field trips mahasiswa IIUI ke Malam Jabba', 'to whom it may concern', '5', '3', 'oz'),
(0, 62, '/XX/ISL/I/15', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 63, '55/ADM/ISL/I/2017', '0000-00-00', '6', 'edaran', 'seluruh pegawai kedutaan', '6', '3', 'Andi'),
(0, 64, 'PK/ISL/I/17', '2017-01-26', '5', 'surat ket an. neily fitriyah suparman rais', 'surat keterangan', '5', '3', 'oz'),
(0, 65, 'PK/ISL/I/17', '2017-01-26', '5', 'surat ket an. hasan febriansyah', 'iiu islamabad', '5', '3', 'oz'),
(0, 66, '/ADM/ISL/I/17', '2017-01-27', '6', 'perbaikan gedung', 'Dubes', '6', '3', 'andi'),
(0, 67, '/EK/ISL/I/17', '2017-01-30', '3', 'Hearing anti dumping', 'DG NTC', '3', '3', 'MLD'),
(0, 68, '/EK/ISL/I/17', '2017-01-30', '3', 'Hearing anti dumping', 'DG NTC', '3', '3', 'MLD'),
(0, 69, '/PK/ISL/I/17', '2017-01-30', '5', 'Ruang lobby etc', 'Dubes', '5', '3', 'Faiez'),
(0, 70, '/adm/ISL/I/17', '2017-01-30', '6', 'kendaran dinas', 'Dubes', '6', '3', 'andi'),
(0, 71, '/PK/ISL/I/17', '2017-01-30', '5', 'letter for student Habib', 'IBCC', '5', '3', 'ali shan'),
(0, 72, '/EK/ISL/I/17', '2017-01-30', '3', 'Pertemuan peoc dan forum bisnis indonesia-pakistan, karachi, 21-22 jan 2017', 'DIR APEC DAN OI, KEMENDAG RI', '3', '5', 'ari'),
(0, 73, '/EK/ISL/I/17', '2017-01-30', '3', 'Pertemuan peoc dan forum bisnis indonesia-pakistan, karachi, 21-22 jan 2017', 'ketua gapki', '3', '5', 'ari'),
(0, 74, '/EK/ISL/I/17', '2017-01-30', '3', 'Pertemuan peoc dan forum bisnis indonesia-pakistan, karachi, 21-22 jan 2017', 'direktur eksekutif gimni', '3', '5', 'ari'),
(0, 75, '/EK/ISL/I/17', '2017-01-30', '3', 'Pertemuan peoc dan forum bisnis indonesia-pakistan, karachi, 21-22 jan 2017', 'ketua AIMMI', '3', '5', 'ari'),
(0, 76, '/PK/ISL/I/17', '2017-01-31', '5', 'Edaran ', 'All masyarakat', '5', '3', 'Faiez'),
(0, 77, '/ADM/ISL/I/17', '0000-00-00', '6', 'note', 'Dubes', '6', '3', 'andi kumis'),
(0, 78, '/SB/ISL/II/17', '2017-02-02', '4', 'Surat keterangan mahasiswa', 'Keterangan ', '4', '3', 'MLD'),
(0, 79, '/pk/ISL/II/17', '2017-02-02', '5', 'visa letter Ahmad Dzikri', 'To whom it may concern', '5', '3', 'ali shan'),
(0, 80, '/PK/ISL/II/17', '2017-02-02', '5', 'visa letter Rifqy Amru Rasyidi yunus', 'To whom it may concern', '5', '3', 'ali shan'),
(0, 81, '/PK/ISL/II/17', '2017-02-02', '5', 'admission letter Muhamad Japar Sidik', 'IIUI, Islamabad', '5', '3', 'ali shan'),
(0, 82, '/PK/ISL/II/17', '2017-02-02', '5', 'equivalence cert to Herolistra Baskoroputro', 'HEC', '5', '3', 'ali shan'),
(0, 83, '/KU/ISB/II/2017', '2017-02-02', '1', 'Surat Pernyataan UP Perdana', 'Karo Keuangan', '6', '5', 'adm'),
(0, 84, '/PK/ISL/II/17', '2017-02-03', '5', 'note verbal for visa to Major Dody', 'E/o Egypt, Isb', '5', '3', 'ali shan'),
(0, 85, '/PK/ISL/II/17', '2017-02-03', '5', 'note verbal for visa to Major Dody', 'e/o Iran, Isb', '5', '3', 'ali shan'),
(0, 86, '/PK/ISL/II/17', '2017-02-03', '5', 'letter for equivalence cert to Col. Rosidin', 'To whom it may concern', '5', '3', 'ali shan'),
(0, 87, '/ADM/ISL/II/17', '2017-02-06', '6', 'Transfer deposit PNBP ke pusat', 'Manager Standard SCB', '6', '3', 'adm'),
(0, 88, '/PK/ISL/I/17', '2017-02-03', '5', 'Acknowledgment letter', 'Col Amjad Iqbal, ISI', '5', '5', ''),
(0, 89, '/PK/ISL/II/17', '2017-02-06', '5', 'reply to mofa about new posts', 'MOfA', '5', '3', 'ali shan'),
(0, 90, '/EK/ISL/II/17', '2017-02-07', '1', '', '', '1', '5', ''),
(0, 91, '/EK/ISL/II/17', '2017-02-07', '3', 'Undangan expo Furniture Indonesia ', 'Ketua-Ketua Kadin di Pakistan', '3', '3', 'MLD'),
(0, 92, '/ADM/ISL/II/2017', '2017-02-02', '9', 'BAPK 02 Pebruari 2017', 'BPK,Karo Keu,Itjen Wil I,Kabag Verifikasi', '6', '5', 'adm'),
(0, 93, '/KU/ISL/II/17', '2017-02-06', '6', 'SPJK bulan Januari 2017', 'Karo keuangan Up kabag Verifikasi', '6', '4', 'adm'),
(0, 94, '/PK/ISL/II/17', '2017-02-08', '5', 'visa request for oil association', 'E/o Pakistan, Jkt', '5', '5', 'ali shan'),
(0, 95, '/PK/ISL/II/17', '2017-02-08', '5', 'verification of bank statment mr. Ijaz hussain', 'HBL, Lahore', '5', '1', 'ali shan'),
(0, 96, '/KOM/ISL/II/17', '2017-02-08', '7', 'Permohonan perbaikan paper shredder', 'dubes', '6', '3', 'heni'),
(0, 97, '/PK/ISL/II/17', '2017-02-08', '5', 'Jaldis Karachi', 'Dubes', '5', '3', 'Faiez'),
(0, 98, '/EK/ISL/I/17', '2017-02-09', '3', 'Usulan Kegiatan Promosi Trade Tourism and Investment melalui Pertemuan dengan Wartawan dari Media se', 'dubes cc: hoc, bpkrt', '3', '3', 'ari'),
(0, 99, '/PK/ISL/II/17', '2017-02-09', '5', 'to issue mr. Adhi non diplomat card', 'MOfA', '5', '3', 'ali shan'),
(0, 100, '/Adm/ISB/II/17', '2017-02-09', '6', 'Usul kenaikan pangkat Wuryanto', 'Karo SDM', '6', '6', 'adm'),
(0, 101, '/ADM/ISL/II/17', '2017-02-13', '9', 'PU USD ke VS', 'Manager Standard SCB', '6', '3', 'adm'),
(0, 102, '/ADM/ISL/II/17', '2017-02-13', '9', 'PU USD ke VS', 'Manager Standard SCB', '6', '3', 'adm'),
(0, 103, 'PK/ISL/II/17', '2017-02-13', '5', 'NV re GAPKI', 'Pak Emb Jkt', '5', '3', 'Faiez'),
(0, 104, '/XX/ISL/I/15', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 105, '/EK/ISL/II/17', '2017-02-14', '3', 'Pararell meeting Kemdag dengan NTC', 'Mr. Taimoor Tajammal Joint Secretary Kemendag Pak', '3', '3', 'MLD'),
(0, 106, '/EK/ISL/II/17', '2017-02-14', '3', 'pertemuan bisnis Pakistan dengan GIAMM', 'Hamdani Zulkarnain Ketua GIAMM', '3', '3', 'MLD'),
(0, 107, '/DB/ISL/II/17', '2017-02-14', '10', 'Surat Rekomendasi', 'Tim Seleksi beasiswa LPDP', '1', '3', 'MLD'),
(0, 108, '/SB/ISL/II/17', '2017-02-14', '4', 'Nota', 'Dubes RI', '4', '3', 'Yudi'),
(0, 109, '/EK/ISL/II/17', '2017-02-14', '3', 'Joint Palm Oil Trade Committee', 'Ketua GAPKI', '3', '3', 'MLD'),
(0, 110, '/EK/ISL/II/17', '2017-02-14', '3', 'Joint Palm Oil Trade Committee', 'Ketua GIMNI', '3', '3', 'MLD'),
(0, 111, '/EK/ISL/II/17', '2017-02-14', '3', 'Joint Palm Oil Trade Committee', 'Ketua AIMMI', '3', '3', 'MLD'),
(0, 112, '/KOM/ISL/II/17', '2017-02-16', '7', 'Permohonan ijin perjalanan dinas ke KJRI Karachi', 'Dubes', '6', '3', 'heni'),
(0, 113, 'KOM/ISL/II/17', '2017-02-16', '7', 'Permohonan ijin perjalanan dinas ke KJRI Karachi', 'Dubes', '6', '3', 'heni'),
(0, 114, '/POL/ISL/II/2017', '2017-02-16', '2', 'Nota permintaan komputer untuk staf politik', 'Dubes', '2', '3', 'arifs'),
(0, 115, 'SB/ISL/I/17', '2017-02-16', '4', 'Laporan', 'Dubes RI', '4', '3', 'Yudi'),
(0, 116, '/PK/ISL/II/17', '2017-02-17', '5', 'Edaran ', 'All masyarakat', '5', '3', 'Faiez'),
(0, 117, 'PK/ISL/II/17', '2017-02-17', '5', 'surat ket an. agus komala', 'surat keterangan', '5', '3', 'oz'),
(0, 118, 'PK/ISL/II/17', '2017-02-17', '5', 'surat ket an. hafizh el hudzaifie', 'iiu islamabad', '5', '3', 'oz'),
(0, 119, 'PK/ISL/II/17', '2017-02-17', '5', 'surat ket an. aiman abdurrahman', 'iiu islamabad', '5', '3', 'oz'),
(0, 120, 'PK/ISL/II/17', '2017-02-17', '5', 'surat ket m syarif habibi', 'iiu islamabad', '5', '3', 'oz'),
(0, 121, 'PK/ISL/II/17', '2017-02-17', '5', 'filed trip mahasiswa iiui', 'surat ket', '5', '3', 'oz'),
(0, 122, 'PK/ISL/II/17', '2017-02-17', '5', 'surat ket an. muhammad naufal fairuzillah', 'surat keterangan', '5', '3', 'oz'),
(0, 123, 'PK/ISL/II/17', '2017-02-17', '5', 'surat ket an. affan kamal mubarok', 'surat keterangan', '5', '3', 'oz'),
(0, 124, '/XX/ISL/I/15', '0000-00-00', '5', '', '', '5', '5', 'oz'),
(0, 125, '/XX/ISL/I/15', '0000-00-00', '5', '', '', '5', '5', 'oz'),
(0, 126, '/XX/ISL/I/15', '0000-00-00', '5', '', '', '5', '5', 'oz'),
(0, 127, '/EK/ISL/I/17', '2017-02-20', '3', 'Permohonan Representasi', 'Dubes ', '6', '3', 'Zaenal'),
(0, 128, '/EK/ISL/II/17', '2017-02-20', '3', 'Permohonan Representasi', 'Dubes ', '6', '3', 'Zaenal'),
(0, 129, '129/SB/ISL/II/2017', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 130, '/KOM/ISL/II/17', '2017-02-20', '7', 'Surat Tugas', 'Dubes', '6', '3', 'Dhanis'),
(0, 131, '/ADM/ISB/II/2017', '2017-02-20', '9', 'Perpanjangan Polis Asuransi', 'Dubes', '6', '3', 'adm'),
(0, 132, '/SB/ISL/II/17', '2017-02-20', '4', 'Promosi', 'Kemenpar', '4', '3', 'Yudi'),
(0, 133, '/ADM/ISL/II/17', '2017-02-21', '6', 'Permohonan Fasilitasi Tamu DELRI', 'Dubes', '6', '3', 'Adm'),
(0, 134, '/KU/ISL/II/17', '2017-02-21', '6', 'Permohonan pengadaan bahan dapur kantor', 'Dubes', '6', '3', 'Adm'),
(0, 135, '/KOM/ISL/II/17', '2017-02-21', '7', 'Permohonan Pengadaan/Perbaikan UPS Server', 'Dubes', '6', '3', 'heni'),
(0, 136, '/XX/ISL/I/15', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 137, '/EK/ISL/II/17', '2017-02-21', '3', 'The 4th ASEM TMM4', 'Director SEAP', '3', '3', ''),
(0, 138, 'PK/ISL/II/17', '2017-02-21', '5', 'Request for Maj. Deden Car registration cert', 'MOFA', '5', '3', 'ali shan'),
(0, 139, '/KOM/ISL/II/17', '2017-02-21', '7', 'Permohonan perbaikan komputer dan penarikan ulang jaringan Internet', 'Dubes', '6', '3', 'heni'),
(0, 140, '/PK/ISL/II/17', '2017-02-21', '5', 'Biaya protokol', 'Dubes', '5', '3', 'Faiez'),
(0, 141, '/PK/ISL/II/17', '2017-02-22', '5', 'Biaya slip', 'Dubes', '5', '3', 'Faiez'),
(0, 142, '/PK/ISL/II/17', '2017-02-23', '5', 'Request for driving license for Mr. Adhi', 'MOFA', '5', '3', 'ali shan'),
(0, 143, '/ADM/ISL/II/17', '2017-02-22', '9', 'Surat pernyataan UP Belmod', 'KPPN JKT I', '6', '5', 'Adm'),
(0, 144, '/SB/ISL/II/17', '2017-02-23', '4', 'Nota', 'Dubes RI', '4', '3', 'Yudi'),
(0, 145, '/ADM/ISL/II/17', '2017-02-23', '1', 'perbaikan instalasi listrik taman luar kantor', 'dubes', '6', '3', 'andi Kumis'),
(0, 146, '/ADM/ISL/II/17', '2017-02-23', '6', 'perbaikan instalasi listrik taman luar kantor ', 'HoC', '6', '3', 'andi Kumis'),
(0, 147, '/PK/ISL/II/17', '2017-02-23', '5', 'Edaran ', 'All masyarakat', '8', '3', 'Faiez'),
(0, 148, '/ADM/ISB/II/2017', '2017-02-22', '1', 'Surat pernyataan UP PNBP', 'Kepala KPPN I', '6', '6', 'adm'),
(0, 149, '/PK/ISL/III/17', '2017-03-20', '5', 'Konsultasi', 'Dubes', '5', '3', 'Faiez'),
(0, 150, '/ADM/ISL/III/17', '2017-03-20', '6', 'Surat tugas', 'Dubes', '5', '3', ''),
(0, 151, '/PK/ISL/III/17', '2017-03-20', '5', 'umrah visa for IIU student', 'E/o Saudi Arabia Isb', '5', '3', 'ali shan'),
(0, 152, 'PK/ISL/III/17', '2017-03-20', '5', 'surat ket an. taufiq akbarudin utomo', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 153, 'PK/ISL/III/17', '2017-03-21', '5', 'surat ket an.muhammad bahadur afifi', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 154, 'PK/ISL/III/17', '2017-03-21', '5', 'surat ket an. cici sri maryanai', 'bahawalpur immigration', '5', '3', 'oz'),
(0, 155, '/XX/ISL/III/17', '2017-03-21', '5', 'surat ket an. mohsin muhammad ali', 'bahawalpur immigration', '5', '3', 'oz'),
(0, 156, '/SB/ISL/III/17', '2017-03-21', '4', 'KNB Scholarship', 'MOFA', '4', '3', 'ndm'),
(0, 157, 'PK/ISL/III/17', '2017-03-21', '5', 'surat ket an. syarif husain sudar', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 158, '/SB/ISL/III/17', '2017-03-21', '4', 'Surat Rek. a/n Ibrahim Paracha', 'Dikti', '4', '3', 'Yudi'),
(0, 159, '/KOM/ISL/III/17', '2017-03-21', '7', 'Permohonan kontrak tahunan pemeliharaan PABX', 'Dubes', '6', '3', 'heni'),
(0, 160, '/PK/ISL/III/17', '2017-03-21', '5', 'details of diplomats/officials', 'MOFA', '5', '3', 'ali shan'),
(0, 161, '/SB/ISL/III/17', '2017-03-21', '4', 'Invitation Letter', 'MOFA', '4', '3', 'ndm'),
(0, 162, '/ADM/ISL/III/2017', '2017-03-21', '9', 'Permohonan kotrak pemeliharaan komunikasi KBRI', 'Dubes RI', '6', '3', 'adm'),
(0, 163, '/ADM/ISL/III/2017', '2017-03-22', '6', 'pengumuman', 'HoC', '6', '3', 'adm'),
(0, 164, '/POL/ISL/III/17', '2017-03-22', '2', 'Lemhanas team visit 24-28 April 2017', 'Add Secretary AP Mofa', '2', '3', 'arifs'),
(0, 165, '/PK/ISL/III/17', '2017-03-22', '5', 'greeting messages on 23rd March 2017', 'MOFA', '5', '3', 'ali shan'),
(0, 166, '/Keppri/ISL/III/2017', '2017-03-06', '1', 'Penggantian Restitusi pengobatan', 'Karo Keuangan', '6', '3', 'adm'),
(0, 167, '/EK/ISL/III/17', '2017-03-22', '1', 'usulan promosi TTI di INAPA, Jakarta, 29 maret - 1 april 2017', 'Dubes, cc: HOC, BPKRT', '1', '3', 'ari'),
(0, 168, '/SB/ISL/III/17', '2017-03-22', '4', 'Note', 'GM Serena', '4', '3', 'ndm'),
(0, 169, '/PK/ISL/III/17', '2017-03-22', '5', 'verification of bank statement Abdul Manan', 'Bank Alfalah Peshawar', '5', '3', 'ali shan'),
(0, 170, '/KOM/ISL/III/17', '2017-03-22', '7', 'Permohonan upgrade UPS dan Rak Server', 'Dubes', '7', '3', 'heni'),
(0, 171, '/ADM/ISL/III/2017', '2017-03-22', '6', 'Surat rekomendasi', 'HoC', '6', '3', 'adhi'),
(0, 172, '/KU/ISL/III/2017', '2017-03-24', '6', 'SURAT TUGAS', 'Dubes', '6', '3', 'adm'),
(0, 173, '/ADM/ISL/III/2017', '2017-03-24', '9', 'Pengamanan Server internet data komunikasi', 'Dubes RI', '6', '3', 'adm'),
(0, 174, 'PK/ISL/III/17', '2017-03-24', '5', 'surat ket an. ehma hasan saifulloh ansyari', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 175, 'PK/ISL/III/17', '2017-03-27', '5', 'surat ket an. meli andriyani', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 176, 'PK/ISL/III/17', '2017-03-27', '5', 'surat ket an. shofa ', 'IBCC', '5', '3', 'oz'),
(0, 177, '/PK/ISL/III/17', '2017-03-27', '5', 'verification of bank statement tahir iqbal', 'SCB Bank', '5', '1', 'ali shan'),
(0, 178, '/PK/ISL/III/17', '2017-03-27', '5', 'verification of bank statement Nadeem Babar', 'MCB Bank', '5', '1', 'ali shan'),
(0, 179, '/PK/ISL/III/17', '2017-03-27', '5', 'verification of bank statement syed shaukat ali', 'UBL Bank', '5', '1', 'ali shan'),
(0, 180, '/PK/ISL/III/17', '2017-03-27', '5', 'verification of bank statement m ehtisham hafeez', 'MCB Bank', '5', '1', 'ali shan'),
(0, 181, '/ADM/ISL/III/2017', '2017-03-27', '6', 'PU USD ke VS', 'Manager Standard Chartered Bank', '6', '3', 'adm'),
(0, 182, '/ADM/ISL/III/17', '2017-03-27', '6', 'pengumuman', 'HoC', '6', '3', 'adm'),
(0, 183, '/PK/ISL/III/17', '2017-03-27', '4', 'Ramah Tamah Bin', 'HS & LS', '4', '3', 'Yudi'),
(0, 184, '/KOM/ISL/III/17', '2017-03-27', '7', 'peningkatan sistem keamanan KBRI dan Wisma', 'Dubes', '6', '3', 'heni'),
(0, 185, '/SB/ISL/III/17', '2017-03-27', '4', 'Surat Ket.', 'UMY', '4', '3', 'Yudi'),
(0, 186, '/EK/ISL/III/17', '2017-03-29', '3', 'Restitusi biaya kesehatan', 'Dubes ', '6', '3', 'Zaenal'),
(0, 187, '/DB/ISL/III/2017', '2017-03-29', '1', 'Bantuan Alat Transportasi bagi Mahasiswa Indonesia di Pakistan', 'Mendikbud RI', '1', '3', 'Ari'),
(0, 188, '/PK/ISL/III/17', '2017-03-29', '5', 'renewal of mofa card mr. Ramadhanis & family', 'MOFA', '5', '3', 'ali shan'),
(0, 189, '/POL/ISL/III/17', '2017-03-29', '2', 'Pengajuan rep Maret 2017', 'dubes', '2', '3', 'arifs'),
(0, 190, '/POL/ISLII/I/17', '2017-03-29', '2', 'Penggantian Rep Maret 2017', 'Dubes', '2', '3', 'arifs'),
(0, 191, 'PK/ISL/III/17', '2017-03-30', '5', 'surat ket an. fikri abdurrahman fatahillah', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 192, '/PK/ISL/III/17', '2017-03-30', '4', 'Udangan Syukuran', 'HS & LS', '4', '3', 'Yudi'),
(0, 193, '/PK/ISL/III/17', '2017-03-30', '5', 'verification of bank statement Asghar Khan', 'Bank of Khyber, Swat', '5', '1', 'ali shan'),
(0, 194, 'PK/ISL/III/17', '2017-03-30', '5', 'surat ket an. joni eko pranoto', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 195, '/SB/ISL/III/17', '2017-03-30', '4', 'Nota Dinas', 'Nota Dinas', '4', '3', 'Yudi'),
(0, 196, '/PK/ISL/III/17', '2017-03-30', '5', 'Jadwal pelayanan konsuler baru', 'Dubes', '5', '3', 'Faiez'),
(0, 197, '/ADM/ISL/III/2017', '2017-03-31', '9', 'BAPK 31 Maret 2017', 'BPK,ITWIL I,KARO KEU', '6', '5', 'adm'),
(0, 198, '/ADM/ISL/III/2017', '2017-03-31', '6', 'perawatan kendaraan dinas', 'dubes', '6', '3', 'adm'),
(0, 199, '/PK/ISL/III/17', '2017-03-31', '5', 'new visa section timing', 'MOFA', '5', '3', 'ali shan'),
(0, 200, '/ADM/ISL/III/2017', '2017-03-31', '6', 'POS jaga FC', 'Dubes', '6', '3', 'adm'),
(0, 201, '/PK/ISL/III/17', '2017-03-31', '5', 'Diplomatic ID', 'KJRI Karachi', '5', '3', 'Faiez'),
(0, 202, '/PK/ISL/III/17', '2017-03-31', '5', 'Acknowledgment mofa letter', 'MOFA', '5', '3', 'ali shan'),
(0, 203, '/ADM/ISL/III/17', '2017-04-01', '6', 'Nota Dinas', 'Dubes', '6', '3', 'adm'),
(0, 204, '204/SB/ISL/IV/17', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 205, 'PK/ISL/III/17', '2017-04-03', '5', 'surat ket an. qosdan dawami', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 206, 'PK/ISL/III/17', '2017-04-03', '5', 'surat ket an. herolistra baskoroputra', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 207, '/SB/ISL/IV/17', '2017-04-03', '4', 'Surat Rek. a/n Mian Ziaud Din', 'Dikti', '4', '3', 'Yudi'),
(0, 208, '/Adm/ISL/IV/2017', '2017-04-04', '9', 'PU USD ke VS', 'Manager Standard Chartered Bank', '6', '3', 'adm'),
(0, 209, '/PK/ISL/IV/17', '2017-04-04', '5', 'mofa card for mr. fakhrur razi', 'MOFA', '5', '3', 'ali shan'),
(0, 210, '/EK/ISL/IV/17', '2017-04-04', '3', 'Pinjaman TSR', 'Dubes ', '6', '3', 'Zaenal'),
(0, 211, '/ADM/ISL/IV/2017', '2017-04-04', '9', 'SPJK bulan Maret 2017', 'Karo Keu Up. Kabag Verifikasi', '6', '4', 'adm'),
(0, 212, '/KU/ISL/IV/17', '2017-04-04', '6', 'Dinas ke Lahore 5-7 April 2017', 'Surat Tugas Keppri', '6', '3', 'Andi'),
(0, 213, '/Adm/ISL/IV/2017', '2017-04-04', '9', 'Usulan Konsultasi ke Pusat dan Surat Tugas', 'Dubes RI', '6', '3', 'adm'),
(0, 214, '/POL/ISL/IV/17', '2017-04-04', '2', 'Joint Note with Australian Embassy regarding Meeting GCTF, Semarang 11-12 April 2017', 'DG EAP Mofa', '2', '3', 'arifs'),
(0, 215, '/PK/ISL/IV/17', '2017-04-04', '5', 'noc for H.E. Ambassador Lahore visit', 'MOFA', '5', '3', 'ali shan'),
(0, 216, 'POL/ISL/IV/17', '2017-04-05', '2', 'Rep April', 'Dubes', '2', '3', 'Fikar'),
(0, 217, 'POL/ISL/IV/17', '2017-04-05', '2', 'Penggantian Restitusi Pengobatan', 'Dubes', '2', '3', 'Fikar'),
(0, 218, '/PK/ISL/IV/17', '2017-04-05', '5', 'H.E. Ambassador visit', 'Haji Abdul Wahab, Raiwind', '5', '5', 'ali shan'),
(0, 219, '/EK/ISL/IV/17', '2017-04-04', '3', 'NOTA DINAS TTI di Lahore', 'Dubes RI islamabad', '3', '3', 'MLD'),
(0, 220, '/EKX/ISL/IV/17', '2017-04-04', '3', 'perubahan jadwal pengajuan visa ', 'Presiden KADIN seluruh Pakistan', '3', '3', 'MLD'),
(0, 221, '/XX/ISL/I/15', '2017-04-04', '3', 'perubahan jadwal pengajuan visa ', 'Presiden KADIN seluruh Pakistan', '3', '3', 'MLD'),
(0, 222, '/XX/ISL/I/15', '2017-04-04', '3', 'perubahan jadwal pengajuan visa ', 'Presiden KADIN seluruh Pakistan', '3', '3', 'MLD'),
(0, 223, '/EK/ISL/I/17', '2017-04-04', '3', 'undangan sarasehan  ', 'WNI di Lahore dans ekitarnya', '3', '3', 'MLD'),
(0, 224, '/EK/ISL/I/17', '2017-04-04', '3', 'undangan sarasehan  ', 'WNI di Lahore dans ekitarnya', '3', '3', 'MLD'),
(0, 225, '/EK/ISL/I/17', '2017-04-04', '3', 'undangan sarasehan  ', 'WNI di Lahore dans ekitarnya', '3', '3', 'MLD'),
(0, 226, '/EK/ISL/I/17', '2017-04-04', '3', 'undangan sarasehan  ', 'WNI di Lahore dans ekitarnya', '3', '3', 'MLD'),
(0, 227, '/XX/ISL/I/15', '2017-04-04', '3', 'perubahan jadwal pengajuan visa ', 'Presiden KADIN seluruh Pakistan', '3', '3', 'MLD'),
(0, 228, '/EK/ISL/III/17', '2017-04-05', '3', 'Usulan Representasi Maret', 'Dubes ', '6', '3', 'Zaenal'),
(0, 229, '/EK/ISL/III/17', '2017-04-05', '3', 'Penggantian Representasi Maret', 'Dubes ', '6', '3', 'Zaenal'),
(0, 230, '/EK/ISL/III/17', '2017-04-05', '3', 'Usulan Representasi Maret', 'Dubes ', '6', '3', 'Zaenal'),
(0, 231, '/ADM/ISL/IV/17', '2017-04-06', '6', 'Nota Dinas', 'Dubes', '6', '3', 'andi kumis'),
(0, 232, 'PK/ISL/IV/17', '2017-04-06', '5', 'surat ket an. fahmi wira angkasa', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 233, '/ADM/ISL/IV/2017', '2017-04-06', '9', 'PU USD ke VS', 'Manager Standard Chartered Bank', '6', '3', 'adm'),
(0, 234, '/KU/ISL/IV/17', '2017-04-06', '6', 'SURAT TUGAS', 'Dubes', '6', '3', 'andi Kumis'),
(0, 235, '235/XX/ISL/IV/2017', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 236, '236/XX/ISL/IV/17', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 237, 'PK/ISL/VI/17', '2017-04-10', '5', 'surat ket an. taufik maulana', 'IBCC', '5', '3', 'oz'),
(0, 238, 'PK/ISL/IV/17', '2017-04-10', '5', 'surat ket. an. muji rizdinar rahayu', 'IBCC', '5', '3', 'oz'),
(0, 239, 'PK/ISL/IV/17', '2017-04-10', '5', 'surat ket. andi mutiah az zahra', 'IBCC', '5', '3', 'oz'),
(0, 240, '/ADM/ISL/IV/17', '2017-04-10', '6', 'Nota Dinas', 'Dubes', '6', '3', 'andi Kumis'),
(0, 241, 'PK/ISL/IV/17', '2017-04-10', '5', 'surat ekt. an. imam akbar maulana', 'IBCC', '5', '3', 'oz'),
(0, 242, 'PK/ISL/IV/17', '2017-04-10', '5', 'surat ket an. muhammad rizki karim amrulloh', 'IBCC', '5', '3', 'oz'),
(0, 243, 'PK/ISL/IV/17', '2017-04-10', '5', 'surat ekt. an. havilah azaria ardine', 'IBCC', '5', '3', 'oz'),
(0, 244, 'PK/ISL/IV/17', '2017-04-10', '5', 'surat ket. abdullah haq alhaidary', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 245, '/ADM/ISL/IV/17', '2017-04-10', '6', 'Nota Dinas', 'Dubes', '6', '3', 'andi Kumis'),
(0, 246, 'PK/ISL/IV/17', '2017-04-10', '5', 'surat ket an. hasanuddin tosimpak', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 247, '247/XX/ISL/I/15', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 248, '248/XX/ISL/I/15', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 249, '/PK/ISL/IV/17', '2017-04-10', '5', 'visa extension for Mr. Wuryanto and family', 'MOFA', '5', '3', 'ali shan'),
(0, 250, 'PK/ISL/IV/17', '2017-04-11', '5', 'surat keternagan arsya ', 'kelurahan Cawang', '5', '3', ''),
(0, 251, '/SB/ISL/IV/17', '2017-04-11', '4', 'MRLS', 'MOFA', '4', '3', 'ndm'),
(0, 252, '/SB/ISL/IV/17', '2017-04-11', '4', 'AYIC', 'MOFA', '4', '3', 'ndm'),
(0, 253, '/PK/ISL/IV/17', '2017-04-11', '5', 'Srt ket', 'Muna', '5', '3', 'Faiez'),
(0, 254, '254/XX/ISL/I/15', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 255, '/ADM/ISL/IV/17', '2017-04-12', '6', 'Edaran', 'Staff KBRI', '6', '3', 'andi Kumis'),
(0, 256, 'PK/ISL/IV/17', '2017-04-12', '5', 'surat ket an. abdurrahman bin qasim', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 257, 'PK/ISL/IV/17', '2017-04-12', '5', 'surat ket. insani romina rambe', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 258, '/ADM/ISL/IV/17', '2017-04-12', '6', 'Nota Dinas', 'Home Staf', '6', '3', 'adhi'),
(0, 259, '/PK/ISL/IV/17', '2017-04-12', '5', 'issuance of entry pass', 'SP DPD, Isb', '5', '3', 'ali shan'),
(0, 260, '/SB/ISL/IV/17', '2017-04-13', '4', 'Nota Kegiatan', 'Dubes RI', '4', '3', 'Yudi'),
(0, 261, '/PK/ISL/IV/17', '2017-04-13', '5', 'Nodis Sargodha', 'Dubes', '5', '3', 'Faiez'),
(0, 262, '/ADM/ISL/IV/17', '2017-04-13', '5', 'Surat tugas', 'Dubes', '5', '3', ''),
(0, 263, '/PK/ISL/IV/17', '2017-04-13', '5', 'Authority letter for Airport pass 2017', 'MOFA', '5', '3', 'ali shan'),
(0, 264, '264/XX/ISL/I/17', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 265, 'PK/ISL/IV/17', '2017-04-17', '5', 'surat ket an. hasanuddin tosimpak', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 266, 'PK/ISL/IV/17', '2017-04-17', '5', 'surat ket an. Muhammad Taufiq', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 267, 'Pk/ISL/IV/17', '2017-04-17', '5', 'surat ket barang pindahan Isa Soemawidjaja', 'bea cukai jkt', '5', '3', 'oz'),
(0, 268, 'PK/ISL/IV/17', '2017-04-17', '5', 'surat ket. ikmal toha kamaluzaman', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 269, 'PK/ISL/IV/17', '2017-04-17', '5', 'surat ket an. isa soemawidjaja', 'to whom it may concern', '5', '3', 'oz'),
(0, 270, '/PK/ISL/IV/17', '2017-04-17', '5', 'Berita acara pemeriksaan', 'Yang berkepentingan', '5', '3', 'Faiez'),
(0, 271, '/EK/ISL/IV/17', '2017-04-17', '3', 'Konsultasi ke Pusat', 'Dubes ', '6', '3', 'Zaenal'),
(0, 272, 'PK/ISL/IV/17', '2017-04-17', '5', 'surat ket an. tri rahmat', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 273, 'PK/ISL/IV/17', '2017-04-17', '5', 'surat ket.an.darryl favian taqie', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 274, 'PK/ISL/IV/17', '2017-04-17', '5', 'surat ket.an.winda nurul jannah', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 275, '/EK/ISL/IV/17', '2017-04-17', '3', 'Undangan pameran', 'PT Tiga Pilar Sejahtera Food Tbk ', '3', '3', 'MLD'),
(0, 276, '/XX/ISL/I/15', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 277, '/Adm/ISL/IV/2017', '2017-04-18', '9', 'PU USD ke VS', 'Manager Standard Chartered Bank', '6', '3', 'adm'),
(0, 278, '/Adm/ISL/IV/2017', '2017-04-18', '1', 'Surat Pengantar', 'Karo SDM', '6', '6', 'adm'),
(0, 279, 'Pk/ISL/IV/17', '2017-04-18', '5', 'surat ket an.abdurahman bin qasim', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 280, 'PK/ISL/IV/17', '2017-04-18', '5', 'surat ket insani romina rambe', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 281, '/PK/ISL/IV/17', '2017-04-18', '5', 'visa extension Bpk Munasik & Family', 'MOFA', '5', '3', 'ali shan'),
(0, 282, '/EK/ISL/IV/17', '2017-04-18', '3', 'Konfirmasi ikut pameran rawal Expo 2017', 'President RCCI', '3', '3', 'MLD'),
(0, 283, '/PK/ISL/IV/17', '2017-04-19', '5', 'third country national employed at mission', 'MOFA', '5', '3', 'ali shan'),
(0, 284, '/POL/ISL/IV/17', '2017-04-19', '2', 'Candidature DR Zainal Abidin Bagir as member IPHRC OIC', 'MOFA', '2', '3', ''),
(0, 285, '/POL/ISL/IV/17', '2017-04-19', '2', 'Candidature DR Zainal Abidin Bagir as member IPHRC OIC', 'MOFA', '2', '3', ''),
(0, 286, '/PK/ISL/IV/17', '2017-04-19', '5', 'mofa card for mr. muladi and wife', 'MOFA', '5', '3', 'ali shan'),
(0, 287, '/PK/ISL/IV/17', '2017-04-20', '5', 'program on Saturday,April 22, 2017', 'Embassy of Switzerland,Japan,Spain etc', '5', '3', 'ali shan'),
(0, 288, '/PK/ISL/IV/17', '2017-04-20', '5', 'mofa card for mr. andi irawan', 'MOFA', '5', '3', 'ali shan'),
(0, 289, '/PK/ISL/IV/17', '2017-04-21', '5', 'Amb visit to Karachi ', 'MOFA', '5', '3', 'ali shan'),
(0, 290, '/EK/ISL/IV/17', '2017-04-21', '6', 'Nota Dinas', 'Dubes', '6', '3', 'andi'),
(0, 291, '/ADM/ISL/IV/17', '2017-04-21', '6', 'Edaran', 'Dubes', '6', '3', 'andi'),
(0, 292, 'PK/ISL/IV/17', '2017-04-21', '5', 'surat ket an. achmad syarif', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 293, 'PK/ISL/IV/17', '2017-04-21', '5', 'surat ket an. ahmad azizuddin', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 294, '/PK/ISL/IV/17', '2017-04-21', '5', 'Edaran', 'All Masyarakat', '5', '3', 'Faiez'),
(0, 295, 'PK/ISL/IV/17', '2017-04-25', '5', 'surat ket an. herolistra baskoroputra', 'hec', '5', '3', 'oz'),
(0, 296, 'PK/ISL/IV/17', '2017-04-25', '5', 'surat ket an. qowwiyul amin alfarouq', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 297, 'PK/ISL/IV/17', '2017-04-25', '5', 'surat ket an. wildan baihaqi ashshidiq', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 298, 'PK/ISL/IV/17', '2017-04-25', '5', 'surat ket an. lia nima uqbadar', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 299, '299/XX/ISL/I/15', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 300, '/EK/ISL/IV/17', '2017-04-25', '3', 'usulan kegiatan promosi TTI di rawal expo internasional 2017, rawalpindi, 10 -14 mei 2017', 'dubes cc: HOC, BPKRT', '3', '3', 'ari'),
(0, 301, '/ADM/ISL/IV/17', '2017-04-26', '6', 'Nota Dinas', 'Dubes', '6', '3', 'andi Kumis'),
(0, 302, 'PK/ISL/IV/17', '2017-04-26', '5', 'surat ket an. brian yusuf', 'm/o interior', '5', '3', 'oz'),
(0, 303, '/Adm/ISL/IV/17', '2017-04-25', '1', 'PK th 2017 & Lap Kinerja 2016 KBRI Islamabad', 'KARO BPO', '6', '3', 'adm'),
(0, 304, '/EK/ISL/IV/17', '2017-04-26', '3', 'Dukungan acaar promosi Indonesia RCCI', 'Ketua Umum PPMI Pakistan', '3', '3', 'MLD'),
(0, 305, '/EK/ISL/IV/17', '2017-04-26', '3', 'Nota Dinas anggaran konsumsi seminar mahasiswa', 'Dubes RI Islamabad', '3', '3', 'MLD'),
(0, 306, 'PK/ISL/IV/17', '2017-04-27', '5', 'surat ket an. munawir husni', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 307, '/PK/ISL/IV/17', '2017-04-26', '5', 'Chairman ACI', 'MOFA', '5', '3', 'Faiez'),
(0, 308, '/PK/ISL/IV/17', '2017-04-27', '5', 'Kartu bandara', 'Dubes', '5', '3', 'Faiez'),
(0, 309, '/PK/ISL/IV/17', '2017-04-27', '5', 'Biaya shelter', 'Dubes', '5', '3', 'Faiez'),
(0, 310, '/ADM/ISL/IV/17', '2017-04-27', '6', 'Nota Dinas', 'Dubes', '6', '3', 'adm'),
(0, 311, '/PK/ISL/IV/17', '2017-04-27', '5', 'visa extension Bpk Ichwan Mujahid & Family', 'MOFA', '5', '3', 'ali shan'),
(0, 312, '/SB/ISL/IV/17', '2017-04-27', '4', 'Training program empowering women', 'MOFA', '4', '3', 'ndm'),
(0, 313, '/PK/ISL/IV/17', '2017-04-28', '5', 'Authority letter for car plates', 'MOFA', '5', '3', 'ali shan'),
(0, 314, '/EK/ISL/IV/2017', '2017-04-03', '3', 'usulan rep bulan april 2017', 'dube', '1', '3', 'ari'),
(0, 315, '/DB/ISL/IV/17', '2017-04-28', '1', 'Kunjungan Kerja', 'Ka-BAIS TNI', '1', '3', 'Ari '),
(0, 316, '/DB/ISL/IV/17', '2017-04-28', '1', 'Kunjungan Kerja Dubes', 'Dirjen PPI', '1', '3', 'Ari'),
(0, 317, '/DB/ISL/IV/17', '2017-04-28', '1', 'Kunjungan Kerja Dubes', 'Deputi Bdg. Koordinasi Kerja sama Eko. Int''l. ', '1', '3', 'Ari'),
(0, 318, '/DB/ISL/IV/17', '2017-04-28', '1', 'Kunjungan Kerja Dubes', 'Deputi I Hublu BIN', '1', '3', 'Ari'),
(0, 319, '/DB/ISL/IV/17', '2017-04-28', '1', 'Kunjungan Kerja Dubes', 'Dirut BPDP Sawit', '1', '3', 'Ari'),
(0, 320, '/ADM/ISL/IV/17', '2017-04-28', '6', 'Edaran', 'Dubes', '6', '3', 'andi Kumis'),
(0, 321, '/EK/ISL/IV/17', '2017-04-28', '3', 'Undangan Rawal Expo Int 2017', 'Mr. Shinwari', '3', '3', 'MLD'),
(0, 322, '/EK/ISL/IV/17', '2017-04-28', '3', 'Undangan Rawal Expo Int 2017', 'Mr. Shinwari', '3', '3', 'MLD'),
(0, 323, '/EK/ISL/IV/17', '2017-04-28', '3', 'Undangan Rawal Expo Int 2017', 'Mr. Shinwari', '3', '3', 'MLD'),
(0, 324, '/PK/ISL/IV/17', '2017-04-28', '5', 'Rep', 'Dubes', '5', '3', 'Faiez'),
(0, 325, 'PK/ISL/IV/17', '2017-04-28', '5', 'surat ket an. syarif husain sudar', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 326, 'PK/ISL/IV/17', '2017-04-28', '5', 'surat ket an. hanin zuraida', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 327, '/DB/ISL/IV/17', '2017-04-28', '1', 'Invitation', 'MD. Adam Traders', '1', '3', 'MLD'),
(0, 328, '/DB/ISL/IV/17', '2017-04-28', '1', 'Invitation', 'CEO A.A. Foods', '1', '3', 'MLD'),
(0, 329, '/DB/ISL/IV/17', '2017-04-28', '1', 'Invitation', 'ED. Shinwari International Co.', '1', '3', 'MLD'),
(0, 330, '/DB/ISL/IV/17', '2017-04-28', '1', 'Invitation', 'ED. Shinwari International Co.', '1', '3', 'MLD'),
(0, 331, 'PK/ISL/IV/17', '2017-05-02', '5', 'surat ket an. taufik fahrul rojab', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 332, 'PK/ISL/IV/17', '2017-05-02', '5', 'surat ket an. zulkifli reza fahmi', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 333, 'PK/ISL/IV/17', '2017-05-02', '5', 'surat ket an.fauziah fahmi', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 334, '334/XX/ISL/I/15', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 335, '/EK/ISL/V/17', '2017-05-02', '3', 'penggantian biaya representasi april 2017', 'dubes cc: HOC, BPKRT', '3', '3', 'ari'),
(0, 336, '336/XX/ISL/I/15', '0000-00-00', '1', '', '', '1', '5', ''),
(0, 337, 'PK/ISL/IV/17', '2017-05-03', '5', 'surat ket an. chairil anwar', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 338, 'PK/ISL/IV/17', '2017-05-03', '5', 'surat ket an. dara ayu panjaitan', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 339, 'PK/ISL/IV/17', '2017-05-03', '5', 'surat ket an. wirna hayati', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 340, 'PK/ISL/IV/17', '2017-05-03', '5', 'surat ket an. rifqy amru rasyidi yunus', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 341, 'PK/ISL/IV/17', '2017-05-03', '5', 'surat ket an. dara ayu panjaitan', 'IBCC', '5', '3', 'oz'),
(0, 342, '/ADM/ISL/V/2017', '2017-05-02', '9', 'BAPK 02 Mei 2017', 'BPK,ITWIL I,KARO KEU', '6', '6', 'adm'),
(0, 343, '/EK/ISL/V/17', '2017-05-03', '3', 'usulan pelaksanaan konsultasi ke pusat sekaligus kegiatan penguatan jejaring kerja, jakarta, 8 - 17 ', 'dubes cc: HOC, BPKRT', '3', '3', 'ari'),
(0, 344, '/PK/ISL/V/17', '2017-05-03', '5', 'exemption cert for official Aalphard ', 'MOFA', '5', '3', 'ali shan'),
(0, 345, '/PK/ISL/V/17', '2017-05-03', '5', 'exemption cert for official Toyota harrier ', 'MOFA', '5', '3', 'ali shan'),
(0, 346, '/ADM/ISL/V/17', '2017-05-03', '6', 'Nota Dinas', 'Dubes', '6', '3', 'andi Kumis'),
(0, 347, '/ADM/ISL/V/17', '2017-05-03', '6', 'Nota Dinas', 'Dubes', '6', '3', 'andi Kumis'),
(0, 348, '/ADM/ISL/V/2017', '2017-05-04', '9', 'PU USD ke VS', 'Manager Standard Chartered Bank', '6', '3', 'adm'),
(0, 349, '/EK/ISL/V/17', '2017-05-03', '3', 'SURAT TUGAS konsultasi ke pusat dan penguatan jejaring kerja, 8-17 mei 2017', 'Dubes, cc: HOC, BPKRT', '3', '3', 'Ari Hadiman'),
(0, 350, '/DB/ISL/V/17', '2017-05-03', '1', 'Opening Official Bank Account', 'Manager Habib Bank, Dipl. Encl.', '1', '3', 'Johan'),
(0, 351, '/ADM/ISL/V/17', '2017-05-03', '6', 'Nota Dinas', 'Dubes', '6', '3', 'andi Kumis'),
(0, 352, '/ADM/ISL/V/17', '2017-05-03', '6', 'Nota Dinas', 'Dubes', '6', '3', 'andi Kumis'),
(0, 353, '/ADM/ISL/V/17', '2017-05-03', '6', 'Nota Dinas', 'Dubes', '6', '3', 'andi Kumis'),
(0, 354, '/EK/ISL/V/17', '2017-05-03', '3', 'SURAT TUGAS konsultasi ke pusat dan penguatan jejaring kerja, 8-17 mei 2017', 'Dubes, cc: HOC, BPKRT', '3', '3', 'Ari Hadiman'),
(0, 355, '/ADM/ISL/V/17', '2017-05-04', '6', 'Nota Dinas', 'Dubes', '6', '3', 'adm'),
(0, 356, '/SB/ISL/V/17', '2017-05-04', '4', 'Surat Rek. a/n Muhammad Arsalan', 'Dikti', '4', '3', 'Yudi'),
(0, 357, '/SB/ISL/V/17', '2017-05-04', '4', 'Surat Rek. a/n Muhammad Tayyab', 'Dikti', '4', '3', 'Yudi'),
(0, 358, '/SB/ISL/V/17', '2017-05-04', '4', 'Surat Rek. a/n Usman Khan', 'Dikti', '4', '3', 'Yudi'),
(0, 359, '/SB/ISL/V/17', '2017-05-04', '4', 'Surat Rek. a/n Irshad Khan', 'Dikti', '4', '3', 'Yudi'),
(0, 360, 'PK/ISL/V/17', '2017-05-04', '5', 'surat ket an. qosdan dawami', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 361, '/EK/ISL/V/17', '2017-05-04', '3', 'pertemuan koordinasi persiapan pengiriman misi bisnis pakistan', 'ketua GIAMM-Jakarta', '3', '3', 'ari'),
(0, 362, '/SB/ISL/V/17', '2017-05-04', '4', 'Surat Rek. a/n Mazhar Ali', 'Dikti', '4', '3', 'Yudi'),
(0, 363, '/PK/ISL/VI/17', '2017-05-04', '5', 'visa Pertamina delegation', 'E/o Pakistan Jkt', '5', '5', 'ali shan'),
(0, 364, '/PK/ISL/V/17', '2017-05-04', '5', 'temporary airport pass', 'MOFA', '5', '3', 'ali shan'),
(0, 365, '/SB/ISL/V/17', '2017-05-04', '4', 'Surat Rek. a/n Umer Hussain', 'Dikti', '4', '3', 'Yudi'),
(0, 366, '/ADM/ISL/V/2017', '2017-05-05', '6', 'SPJK bulan April 2017', 'Karo Keu Up. Kabag Verifikasi', '6', '4', 'adm'),
(0, 367, 'PK/ISL/V/17', '2017-05-05', '5', 'surat ket an. berty tanjung sari', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 368, 'PK/ISL/V/17', '2017-05-05', '5', 'surat ket an. nadiyatusyahidah', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 369, 'PK/ISL/IV17', '2017-05-05', '5', 'surat ket. an. arif rahman hakim', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 370, 'PK/ISL/V/17', '2017-05-05', '5', 'surat ket.an. alfaina thifla muttahid', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 371, 'PK/ISL/V/17', '2017-05-05', '5', 'surat ket an. rizky dwi prasetyo', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 372, 'PK/ISL/V/17', '2017-05-05', '5', 'surat ket an. pirna nur rahman', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 373, '/SB/ISL/V/17', '2017-05-08', '4', 'Surat Rek. a/n Syed Zeeshan Haider', 'Dikti', '4', '3', 'Yudi'),
(0, 374, '/ADM/ISL/V/2017', '2017-05-08', '9', 'PU USD ke VS', 'Manager Standard Chartered Bank', '6', '3', 'adm'),
(0, 375, '/PK/ISL/V/17', '2017-05-08', '5', 'visa extension Mr. Ichwan Mujahid & Family', 'MOFA', '5', '3', 'ali shan'),
(0, 376, 'PK/ISL/V/17', '2017-05-08', '5', 'surat ket an. rofi sulton an naisr', 'pakistan embassy jkt', '5', '3', 'oz'),
(0, 377, 'PK/ISLV/17', '2017-05-08', '5', 'surat ket an. maulana mujahid', 'pakistan embassy jkt', '5', '3', 'oz'),
(0, 378, '/SB/ISL/V/17', '2017-05-09', '4', 'Surat Rek. a/n Samiullah Khan', 'Dikti', '4', '3', 'Yudi'),
(0, 379, '/SB/ISL/V/17', '2017-05-09', '4', 'Surat Rek. a/n Muhammad Shan Saleem', 'Dikti', '4', '3', 'Yudi'),
(0, 380, '/SB/ISL/V/17', '2017-05-09', '4', 'Surat Rek. a/n Munazza', 'Dikti', '4', '3', 'Yudi'),
(0, 381, '/ADM/ISL/V/2017', '2017-05-09', '9', 'PU USD ke VS', 'Manager Standard Chartered Bank', '6', '3', 'adm'),
(0, 382, '/PK/ISL/V/17', '2017-05-09', '5', 'fake document of Asghar Khan', 'MOFA', '5', '3', 'ali shan'),
(0, 383, 'PK/ISL/V/17', '2017-05-09', '5', 'surat ket an. majda hanim salsabila anas', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 384, 'PK/ISL/IV17', '2017-05-09', '5', 'surat ket an. winda nurul jannah', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 385, '/ADM/ISL/V/15', '2017-05-09', '6', 'Hari Libur Nasional', 'Staff KBRI', '6', '3', 'Adm'),
(0, 386, '/PK/ISL/V/17', '2017-05-08', '5', 'letter to mofa about cda', 'MOFA', '5', '3', 'ali shan'),
(0, 387, '/ADM/ISL/V/17', '2017-05-10', '6', 'Nota Dinas', 'Dubes', '6', '3', 'andi Kumis'),
(0, 388, '/PK/ISL/V/17', '2017-05-10', '5', 'Gujranwala', 'KUAI', '5', '3', 'Faiez'),
(0, 389, '/PK/ISL/V/17', '2017-05-10', '5', 'Surat tugas', 'KUAI', '5', '3', 'Faiez'),
(0, 390, 'PK/ISL/V/17', '2017-05-12', '5', 'surat ket. hisbulla saenuddin', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 391, 'PK/ISL/V/17', '2017-05-12', '5', 'surat ket an. rahmah ali akhmadi', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 392, 'PK/ISL/V/17', '2017-05-12', '5', 'surat ket an. sumayyah shahnaz zein', 'IIUI, Islamabad', '5', '3', 'oz'),
(0, 393, 'PK/ISL/V/17', '2017-05-12', '5', 'surat ket ana, abdullah haq alhaidary', 'egypt embassy', '5', '3', 'oz'),
(0, 394, '/KU/ISL/V/2017', '2017-05-10', '9', 'Tution Fee Asli Utk BBPA HS bln Jan-Jun 2017 KBRI Islamabad', 'Karo SDM Kemlu', '6', '3', 'adm');

-- --------------------------------------------------------

--
-- Table structure for table `via`
--

CREATE TABLE `via` (
  `idvia` tinyint(4) NOT NULL,
  `nama` varchar(20) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `via`
--

INSERT INTO `via` (`idvia`, `nama`) VALUES
(1, 'Post'),
(2, 'Diplomatic Bag'),
(3, 'Hand/Courier'),
(4, 'DHL'),
(5, 'Bafaks'),
(6, 'Kawat');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fungsi`
--
ALTER TABLE `fungsi`
  ADD PRIMARY KEY (`idfungsi`);

--
-- Indexes for table `fungsi2`
--
ALTER TABLE `fungsi2`
  ADD PRIMARY KEY (`idfungsi`);

--
-- Indexes for table `incoming`
--
ALTER TABLE `incoming`
  ADD PRIMARY KEY (`Nomor_Agenda`);

--
-- Indexes for table `outgoing`
--
ALTER TABLE `outgoing`
  ADD PRIMARY KEY (`Nomor_Agenda`),
  ADD UNIQUE KEY `Nomor_Agenda` (`Nomor_Agenda`);

--
-- Indexes for table `via`
--
ALTER TABLE `via`
  ADD PRIMARY KEY (`idvia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fungsi`
--
ALTER TABLE `fungsi`
  MODIFY `idfungsi` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `fungsi2`
--
ALTER TABLE `fungsi2`
  MODIFY `idfungsi` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `incoming`
--
ALTER TABLE `incoming`
  MODIFY `Nomor_Agenda` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `outgoing`
--
ALTER TABLE `outgoing`
  MODIFY `Nomor_Agenda` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=395;
--
-- AUTO_INCREMENT for table `via`
--
ALTER TABLE `via`
  MODIFY `idvia` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
