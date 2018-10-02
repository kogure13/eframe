/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 100116
Source Host           : localhost:3306
Source Database       : db_itjen

Target Server Type    : MYSQL
Target Server Version : 100116
File Encoding         : 65001

Date: 2018-10-02 19:26:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activities
-- ----------------------------
DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_submain` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_submain` (`id_submain`) USING BTREE,
  CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`id_submain`) REFERENCES `sub_main` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activities
-- ----------------------------
INSERT INTO `activities` VALUES ('1', '1', '1.1 AUDIT');
INSERT INTO `activities` VALUES ('2', '1', '1.2 REVIU');
INSERT INTO `activities` VALUES ('3', '1', '1.3 VERIFIKASI');
INSERT INTO `activities` VALUES ('4', '1', '1.4 PEMANTAUAN');
INSERT INTO `activities` VALUES ('5', '1', '1.5 MONEV');
INSERT INTO `activities` VALUES ('6', '2', '2.1 MANAJEMEN RISIKO');
INSERT INTO `activities` VALUES ('7', '2', '2.2 SPIP');
INSERT INTO `activities` VALUES ('8', '2', '2.3 FASILITASI');
INSERT INTO `activities` VALUES ('9', '3', '3.1 KNOW YOUR EMPLOYE');
INSERT INTO `activities` VALUES ('10', '3', '3.2 KNOW YOUR COSTUMER');
INSERT INTO `activities` VALUES ('11', '3', '3.3 KAMPANYE ISAF');
INSERT INTO `activities` VALUES ('12', '4', '4.1 WBS');
INSERT INTO `activities` VALUES ('13', '4', '4.2 SIDAK');
INSERT INTO `activities` VALUES ('14', '5', '5.1 KEGIATAN FORUM');
INSERT INTO `activities` VALUES ('15', '5', '5.2 PENATAUSAHAAN');

-- ----------------------------
-- Table structure for disposisi_distribusi
-- ----------------------------
DROP TABLE IF EXISTS `disposisi_distribusi`;
CREATE TABLE `disposisi_distribusi` (
  `id_distribusi` int(11) NOT NULL,
  `id_peran` int(11) NOT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id_distribusi`,`id_peran`),
  KEY `id_distribusi` (`id_distribusi`) USING BTREE,
  KEY `id_peran` (`id_peran`) USING BTREE,
  CONSTRAINT `disposisi_distribusi_ibfk_1` FOREIGN KEY (`id_distribusi`) REFERENCES `distribusi` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `disposisi_distribusi_ibfk_2` FOREIGN KEY (`id_peran`) REFERENCES `master_peran` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of disposisi_distribusi
-- ----------------------------

-- ----------------------------
-- Table structure for distribusi
-- ----------------------------
DROP TABLE IF EXISTS `distribusi`;
CREATE TABLE `distribusi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_pengirim` varchar(255) NOT NULL,
  `no_tgl_agenda` varchar(255) NOT NULL,
  `no_tgl` varchar(255) NOT NULL,
  `tgl_agenda` date NOT NULL,
  `asal` varchar(255) NOT NULL,
  `isi disposisi` varchar(255) NOT NULL,
  `is cancel` bit(1) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `tgl_nomor` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of distribusi
-- ----------------------------

-- ----------------------------
-- Table structure for distribusi_karyawan
-- ----------------------------
DROP TABLE IF EXISTS `distribusi_karyawan`;
CREATE TABLE `distribusi_karyawan` (
  `id_distribusi` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_distribusi`,`id_karyawan`),
  KEY `id_distribusi` (`id_distribusi`) USING BTREE,
  KEY `id_karyawan` (`id_karyawan`) USING BTREE,
  CONSTRAINT `distribusi_karyawan_ibfk_1` FOREIGN KEY (`id_distribusi`) REFERENCES `distribusi` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `distribusi_karyawan_ibfk_2` FOREIGN KEY (`id_karyawan`) REFERENCES `master_karyawan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of distribusi_karyawan
-- ----------------------------

-- ----------------------------
-- Table structure for hasil_audit
-- ----------------------------
DROP TABLE IF EXISTS `hasil_audit`;
CREATE TABLE `hasil_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_audit` varchar(255) NOT NULL,
  `nama_obrik` varchar(255) NOT NULL,
  `masa_audit` int(11) NOT NULL,
  `dana` double NOT NULL,
  `no_dipa` varchar(255) NOT NULL,
  `dana_dipa` double NOT NULL,
  `realisasi` varchar(255) NOT NULL,
  `id_ketua` int(11) NOT NULL DEFAULT '0',
  `id_pengendali` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hasil_audit
-- ----------------------------

-- ----------------------------
-- Table structure for hasil_audit_item
-- ----------------------------
DROP TABLE IF EXISTS `hasil_audit_item`;
CREATE TABLE `hasil_audit_item` (
  `id_audit` int(11) NOT NULL,
  `id_kode` int(11) NOT NULL DEFAULT '0',
  `masalah` varchar(255) NOT NULL,
  `kriteria` varchar(255) NOT NULL,
  `sebab` varchar(255) NOT NULL,
  `akibat` varchar(255) NOT NULL,
  `rekomendasi` varchar(255) NOT NULL,
  PRIMARY KEY (`id_audit`,`id_kode`),
  KEY `id_kode` (`id_kode`) USING BTREE,
  CONSTRAINT `hasil_audit_item_ibfk_1` FOREIGN KEY (`id_audit`) REFERENCES `hasil_audit` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `hasil_audit_item_ibfk_2` FOREIGN KEY (`id_kode`) REFERENCES `master_kode` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hasil_audit_item
-- ----------------------------

-- ----------------------------
-- Table structure for karya_tulis_karyawan
-- ----------------------------
DROP TABLE IF EXISTS `karya_tulis_karyawan`;
CREATE TABLE `karya_tulis_karyawan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id karyawan` int(11) DEFAULT NULL,
  `topik` varchar(255) NOT NULL,
  `penyalanggara` varchar(255) NOT NULL,
  `tahun` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id karyawan` (`id karyawan`) USING BTREE,
  CONSTRAINT `karya_tulis_karyawan_ibfk_1` FOREIGN KEY (`id karyawan`) REFERENCES `master_karyawan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of karya_tulis_karyawan
-- ----------------------------

-- ----------------------------
-- Table structure for kegiatan_audit
-- ----------------------------
DROP TABLE IF EXISTS `kegiatan_audit`;
CREATE TABLE `kegiatan_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kegiatan_audit
-- ----------------------------
INSERT INTO `kegiatan_audit` VALUES ('3', 'Complain Audit');
INSERT INTO `kegiatan_audit` VALUES ('4', 'Performa Audit');

-- ----------------------------
-- Table structure for kegiatan_audit_partial
-- ----------------------------
DROP TABLE IF EXISTS `kegiatan_audit_partial`;
CREATE TABLE `kegiatan_audit_partial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `id parent` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id parent` (`id parent`) USING BTREE,
  CONSTRAINT `kegiatan_audit_partial_ibfk_1` FOREIGN KEY (`id parent`) REFERENCES `kegiatan_audit` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kegiatan_audit_partial
-- ----------------------------
INSERT INTO `kegiatan_audit_partial` VALUES ('1', 'Audit atas pertanggungjawaban keuangan', '3', '1');
INSERT INTO `kegiatan_audit_partial` VALUES ('2', 'Audit pengadaan Barang dan Jasa', '3', '1');
INSERT INTO `kegiatan_audit_partial` VALUES ('3', 'Audit Kepegawaian', '3', '1');
INSERT INTO `kegiatan_audit_partial` VALUES ('4', 'Audit atas subtansi pendidikan', '3', '1');
INSERT INTO `kegiatan_audit_partial` VALUES ('5', 'Audit e-proc', '3', '1');
INSERT INTO `kegiatan_audit_partial` VALUES ('6', 'Audit lainnya, sebutkan', '3', '0');
INSERT INTO `kegiatan_audit_partial` VALUES ('7', 'Audit kinerja atas organisasi', '4', '1');
INSERT INTO `kegiatan_audit_partial` VALUES ('8', 'Audit Kinerja atas Informasi dan Teknologi', '4', '1');
INSERT INTO `kegiatan_audit_partial` VALUES ('9', 'Audit tujuan tertentu/investigasi', null, '1');

-- ----------------------------
-- Table structure for kegiatan_karyawan
-- ----------------------------
DROP TABLE IF EXISTS `kegiatan_karyawan`;
CREATE TABLE `kegiatan_karyawan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id kegiatan` int(11) NOT NULL,
  `id karyawan` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`id kegiatan`,`id karyawan`),
  KEY `id kegiatan` (`id kegiatan`) USING BTREE,
  KEY `id karyawan` (`id karyawan`) USING BTREE,
  CONSTRAINT `kegiatan_karyawan_ibfk_1` FOREIGN KEY (`id kegiatan`) REFERENCES `kegiatan_audit_partial` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `kegiatan_karyawan_ibfk_2` FOREIGN KEY (`id karyawan`) REFERENCES `master_karyawan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kegiatan_karyawan
-- ----------------------------

-- ----------------------------
-- Table structure for kelompok_peran
-- ----------------------------
DROP TABLE IF EXISTS `kelompok_peran`;
CREATE TABLE `kelompok_peran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_peran` int(11) DEFAULT NULL,
  `keterangan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kelompok_peran
-- ----------------------------
INSERT INTO `kelompok_peran` VALUES ('1', '2', 'Perencanaan Program dan Kegiatan');
INSERT INTO `kelompok_peran` VALUES ('2', '2', 'Penyusunan Penugasaan Audit');
INSERT INTO `kelompok_peran` VALUES ('3', '2', 'Menyusun KAK Audit');
INSERT INTO `kelompok_peran` VALUES ('4', '2', 'Pemantauan UN');
INSERT INTO `kelompok_peran` VALUES ('5', '2', 'Raker');
INSERT INTO `kelompok_peran` VALUES ('6', '2', 'Sumatera Barat');
INSERT INTO `kelompok_peran` VALUES ('7', '3', 'Ditjen Kebudayaan (Unit Utama)');
INSERT INTO `kelompok_peran` VALUES ('8', '3', 'Audit Universe Ditjen Kebudayaan');
INSERT INTO `kelompok_peran` VALUES ('9', '3', 'Bantuan Pemerintahan');
INSERT INTO `kelompok_peran` VALUES ('10', '3', 'Kalsel dan Jateng');
INSERT INTO `kelompok_peran` VALUES ('11', '4', 'Ditjen Guru dan Tp');
INSERT INTO `kelompok_peran` VALUES ('12', '4', 'Audit Universe Ditjen GTK');
INSERT INTO `kelompok_peran` VALUES ('13', '4', 'PKS');
INSERT INTO `kelompok_peran` VALUES ('14', '4', 'Sergu');
INSERT INTO `kelompok_peran` VALUES ('15', '4', 'Kajian di GTK');
INSERT INTO `kelompok_peran` VALUES ('16', '4', 'Bali dan Sultra');
INSERT INTO `kelompok_peran` VALUES ('17', '7', 'Balitbang Kemendikbud');
INSERT INTO `kelompok_peran` VALUES ('18', '7', 'Audit Universe Balitbang');
INSERT INTO `kelompok_peran` VALUES ('19', '7', 'Kompilasi');
INSERT INTO `kelompok_peran` VALUES ('20', '7', 'Pertanggungjawaban UN');
INSERT INTO `kelompok_peran` VALUES ('21', '7', 'Kajian Balitbang');
INSERT INTO `kelompok_peran` VALUES ('22', '7', 'Kaltim dan DKI');
INSERT INTO `kelompok_peran` VALUES ('23', '8', 'Revisu LK, RKA-KL, LAKIP');
INSERT INTO `kelompok_peran` VALUES ('24', '8', 'Audit Universe UPT Kebudayaan');
INSERT INTO `kelompok_peran` VALUES ('25', '8', 'Seminar');
INSERT INTO `kelompok_peran` VALUES ('26', '8', 'Tugas Perbantuan');
INSERT INTO `kelompok_peran` VALUES ('27', '8', 'SOP Inspektorat III');
INSERT INTO `kelompok_peran` VALUES ('28', '8', 'Kledeoskop Inspektorat III');
INSERT INTO `kelompok_peran` VALUES ('29', '10', 'Sinkronisasi dan Humas');
INSERT INTO `kelompok_peran` VALUES ('30', '10', 'Audit Universe Dijen GTK');
INSERT INTO `kelompok_peran` VALUES ('31', '10', 'Workshop');
INSERT INTO `kelompok_peran` VALUES ('32', '10', 'BAN S/M/PAUD');
INSERT INTO `kelompok_peran` VALUES ('33', '10', 'Jambi dan Sumsel');
INSERT INTO `kelompok_peran` VALUES ('34', '10', 'SPI Inspektorat III');

