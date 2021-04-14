-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Apr 2021 pada 16.34
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clc_keuangan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `aktifitas`
--

CREATE TABLE `aktifitas` (
  `id` int(11) NOT NULL,
  `id_pengkodeans` int(11) DEFAULT NULL,
  `uraian` varchar(100) DEFAULT NULL,
  `kode` varchar(5) NOT NULL,
  `status` varchar(12) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `aktifitas`
--

INSERT INTO `aktifitas` (`id`, `id_pengkodeans`, `uraian`, `kode`, `status`, `created_date`, `updated_date`) VALUES
(1, 0, 'Pengembangan Kompetensi Lulusan', '1', 'Aktif', '2021-03-07 19:15:56', NULL),
(2, 0, 'Pengembangan Standart isi', '2', 'Aktif', '2021-03-07 19:15:56', NULL),
(3, 0, 'Pengembangan Standart Proses', '3', 'Aktif', NULL, NULL),
(4, 3, 'Pengembangan Perpustakaan ', '3.1', 'Aktif', NULL, NULL),
(6, 3, 'Pengadaan Alat dan Media Pembelajaran', '3.2', 'Aktif', NULL, NULL),
(8, 3, 'Penerimaan Peserta Didik Baru', '3.3', 'Aktif', NULL, NULL),
(9, 0, 'Pengembangan Pendidik dan Tenaga Kependidikan', '4', 'Aktif', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cabangs`
--

CREATE TABLE `cabangs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `kode` varchar(20) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `no_telpon` varchar(13) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `jumlah_kelas_7` int(11) NOT NULL,
  `jumlah_kelas_8` int(11) NOT NULL,
  `jumlah_kelas_9` int(11) NOT NULL,
  `total_jumlah_siswa` int(11) NOT NULL,
  `jumlah_guru_bina` int(11) NOT NULL,
  `jumlah_guru_pamong` int(11) NOT NULL,
  `total_jumlah_guru` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cabangs`
--

INSERT INTO `cabangs` (`id`, `user_id`, `kode`, `nama`, `no_telpon`, `alamat`, `status`, `created_date`, `updated_date`, `jumlah_kelas_7`, `jumlah_kelas_8`, `jumlah_kelas_9`, `total_jumlah_siswa`, `jumlah_guru_bina`, `jumlah_guru_pamong`, `total_jumlah_guru`) VALUES
(1, 1, '9LN01080', 'SDN Bojong Kaler', '08321123110', 'Malaysia', 'Aktif', NULL, NULL, 20, 0, 0, 20, 12, 13, 20),
(2, 322, '9LN01081', 'SMP Cimahi', '081231231', '-', 'Aktif', NULL, NULL, 10, 0, 0, 10, 21, 11, 10),
(3, 323, '9LN01082', 'SMP Bandung', '0813131', 'banung', 'Aktif', NULL, NULL, 8, 10, 21, 39, 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kurs`
--

CREATE TABLE `kurs` (
  `id` int(11) NOT NULL,
  `ringgit` int(11) DEFAULT NULL,
  `rupiah` int(11) DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kurs`
--

INSERT INTO `kurs` (`id`, `ringgit`, `rupiah`, `status`, `created_date`, `updated_date`) VALUES
(1, 1, 3500, 'Aktif', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `level`
--

CREATE TABLE `level` (
  `lev_id` int(11) NOT NULL,
  `lev_nama` varchar(50) NOT NULL,
  `lev_keterangan` text NOT NULL,
  `lev_status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `level`
--

INSERT INTO `level` (`lev_id`, `lev_nama`, `lev_keterangan`, `lev_status`, `created_at`) VALUES
(2, 'Super Admin', '-', 'Aktif', '2020-06-18 09:40:31'),
(4, 'Admin Sekolah', '-', 'Aktif', '2020-06-18 10:20:10'),
(6, 'Siswa', '-', 'Aktif', '2021-02-13 07:32:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_menu_id` int(11) NOT NULL,
  `menu_nama` varchar(50) NOT NULL,
  `menu_keterangan` text NOT NULL,
  `menu_index` int(11) NOT NULL,
  `menu_icon` varchar(50) NOT NULL,
  `menu_url` varchar(100) NOT NULL,
  `menu_status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_menu_id`, `menu_nama`, `menu_keterangan`, `menu_index`, `menu_icon`, `menu_url`, `menu_status`, `created_at`) VALUES
(1, 0, 'Dashboard', '-', 1, 'fa fa-suitcase', 'dashboard', 'Aktif', '2020-06-18 09:40:07'),
(2, 0, 'Pengaturan', '-', 10, 'fa fa-cogs', '#', 'Aktif', '2020-06-18 09:40:07'),
(3, 2, 'Hak Akses', '-', 1, 'fa fa-caret-right', 'pengaturan/hakAkses', 'Aktif', '2020-06-18 09:40:07'),
(4, 2, 'Menu', '-', 2, 'fa fa-caret-right', 'pengaturan/menu', 'Aktif', '2020-06-18 09:40:07'),
(5, 2, 'Level', '-', 3, 'fa fa-caret-right', 'pengaturan/level', 'Aktif', '2020-06-18 09:40:07'),
(6, 2, 'Pengguna', '-', 4, 'fa fa-caret-right', 'pengaturan/pengguna', 'Aktif', '2020-06-18 09:40:07'),
(15, 0, 'Home', '-', 1, 'fa fa-home', 'home', 'Aktif', '2020-06-18 10:24:18'),
(38, 2, 'Periode', '-', 1, 'fa fa-caret-right', 'pengaturan/periode', 'Aktif', '2021-03-01 15:31:44'),
(39, 2, 'Kurs', '-', 2, 'fa fa-caret-right', 'pengaturan/kurs', 'Aktif', '2021-03-01 15:32:01'),
(40, 0, 'Cabang', '-', 1, 'fa fa-user-md', 'cabang', 'Aktif', '2021-03-01 15:32:38'),
(41, 0, 'RAB', '-', 2, 'fa fa-list-ul', '#', 'Aktif', '2021-03-01 16:09:44'),
(42, 41, 'Aktifitas Utama', '-', 1, 'fa fa-caret-right', 'rab/aktifitas', 'Aktif', '2021-03-01 16:10:15'),
(43, 41, 'Cabang', '-', 2, 'fa fa-caret-right', 'rab/cabang', 'Aktif', '2021-03-01 16:10:30'),
(44, 0, 'Saldo', '-', 3, 'fa fa-usd', '#', 'Aktif', '2021-03-01 16:14:46'),
(45, 44, 'Cabang', '-', 1, 'fa fa-caret-right', 'saldo/cabang', 'Aktif', '2021-03-01 16:15:43'),
(46, 44, 'Pemasukan', '-', 2, 'fa fa-caret-right', 'saldo/pemasukan', 'Aktif', '2021-03-01 16:16:13'),
(47, 44, 'Pengeluaran', '-', 3, 'fa fa-caret-right', 'saldo/pengeluaran', 'Aktif', '2021-03-01 16:16:34'),
(48, 0, 'Laporan', '-', 6, 'fa fa-book', '#', 'Aktif', '2021-03-02 07:26:24'),
(49, 48, 'RAB', '-', 1, 'fa fa-caret-right', 'laporan/rab', 'Aktif', '2021-03-02 07:27:13'),
(50, 48, 'Pengeluaran', '-', 2, 'fa fa-caret-right', 'laporan/pengeluaran', 'Aktif', '2021-03-02 07:27:38'),
(51, 41, 'Preview', '-', 3, 'fa fa-caret-right', 'rab/preview', 'Aktif', '2021-03-17 09:45:23'),
(52, 0, 'Realisasi', '-', 3, ' fa fa-usd', '#', 'Aktif', '2021-04-06 10:01:38'),
(53, 52, 'Data', '-', 1, ' fa fa-caret-right', 'realisasi', 'Aktif', '2021-04-12 05:44:38'),
(54, 52, 'Dana Sisa', '-', 2, ' fa fa-caret-right', 'realisasi/danaSisa', 'Aktif', '2021-04-12 05:45:07'),
(55, 52, 'Dana Kurang', '-', 3, ' fa fa-caret-right', 'realisasi/danaKurang', 'Aktif', '2021-04-12 05:45:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `periodes`
--

CREATE TABLE `periodes` (
  `id` int(11) NOT NULL,
  `tahun_awal` int(11) DEFAULT NULL,
  `tahun_akhir` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pindah_dana`
--

CREATE TABLE `pindah_dana` (
  `id` int(11) NOT NULL,
  `id_realisasi` int(11) DEFAULT NULL,
  `sisa_ringgit` int(11) DEFAULT NULL,
  `sisa_rupiah` int(11) DEFAULT NULL,
  `kategori` varchar(20) DEFAULT NULL,
  `id_rab` int(11) DEFAULT NULL,
  `jumlah_ringgit` int(11) DEFAULT NULL,
  `jumlah_rupiah` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rabs`
--

CREATE TABLE `rabs` (
  `id` int(11) NOT NULL,
  `id_cabang` int(11) NOT NULL,
  `id_aktifitas` int(11) DEFAULT NULL,
  `kode_isi_1` varchar(15) DEFAULT NULL,
  `kode_isi_2` varchar(15) DEFAULT NULL,
  `kode_isi_3` varchar(15) DEFAULT NULL,
  `kode` varchar(15) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jumlah_1` int(11) NOT NULL,
  `satuan_1` varchar(50) NOT NULL,
  `jumlah_2` int(11) NOT NULL,
  `satuan_2` varchar(50) NOT NULL,
  `jumlah_3` int(11) NOT NULL,
  `satuan_3` varchar(50) NOT NULL,
  `jumlah_4` int(11) NOT NULL,
  `satuan_4` varchar(50) NOT NULL,
  `harga_ringgit` float DEFAULT NULL,
  `harga_rupiah` float DEFAULT NULL,
  `total_harga_ringgit` float DEFAULT NULL,
  `total_harga_rupiah` float DEFAULT NULL,
  `prioritas` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rabs`
--

INSERT INTO `rabs` (`id`, `id_cabang`, `id_aktifitas`, `kode_isi_1`, `kode_isi_2`, `kode_isi_3`, `kode`, `nama`, `jumlah_1`, `satuan_1`, `jumlah_2`, `satuan_2`, `jumlah_3`, `satuan_3`, `jumlah_4`, `satuan_4`, `harga_ringgit`, `harga_rupiah`, `total_harga_ringgit`, `total_harga_rupiah`, `prioritas`, `status`, `created_date`, `updated_date`) VALUES
(1, 1, 4, '', '0', '0', '3.1.1', 'Pengadaan Buku Teks Siswa (Buku Pelajaran)', 0, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, 0, '2', NULL, NULL),
(2, 1, 4, '1', '0', '0', '3.1.1.1', 'Kelas IX', 0, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, 0, '2', NULL, NULL),
(3, 1, 4, '1', '2', '0', '3.1.1.1.1', 'Pendidikan Agama dan Budi Pekerti', 0, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, 0, '2', NULL, NULL),
(5, 1, 4, '1', '2', '3', '3.1.1.1.1.2', 'Agama Kristen', 0, '', 0, '', 0, '', 0, '', 0, 1000, 1000, 0, 0, '2', NULL, NULL),
(6, 1, 4, '1', '2', '3', '3.1.1.1.1.3', 'Agama Katolik', 0, '', 0, '', 0, '', 0, '', 5, 25000, 50, 250000, 1, '2', NULL, NULL),
(10, 3, 4, '', '0', '0', '3.1.1', 'Buku Teks Siswa', 0, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, 1, '2', NULL, NULL),
(11, 3, 4, '10', '0', '0', '3.1.1.1', 'Kelas 7', 0, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, 1, '2', NULL, NULL),
(12, 3, 4, '10', '11', '0', '3.1.1.1.1', 'Bahasa Indonesia', 20, 'buku', 0, '', 0, '', 0, '', 10, 50000, 200, 1000000, 1, '2', NULL, NULL),
(13, 3, 4, '', '0', '0', '3.1.2', 'Honor Guru Pamong', 2, 'orang', 12, 'jam', 0, '', 0, '', 25, 125000, 350, 1750000, 1, '2', NULL, NULL),
(14, 3, 4, '10', '0', '0', '3.1.1.2', 'Kelas 8', 1, '', 1, '', 1, '', 1, '', 0, 0, 0, 0, 1, '2', NULL, NULL),
(15, 3, 4, '10', '11', '12', '3.1.1.1.1.1', 'Bahasa Indonesia Seri A', 1, '', 1, '', 1, '', 1, '', 0, 7000, 2, 7000, 1, '2', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `realisasis`
--

CREATE TABLE `realisasis` (
  `id` int(11) NOT NULL,
  `id_rab` int(11) NOT NULL,
  `id_cabang` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `keterangan` text NOT NULL,
  `harga_ringgit` int(11) NOT NULL,
  `harga_rupiah` int(11) NOT NULL,
  `gambar` varchar(250) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `realisasis`
--

INSERT INTO `realisasis` (`id`, `id_rab`, `id_cabang`, `nama`, `keterangan`, `harga_ringgit`, `harga_rupiah`, `gambar`, `tanggal`) VALUES
(8, 12, 3, 'd', 'dd', 200, 700000, 'clock.png', '2021-04-12'),
(9, 13, 3, 'e', 'e', 350, 1225000, 'score.png', '2021-04-12'),
(10, 15, 3, '33', '33', 2, 7000, 'cm-logo-1.png', '2021-04-12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_aplikasi`
--

CREATE TABLE `role_aplikasi` (
  `rola_id` int(11) NOT NULL,
  `rola_menu_id` int(11) NOT NULL,
  `rola_lev_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `role_aplikasi`
--

INSERT INTO `role_aplikasi` (`rola_id`, `rola_menu_id`, `rola_lev_id`, `created_at`) VALUES
(2, 1, 2, '2020-06-18 09:39:47'),
(7, 6, 2, '2020-06-18 09:39:47'),
(8, 2, 2, '2020-06-18 09:39:47'),
(17, 15, 5, '2020-06-18 10:24:29'),
(24, 19, 5, '2020-06-27 14:03:43'),
(25, 20, 4, '2020-06-27 16:04:16'),
(26, 20, 5, '2020-06-27 16:04:21'),
(27, 21, 2, '2020-07-07 00:55:36'),
(28, 23, 2, '2020-07-07 06:56:39'),
(32, 27, 2, '2020-07-15 07:54:34'),
(37, 5, 2, '2021-02-13 07:32:12'),
(44, 30, 4, '2021-02-19 09:06:13'),
(50, 40, 2, '2021-03-01 15:32:47'),
(51, 38, 2, '2021-03-01 15:32:57'),
(52, 39, 2, '2021-03-01 15:33:07'),
(53, 41, 2, '2021-03-01 16:12:36'),
(54, 42, 2, '2021-03-01 16:12:43'),
(55, 43, 2, '2021-03-01 16:12:53'),
(56, 44, 2, '2021-03-01 16:14:56'),
(57, 45, 2, '2021-03-01 16:16:59'),
(58, 46, 2, '2021-03-01 16:17:08'),
(59, 47, 2, '2021-03-01 16:17:19'),
(60, 48, 2, '2021-03-02 07:27:51'),
(61, 49, 2, '2021-03-02 07:27:59'),
(62, 50, 2, '2021-03-02 07:28:06'),
(63, 51, 2, '2021-03-17 09:45:35'),
(64, 1, 4, '2021-04-03 05:47:25'),
(65, 41, 4, '2021-04-03 05:47:37'),
(66, 43, 4, '2021-04-03 05:47:54'),
(67, 51, 4, '2021-04-03 05:48:01'),
(72, 48, 4, '2021-04-03 05:49:42'),
(73, 52, 4, '2021-04-06 10:02:09'),
(74, 53, 4, '2021-04-12 05:45:44'),
(75, 54, 4, '2021-04-12 05:45:51'),
(76, 55, 4, '2021-04-12 05:45:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_users`
--

CREATE TABLE `role_users` (
  `role_id` int(11) NOT NULL,
  `role_user_id` int(11) NOT NULL,
  `role_lev_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `role_users`
--

INSERT INTO `role_users` (`role_id`, `role_user_id`, `role_lev_id`, `created_at`) VALUES
(1, 1, 2, '2020-06-18 09:39:26'),
(129, 127, 4, '2021-02-25 06:14:16'),
(144, 142, 6, '2021-02-25 06:36:54'),
(145, 143, 6, '2021-02-25 06:36:54'),
(146, 144, 6, '2021-02-25 06:36:55'),
(147, 145, 6, '2021-02-25 06:36:55'),
(148, 146, 6, '2021-02-25 06:36:55'),
(149, 147, 6, '2021-02-25 06:36:56'),
(150, 148, 6, '2021-02-25 06:36:56'),
(151, 149, 6, '2021-02-25 06:36:57'),
(152, 150, 6, '2021-02-25 06:36:57'),
(153, 151, 6, '2021-02-25 06:36:58'),
(154, 152, 6, '2021-02-25 06:36:58'),
(155, 153, 6, '2021-02-25 06:36:58'),
(156, 154, 6, '2021-02-25 06:36:59'),
(157, 155, 6, '2021-02-25 06:36:59'),
(158, 156, 4, '2021-03-01 07:44:40'),
(159, 157, 4, '2021-03-01 07:44:40'),
(160, 158, 4, '2021-03-01 07:44:40'),
(161, 159, 4, '2021-03-01 07:44:40'),
(162, 160, 4, '2021-03-01 07:44:40'),
(163, 161, 4, '2021-03-01 07:45:17'),
(164, 162, 4, '2021-03-01 07:45:17'),
(165, 163, 4, '2021-03-01 07:45:17'),
(166, 164, 4, '2021-03-01 07:45:17'),
(167, 165, 4, '2021-03-01 07:45:17'),
(168, 166, 4, '2021-03-01 07:46:47'),
(169, 167, 4, '2021-03-01 07:46:47'),
(170, 168, 4, '2021-03-01 07:46:47'),
(171, 169, 4, '2021-03-01 07:46:47'),
(172, 170, 4, '2021-03-01 07:46:47'),
(173, 171, 4, '2021-03-01 07:47:23'),
(174, 172, 4, '2021-03-01 07:47:23'),
(175, 173, 4, '2021-03-01 07:47:23'),
(176, 174, 4, '2021-03-01 07:47:23'),
(177, 175, 4, '2021-03-01 07:47:23'),
(178, 176, 4, '2021-03-01 07:49:07'),
(179, 177, 4, '2021-03-01 07:49:07'),
(180, 178, 4, '2021-03-01 07:49:07'),
(181, 179, 4, '2021-03-01 07:49:07'),
(182, 180, 4, '2021-03-01 07:49:07'),
(183, 181, 4, '2021-03-01 07:50:40'),
(184, 182, 4, '2021-03-01 07:50:40'),
(185, 183, 4, '2021-03-01 07:50:40'),
(186, 184, 4, '2021-03-01 07:50:40'),
(187, 185, 4, '2021-03-01 07:50:40'),
(188, 186, 4, '2021-03-01 07:57:01'),
(189, 187, 4, '2021-03-01 07:57:01'),
(190, 188, 4, '2021-03-01 07:57:01'),
(191, 189, 4, '2021-03-01 07:57:01'),
(192, 190, 4, '2021-03-01 07:57:01'),
(193, 191, 4, '2021-03-01 07:57:16'),
(194, 192, 4, '2021-03-01 07:57:16'),
(195, 193, 4, '2021-03-01 07:57:16'),
(196, 194, 4, '2021-03-01 07:57:16'),
(197, 195, 4, '2021-03-01 07:57:16'),
(198, 196, 4, '2021-03-01 07:57:58'),
(199, 197, 4, '2021-03-01 07:57:58'),
(200, 198, 4, '2021-03-01 07:57:58'),
(201, 199, 4, '2021-03-01 07:57:58'),
(202, 200, 4, '2021-03-01 07:57:58'),
(203, 201, 4, '2021-03-01 07:58:39'),
(204, 202, 4, '2021-03-01 07:58:39'),
(205, 203, 4, '2021-03-01 07:58:39'),
(206, 204, 4, '2021-03-01 07:58:39'),
(207, 205, 4, '2021-03-01 07:58:39'),
(208, 206, 4, '2021-03-01 07:59:01'),
(209, 207, 4, '2021-03-01 07:59:01'),
(210, 208, 4, '2021-03-01 07:59:01'),
(211, 209, 4, '2021-03-01 07:59:01'),
(212, 210, 4, '2021-03-01 07:59:01'),
(213, 211, 4, '2021-03-01 07:59:18'),
(214, 212, 4, '2021-03-01 07:59:18'),
(215, 213, 4, '2021-03-01 07:59:19'),
(216, 214, 4, '2021-03-01 07:59:19'),
(217, 215, 4, '2021-03-01 07:59:19'),
(218, 216, 4, '2021-03-01 07:59:27'),
(219, 217, 4, '2021-03-01 07:59:27'),
(220, 218, 4, '2021-03-01 07:59:27'),
(221, 219, 4, '2021-03-01 07:59:27'),
(222, 220, 4, '2021-03-01 07:59:27'),
(223, 221, 4, '2021-03-01 07:59:42'),
(224, 222, 4, '2021-03-01 07:59:42'),
(225, 223, 4, '2021-03-01 07:59:42'),
(226, 224, 4, '2021-03-01 07:59:42'),
(227, 225, 4, '2021-03-01 07:59:42'),
(228, 226, 4, '2021-03-01 07:59:58'),
(229, 227, 4, '2021-03-01 07:59:58'),
(230, 228, 4, '2021-03-01 07:59:58'),
(231, 229, 4, '2021-03-01 07:59:58'),
(232, 230, 4, '2021-03-01 07:59:59'),
(233, 231, 4, '2021-03-01 08:00:11'),
(234, 232, 4, '2021-03-01 08:00:11'),
(235, 233, 4, '2021-03-01 08:00:12'),
(236, 234, 4, '2021-03-01 08:00:12'),
(237, 235, 4, '2021-03-01 08:00:12'),
(238, 236, 4, '2021-03-01 08:00:13'),
(239, 237, 4, '2021-03-01 08:00:13'),
(240, 238, 4, '2021-03-01 08:00:13'),
(241, 239, 4, '2021-03-01 08:00:13'),
(242, 240, 4, '2021-03-01 08:00:13'),
(243, 241, 4, '2021-03-01 08:00:18'),
(244, 242, 4, '2021-03-01 08:00:19'),
(245, 243, 4, '2021-03-01 08:00:19'),
(246, 244, 4, '2021-03-01 08:00:19'),
(247, 245, 4, '2021-03-01 08:00:19'),
(248, 246, 4, '2021-03-01 08:00:40'),
(249, 247, 4, '2021-03-01 08:00:40'),
(250, 248, 4, '2021-03-01 08:00:40'),
(251, 249, 4, '2021-03-01 08:00:40'),
(252, 250, 4, '2021-03-01 08:00:40'),
(253, 251, 4, '2021-03-01 08:00:51'),
(254, 252, 4, '2021-03-01 08:00:51'),
(255, 253, 4, '2021-03-01 08:00:52'),
(256, 254, 4, '2021-03-01 08:00:52'),
(257, 255, 4, '2021-03-01 08:00:52'),
(258, 256, 4, '2021-03-01 08:00:58'),
(259, 257, 4, '2021-03-01 08:00:58'),
(260, 258, 4, '2021-03-01 08:00:58'),
(261, 259, 4, '2021-03-01 08:00:58'),
(262, 260, 4, '2021-03-01 08:00:58'),
(263, 261, 4, '2021-03-01 08:01:34'),
(264, 262, 4, '2021-03-01 08:01:34'),
(265, 263, 4, '2021-03-01 08:01:34'),
(266, 264, 4, '2021-03-01 08:01:34'),
(267, 265, 4, '2021-03-01 08:01:34'),
(268, 266, 4, '2021-03-01 08:01:51'),
(269, 267, 4, '2021-03-01 08:01:51'),
(270, 268, 4, '2021-03-01 08:01:51'),
(271, 269, 4, '2021-03-01 08:01:52'),
(272, 270, 4, '2021-03-01 08:01:52'),
(273, 271, 4, '2021-03-01 08:02:08'),
(274, 272, 4, '2021-03-01 08:02:08'),
(275, 273, 4, '2021-03-01 08:02:08'),
(276, 274, 4, '2021-03-01 08:02:08'),
(277, 275, 4, '2021-03-01 08:02:08'),
(278, 276, 4, '2021-03-01 08:02:28'),
(279, 277, 4, '2021-03-01 08:02:28'),
(280, 278, 4, '2021-03-01 08:02:28'),
(281, 279, 4, '2021-03-01 08:02:28'),
(282, 280, 4, '2021-03-01 08:02:28'),
(283, 281, 4, '2021-03-01 08:02:45'),
(284, 282, 4, '2021-03-01 08:02:45'),
(285, 283, 4, '2021-03-01 08:02:45'),
(286, 284, 4, '2021-03-01 08:02:46'),
(287, 285, 4, '2021-03-01 08:02:46'),
(288, 286, 4, '2021-03-01 08:02:58'),
(289, 287, 4, '2021-03-01 08:02:58'),
(290, 288, 4, '2021-03-01 08:02:58'),
(291, 289, 4, '2021-03-01 08:02:58'),
(292, 290, 4, '2021-03-01 08:02:58'),
(293, 291, 4, '2021-03-01 08:03:20'),
(294, 292, 4, '2021-03-01 08:03:20'),
(295, 293, 4, '2021-03-01 08:03:20'),
(296, 294, 4, '2021-03-01 08:03:20'),
(297, 295, 4, '2021-03-01 08:03:20'),
(298, 296, 4, '2021-03-01 08:03:35'),
(299, 297, 4, '2021-03-01 08:03:35'),
(300, 298, 4, '2021-03-01 08:03:35'),
(301, 299, 4, '2021-03-01 08:03:35'),
(302, 300, 4, '2021-03-01 08:03:35'),
(303, 301, 4, '2021-03-01 08:03:45'),
(304, 302, 4, '2021-03-01 08:03:46'),
(305, 303, 4, '2021-03-01 08:03:46'),
(306, 304, 4, '2021-03-01 08:03:46'),
(307, 305, 4, '2021-03-01 08:03:46'),
(308, 306, 4, '2021-03-01 08:04:01'),
(309, 307, 4, '2021-03-01 08:04:01'),
(310, 308, 4, '2021-03-01 08:04:02'),
(311, 309, 4, '2021-03-01 08:04:02'),
(312, 310, 4, '2021-03-01 08:04:02'),
(313, 311, 4, '2021-03-01 08:04:13'),
(314, 312, 4, '2021-03-01 08:04:13'),
(315, 313, 4, '2021-03-01 08:04:13'),
(316, 314, 4, '2021-03-01 08:04:13'),
(317, 315, 4, '2021-03-01 08:04:13'),
(318, 316, 4, '2021-03-01 08:07:01'),
(319, 317, 4, '2021-03-01 08:07:01'),
(320, 318, 4, '2021-03-01 08:07:01'),
(321, 319, 4, '2021-03-01 08:07:01'),
(322, 320, 4, '2021-03-01 08:07:01'),
(323, 321, 4, '2021-03-01 08:08:05'),
(324, 322, 4, '2021-03-17 08:55:24'),
(325, 323, 4, '2021-03-17 09:08:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `saldos`
--

CREATE TABLE `saldos` (
  `id` int(11) NOT NULL,
  `id_cabang` int(11) NOT NULL,
  `total_ringgit` float DEFAULT NULL,
  `total_rupiah` float DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `saldos`
--

INSERT INTO `saldos` (`id`, `id_cabang`, `total_ringgit`, `total_rupiah`, `status`, `created_date`, `updated_date`) VALUES
(3, 1, 1100, 250000, 'aktif', '2021-03-30 14:48:03', NULL),
(4, 3, 190, 1475000, 'aktif', '2021-04-11 00:44:36', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `saldo_pemasukans`
--

CREATE TABLE `saldo_pemasukans` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_cabang` int(11) DEFAULT NULL,
  `id_rab` int(11) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `total_ringgit` float DEFAULT NULL,
  `total_rupiah` float DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `saldo_pemasukans`
--

INSERT INTO `saldo_pemasukans` (`id`, `id_user`, `id_cabang`, `id_rab`, `keterangan`, `total_ringgit`, `total_rupiah`, `status`, `created_date`, `updated_date`) VALUES
(4, 1, 3, 0, 'sudah dicairkan', 552, 2757000, 'aktif', '2021-04-11 00:44:36', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `saldo_pengeluarans`
--

CREATE TABLE `saldo_pengeluarans` (
  `id` int(11) NOT NULL,
  `id_cabang` int(11) DEFAULT NULL,
  `id_rab` int(11) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `total_ringgit` float DEFAULT NULL,
  `total_rupiah` float DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `bukti_1` varchar(250) DEFAULT NULL,
  `bukti_2` varchar(250) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tokens`
--

CREATE TABLE `tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `type` varchar(80) NOT NULL,
  `is_revoked` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tokens`
--

INSERT INTO `tokens` (`id`, `user_id`, `token`, `type`, `is_revoked`, `created_at`, `updated_at`) VALUES
(12, 1, 'd7cb1e44-320d-4d8f-804e-2931f0e0e10a', 'jwt_refresh_token', 0, '2021-02-26 15:08:10', '2021-02-26 15:08:10'),
(13, 1, 'ec480a71-cf51-4cbd-94a8-97817a3dcaca', 'jwt_refresh_token', 0, '2021-03-01 09:33:42', '2021-03-01 09:33:42'),
(14, 1, '407e5b32-b451-4fbe-a697-182b7fe05bba', 'jwt_refresh_token', 0, '2021-03-01 10:05:15', '2021-03-01 10:05:15'),
(15, 1, '1d73846e-f930-4e9c-a3e7-1dd2057cac73', 'jwt_refresh_token', 0, '2021-03-01 10:17:01', '2021-03-01 10:17:01'),
(16, 1, '70dc6865-e40c-4ec1-a636-45307318bc01', 'jwt_refresh_token', 0, '2021-03-01 10:18:29', '2021-03-01 10:18:29'),
(17, 1, '30604aa9-2670-4e8e-a0ff-134d1da973ee', 'jwt_refresh_token', 0, '2021-03-01 10:19:19', '2021-03-01 10:19:19'),
(18, 1, '8dfb723e-b87e-44db-9135-ed8869b0d201', 'jwt_refresh_token', 0, '2021-03-01 10:20:13', '2021-03-01 10:20:13'),
(19, 1, '124ad6a3-c4ee-44ff-b945-2c1ffe2a392d', 'jwt_refresh_token', 0, '2021-03-01 10:28:04', '2021-03-01 10:28:04'),
(20, 1, '016c0ade-f64d-4144-83b8-6fe466d02d8b', 'jwt_refresh_token', 0, '2021-03-01 10:29:51', '2021-03-01 10:29:51'),
(21, 1, 'a78dcf6f-6c5b-4ed2-aa18-3e64749a1867', 'jwt_refresh_token', 0, '2021-03-01 10:31:18', '2021-03-01 10:31:18'),
(22, 1, '5d23db86-8bd2-4734-95cb-64e3f3564194', 'jwt_refresh_token', 0, '2021-03-01 10:31:40', '2021-03-01 10:31:40'),
(23, 1, '76511a80-cae2-4649-894f-ce6edca9b3bd', 'jwt_refresh_token', 0, '2021-03-01 10:35:22', '2021-03-01 10:35:22'),
(24, 1, '3b2ada9c-bde5-4b33-9824-9e1ea007fe09', 'jwt_refresh_token', 0, '2021-03-01 10:40:59', '2021-03-01 10:40:59'),
(25, 1, '5a1ce040-8717-42c0-bc00-9cfc1ddf3362', 'jwt_refresh_token', 0, '2021-03-01 10:41:47', '2021-03-01 10:41:47'),
(26, 1, '7b6627f8-29c2-4868-aba9-e05155ac43ea', 'jwt_refresh_token', 0, '2021-03-01 11:02:00', '2021-03-01 11:02:00'),
(27, 1, '940d1c36-25dd-4423-81f4-d33e606eefe2', 'jwt_refresh_token', 0, '2021-03-01 11:02:10', '2021-03-01 11:02:10'),
(28, 1, '935c9623-38f4-47e5-b483-93c259a06a1d', 'jwt_refresh_token', 0, '2021-03-01 11:02:53', '2021-03-01 11:02:53'),
(29, 1, 'acc94877-f466-4139-a935-73ba02826dc7', 'jwt_refresh_token', 0, '2021-03-01 11:03:27', '2021-03-01 11:03:27'),
(30, 1, 'baf8242f-034e-4aa0-81e8-821f64802887', 'jwt_refresh_token', 0, '2021-03-01 11:09:35', '2021-03-01 11:09:35'),
(31, 1, '48bfebee-4a0a-45f1-8346-1b5f5666c8e7', 'jwt_refresh_token', 0, '2021-03-01 11:10:11', '2021-03-01 11:10:11'),
(32, 1, '0e672328-fe1d-4000-83a3-4017729e34b0', 'jwt_refresh_token', 0, '2021-03-01 11:10:51', '2021-03-01 11:10:51'),
(33, 1, '7a9a29a8-0b7a-440b-9a2f-056ef6ebeef4', 'jwt_refresh_token', 0, '2021-03-01 11:11:02', '2021-03-01 11:11:02'),
(34, 1, '81c0c9d4-928c-42e5-b8e6-1d11b205e34b', 'jwt_refresh_token', 0, '2021-03-01 11:11:10', '2021-03-01 11:11:10'),
(35, 1, '011a4b2a-0c21-4bec-b5be-0e2a341dddce', 'jwt_refresh_token', 0, '2021-03-01 11:11:20', '2021-03-01 11:11:20'),
(36, 1, 'd43a113a-3f15-43e8-b282-2c864ab8b10e', 'jwt_refresh_token', 0, '2021-03-01 11:11:32', '2021-03-01 11:11:32'),
(37, 1, '83cec51c-f8f9-464e-80bc-92ee0f6286dd', 'jwt_refresh_token', 0, '2021-03-01 11:15:58', '2021-03-01 11:15:58'),
(38, 1, 'ad992bc4-e2c1-4d6d-918c-f5e418c07555', 'jwt_refresh_token', 0, '2021-03-01 11:16:16', '2021-03-01 11:16:16'),
(39, 1, '8c3e0e81-d35f-4c67-b0ed-f84aa738cac8', 'jwt_refresh_token', 0, '2021-03-01 11:19:15', '2021-03-01 11:19:15'),
(40, 1, '065ed505-8931-4c6d-adc7-2f68e7f067f6', 'jwt_refresh_token', 0, '2021-03-01 11:21:40', '2021-03-01 11:21:40'),
(41, 1, '4b5dd29f-9776-473c-a534-d56d9d3e478a', 'jwt_refresh_token', 0, '2021-03-01 11:22:13', '2021-03-01 11:22:13'),
(42, 1, 'b446ab16-53d0-4f3f-b620-c5ff8a3502a3', 'jwt_refresh_token', 0, '2021-03-01 11:25:17', '2021-03-01 11:25:17'),
(43, 1, 'ecb2875d-de15-4b5d-bda6-854dbd879012', 'jwt_refresh_token', 0, '2021-03-01 11:28:01', '2021-03-01 11:28:01'),
(44, 1, 'a9e5f528-2e42-410e-a375-4420327f5391', 'jwt_refresh_token', 0, '2021-03-01 11:28:10', '2021-03-01 11:28:10'),
(45, 1, 'c8782fe9-f158-433b-a6a5-fdbc72b2aa94', 'jwt_refresh_token', 0, '2021-03-01 11:28:48', '2021-03-01 11:28:48'),
(46, 1, '1548491b-b1b1-45e4-a9bb-43c10feb985a', 'jwt_refresh_token', 0, '2021-03-01 11:30:25', '2021-03-01 11:30:25'),
(47, 1, 'c56756aa-045d-4848-aec3-54319997dd68', 'jwt_refresh_token', 0, '2021-03-01 12:04:22', '2021-03-01 12:04:22'),
(48, 1, 'cf7c9e7b-d5b1-4ff6-a98d-15be4bf819f1', 'jwt_refresh_token', 0, '2021-03-01 12:10:21', '2021-03-01 12:10:21'),
(49, 1, '68805751-0faa-413d-adba-448669f66d3c', 'jwt_refresh_token', 0, '2021-03-01 12:11:16', '2021-03-01 12:11:16'),
(50, 1, '3162ca55-01fb-441a-8881-3b3ec5eec7d7', 'jwt_refresh_token', 0, '2021-03-01 12:11:41', '2021-03-01 12:11:41'),
(51, 1, 'dbee0c11-c999-4440-bef6-30d3ae5df619', 'jwt_refresh_token', 0, '2021-03-01 12:14:44', '2021-03-01 12:14:44'),
(52, 1, 'e2470a38-09ec-41cf-8c02-a2d0eaf23e55', 'jwt_refresh_token', 0, '2021-03-01 12:15:02', '2021-03-01 12:15:02'),
(53, 1, '3c0a3ebc-ef23-4db5-8ef5-2c15b421ba76', 'jwt_refresh_token', 0, '2021-03-01 12:15:24', '2021-03-01 12:15:24'),
(54, 1, '8e0981c5-8246-4c56-9c48-5fe15c9bf1e3', 'jwt_refresh_token', 0, '2021-03-01 12:16:56', '2021-03-01 12:16:56'),
(55, 1, 'b40bb182-c37e-4506-99c1-e80eaaf6583e', 'jwt_refresh_token', 0, '2021-03-01 12:17:17', '2021-03-01 12:17:17'),
(56, 1, 'd5dc768a-2362-4371-bfe7-1bc501a56fd6', 'jwt_refresh_token', 0, '2021-03-01 12:17:39', '2021-03-01 12:17:39'),
(57, 1, '2aeb9a18-f732-48cf-b51a-749ce4f9ef7c', 'jwt_refresh_token', 0, '2021-03-01 14:09:44', '2021-03-01 14:09:44'),
(58, 1, 'f90c2aa3-bcd3-454c-8142-4f041188790d', 'jwt_refresh_token', 0, '2021-03-01 14:09:47', '2021-03-01 14:09:47'),
(59, 1, 'a95d9e3a-5850-41e1-aa83-47c784c04b46', 'jwt_refresh_token', 0, '2021-03-01 14:12:19', '2021-03-01 14:12:19'),
(60, 1, 'b413cd8f-46a3-4622-aa7b-57fd4ed897e1', 'jwt_refresh_token', 0, '2021-03-01 14:12:36', '2021-03-01 14:12:36'),
(61, 1, '76eba7a6-6580-40c5-b84a-7ade0c05b012', 'jwt_refresh_token', 0, '2021-03-01 14:12:58', '2021-03-01 14:12:58'),
(62, 1, '0b7f467e-2291-4647-8cfe-ebdad6de492a', 'jwt_refresh_token', 0, '2021-03-01 14:14:47', '2021-03-01 14:14:47'),
(63, 1, '41e97c3b-8906-45a0-8ec1-845398f5bf44', 'jwt_refresh_token', 0, '2021-03-01 14:14:54', '2021-03-01 14:14:54'),
(64, 1, '4d5d8ad5-519d-4de5-9e81-3761144e536f', 'jwt_refresh_token', 0, '2021-03-01 14:16:31', '2021-03-01 14:16:31'),
(65, 1, '9eee5b77-dffd-41aa-a18c-398e4bae6a56', 'jwt_refresh_token', 0, '2021-03-01 14:17:09', '2021-03-01 14:17:09'),
(66, 1, '806ea255-a282-460f-b8e6-58847fc1a72b', 'jwt_refresh_token', 0, '2021-03-01 14:18:37', '2021-03-01 14:18:37'),
(67, 1, '154a9c77-b131-4e38-9c04-d5ea4541159b', 'jwt_refresh_token', 0, '2021-03-01 14:18:52', '2021-03-01 14:18:52'),
(68, 1, 'f24665a8-b07f-4209-849f-e871208d3987', 'jwt_refresh_token', 0, '2021-03-01 14:18:54', '2021-03-01 14:18:54'),
(69, 1, 'c9814638-a31b-40b5-98c4-6030163a3f35', 'jwt_refresh_token', 0, '2021-03-01 14:19:42', '2021-03-01 14:19:42'),
(70, 1, 'caec5f28-d826-4236-a8cb-30d817225d40', 'jwt_refresh_token', 0, '2021-03-01 14:19:53', '2021-03-01 14:19:53'),
(71, 1, '663961a0-2b73-4a10-9b84-9d6ec4f0af58', 'jwt_refresh_token', 0, '2021-03-01 14:23:14', '2021-03-01 14:23:14'),
(72, 1, '5ceb027f-9bfc-438a-a57c-00fa9933c386', 'jwt_refresh_token', 0, '2021-03-01 14:23:53', '2021-03-01 14:23:53'),
(73, 1, 'b11e4ac2-1acd-4222-8e73-e65bb9ce0474', 'jwt_refresh_token', 0, '2021-03-01 14:24:10', '2021-03-01 14:24:10'),
(74, 1, 'dbe2eb49-054a-4f77-8a46-067fcdc97b0a', 'jwt_refresh_token', 0, '2021-03-01 14:24:37', '2021-03-01 14:24:37'),
(75, 1, '4fdb4c4d-6ab8-4675-88a4-b31c1c461cb5', 'jwt_refresh_token', 0, '2021-03-01 14:53:15', '2021-03-01 14:53:15'),
(76, 1, '37a68a34-8f63-40ad-97b7-a19ab67464a5', 'jwt_refresh_token', 0, '2021-03-01 14:58:13', '2021-03-01 14:58:13'),
(77, 1, '4de73978-c5ca-4886-80e4-1d807e94523e', 'jwt_refresh_token', 0, '2021-03-01 15:30:17', '2021-03-01 15:30:17'),
(78, 1, '0f8e5f22-fd11-469e-9a54-374f675ae770', 'jwt_refresh_token', 0, '2021-03-01 15:49:39', '2021-03-01 15:49:39'),
(79, 1, 'a756f609-dd5b-4658-afd5-2a387ecf5597', 'jwt_refresh_token', 0, '2021-03-01 15:52:00', '2021-03-01 15:52:00'),
(80, 1, 'c8476f0a-d959-4435-9d3d-ebaeff1b1472', 'jwt_refresh_token', 0, '2021-03-01 15:52:00', '2021-03-01 15:52:00'),
(81, 1, '6630cdef-b9a3-46c8-8b72-e77a9d22c3a8', 'jwt_refresh_token', 0, '2021-03-01 15:54:20', '2021-03-01 15:54:20'),
(82, 1, '9aedc84c-f487-4815-be88-0fdc3efffbc2', 'jwt_refresh_token', 0, '2021-03-01 15:54:48', '2021-03-01 15:54:48'),
(83, 1, '6e07e35e-647b-443d-92d3-7c3d726139bc', 'jwt_refresh_token', 0, '2021-03-01 15:55:03', '2021-03-01 15:55:03'),
(84, 1, '8c5bc2cf-4868-4489-aff8-d70ddf510115', 'jwt_refresh_token', 0, '2021-03-01 15:55:17', '2021-03-01 15:55:17'),
(85, 1, '5b4e3a05-2a69-4478-8a43-4b1746e97eed', 'jwt_refresh_token', 0, '2021-03-01 15:55:37', '2021-03-01 15:55:37'),
(86, 1, '2398741d-40aa-4d90-94cc-a3fb00d2dd47', 'jwt_refresh_token', 0, '2021-03-01 15:55:37', '2021-03-01 15:55:37'),
(87, 1, '634c9247-b025-4744-97e3-0da206120d23', 'jwt_refresh_token', 0, '2021-03-01 15:58:46', '2021-03-01 15:58:46'),
(88, 1, 'fab2822d-5945-4e01-b92c-127e097ba00d', 'jwt_refresh_token', 0, '2021-03-01 16:06:23', '2021-03-01 16:06:23'),
(89, 1, '54af9cf5-ebaf-4940-84b9-8a29c510979a', 'jwt_refresh_token', 0, '2021-03-01 16:06:56', '2021-03-01 16:06:56'),
(90, 1, 'c6052d3e-80bc-414f-8733-a43aa093c2ec', 'jwt_refresh_token', 0, '2021-03-01 16:06:56', '2021-03-01 16:06:56'),
(91, 1, 'd7b0c8b6-c08f-41e8-8e04-461e3d639971', 'jwt_refresh_token', 0, '2021-03-01 16:07:11', '2021-03-01 16:07:11'),
(92, 1, '100c7a24-2625-4327-9593-82204e13f8ef', 'jwt_refresh_token', 0, '2021-03-01 16:07:12', '2021-03-01 16:07:12'),
(93, 1, '3cd56a32-b142-4d8b-b0de-3264138ec393', 'jwt_refresh_token', 0, '2021-03-01 16:08:04', '2021-03-01 16:08:04'),
(94, 1, '5225f208-6ef7-4f46-a0c8-df11146dfec5', 'jwt_refresh_token', 0, '2021-03-01 16:08:23', '2021-03-01 16:08:23'),
(95, 1, '4187b016-2502-4782-ba4b-ea1e8ff1cfbd', 'jwt_refresh_token', 0, '2021-03-01 16:08:23', '2021-03-01 16:08:23'),
(96, 1, 'bd51be54-ec38-453f-a7b8-b671aa6ca3d2', 'jwt_refresh_token', 0, '2021-03-01 16:29:01', '2021-03-01 16:29:01'),
(97, 1, '7ce872aa-b0e1-43a0-b3cc-3d2c48274bf6', 'jwt_refresh_token', 0, '2021-03-01 16:30:04', '2021-03-01 16:30:04'),
(98, 1, 'a506b058-c562-4fcb-b6f6-a8443e392214', 'jwt_refresh_token', 0, '2021-03-01 16:30:24', '2021-03-01 16:30:24'),
(99, 1, '1c145e5c-2893-4ecc-bed2-7b1968d228b8', 'jwt_refresh_token', 0, '2021-03-01 16:30:24', '2021-03-01 16:30:24'),
(100, 1, '9ff5894d-8f2f-496f-a72a-db9473d7d62e', 'jwt_refresh_token', 0, '2021-03-01 16:30:41', '2021-03-01 16:30:41'),
(101, 1, 'c91fcdb9-1a2c-4a31-a95b-96917672923f', 'jwt_refresh_token', 0, '2021-03-01 16:30:45', '2021-03-01 16:30:45'),
(102, 1, '47c2c7db-2dce-46be-aa7e-6f9241b186f3', 'jwt_refresh_token', 0, '2021-03-01 16:30:47', '2021-03-01 16:30:47'),
(103, 1, 'c5274354-551b-47ef-ab6a-2cd83740fd9e', 'jwt_refresh_token', 0, '2021-03-01 16:31:44', '2021-03-01 16:31:44'),
(104, 1, '4c8dc5a8-e031-49f3-a24d-c32b0e70a9a2', 'jwt_refresh_token', 0, '2021-03-01 16:32:38', '2021-03-01 16:32:38'),
(105, 1, 'd3e3935c-3b23-4cc2-95c2-e82dfce8c044', 'jwt_refresh_token', 0, '2021-03-01 16:32:38', '2021-03-01 16:32:38'),
(106, 1, 'b99f25a4-d99c-4b87-9cb8-3eaeb55a93b7', 'jwt_refresh_token', 0, '2021-03-01 16:32:42', '2021-03-01 16:32:42'),
(107, 1, 'b2d8afa4-b17e-4dd0-bc4e-2951993388b4', 'jwt_refresh_token', 0, '2021-03-01 16:33:57', '2021-03-01 16:33:57'),
(108, 1, '536a0d9d-c3f2-4ca3-91e4-a2c4cba17f02', 'jwt_refresh_token', 0, '2021-03-01 16:34:00', '2021-03-01 16:34:00'),
(109, 1, '513dd6ad-def9-47b1-a8d2-e62ae31190e3', 'jwt_refresh_token', 0, '2021-03-01 16:34:24', '2021-03-01 16:34:24'),
(110, 1, 'a579519b-0b18-4bbe-80cd-67068cd78198', 'jwt_refresh_token', 0, '2021-03-01 16:35:09', '2021-03-01 16:35:09'),
(111, 1, '6efe270c-fa90-4a57-84de-9992e5d5f7ab', 'jwt_refresh_token', 0, '2021-03-01 16:35:10', '2021-03-01 16:35:10'),
(112, 1, '9e94b455-cb30-45a8-949a-0026d71b6f92', 'jwt_refresh_token', 0, '2021-03-01 16:35:18', '2021-03-01 16:35:18'),
(113, 1, 'eeaa2b36-023a-4c2c-a43a-806d7c729209', 'jwt_refresh_token', 0, '2021-03-01 16:35:18', '2021-03-01 16:35:18'),
(114, 1, '21ce3b21-617f-425f-a5f8-8b85039bde97', 'jwt_refresh_token', 0, '2021-03-01 17:08:13', '2021-03-01 17:08:13'),
(115, 1, '3d10992c-31df-46e4-8796-e133369bb6b5', 'jwt_refresh_token', 0, '2021-03-01 17:22:31', '2021-03-01 17:22:31'),
(116, 1, 'e125dfab-c322-435b-a85a-868635ecbfb1', 'jwt_refresh_token', 0, '2021-03-01 17:23:28', '2021-03-01 17:23:28'),
(117, 1, 'bde38d5b-0164-4d27-ad4a-6de2bcff76a5', 'jwt_refresh_token', 0, '2021-03-01 17:23:56', '2021-03-01 17:23:56'),
(118, 1, 'fed3704e-72f6-46e9-94e9-3779b4e7880d', 'jwt_refresh_token', 0, '2021-03-01 17:23:57', '2021-03-01 17:23:57'),
(119, 1, '235bb98b-da68-48f1-ba4a-fb3389199a8a', 'jwt_refresh_token', 0, '2021-03-01 17:24:00', '2021-03-01 17:24:00'),
(120, 1, 'feb557b5-574b-45e8-99bd-014d5616305b', 'jwt_refresh_token', 0, '2021-03-01 17:24:13', '2021-03-01 17:24:13'),
(121, 1, 'a5312633-89a8-44bc-9242-9529fc5fb82f', 'jwt_refresh_token', 0, '2021-03-01 17:24:14', '2021-03-01 17:24:14'),
(122, 1, 'a60d20ea-b0e3-4e5a-9c43-12d2e36a9114', 'jwt_refresh_token', 0, '2021-03-01 17:24:51', '2021-03-01 17:24:51'),
(123, 1, '0394234f-2398-4a78-89e2-e53be3adc18c', 'jwt_refresh_token', 0, '2021-03-01 17:27:21', '2021-03-01 17:27:21'),
(124, 1, '2d20dc00-6268-4def-8fb3-c7fa393105b5', 'jwt_refresh_token', 0, '2021-03-02 14:04:56', '2021-03-02 14:04:56'),
(125, 1, 'f5b99a3e-550a-4613-892f-37fbdf2a18ba', 'jwt_refresh_token', 0, '2021-03-02 14:04:56', '2021-03-02 14:04:56'),
(126, 1, '3947e661-7b4b-42da-9d92-4c48c5b1133e', 'jwt_refresh_token', 0, '2021-03-02 14:05:04', '2021-03-02 14:05:04'),
(127, 1, 'cb2fda97-061f-48b6-b8fd-f33e1c4c099e', 'jwt_refresh_token', 0, '2021-03-02 15:32:34', '2021-03-02 15:32:34'),
(128, 1, '3902e172-b13d-4e64-81d1-4a2fb54fd5a8', 'jwt_refresh_token', 0, '2021-03-03 11:28:25', '2021-03-03 11:28:25'),
(129, 1, '99a02429-6e9a-4af8-b265-687258d7c050', 'jwt_refresh_token', 0, '2021-03-03 11:28:28', '2021-03-03 11:28:28'),
(130, 1, '60beeede-5799-49a4-93d4-823c7976c52d', 'jwt_refresh_token', 0, '2021-03-03 11:31:00', '2021-03-03 11:31:00'),
(131, 1, '496bc0c9-9e23-4dd0-9e32-1c3e0f59d51e', 'jwt_refresh_token', 0, '2021-03-03 11:31:11', '2021-03-03 11:31:11'),
(132, 1, '65b6a051-3d9f-4477-80fc-d5055e21c635', 'jwt_refresh_token', 0, '2021-03-03 11:31:18', '2021-03-03 11:31:18'),
(133, 1, '6449bc75-fc30-4e41-9f24-151ecdaa1e58', 'jwt_refresh_token', 0, '2021-03-03 11:31:49', '2021-03-03 11:31:49'),
(134, 1, '61e7d5a3-8161-454a-892f-6824f122dbc3', 'jwt_refresh_token', 0, '2021-03-03 11:32:12', '2021-03-03 11:32:12'),
(135, 1, '56fad02a-bbac-497b-816b-317e7921d5f4', 'jwt_refresh_token', 0, '2021-03-03 11:32:52', '2021-03-03 11:32:52'),
(136, 1, '046cf9fb-9a71-45c4-b3b2-ef7d8c938eee', 'jwt_refresh_token', 0, '2021-03-03 11:33:30', '2021-03-03 11:33:30'),
(137, 1, '1e22517d-59e2-4d33-89a4-b7a2d194ef1f', 'jwt_refresh_token', 0, '2021-03-03 11:33:31', '2021-03-03 11:33:31'),
(138, 1, '4e1d4712-3d17-4ceb-a4be-9ba7939fb262', 'jwt_refresh_token', 0, '2021-03-03 11:34:01', '2021-03-03 11:34:01'),
(139, 1, '6dc61e3e-6c78-40e6-84ee-4b3e8989f93d', 'jwt_refresh_token', 0, '2021-03-03 11:34:01', '2021-03-03 11:34:01'),
(140, 1, '11e5587d-c7b0-4bb8-a152-996ad160a707', 'jwt_refresh_token', 0, '2021-03-03 11:52:05', '2021-03-03 11:52:05'),
(141, 2, '08d0c82d-dfa6-457b-9c9f-2b177e568899', 'jwt_refresh_token', 0, '2021-03-03 11:54:01', '2021-03-03 11:54:01'),
(142, 2, '97bebdf7-315f-407e-9e54-f16cbf058e22', 'jwt_refresh_token', 0, '2021-03-03 11:54:13', '2021-03-03 11:54:13'),
(143, 1, 'eb7388db-31b2-4399-9051-a0e713a7c953', 'jwt_refresh_token', 0, '2021-03-03 11:55:44', '2021-03-03 11:55:44'),
(144, 2, 'bc8d912c-c9bf-4c94-b73f-79a58aed8354', 'jwt_refresh_token', 0, '2021-03-03 13:44:55', '2021-03-03 13:44:55'),
(145, 1, '729925da-28bd-4270-911a-f594b47d3f12', 'jwt_refresh_token', 0, '2021-03-04 08:21:44', '2021-03-04 08:21:44'),
(146, 1, '2e685a0e-df19-48d3-84fd-49b7175c2c74', 'jwt_refresh_token', 0, '2021-03-04 08:22:09', '2021-03-04 08:22:09'),
(147, 1, '79c3cdeb-0e37-4b46-89dc-9dc1175bbc52', 'jwt_refresh_token', 0, '2021-03-04 08:24:42', '2021-03-04 08:24:42'),
(148, 1, '39975dcc-dcce-4577-8bae-f5be0bfe22aa', 'jwt_refresh_token', 0, '2021-03-04 08:25:26', '2021-03-04 08:25:26'),
(149, 1, 'acbb1063-9a1e-4be6-8db8-2b54c71a0fe8', 'jwt_refresh_token', 0, '2021-03-04 08:26:33', '2021-03-04 08:26:33'),
(150, 1, '7db380c5-c678-4c89-af63-ad0712d85204', 'jwt_refresh_token', 0, '2021-03-04 08:27:31', '2021-03-04 08:27:31'),
(151, 1, '6d65bb7c-6d5d-4181-a346-e3bc83ad20ab', 'jwt_refresh_token', 0, '2021-03-04 08:29:36', '2021-03-04 08:29:36'),
(152, 1, '2f7ee42f-fdd2-4052-9ac1-5c400263dad3', 'jwt_refresh_token', 0, '2021-03-04 09:11:41', '2021-03-04 09:11:41'),
(153, 1, '0a7d720c-1485-4b35-b7a6-32e9060c5a8d', 'jwt_refresh_token', 0, '2021-03-04 09:13:37', '2021-03-04 09:13:37'),
(154, 1, 'd8e83b1f-2376-4dca-bdd1-1b775b7f95a2', 'jwt_refresh_token', 0, '2021-03-04 09:17:54', '2021-03-04 09:17:54'),
(155, 1, '19b0550e-a2c5-4153-a54b-4b2ecc000ad8', 'jwt_refresh_token', 0, '2021-03-04 09:18:13', '2021-03-04 09:18:13'),
(156, 1, '5a93117a-ac3c-4174-ac01-87199a8ea821', 'jwt_refresh_token', 0, '2021-03-04 09:18:17', '2021-03-04 09:18:17'),
(157, 1, '3778b097-a58f-4931-81da-06d0e0bdbada', 'jwt_refresh_token', 0, '2021-03-04 09:21:41', '2021-03-04 09:21:41'),
(158, 1, 'a28fd419-d5bf-46cd-aa63-ee0e301fccb6', 'jwt_refresh_token', 0, '2021-03-04 09:23:45', '2021-03-04 09:23:45'),
(159, 1, '5a687fd9-4a97-4df6-800b-b3fb467ffe45', 'jwt_refresh_token', 0, '2021-03-04 10:16:06', '2021-03-04 10:16:06'),
(160, 2, '943076c5-57cd-4832-b0b3-c947c43dfa11', 'jwt_refresh_token', 0, '2021-03-04 10:29:08', '2021-03-04 10:29:08'),
(161, 1, '096edc19-0492-4014-a105-d6e9974d38f0', 'jwt_refresh_token', 0, '2021-03-04 10:29:58', '2021-03-04 10:29:58'),
(162, 1, '5702c2cf-a7d3-4078-989e-3b7d84065db9', 'jwt_refresh_token', 0, '2021-04-01 09:15:15', '2021-04-01 09:15:15'),
(163, 1, '60734559-e694-455c-a5f3-fefa0ddd4b55', 'jwt_refresh_token', 0, '2021-04-01 09:46:24', '2021-04-01 09:46:24'),
(164, 1, 'd3280c53-edd0-468d-84a8-e2483a671ad9', 'jwt_refresh_token', 0, '2021-04-01 14:17:43', '2021-04-01 14:17:43'),
(165, 1, 'a9ccc9e7-786d-41bc-8994-d0023a6735ca', 'jwt_refresh_token', 0, '2021-04-03 01:55:47', '2021-04-03 01:55:47'),
(166, 1, 'd119364f-04dd-486b-949c-558354f58041', 'jwt_refresh_token', 0, '2021-04-03 01:58:13', '2021-04-03 01:58:13'),
(167, 323, 'e179df7d-63e3-4746-b328-d8ffa253108c', 'jwt_refresh_token', 0, '2021-04-03 01:58:43', '2021-04-03 01:58:43'),
(168, 323, 'f22d0679-105e-4843-9bae-df99991ece67', 'jwt_refresh_token', 0, '2021-04-03 10:59:54', '2021-04-03 10:59:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_nama` varchar(50) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  `user_status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `user_nama`, `user_password`, `user_email`, `user_phone`, `user_status`, `created_at`, `updated_at`) VALUES
(1, 'SDN Bojong Kaler', '$2y$10$Cc0oP0niuB.JnHPlHTQlievu3wFOV.Ufm5V8P39VxTMAd/gTWHlSq', 'administrator@gmail.com', '08123123', 'Aktif', '2020-06-18 09:39:08', '0000-00-00 00:00:00'),
(127, 'SMPN 2 Ngamparh', '44kBZjsZjWGw4./tAKtMaePABAnKnaRAe4bGeUjdBnjy6ypVASPAG', 'smp2@gmail.com', '', '', '2021-02-25 06:14:15', '0000-00-00 00:00:00'),
(142, 'TEST 12', 'a1oM48aNxElTC0xqhR7CBOpj995IKNXfHVsvRyw1NREugPTsHbgKG', '10120001@gmail.com', '', '', '2021-02-25 06:36:54', '0000-00-00 00:00:00'),
(143, 'TEST 13', 'ekeG/E0aS0soaIbLe4n6I.3dzh7ngiue7MXS8jkUnnhC3cAdX8hSm', '10120002@gmail.com', '', '', '2021-02-25 06:36:54', '0000-00-00 00:00:00'),
(144, 'TEST 14', 'TXPrR.oVkuteXOgEuhlROOqzSMHPibCsUMvqNpQP7B8uRttTkOjCe', '10120003@gmail.com', '', '', '2021-02-25 06:36:55', '0000-00-00 00:00:00'),
(145, 'TEST 15', 'nt7O8ttRlnTOLfJACoCoAuSQbYLj4w7itoUDIy0Qm3FsVqAg1eioO', '10120004@gmail.com', '', '', '2021-02-25 06:36:55', '0000-00-00 00:00:00'),
(146, 'TEST 16', 'oAjYedgoDr09p/OecmFGHubSfADVkEmRnVE74XXOL10MskK0zxrPO', '10120005@gmail.com', '', '', '2021-02-25 06:36:55', '0000-00-00 00:00:00'),
(147, 'TEST 17', 'anHQ9amEdD8CxGIykv1beO2CRzvL58Cv0TmwVxz0t.6frHklLEnuy', '10120006@gmail.com', '', '', '2021-02-25 06:36:56', '0000-00-00 00:00:00'),
(148, 'TEST 18', 'lFVlzlJSXaCjvZIq4rsIFePpMXrhlL/G0bPRj5covAtwxKD8OZ8Je', '10120007@gmail.com', '', '', '2021-02-25 06:36:56', '0000-00-00 00:00:00'),
(149, 'TEST 19', '0/De1PHeNgQejAdt327CtO56URD6AMqgia7O7OI/sF.qnQl0MfKf.', '10120008@gmail.com', '', '', '2021-02-25 06:36:56', '0000-00-00 00:00:00'),
(150, 'TEST 20', 'WCfK4jeYbOkj3JA3TOqoaexpFDrCeiw.9nhMaRR4PXVlUqHGVjUoC', '10120009@gmail.com', '', '', '2021-02-25 06:36:57', '0000-00-00 00:00:00'),
(151, 'TEST 21', '8hcpFBOCT2CvwjAtReTJre2r6I/7/uWVpSPNt72xJSF1ErNr0NMfa', '10120010@gmail.com', '', '', '2021-02-25 06:36:57', '0000-00-00 00:00:00'),
(152, 'TEST 22', 'I9dj.psq7uYWOfAUn/W5t.cbrg1kqiGEPdOC823lMyy2LB3uyNGWS', '10120011@gmail.com', '', '', '2021-02-25 06:36:58', '0000-00-00 00:00:00'),
(153, 'TEST 23', 'EqPn.tJ8jwucIp6uUTPDx.D3QOsLdYc8pXfIIFQO.4MkzHg6wr3a6', '10120012@gmail.com', '', '', '2021-02-25 06:36:58', '0000-00-00 00:00:00'),
(154, 'TEST 24', 'ghQRkROdcNeV2Lt1WAxlIO3Un.zQhfO2AY3F3KQPAaGZtI8wYcyqW', '10120013@gmail.com', '', '', '2021-02-25 06:36:58', '0000-00-00 00:00:00'),
(155, 'TEST 25', 'mUjmjDEoJEDpn7dS37D8sudXt6FG8teXhQET2xxDzi90s7QUdd9i.', '10120014@gmail.com', '', '', '2021-02-25 06:36:59', '0000-00-00 00:00:00'),
(156, 'SDN Cibeureum 03', 'JDhWXXUoroG6/W4oLf6obOUSAjGbpjkmWJrNIRc/x4O7HrQ0pPSFu', 'sdn1@gmail.com', '', '', '2021-03-01 07:44:40', '0000-00-00 00:00:00'),
(157, 'SDN Cibeureum 01', 'ncr40Nz/qsW/6TW2gS7amOLkYUu0brJL3VrkcZXJWerCZlgZdk9CW', 'sdn2@gmail.com', '', '', '2021-03-01 07:44:40', '0000-00-00 00:00:00'),
(158, 'SDN Cibeureum 11', 'ODApiCw30nnfbGJ4tNBcl.X79Rb9AOfX2BhuiToldvnZmnlRoBNCS', 'sdn3@gmail.com', '', '', '2021-03-01 07:44:40', '0000-00-00 00:00:00'),
(159, 'SDN Advent 1', 'Zj0.lJB02WEaRHzoC9LoPewtcjaWs4tV8DiN5KqmxKPzTBNPkxeYu', 'sdn4@gmail.com', '', '', '2021-03-01 07:44:40', '0000-00-00 00:00:00'),
(160, 'SDN Bandung Juara', 'rIAFrbg.uigqX4adwF11neyiARGtahcM9KIL6rKWYs4h0Q/ldzS4q', 'sdn5@gmail.com', '', '', '2021-03-01 07:44:40', '0000-00-00 00:00:00'),
(161, 'SDN Cibeureum 03', 'L1LQkeOc0lnZVIxYCsiB7.QuAKcfhQ6.qzdN5qryMoH...HeNkKbe', 'sdn1@gmail.com', '', '', '2021-03-01 07:45:17', '0000-00-00 00:00:00'),
(162, 'SDN Cibeureum 01', 'dmt2/K03uWuWYDS1EBMj/OjHOTgZbiBSKHdQbe0CKJl6BiAPuwqVG', 'sdn2@gmail.com', '', '', '2021-03-01 07:45:17', '0000-00-00 00:00:00'),
(163, 'SDN Cibeureum 11', 'ObN.sh3b7eeMCrEISNpWiutm/FbDho6Nn0U3UZZHPu462Ag/Ii06K', 'sdn3@gmail.com', '', '', '2021-03-01 07:45:17', '0000-00-00 00:00:00'),
(164, 'SDN Advent 1', 'twjXQ2Qwm/PCVN65Jo.F8.UyyIzBDpZZtcpitbeWhFp.J7fF3QVMK', 'sdn4@gmail.com', '', '', '2021-03-01 07:45:17', '0000-00-00 00:00:00'),
(165, 'SDN Bandung Juara', 'hGP0wNbBMkuxzuprKC7OE.00qt90GkNoU4xONWSo5y85NXB8bWcsa', 'sdn5@gmail.com', '', '', '2021-03-01 07:45:17', '0000-00-00 00:00:00'),
(166, 'SDN Cibeureum 03', 'qu5qg9mpaipbJioz8ILovO6SmHQ2KgHwTxQC.gBPS8DA.pDSQfxeq', 'sdn1@gmail.com', '', '', '2021-03-01 07:46:47', '0000-00-00 00:00:00'),
(167, 'SDN Cibeureum 01', 'I9p4ESIj/VWSuWU/he.qQO59TJ7/GC8DiRrzwJeMQSvswB.e.RJxW', 'sdn2@gmail.com', '', '', '2021-03-01 07:46:47', '0000-00-00 00:00:00'),
(168, 'SDN Cibeureum 11', 'tZFHBwFZvOU1iu7I/JV2z.h2gFwlMuuv0jADnZVP8AZIxqG125wzy', 'sdn3@gmail.com', '', '', '2021-03-01 07:46:47', '0000-00-00 00:00:00'),
(169, 'SDN Advent 1', 'EYNUbG3rM4ujV1DWP7PcquFmUhH.3jOdLlKs9S866fhCoVyjCjdsC', 'sdn4@gmail.com', '', '', '2021-03-01 07:46:47', '0000-00-00 00:00:00'),
(170, 'SDN Bandung Juara', 'Qp6xUNf5hp4kdi.4HBx/Bu5/8QrpT0Zcjq9CHLU.cTlwxnfJzWvAS', 'sdn5@gmail.com', '', '', '2021-03-01 07:46:47', '0000-00-00 00:00:00'),
(171, 'SDN Cibeureum 03', 'in.qxXGlnke8ijEn8Rj.MuOcotynI9RlLObH6rCQUElrreNQ4b6j2', 'sdn1@gmail.com', '', '', '2021-03-01 07:47:23', '0000-00-00 00:00:00'),
(172, 'SDN Cibeureum 01', 'rV9IGO5S79sN7u.wBzKYx.Hj/Z78fdKgNxuFVt/hecapQv7JRqW.S', 'sdn2@gmail.com', '', '', '2021-03-01 07:47:23', '0000-00-00 00:00:00'),
(173, 'SDN Cibeureum 11', 'JnbeXtV2rwwO99b1EuvUcuxBPpMzIkl12s5OLdJNd4EofNQejyUN2', 'sdn3@gmail.com', '', '', '2021-03-01 07:47:23', '0000-00-00 00:00:00'),
(174, 'SDN Advent 1', 'DWSkeZIlpzV3AyjjjDcyteDlPkkSzGGr/g9LAC1gEY7cDOCwGAtGG', 'sdn4@gmail.com', '', '', '2021-03-01 07:47:23', '0000-00-00 00:00:00'),
(175, 'SDN Bandung Juara', 'TccBZSuaI4lB.dTaygVt7u804p/Rc/iV5juln1w8Oz4VmbgAuR7kq', 'sdn5@gmail.com', '', '', '2021-03-01 07:47:23', '0000-00-00 00:00:00'),
(176, 'SDN Cibeureum 03', 'KDAVC5UvUY3s8OItFJDU0u7tlSkc/i70EsQDlFLAox3U6Ocx4WmF2', 'sdn1@gmail.com', '', '', '2021-03-01 07:49:07', '0000-00-00 00:00:00'),
(177, 'SDN Cibeureum 01', 'rm9sS5h6y8jMiOYzMcc2QeT5oihRdmR0blVKQm3unZydwIJwbaTE.', 'sdn2@gmail.com', '', '', '2021-03-01 07:49:07', '0000-00-00 00:00:00'),
(178, 'SDN Cibeureum 11', 'zY6JB22wIqlTvNdn8STy3OrwfLAlHxnRg1FwGbcJnxNTbIdO3XN2m', 'sdn3@gmail.com', '', '', '2021-03-01 07:49:07', '0000-00-00 00:00:00'),
(179, 'SDN Advent 1', 'IQJd0IS7UdNz9Q2gb9/hheKj.GCxxdZs7JsKn6N5IaPwq6spNH.o.', 'sdn4@gmail.com', '', '', '2021-03-01 07:49:07', '0000-00-00 00:00:00'),
(180, 'SDN Bandung Juara', 'ahPjZYBITsMlZAYnFTXQ5.LPM2a5Rat1y9F8Fv0PpBtTUq1JMOyBG', 'sdn5@gmail.com', '', '', '2021-03-01 07:49:07', '0000-00-00 00:00:00'),
(181, 'SDN Cibeureum 03', 'I./IUognIVWYGUsc0bOdAej715mRJigFXXlQISxRldOMynECzcZLO', 'sdn1@gmail.com', '', '', '2021-03-01 07:50:40', '0000-00-00 00:00:00'),
(182, 'SDN Cibeureum 01', 'PG4ClviyrA2xyUGoCIQ/IO0rUa5IT.uM7h6MxiRINu55KW7I9DxHG', 'sdn2@gmail.com', '', '', '2021-03-01 07:50:40', '0000-00-00 00:00:00'),
(183, 'SDN Cibeureum 11', '/Z9YyittJ9iz13IL0/3IGer/4Y7mac7sjR8nmoq9TesnTK0zzwHlW', 'sdn3@gmail.com', '', '', '2021-03-01 07:50:40', '0000-00-00 00:00:00'),
(184, 'SDN Advent 1', 'zz5ATujiIkKE.W0Enuaz3OwAguvq9dI5SXaIJKPZl0g4jVXb4JcSm', 'sdn4@gmail.com', '', '', '2021-03-01 07:50:40', '0000-00-00 00:00:00'),
(185, 'SDN Bandung Juara', 'xzpsc1hq3z48vjiuHk4zNumxQj9K2yn8ZTUkhF8aEYUw5EY43SwlG', 'sdn5@gmail.com', '', '', '2021-03-01 07:50:40', '0000-00-00 00:00:00'),
(186, 'SDN Cibeureum 03', 'V.jpVQN.XiDdUqq.gulrXOgXNEuWLMdnmSmV.nsVRWByGZXmPOl9u', 'sdn1@gmail.com', '', '', '2021-03-01 07:57:01', '0000-00-00 00:00:00'),
(187, 'SDN Cibeureum 01', '65F279OEuiu7TnazRWEiieTmwxrSQTHKKNk4QCQcpyIhthVgurMNS', 'sdn2@gmail.com', '', '', '2021-03-01 07:57:01', '0000-00-00 00:00:00'),
(188, 'SDN Cibeureum 11', '9cykvXR.IPcVA3SberNeIOJOgtZh6yevrHVm6Yz2L2Zt9cm4/ZeMy', 'sdn3@gmail.com', '', '', '2021-03-01 07:57:01', '0000-00-00 00:00:00'),
(189, 'SDN Advent 1', 'QMVBd54YWw0zIq1zejPUHe522V5zZoqgF6EAoqonLw/9e4LssHsJC', 'sdn4@gmail.com', '', '', '2021-03-01 07:57:01', '0000-00-00 00:00:00'),
(190, 'SDN Bandung Juara', 'G1/7Nh9M4UeIbH.pfRB3q.EXVwbgfyR/fedZkJGCqTs5SZBQYJU5O', 'sdn5@gmail.com', '', '', '2021-03-01 07:57:01', '0000-00-00 00:00:00'),
(191, 'SDN Cibeureum 03', 'QsA8nNmaWZ5o3nJ0kwWi3.BrRta1.hmjmoThEjK8/xY42/SksBHru', 'sdn1@gmail.com', '', '', '2021-03-01 07:57:16', '0000-00-00 00:00:00'),
(192, 'SDN Cibeureum 01', 'aw0FXoH/fUm3dQvTLvn3u.N1C7Oh7cuQxUGyA8CGldQig7dvOv/e6', 'sdn2@gmail.com', '', '', '2021-03-01 07:57:16', '0000-00-00 00:00:00'),
(193, 'SDN Cibeureum 11', 'BfuFf5erSSj/WWjFIAPntO5cPbtJd6oRlHma2DIfJo6/DKPSB7bU6', 'sdn3@gmail.com', '', '', '2021-03-01 07:57:16', '0000-00-00 00:00:00'),
(194, 'SDN Advent 1', 'T9ul9T5I7qGYsEWdepwg3OqbIQGrtMA2KKoSFIl8wP/DMLmO8iTL6', 'sdn4@gmail.com', '', '', '2021-03-01 07:57:16', '0000-00-00 00:00:00'),
(195, 'SDN Bandung Juara', 'b/q08ejACNCYgU7jZh./rOIZkRqKFsAVGB5Ck8PVOlUdAk7DMycce', 'sdn5@gmail.com', '', '', '2021-03-01 07:57:16', '0000-00-00 00:00:00'),
(196, 'SDN Cibeureum 03', 'cEyjUqDdteiqnb/ETEKHk.2QCI2J86riw2NAqNneHWm1BTuGno1C2', 'sdn1@gmail.com', '', '', '2021-03-01 07:57:58', '0000-00-00 00:00:00'),
(197, 'SDN Cibeureum 01', '/fhsqJOzArffF9U5rMTdfOTGBMnwRCIFE0b1jDoi/A7boHlyq5iJi', 'sdn2@gmail.com', '', '', '2021-03-01 07:57:58', '0000-00-00 00:00:00'),
(198, 'SDN Cibeureum 11', 'IirwtNXVBpmlko7PUQIFqOQ22UdzqENO6CubZ.QgX4srqU3Bhkmka', 'sdn3@gmail.com', '', '', '2021-03-01 07:57:58', '0000-00-00 00:00:00'),
(199, 'SDN Advent 1', 'AOTRBaJrjDpXkz4ACNM7m.GZGb7NviNWtw/UvY2maczKpWh5OfrAa', 'sdn4@gmail.com', '', '', '2021-03-01 07:57:58', '0000-00-00 00:00:00'),
(200, 'SDN Bandung Juara', 'Li/JnQXCOB.MrEMOfXGctu8Y.TxX5JAiKkxvrTNjh9Dk59skGt04W', 'sdn5@gmail.com', '', '', '2021-03-01 07:57:58', '0000-00-00 00:00:00'),
(201, 'SDN Cibeureum 03', 'R37AaQOjs8zkvEJiQiSOV.DIqMl923omu6tVIhkNOe2TLTG5U9Gci', 'sdn1@gmail.com', '', '', '2021-03-01 07:58:39', '0000-00-00 00:00:00'),
(202, 'SDN Cibeureum 01', 'Seb.6Q/Y5oFWralwRht3peY.tkb6wz7gAVYGXp06FcK9c9aEfIzoG', 'sdn2@gmail.com', '', '', '2021-03-01 07:58:39', '0000-00-00 00:00:00'),
(203, 'SDN Cibeureum 11', 'ZfCNXWjpmpY8M7jRdJAVMOAdOkRt59EVtqXUfTILlYCOzUWNzFfyu', 'sdn3@gmail.com', '', '', '2021-03-01 07:58:39', '0000-00-00 00:00:00'),
(204, 'SDN Advent 1', 'j5HNRbMDhUKX3c26ugVEfeO0YkRj9O8uYX3R9oEAtm7RATA4NMT/O', 'sdn4@gmail.com', '', '', '2021-03-01 07:58:39', '0000-00-00 00:00:00'),
(205, 'SDN Bandung Juara', 'd30fBAG36HhjT2QigFR0tu3Km5aIntzx00zPvGAK.81FbQMpBciom', 'sdn5@gmail.com', '', '', '2021-03-01 07:58:39', '0000-00-00 00:00:00'),
(206, 'SDN Cibeureum 03', 'yOtfHdb8b8bv75zqPem5XuxLzidgerTg2IyRTE7R6PhnEgAMd1u0a', 'sdn1@gmail.com', '', '', '2021-03-01 07:59:01', '0000-00-00 00:00:00'),
(207, 'SDN Cibeureum 01', 'Cdent6ODt6ZbjS9zVmRen.LLPJQoiKHbGcxYr25fnHCVwX/fGx7Iy', 'sdn2@gmail.com', '', '', '2021-03-01 07:59:01', '0000-00-00 00:00:00'),
(208, 'SDN Cibeureum 11', 'I5be7gGGSlpBWSsiscdpXuqzyEYE0N5VmhJyaYtMyah7B7xUergFS', 'sdn3@gmail.com', '', '', '2021-03-01 07:59:01', '0000-00-00 00:00:00'),
(209, 'SDN Advent 1', 'Rjn7FmHmDAvhYAbxUGgY5un8kvRx4Cj1AjVZ2nu8NRX4eqXNk07Qy', 'sdn4@gmail.com', '', '', '2021-03-01 07:59:01', '0000-00-00 00:00:00'),
(210, 'SDN Bandung Juara', 'OR2HBrSfHLVDEZWI8xPHfuHiCGIFvBxI0LSwxSXzDVXSWZeBMGs9e', 'sdn5@gmail.com', '', '', '2021-03-01 07:59:01', '0000-00-00 00:00:00'),
(211, 'SDN Cibeureum 03', '02sqV8ID5sTR3a.ItFNYae28rX/OMI7t6dVy1Suy7QkakI60tW1ke', 'sdn1@gmail.com', '', '', '2021-03-01 07:59:18', '0000-00-00 00:00:00'),
(212, 'SDN Cibeureum 01', 'UCKh941vKtz0CDbJbQNLke3IvWz.2M1GxX//3kbBbHDfCd3Unrbke', 'sdn2@gmail.com', '', '', '2021-03-01 07:59:18', '0000-00-00 00:00:00'),
(213, 'SDN Cibeureum 11', 'PzG5PXDUc6QDTss7fUMoWOd6xQTak.57srCm8w5xYGMBzZq3Eg7/q', 'sdn3@gmail.com', '', '', '2021-03-01 07:59:19', '0000-00-00 00:00:00'),
(214, 'SDN Advent 1', 'Kqezxob.KhcLJPXo/Q8Wqe4aJzEklZx0CtdgsJNj1CSo2/udyb4jG', 'sdn4@gmail.com', '', '', '2021-03-01 07:59:19', '0000-00-00 00:00:00'),
(215, 'SDN Bandung Juara', '06qDYlLBvkfvmh3dBriZ4.HPN2IeFPsHyYAmMTGo1n1477Qyhlcue', 'sdn5@gmail.com', '', '', '2021-03-01 07:59:19', '0000-00-00 00:00:00'),
(216, 'SDN Cibeureum 03', 'C3PDZrnw1HGK8yYpGfxYzOPLgmy2pHgvO3YVqcIuRP2PL4/Uc98zS', 'sdn1@gmail.com', '', '', '2021-03-01 07:59:27', '0000-00-00 00:00:00'),
(217, 'SDN Cibeureum 01', 'PKxUHGtA.gfsUr7SZipFmONeMhpVojUzVfX1C37DQ/n1Sxq8d1wp.', 'sdn2@gmail.com', '', '', '2021-03-01 07:59:27', '0000-00-00 00:00:00'),
(218, 'SDN Cibeureum 11', '.3X6bnqm3O/C5gvYIbXauOGnAEa0hjIVdtzIXnihlkS05YJxHoKxe', 'sdn3@gmail.com', '', '', '2021-03-01 07:59:27', '0000-00-00 00:00:00'),
(219, 'SDN Advent 1', 'mI0UxfknBfVq7V9IXCImRuLZuLPBJ4FqYbyXdKcsJlHcZ1GhgGIaa', 'sdn4@gmail.com', '', '', '2021-03-01 07:59:27', '0000-00-00 00:00:00'),
(220, 'SDN Bandung Juara', '76ViVZU0laVjNks6b60T1ewn.m3jozJcP8FWKlGB.W54MuBS9wyJW', 'sdn5@gmail.com', '', '', '2021-03-01 07:59:27', '0000-00-00 00:00:00'),
(221, 'SDN Cibeureum 03', 'x2Akm9SoAc82LGG.JOJiSuTXH45e69zzg4GHVaxc4b3Tp0kw0wgX6', 'sdn1@gmail.com', '', '', '2021-03-01 07:59:42', '0000-00-00 00:00:00'),
(222, 'SDN Cibeureum 01', 'tHYsfgA6XetmtdzjQEGm7eCdlEVpWu0t0torum7Jr6Gkx1.uPqCf6', 'sdn2@gmail.com', '', '', '2021-03-01 07:59:42', '0000-00-00 00:00:00'),
(223, 'SDN Cibeureum 11', 'ZK6b7j0XKf/4Q4zVN2GLcenJGa0gvGMo9tmTvZsYObHCNSwymSOxi', 'sdn3@gmail.com', '', '', '2021-03-01 07:59:42', '0000-00-00 00:00:00'),
(224, 'SDN Advent 1', 'iFV5krebs5vVu5Lpns3mte.xN98q1OARzW5Nu.V6S9fqAFGH0xu7e', 'sdn4@gmail.com', '', '', '2021-03-01 07:59:42', '0000-00-00 00:00:00'),
(225, 'SDN Bandung Juara', 'eY8PVuaWqM.0NEPL68hTn.QSwzU2X4A4V9Jh/fPHxX0b0dibjKyPe', 'sdn5@gmail.com', '', '', '2021-03-01 07:59:42', '0000-00-00 00:00:00'),
(226, 'SDN Cibeureum 03', 'uI1Mv2H934dblM0Rk9FBuuktesMo4YmQBVx4lhaj9MtkNM7hLWGju', 'sdn1@gmail.com', '', '', '2021-03-01 07:59:58', '0000-00-00 00:00:00'),
(227, 'SDN Cibeureum 01', 'Nzo6fSZS9J/Z/NFKxnOs9.zQuHdL.9FD7Gi96ivI6R0MrjPGoXPFe', 'sdn2@gmail.com', '', '', '2021-03-01 07:59:58', '0000-00-00 00:00:00'),
(228, 'SDN Cibeureum 11', 'zv1ju7HV.czcacgGDO.3P.cP.FJnEYb0UxT3RXeT1Zu5tc58oOLMW', 'sdn3@gmail.com', '', '', '2021-03-01 07:59:58', '0000-00-00 00:00:00'),
(229, 'SDN Advent 1', 'ncLGCaUWtzWVhteJ0CnTWutjg3ze.w5IzFz4jG5oO0/qKkzxiz93C', 'sdn4@gmail.com', '', '', '2021-03-01 07:59:58', '0000-00-00 00:00:00'),
(230, 'SDN Bandung Juara', 'Zu1fvi//aUge6xUkXfjrDen8yDcRP/Hmq3tqIieTLa95XgVhHdOeK', 'sdn5@gmail.com', '', '', '2021-03-01 07:59:59', '0000-00-00 00:00:00'),
(231, 'SDN Cibeureum 03', 'jKgjQTTSKF5mdUvMREPAAucAbsh95h548rLIxqUH56WirDBP1.ERq', 'sdn1@gmail.com', '', '', '2021-03-01 08:00:11', '0000-00-00 00:00:00'),
(232, 'SDN Cibeureum 01', 'jB9hYSzXttBkUccbD4Uqieu2.YZSB98sGlZnBnLgMp6UyZVg1xRO2', 'sdn2@gmail.com', '', '', '2021-03-01 08:00:11', '0000-00-00 00:00:00'),
(233, 'SDN Cibeureum 11', 'fpie6P3/qlcMbPUjTATY7e/TXFoqgGvPzywjhz9QtZJehmSGKhpt2', 'sdn3@gmail.com', '', '', '2021-03-01 08:00:12', '0000-00-00 00:00:00'),
(234, 'SDN Advent 1', 'IMAWgqeWdMKq0rAuede1BezVLv1Dg2V5VIt.YMsYS//KMQJ5w52kO', 'sdn4@gmail.com', '', '', '2021-03-01 08:00:12', '0000-00-00 00:00:00'),
(235, 'SDN Bandung Juara', 'Aouas1sv/l9euRMhs6EcmOo5tjpZ.4QC7g0BxVF.vbzdS/LrUqF2q', 'sdn5@gmail.com', '', '', '2021-03-01 08:00:12', '0000-00-00 00:00:00'),
(236, 'SDN Cibeureum 03', 'hddVXAWK2ZpbAf2sPRvNVeVEZgO61Uxazz72b/qJWdqjKS5CGRSfm', 'sdn1@gmail.com', '', '', '2021-03-01 08:00:13', '0000-00-00 00:00:00'),
(237, 'SDN Cibeureum 01', 'Z7jwyJ/SiSEWWiNRe1SKA.aYuKyT8NYFrzxFCjizvQwCWh1S90S.K', 'sdn2@gmail.com', '', '', '2021-03-01 08:00:13', '0000-00-00 00:00:00'),
(238, 'SDN Cibeureum 11', '3Ni/oY4URcW23Cx/yV9WqOAw3xZXRIedtIGpi1OuqibgTji8EH1bm', 'sdn3@gmail.com', '', '', '2021-03-01 08:00:13', '0000-00-00 00:00:00'),
(239, 'SDN Advent 1', 'mouvD0N0dSg5tyU6AF46VuO4tR3NuhohWsSPUWAjr3sX3xvZbnvHS', 'sdn4@gmail.com', '', '', '2021-03-01 08:00:13', '0000-00-00 00:00:00'),
(240, 'SDN Bandung Juara', 'n66dFUGKjGNLfh2qRY8fP.2jcFbs1tJt5Uq9jnmtugT56gXLV/BIS', 'sdn5@gmail.com', '', '', '2021-03-01 08:00:13', '0000-00-00 00:00:00'),
(241, 'SDN Cibeureum 03', '2YFWHaR9fH9h..CfYbWYoe6uXh7f3gnCoIrToiGoSHjMjxjorjcJW', 'sdn1@gmail.com', '', '', '2021-03-01 08:00:18', '0000-00-00 00:00:00'),
(242, 'SDN Cibeureum 01', 'jGeFhPjZcsL34rZaSUMQPuZDhlWCw4DAQrFhc5k3PSYNAlBXsAxra', 'sdn2@gmail.com', '', '', '2021-03-01 08:00:19', '0000-00-00 00:00:00'),
(243, 'SDN Cibeureum 11', '9AGDqih11H.t62csYAvA5eBEB9vUzoj7p9Ajs45SvnNZ0PWtvbM7a', 'sdn3@gmail.com', '', '', '2021-03-01 08:00:19', '0000-00-00 00:00:00'),
(244, 'SDN Advent 1', 't2O/X1yN8u8YN8/OiLypDu5NaNnDxxmzMnMlteGYSn8LQNf8wyPO2', 'sdn4@gmail.com', '', '', '2021-03-01 08:00:19', '0000-00-00 00:00:00'),
(245, 'SDN Bandung Juara', 'p4zT0bDwUOF2OGKCvjLJze8aE8NEf1Go.fGTWBBKd5bCt3qQYNvjC', 'sdn5@gmail.com', '', '', '2021-03-01 08:00:19', '0000-00-00 00:00:00'),
(246, 'SDN Cibeureum 03', '4qfnjhB/qDlTovg6mLRUIeArcOUHBytAXZG1zXhgL9x992ZgXWWRS', 'sdn1@gmail.com', '', '', '2021-03-01 08:00:40', '0000-00-00 00:00:00'),
(247, 'SDN Cibeureum 01', '4I7o2yW0n9o6hZJrvCdi6OQ3vrMXQhS5gnsV8zsUNbMV65/7bOt6S', 'sdn2@gmail.com', '', '', '2021-03-01 08:00:40', '0000-00-00 00:00:00'),
(248, 'SDN Cibeureum 11', 'Hpm9xEKmJ.2ZtSnQiZyZ4.DNhx8cirw.FBQal3ui1CmwJ1O.ZHSjS', 'sdn3@gmail.com', '', '', '2021-03-01 08:00:40', '0000-00-00 00:00:00'),
(249, 'SDN Advent 1', 'Wh5AeIhv.b67hzAxjDxLhe4lOi1DJl2pk/A.24FynBfoI9BC2Zxy2', 'sdn4@gmail.com', '', '', '2021-03-01 08:00:40', '0000-00-00 00:00:00'),
(250, 'SDN Bandung Juara', 'JhYt7isYsfvyUKj7T4auoe3SJ0EG9jHmSoeFNrLvLVoA8UuZ0duy.', 'sdn5@gmail.com', '', '', '2021-03-01 08:00:40', '0000-00-00 00:00:00'),
(251, 'SDN Cibeureum 03', '7nCZzjGqHzfxzXpeuiCyAuhsPvkJC/UK.rzHMDom9Vsx7t/yIBr.u', 'sdn1@gmail.com', '', '', '2021-03-01 08:00:51', '0000-00-00 00:00:00'),
(252, 'SDN Cibeureum 01', '3WCCIGsYOc9wpPcIoGi/UerOuQV2QQUMDu0HoSiu5GsgoYpC1g.5G', 'sdn2@gmail.com', '', '', '2021-03-01 08:00:51', '0000-00-00 00:00:00'),
(253, 'SDN Cibeureum 11', 'Z1WyaxQreNZBvGYf5SgrO.IrS3esyPM8R.izKiKgD/H96YdKOK.uu', 'sdn3@gmail.com', '', '', '2021-03-01 08:00:52', '0000-00-00 00:00:00'),
(254, 'SDN Advent 1', '5kRnUf6Z7CrYTMx5vzVXSu1ImIXVcvAcDY5RIASO7sHjNN1yj2ShG', 'sdn4@gmail.com', '', '', '2021-03-01 08:00:52', '0000-00-00 00:00:00'),
(255, 'SDN Bandung Juara', 'NsmR9sApZzxavIx2HMSdN.WKtkRL/hoVqvLKzr/HyKn/KcrhrCIie', 'sdn5@gmail.com', '', '', '2021-03-01 08:00:52', '0000-00-00 00:00:00'),
(256, 'SDN Cibeureum 03', 'bj5pDpeugh1.Z9WVEkuZluTnOHTFdakh6Bt9tupTBKiwdnS7Ojq9W', 'sdn1@gmail.com', '', '', '2021-03-01 08:00:58', '0000-00-00 00:00:00'),
(257, 'SDN Cibeureum 01', '8ko1b.dkdlAlivQLQsbCteQ53GTZRqEA7xYqgZY.15fW2ixkC5s/W', 'sdn2@gmail.com', '', '', '2021-03-01 08:00:58', '0000-00-00 00:00:00'),
(258, 'SDN Cibeureum 11', 'F5QY59.jFw0QltmiZcdeB.8Mum995Ar6D2Z/hGBd3TMG9Tuquezea', 'sdn3@gmail.com', '', '', '2021-03-01 08:00:58', '0000-00-00 00:00:00'),
(259, 'SDN Advent 1', '2grQMos8X6NyMx5uLouXeuiASH9Gq6iRZtFVT9O6pfkQ5GBArRmZy', 'sdn4@gmail.com', '', '', '2021-03-01 08:00:58', '0000-00-00 00:00:00'),
(260, 'SDN Bandung Juara', 'smMyiUylcYaQIlO1jiGhoOkwoGfyewm5qNauK7DQWZ6gN.NaiiZ8S', 'sdn5@gmail.com', '', '', '2021-03-01 08:00:58', '0000-00-00 00:00:00'),
(261, 'SDN Cibeureum 03', 'o3OWQFhalv6cdWlqzua3Xe2GrJfyOFrT79z0LMK7wf16JEfo.fgMq', 'sdn1@gmail.com', '', '', '2021-03-01 08:01:34', '0000-00-00 00:00:00'),
(262, 'SDN Cibeureum 01', 'JuObxBfS/CwM4vUrZJV1FuHxs.wz.nwzIxRaYe1jkCHQSLO.WInUC', 'sdn2@gmail.com', '', '', '2021-03-01 08:01:34', '0000-00-00 00:00:00'),
(263, 'SDN Cibeureum 11', '9EpLRnEb00uDWs0I0Rj5bupoWyNEWDP5LFg8XtavbzAXbnMmzwJz2', 'sdn3@gmail.com', '', '', '2021-03-01 08:01:34', '0000-00-00 00:00:00'),
(264, 'SDN Advent 1', 'WBxMEs998u61AA7DOJ4J/uHG3pp.jovAqPne12zNMWNBD/58F/gHa', 'sdn4@gmail.com', '', '', '2021-03-01 08:01:34', '0000-00-00 00:00:00'),
(265, 'SDN Bandung Juara', 'OsJJUYJIDAhkRR6OZM/fue38hoCNIjQs4LIEJVRUrlQz2te/E.cQq', 'sdn5@gmail.com', '', '', '2021-03-01 08:01:34', '0000-00-00 00:00:00'),
(266, 'SDN Cibeureum 03', 'rUD9htIkvI7EaCnuvFNFr.yp/AVkxUrkHqI4ES8CVPwZJv5MXKW1C', 'sdn1@gmail.com', '', '', '2021-03-01 08:01:51', '0000-00-00 00:00:00'),
(267, 'SDN Cibeureum 01', 'QEXVvbk9r8/pn7zBgXTuG.HjJRYqaHbbqzI8UJGxB6/rryyMAI48i', 'sdn2@gmail.com', '', '', '2021-03-01 08:01:51', '0000-00-00 00:00:00'),
(268, 'SDN Cibeureum 11', 'Rd6SsIDtG9EnCKL2WQjA.u7XwE7IuLeRqZC.0mKJe/YNh0HUw4KaC', 'sdn3@gmail.com', '', '', '2021-03-01 08:01:51', '0000-00-00 00:00:00'),
(269, 'SDN Advent 1', 'NFNm5Fk4FKB0hK7UQ9Vqiurzydpy89wcjn9RwrwPnYSQhzMGDvrim', 'sdn4@gmail.com', '', '', '2021-03-01 08:01:52', '0000-00-00 00:00:00'),
(270, 'SDN Bandung Juara', '1jhuyYAH/GfhWll1kLCf9eEh6BgVE650J1H.L.YnCAfINWmn9K7S2', 'sdn5@gmail.com', '', '', '2021-03-01 08:01:52', '0000-00-00 00:00:00'),
(271, 'SDN Cibeureum 03', 'G1liSRncjS0CdFD2mjeGYOTT.kfsCQFGG3HNd85sAd0GO4hLjEP4u', 'sdn1@gmail.com', '', '', '2021-03-01 08:02:08', '0000-00-00 00:00:00'),
(272, 'SDN Cibeureum 01', 'i2GVo3qo.WoEjBRohfi9d.SuB3ueteF0mC7ojj.bKxRrrJtCGzT52', 'sdn2@gmail.com', '', '', '2021-03-01 08:02:08', '0000-00-00 00:00:00'),
(273, 'SDN Cibeureum 11', 'tD4OPT63fUPDTDRCqL9nH.MPnG0oJJ2iydKnWKSTizwxFyeZa/EVa', 'sdn3@gmail.com', '', '', '2021-03-01 08:02:08', '0000-00-00 00:00:00'),
(274, 'SDN Advent 1', 'ZqaggKk4XeoILrcYGXUJhuAX0aONtgsbJg.HSELGt.QtMd5Wu2rTe', 'sdn4@gmail.com', '', '', '2021-03-01 08:02:08', '0000-00-00 00:00:00'),
(275, 'SDN Bandung Juara', 'JuGF.w6p6nDem1ieBi7A3e55XmaXIS4JMV9KZUePw2uoD1qlP07oi', 'sdn5@gmail.com', '', '', '2021-03-01 08:02:08', '0000-00-00 00:00:00'),
(276, 'SDN Cibeureum 03', '8HwxSxMvEnr8AHy0jvcHTufug53jhKNJXp3/tpAjZL0VWVTeuTiN6', 'sdn1@gmail.com', '', '', '2021-03-01 08:02:28', '0000-00-00 00:00:00'),
(277, 'SDN Cibeureum 01', 'U/EerNlOtOjsAMOIrqwsde476xnu30OATmLDnR7ppyVSUYsss6tbG', 'sdn2@gmail.com', '', '', '2021-03-01 08:02:28', '0000-00-00 00:00:00'),
(278, 'SDN Cibeureum 11', '.J4z7odfJCpN3ccUEvEuw.YYKoTdkbnEN5z651dIFXs.DZ7SKx69.', 'sdn3@gmail.com', '', '', '2021-03-01 08:02:28', '0000-00-00 00:00:00'),
(279, 'SDN Advent 1', 'VFqqfRP/4ouCDeVaZu3KqOWg0mB3tHXrHFoeFbX4KCpv2NOqscl1e', 'sdn4@gmail.com', '', '', '2021-03-01 08:02:28', '0000-00-00 00:00:00'),
(280, 'SDN Bandung Juara', 'YqntT4ZQjGJMMgWOkJyDGu6WXYNEPJqW74.OEBal5gG58Jbmui8vS', 'sdn5@gmail.com', '', '', '2021-03-01 08:02:28', '0000-00-00 00:00:00'),
(281, 'SDN Cibeureum 03', 'cm3.KFTzjyLZGD6OteSau.CCD5hYPWzb10w02S0gDmuw8hT5RSYcy', 'sdn1@gmail.com', '', '', '2021-03-01 08:02:45', '0000-00-00 00:00:00'),
(282, 'SDN Cibeureum 01', 'f8/w0vh3qF88PSxmDTRAUuAJyr7hmL6Gsymexkk0LNaLAyyVdzMiW', 'sdn2@gmail.com', '', '', '2021-03-01 08:02:45', '0000-00-00 00:00:00'),
(283, 'SDN Cibeureum 11', 'wPfpQl9GlSsBxr437vu3WuuWUv6C5LL8/pB.Gu2zuYfpIyrdICo7W', 'sdn3@gmail.com', '', '', '2021-03-01 08:02:45', '0000-00-00 00:00:00'),
(284, 'SDN Advent 1', 'UAwRTbgbxzHtj5u.baZazu0jSWpYIRKPQ6omUMn9gJQeHhsZbtdEG', 'sdn4@gmail.com', '', '', '2021-03-01 08:02:46', '0000-00-00 00:00:00'),
(285, 'SDN Bandung Juara', 'R6UWEgnEuyACKqA.fd4oA.ddN1RRh6BQfTDCKACqKbbRFyEMbGQZi', 'sdn5@gmail.com', '', '', '2021-03-01 08:02:46', '0000-00-00 00:00:00'),
(286, 'SDN Cibeureum 03', '/NEnNk7s5L6qpUk8ZeATgu7brB5MSVVd5zLPQO15LCRHE4LqRq8l.', 'sdn1@gmail.com', '', '', '2021-03-01 08:02:58', '0000-00-00 00:00:00'),
(287, 'SDN Cibeureum 01', 'WAZ30SuRKZFsQSNC268IHOhaJ7Wdj8c70RzhVroHWzqyA9K/7DHkm', 'sdn2@gmail.com', '', '', '2021-03-01 08:02:58', '0000-00-00 00:00:00'),
(288, 'SDN Cibeureum 11', 'gqGlkqu1ALDlLmwD/kC1k.HGvoOqMhHXvDoX4lgKrZBCrEdn3fb9a', 'sdn3@gmail.com', '', '', '2021-03-01 08:02:58', '0000-00-00 00:00:00'),
(289, 'SDN Advent 1', 'eEzkLhj01XJxzs76.Iu0LObFTF4Jw6RGhYiVcL82yVh6HvsMwKQWa', 'sdn4@gmail.com', '', '', '2021-03-01 08:02:58', '0000-00-00 00:00:00'),
(290, 'SDN Bandung Juara', 'Zhc1NRQv.Z2iNrJyvS1dj.DWe3nRa5TSl3ihq1Ct0/hh3R69OmBTG', 'sdn5@gmail.com', '', '', '2021-03-01 08:02:58', '0000-00-00 00:00:00'),
(291, 'SDN Cibeureum 03', 'QCxZJkPaDG3WUHw0TanHTuYAxdo.dmUiLOEwIXuEZzlgb7gVzBYTa', 'sdn1@gmail.com', '', '', '2021-03-01 08:03:20', '0000-00-00 00:00:00'),
(292, 'SDN Cibeureum 01', '416z/2X0SmCUarIwX.VHM.cXMeQapXlMFWUdN.ivFWaPFC4KIxDgi', 'sdn2@gmail.com', '', '', '2021-03-01 08:03:20', '0000-00-00 00:00:00'),
(293, 'SDN Cibeureum 11', 'jO5tDiYaC4OMLESSmx4QH.AdJyOf4wVJBBTJOMlLL4G0i5BkfueFy', 'sdn3@gmail.com', '', '', '2021-03-01 08:03:20', '0000-00-00 00:00:00'),
(294, 'SDN Advent 1', 'tlWZCBUx0P..T8OOLwFiuuAma8GRQiF5lrF5gt2pA165gfiS/SWmO', 'sdn4@gmail.com', '', '', '2021-03-01 08:03:20', '0000-00-00 00:00:00'),
(295, 'SDN Bandung Juara', 'yvB9zzuoqq8rQ9mQroF3du8VIzMmZbAmf8Kmdn3ORPNdZKos1e7We', 'sdn5@gmail.com', '', '', '2021-03-01 08:03:20', '0000-00-00 00:00:00'),
(296, 'SDN Cibeureum 03', 'DKpMISHIiqQXWCYses8dTefXOnMpJNTieI6Fn3POYveD8AaZvESr.', 'sdn1@gmail.com', '', '', '2021-03-01 08:03:35', '0000-00-00 00:00:00'),
(297, 'SDN Cibeureum 01', '3brKlt3pvuc7soueh2dz5ORZXohdWRlPcgGeyAaTHKT/9DcjyXWTG', 'sdn2@gmail.com', '', '', '2021-03-01 08:03:35', '0000-00-00 00:00:00'),
(298, 'SDN Cibeureum 11', 'dvOS.3FkcIikogxdAFSLg.7I9Bqsol3uq2ux838jggQelEU4tzvq.', 'sdn3@gmail.com', '', '', '2021-03-01 08:03:35', '0000-00-00 00:00:00'),
(299, 'SDN Advent 1', 'h0Y/u9DG8euVDuW34d13iuWoJh3ekeaYlEc8w2q8haV498NRVtD/.', 'sdn4@gmail.com', '', '', '2021-03-01 08:03:35', '0000-00-00 00:00:00'),
(300, 'SDN Bandung Juara', 'ctkvnmLxA2tfTFm8mRC45eKEddkvA25A0mjFRkMAHN1oSCYKFCyyq', 'sdn5@gmail.com', '', '', '2021-03-01 08:03:35', '0000-00-00 00:00:00'),
(301, 'SDN Cibeureum 03', 'zMjwFqtwy1bPS4CwUOagxO19A8xgB12mv6Sb1toe5xNlnR2KgBm0a', 'sdn1@gmail.com', '', '', '2021-03-01 08:03:45', '0000-00-00 00:00:00'),
(302, 'SDN Cibeureum 01', '1MYyVNcesvQMaS90bEvoZ.C2.0oKwXmXlf5z/IRDFyG3U2H.HosKu', 'sdn2@gmail.com', '', '', '2021-03-01 08:03:46', '0000-00-00 00:00:00'),
(303, 'SDN Cibeureum 11', '4nACOZcfs/WfFF9V82nj/.jotVT02lxMltwqX.M.zNlWBSQcChjqW', 'sdn3@gmail.com', '', '', '2021-03-01 08:03:46', '0000-00-00 00:00:00'),
(304, 'SDN Advent 1', 'smQR6gAHBbslfERG9j88ZetE3cpyozGR5SEUqNHplzqsLCpp2zJsC', 'sdn4@gmail.com', '', '', '2021-03-01 08:03:46', '0000-00-00 00:00:00'),
(305, 'SDN Bandung Juara', 'p9wZ1t3hgcyDOfHz0rDG7.xddJVfU7ywr4PsliiXR/eQ.vHTHeXFm', 'sdn5@gmail.com', '', '', '2021-03-01 08:03:46', '0000-00-00 00:00:00'),
(306, 'SDN Cibeureum 03', 'EYZzePJCZgdyYZ4aszfvqOiFwAI/8ooJ7zw/Es9NkBEorLxXh5NoS', 'sdn1@gmail.com', '', '', '2021-03-01 08:04:01', '0000-00-00 00:00:00'),
(307, 'SDN Cibeureum 01', '4tyRGx/TQczMuUqH2kNIYeiPSWgLOuEvqCYGF986k.CMHN2Tr7MF2', 'sdn2@gmail.com', '', '', '2021-03-01 08:04:01', '0000-00-00 00:00:00'),
(308, 'SDN Cibeureum 11', '9VnMR60WJNucesyuMH8IheETkF8U7ISdW7GfiTQNgzVJm0BgCzWZ.', 'sdn3@gmail.com', '', '', '2021-03-01 08:04:02', '0000-00-00 00:00:00'),
(309, 'SDN Advent 1', 'yHlaSHyJL6ojxnQGFUNOTOxrKaTri.LrgW4LsiSHI/az.cUjacV96', 'sdn4@gmail.com', '', '', '2021-03-01 08:04:02', '0000-00-00 00:00:00'),
(310, 'SDN Bandung Juara', 'D9o2Y4.eOIvLiQSHszXpIuOY9WGJXvEhM6cPxXXbXvtFB7G03a8.W', 'sdn5@gmail.com', '', '', '2021-03-01 08:04:02', '0000-00-00 00:00:00'),
(311, 'SDN Cibeureum 03', 'BrldclIwxpH/Lpc601228.DS37aO16d9/aWr.QM7IzFNt0oBnkIoK', 'sdn1@gmail.com', '', '', '2021-03-01 08:04:13', '0000-00-00 00:00:00'),
(312, 'SDN Cibeureum 01', 'uscWygghLEgcJ3T9IcAXBeFIbMdEn9J2s3Gw4.lPVVLgWbUPYfV1q', 'sdn2@gmail.com', '', '', '2021-03-01 08:04:13', '0000-00-00 00:00:00'),
(313, 'SDN Cibeureum 11', 'GtVUMw7wUMr6diLA4fT12e0/vwh4KqdxejriouuuSkot0mq1ZQVU2', 'sdn3@gmail.com', '', '', '2021-03-01 08:04:13', '0000-00-00 00:00:00'),
(314, 'SDN Advent 1', 'mo0AsHknmfGaNyCVtDdbTewhGbVWAwBJ4Co24NjvM0GiILuji.f66', 'sdn4@gmail.com', '', '', '2021-03-01 08:04:13', '0000-00-00 00:00:00'),
(315, 'SDN Bandung Juara', 'wcwipPYE9kjDuEOx2v3V5eL.iUAn6gEJ7kTOTxxZrPjvfalwqWhne', 'sdn5@gmail.com', '', '', '2021-03-01 08:04:13', '0000-00-00 00:00:00'),
(316, 'SDN Cibeureum 03', 'GPcHboM3jbIzNVNh5LFwQ.0KYZSdUhmHPxNyTGFKqar0HzH7iT1OC', 'sdn1@gmail.com', '', '', '2021-03-01 08:07:01', '0000-00-00 00:00:00'),
(317, 'SDN Cibeureum 01', 'XXnDf2CkjqlonKJ98swKM.15mb7owqJP76CpXreS7Mcp/TOjQApra', 'sdn2@gmail.com', '', '', '2021-03-01 08:07:01', '0000-00-00 00:00:00'),
(318, 'SDN Cibeureum 11', '/5T3xn23toZWBJ9LzT./KuukamjFMb5rrzFYnphu.cutBbOC7bX4O', 'sdn3@gmail.com', '', '', '2021-03-01 08:07:01', '0000-00-00 00:00:00'),
(319, 'SDN Advent 1', 'uKekaiJUrM.QSNGPBAfiSu5RvMObhqCEjcfDXVB9wLgwINze7L/AW', 'sdn4@gmail.com', '', '', '2021-03-01 08:07:01', '0000-00-00 00:00:00'),
(320, 'SDN Bandung Juara', 'OBv6YklhzflCyaGXQKE0ju1ACzz5y60.GL1I/VEXZGXnMcAisMAYK', 'sdn5@gmail.com', '', '', '2021-03-01 08:07:01', '0000-00-00 00:00:00'),
(321, 'SDN Cibeureum 03', 'PEQMC8ZK9zuYZdpUzt7KpOBvpxlB.ZXoe3fBvVEH8s8QZuBI/7aZG', 'surat@gmail.com', '', '', '2021-03-01 08:08:05', '0000-00-00 00:00:00'),
(322, 'SMP Cimahi', '$2y$10$Cc0oP0niuB.JnHPlHTQlievu3wFOV.Ufm5V8P39VxTMAd/gTWHlSq', 'smp.cimahi@gmail.com', '', '', '2021-03-17 08:55:24', '0000-00-00 00:00:00'),
(323, 'SMP Bandung', '$2y$10$Cc0oP0niuB.JnHPlHTQlievu3wFOV.Ufm5V8P39VxTMAd/gTWHlSq', 'smp.bandung@gmail.com', '', '', '2021-03-17 09:08:13', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `aktifitas`
--
ALTER TABLE `aktifitas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cabangs`
--
ALTER TABLE `cabangs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kurs`
--
ALTER TABLE `kurs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`lev_id`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indeks untuk tabel `periodes`
--
ALTER TABLE `periodes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pindah_dana`
--
ALTER TABLE `pindah_dana`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rabs`
--
ALTER TABLE `rabs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `realisasis`
--
ALTER TABLE `realisasis`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `role_aplikasi`
--
ALTER TABLE `role_aplikasi`
  ADD PRIMARY KEY (`rola_id`);

--
-- Indeks untuk tabel `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`role_id`);

--
-- Indeks untuk tabel `saldos`
--
ALTER TABLE `saldos`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `saldo_pemasukans`
--
ALTER TABLE `saldo_pemasukans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `saldo_pengeluarans`
--
ALTER TABLE `saldo_pengeluarans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unique` (`token`),
  ADD KEY `tokens_user_id_foreign` (`user_id`),
  ADD KEY `tokens_token_index` (`token`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `aktifitas`
--
ALTER TABLE `aktifitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `cabangs`
--
ALTER TABLE `cabangs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `kurs`
--
ALTER TABLE `kurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `level`
--
ALTER TABLE `level`
  MODIFY `lev_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT untuk tabel `periodes`
--
ALTER TABLE `periodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pindah_dana`
--
ALTER TABLE `pindah_dana`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rabs`
--
ALTER TABLE `rabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `realisasis`
--
ALTER TABLE `realisasis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `role_aplikasi`
--
ALTER TABLE `role_aplikasi`
  MODIFY `rola_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT untuk tabel `role_users`
--
ALTER TABLE `role_users`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=326;

--
-- AUTO_INCREMENT untuk tabel `saldos`
--
ALTER TABLE `saldos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `saldo_pemasukans`
--
ALTER TABLE `saldo_pemasukans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `saldo_pengeluarans`
--
ALTER TABLE `saldo_pengeluarans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=324;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
