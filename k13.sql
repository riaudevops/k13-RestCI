-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2019 at 07:14 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `k13`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_key`
--

CREATE TABLE `api_key` (
  `id` int(11) NOT NULL,
  `id_guru` int(3) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_key`
--

INSERT INTO `api_key` (`id`, `id_guru`, `key`, `level`, `ignore_limits`, `date_created`) VALUES
(1, 5, 'c02850c7afe8288e4d2f28a19959d546', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nilai_keterampilan`
--

CREATE TABLE `nilai_keterampilan` (
  `id_nketerampilan` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `RATA_RATA2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai_keterampilan`
--

INSERT INTO `nilai_keterampilan` (`id_nketerampilan`, `id_mapel`, `id_siswa`, `RATA_RATA2`) VALUES
(1, 1, 1, 90);

-- --------------------------------------------------------

--
-- Table structure for table `nilai_pengetahuan`
--

CREATE TABLE `nilai_pengetahuan` (
  `id_npengetahuan` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `id_mapel` int(11) DEFAULT NULL,
  `NPH` int(2) DEFAULT NULL,
  `UTS` int(2) DEFAULT NULL,
  `UAS` int(2) DEFAULT NULL,
  `RATA_RATA` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai_pengetahuan`
--

INSERT INTO `nilai_pengetahuan` (`id_npengetahuan`, `id_siswa`, `id_mapel`, `NPH`, `UTS`, `UAS`, `RATA_RATA`) VALUES
(1, 1, 1, 87, 83, 86, 89),
(2, 1, 2, 70, 70, 70, 70),
(3, 2, 1, 87, 81, 89, 90),
(4, 1, 3, 78, 84, 73, 80),
(5, 2, 2, 90, 87, 85, 83),
(8, 4, 1, 20, 40, 30, 20),
(10, 5, 3, 67, 87, 57, 87),
(11, 5, 2, 67, 78, 87, 87),
(12, 5, 1, 76, 56, 76, 84),
(13, 3, 2, 87, 75, 67, 87),
(14, 3, 1, 56, 76, 76, 56),
(20, 10, 1, 11, 11, 11, 11),
(26, 10, 2, 32, 32, 32, 32);

-- --------------------------------------------------------

--
-- Table structure for table `peg_eskul`
--

CREATE TABLE `peg_eskul` (
  `id_eskul` int(11) NOT NULL,
  `NOMOR` int(2) DEFAULT NULL,
  `KEGIATAN` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `peg_guru`
--

CREATE TABLE `peg_guru` (
  `nama_guru` varchar(30) NOT NULL,
  `nip_guru` varchar(30) NOT NULL,
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peg_guru`
--

INSERT INTO `peg_guru` (`nama_guru`, `nip_guru`, `id`, `id_mapel`, `updated_at`, `created_at`, `deleted_at`) VALUES
('guru', '112345678', 2, 1, '2019-06-27 11:15:07.727194', '2019-05-21 08:26:36.381045', NULL),
('Khairani', '1122334455', 5, 2, '2019-07-01 01:37:10.955317', '2019-06-28 06:35:04.999106', NULL),
('astri', '1234567890', 6, 3, '2019-06-28 07:36:53.757530', '2019-06-28 06:36:01.556578', NULL),
('RIAN', '12345678', 9, 4, '2019-07-03 12:42:45.641293', '2019-06-28 07:32:06.490553', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `peg_kd_ki3`
--

CREATE TABLE `peg_kd_ki3` (
  `id_kd_ki3` int(11) NOT NULL,
  `id_mapel` int(11) DEFAULT NULL,
  `NOMOR` int(2) DEFAULT NULL,
  `KD` varchar(10) DEFAULT NULL,
  `KALIMAT` varchar(700) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `peg_kd_ki3`
--

INSERT INTO `peg_kd_ki3` (`id_kd_ki3`, `id_mapel`, `NOMOR`, `KD`, `KALIMAT`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, '3.1', '-', '2019-06-30 07:36:40', NULL, NULL),
(2, 1, 3, '3.2', '-', '2019-06-30 07:36:50', NULL, NULL),
(17, 2, NULL, '3.1', '-', '2019-06-30 07:39:33', NULL, NULL),
(19, 4, NULL, '3.1', NULL, '2019-06-30 07:38:40', NULL, NULL),
(20, 1, NULL, '3.3', '-', '2019-06-30 07:36:57', NULL, NULL),
(21, 4, NULL, '3.2', NULL, NULL, NULL, NULL),
(22, 2, NULL, '3.2', '-', NULL, NULL, NULL),
(23, 2, NULL, '3.3', NULL, NULL, NULL, NULL),
(24, 4, NULL, '3.3', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `peg_kd_ki4`
--

CREATE TABLE `peg_kd_ki4` (
  `id_kd_ki4` int(11) NOT NULL,
  `id_mapel` int(11) DEFAULT NULL,
  `NOMOR` int(2) DEFAULT NULL,
  `KD` varchar(10) DEFAULT NULL,
  `KALIMAT` varchar(700) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `peg_kd_ki4`
--

INSERT INTO `peg_kd_ki4` (`id_kd_ki4`, `id_mapel`, `NOMOR`, `KD`, `KALIMAT`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, '4.1', 'ini ki4 2', NULL, NULL, NULL),
(3, 2, NULL, '3.2', 'ini ki4', NULL, NULL, NULL),
(4, 1, NULL, '3.2', 'ini ki4', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `peg_kelas`
--

CREATE TABLE `peg_kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(30) NOT NULL,
  `id_walikelas` int(11) NOT NULL,
  `id_TA` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peg_kelas`
--

INSERT INTO `peg_kelas` (`id_kelas`, `nama_kelas`, `id_walikelas`, `id_TA`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'X1', 1, 2, NULL, '2019-06-02 21:21:41', '2019-06-02 21:21:41'),
(2, 'X2', 4, 2, NULL, '2019-06-02 21:26:44', '2019-06-02 21:26:44'),
(3, 'X3', 7, 1, NULL, '2019-06-28 22:57:11', '2019-06-28 22:57:11');

-- --------------------------------------------------------

--
-- Table structure for table `peg_kelas_siswa`
--

CREATE TABLE `peg_kelas_siswa` (
  `id_kelas_siswa` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peg_kelas_siswa`
--

INSERT INTO `peg_kelas_siswa` (`id_kelas_siswa`, `id_kelas`, `id_siswa`, `deleted_at`, `created_at`, `update_at`) VALUES
(1, 1, 1, NULL, NULL, NULL),
(3, 1, 2, NULL, NULL, NULL),
(4, 1, 4, '2019-10-13 11:35:21', NULL, NULL),
(5, 2, 3, NULL, NULL, NULL),
(6, 2, 5, NULL, NULL, NULL),
(7, 2, 10, NULL, NULL, NULL),
(8, 3, 6, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `peg_kesehatan`
--

CREATE TABLE `peg_kesehatan` (
  `id_kesehatan` int(11) NOT NULL,
  `NOMOR` int(2) DEFAULT NULL,
  `FISIK` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `peg_kkm`
--

CREATE TABLE `peg_kkm` (
  `id_kkm` int(11) NOT NULL,
  `KKM_SATUAN_PENDIDIKAN` int(2) DEFAULT NULL,
  `PANJANG_INTERVAL` decimal(10,0) DEFAULT NULL,
  `A_MIN` int(2) DEFAULT NULL,
  `A_MAX` int(3) DEFAULT NULL,
  `B_MIN` int(2) DEFAULT NULL,
  `B_MAX` int(2) DEFAULT NULL,
  `C_MIN` int(2) DEFAULT NULL,
  `C_MAX` int(2) DEFAULT NULL,
  `D_MIN` int(2) DEFAULT NULL,
  `D_MAX` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `peg_mapel`
--

CREATE TABLE `peg_mapel` (
  `id_mapel` int(11) NOT NULL,
  `NOMOR` int(2) DEFAULT NULL,
  `MATA_PELAJARAN` varchar(150) DEFAULT NULL,
  `PENGETAHUAN` int(3) DEFAULT NULL,
  `KETERAMPILAN` int(3) DEFAULT NULL,
  `KELOMPOK` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `peg_mapel`
--

INSERT INTO `peg_mapel` (`id_mapel`, `NOMOR`, `MATA_PELAJARAN`, `PENGETAHUAN`, `KETERAMPILAN`, `KELOMPOK`) VALUES
(1, NULL, 'Pendidikan Agama Islam', 76, 74, 'A'),
(2, NULL, 'Bahasa Indonesia', 75, 76, 'A'),
(3, NULL, 'Bahasa Inggris', 75, 78, 'B'),
(4, NULL, 'Bahasa Jepang', 75, 76, 'D');

-- --------------------------------------------------------

--
-- Table structure for table `peg_mengajar`
--

CREATE TABLE `peg_mengajar` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peg_mengajar`
--

INSERT INTO `peg_mengajar` (`id`, `user_id`, `id_kelas`, `id_mapel`) VALUES
(1, 2, 1, 1),
(2, 2, 2, 1),
(4, 5, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `peg_nilai_kd_keterampilan`
--

CREATE TABLE `peg_nilai_kd_keterampilan` (
  `id_nilai_kd_ket` int(11) NOT NULL,
  `id_mapel` varchar(11) DEFAULT NULL,
  `id_kd` varchar(11) DEFAULT NULL,
  `id_siswa` varchar(11) DEFAULT NULL,
  `id_kelas` varchar(11) DEFAULT NULL,
  `1` int(2) DEFAULT NULL,
  `2` int(2) NOT NULL,
  `3` int(2) NOT NULL,
  `4` int(2) NOT NULL,
  `5` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `peg_nilai_kd_pengetahuan`
--

CREATE TABLE `peg_nilai_kd_pengetahuan` (
  `id_nilai` int(11) NOT NULL,
  `id_kd` int(11) DEFAULT NULL,
  `id_mapel` int(11) DEFAULT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `TEMA_1` int(3) DEFAULT NULL,
  `TEMA_2` int(3) DEFAULT NULL,
  `TEMA_3` int(3) DEFAULT NULL,
  `TEMA_4` int(3) DEFAULT NULL,
  `TEMA_5` int(3) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `peg_nilai_kd_pengetahuan`
--

INSERT INTO `peg_nilai_kd_pengetahuan` (`id_nilai`, `id_kd`, `id_mapel`, `id_siswa`, `TEMA_1`, `TEMA_2`, `TEMA_3`, `TEMA_4`, `TEMA_5`, `deleted_at`, `created_at`, `update_at`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, NULL, NULL, 80, 1, 80, 1, NULL, NULL, NULL, NULL),
(6, NULL, NULL, NULL, 90, 1, 100, 1, NULL, NULL, NULL, NULL),
(7, NULL, NULL, NULL, 50, 1, 80, 1, NULL, NULL, NULL, NULL),
(8, NULL, NULL, NULL, 80, 1, 60, 1, NULL, NULL, NULL, NULL),
(9, NULL, NULL, NULL, 80, 1, 80, 1, NULL, NULL, NULL, NULL),
(10, NULL, 1, 1, 80, 1, 80, 1, NULL, NULL, NULL, NULL),
(11, NULL, 1, 10, 80, 1, 80, 1, NULL, NULL, NULL, NULL),
(12, NULL, 1, 1, 80, 1, 80, 1, NULL, NULL, NULL, NULL),
(13, NULL, 1, 1, 80, 1, 80, 1, NULL, NULL, NULL, NULL),
(14, NULL, 1, 1, 80, 1, 80, 1, NULL, NULL, NULL, NULL),
(15, NULL, 1, 2, 90, 1, 78, 1, NULL, NULL, NULL, NULL),
(16, NULL, 1, 1, 80, 80, 80, 80, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `peg_prestasi`
--

CREATE TABLE `peg_prestasi` (
  `id_prestasi` int(11) NOT NULL,
  `NOMOR` int(2) DEFAULT NULL,
  `PRESTASI` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `peg_rekap_nilai`
--

CREATE TABLE `peg_rekap_nilai` (
  `id_rekap_nilai` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `id_TA` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_mapel` int(11) DEFAULT NULL,
  `RATA_RATA_PENGETAHUAN` int(3) DEFAULT NULL,
  `PREDIKAT_PENGETAHUAN` varchar(1) DEFAULT NULL,
  `DESKRIPSI_PENGETAHUAN` varchar(1400) DEFAULT NULL,
  `RATA_RATA_KETERAMPILAN` int(3) DEFAULT NULL,
  `PREDIKAT_KETERAMPILAN` varchar(1) DEFAULT NULL,
  `DESKRIPSI_KETERAMPILAN` varchar(1400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `peg_rekap_sikap`
--

CREATE TABLE `peg_rekap_sikap` (
  `id_rekap_sikap` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `DESK_SPRITUAL` text DEFAULT NULL,
  `DESKRIPSI_SOSIAL` varchar(1400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `peg_rekap_sikap`
--

INSERT INTO `peg_rekap_sikap` (`id_rekap_sikap`, `id_siswa`, `DESK_SPRITUAL`, `DESKRIPSI_SOSIAL`) VALUES
(1, 1, 'dddd', 'ddd');

-- --------------------------------------------------------

--
-- Table structure for table `peg_sekolah`
--

CREATE TABLE `peg_sekolah` (
  `id_sekolah` int(11) NOT NULL,
  `NAMA_SEKOLAH` varchar(200) DEFAULT NULL,
  `NSS` varchar(100) DEFAULT NULL,
  `NPSN` varchar(100) DEFAULT NULL,
  `ALAMAT_SEKOLAH` varchar(200) DEFAULT NULL,
  `KELURAHAN` varchar(100) DEFAULT NULL,
  `KECAMATAN` varchar(100) DEFAULT NULL,
  `KABUPATEN` varchar(100) DEFAULT NULL,
  `PROVINSI` varchar(100) DEFAULT NULL,
  `KODE_POS` varchar(50) DEFAULT NULL,
  `TELEPON` varchar(50) DEFAULT NULL,
  `WEBSITE` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `NAMA_KEPALA_SEKOLAH` varchar(100) DEFAULT NULL,
  `NIP_KEPALA_SEKOLAH` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `peg_sekolah`
--

INSERT INTO `peg_sekolah` (`id_sekolah`, `NAMA_SEKOLAH`, `NSS`, `NPSN`, `ALAMAT_SEKOLAH`, `KELURAHAN`, `KECAMATAN`, `KABUPATEN`, `PROVINSI`, `KODE_POS`, `TELEPON`, `WEBSITE`, `EMAIL`, `NAMA_KEPALA_SEKOLAH`, `NIP_KEPALA_SEKOLAH`) VALUES
(1, 'SMK TIGAMA PEKANBARU', '214124', '10404043', 'JL.TAMAN KARYA', 'TUAH KARYA', 'TAMPAN', 'KOTA PEKANBARU', 'PEKANBARU', '28192', '(0761) 7079902', 'http://www.smktigamapekanbaru.sch.id/', 'smk3mapekanbaru@yahoo.com', 'Fina Varita2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `peg_siswa`
--

CREATE TABLE `peg_siswa` (
  `id_siswa` int(11) NOT NULL,
  `NIS` varchar(30) DEFAULT NULL,
  `NISN` varchar(30) DEFAULT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `TEMPAT_LAHIR` varchar(100) DEFAULT NULL,
  `TANGGAL_LAHIR` date DEFAULT NULL,
  `JENIS_KELAMIN` varchar(50) DEFAULT NULL,
  `AGAMA` varchar(50) DEFAULT NULL,
  `PENDIDIKAN_SEBELUMNYA` varchar(100) DEFAULT NULL,
  `ALAMAT` varchar(100) DEFAULT NULL,
  `NAMA_AYAH` varchar(100) DEFAULT NULL,
  `NAMA_IBU` varchar(100) DEFAULT NULL,
  `PEKERJAAN_AYAH` varchar(100) DEFAULT NULL,
  `PEKERJAAN_IBU` varchar(100) DEFAULT NULL,
  `ALAMAT_ORTU_JALAN` varchar(100) DEFAULT NULL,
  `NAMA_WALI` varchar(100) DEFAULT NULL,
  `PEKERJAAN_WALI` varchar(100) DEFAULT NULL,
  `ALAMAT_WALI` varchar(100) DEFAULT NULL,
  `TINGGI_BADAN_1` varchar(10) DEFAULT NULL,
  `TINGGI_BADAN_2` varchar(10) DEFAULT NULL,
  `BERAT_BADAN_1` varchar(10) DEFAULT NULL,
  `BERAT_BADAN_2` varchar(10) DEFAULT NULL,
  `SAKIT` int(5) DEFAULT NULL,
  `IZIN` int(5) DEFAULT NULL,
  `TANPA_KETERANGAN` int(5) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `peg_siswa`
--

INSERT INTO `peg_siswa` (`id_siswa`, `NIS`, `NISN`, `NAMA`, `image`, `TEMPAT_LAHIR`, `TANGGAL_LAHIR`, `JENIS_KELAMIN`, `AGAMA`, `PENDIDIKAN_SEBELUMNYA`, `ALAMAT`, `NAMA_AYAH`, `NAMA_IBU`, `PEKERJAAN_AYAH`, `PEKERJAAN_IBU`, `ALAMAT_ORTU_JALAN`, `NAMA_WALI`, `PEKERJAAN_WALI`, `ALAMAT_WALI`, `TINGGI_BADAN_1`, `TINGGI_BADAN_2`, `BERAT_BADAN_1`, `BERAT_BADAN_2`, `SAKIT`, `IZIN`, `TANPA_KETERANGAN`, `created_by`, `deleted_at`, `updated_at`, `created_at`, `updated_by`, `deleted_by`) VALUES
(1, '19990230903', NULL, 'Imam Khoiri Jelfi', '', 'Pujud', '2019-05-30', 'L', 'Islam', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2019-06-04 09:53:48.835600', '2019-05-04 22:42:32.531026', 3, NULL),
(2, '12121312434', 'vfdb', 'Kurniado', '', 'Kritang', '2019-05-31', 'L', 'rgrdg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2019-06-04 09:47:01.323054', '2019-05-04 22:43:21.843659', 3, NULL),
(3, '21312324324', '13113121211', 'Amanda', '', 'Pekanbaru', '2019-05-30', 'P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-06-28 22:22:31.367690', '2019-06-28 22:22:31.367690', '2019-05-05 09:26:47.857805', 3, NULL),
(4, '11321213243', 'nbbn', 'Rian', '', 'Pasir Putih', '2019-05-31', 'L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2019-06-04 09:51:27.153626', '2019-05-05 09:27:10.978130', 3, NULL),
(5, '12132142121', '35353546', 'Novika', '', 'Bangkinang', '2019-05-29', 'P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2019-06-04 09:51:36.022644', '2019-05-05 09:28:07.963951', 3, NULL),
(6, '213124112', '214214', 'Dafa', '', 'Pekanbaru', '2019-05-03', 'L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2019-06-04 09:50:53.141886', '2019-05-05 09:28:33.066071', 3, NULL),
(8, '123123123', '123123123', 'kurnikurni', 'images/o0W7oWwMN6vuiUv4ckLuiLEOAWh26KsezRCCWyPP.png', NULL, NULL, 'P', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2019-06-26 09:54:46.099687', '2019-06-26 09:54:46.099687', '2019-06-26 08:30:10.165809', 3, NULL),
(9, '1234567890', '1234567890', 'Imam kh', 'images/qcCldfqhWze5NupJZDurh0D5NFJEUI6374D523lF.png', NULL, NULL, 'L', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2019-06-26 09:54:55.767327', '2019-06-26 09:54:55.767327', '2019-06-26 09:50:35.821998', 3, NULL),
(10, '11221122112211', '1122112211221', 'JOKO', 'images/hHVUHs2kvsB5iRxf2jboGNhgyJiHXHcwWNmlCuTG.png', 'Pasir Putih', '2019-06-12', 'L', 'Islam', 'SMP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '170', NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, '2019-06-29 20:18:56.495264', '2019-06-29 20:18:56.495264', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `peg_siswa_eskul`
--

CREATE TABLE `peg_siswa_eskul` (
  `id_siswa_ekskul` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `id_eskul` int(11) DEFAULT NULL,
  `KETERANGAN` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `peg_siswa_prestasi`
--

CREATE TABLE `peg_siswa_prestasi` (
  `id_siswa_prestasi` int(11) NOT NULL,
  `id_siswa` int(11) DEFAULT NULL,
  `id_prestasi` int(11) DEFAULT NULL,
  `KETERANGAN` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `peg_tahun_ajaran`
--

CREATE TABLE `peg_tahun_ajaran` (
  `id_tahun_ajaran` int(11) NOT NULL,
  `tahun_ajaran` varchar(12) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peg_tahun_ajaran`
--

INSERT INTO `peg_tahun_ajaran` (`id_tahun_ajaran`, `tahun_ajaran`, `semester`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '2019-2020', '1', NULL, NULL, '2019-06-28 19:44:05'),
(2, '2020-2021', '2', NULL, NULL, '2019-06-28 19:44:11'),
(3, '2021-2022', '1', NULL, NULL, '2019-06-28 19:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `peg_walikelas`
--

CREATE TABLE `peg_walikelas` (
  `id_walikelas` int(11) NOT NULL,
  `nama_walikelas` varchar(30) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL ON UPDATE current_timestamp(6),
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peg_walikelas`
--

INSERT INTO `peg_walikelas` (`id_walikelas`, `nama_walikelas`, `nip`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'MERI HAYANI', '1221232322343435', NULL, '2019-05-21 08:25:59.604548', '2019-06-30 06:52:59.195420'),
(4, 'RIAN KURNIAWAN', '112211221212', NULL, '2019-06-18 07:28:19.164269', '2019-06-30 06:53:11.793063'),
(7, 'REZA FURNAMA', '1234567890', NULL, '2019-06-28 06:37:04.770759', '2019-06-28 06:37:04.770759');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `deleted_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `roles`, `api_key`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'walikelas', 'wali@gmail.com', '$2y$10$QYfIJxaTktVTPV1BHCYxlOr.K0p3adknPjkl3vDxG8KEZk2csNujy', 'WALIKELAS', '', '2019-05-21 08:25:59.570737', '2019-06-02 22:19:57.943908', NULL),
(2, 'guru', 'guru@gmail.com', '$2y$10$lrQH3WB0zEjyM1M7/GYKPepKchNJ0vfxg/tmo8/GHlXdyTLKmDZt2', 'GURU', 'c02850c7afe8288e4d2f28a19959d546', '2019-05-21 08:26:36.333025', '2019-06-01 08:13:55.012930', NULL),
(3, 'imam', 'imamkhoiri.ikj@gmail.com', '$2y$10$PGDGx9mgh4dF8zLn7tthhurGI3T3BLLbBfic2DeHCB.gagx9j7Apu', 'ADMIN', '', '2019-05-21 08:28:10.025452', '2019-05-21 08:28:10.025452', NULL),
(4, 'RIAN KURNIAWAN', 'rian@gmail.com', '$2y$10$ZvKkedzmntBuC8grCHpxaOqgeBCtYijML.LaQyyHBRY2.bqo574R2', 'WALIKELAS', '', '2019-06-18 07:28:19.117453', '2019-06-18 07:28:19.117453', NULL),
(5, 'rani', 'gururani@gmail.com', '$2y$10$gluylBQfh80SCBKQnw8JaeFEl4k/qhWwNypFA6qjXHuF04mBB3.qS', 'GURU', 'f62002db6e7c6ad07e2b524064ff5ff0', '2019-06-28 06:35:04.948199', '2019-06-28 06:35:04.948199', NULL),
(6, 'astri', 'guruastri@gmail.com', '$2y$10$nHDLJygdb2UGjb7DaQBFLOF2eR8OwMOY7lB7GBLcE7Zhrd/6ArQPq', 'GURU', '31bbf06977da87103694409515924999', '2019-06-28 06:36:01.493338', '2019-06-28 06:36:01.493338', NULL),
(7, 'REZA FURNAMA', 'rezafurnama@gmail.com', '$2y$10$kVi7pW9tkqtNkYa.iq.tEuL.Q2gxK11bJPOUrrEf2ooqUeohDNaOC', 'WALIKELAS', '', '2019-06-28 06:37:04.733710', '2019-06-28 06:37:04.733710', NULL),
(9, 'rian', 'gururian@gmail.com', '$2y$10$e5EucPO.mXYYZGOpyV9EKOLe8cKYzhMNmQn9qhsMZb3em6DmPbYgm', 'GURU', '0657dfcf29d7da6ff237a4186898546f', '2019-06-28 07:32:06.444887', '2019-06-28 07:32:06.444887', NULL),
(10, 'admin', 'admin@admin.com', '$2y$10$4vHgZt91YVgF4Qf8dEE4aOavjzXLGDVMtDcg/YTrOUqDRXWXlsOrW', 'ADMIN', '', '2019-05-21 08:28:10.025452', '2019-05-21 08:28:10.025452', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nilai_keterampilan`
--
ALTER TABLE `nilai_keterampilan`
  ADD PRIMARY KEY (`id_nketerampilan`);

--
-- Indexes for table `nilai_pengetahuan`
--
ALTER TABLE `nilai_pengetahuan`
  ADD PRIMARY KEY (`id_npengetahuan`);

--
-- Indexes for table `peg_eskul`
--
ALTER TABLE `peg_eskul`
  ADD PRIMARY KEY (`id_eskul`);

--
-- Indexes for table `peg_guru`
--
ALTER TABLE `peg_guru`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peg_kd_ki3`
--
ALTER TABLE `peg_kd_ki3`
  ADD PRIMARY KEY (`id_kd_ki3`);

--
-- Indexes for table `peg_kd_ki4`
--
ALTER TABLE `peg_kd_ki4`
  ADD PRIMARY KEY (`id_kd_ki4`);

--
-- Indexes for table `peg_kelas`
--
ALTER TABLE `peg_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `peg_kelas_siswa`
--
ALTER TABLE `peg_kelas_siswa`
  ADD PRIMARY KEY (`id_kelas_siswa`);

--
-- Indexes for table `peg_kesehatan`
--
ALTER TABLE `peg_kesehatan`
  ADD PRIMARY KEY (`id_kesehatan`);

--
-- Indexes for table `peg_kkm`
--
ALTER TABLE `peg_kkm`
  ADD PRIMARY KEY (`id_kkm`);

--
-- Indexes for table `peg_mapel`
--
ALTER TABLE `peg_mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `peg_mengajar`
--
ALTER TABLE `peg_mengajar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peg_nilai_kd_keterampilan`
--
ALTER TABLE `peg_nilai_kd_keterampilan`
  ADD PRIMARY KEY (`id_nilai_kd_ket`);

--
-- Indexes for table `peg_nilai_kd_pengetahuan`
--
ALTER TABLE `peg_nilai_kd_pengetahuan`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `peg_prestasi`
--
ALTER TABLE `peg_prestasi`
  ADD PRIMARY KEY (`id_prestasi`);

--
-- Indexes for table `peg_rekap_nilai`
--
ALTER TABLE `peg_rekap_nilai`
  ADD PRIMARY KEY (`id_rekap_nilai`);

--
-- Indexes for table `peg_rekap_sikap`
--
ALTER TABLE `peg_rekap_sikap`
  ADD PRIMARY KEY (`id_rekap_sikap`);

--
-- Indexes for table `peg_sekolah`
--
ALTER TABLE `peg_sekolah`
  ADD PRIMARY KEY (`id_sekolah`);

--
-- Indexes for table `peg_siswa`
--
ALTER TABLE `peg_siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `peg_siswa_eskul`
--
ALTER TABLE `peg_siswa_eskul`
  ADD PRIMARY KEY (`id_siswa_ekskul`);

--
-- Indexes for table `peg_siswa_prestasi`
--
ALTER TABLE `peg_siswa_prestasi`
  ADD PRIMARY KEY (`id_siswa_prestasi`);

--
-- Indexes for table `peg_tahun_ajaran`
--
ALTER TABLE `peg_tahun_ajaran`
  ADD PRIMARY KEY (`id_tahun_ajaran`);

--
-- Indexes for table `peg_walikelas`
--
ALTER TABLE `peg_walikelas`
  ADD PRIMARY KEY (`id_walikelas`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_key`
--
ALTER TABLE `api_key`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nilai_keterampilan`
--
ALTER TABLE `nilai_keterampilan`
  MODIFY `id_nketerampilan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nilai_pengetahuan`
--
ALTER TABLE `nilai_pengetahuan`
  MODIFY `id_npengetahuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `peg_eskul`
--
ALTER TABLE `peg_eskul`
  MODIFY `id_eskul` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peg_kd_ki3`
--
ALTER TABLE `peg_kd_ki3`
  MODIFY `id_kd_ki3` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `peg_kd_ki4`
--
ALTER TABLE `peg_kd_ki4`
  MODIFY `id_kd_ki4` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `peg_kelas`
--
ALTER TABLE `peg_kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `peg_kelas_siswa`
--
ALTER TABLE `peg_kelas_siswa`
  MODIFY `id_kelas_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `peg_kesehatan`
--
ALTER TABLE `peg_kesehatan`
  MODIFY `id_kesehatan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peg_kkm`
--
ALTER TABLE `peg_kkm`
  MODIFY `id_kkm` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peg_mapel`
--
ALTER TABLE `peg_mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `peg_mengajar`
--
ALTER TABLE `peg_mengajar`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `peg_nilai_kd_keterampilan`
--
ALTER TABLE `peg_nilai_kd_keterampilan`
  MODIFY `id_nilai_kd_ket` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peg_nilai_kd_pengetahuan`
--
ALTER TABLE `peg_nilai_kd_pengetahuan`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `peg_prestasi`
--
ALTER TABLE `peg_prestasi`
  MODIFY `id_prestasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peg_rekap_nilai`
--
ALTER TABLE `peg_rekap_nilai`
  MODIFY `id_rekap_nilai` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peg_rekap_sikap`
--
ALTER TABLE `peg_rekap_sikap`
  MODIFY `id_rekap_sikap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `peg_sekolah`
--
ALTER TABLE `peg_sekolah`
  MODIFY `id_sekolah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `peg_siswa`
--
ALTER TABLE `peg_siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `peg_siswa_eskul`
--
ALTER TABLE `peg_siswa_eskul`
  MODIFY `id_siswa_ekskul` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peg_siswa_prestasi`
--
ALTER TABLE `peg_siswa_prestasi`
  MODIFY `id_siswa_prestasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peg_tahun_ajaran`
--
ALTER TABLE `peg_tahun_ajaran`
  MODIFY `id_tahun_ajaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `peg_walikelas`
--
ALTER TABLE `peg_walikelas`
  MODIFY `id_walikelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