-- ----------------------------
-- Table structure for master_aartikel
-- ----------------------------
DROP TABLE IF EXISTS `master_aartikel`;
CREATE TABLE `master_aartikel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `artikel` text NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` varchar(255) NOT NULL,
  `modified_date` datetime NOT NULL,
  `modified_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_aartikel
-- ----------------------------

-- ----------------------------
-- Table structure for master_berita
-- ----------------------------
DROP TABLE IF EXISTS `master_berita`;
CREATE TABLE `master_berita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `berita` text NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_berita
-- ----------------------------
INSERT INTO `master_berita` VALUES ('1', 'Audit Utama', 'Dalam rangka mendorong akuntabilitas pertanggungjawaban keuangan unit utama, Inspektorat III Mulai tahun 2016 melakukan pengawalan pada unit utama melalui kegiatan audit atas pertanggungjawaban keuangan. &nbsp;Dari tanggal 10 s.d 17 Juni 2016, dilakukan audit tersebut untuk pertanggungjawaban semester I tahun 2016 (admin, 2016)', '2016-06-10 14:08:50', '2016-06-13 15:03:47');
INSERT INTO `master_berita` VALUES ('3', 'Pelatihan Di Kantor Sendiri (PKS) Audit Operasional Keuangan Tentang Audit Unit Utama Semester I Tahun 2016 tanggal 9 Juni 2016', '<p>Dalam rangka audit Unit Utama (10 s.d. 17 Juni 2016) Auditor Inspektorat III sebelumnya telah melaksanakan Pelatihan di Kantor Sendiri (PKS) tentang <span lang=\"IN\">Audit Unit Utama Semester I Tahun 2016</span> pada tanggal 9 Juni 2016 bertempat di Ruang Sidang lantai VI diikuti oleh seluruh Auditor Inspektorat III.</p>', '2016-06-13 15:08:00', '2016-06-13 15:08:46');
INSERT INTO `master_berita` VALUES ('4', 'Diseminasi Pemetaan DAK', '<p>Pada hari senin, 13 Juni 2016<span>&nbsp; </span>para Auditor Inspektorat III menghadiri kegiatan Desiminasi Pemetaan DAK yang diselenggarakan oleh PLP Set. Itjen Kemdikbud dimulai pukul 15.00<span>&nbsp; </span>s.d. 18.00 WIB bertempat di Ruang Sidang lantai VI.</p>', '2016-06-14 11:28:07', '2016-06-14 11:28:07');

-- ----------------------------
-- Table structure for master_carousel
-- ----------------------------
DROP TABLE IF EXISTS `master_carousel`;
CREATE TABLE `master_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_carousel
-- ----------------------------
INSERT INTO `master_carousel` VALUES ('2', '~/Uploads/images.jpg', 'itjen.kemdikbud.go.id');
INSERT INTO `master_carousel` VALUES ('3', '~/Uploads/01234-639x330.jpg', 'Lomba Antar Unit Utama, Itjen Raih Juara I Lomba Kebersihan');

-- ----------------------------
-- Table structure for master_dampak
-- ----------------------------
DROP TABLE IF EXISTS `master_dampak`;
CREATE TABLE `master_dampak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Rangking` varchar(255) NOT NULL,
  `Penilaian` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_dampak
-- ----------------------------
INSERT INTO `master_dampak` VALUES ('1', 'Kritis', 'Hasil negatif atau kehilangan peluang yang sangat penting untuk mencapai tujuan', '5');
INSERT INTO `master_dampak` VALUES ('2', 'Major', 'Hasil negatif atau kehilangan peluang yang cenderung memiliki dampak yang relatif besar pada kemampuan untuk memenuhi tujuan', '4');
INSERT INTO `master_dampak` VALUES ('3', 'Moderate', 'Hasil negatif atau kehilangan peluang yang cenderung memiliki dampak yang relatif rendah pada kemampuan untuk memenuhi tujuan', '3');
INSERT INTO `master_dampak` VALUES ('4', 'Minor', 'Hasil negatif atau kehilangan peluang yang cenderung memiliki dampak yang relatif rendah pada kemampuan untuk memenuhi tujuan', '2');
INSERT INTO `master_dampak` VALUES ('5', 'Tidak Berarti', 'Hasil negatif atau kehilangan peluang yang cenderung memiliki dampak yang relatif rendah pada kemampuan untuk memenuhhi tujuan', '1');

-- ----------------------------
-- Table structure for master_efektifitas
-- ----------------------------
DROP TABLE IF EXISTS `master_efektifitas`;
CREATE TABLE `master_efektifitas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(255) NOT NULL,
  `definisi` varchar(255) NOT NULL,
  `factor` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_efektifitas
-- ----------------------------
INSERT INTO `master_efektifitas` VALUES ('1', 'Sangat Baik', 'Eksposur risiko secara efektif dikendalikan dan dikelola', '20');
INSERT INTO `master_efektifitas` VALUES ('2', 'Baik', 'Mayoritas eksposur risikoo secara efektif dikendalikan dan dikelola', '40');
INSERT INTO `master_efektifitas` VALUES ('3', 'Memuaskan', 'Ada ruang untuk diperbaiki', '65');
INSERT INTO `master_efektifitas` VALUES ('4', 'Lemah', 'Beberapa eksposur risiko tampaknya dikendalikan, tetapi ada kekurangan utama', '80');
INSERT INTO `master_efektifitas` VALUES ('5', 'Tidak memuaskan', 'Tindakan pengendalian tidak efektif', '90');

-- ----------------------------
-- Table structure for master_foto
-- ----------------------------
DROP TABLE IF EXISTS `master_foto`;
CREATE TABLE `master_foto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_foto
-- ----------------------------
INSERT INTO `master_foto` VALUES ('16', '~/Uploads/download-1.jpg', 'test 001');
INSERT INTO `master_foto` VALUES ('17', '~/Uploads/1473113394-circle-facebook.png', 'test 002');
INSERT INTO `master_foto` VALUES ('18', '~/Uploads/download-1.jpg', 'test 001');
INSERT INTO `master_foto` VALUES ('19', '~/Uploads/1473113394-circle-facebook.png', 'test 002');
INSERT INTO `master_foto` VALUES ('20', '~/Uploads/download-1.jpg', 'test 001');
INSERT INTO `master_foto` VALUES ('21', '~/Uploads/1473113394-circle-facebook.png', 'test 002');
INSERT INTO `master_foto` VALUES ('22', '~/Uploads/download-1.jpg', 'test 001');
INSERT INTO `master_foto` VALUES ('23', '~/Uploads/1473113394-circle-facebook.png', 'test 002');
INSERT INTO `master_foto` VALUES ('24', '~/Uploads/download-1.jpg', 'test 001');
INSERT INTO `master_foto` VALUES ('25', '~/Uploads/1473113394-circle-facebook.png', 'test 002');
INSERT INTO `master_foto` VALUES ('26', '~/Uploads/download-1.jpg', 'test 001');
INSERT INTO `master_foto` VALUES ('27', '~/Uploads/1473113394-circle-facebook.png', 'test 002');
INSERT INTO `master_foto` VALUES ('28', '~/Uploads/download-1.jpg', 'test 001');
INSERT INTO `master_foto` VALUES ('29', '~/Uploads/1473113394-circle-facebook.png', 'test 002');
INSERT INTO `master_foto` VALUES ('30', '~/Uploads/download-1.jpg', 'test 001');
INSERT INTO `master_foto` VALUES ('31', '~/Uploads/1473113394-circle-facebook.png', 'test 002');
INSERT INTO `master_foto` VALUES ('32', '~/Uploads/download-1.jpg', 'test 001');
INSERT INTO `master_foto` VALUES ('33', '~/Uploads/1473113394-circle-facebook.png', 'test 002');
INSERT INTO `master_foto` VALUES ('34', '~/Uploads/download-1.jpg', 'test 001');
INSERT INTO `master_foto` VALUES ('35', '~/Uploads/1473113394-circle-facebook.png', 'test 002');
INSERT INTO `master_foto` VALUES ('36', '~/Uploads/download-1.jpg', 'test 001');
INSERT INTO `master_foto` VALUES ('37', '~/Uploads/1473113394-circle-facebook.png', 'test 002');

-- ----------------------------
-- Table structure for master_golongan
-- ----------------------------
DROP TABLE IF EXISTS `master_golongan`;
CREATE TABLE `master_golongan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `golongan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_golongan
-- ----------------------------
INSERT INTO `master_golongan` VALUES ('2', 'III / a');
INSERT INTO `master_golongan` VALUES ('3', 'III / b');
INSERT INTO `master_golongan` VALUES ('4', 'III / c');
INSERT INTO `master_golongan` VALUES ('5', 'III / d');
INSERT INTO `master_golongan` VALUES ('6', 'IV / a');
INSERT INTO `master_golongan` VALUES ('7', 'IV / b');
INSERT INTO `master_golongan` VALUES ('8', 'IV / c');
INSERT INTO `master_golongan` VALUES ('9', 'IV / d');
INSERT INTO `master_golongan` VALUES ('10', 'IV / e');

-- ----------------------------
-- Table structure for master_inherent
-- ----------------------------
DROP TABLE IF EXISTS `master_inherent`;
CREATE TABLE `master_inherent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `min_val` int(11) NOT NULL,
  `max_val` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_inherent
-- ----------------------------
INSERT INTO `master_inherent` VALUES ('1', 'Maximum', '20', '100');
INSERT INTO `master_inherent` VALUES ('2', 'High', '15', '20');
INSERT INTO `master_inherent` VALUES ('3', 'Medium', '10', '15');
INSERT INTO `master_inherent` VALUES ('4', 'Low', '5', '10');
INSERT INTO `master_inherent` VALUES ('5', 'Minimum', '0', '5');

