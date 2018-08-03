<?php

//set default time
date_default_timezone_set('Asia/Jakarta');
//define 
define('app_title', '');
define('app_name', '');
define('cp_name', '');
define('cp_name_short', '');
//bulan
$nama_bln = array(1 => "Januari", "Februari", "Maret", "April", "Mei",
    "Juni", "Juli", "Agustus", "September",
    "Oktober", "November", "Desember");
//minggu
$week_indo = array("Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu");
$hari = date('w');
$hari_ini = $week_indo[$hari];
//format tanggal
$tgl_sekarang = date('d-m-Y');
$jam_sekarang = date('H:i:s');
?>