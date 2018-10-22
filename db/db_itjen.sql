-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 22, 2018 at 03:48 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_itjen`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `id_submain` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `id_submain`, `nama`) VALUES
(1, 1, '1.1 AUDIT'),
(2, 1, '1.2 REVIU'),
(3, 1, '1.3 VERIFIKASI'),
(4, 1, '1.4 PEMANTAUAN'),
(5, 1, '1.5 MONEV'),
(6, 2, '2.1 MANAJEMEN RISIKO'),
(7, 2, '2.2 SPIP'),
(8, 2, '2.3 FASILITASI'),
(9, 3, '3.1 KNOW YOUR EMPLOYE'),
(10, 3, '3.2 KNOW YOUR COSTUMER'),
(11, 3, '3.3 KAMPANYE ISAF'),
(12, 4, '4.1 WBS'),
(13, 4, '4.2 SIDAK'),
(14, 5, '5.1 KEGIATAN FORUM'),
(15, 5, '5.2 PENATAUSAHAAN');

-- --------------------------------------------------------

--
-- Table structure for table `disposisi_distribusi`
--

CREATE TABLE `disposisi_distribusi` (
  `id_distribusi` int(11) NOT NULL,
  `id_peran` int(11) NOT NULL,
  `status` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `distribusi`
--

CREATE TABLE `distribusi` (
  `id` int(11) NOT NULL,
  `no_agenda` varchar(255) NOT NULL,
  `no_penugasaan` varchar(255) NOT NULL,
  `tgl_agenda` date NOT NULL,
  `asal` varchar(255) NOT NULL,
  `isi_disposisi` varchar(255) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `tgl_penugasaan` date NOT NULL,
  `sifat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `distribusi_karyawan`
--