-- ----------------------------
-- Table structure for master_jabatan
-- ----------------------------
DROP TABLE IF EXISTS `master_jabatan`;
CREATE TABLE `master_jabatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jabatan` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_jabatan
-- ----------------------------
INSERT INTO `master_jabatan` VALUES ('3', 'Auditor Utama');
INSERT INTO `master_jabatan` VALUES ('4', 'Auditor Madya');
INSERT INTO `master_jabatan` VALUES ('5', 'Auditor Pertama');
INSERT INTO `master_jabatan` VALUES ('6', 'Auditor Muda');
INSERT INTO `master_jabatan` VALUES ('7', 'Auditor Penyelia');
INSERT INTO `master_jabatan` VALUES ('8', 'Auditor Lanjut');

-- ----------------------------
-- Table structure for master_karyawan
-- ----------------------------
DROP TABLE IF EXISTS `master_karyawan`;
CREATE TABLE `master_karyawan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `tlp` varchar(255) DEFAULT NULL,
  `id_jabatan` int(11) DEFAULT NULL,
  `id_golongan` int(11) DEFAULT NULL,
  `id_peran` int(11) DEFAULT NULL,
  `is_kordinator` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `master karyawan_ibfk_1` (`id_jabatan`) USING BTREE,
  KEY `id_golongan` (`id_golongan`) USING BTREE,
  KEY `id_peran` (`id_peran`) USING BTREE,
  CONSTRAINT `master_karyawan_ibfk_1` FOREIGN KEY (`id_jabatan`) REFERENCES `master_jabatan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `master_karyawan_ibfk_2` FOREIGN KEY (`id_golongan`) REFERENCES `master_golongan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `master_karyawan_ibfk_3` FOREIGN KEY (`id_peran`) REFERENCES `master_peran` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_karyawan
-- ----------------------------
INSERT INTO `master_karyawan` VALUES ('75', ',195921011985031001', 'Joko Sapto Pratolo, M.Si', 'Jl. Buni 28 RT01/04 Kel. Munjul Cibubur Jakarta Timur', '081279442794', '3', '10', '2', '');
INSERT INTO `master_karyawan` VALUES ('76', ',196102281198703002', 'Prabarini Pramaningsih, SH, M.Pd,M.Ak', '', '', '3', '9', '2', '\0');
INSERT INTO `master_karyawan` VALUES ('77', ',195708191984032001', 'Dra. Nina Kencana NS, MM', '', '', '3', '9', '3', '');
INSERT INTO `master_karyawan` VALUES ('78', ',195810241983121001', 'Drs, Darsono', '', '', '4', '8', '3', '\0');
INSERT INTO `master_karyawan` VALUES ('79', ',196410051989031003', 'Iwan Mustafa, SE. MM', null, null, '4', '6', null, null);
INSERT INTO `master_karyawan` VALUES ('80', ',196504271988121001', 'Drs. A. Junaidi Gunawan', null, null, '4', '7', null, null);
INSERT INTO `master_karyawan` VALUES ('81', ',196109251982031002', 'Facri Noekman, SE', null, null, '4', '6', null, null);
INSERT INTO `master_karyawan` VALUES ('82', ',195907201986011001', 'Yaya Mulya, SH', null, null, '4', '6', null, null);
INSERT INTO `master_karyawan` VALUES ('83', ',195910311988021001', 'Drs.Edy Wijaya Kusuma,M.Si', null, null, '4', '7', null, null);
INSERT INTO `master_karyawan` VALUES ('84', ',196011101989031003', 'Hir. Haroid Parningotan.H', null, null, '4', '6', null, null);
INSERT INTO `master_karyawan` VALUES ('85', ',196203201989032001', 'Dra,Hendri Yetni A Muis', null, null, '4', '8', null, null);
INSERT INTO `master_karyawan` VALUES ('86', ',197001071994032002', 'Momy Siti Armilah,SH,M.Si', null, null, '4', '7', null, null);
INSERT INTO `master_karyawan` VALUES ('87', ',196302131984031001', 'Drs. Satiri', null, null, '4', '6', null, null);
INSERT INTO `master_karyawan` VALUES ('88', ',195905281988021001', 'Drs, Eduart B Ginting', null, null, '4', '7', null, null);
INSERT INTO `master_karyawan` VALUES ('89', ',196506131994031001', 'Drs, Dedy Linggajaya, MM', null, null, '4', '6', null, null);
INSERT INTO `master_karyawan` VALUES ('90', ',196909271988121001', 'waluyo, S.IP, M.Si', null, null, '4', '6', null, null);
INSERT INTO `master_karyawan` VALUES ('91', ',196512021987031003', 'Danang Syahrul,SE', null, null, '4', '8', null, null);
INSERT INTO `master_karyawan` VALUES ('92', ',195904271988021001', 'Dr. H. Indra Jaya', null, null, '4', '6', null, null);
INSERT INTO `master_karyawan` VALUES ('93', ',196908241988122001', 'Ina Suharti,SIP,M.Si', null, null, '4', '7', null, null);
INSERT INTO `master_karyawan` VALUES ('94', ',196606251987032002', 'Puspita Yunia Stri, SH', null, null, '4', '6', null, null);
INSERT INTO `master_karyawan` VALUES ('95', ',196212031991031002', 'Drs.Kustri Waluyo, MM', null, null, '4', '6', null, null);
INSERT INTO `master_karyawan` VALUES ('96', ',196311051989031002', 'Drs.Hiswara', null, null, '4', '7', null, null);
INSERT INTO `master_karyawan` VALUES ('97', ',196611081992031001', 'Subiyantoro,SH,M.Si', null, null, '4', '6', null, null);
INSERT INTO `master_karyawan` VALUES ('98', ',195808061982032002', 'Dra. Mitra Susanti, M.Si', null, null, '4', '8', null, null);
INSERT INTO `master_karyawan` VALUES ('99', ',196809211988122000', 'Purwaniati Nugraheni,SH,MM', null, null, '4', '7', null, null);
INSERT INTO `master_karyawan` VALUES ('100', ',196204281988032001', 'Dra, Andriati Condro Arsetyo, M.Pd', null, null, '4', '7', null, null);
INSERT INTO `master_karyawan` VALUES ('101', ',196211141991031002', 'Urip Widodo,SH.,M.Si', null, null, '4', '7', null, null);
INSERT INTO `master_karyawan` VALUES ('102', ',195704161984111011', 'Drs, Arsa Dinata. AS', null, null, '4', '6', null, null);
INSERT INTO `master_karyawan` VALUES ('103', ',197107171994012001', 'Tety Yliati, SPd', null, null, '4', '6', null, null);
INSERT INTO `master_karyawan` VALUES ('104', ',195712311986031013', 'Drs, Ambo Sakka', null, null, '4', '8', null, null);
INSERT INTO `master_karyawan` VALUES ('105', ',196204251984122002', 'Endang Lestiningrum M.Pd', null, null, '4', '7', null, null);
INSERT INTO `master_karyawan` VALUES ('106', ',195812071985031001', 'John Swart Arroan, SE', null, null, '4', '9', null, null);
INSERT INTO `master_karyawan` VALUES ('107', ',196401121994031001', 'Sunarto,SH,MM', null, null, '4', '6', null, null);
INSERT INTO `master_karyawan` VALUES ('108', ',196011231987032001', 'Dra,Mindo BR Purba', null, null, '4', '6', null, null);
INSERT INTO `master_karyawan` VALUES ('109', ',195703161988031001', 'M. Nurdin,SH', null, null, '4', '7', null, null);
INSERT INTO `master_karyawan` VALUES ('110', ',196706171994031001', 'R.Saptoadji P,SH,M.Si', null, null, '4', '6', null, null);
INSERT INTO `master_karyawan` VALUES ('111', ',196202051988022001', 'Dra, Eriawani, M.Ak', null, null, '4', '7', null, null);
INSERT INTO `master_karyawan` VALUES ('112', ',195809071980031002', 'Drs.RH.Riyanto,M.M', null, null, '4', '7', null, null);
INSERT INTO `master_karyawan` VALUES ('113', ',196912121995122001', 'Nureka Waty,S.Ssi', null, null, '4', '5', null, null);
INSERT INTO `master_karyawan` VALUES ('114', ',107308232000031001', 'Yahya Sulaeman,SH,MM', null, null, '6', '5', null, null);
INSERT INTO `master_karyawan` VALUES ('115', ',197401062005011002', 'Ahmar Hafid,SH,MH', null, null, '6', '5', null, null);
INSERT INTO `master_karyawan` VALUES ('116', ',196811121988121001', 'Hartono,M.Pd', null, null, '6', '4', null, null);
INSERT INTO `master_karyawan` VALUES ('117', ',19810602005011004', 'Rian Sopian,SE,MMSi', null, null, '6', '5', null, null);
INSERT INTO `master_karyawan` VALUES ('118', ',196707031994031002', 'Rizal Rifai,SH', null, null, '6', '5', null, null);
INSERT INTO `master_karyawan` VALUES ('119', ',196010131987032001', 'Sri Rejeki,S.Sos', null, null, '6', '5', null, null);
INSERT INTO `master_karyawan` VALUES ('120', ',196509041991031003', 'Undang, S.IP', null, null, '6', '4', null, null);
INSERT INTO `master_karyawan` VALUES ('121', ',196004181960032002', 'Gina Aprilawatie,S.Pd.,M.Si', null, null, '6', '5', null, null);
INSERT INTO `master_karyawan` VALUES ('122', ',196808031990102001', 'Nur Sulasih', null, null, '6', '4', null, null);
INSERT INTO `master_karyawan` VALUES ('123', ',196704131987032001', 'Nirma, S.IP', null, null, '6', '4', null, null);
INSERT INTO `master_karyawan` VALUES ('124', ',196903051988122002', 'Semi Widayati, S.IP', null, null, '6', '5', null, null);
INSERT INTO `master_karyawan` VALUES ('125', ',196502071986011001', 'Zaenal Abidin,S.Pd', null, null, '6', '4', null, null);
INSERT INTO `master_karyawan` VALUES ('126', ',197001121988021000', 'Tri Sukmono Joko PBS', null, null, '6', '4', null, null);
INSERT INTO `master_karyawan` VALUES ('127', ',19609052001121003', 'Setyo Bimandoko,SE,M.Ak', null, null, '6', '4', null, null);
INSERT INTO `master_karyawan` VALUES ('128', ',196606081988091001', 'Sugiyanto,SH', null, null, '6', '5', null, null);
INSERT INTO `master_karyawan` VALUES ('129', ',195902221988031001', 'Firdaus,S.Sos', null, null, '6', '4', null, null);
INSERT INTO `master_karyawan` VALUES ('130', ',196301201992031001', 'Muhammad Basri', null, null, '6', '5', null, null);
INSERT INTO `master_karyawan` VALUES ('131', ',196808061988121002', 'Harsono, S.IP, M.Si', null, null, '6', '5', null, null);
INSERT INTO `master_karyawan` VALUES ('132', ',197305052005011002', 'Ausi kurnia Kawoco, SE, M.Ak', null, null, '5', '3', null, null);
INSERT INTO `master_karyawan` VALUES ('133', ',197206062000031001', 'Agus Setyo Wantoro,SH', null, null, '5', '4', null, null);
INSERT INTO `master_karyawan` VALUES ('134', ',196603161989011001', 'Tugimin,SIP', null, null, '5', '3', null, null);
INSERT INTO `master_karyawan` VALUES ('135', ',198704092009122003', 'Kusmaningayu Wulandari, SE', null, null, '5', '3', null, null);
INSERT INTO `master_karyawan` VALUES ('136', ',108309212008122002', 'Herlina Corina,SE', null, null, '5', '3', null, null);
INSERT INTO `master_karyawan` VALUES ('137', ',196504181994031003', 'Dede Rudiana,S.Sos, M.Si', null, null, '5', '5', null, null);
INSERT INTO `master_karyawan` VALUES ('138', ',1968072319900112001', 'Yuliafni,S.S', null, null, '5', '3', null, null);
INSERT INTO `master_karyawan` VALUES ('139', ',1984070320080110006', 'Ari Fitria Wibowo, S.Kom', null, null, '5', '3', null, null);
INSERT INTO `master_karyawan` VALUES ('140', ',196403131987032001', 'Rosiyanti, S.Pd', null, null, '5', '5', null, null);
INSERT INTO `master_karyawan` VALUES ('141', ',196605251988121001', 'Budiyono, S.Sos', null, null, '5', '3', null, null);
INSERT INTO `master_karyawan` VALUES ('142', ',198307102108121002', 'Aditya Wicaksono, S.Sos', null, null, '5', '3', null, null);
INSERT INTO `master_karyawan` VALUES ('143', ',196307111990011001', 'Makmun Ali S.Pd', null, null, '5', '4', null, null);
INSERT INTO `master_karyawan` VALUES ('144', ',196605251988121001', 'Budiyono, S.Sos', null, null, '5', '3', null, null);
INSERT INTO `master_karyawan` VALUES ('145', ',106204231982101001', 'Chaidir', null, null, '7', '4', null, null);
INSERT INTO `master_karyawan` VALUES ('146', ',197812192009121002', 'Fani Arimulya Nugraha,SKUM', null, null, '7', '2', null, null);
INSERT INTO `master_karyawan` VALUES ('147', ',196009081984031002', 'Muntohar Edy Purbono', null, null, '7', '5', null, null);
INSERT INTO `master_karyawan` VALUES ('148', ',196010101981011001', 'Marsono,SPd', null, null, '7', '4', null, null);
INSERT INTO `master_karyawan` VALUES ('149', ',196809041988121001', 'Rudy Restu,S.Akt', null, null, '7', '4', null, null);
INSERT INTO `master_karyawan` VALUES ('150', ',196512131987031001', 'Subiantoro', null, null, '7', '3', null, null);
INSERT INTO `master_karyawan` VALUES ('151', ',195804121988021001', 'Muhammad Ansori, Sm.Hk', null, null, '7', '4', null, null);
INSERT INTO `master_karyawan` VALUES ('152', ',196404111988022', 'Tini Lestari,BA', null, null, '8', '4', null, null);
INSERT INTO `master_karyawan` VALUES ('153', ',196702061900032', 'Kori Isniasari', null, null, '8', '2', null, null);
INSERT INTO `master_karyawan` VALUES ('154', ',195903031984031003', 'Joko Indriatno, SE', null, null, '8', '3', null, null);

-- ----------------------------
-- Table structure for master_kata_pengantar
-- ----------------------------
DROP TABLE IF EXISTS `master_kata_pengantar`;
CREATE TABLE `master_kata_pengantar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kata` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_kata_pengantar
-- ----------------------------
INSERT INTO `master_kata_pengantar` VALUES ('1', '<h1>Assalamualaikum wr wb.</h1><p style=\"text-align:left;\">Era modern menuntut penggunaan informasi dan teknologi dalam pengelolaan suatu organisasi. Sebagai bentuk komitmen Inspektorat III dalam mewujukan organisasi pengawasan modern, maka sejak tahun 2016 memanfaatkan \"Smart sfwefefjegfewfwefewf wefewfwefwedwedwef ewfwefwefwe fwefwefwe fwe fwe fwe fwe fwe f wef wef e cfsd fv sd vgr g rwg re g wc5 t 3w4t 4t 4t &nbsp;erf &nbsp;fegt ht rh eg wr wr &nbsp;ff wf e fcs fc wecf wf we fwe fw ef wef wef ew fw efwe &nbsp;ewfffffffffffffffffffffffffffffffffffffffffdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss sdfffffffffffffffffffffffffffs vsdvsdvewfewgergergegwefwe ewfwefweddberbreghwegwewfee fwegewgberhberhbrthbef wefwefewfvergergerhger gwegvwesa cwascvwefewfewf efcwevewvgewgfewgwegvewvgesbren aegwegwqgvergerg wegfwevwevgwegvewvmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm</p>');

-- ----------------------------
-- Table structure for master_kode
-- ----------------------------
DROP TABLE IF EXISTS `master_kode`;
CREATE TABLE `master_kode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `id parent` int(11) DEFAULT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_kode
-- ----------------------------
INSERT INTO `master_kode` VALUES ('1', '100', 'Temuan Ketidakpatuhan Terhadap Peraturan Perundang-Undangan', null, '1');
INSERT INTO `master_kode` VALUES ('2', '200', 'Temuan Kelemahan Sistem Pengendalian Intern', null, '1');
INSERT INTO `master_kode` VALUES ('3', '300', 'Temuan 3E (Efektif, Efisien, dan Ekonomis)', null, '1');
INSERT INTO `master_kode` VALUES ('4', '1.01.', 'Kerugian negara/daerah atau kerugian negara/daerah yang terjadi pada perusahaan milik negara/daerah.', '1', '2');
INSERT INTO `master_kode` VALUES ('5', '1.02.', 'Potensi kerugian negara/daerah atau kerugian negara/daerah yang terjadi pada perusahaan milik negara/daerah.', '1', '2');
INSERT INTO `master_kode` VALUES ('6', '1.03.', 'Kekurangan penerimaan negara/daerah atau perusahaan milik negara/daerah', '1', '2');
INSERT INTO `master_kode` VALUES ('7', '1.04.', 'Administrasi', '1', '2');
INSERT INTO `master_kode` VALUES ('8', '1.05.', 'Indikasi Tindak Pidana', '1', '2');
INSERT INTO `master_kode` VALUES ('9', '2.01.', 'Kelemahan sistem pengendalian akuntansi dan pelaporan', '2', '2');
INSERT INTO `master_kode` VALUES ('10', '2.02.', 'Kelemahan sistem pengendalian pelaksanaan anggaran dan belanja', '2', '2');
INSERT INTO `master_kode` VALUES ('11', '2.03.', 'Kelemahan struktur pengendalian intern', '2', '2');
INSERT INTO `master_kode` VALUES ('12', '3.01.', 'Ketidakhematan/pemborosan/ketidakekonomisan', '3', '2');
INSERT INTO `master_kode` VALUES ('13', '3.02.', 'Ketidakefisienan', '3', '2');
INSERT INTO `master_kode` VALUES ('14', '3.03.', 'Ketidakefektifan', '3', '2');
INSERT INTO `master_kode` VALUES ('15', '1.01.01.', 'Belanja dan/atau pengadaan barang/jasa aktif', '4', '3');
INSERT INTO `master_kode` VALUES ('16', '1.01.02.', 'Rekanan pengadaan barang/jasa tidak menyelesaikan pekerjaan', '4', '3');
INSERT INTO `master_kode` VALUES ('17', '1.01.03.', 'Kekurangan volume pekerjaan dan/atau barang', '4', '3');
INSERT INTO `master_kode` VALUES ('18', '1.01.04.', 'Kelebihan pembayaran selain kekurangan volume pekerjaan dan/atau baran', '4', '3');
INSERT INTO `master_kode` VALUES ('19', '1.01.05.', 'Pemahalan harga (Mark up)', '4', '3');
INSERT INTO `master_kode` VALUES ('20', '1.01.06.', 'Penggunaan uang/barang untuk kepentingan pribadi', '4', '3');
INSERT INTO `master_kode` VALUES ('21', '1.01.07.', 'Pembayaran honorarium dan/atau biaya perjalana dinas ganda dan/atau melebihi standar yang ditetapkan', '4', '3');
INSERT INTO `master_kode` VALUES ('22', '1.01.08.', 'Spesifikasi barang/jasa yang diterima tidak sesuai dengan kontrak', '4', '3');
INSERT INTO `master_kode` VALUES ('23', '1.01.09.', 'Belanja tidak sesuai atau melebihi ketentuan', '4', '3');
INSERT INTO `master_kode` VALUES ('24', '1.01.10.', 'Pengembalian pinjaman/piutang atau dana bergurlir macet', '4', '3');
INSERT INTO `master_kode` VALUES ('25', '1.01.11.', 'Kelebihan penetapan dan pembayaran restitusi pajak atau penetapan kompensasi kerugian', '4', '3');
INSERT INTO `master_kode` VALUES ('26', '1.01.12.', 'Penjualan/pertukaran/penghapusan aset negara/daerah tidak sesuai ketentuan dan merugikan negara/daerah', '4', '3');
INSERT INTO `master_kode` VALUES ('27', '1.01.13.', 'Pengenaan ganit kerugian negara belum/tidak dilaksanakan sesuai ketentuan', '4', '3');
INSERT INTO `master_kode` VALUES ('28', '1.01.14.', 'Entitas belum/tidak melaksanakan tuntutan perbendaharaan (TP) sesuai ketentuan', '4', '3');
INSERT INTO `master_kode` VALUES ('29', '1.01.15.', 'Penghapusan hak tagih tidak sesuai ketentuan', '4', '3');
INSERT INTO `master_kode` VALUES ('30', '1.01.16.', 'Pelanggaran ketentuan pemberian diskon penjualan', '4', '3');
INSERT INTO `master_kode` VALUES ('31', '1.01.17.', 'Penentuan HPP terlalu rendah sehingga penentuan harga jual lebih rendah dari seharusnya', '4', '3');
INSERT INTO `master_kode` VALUES ('32', '1.01.18.', 'Jaminan pelaksanaan dalam pelaksanaan pekerjaan, pemanfaatan barang dan pemberian fasilitas tidak dapat dicairkan', '4', '3');
INSERT INTO `master_kode` VALUES ('33', '1.01.19.', 'Penyetoran penerimaan negara/daerah dengan bukti fiktif', '4', '3');
INSERT INTO `master_kode` VALUES ('34', '1.02.01.', 'Kelebihan pembayaran dalam pengadaan barang/jasa tetapi pembayaran pekerhaan belum dilakukan sebagian atau seluruhnya', '5', '3');
INSERT INTO `master_kode` VALUES ('35', '1.02.02.', 'Rekanan belum melaksanakan kewajiban pemeliharaan barang hasil', '5', '3');
INSERT INTO `master_kode` VALUES ('36', '1.02.03.', 'Aset dikuasai pihak lain', '5', '3');
INSERT INTO `master_kode` VALUES ('37', '1.02.04.', 'Pembelian aset yang berstatus sengketa', '5', '3');
INSERT INTO `master_kode` VALUES ('38', '1.02.05.', 'Aset tidak diketahui keberadaannya', '5', '3');
INSERT INTO `master_kode` VALUES ('39', '1.02.06.', 'Pemberian jaminan pelaksanaan dalam pelaksanaan pekerjaan, pemanfaatan barang dan pemberian fasilitas tidak sesuai ketentuan', '5', '3');
INSERT INTO `master_kode` VALUES ('40', '1.02.07.', 'Pihak ketiga belum melaksankan kewajiban untuk menyerahkan aset kepada negara/daerah', '5', '3');
INSERT INTO `master_kode` VALUES ('41', '1.02.08.', 'Piutang/pinjaman atau dana bergulir yang berpotensi tidak tertagih', '5', '3');
INSERT INTO `master_kode` VALUES ('42', '1.02.09.', 'Penghapusan piutang tidak sesuai ketentuan', '5', '3');
INSERT INTO `master_kode` VALUES ('43', '1.02.10.', 'Pencairan anggaran pada akhir tahun anggaran untuk pekerjaan yang belum selesai', '5', '3');
INSERT INTO `master_kode` VALUES ('44', '1.03.01.', 'Penerimaan negara/daerah atau denda keterlambatan pekerjaan belum/tidak ditetapkan dipungut/diterima/disetor ke kas negara/daerah aau perusahaan milik negara/daerah', '6', '3');
INSERT INTO `master_kode` VALUES ('45', '1.03.02.', 'Penggunaan langsung penerimaan negara/daerah', '6', '3');
INSERT INTO `master_kode` VALUES ('46', '1.03.03.', 'Dana perimbangan yang telah ditetapkan belum masuk ke kas daerah', '6', '3');
INSERT INTO `master_kode` VALUES ('47', '1.03.04.', 'Penerimaan negara/daerah diterima atau digunakan oleh instansi yang tidak berhak', '6', '3');
INSERT INTO `master_kode` VALUES ('48', '1.03.05.', 'Pengenaan tarif pajak/PNBP lebih rendah dari ketentuan', '6', '3');
INSERT INTO `master_kode` VALUES ('49', '1.03.06.', 'Koreksi perhitungan bagi hasil dengan KKS', '6', '3');
INSERT INTO `master_kode` VALUES ('50', '1.03.0.7.', 'Kelebihan pembayaran subsidi oleh pemerintah', '6', '3');
INSERT INTO `master_kode` VALUES ('51', '1.04.01.', 'Pertanggungjawaban tidak akuntabel (bukti tidak lengkap/tidak valid)', '7', '3');
INSERT INTO `master_kode` VALUES ('52', '1.04.02.', 'Pekerjaan dilaksanakan mendahului kontrak atau penetapan anggaran', '7', '3');
INSERT INTO `master_kode` VALUES ('53', '1.04.03.', 'Proses pengadaan barang/jasa tidak sesuai ketentuan (tidak menimbulkan kerugian negara)', '7', '3');
INSERT INTO `master_kode` VALUES ('54', '1.04.04.', 'Pemecahan kontrak untuk menghindari pelelangan', '7', '3');
INSERT INTO `master_kode` VALUES ('55', '1.04.05.', 'Pelaksanaan leleang secara performa ', '7', '3');
INSERT INTO `master_kode` VALUES ('56', '1.04.06.', 'Penyimpangan terhadap peraturan perundang-undangan bidang pengelolaan perlengkapan atau barang milik negara/daerah/perusahaan', '7', '3');
INSERT INTO `master_kode` VALUES ('57', '1.04.07.', 'Penyimpangan terhadap peraturan perundang-undangan bidang tertentu lainnya seperti kehutanan, pertambangan, perpajakan, dll.', '7', '3');
INSERT INTO `master_kode` VALUES ('58', '1.04.08.', 'Koreksi perhitungan subsidi/kewajiban pelayanan umum', '7', '3');
INSERT INTO `master_kode` VALUES ('59', '1.04.09.', 'Pembentukan cadangan piutang, perhitungan penyusutan atau amortisasi tidak sesuai ketentuan', '7', '3');
INSERT INTO `master_kode` VALUES ('60', '1.04.10.', 'Penyetoran penerimaan negara/daerah atau kas di bendaharawan ke kas negara/daerah melebihi batas waktu yang ditentukan', '7', '3');
INSERT INTO `master_kode` VALUES ('61', '1.04.11.', 'Pertanggungjawaban/penyetoran uang persedian melebihi batas waktu yang ditentukan ', '7', '3');
INSERT INTO `master_kode` VALUES ('62', '1.04.12.', 'Sisa kas di bendara pengeluaran akhir tahuna anggaran belum/tidak disetor ke kas negara/daerah', '7', '3');
INSERT INTO `master_kode` VALUES ('63', '1.04.13.', 'Pengeluaran investasi pemerintah tidak didukung bukti yang sah', '7', '3');
INSERT INTO `master_kode` VALUES ('64', '1.04.14.', 'Kepemilikian aset tidak/belum didukung bukti yang sah', '7', '3');
INSERT INTO `master_kode` VALUES ('65', '1.04.15.', 'Pengalihan anggaran antar MAK tidak sah', '7', '3');
INSERT INTO `master_kode` VALUES ('66', '1.04.16.', 'Pelampauan pagu anggaran', '7', '3');
INSERT INTO `master_kode` VALUES ('67', '1.05.01.', 'Indikasi tindak pidana korupsi', '8', '3');
INSERT INTO `master_kode` VALUES ('68', '1.05.02.', 'Indikasi tindak pidana perbankan', '8', '3');
INSERT INTO `master_kode` VALUES ('69', '1.05.03.', 'Indikasi tindak pidana perpajakan', '8', '3');
INSERT INTO `master_kode` VALUES ('70', '1.05.04.', 'Indikasi tindak pidana kepabeanan', '8', '3');
INSERT INTO `master_kode` VALUES ('71', '1.05.05.', 'Indikasi tindak pidana kehutanan', '8', '3');
INSERT INTO `master_kode` VALUES ('72', '1.05.06.', 'Indikasi tindak pidana pasar modal', '8', '3');
INSERT INTO `master_kode` VALUES ('73', '1.05.07.', 'Indikasi tindak pidana khusus lainnya', '8', '3');
INSERT INTO `master_kode` VALUES ('74', '2.01.01.', 'Pencatatan tidak/belum dilakuakn atau tidak akurat', '9', '3');
INSERT INTO `master_kode` VALUES ('75', '2.01.02.', 'Proses penyusunan laporan tidak sesuai ketentuan', '9', '3');
INSERT INTO `master_kode` VALUES ('76', '2.01.03.', 'Entitas terlambat menyampaikan laporan', '9', '3');
INSERT INTO `master_kode` VALUES ('77', '2.01.04.', 'Sistem informasi akuntansi dan pelaporan tidak memadai', '9', '3');
INSERT INTO `master_kode` VALUES ('78', '2.01.05.', 'Sistem informasi akuntansi dan pelaporan tidak memadai', '9', '3');
INSERT INTO `master_kode` VALUES ('79', '2.02.01.', 'Perencanaan kegiatan tidak memadai', '10', '3');
INSERT INTO `master_kode` VALUES ('80', '2.02.02.', 'Mekanisme pemungutan, penyetoran dan pelaporan serta penggunaan penerimaan negara/daerah/perusahaan dan hibah tidak sesuai ketentuan', '10', '3');
INSERT INTO `master_kode` VALUES ('81', '2.02.03.', 'Penyimpangan terhadap peraturan perundang-undangan bidang teknis tertentu atau ketentuan intern organisasi yang diperiksa tentang pendapatan dan belanja', '10', '3');
INSERT INTO `master_kode` VALUES ('82', '2.02.04.', 'Pelaksanaan belanja di luar mekanisme APBN/APBD', '10', '3');
INSERT INTO `master_kode` VALUES ('83', '2.02.05.', 'Penetapan/pelaksanaan kebijakan tidak tepat atau belum dilakukan berakibat hilangnya potensi penerimaan/pendapatan', '10', '3');
INSERT INTO `master_kode` VALUES ('84', '2.02.06.', 'Penetapan/pelaksanaan kebijakan tidak tepat atau belum dilakukan berakibat peningkatan biaya/belanja', '10', '3');
INSERT INTO `master_kode` VALUES ('85', '2.02.07.', 'Kelemahan pengelolaan fisik aset', '10', '3');
INSERT INTO `master_kode` VALUES ('86', '2.03.01.', 'Entitas tidak memiliki SOP yang formal untuk suatu prosedur atau keseluruhan prosedur', '11', '3');
INSERT INTO `master_kode` VALUES ('87', '2.03.02.', 'SOP yang ada pada entitas tidak berjalan secara optimal atau tidak ditaati', '11', '3');
INSERT INTO `master_kode` VALUES ('88', '2.03.03.', 'Entitas tidak memiliki satuan pengawas intern', '11', '3');
INSERT INTO `master_kode` VALUES ('89', '2.03.04.', 'Satuan pengawas intern yang ada tidak memadai atau tidak berjalan optimal', '11', '3');
INSERT INTO `master_kode` VALUES ('90', '2.03.05.', 'Tidak ada pemisahaan tugas dan fungsi yang memadai ', '11', '3');
INSERT INTO `master_kode` VALUES ('91', '3.01.01.', 'Pengadaan barang/jasa melebihi kebutuhan', '12', '3');
INSERT INTO `master_kode` VALUES ('92', '3.01.02.', 'Penetapan kualtias dan kuantitas barang/jasa yang digunakan tidak sesuai standar', '12', '3');
INSERT INTO `master_kode` VALUES ('93', '3.01.03.', 'Pemborosan keuangan negara/daerah/perusahaan atau kemahalan harga', '12', '3');
INSERT INTO `master_kode` VALUES ('94', '3.02.01.', 'Pengunaan kuantitas input untuk satu satuan output lebih besar/tinggi dari yang seharusnya', '12', '3');
INSERT INTO `master_kode` VALUES ('95', '3.02.02.', 'Penggunaan kualitas input untuk satu satuan output lebih tinggi dari seharusnya', '12', '3');
INSERT INTO `master_kode` VALUES ('96', '3.03.01.', 'Penggunaan anggaran tidak tepat sasaran/tidak sesuai peruntukan', '13', '3');
INSERT INTO `master_kode` VALUES ('97', '3.03.02.', 'Pemanfaatan barang/jasa dilakukan tidak sesuai dengan rencana yang ditetapkan', '13', '3');
INSERT INTO `master_kode` VALUES ('98', '3.03.03.', 'Barang yang dibeli belum/tidak dapat dimanfaatkan', '13', '3');
INSERT INTO `master_kode` VALUES ('99', '3.03.04.', 'Pemanfaatan barang/jasa tidak berdampak terhadap pencapaian tujuan organisasi', '13', '3');
INSERT INTO `master_kode` VALUES ('100', '3.03.05.', 'Pelaksanaan kegiatan terlambat/terhambat sehingga mempengaruhi pencapaian tujuan organisasi', '13', '3');
INSERT INTO `master_kode` VALUES ('101', '3.03.06.', 'Pelayanan kepada maasyarakat tidak optimal', '13', '3');
INSERT INTO `master_kode` VALUES ('102', '3.03.07.', 'Fungsi atau tugas instansi yang diperiksa tidak diselenggarakan dengan baik termasuk target penerimaan tidak tercapai', '13', '3');
INSERT INTO `master_kode` VALUES ('103', '3.03.08.', 'Penggunaan biaya promosi/pemasaraan tidak efektif', '13', '3');

-- ----------------------------
-- Table structure for master_pangkat
-- ----------------------------
DROP TABLE IF EXISTS `master_pangkat`;
CREATE TABLE `master_pangkat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_pangkat
-- ----------------------------

-- ----------------------------
-- Table structure for master_pengumuman
-- ----------------------------
DROP TABLE IF EXISTS `master_pengumuman`;
CREATE TABLE `master_pengumuman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `judul` varchar(255) NOT NULL,
  `pengumuman` text NOT NULL,
  `createddate` datetime NOT NULL,
  `modifieddate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_pengumuman
-- ----------------------------
INSERT INTO `master_pengumuman` VALUES ('1', 'LOUNCHING SMART APLICATION INFORMATION', '<p>Kepada Yth: Auditor dan Staf Inspektorat III</p><p>Sejak tanggal 10 Juni 2016, aplikasi ini resmi kita gunakan sebagai bentuk keinginan kita untuk menggunakan IT dalam membantu pelaksanaan pengawasan.</p><p>Selamat menggunakan.</p><p>Bravo</p>', '2016-06-10 14:01:48', '2016-06-10 14:01:48');
INSERT INTO `master_pengumuman` VALUES ('2', 'Sosialisasi Instrumen DAK/Sergu/Tamsil', '<p>Kepada:</p><p>Bapak/Ibu Auditor Inspektorat III</p><p>Hari ini tanggal 13 Juni 2016, di ruang sidang lantai VI akan diadakan sosialisasi instrumen pemantauan DAK/Sergu/Tamsil pada pukul 15.00 s.d selesai.</p><p>Oleh karena itu, diharapkan kehadirannya tepat waktu. Terima kasih</p>', '2016-06-13 07:46:05', '2016-06-13 07:46:05');

-- ----------------------------
-- Table structure for master_peran
-- ----------------------------
DROP TABLE IF EXISTS `master_peran`;
CREATE TABLE `master_peran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `peran` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_peran
-- ----------------------------
INSERT INTO `master_peran` VALUES ('2', 'Kelompok I');
INSERT INTO `master_peran` VALUES ('3', 'Kelompok II');
INSERT INTO `master_peran` VALUES ('4', 'Kelompok III');
INSERT INTO `master_peran` VALUES ('5', 'Kasubag');
INSERT INTO `master_peran` VALUES ('6', 'BPP');
INSERT INTO `master_peran` VALUES ('7', 'Kelompok IV');
INSERT INTO `master_peran` VALUES ('8', 'Kelompok V');
INSERT INTO `master_peran` VALUES ('10', 'Kelompok VI');
INSERT INTO `master_peran` VALUES ('11', 'Auditor');
INSERT INTO `master_peran` VALUES ('12', 'Staff TU');