CREATE TABLE `distribusi_karyawan` (
  `id_distribusi` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hasil_audit`
--

CREATE TABLE `hasil_audit` (
  `id` int(11) NOT NULL,
  `nama_audit` varchar(255) NOT NULL,
  `nama_obrik` varchar(255) NOT NULL,
  `masa_audit` int(11) NOT NULL,
  `dana` double NOT NULL,
  `no_dipa` varchar(255) NOT NULL,
  `dana_dipa` double NOT NULL,
  `realisasi` varchar(255) NOT NULL,
  `id_ketua` int(11) NOT NULL DEFAULT '0',
  `id_pengendali` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hasil_audit_item`
--

CREATE TABLE `hasil_audit_item` (
  `id_audit` int(11) NOT NULL,
  `id_kode` int(11) NOT NULL DEFAULT '0',
  `masalah` varchar(255) NOT NULL,
  `kriteria` varchar(255) NOT NULL,
  `sebab` varchar(255) NOT NULL,
  `akibat` varchar(255) NOT NULL,
  `rekomendasi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `karya_tulis_karyawan`
--

CREATE TABLE `karya_tulis_karyawan` (
  `id` int(11) NOT NULL,
  `id karyawan` int(11) DEFAULT NULL,
  `topik` varchar(255) NOT NULL,
  `penyalanggara` varchar(255) NOT NULL,
  `tahun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan_audit`
--

CREATE TABLE `kegiatan_audit` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kegiatan_audit`
--

INSERT INTO `kegiatan_audit` (`id`, `nama`) VALUES
(3, 'Complain Audit'),
(4, 'Performa Audit');

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan_audit_partial`
--

CREATE TABLE `kegiatan_audit_partial` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `id parent` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kegiatan_audit_partial`
--

INSERT INTO `kegiatan_audit_partial` (`id`, `nama`, `id parent`, `type`) VALUES
(1, 'Audit atas pertanggungjawaban keuangan', 3, 1),
(2, 'Audit pengadaan Barang dan Jasa', 3, 1),
(3, 'Audit Kepegawaian', 3, 1),
(4, 'Audit atas subtansi pendidikan', 3, 1),
(5, 'Audit e-proc', 3, 1),
(6, 'Audit lainnya, sebutkan', 3, 0),
(7, 'Audit kinerja atas organisasi', 4, 1),
(8, 'Audit Kinerja atas Informasi dan Teknologi', 4, 1),
(9, 'Audit tujuan tertentu/investigasi', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan_karyawan`
--

CREATE TABLE `kegiatan_karyawan` (
  `id` int(11) NOT NULL,
  `id kegiatan` int(11) NOT NULL,
  `id karyawan` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kelompok_peran`
--

CREATE TABLE `kelompok_peran` (
  `id` int(11) NOT NULL,
  `id_peran` int(11) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelompok_peran`
--

INSERT INTO `kelompok_peran` (`id`, `id_peran`, `keterangan`) VALUES
(1, 2, 'Perencanaan Program dan Kegiatan'),
(2, 2, 'Penyusunan Penugasaan Audit'),
(3, 2, 'Menyusun KAK Audit'),
(4, 2, 'Pemantauan UN'),
(5, 2, 'Raker'),
(6, 2, 'Sumatera Barat'),
(7, 3, 'Ditjen Kebudayaan (Unit Utama)'),
(8, 3, 'Audit Universe Ditjen Kebudayaan'),
(9, 3, 'Bantuan Pemerintahan'),
(10, 3, 'Kalsel dan Jateng'),
(11, 4, 'Ditjen Guru dan Tp'),
(12, 4, 'Audit Universe Ditjen GTK'),
(13, 4, 'PKS'),
(14, 4, 'Sergu'),
(15, 4, 'Kajian di GTK'),
(16, 4, 'Bali dan Sultra'),
(17, 5, 'Balitbang Kemendikbud'),
(18, 5, 'Audit Universe Balitbang'),
(19, 5, 'Kompilasi'),
(20, 5, 'Pertanggungjawaban UN'),
(21, 5, 'Kajian Balitbang'),
(22, 5, 'Kaltim dan DKI'),
(23, 6, 'Revisu LK, RKA-KL, LAKIP'),
(24, 6, 'Audit Universe UPT Kebudayaan'),
(25, 6, 'Seminar'),
(26, 6, 'Tugas Perbantuan'),
(27, 6, 'SOP Inspektorat III'),
(28, 6, 'Kledeoskop Inspektorat III'),
(29, 7, 'Sinkronisasi dan Humas'),
(30, 7, 'Audit Universe Dijen GTK'),
(31, 7, 'Workshop'),
(32, 7, 'BAN S/M/PAUD'),
(33, 7, 'Jambi dan Sumsel'),
(34, 7, 'SPI Inspektorat III'),
(35, 3, 'Ekspose'),
(36, 3, 'Pengkajian Kebudayaan');

-- --------------------------------------------------------

--
-- Table structure for table `master_aartikel`
--

CREATE TABLE `master_aartikel` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `artikel` text NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `modified_date` datetime NOT NULL,
  `modified_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `master_berita`
--

CREATE TABLE `master_berita` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `berita` text NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_berita`
--

INSERT INTO `master_berita` (`id`, `judul`, `berita`, `created_date`, `modified_date`) VALUES
(1, 'Audit Utama', 'Dalam rangka mendorong akuntabilitas pertanggungjawaban keuangan unit utama, Inspektorat III Mulai tahun 2016 melakukan pengawalan pada unit utama melalui kegiatan audit atas pertanggungjawaban keuangan. &nbsp;Dari tanggal 10 s.d 17 Juni 2016, dilakukan audit tersebut untuk pertanggungjawaban semester I tahun 2016 (admin, 2016)', '2016-06-10 14:08:50', '2016-06-13 15:03:47'),
(3, 'Pelatihan Di Kantor Sendiri (PKS) Audit Operasional Keuangan Tentang Audit Unit Utama Semester I Tahun 2016 tanggal 9 Juni 2016', '<p>Dalam rangka audit Unit Utama (10 s.d. 17 Juni 2016) Auditor Inspektorat III sebelumnya telah melaksanakan Pelatihan di Kantor Sendiri (PKS) tentang <span lang=\"IN\">Audit Unit Utama Semester I Tahun 2016</span> pada tanggal 9 Juni 2016 bertempat di Ruang Sidang lantai VI diikuti oleh seluruh Auditor Inspektorat III.</p>', '2016-06-13 15:08:00', '2016-06-13 15:08:46'),
(4, 'Diseminasi Pemetaan DAK', '<p>Pada hari senin, 13 Juni 2016<span>&nbsp; </span>para Auditor Inspektorat III menghadiri kegiatan Desiminasi Pemetaan DAK yang diselenggarakan oleh PLP Set. Itjen Kemdikbud dimulai pukul 15.00<span>&nbsp; </span>s.d. 18.00 WIB bertempat di Ruang Sidang lantai VI.</p>', '2016-06-14 11:28:07', '2016-06-14 11:28:07');

-- --------------------------------------------------------

--
-- Table structure for table `master_carousel`
--

CREATE TABLE `master_carousel` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_carousel`
--

INSERT INTO `master_carousel` (`id`, `url`, `deskripsi`) VALUES
(2, '~/Uploads/images.jpg', 'itjen.kemdikbud.go.id'),
(3, '~/Uploads/01234-639x330.jpg', 'Lomba Antar Unit Utama, Itjen Raih Juara I Lomba Kebersihan');

-- --------------------------------------------------------

--
-- Table structure for table `master_dampak`
--

CREATE TABLE `master_dampak` (
  `id` int(11) NOT NULL,
  `Rangking` varchar(255) NOT NULL,
  `Penilaian` varchar(255) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_dampak`
--

INSERT INTO `master_dampak` (`id`, `Rangking`, `Penilaian`, `value`) VALUES
(1, 'Kritis', 'Hasil negatif atau kehilangan peluang yang sangat penting untuk mencapai tujuan', 5),
(2, 'Major', 'Hasil negatif atau kehilangan peluang yang cenderung memiliki dampak yang relatif besar pada kemampuan untuk memenuhi tujuan', 4),
(3, 'Moderate', 'Hasil negatif atau kehilangan peluang yang cenderung memiliki dampak yang relatif rendah pada kemampuan untuk memenuhi tujuan', 3),
(4, 'Minor', 'Hasil negatif atau kehilangan peluang yang cenderung memiliki dampak yang relatif rendah pada kemampuan untuk memenuhi tujuan', 2),
(5, 'Tidak Berarti', 'Hasil negatif atau kehilangan peluang yang cenderung memiliki dampak yang relatif rendah pada kemampuan untuk memenuhhi tujuan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `master_efektifitas`
--

CREATE TABLE `master_efektifitas` (
  `id` int(11) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `definisi` varchar(255) NOT NULL,
  `factor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_efektifitas`
--

INSERT INTO `master_efektifitas` (`id`, `kategori`, `definisi`, `factor`) VALUES
(1, 'Sangat Baik', 'Eksposur risiko secara efektif dikendalikan dan dikelola', 20),
(2, 'Baik', 'Mayoritas eksposur risikoo secara efektif dikendalikan dan dikelola', 40),
(3, 'Memuaskan', 'Ada ruang untuk diperbaiki', 65),
(4, 'Lemah', 'Beberapa eksposur risiko tampaknya dikendalikan, tetapi ada kekurangan utama', 80),
(5, 'Tidak memuaskan', 'Tindakan pengendalian tidak efektif', 90);

-- --------------------------------------------------------

--
-- Table structure for table `master_foto`
--

CREATE TABLE `master_foto` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_foto`
--

INSERT INTO `master_foto` (`id`, `url`, `deskripsi`) VALUES
(16, '~/Uploads/download-1.jpg', 'test 001'),
(17, '~/Uploads/1473113394-circle-facebook.png', 'test 002'),
(18, '~/Uploads/download-1.jpg', 'test 001'),
(19, '~/Uploads/1473113394-circle-facebook.png', 'test 002'),
(20, '~/Uploads/download-1.jpg', 'test 001'),
(21, '~/Uploads/1473113394-circle-facebook.png', 'test 002'),
(22, '~/Uploads/download-1.jpg', 'test 001'),
(23, '~/Uploads/1473113394-circle-facebook.png', 'test 002'),
(24, '~/Uploads/download-1.jpg', 'test 001'),
(25, '~/Uploads/1473113394-circle-facebook.png', 'test 002'),
(26, '~/Uploads/download-1.jpg', 'test 001'),
(27, '~/Uploads/1473113394-circle-facebook.png', 'test 002'),
(28, '~/Uploads/download-1.jpg', 'test 001'),
(29, '~/Uploads/1473113394-circle-facebook.png', 'test 002'),
(30, '~/Uploads/download-1.jpg', 'test 001'),
(31, '~/Uploads/1473113394-circle-facebook.png', 'test 002'),
(32, '~/Uploads/download-1.jpg', 'test 001'),
(33, '~/Uploads/1473113394-circle-facebook.png', 'test 002'),
(34, '~/Uploads/download-1.jpg', 'test 001'),
(35, '~/Uploads/1473113394-circle-facebook.png', 'test 002'),
(36, '~/Uploads/download-1.jpg', 'test 001'),
(37, '~/Uploads/1473113394-circle-facebook.png', 'test 002');

-- --------------------------------------------------------

--
-- Table structure for table `master_golongan`
--

CREATE TABLE `master_golongan` (
  `id` int(11) NOT NULL,
  `golongan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_golongan`
--

INSERT INTO `master_golongan` (`id`, `golongan`) VALUES
(2, 'III/a'),
(3, 'III/b'),
(4, 'III/c'),
(5, 'III/d'),
(6, 'IV/a'),
(7, 'IV/b'),
(8, 'IV/c'),
(9, 'IV/d'),
(10, 'IV/d'),
(11, 'II/a'),
(12, 'I/b');

-- --------------------------------------------------------

--
-- Table structure for table `master_inherent`
--

CREATE TABLE `master_inherent` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `min_val` int(11) NOT NULL,
  `max_val` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_inherent`
--

INSERT INTO `master_inherent` (`id`, `name`, `min_val`, `max_val`) VALUES
(1, 'Maximum', 20, 100),
(2, 'High', 15, 20),
(3, 'Medium', 10, 15),
(4, 'Low', 5, 10),
(5, 'Minimum', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `master_jabatan`
--

CREATE TABLE `master_jabatan` (
  `id` int(11) NOT NULL,
  `jabatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_jabatan`
--

INSERT INTO `master_jabatan` (`id`, `jabatan`) VALUES
(3, 'Auditor Utama'),
(4, 'Auditor Madya'),
(5, 'Auditor Pertama'),
(6, 'Auditor Muda'),
(7, 'Auditor Penyelia'),
(8, 'Auditor Lanjut'),
(9, 'Moderator');

-- --------------------------------------------------------

--
-- Table structure for table `master_karyawan`
--

CREATE TABLE `master_karyawan` (
  `id` int(11) NOT NULL,
  `nip` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `tlp` varchar(255) DEFAULT NULL,
  `id_jabatan` int(11) DEFAULT NULL,
  `id_golongan` int(11) DEFAULT NULL,
  `id_peran` int(11) DEFAULT NULL,
  `is_kordinator` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_karyawan`
--

INSERT INTO `master_karyawan` (`id`, `nip`, `nama`, `alamat`, `tlp`, `id_jabatan`, `id_golongan`, `id_peran`, `is_kordinator`) VALUES
(75, ',195921011985031001', 'Joko Sapto Pratolo, M.Si', 'Jl. Buni 28 RT01/04 Kel. Munjul Cibubur Jakarta Timur', '081279442794', 3, 10, 3, b'1'),
(76, ',196102281198703002', 'Prabarini Pramaningsih, SH, M.Pd,M.Ak', '', '', 3, 9, 2, b'0'),
(77, ',195708191984032001', 'Dra. Nina Kencana NS, MM', 'Kp. Moch. Yamin No 142 B 004/016 Kel. Baros Kec. Cimahi Tengah Kota Cimahi', '0897890012', 3, 9, 3, b'1'),
(78, ',195810241983121001', 'Drs, Darsono', '', '', 4, 8, 2, b'0'),
(79, ',196410051989031003', 'Iwan Mustafa, SE. MM', NULL, NULL, 4, 6, NULL, NULL),
(80, ',196504271988121001', 'Drs. A. Junaidi Gunawan', NULL, NULL, 4, 7, NULL, NULL),
(81, ',196109251982031002', 'Facri Noekman, SE', NULL, NULL, 4, 6, NULL, NULL),
(82, ',195907201986011001', 'Yaya Mulya, SH', NULL, NULL, 4, 6, NULL, NULL),
(83, ',195910311988021001', 'Drs.Edy Wijaya Kusuma,M.Si', NULL, NULL, 4, 7, NULL, NULL),
(84, ',196011101989031003', 'Hir. Haroid Parningotan.H', NULL, NULL, 4, 6, NULL, NULL),
(85, ',196203201989032001', 'Dra,Hendri Yetni A Muis', NULL, NULL, 4, 8, NULL, NULL),
(86, ',197001071994032002', 'Momy Siti Armilah,SH,M.Si', NULL, NULL, 4, 7, NULL, NULL),
(87, ',196302131984031001', 'Drs. Satiri', NULL, NULL, 4, 6, NULL, NULL),
(88, ',195905281988021001', 'Drs, Eduart B Ginting', NULL, NULL, 4, 7, NULL, NULL),
(89, ',196506131994031001', 'Drs, Dedy Linggajaya, MM', NULL, NULL, 4, 6, NULL, NULL),
(90, ',196909271988121001', 'waluyo, S.IP, M.Si', NULL, NULL, 4, 6, NULL, NULL),
(91, ',196512021987031003', 'Danang Syahrul,SE', NULL, NULL, 4, 8, NULL, NULL),
(92, ',195904271988021001', 'Dr. H. Indra Jaya', NULL, NULL, 4, 6, NULL, NULL),
(93, ',196908241988122001', 'Ina Suharti,SIP,M.Si', NULL, NULL, 4, 7, NULL, NULL),
(94, ',196606251987032002', 'Puspita Yunia Stri, SH', NULL, NULL, 4, 6, NULL, NULL),
(95, ',196212031991031002', 'Drs.Kustri Waluyo, MM', NULL, NULL, 4, 6, NULL, NULL),
(96, ',196311051989031002', 'Drs.Hiswara', NULL, NULL, 4, 7, NULL, NULL),
(97, ',196611081992031001', 'Subiyantoro,SH,M.Si', NULL, NULL, 4, 6, NULL, NULL),
(98, ',195808061982032002', 'Dra. Mitra Susanti, M.Si', NULL, NULL, 4, 8, NULL, NULL),
(99, ',196809211988122000', 'Purwaniati Nugraheni,SH,MM', NULL, NULL, 4, 7, NULL, NULL),
(100, ',196204281988032001', 'Dra, Andriati Condro Arsetyo, M.Pd', NULL, NULL, 4, 7, NULL, NULL),
(101, ',196211141991031002', 'Urip Widodo,SH.,M.Si', NULL, NULL, 4, 7, NULL, NULL),
(102, ',195704161984111011', 'Drs, Arsa Dinata. AS', NULL, NULL, 4, 6, NULL, NULL),
(103, ',197107171994012001', 'Tety Yliati, SPd', NULL, NULL, 4, 6, NULL, NULL),
(104, ',195712311986031013', 'Drs, Ambo Sakka', NULL, NULL, 4, 8, NULL, NULL),
(105, ',196204251984122002', 'Endang Lestiningrum M.Pd', NULL, NULL, 4, 7, NULL, NULL),
(106, ',195812071985031001', 'John Swart Arroan, SE', NULL, NULL, 4, 9, NULL, NULL),
(107, ',196401121994031001', 'Sunarto,SH,MM', NULL, NULL, 4, 6, NULL, NULL),
(108, ',196011231987032001', 'Dra,Mindo BR Purba', NULL, NULL, 4, 6, NULL, NULL),
(109, ',195703161988031001', 'M. Nurdin,SH', NULL, NULL, 4, 7, NULL, NULL),
(110, ',196706171994031001', 'R.Saptoadji P,SH,M.Si', NULL, NULL, 4, 6, NULL, NULL),
(111, ',196202051988022001', 'Dra, Eriawani, M.Ak', NULL, NULL, 4, 7, NULL, NULL),
(112, ',195809071980031002', 'Drs.RH.Riyanto,M.M', NULL, NULL, 4, 7, NULL, NULL),
(113, ',196912121995122001', 'Nureka Waty,S.Ssi', NULL, NULL, 4, 5, NULL, NULL),
(114, ',107308232000031001', 'Yahya Sulaeman,SH,MM', NULL, NULL, 6, 5, NULL, NULL),
(115, ',197401062005011002', 'Ahmar Hafid,SH,MH', NULL, NULL, 6, 5, NULL, NULL),
(116, ',196811121988121001', 'Hartono,M.Pd', NULL, NULL, 6, 4, NULL, NULL),
(117, ',19810602005011004', 'Rian Sopian,SE,MMSi', NULL, NULL, 6, 5, NULL, NULL),
(118, ',196707031994031002', 'Rizal Rifai,SH', NULL, NULL, 6, 5, NULL, NULL),
(119, ',196010131987032001', 'Sri Rejeki,S.Sos', NULL, NULL, 6, 5, NULL, NULL),
(120, ',196509041991031003', 'Undang, S.IP', NULL, NULL, 6, 4, NULL, NULL),
(121, ',196004181960032002', 'Gina Aprilawatie,S.Pd.,M.Si', NULL, NULL, 6, 5, NULL, NULL),
(122, ',196808031990102001', 'Nur Sulasih', NULL, NULL, 6, 4, NULL, NULL),
(123, ',196704131987032001', 'Nirma, S.IP', NULL, NULL, 6, 4, NULL, NULL),
(124, ',196903051988122002', 'Semi Widayati, S.IP', NULL, NULL, 6, 5, NULL, NULL),
(125, ',196502071986011001', 'Zaenal Abidin,S.Pd', NULL, NULL, 6, 4, NULL, NULL),
(126, ',197001121988021000', 'Tri Sukmono Joko PBS', NULL, NULL, 6, 4, NULL, NULL),
(127, ',19609052001121003', 'Setyo Bimandoko,SE,M.Ak', NULL, NULL, 6, 4, NULL, NULL),
(128, ',196606081988091001', 'Sugiyanto,SH', NULL, NULL, 6, 5, NULL, NULL),
(129, ',195902221988031001', 'Firdaus,S.Sos', NULL, NULL, 6, 4, NULL, NULL),
(130, ',196301201992031001', 'Muhammad Basri', NULL, NULL, 6, 5, NULL, NULL),
(131, ',196808061988121002', 'Harsono, S.IP, M.Si', NULL, NULL, 6, 5, NULL, NULL),
(132, ',197305052005011002', 'Ausi kurnia Kawoco, SE, M.Ak', NULL, NULL, 5, 3, NULL, NULL),
(133, ',197206062000031001', 'Agus Setyo Wantoro,SH', NULL, NULL, 5, 4, NULL, NULL),
(134, ',196603161989011001', 'Tugimin,SIP', NULL, NULL, 5, 3, NULL, NULL),
(135, ',198704092009122003', 'Kusmaningayu Wulandari, SE', NULL, NULL, 5, 3, NULL, NULL),
(136, ',108309212008122002', 'Herlina Corina,SE', NULL, NULL, 5, 3, NULL, NULL),
(137, ',196504181994031003', 'Dede Rudiana,S.Sos, M.Si', NULL, NULL, 5, 5, NULL, NULL),
(138, ',1968072319900112001', 'Yuliafni,S.S', NULL, NULL, 5, 3, NULL, NULL),
(139, ',1984070320080110006', 'Ari Fitria Wibowo, S.Kom', NULL, NULL, 5, 3, NULL, NULL),
(140, ',196403131987032001', 'Rosiyanti, S.Pd', NULL, NULL, 5, 5, NULL, NULL),
(141, ',196605251988121001', 'Budiyono, S.Sos', NULL, NULL, 5, 3, NULL, NULL),
(142, ',198307102108121002', 'Aditya Wicaksono, S.Sos', NULL, NULL, 5, 3, NULL, NULL),
(143, ',196307111990011001', 'Makmun Ali S.Pd', NULL, NULL, 5, 4, NULL, NULL),
(144, ',196605251988121001', 'Budiyono, S.Sos', NULL, NULL, 5, 3, NULL, NULL),
(145, ',106204231982101001', 'Chaidir', NULL, NULL, 7, 4, NULL, NULL),
(146, ',197812192009121002', 'Fanni Arimulya Nugraha,SKOM', 'alamatnya dimana ?', '0897890012', 7, 2, 2, NULL),
(147, ',196009081984031002', 'Muntohar Edy Purbono', NULL, NULL, 7, 5, NULL, NULL),
(148, ',196010101981011001', 'Marsono,SPd', NULL, NULL, 7, 4, NULL, NULL),
(149, ',196809041988121001', 'Rudy Restu,S.Akt', NULL, NULL, 7, 4, NULL, NULL),
(150, ',196512131987031001', 'Subiantoro', NULL, NULL, 7, 3, NULL, NULL),
(151, ',195804121988021001', 'Muhammad Ansori, Sm.Hk', NULL, NULL, 7, 4, NULL, NULL),
(152, ',196404111988022', 'Tini Lestari,BA', NULL, NULL, 8, 4, NULL, NULL),
(153, ',196702061900032', 'Kori Isniasari', NULL, NULL, 8, 2, NULL, NULL),
(154, ',195903031984031003', 'Joko Indriatno, SE', NULL, NULL, 8, 3, NULL, NULL),
(155, '1234567890', 'welly hegar', 'melebar', '123456666', 4, 2, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_kata_pengantar`
--

CREATE TABLE `master_kata_pengantar` (
  `id` int(11) NOT NULL,
  `kata` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_kata_pengantar`
--

INSERT INTO `master_kata_pengantar` (`id`, `kata`) VALUES
(1, '<h1>Assalamualaikum wr wb.</h1>\r\n<p style=\"text-align: left;\">Era modern menuntut penggunaan informasi dan teknologi dalam pengelolaan suatu organisasi. Sebagai bentuk komitmen Inspektorat III dalam mewujukan organisasi pengawasan modern, maka sejak tahun 2016 memanfaatkan \"Smart Information Application\"</p>');

-- --------------------------------------------------------

--
-- Table structure for table `master_kode`
--

CREATE TABLE `master_kode` (
  `id` int(11) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `id parent` int(11) DEFAULT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_kode`
--

INSERT INTO `master_kode` (`id`, `kode`, `deskripsi`, `id parent`, `level`) VALUES
(1, '100', 'Temuan Ketidakpatuhan Terhadap Peraturan Perundang-Undangan', NULL, 1),
(2, '200', 'Temuan Kelemahan Sistem Pengendalian Intern', NULL, 1),
(3, '300', 'Temuan 3E (Efektif, Efisien, dan Ekonomis)', NULL, 1),
(4, '1.01.', 'Kerugian negara/daerah atau kerugian negara/daerah yang terjadi pada perusahaan milik negara/daerah.', 1, 2),
(5, '1.02.', 'Potensi kerugian negara/daerah atau kerugian negara/daerah yang terjadi pada perusahaan milik negara/daerah.', 1, 2),
(6, '1.03.', 'Kekurangan penerimaan negara/daerah atau perusahaan milik negara/daerah', 1, 2),
(7, '1.04.', 'Administrasi', 1, 2),
(8, '1.05.', 'Indikasi Tindak Pidana', 1, 2),
(9, '2.01.', 'Kelemahan sistem pengendalian akuntansi dan pelaporan', 2, 2),
(10, '2.02.', 'Kelemahan sistem pengendalian pelaksanaan anggaran dan belanja', 2, 2),
(11, '2.03.', 'Kelemahan struktur pengendalian intern', 2, 2),
(12, '3.01.', 'Ketidakhematan/pemborosan/ketidakekonomisan', 3, 2),
(13, '3.02.', 'Ketidakefisienan', 3, 2),
(14, '3.03.', 'Ketidakefektifan', 3, 2),
(15, '1.01.01.', 'Belanja dan/atau pengadaan barang/jasa aktif', 4, 3),
(16, '1.01.02.', 'Rekanan pengadaan barang/jasa tidak menyelesaikan pekerjaan', 4, 3),
(17, '1.01.03.', 'Kekurangan volume pekerjaan dan/atau barang', 4, 3),
(18, '1.01.04.', 'Kelebihan pembayaran selain kekurangan volume pekerjaan dan/atau baran', 4, 3),
(19, '1.01.05.', 'Pemahalan harga (Mark up)', 4, 3),
(20, '1.01.06.', 'Penggunaan uang/barang untuk kepentingan pribadi', 4, 3),
(21, '1.01.07.', 'Pembayaran honorarium dan/atau biaya perjalana dinas ganda dan/atau melebihi standar yang ditetapkan', 4, 3),
(22, '1.01.08.', 'Spesifikasi barang/jasa yang diterima tidak sesuai dengan kontrak', 4, 3),
(23, '1.01.09.', 'Belanja tidak sesuai atau melebihi ketentuan', 4, 3),
(24, '1.01.10.', 'Pengembalian pinjaman/piutang atau dana bergurlir macet', 4, 3),
(25, '1.01.11.', 'Kelebihan penetapan dan pembayaran restitusi pajak atau penetapan kompensasi kerugian', 4, 3),
(26, '1.01.12.', 'Penjualan/pertukaran/penghapusan aset negara/daerah tidak sesuai ketentuan dan merugikan negara/daerah', 4, 3),
(27, '1.01.13.', 'Pengenaan ganit kerugian negara belum/tidak dilaksanakan sesuai ketentuan', 4, 3),
(28, '1.01.14.', 'Entitas belum/tidak melaksanakan tuntutan perbendaharaan (TP) sesuai ketentuan', 4, 3),
(29, '1.01.15.', 'Penghapusan hak tagih tidak sesuai ketentuan', 4, 3),
(30, '1.01.16.', 'Pelanggaran ketentuan pemberian diskon penjualan', 4, 3),
(31, '1.01.17.', 'Penentuan HPP terlalu rendah sehingga penentuan harga jual lebih rendah dari seharusnya', 4, 3),
(32, '1.01.18.', 'Jaminan pelaksanaan dalam pelaksanaan pekerjaan, pemanfaatan barang dan pemberian fasilitas tidak dapat dicairkan', 4, 3),
(33, '1.01.19.', 'Penyetoran penerimaan negara/daerah dengan bukti fiktif', 4, 3),
(34, '1.02.01.', 'Kelebihan pembayaran dalam pengadaan barang/jasa tetapi pembayaran pekerhaan belum dilakukan sebagian atau seluruhnya', 5, 3),
(35, '1.02.02.', 'Rekanan belum melaksanakan kewajiban pemeliharaan barang hasil', 5, 3),
(36, '1.02.03.', 'Aset dikuasai pihak lain', 5, 3),
(37, '1.02.04.', 'Pembelian aset yang berstatus sengketa', 5, 3),
(38, '1.02.05.', 'Aset tidak diketahui keberadaannya', 5, 3),
(39, '1.02.06.', 'Pemberian jaminan pelaksanaan dalam pelaksanaan pekerjaan, pemanfaatan barang dan pemberian fasilitas tidak sesuai ketentuan', 5, 3),
(40, '1.02.07.', 'Pihak ketiga belum melaksankan kewajiban untuk menyerahkan aset kepada negara/daerah', 5, 3),
(41, '1.02.08.', 'Piutang/pinjaman atau dana bergulir yang berpotensi tidak tertagih', 5, 3),
(42, '1.02.09.', 'Penghapusan piutang tidak sesuai ketentuan', 5, 3),
(43, '1.02.10.', 'Pencairan anggaran pada akhir tahun anggaran untuk pekerjaan yang belum selesai', 5, 3),
(44, '1.03.01.', 'Penerimaan negara/daerah atau denda keterlambatan pekerjaan belum/tidak ditetapkan dipungut/diterima/disetor ke kas negara/daerah aau perusahaan milik negara/daerah', 6, 3),
(45, '1.03.02.', 'Penggunaan langsung penerimaan negara/daerah', 6, 3),
(46, '1.03.03.', 'Dana perimbangan yang telah ditetapkan belum masuk ke kas daerah', 6, 3),
(47, '1.03.04.', 'Penerimaan negara/daerah diterima atau digunakan oleh instansi yang tidak berhak', 6, 3),
(48, '1.03.05.', 'Pengenaan tarif pajak/PNBP lebih rendah dari ketentuan', 6, 3),
(49, '1.03.06.', 'Koreksi perhitungan bagi hasil dengan KKS', 6, 3),
(50, '1.03.0.7.', 'Kelebihan pembayaran subsidi oleh pemerintah', 6, 3),
(51, '1.04.01.', 'Pertanggungjawaban tidak akuntabel (bukti tidak lengkap/tidak valid)', 7, 3),
(52, '1.04.02.', 'Pekerjaan dilaksanakan mendahului kontrak atau penetapan anggaran', 7, 3),
(53, '1.04.03.', 'Proses pengadaan barang/jasa tidak sesuai ketentuan (tidak menimbulkan kerugian negara)', 7, 3),
(54, '1.04.04.', 'Pemecahan kontrak untuk menghindari pelelangan', 7, 3),
(55, '1.04.05.', 'Pelaksanaan leleang secara performa ', 7, 3),
(56, '1.04.06.', 'Penyimpangan terhadap peraturan perundang-undangan bidang pengelolaan perlengkapan atau barang milik negara/daerah/perusahaan', 7, 3),
(57, '1.04.07.', 'Penyimpangan terhadap peraturan perundang-undangan bidang tertentu lainnya seperti kehutanan, pertambangan, perpajakan, dll.', 7, 3),
(58, '1.04.08.', 'Koreksi perhitungan subsidi/kewajiban pelayanan umum', 7, 3),
(59, '1.04.09.', 'Pembentukan cadangan piutang, perhitungan penyusutan atau amortisasi tidak sesuai ketentuan', 7, 3),
(60, '1.04.10.', 'Penyetoran penerimaan negara/daerah atau kas di bendaharawan ke kas negara/daerah melebihi batas waktu yang ditentukan', 7, 3),
(61, '1.04.11.', 'Pertanggungjawaban/penyetoran uang persedian melebihi batas waktu yang ditentukan ', 7, 3),
(62, '1.04.12.', 'Sisa kas di bendara pengeluaran akhir tahuna anggaran belum/tidak disetor ke kas negara/daerah', 7, 3),
(63, '1.04.13.', 'Pengeluaran investasi pemerintah tidak didukung bukti yang sah', 7, 3),
(64, '1.04.14.', 'Kepemilikian aset tidak/belum didukung bukti yang sah', 7, 3),
(65, '1.04.15.', 'Pengalihan anggaran antar MAK tidak sah', 7, 3),
(66, '1.04.16.', 'Pelampauan pagu anggaran', 7, 3),
(67, '1.05.01.', 'Indikasi tindak pidana korupsi', 8, 3),
(68, '1.05.02.', 'Indikasi tindak pidana perbankan', 8, 3),
(69, '1.05.03.', 'Indikasi tindak pidana perpajakan', 8, 3),
(70, '1.05.04.', 'Indikasi tindak pidana kepabeanan', 8, 3),
(71, '1.05.05.', 'Indikasi tindak pidana kehutanan', 8, 3),
(72, '1.05.06.', 'Indikasi tindak pidana pasar modal', 8, 3),
(73, '1.05.07.', 'Indikasi tindak pidana khusus lainnya', 8, 3),
(74, '2.01.01.', 'Pencatatan tidak/belum dilakuakn atau tidak akurat', 9, 3),
(75, '2.01.02.', 'Proses penyusunan laporan tidak sesuai ketentuan', 9, 3),
(76, '2.01.03.', 'Entitas terlambat menyampaikan laporan', 9, 3),
(77, '2.01.04.', 'Sistem informasi akuntansi dan pelaporan tidak memadai', 9, 3),
(78, '2.01.05.', 'Sistem informasi akuntansi dan pelaporan tidak memadai', 9, 3),
(79, '2.02.01.', 'Perencanaan kegiatan tidak memadai', 10, 3),
(80, '2.02.02.', 'Mekanisme pemungutan, penyetoran dan pelaporan serta penggunaan penerimaan negara/daerah/perusahaan dan hibah tidak sesuai ketentuan', 10, 3),
(81, '2.02.03.', 'Penyimpangan terhadap peraturan perundang-undangan bidang teknis tertentu atau ketentuan intern organisasi yang diperiksa tentang pendapatan dan belanja', 10, 3),
(82, '2.02.04.', 'Pelaksanaan belanja di luar mekanisme APBN/APBD', 10, 3),
(83, '2.02.05.', 'Penetapan/pelaksanaan kebijakan tidak tepat atau belum dilakukan berakibat hilangnya potensi penerimaan/pendapatan', 10, 3),
(84, '2.02.06.', 'Penetapan/pelaksanaan kebijakan tidak tepat atau belum dilakukan berakibat peningkatan biaya/belanja', 10, 3),
(85, '2.02.07.', 'Kelemahan pengelolaan fisik aset', 10, 3),
(86, '2.03.01.', 'Entitas tidak memiliki SOP yang formal untuk suatu prosedur atau keseluruhan prosedur', 11, 3),
(87, '2.03.02.', 'SOP yang ada pada entitas tidak berjalan secara optimal atau tidak ditaati', 11, 3),
(88, '2.03.03.', 'Entitas tidak memiliki satuan pengawas intern', 11, 3),
(89, '2.03.04.', 'Satuan pengawas intern yang ada tidak memadai atau tidak berjalan optimal', 11, 3),
(90, '2.03.05.', 'Tidak ada pemisahaan tugas dan fungsi yang memadai ', 11, 3),
(91, '3.01.01.', 'Pengadaan barang/jasa melebihi kebutuhan', 12, 3),
(92, '3.01.02.', 'Penetapan kualtias dan kuantitas barang/jasa yang digunakan tidak sesuai standar', 12, 3),
(93, '3.01.03.', 'Pemborosan keuangan negara/daerah/perusahaan atau kemahalan harga', 12, 3),
(94, '3.02.01.', 'Pengunaan kuantitas input untuk satu satuan output lebih besar/tinggi dari yang seharusnya', 12, 3),
(95, '3.02.02.', 'Penggunaan kualitas input untuk satu satuan output lebih tinggi dari seharusnya', 12, 3),
(96, '3.03.01.', 'Penggunaan anggaran tidak tepat sasaran/tidak sesuai peruntukan', 13, 3),
(97, '3.03.02.', 'Pemanfaatan barang/jasa dilakukan tidak sesuai dengan rencana yang ditetapkan', 13, 3),
(98, '3.03.03.', 'Barang yang dibeli belum/tidak dapat dimanfaatkan', 13, 3),
(99, '3.03.04.', 'Pemanfaatan barang/jasa tidak berdampak terhadap pencapaian tujuan organisasi', 13, 3),
(100, '3.03.05.', 'Pelaksanaan kegiatan terlambat/terhambat sehingga mempengaruhi pencapaian tujuan organisasi', 13, 3),
(101, '3.03.06.', 'Pelayanan kepada maasyarakat tidak optimal', 13, 3),
(102, '3.03.07.', 'Fungsi atau tugas instansi yang diperiksa tidak diselenggarakan dengan baik termasuk target penerimaan tidak tercapai', 13, 3),
(103, '3.03.08.', 'Penggunaan biaya promosi/pemasaraan tidak efektif', 13, 3);

-- --------------------------------------------------------

--
-- Table structure for table `master_pangkat`
--

CREATE TABLE `master_pangkat` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `master_pengumuman`
--

CREATE TABLE `master_pengumuman` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `pengumuman` text NOT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_pengumuman`
--

INSERT INTO `master_pengumuman` (`id`, `judul`, `pengumuman`, `createddate`, `modifieddate`) VALUES
(1, 'LOUNCHING SMART APLICATION INFORMATION', '<p>Kepada Yth: Auditor dan Staf Inspektorat III</p><p>Sejak tanggal 10 Juni 2016, aplikasi ini resmi kita gunakan sebagai bentuk keinginan kita untuk menggunakan IT dalam membantu pelaksanaan pengawasan.</p><p>Selamat menggunakan.</p><p>Bravo</p>', '2016-06-10 14:01:48', '2016-06-10 14:01:48'),
(2, 'Sosialisasi Instrumen DAK/Sergu/Tamsil', '<p>Kepada:</p><p>Bapak/Ibu Auditor Inspektorat III</p><p>Hari ini tanggal 13 Juni 2016, di ruang sidang lantai VI akan diadakan sosialisasi instrumen pemantauan DAK/Sergu/Tamsil pada pukul 15.00 s.d selesai.</p><p>Oleh karena itu, diharapkan kehadirannya tepat waktu. Terima kasih</p>', '2016-06-13 07:46:05', '2016-06-13 07:46:05');

-- --------------------------------------------------------

--
-- Table structure for table `master_peran`
--

CREATE TABLE `master_peran` (
  `id` int(11) NOT NULL,
  `peran` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_peran`
--

INSERT INTO `master_peran` (`id`, `peran`) VALUES
(2, 'Kelompok I'),
(3, 'Kelompok II'),
(4, 'Kelompok III'),
(5, 'Kelompok IV'),
(6, 'Kelompok V'),
(7, 'Kelompok VI'),
(8, 'Kasubag'),
(10, 'BPP'),
(11, 'Auditor'),
(12, 'Staff TU');

-- --------------------------------------------------------

--
-- Table structure for table `master_probality`
--

CREATE TABLE `master_probality` (
  `id` int(11) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_probality`
--

INSERT INTO `master_probality` (`id`, `kategori`, `deskripsi`, `value`) VALUES
(1, 'Hampir Pasti', 'Risiko ini sudah terjadi, atau mungkin terjadi lebih dari sekali dalam 12 bulan ke depan', 5),
(2, 'Sering', 'Risiko dengan mudah bisa terjadi dan mungkin terjadi setidaknya sekali dalam 12 bulan kedepan', 4),
(3, 'Moderate', 'Ada kesempatan yang rata-rata di atas bahwa risiko akan terjadi setidaknya sekali dalam tiga tahun ke depan', 3),
(4, 'Jarang', 'Risiko terjadi jarang dan tidak mungkin terjadi dalam tiga tahun ke depan', 2),
(5, 'Sangat Jarang', 'Risiko dibayangkan tetapi hanya mungkin terjadi dalam keadaan ekstrim', 1);

-- --------------------------------------------------------

--
-- Table structure for table `master_residu`
--

CREATE TABLE `master_residu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `min_val` double(11,2) NOT NULL,
  `max_val` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_residu`
--

INSERT INTO `master_residu` (`id`, `name`, `min_val`, `max_val`) VALUES
(1, 'Maximum', 10.00, 100.00),
(2, 'High', 7.50, 10.00),
(3, 'Medium', 5.00, 7.50),
(4, 'Low', 2.50, 5.00),
(5, 'Minimum', 0.00, 2.50);

-- --------------------------------------------------------

--
-- Table structure for table `master_role`
--

CREATE TABLE `master_role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_role`
--

INSERT INTO `master_role` (`id`, `name`) VALUES
(4, 'admin'),
(5, 'anggota');

-- --------------------------------------------------------

--
-- Table structure for table `master_user`
--

CREATE TABLE `master_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_karyawan` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_user`
--

INSERT INTO `master_user` (`id`, `username`, `password`, `id_karyawan`, `role`) VALUES
(3, 'admin', 'admin123!', NULL, 1),
(19, '195921011985031001', '195921011985031001', 75, 2),
(20, '196102281198703002', '196102281198703002', 76, 2),
(21, '195708191984032001', '195708191984032001', 77, 2),
(22, '195810241983121001', '195810241983121001', 78, 2),
(23, '196410051989031003', '196410051989031003', 79, 2),
(24, '196504271988121001', '196504271988121001', 80, 2),
(25, '196109251982031002', '196109251982031002', 81, 2),
(26, '195907201986011001', '195907201986011001', 82, 2),
(27, '195910311988021001', '195910311988021001', 83, 2),
(28, '196011101989031003', '196011101989031003', 84, 2),
(29, '196203201989032001', '196203201989032001', 85, 2),
(30, '197001071994032002', '197001071994032002', 86, 2),
(31, '196302131984031001', '196302131984031001', 87, 2),
(32, '195905281988021001', '195905281988021001', 88, 2),
(33, '196506131994031001', '196506131994031001', 89, 2),
(34, '196909271988121001', '196909271988121001', 90, 2),
(35, '196512021987031003', '196512021987031003', 91, 2),
(36, '195904271988021001', '195904271988021001', 92, 2),
(37, '196908241988122001', '196908241988122001', 93, 2),
(38, '196606251987032002', '196606251987032002', 94, 2),
(39, '196212031991031002', '196212031991031002', 95, 2),
(40, '196311051989031002', '196311051989031002', 96, 2),
(41, '196611081992031001', '196611081992031001', 97, 2),
(42, '195808061982032002', '195808061982032002', 98, 2),
(43, '196809211988122000', '196809211988122000', 99, 2),
(44, '196204281988032001', '196204281988032001', 100, 2),
(45, '196211141991031002', '196211141991031002', 101, 2),
(46, '195704161984111011', '195704161984111011', 102, 2),
(47, '197107171994012001', '197107171994012001', 103, 2),
(48, '195712311986031013', '195712311986031013', 104, 2),
(49, '196204251984122002', '196204251984122002', 105, 2),
(50, '195812071985031001', '195812071985031001', 106, 2),
(51, '196401121994031001', '196401121994031001', 107, 2),
(52, '196011231987032001', '196011231987032001', 108, 2),
(53, '195703161988031001', '195703161988031001', 109, 2),
(54, '196706171994031001', '196706171994031001', 110, 2),
(55, '196202051988022001', '196202051988022001', 111, 2),
(56, '195809071980031002', '195809071980031002', 112, 2),
(57, '196912121995122001', '196912121995122001', 113, 2),
(58, '107308232000031001', '107308232000031001', 114, 2),
(59, '197401062005011002', '197401062005011002', 115, 2),
(60, '196811121988121001', '196811121988121001', 116, 2),
(61, '19810602005011004', '19810602005011004', 117, 2),
(62, '196707031994031002', '196707031994031002', 118, 2),
(63, '196010131987032001', '196010131987032001', 119, 2),
(64, '196509041991031003', '196509041991031003', 120, 2),
(65, '196004181960032002', '196004181960032002', 121, 2),
(66, '196808031990102001', '196808031990102001', 122, 2),
(67, '196704131987032001', '196704131987032001', 123, 2),
(68, '196903051988122002', '196903051988122002', 124, 2),
(69, '196502071986011001', '196502071986011001', 125, 2),
(70, '197001121988021000', '197001121988021000', 126, 2),
(71, '19609052001121003', '19609052001121003', 127, 2),
(72, '196606081988091001', '196606081988091001', 128, 2),
(73, '195902221988031001', '195902221988031001', 129, 2),
(74, '196301201992031001', '196301201992031001', 130, 2),
(75, '196808061988121002', '196808061988121002', 131, 2),
(76, '197305052005011002', '197305052005011002', 132, 2),
(77, '197206062000031001', '197206062000031001', 133, 2),
(78, '196603161989011001', '196603161989011001', 134, 2),
(79, '198704092009122003', '198704092009122003', 135, 2),
(80, '108309212008122002', '108309212008122002', 136, 2),
(81, '196504181994031003', '196504181994031003', 137, 2),
(82, '1968072319900112001', '1968072319900112001', 138, 2),
(83, '1984070320080110006', '1984070320080110006', 139, 2),
(84, '196403131987032001', '196403131987032001', 140, 2),
(85, '196605251988121001', '196605251988121001', 141, 2),
(86, '198307102108121002', '198307102108121002', 142, 2),
(87, '196307111990011001', '196307111990011001', 143, 2),
(88, '196605251988121001', '196605251988121001', 144, 2),
(89, '106204231982101001', '106204231982101001', 145, 2),
(90, '197812192009121002', '197812192009121002', 146, 2),
(91, '196009081984031002', '196009081984031002', 147, 2),
(92, '196010101981011001', '196010101981011001', 148, 2),
(93, '196809041988121001', '196809041988121001', 149, 2),
(94, '196512131987031001', '196512131987031001', 150, 2),
(95, '195804121988021001', '195804121988021001', 151, 2),
(96, '196404111988022', '196404111988022', 152, 2),
(97, '196702061900032', '196702061900032', 153, 2),
(98, '195903031984031003', '195903031984031003', 154, 2),
(99, 'kogure13', '1234567890', NULL, 1),
(100, '1234567890', '1234567890', 155, 2);

-- --------------------------------------------------------

--
-- Table structure for table `narasumber_karyawan`
--

CREATE TABLE `narasumber_karyawan` (
  `id` int(11) NOT NULL,
  `id karyawan` int(11) DEFAULT NULL,
  `topik` varchar(255) NOT NULL,
  `penyalanggara` varchar(255) NOT NULL,
  `tahun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pelatihan_karyawan`
--

CREATE TABLE `pelatihan_karyawan` (
  `id` int(11) NOT NULL,
  `id karyawan` int(11) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `penyelenggara` varchar(255) NOT NULL,
  `tahun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pelayanan`
--

CREATE TABLE `pelayanan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pelayanan`
--

INSERT INTO `pelayanan` (`id`, `nama`) VALUES
(3, 'Reviu'),
(4, 'Pendampingan');

-- --------------------------------------------------------

--
-- Table structure for table `pelayanan_karyawan`
--

CREATE TABLE `pelayanan_karyawan` (
  `id` int(11) NOT NULL,
  `id pelayanan` int(11) NOT NULL,
  `id karyawan` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pelayanan_partial`
--

CREATE TABLE `pelayanan_partial` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `id parent` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pelayanan_partial`
--

INSERT INTO `pelayanan_partial` (`id`, `nama`, `id parent`, `type`) VALUES
(1, 'Reviu Laporan Keuangan', 3, 1),
(2, 'Reviu Tindak Lanjut Hasil Audit', 3, 1),
(3, 'Reviu RKAKL', 3, 1),
(4, 'Pendampingan dalam PBJ', 4, 1),
(5, 'Pendampingan Peny. Lap Pertanggung Jawaban Keuangan', 4, 1),
(6, 'Pendampingan Penyusunan risk register', 4, 1),
(7, 'Fasilitas peny. Risk fraud', 4, 1),
(8, 'Pemantauan ', 4, 1),
(9, 'Lainnya, sebutkan', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `prosedur`
--

CREATE TABLE `prosedur` (
  `id` int(11) NOT NULL,
  `id_activities` int(11) NOT NULL,
  `prosedur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `prosedur`
--

INSERT INTO `prosedur` (`id`, `id_activities`, `prosedur`) VALUES
(1, 1, '1.1.1.AUDIT KEPATUHAN'),
(2, 1, '1.1.2. AUDIT KINERJA'),
(3, 1, '1.1.3. AUDIT TUJUAN TERTENTU'),
(4, 1, '1.1.4. AUDIT DINI'),
(5, 1, '1.1.5. AUDIT E-PROCUREMENT'),
(6, 2, '1.2.1. REVIU LAPORAN KEUANGAN'),
(7, 2, '1.2.2. REVIU LAKIP'),
(8, 2, '1.2.3. REVIU RKAKL'),
(9, 2, '1.2.4. REVIU RAB'),
(10, 3, '1.3.1. VERIFIKASI UNTUK PEMBAYARAN TAHUN BERBEDA'),
(11, 3, '1.3.2. VERIFIKASI UNTUK HIBAH'),
(12, 4, '1.4.1. PEMANTAUAN UJIAN NASIONAL'),
(13, 5, '1.5.1. MONEV ATASE KEBUDAYAAN LUAR NEGERI'),
(14, 5, '1.5.2. MONEV TINJUT HASIL AUDIT'),
(15, 6, '2.1.1 PENYUSUNAN RISK REGISTER'),
(16, 6, '2.1.2. PENYUSUNAN RISK FRAUD'),
(17, 7, '2.2.1. FASILITASI LINGKUNGAN PENGENDALIAN'),
(18, 7, '2.2.2. FASILITASI RISK ASSESSEMENT'),
(19, 7, '2.2.3. FASILITASI MEMBANGUN KONTROL AKTIVITAS'),
(20, 7, '2.2.4. FASILITASI MONITORING DALAM SPIP'),
(21, 8, '2.3.1. FASILITASI PROGRAM/KEGIATAN'),
(22, 8, '2.3.2. FASILITASI PERBAIKAN CONTROL ACTIVITIES'),
(23, 9, '3.1.1. KNOW YOUR EMPLOYE'),
(24, 10, '3.2.1. KNOW YOUR COSTUMER'),
(25, 11, '3.3.1. SOSIALISASI ANTI FRAUD'),
(26, 12, '2.6.1 PENGADUAN VIA SURAT'),
(27, 12, '2.6.2. PENGADUAN VIA SMS'),
(28, 12, '2.6.3. PENGADUAN VIA WEB'),
(29, 12, '2.6.4. PENGELOLAAN PENGADUAN'),
(30, 13, '4.2.1. KUNJUNGAN KERJA'),
(31, 13, '4.2.2. AUDIT MENDADAK'),
(32, 14, '3.1.1. WORKSHOP'),
(33, 14, '3.1.2. RAKER'),
(34, 14, '3.1.3. SEMINAR'),
(35, 14, '3.1.4. KAMPANYE'),
(36, 14, '3.1.5. KAIAN/TELAAH'),
(37, 14, '3.1.6. PELATIHAN KANTOR SENDIRI (PKS)'),
(38, 14, '3.1.7. KOMPILASI HASIL AUDIT'),
(39, 14, '3.1.8. RAPAT KERJA'),
(40, 14, '3.1.9 GELAR KASUS/EKSPOSE'),
(41, 15, '3.2.1. SURAT MASUK'),
(42, 15, '3.2.2. SURAT KELUAR'),
(43, 15, '3.2.3. LAPORAN HASIL AUDIT'),
(44, 15, '3.2.4. PENERIMAAN TAMU'),
(45, 15, '3.2.5. RAPAT INTERNAL'),
(46, 15, '3.2.6. CUTI PEGAWAI'),
(47, 15, '3.2.7. DP3 PEGAWAI'),
(48, 15, '3.2.8. PENCAIRAN DANA PENUGASAN'),
(49, 15, '3.2.9. PERTANGGUNG JAWABAN PERJALAN DINAS');

-- --------------------------------------------------------

--
-- Table structure for table `proses_bisnis`
--

CREATE TABLE `proses_bisnis` (
  `id` int(11) NOT NULL,
  `id_prosedur` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sifat_distribusi`
--

CREATE TABLE `sifat_distribusi` (
  `id_distribusi` int(11) NOT NULL,
  `sifat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sub_main`
--

CREATE TABLE `sub_main` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sub_main`
--

INSERT INTO `sub_main` (`id`, `nama`) VALUES
(1, '1. ASSURANCE ACTIVITIES'),
(2, '2. CONSULTING ACTIVITIES'),
(3, '3. PROGRAM PENCEGAHAN'),
(4, '4. PENDETEKSIAN'),
(5, '5. SUPPORTING ACTIVITIES');

-- --------------------------------------------------------

--
-- Table structure for table `surat_masuk_disposisi`
--

CREATE TABLE `surat_masuk_disposisi` (
  `id` int(11) NOT NULL,
  `pengirim` varchar(255) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `path` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surat_masuk_item`
--

CREATE TABLE `surat_masuk_item` (
  `id_surat_masuk` int(11) NOT NULL,
  `id_disposisi` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `surat_masuk_karyawan`
--

CREATE TABLE `surat_masuk_karyawan` (
  `id_distribusi` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `id_user`, `id_role`) VALUES
(1, 3, 4),
(17, 19, 5),
(18, 20, 5),
(19, 21, 5),
(20, 22, 5),
(21, 23, 5),
(22, 24, 5),
(23, 25, 5),
(24, 26, 5),
(25, 27, 5),
(26, 28, 5),
(27, 29, 5),
(28, 30, 5),
(29, 31, 5),
(30, 32, 5),
(31, 33, 5),
(32, 34, 5),
(33, 35, 5),
(34, 36, 5),
(35, 37, 5),
(36, 38, 5),
(37, 39, 5),
(38, 40, 5),
(39, 41, 5),
(40, 42, 5),
(41, 43, 5),
(42, 44, 5),
(43, 45, 5),
(44, 46, 5),
(45, 47, 5),
(46, 48, 5),
(47, 49, 5),
(48, 50, 5),
(49, 51, 5),
(50, 52, 5),
(51, 53, 5),
(52, 54, 5),
(53, 55, 5),
(54, 56, 5),
(55, 57, 5),
(56, 58, 5),
(57, 59, 5),
(58, 60, 5),
(59, 61, 5),
(60, 62, 5),
(61, 63, 5),
(62, 64, 5),
(63, 65, 5),
(64, 66, 5),
(65, 67, 5),
(66, 68, 5),
(67, 69, 5),
(68, 70, 5),
(69, 71, 5),
(70, 72, 5),
(71, 73, 5),
(72, 74, 5),
(73, 75, 5),
(74, 76, 5),
(75, 77, 5),
(76, 78, 5),
(77, 79, 5),
(78, 80, 5),
(79, 81, 5),
(80, 82, 5),
(81, 83, 5),
(82, 84, 5),
(83, 85, 5),
(84, 86, 5),
(85, 87, 5),
(86, 88, 5),
(87, 89, 5),
(88, 90, 5),
(89, 91, 5),
(90, 92, 5),
(91, 93, 5),
(92, 94, 5),
(93, 95, 5),
(94, 96, 5),
(95, 97, 5),
(96, 98, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_submain` (`id_submain`) USING BTREE;

--
-- Indexes for table `disposisi_distribusi`
--
ALTER TABLE `disposisi_distribusi`
  ADD PRIMARY KEY (`id_distribusi`,`id_peran`),
  ADD KEY `id_distribusi` (`id_distribusi`) USING BTREE,
  ADD KEY `id_peran` (`id_peran`) USING BTREE;

--
-- Indexes for table `distribusi`
--
ALTER TABLE `distribusi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `distribusi_karyawan`
--
ALTER TABLE `distribusi_karyawan`
  ADD PRIMARY KEY (`id_distribusi`,`id_karyawan`),
  ADD KEY `id_distribusi` (`id_distribusi`) USING BTREE,
  ADD KEY `id_karyawan` (`id_karyawan`) USING BTREE;

--
-- Indexes for table `hasil_audit`
--
ALTER TABLE `hasil_audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hasil_audit_item`
--
ALTER TABLE `hasil_audit_item`
  ADD PRIMARY KEY (`id_audit`,`id_kode`),
  ADD KEY `id_kode` (`id_kode`) USING BTREE;

--
-- Indexes for table `karya_tulis_karyawan`
--
ALTER TABLE `karya_tulis_karyawan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id karyawan` (`id karyawan`) USING BTREE;

--
-- Indexes for table `kegiatan_audit`
--
ALTER TABLE `kegiatan_audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kegiatan_audit_partial`
--
ALTER TABLE `kegiatan_audit_partial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id parent` (`id parent`) USING BTREE;

--
-- Indexes for table `kegiatan_karyawan`
--
ALTER TABLE `kegiatan_karyawan`
  ADD PRIMARY KEY (`id`,`id kegiatan`,`id karyawan`),
  ADD KEY `id kegiatan` (`id kegiatan`) USING BTREE,
  ADD KEY `id karyawan` (`id karyawan`) USING BTREE;

--
-- Indexes for table `kelompok_peran`
--
ALTER TABLE `kelompok_peran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_aartikel`
--
ALTER TABLE `master_aartikel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_berita`
--
ALTER TABLE `master_berita`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_carousel`
--
ALTER TABLE `master_carousel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_dampak`
--
ALTER TABLE `master_dampak`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_efektifitas`
--
ALTER TABLE `master_efektifitas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_foto`
--
ALTER TABLE `master_foto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_golongan`
--
ALTER TABLE `master_golongan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_inherent`
--
ALTER TABLE `master_inherent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_jabatan`
--
ALTER TABLE `master_jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_karyawan`
--
ALTER TABLE `master_karyawan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `master karyawan_ibfk_1` (`id_jabatan`) USING BTREE,
  ADD KEY `id_golongan` (`id_golongan`) USING BTREE,
  ADD KEY `id_peran` (`id_peran`) USING BTREE;

--
-- Indexes for table `master_kata_pengantar`
--
ALTER TABLE `master_kata_pengantar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_kode`
--
ALTER TABLE `master_kode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_pangkat`
--
ALTER TABLE `master_pangkat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_pengumuman`
--
ALTER TABLE `master_pengumuman`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_peran`
--
ALTER TABLE `master_peran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_probality`
--
ALTER TABLE `master_probality`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_residu`
--
ALTER TABLE `master_residu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_role`
--
ALTER TABLE `master_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `master_user`
--
ALTER TABLE `master_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_karyawan` (`id_karyawan`) USING BTREE;

--
-- Indexes for table `narasumber_karyawan`
--
ALTER TABLE `narasumber_karyawan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id karyawan` (`id karyawan`) USING BTREE;

--
-- Indexes for table `pelatihan_karyawan`
--
ALTER TABLE `pelatihan_karyawan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id karyawan` (`id karyawan`) USING BTREE;

--
-- Indexes for table `pelayanan`
--
ALTER TABLE `pelayanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelayanan_karyawan`
--
ALTER TABLE `pelayanan_karyawan`
  ADD PRIMARY KEY (`id`,`id pelayanan`,`id karyawan`),
  ADD KEY `id pelayanan` (`id pelayanan`) USING BTREE,
  ADD KEY `id karyawan` (`id karyawan`) USING BTREE;

--
-- Indexes for table `pelayanan_partial`
--
ALTER TABLE `pelayanan_partial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id parent` (`id parent`) USING BTREE;

--
-- Indexes for table `prosedur`
--
ALTER TABLE `prosedur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_activities` (`id_activities`) USING BTREE;

--
-- Indexes for table `proses_bisnis`
--
ALTER TABLE `proses_bisnis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_prosedur` (`id_prosedur`) USING BTREE;

--
-- Indexes for table `sifat_distribusi`
--
ALTER TABLE `sifat_distribusi`
  ADD PRIMARY KEY (`id_distribusi`,`sifat`),
  ADD KEY `id_distribusi` (`id_distribusi`) USING BTREE;

--
-- Indexes for table `sub_main`
--
ALTER TABLE `sub_main`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_masuk_disposisi`
--
ALTER TABLE `surat_masuk_disposisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surat_masuk_item`
--
ALTER TABLE `surat_masuk_item`
  ADD PRIMARY KEY (`id_surat_masuk`,`id_disposisi`),
  ADD KEY `id_disposisi` (`id_disposisi`) USING BTREE;

--
-- Indexes for table `surat_masuk_karyawan`
--
ALTER TABLE `surat_masuk_karyawan`
  ADD PRIMARY KEY (`id_distribusi`,`id_karyawan`),
  ADD KEY `id_distribusi` (`id_distribusi`) USING BTREE,
  ADD KEY `id_karyawan` (`id_karyawan`) USING BTREE;

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`,`id_user`,`id_role`),
  ADD KEY `user_roles_ibfk_1` (`id_user`) USING BTREE,
  ADD KEY `user_roles_ibfk_2` (`id_role`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `distribusi`
--
ALTER TABLE `distribusi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hasil_audit`
--
ALTER TABLE `hasil_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `karya_tulis_karyawan`
--
ALTER TABLE `karya_tulis_karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kegiatan_audit`
--
ALTER TABLE `kegiatan_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kegiatan_audit_partial`
--
ALTER TABLE `kegiatan_audit_partial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kegiatan_karyawan`
--
ALTER TABLE `kegiatan_karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kelompok_peran`
--
ALTER TABLE `kelompok_peran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `master_aartikel`
--
ALTER TABLE `master_aartikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_berita`
--
ALTER TABLE `master_berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `master_carousel`
--
ALTER TABLE `master_carousel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `master_dampak`
--
ALTER TABLE `master_dampak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `master_efektifitas`
--
ALTER TABLE `master_efektifitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `master_foto`
--
ALTER TABLE `master_foto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `master_golongan`
--
ALTER TABLE `master_golongan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `master_inherent`
--
ALTER TABLE `master_inherent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `master_jabatan`
--
ALTER TABLE `master_jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `master_karyawan`
--
ALTER TABLE `master_karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `master_kata_pengantar`
--
ALTER TABLE `master_kata_pengantar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `master_kode`
--
ALTER TABLE `master_kode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `master_pangkat`
--
ALTER TABLE `master_pangkat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_pengumuman`
--
ALTER TABLE `master_pengumuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `master_peran`
--
ALTER TABLE `master_peran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `master_probality`
--
ALTER TABLE `master_probality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `master_residu`
--
ALTER TABLE `master_residu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `master_role`
--
ALTER TABLE `master_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `master_user`
--
ALTER TABLE `master_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `narasumber_karyawan`
--
ALTER TABLE `narasumber_karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelatihan_karyawan`
--
ALTER TABLE `pelatihan_karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelayanan`
--
ALTER TABLE `pelayanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pelayanan_karyawan`
--
ALTER TABLE `pelayanan_karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelayanan_partial`
--
ALTER TABLE `pelayanan_partial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `prosedur`
--
ALTER TABLE `prosedur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `proses_bisnis`
--
ALTER TABLE `proses_bisnis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_main`
--
ALTER TABLE `sub_main`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `surat_masuk_disposisi`
--
ALTER TABLE `surat_masuk_disposisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`id_submain`) REFERENCES `sub_main` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `disposisi_distribusi`
--
ALTER TABLE `disposisi_distribusi`
  ADD CONSTRAINT `disposisi_distribusi_ibfk_1` FOREIGN KEY (`id_distribusi`) REFERENCES `distribusi` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `disposisi_distribusi_ibfk_2` FOREIGN KEY (`id_peran`) REFERENCES `master_peran` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `distribusi_karyawan`
--
ALTER TABLE `distribusi_karyawan`
  ADD CONSTRAINT `distribusi_karyawan_ibfk_1` FOREIGN KEY (`id_distribusi`) REFERENCES `distribusi` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `distribusi_karyawan_ibfk_2` FOREIGN KEY (`id_karyawan`) REFERENCES `master_karyawan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `hasil_audit_item`
--
ALTER TABLE `hasil_audit_item`
  ADD CONSTRAINT `hasil_audit_item_ibfk_1` FOREIGN KEY (`id_audit`) REFERENCES `hasil_audit` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `hasil_audit_item_ibfk_2` FOREIGN KEY (`id_kode`) REFERENCES `master_kode` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `karya_tulis_karyawan`
--
ALTER TABLE `karya_tulis_karyawan`
  ADD CONSTRAINT `karya_tulis_karyawan_ibfk_1` FOREIGN KEY (`id karyawan`) REFERENCES `master_karyawan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `kegiatan_audit_partial`
--
ALTER TABLE `kegiatan_audit_partial`
  ADD CONSTRAINT `kegiatan_audit_partial_ibfk_1` FOREIGN KEY (`id parent`) REFERENCES `kegiatan_audit` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `kegiatan_karyawan`
--
ALTER TABLE `kegiatan_karyawan`
  ADD CONSTRAINT `kegiatan_karyawan_ibfk_1` FOREIGN KEY (`id kegiatan`) REFERENCES `kegiatan_audit_partial` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `kegiatan_karyawan_ibfk_2` FOREIGN KEY (`id karyawan`) REFERENCES `master_karyawan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `master_karyawan`
--
ALTER TABLE `master_karyawan`
  ADD CONSTRAINT `master_karyawan_ibfk_1` FOREIGN KEY (`id_jabatan`) REFERENCES `master_jabatan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `master_karyawan_ibfk_2` FOREIGN KEY (`id_golongan`) REFERENCES `master_golongan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `master_karyawan_ibfk_3` FOREIGN KEY (`id_peran`) REFERENCES `master_peran` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `master_user`
--
ALTER TABLE `master_user`
  ADD CONSTRAINT `master_user_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `master_karyawan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `narasumber_karyawan`
--
ALTER TABLE `narasumber_karyawan`
  ADD CONSTRAINT `narasumber_karyawan_ibfk_1` FOREIGN KEY (`id karyawan`) REFERENCES `master_karyawan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pelatihan_karyawan`
--
ALTER TABLE `pelatihan_karyawan`
  ADD CONSTRAINT `pelatihan_karyawan_ibfk_1` FOREIGN KEY (`id karyawan`) REFERENCES `master_karyawan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pelayanan_karyawan`
--
ALTER TABLE `pelayanan_karyawan`
  ADD CONSTRAINT `pelayanan_karyawan_ibfk_1` FOREIGN KEY (`id pelayanan`) REFERENCES `pelayanan_partial` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `pelayanan_karyawan_ibfk_2` FOREIGN KEY (`id karyawan`) REFERENCES `master_karyawan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `pelayanan_partial`
--
ALTER TABLE `pelayanan_partial`
  ADD CONSTRAINT `pelayanan_partial_ibfk_1` FOREIGN KEY (`id parent`) REFERENCES `pelayanan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `prosedur`
--
ALTER TABLE `prosedur`
  ADD CONSTRAINT `prosedur_ibfk_1` FOREIGN KEY (`id_activities`) REFERENCES `activities` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `proses_bisnis`
--
ALTER TABLE `proses_bisnis`
  ADD CONSTRAINT `proses_bisnis_ibfk_1` FOREIGN KEY (`id_prosedur`) REFERENCES `prosedur` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `sifat_distribusi`
--
ALTER TABLE `sifat_distribusi`
  ADD CONSTRAINT `sifat_distribusi_ibfk_1` FOREIGN KEY (`id_distribusi`) REFERENCES `distribusi` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `surat_masuk_item`
--
ALTER TABLE `surat_masuk_item`
  ADD CONSTRAINT `surat_masuk_item_ibfk_1` FOREIGN KEY (`id_surat_masuk`) REFERENCES `surat_masuk_disposisi` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `surat_masuk_item_ibfk_2` FOREIGN KEY (`id_disposisi`) REFERENCES `master_peran` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `surat_masuk_karyawan`
--
ALTER TABLE `surat_masuk_karyawan`
  ADD CONSTRAINT `surat_masuk_karyawan_ibfk_1` FOREIGN KEY (`id_distribusi`) REFERENCES `surat_masuk_disposisi` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `surat_masuk_karyawan_ibfk_2` FOREIGN KEY (`id_karyawan`) REFERENCES `master_karyawan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `master_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `master_role` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