-- ----------------------------
-- Table structure for master_probality
-- ----------------------------
DROP TABLE IF EXISTS `master_probality`;
CREATE TABLE `master_probality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_probality
-- ----------------------------
INSERT INTO `master_probality` VALUES ('1', 'Hampir Pasti', 'Risiko ini sudah terjadi, atau mungkin terjadi lebih dari sekali dalam 12 bulan ke depan', '5');
INSERT INTO `master_probality` VALUES ('2', 'Sering', 'Risiko dengan mudah bisa terjadi dan mungkin terjadi setidaknya sekali dalam 12 bulan kedepan', '4');
INSERT INTO `master_probality` VALUES ('3', 'Moderate', 'Ada kesempatan yang rata-rata di atas bahwa risiko akan terjadi setidaknya sekali dalam tiga tahun ke depan', '3');
INSERT INTO `master_probality` VALUES ('4', 'Jarang', 'Risiko terjadi jarang dan tidak mungkin terjadi dalam tiga tahun ke depan', '2');
INSERT INTO `master_probality` VALUES ('5', 'Sangat Jarang', 'Risiko dibayangkan tetapi hanya mungkin terjadi dalam keadaan ekstrim', '1');

-- ----------------------------
-- Table structure for master_residu
-- ----------------------------
DROP TABLE IF EXISTS `master_residu`;
CREATE TABLE `master_residu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `min_val` double(11,2) NOT NULL,
  `max_val` double(11,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_residu
-- ----------------------------
INSERT INTO `master_residu` VALUES ('1', 'Maximum', '10.00', '100.00');
INSERT INTO `master_residu` VALUES ('2', 'High', '7.50', '10.00');
INSERT INTO `master_residu` VALUES ('3', 'Medium', '5.00', '7.50');
INSERT INTO `master_residu` VALUES ('4', 'Low', '2.50', '5.00');
INSERT INTO `master_residu` VALUES ('5', 'Minimum', '0.00', '2.50');

-- ----------------------------
-- Table structure for master_role
-- ----------------------------
DROP TABLE IF EXISTS `master_role`;
CREATE TABLE `master_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_role
-- ----------------------------
INSERT INTO `master_role` VALUES ('4', 'admin');
INSERT INTO `master_role` VALUES ('5', 'anggota');

-- ----------------------------
-- Table structure for master_user
-- ----------------------------
DROP TABLE IF EXISTS `master_user`;
CREATE TABLE `master_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_karyawan` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_karyawan` (`id_karyawan`) USING BTREE,
  CONSTRAINT `master_user_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `master_karyawan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of master_user
-- ----------------------------
INSERT INTO `master_user` VALUES ('3', 'admin', 'admin123!', null, '1');
INSERT INTO `master_user` VALUES ('19', '195921011985031001', '195921011985031001', '75', '2');
INSERT INTO `master_user` VALUES ('20', '196102281198703002', '196102281198703002', '76', '2');
INSERT INTO `master_user` VALUES ('21', '195708191984032001', '195708191984032001', '77', '2');
INSERT INTO `master_user` VALUES ('22', '195810241983121001', '195810241983121001', '78', '2');
INSERT INTO `master_user` VALUES ('23', '196410051989031003', '196410051989031003', '79', '2');
INSERT INTO `master_user` VALUES ('24', '196504271988121001', '196504271988121001', '80', '2');
INSERT INTO `master_user` VALUES ('25', '196109251982031002', '196109251982031002', '81', '2');
INSERT INTO `master_user` VALUES ('26', '195907201986011001', '195907201986011001', '82', '2');
INSERT INTO `master_user` VALUES ('27', '195910311988021001', '195910311988021001', '83', '2');
INSERT INTO `master_user` VALUES ('28', '196011101989031003', '196011101989031003', '84', '2');
INSERT INTO `master_user` VALUES ('29', '196203201989032001', '196203201989032001', '85', '2');
INSERT INTO `master_user` VALUES ('30', '197001071994032002', '197001071994032002', '86', '2');
INSERT INTO `master_user` VALUES ('31', '196302131984031001', '196302131984031001', '87', '2');
INSERT INTO `master_user` VALUES ('32', '195905281988021001', '195905281988021001', '88', '2');
INSERT INTO `master_user` VALUES ('33', '196506131994031001', '196506131994031001', '89', '2');
INSERT INTO `master_user` VALUES ('34', '196909271988121001', '196909271988121001', '90', '2');
INSERT INTO `master_user` VALUES ('35', '196512021987031003', '196512021987031003', '91', '2');
INSERT INTO `master_user` VALUES ('36', '195904271988021001', '195904271988021001', '92', '2');
INSERT INTO `master_user` VALUES ('37', '196908241988122001', '196908241988122001', '93', '2');
INSERT INTO `master_user` VALUES ('38', '196606251987032002', '196606251987032002', '94', '2');
INSERT INTO `master_user` VALUES ('39', '196212031991031002', '196212031991031002', '95', '2');
INSERT INTO `master_user` VALUES ('40', '196311051989031002', '196311051989031002', '96', '2');
INSERT INTO `master_user` VALUES ('41', '196611081992031001', '196611081992031001', '97', '2');
INSERT INTO `master_user` VALUES ('42', '195808061982032002', '195808061982032002', '98', '2');
INSERT INTO `master_user` VALUES ('43', '196809211988122000', '196809211988122000', '99', '2');
INSERT INTO `master_user` VALUES ('44', '196204281988032001', '196204281988032001', '100', '2');
INSERT INTO `master_user` VALUES ('45', '196211141991031002', '196211141991031002', '101', '2');
INSERT INTO `master_user` VALUES ('46', '195704161984111011', '195704161984111011', '102', '2');
INSERT INTO `master_user` VALUES ('47', '197107171994012001', '197107171994012001', '103', '2');
INSERT INTO `master_user` VALUES ('48', '195712311986031013', '195712311986031013', '104', '2');
INSERT INTO `master_user` VALUES ('49', '196204251984122002', '196204251984122002', '105', '2');
INSERT INTO `master_user` VALUES ('50', '195812071985031001', '195812071985031001', '106', '2');
INSERT INTO `master_user` VALUES ('51', '196401121994031001', '196401121994031001', '107', '2');
INSERT INTO `master_user` VALUES ('52', '196011231987032001', '196011231987032001', '108', '2');
INSERT INTO `master_user` VALUES ('53', '195703161988031001', '195703161988031001', '109', '2');
INSERT INTO `master_user` VALUES ('54', '196706171994031001', '196706171994031001', '110', '2');
INSERT INTO `master_user` VALUES ('55', '196202051988022001', '196202051988022001', '111', '2');
INSERT INTO `master_user` VALUES ('56', '195809071980031002', '195809071980031002', '112', '2');
INSERT INTO `master_user` VALUES ('57', '196912121995122001', '196912121995122001', '113', '2');
INSERT INTO `master_user` VALUES ('58', '107308232000031001', '107308232000031001', '114', '2');
INSERT INTO `master_user` VALUES ('59', '197401062005011002', '197401062005011002', '115', '2');
INSERT INTO `master_user` VALUES ('60', '196811121988121001', '196811121988121001', '116', '2');
INSERT INTO `master_user` VALUES ('61', '19810602005011004', '19810602005011004', '117', '2');
INSERT INTO `master_user` VALUES ('62', '196707031994031002', '196707031994031002', '118', '2');
INSERT INTO `master_user` VALUES ('63', '196010131987032001', '196010131987032001', '119', '2');
INSERT INTO `master_user` VALUES ('64', '196509041991031003', '196509041991031003', '120', '2');
INSERT INTO `master_user` VALUES ('65', '196004181960032002', '196004181960032002', '121', '2');
INSERT INTO `master_user` VALUES ('66', '196808031990102001', '196808031990102001', '122', '2');
INSERT INTO `master_user` VALUES ('67', '196704131987032001', '196704131987032001', '123', '2');
INSERT INTO `master_user` VALUES ('68', '196903051988122002', '196903051988122002', '124', '2');
INSERT INTO `master_user` VALUES ('69', '196502071986011001', '196502071986011001', '125', '2');
INSERT INTO `master_user` VALUES ('70', '197001121988021000', '197001121988021000', '126', '2');
INSERT INTO `master_user` VALUES ('71', '19609052001121003', '19609052001121003', '127', '2');
INSERT INTO `master_user` VALUES ('72', '196606081988091001', '196606081988091001', '128', '2');
INSERT INTO `master_user` VALUES ('73', '195902221988031001', '195902221988031001', '129', '2');
INSERT INTO `master_user` VALUES ('74', '196301201992031001', '196301201992031001', '130', '2');
INSERT INTO `master_user` VALUES ('75', '196808061988121002', '196808061988121002', '131', '2');
INSERT INTO `master_user` VALUES ('76', '197305052005011002', '197305052005011002', '132', '2');
INSERT INTO `master_user` VALUES ('77', '197206062000031001', '197206062000031001', '133', '2');
INSERT INTO `master_user` VALUES ('78', '196603161989011001', '196603161989011001', '134', '2');
INSERT INTO `master_user` VALUES ('79', '198704092009122003', '198704092009122003', '135', '2');
INSERT INTO `master_user` VALUES ('80', '108309212008122002', '108309212008122002', '136', '2');
INSERT INTO `master_user` VALUES ('81', '196504181994031003', '196504181994031003', '137', '2');
INSERT INTO `master_user` VALUES ('82', '1968072319900112001', '1968072319900112001', '138', '2');
INSERT INTO `master_user` VALUES ('83', '1984070320080110006', '1984070320080110006', '139', '2');
INSERT INTO `master_user` VALUES ('84', '196403131987032001', '196403131987032001', '140', '2');
INSERT INTO `master_user` VALUES ('85', '196605251988121001', '196605251988121001', '141', '2');
INSERT INTO `master_user` VALUES ('86', '198307102108121002', '198307102108121002', '142', '2');
INSERT INTO `master_user` VALUES ('87', '196307111990011001', '196307111990011001', '143', '2');
INSERT INTO `master_user` VALUES ('88', '196605251988121001', '196605251988121001', '144', '2');
INSERT INTO `master_user` VALUES ('89', '106204231982101001', '106204231982101001', '145', '2');
INSERT INTO `master_user` VALUES ('90', '197812192009121002', '197812192009121002', '146', '2');
INSERT INTO `master_user` VALUES ('91', '196009081984031002', '196009081984031002', '147', '2');
INSERT INTO `master_user` VALUES ('92', '196010101981011001', '196010101981011001', '148', '2');
INSERT INTO `master_user` VALUES ('93', '196809041988121001', '196809041988121001', '149', '2');
INSERT INTO `master_user` VALUES ('94', '196512131987031001', '196512131987031001', '150', '2');
INSERT INTO `master_user` VALUES ('95', '195804121988021001', '195804121988021001', '151', '2');
INSERT INTO `master_user` VALUES ('96', '196404111988022', '196404111988022', '152', '2');
INSERT INTO `master_user` VALUES ('97', '196702061900032', '196702061900032', '153', '2');
INSERT INTO `master_user` VALUES ('98', '195903031984031003', '195903031984031003', '154', '2');

-- ----------------------------
-- Table structure for narasumber_karyawan
-- ----------------------------
DROP TABLE IF EXISTS `narasumber_karyawan`;
CREATE TABLE `narasumber_karyawan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id karyawan` int(11) DEFAULT NULL,
  `topik` varchar(255) NOT NULL,
  `penyalanggara` varchar(255) NOT NULL,
  `tahun` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id karyawan` (`id karyawan`) USING BTREE,
  CONSTRAINT `narasumber_karyawan_ibfk_1` FOREIGN KEY (`id karyawan`) REFERENCES `master_karyawan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of narasumber_karyawan
-- ----------------------------

-- ----------------------------
-- Table structure for pelatihan_karyawan
-- ----------------------------
DROP TABLE IF EXISTS `pelatihan_karyawan`;
CREATE TABLE `pelatihan_karyawan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id karyawan` int(11) DEFAULT NULL,
  `nama` varchar(255) NOT NULL,
  `penyelenggara` varchar(255) NOT NULL,
  `tahun` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id karyawan` (`id karyawan`) USING BTREE,
  CONSTRAINT `pelatihan_karyawan_ibfk_1` FOREIGN KEY (`id karyawan`) REFERENCES `master_karyawan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pelatihan_karyawan
-- ----------------------------

-- ----------------------------
-- Table structure for pelayanan
-- ----------------------------
DROP TABLE IF EXISTS `pelayanan`;
CREATE TABLE `pelayanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pelayanan
-- ----------------------------
INSERT INTO `pelayanan` VALUES ('3', 'Reviu');
INSERT INTO `pelayanan` VALUES ('4', 'Pendampingan');

-- ----------------------------
-- Table structure for pelayanan_karyawan
-- ----------------------------
DROP TABLE IF EXISTS `pelayanan_karyawan`;
CREATE TABLE `pelayanan_karyawan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id pelayanan` int(11) NOT NULL,
  `id karyawan` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`id pelayanan`,`id karyawan`),
  KEY `id pelayanan` (`id pelayanan`) USING BTREE,
  KEY `id karyawan` (`id karyawan`) USING BTREE,
  CONSTRAINT `pelayanan_karyawan_ibfk_1` FOREIGN KEY (`id pelayanan`) REFERENCES `pelayanan_partial` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `pelayanan_karyawan_ibfk_2` FOREIGN KEY (`id karyawan`) REFERENCES `master_karyawan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pelayanan_karyawan
-- ----------------------------

-- ----------------------------
-- Table structure for pelayanan_partial
-- ----------------------------
DROP TABLE IF EXISTS `pelayanan_partial`;
CREATE TABLE `pelayanan_partial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `id parent` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id parent` (`id parent`) USING BTREE,
  CONSTRAINT `pelayanan_partial_ibfk_1` FOREIGN KEY (`id parent`) REFERENCES `pelayanan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pelayanan_partial
-- ----------------------------
INSERT INTO `pelayanan_partial` VALUES ('1', 'Reviu Laporan Keuangan', '3', '1');
INSERT INTO `pelayanan_partial` VALUES ('2', 'Reviu Tindak Lanjut Hasil Audit', '3', '1');
INSERT INTO `pelayanan_partial` VALUES ('3', 'Reviu RKAKL', '3', '1');
INSERT INTO `pelayanan_partial` VALUES ('4', 'Pendampingan dalam PBJ', '4', '1');
INSERT INTO `pelayanan_partial` VALUES ('5', 'Pendampingan Peny. Lap Pertanggung Jawaban Keuangan', '4', '1');
INSERT INTO `pelayanan_partial` VALUES ('6', 'Pendampingan Penyusunan risk register', '4', '1');
INSERT INTO `pelayanan_partial` VALUES ('7', 'Fasilitas peny. Risk fraud', '4', '1');
INSERT INTO `pelayanan_partial` VALUES ('8', 'Pemantauan ', '4', '1');
INSERT INTO `pelayanan_partial` VALUES ('9', 'Lainnya, sebutkan', '4', '0');

-- ----------------------------
-- Table structure for prosedur
-- ----------------------------
DROP TABLE IF EXISTS `prosedur`;
CREATE TABLE `prosedur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_activities` int(11) NOT NULL,
  `prosedur` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_activities` (`id_activities`) USING BTREE,
  CONSTRAINT `prosedur_ibfk_1` FOREIGN KEY (`id_activities`) REFERENCES `activities` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prosedur
-- ----------------------------
INSERT INTO `prosedur` VALUES ('1', '1', '1.1.1.AUDIT KEPATUHAN');
INSERT INTO `prosedur` VALUES ('2', '1', '1.1.2. AUDIT KINERJA');
INSERT INTO `prosedur` VALUES ('3', '1', '1.1.3. AUDIT TUJUAN TERTENTU');
INSERT INTO `prosedur` VALUES ('4', '1', '1.1.4. AUDIT DINI');
INSERT INTO `prosedur` VALUES ('5', '1', '1.1.5. AUDIT E-PROCUREMENT');
INSERT INTO `prosedur` VALUES ('6', '2', '1.2.1. REVIU LAPORAN KEUANGAN');
INSERT INTO `prosedur` VALUES ('7', '2', '1.2.2. REVIU LAKIP');
INSERT INTO `prosedur` VALUES ('8', '2', '1.2.3. REVIU RKAKL');
INSERT INTO `prosedur` VALUES ('9', '2', '1.2.4. REVIU RAB');
INSERT INTO `prosedur` VALUES ('10', '3', '1.3.1. VERIFIKASI UNTUK PEMBAYARAN TAHUN BERBEDA');
INSERT INTO `prosedur` VALUES ('11', '3', '1.3.2. VERIFIKASI UNTUK HIBAH');
INSERT INTO `prosedur` VALUES ('12', '4', '1.4.1. PEMANTAUAN UJIAN NASIONAL');
INSERT INTO `prosedur` VALUES ('13', '5', '1.5.1. MONEV ATASE KEBUDAYAAN LUAR NEGERI');
INSERT INTO `prosedur` VALUES ('14', '5', '1.5.2. MONEV TINJUT HASIL AUDIT');
INSERT INTO `prosedur` VALUES ('15', '6', '2.1.1 PENYUSUNAN RISK REGISTER');
INSERT INTO `prosedur` VALUES ('16', '6', '2.1.2. PENYUSUNAN RISK FRAUD');
INSERT INTO `prosedur` VALUES ('17', '7', '2.2.1. FASILITASI LINGKUNGAN PENGENDALIAN');
INSERT INTO `prosedur` VALUES ('18', '7', '2.2.2. FASILITASI RISK ASSESSEMENT');
INSERT INTO `prosedur` VALUES ('19', '7', '2.2.3. FASILITASI MEMBANGUN KONTROL AKTIVITAS');
INSERT INTO `prosedur` VALUES ('20', '7', '2.2.4. FASILITASI MONITORING DALAM SPIP');
INSERT INTO `prosedur` VALUES ('21', '8', '2.3.1. FASILITASI PROGRAM/KEGIATAN');
INSERT INTO `prosedur` VALUES ('22', '8', '2.3.2. FASILITASI PERBAIKAN CONTROL ACTIVITIES');
INSERT INTO `prosedur` VALUES ('23', '9', '3.1.1. KNOW YOUR EMPLOYE');
INSERT INTO `prosedur` VALUES ('24', '10', '3.2.1. KNOW YOUR COSTUMER');
INSERT INTO `prosedur` VALUES ('25', '11', '3.3.1. SOSIALISASI ANTI FRAUD');
INSERT INTO `prosedur` VALUES ('26', '12', '2.6.1 PENGADUAN VIA SURAT');
INSERT INTO `prosedur` VALUES ('27', '12', '2.6.2. PENGADUAN VIA SMS');
INSERT INTO `prosedur` VALUES ('28', '12', '2.6.3. PENGADUAN VIA WEB');
INSERT INTO `prosedur` VALUES ('29', '12', '2.6.4. PENGELOLAAN PENGADUAN');
INSERT INTO `prosedur` VALUES ('30', '13', '4.2.1. KUNJUNGAN KERJA');
INSERT INTO `prosedur` VALUES ('31', '13', '4.2.2. AUDIT MENDADAK');
INSERT INTO `prosedur` VALUES ('32', '14', '3.1.1. WORKSHOP');
INSERT INTO `prosedur` VALUES ('33', '14', '3.1.2. RAKER');
INSERT INTO `prosedur` VALUES ('34', '14', '3.1.3. SEMINAR');
INSERT INTO `prosedur` VALUES ('35', '14', '3.1.4. KAMPANYE');
INSERT INTO `prosedur` VALUES ('36', '14', '3.1.5. KAIAN/TELAAH');
INSERT INTO `prosedur` VALUES ('37', '14', '3.1.6. PELATIHAN KANTOR SENDIRI (PKS)');
INSERT INTO `prosedur` VALUES ('38', '14', '3.1.7. KOMPILASI HASIL AUDIT');
INSERT INTO `prosedur` VALUES ('39', '14', '3.1.8. RAPAT KERJA');
INSERT INTO `prosedur` VALUES ('40', '14', '3.1.9 GELAR KASUS/EKSPOSE');
INSERT INTO `prosedur` VALUES ('41', '15', '3.2.1. SURAT MASUK');
INSERT INTO `prosedur` VALUES ('42', '15', '3.2.2. SURAT KELUAR');
INSERT INTO `prosedur` VALUES ('43', '15', '3.2.3. LAPORAN HASIL AUDIT');
INSERT INTO `prosedur` VALUES ('44', '15', '3.2.4. PENERIMAAN TAMU');
INSERT INTO `prosedur` VALUES ('45', '15', '3.2.5. RAPAT INTERNAL');
INSERT INTO `prosedur` VALUES ('46', '15', '3.2.6. CUTI PEGAWAI');
INSERT INTO `prosedur` VALUES ('47', '15', '3.2.7. DP3 PEGAWAI');
INSERT INTO `prosedur` VALUES ('48', '15', '3.2.8. PENCAIRAN DANA PENUGASAN');
INSERT INTO `prosedur` VALUES ('49', '15', '3.2.9. PERTANGGUNG JAWABAN PERJALAN DINAS');

-- ----------------------------
-- Table structure for proses_bisnis
-- ----------------------------
DROP TABLE IF EXISTS `proses_bisnis`;
CREATE TABLE `proses_bisnis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_prosedur` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_prosedur` (`id_prosedur`) USING BTREE,
  CONSTRAINT `proses_bisnis_ibfk_1` FOREIGN KEY (`id_prosedur`) REFERENCES `prosedur` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proses_bisnis
-- ----------------------------

-- ----------------------------
-- Table structure for sifat_distribusi
-- ----------------------------
DROP TABLE IF EXISTS `sifat_distribusi`;
CREATE TABLE `sifat_distribusi` (
  `id_distribusi` int(11) NOT NULL,
  `sifat` int(11) NOT NULL,
  PRIMARY KEY (`id_distribusi`,`sifat`),
  KEY `id_distribusi` (`id_distribusi`) USING BTREE,
  CONSTRAINT `sifat_distribusi_ibfk_1` FOREIGN KEY (`id_distribusi`) REFERENCES `distribusi` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sifat_distribusi
-- ----------------------------

-- ----------------------------
-- Table structure for sub_main
-- ----------------------------
DROP TABLE IF EXISTS `sub_main`;
CREATE TABLE `sub_main` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sub_main
-- ----------------------------
INSERT INTO `sub_main` VALUES ('1', '1. ASSURANCE ACTIVITIES');
INSERT INTO `sub_main` VALUES ('2', '2. CONSULTING ACTIVITIES');
INSERT INTO `sub_main` VALUES ('3', '3. PROGRAM PENCEGAHAN');
INSERT INTO `sub_main` VALUES ('4', '4. PENDETEKSIAN');
INSERT INTO `sub_main` VALUES ('5', '5. SUPPORTING ACTIVITIES');

-- ----------------------------
-- Table structure for surat_masuk_disposisi
-- ----------------------------
DROP TABLE IF EXISTS `surat_masuk_disposisi`;
CREATE TABLE `surat_masuk_disposisi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pengirim` varchar(255) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `path` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of surat_masuk_disposisi
-- ----------------------------

-- ----------------------------
-- Table structure for surat_masuk_item
-- ----------------------------
DROP TABLE IF EXISTS `surat_masuk_item`;
CREATE TABLE `surat_masuk_item` (
  `id_surat_masuk` int(11) NOT NULL,
  `id_disposisi` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_surat_masuk`,`id_disposisi`),
  KEY `id_disposisi` (`id_disposisi`) USING BTREE,
  CONSTRAINT `surat_masuk_item_ibfk_1` FOREIGN KEY (`id_surat_masuk`) REFERENCES `surat_masuk_disposisi` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `surat_masuk_item_ibfk_2` FOREIGN KEY (`id_disposisi`) REFERENCES `master_peran` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of surat_masuk_item
-- ----------------------------

-- ----------------------------
-- Table structure for surat_masuk_karyawan
-- ----------------------------
DROP TABLE IF EXISTS `surat_masuk_karyawan`;
CREATE TABLE `surat_masuk_karyawan` (
  `id_distribusi` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_distribusi`,`id_karyawan`),
  KEY `id_distribusi` (`id_distribusi`) USING BTREE,
  KEY `id_karyawan` (`id_karyawan`) USING BTREE,
  CONSTRAINT `surat_masuk_karyawan_ibfk_1` FOREIGN KEY (`id_distribusi`) REFERENCES `surat_masuk_disposisi` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `surat_masuk_karyawan_ibfk_2` FOREIGN KEY (`id_karyawan`) REFERENCES `master_karyawan` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of surat_masuk_karyawan
-- ----------------------------

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_user`,`id_role`),
  KEY `user_roles_ibfk_1` (`id_user`) USING BTREE,
  KEY `user_roles_ibfk_2` (`id_role`) USING BTREE,
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `master_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `master_role` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES ('1', '3', '4');
INSERT INTO `user_roles` VALUES ('17', '19', '5');
INSERT INTO `user_roles` VALUES ('18', '20', '5');
INSERT INTO `user_roles` VALUES ('19', '21', '5');
INSERT INTO `user_roles` VALUES ('20', '22', '5');
INSERT INTO `user_roles` VALUES ('21', '23', '5');
INSERT INTO `user_roles` VALUES ('22', '24', '5');
INSERT INTO `user_roles` VALUES ('23', '25', '5');
INSERT INTO `user_roles` VALUES ('24', '26', '5');
INSERT INTO `user_roles` VALUES ('25', '27', '5');
INSERT INTO `user_roles` VALUES ('26', '28', '5');
INSERT INTO `user_roles` VALUES ('27', '29', '5');
INSERT INTO `user_roles` VALUES ('28', '30', '5');
INSERT INTO `user_roles` VALUES ('29', '31', '5');
INSERT INTO `user_roles` VALUES ('30', '32', '5');
INSERT INTO `user_roles` VALUES ('31', '33', '5');
INSERT INTO `user_roles` VALUES ('32', '34', '5');
INSERT INTO `user_roles` VALUES ('33', '35', '5');
INSERT INTO `user_roles` VALUES ('34', '36', '5');
INSERT INTO `user_roles` VALUES ('35', '37', '5');
INSERT INTO `user_roles` VALUES ('36', '38', '5');
INSERT INTO `user_roles` VALUES ('37', '39', '5');
INSERT INTO `user_roles` VALUES ('38', '40', '5');
INSERT INTO `user_roles` VALUES ('39', '41', '5');
INSERT INTO `user_roles` VALUES ('40', '42', '5');
INSERT INTO `user_roles` VALUES ('41', '43', '5');
INSERT INTO `user_roles` VALUES ('42', '44', '5');
INSERT INTO `user_roles` VALUES ('43', '45', '5');
INSERT INTO `user_roles` VALUES ('44', '46', '5');
INSERT INTO `user_roles` VALUES ('45', '47', '5');
INSERT INTO `user_roles` VALUES ('46', '48', '5');
INSERT INTO `user_roles` VALUES ('47', '49', '5');
INSERT INTO `user_roles` VALUES ('48', '50', '5');
INSERT INTO `user_roles` VALUES ('49', '51', '5');
INSERT INTO `user_roles` VALUES ('50', '52', '5');
INSERT INTO `user_roles` VALUES ('51', '53', '5');
INSERT INTO `user_roles` VALUES ('52', '54', '5');
INSERT INTO `user_roles` VALUES ('53', '55', '5');
INSERT INTO `user_roles` VALUES ('54', '56', '5');
INSERT INTO `user_roles` VALUES ('55', '57', '5');
INSERT INTO `user_roles` VALUES ('56', '58', '5');
INSERT INTO `user_roles` VALUES ('57', '59', '5');
INSERT INTO `user_roles` VALUES ('58', '60', '5');
INSERT INTO `user_roles` VALUES ('59', '61', '5');
INSERT INTO `user_roles` VALUES ('60', '62', '5');
INSERT INTO `user_roles` VALUES ('61', '63', '5');
INSERT INTO `user_roles` VALUES ('62', '64', '5');
INSERT INTO `user_roles` VALUES ('63', '65', '5');
INSERT INTO `user_roles` VALUES ('64', '66', '5');
INSERT INTO `user_roles` VALUES ('65', '67', '5');
INSERT INTO `user_roles` VALUES ('66', '68', '5');
INSERT INTO `user_roles` VALUES ('67', '69', '5');
INSERT INTO `user_roles` VALUES ('68', '70', '5');
INSERT INTO `user_roles` VALUES ('69', '71', '5');
INSERT INTO `user_roles` VALUES ('70', '72', '5');
INSERT INTO `user_roles` VALUES ('71', '73', '5');
INSERT INTO `user_roles` VALUES ('72', '74', '5');
INSERT INTO `user_roles` VALUES ('73', '75', '5');
INSERT INTO `user_roles` VALUES ('74', '76', '5');
INSERT INTO `user_roles` VALUES ('75', '77', '5');
INSERT INTO `user_roles` VALUES ('76', '78', '5');
INSERT INTO `user_roles` VALUES ('77', '79', '5');
INSERT INTO `user_roles` VALUES ('78', '80', '5');
INSERT INTO `user_roles` VALUES ('79', '81', '5');
INSERT INTO `user_roles` VALUES ('80', '82', '5');
INSERT INTO `user_roles` VALUES ('81', '83', '5');
INSERT INTO `user_roles` VALUES ('82', '84', '5');
INSERT INTO `user_roles` VALUES ('83', '85', '5');
INSERT INTO `user_roles` VALUES ('84', '86', '5');
INSERT INTO `user_roles` VALUES ('85', '87', '5');
INSERT INTO `user_roles` VALUES ('86', '88', '5');
INSERT INTO `user_roles` VALUES ('87', '89', '5');
INSERT INTO `user_roles` VALUES ('88', '90', '5');
INSERT INTO `user_roles` VALUES ('89', '91', '5');
INSERT INTO `user_roles` VALUES ('90', '92', '5');
INSERT INTO `user_roles` VALUES ('91', '93', '5');
INSERT INTO `user_roles` VALUES ('92', '94', '5');
INSERT INTO `user_roles` VALUES ('93', '95', '5');
INSERT INTO `user_roles` VALUES ('94', '96', '5');
INSERT INTO `user_roles` VALUES ('95', '97', '5');
INSERT INTO `user_roles` VALUES ('96', '98', '5');
