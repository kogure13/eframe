<?php

date_default_timezone_set('Asia/Jakarta');

define('company_name', 'Inspektorat III');
define('company_short', 'ITJEN III KEMDIKBUD');
define('apps_title', 'e-Auditor');
define('apps_name', 'Smart Aplication Information');
define('apps_short', 'SAI');

define('kop_title1', 'inspektorat III');
define('kop_title2', 'inspektorat jenderal');
define('kop_title3', 'kementrian pendidikan dan kebudayaan');

$seminggu = array("Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu");
$hari = date("w");
$hari_ini = $seminggu[$hari];

$nospace_date = date("Ymd");
$tgl_database = date("Y-m-d");
$tgl_skrg = date("d");
$bln_sekarang = date("m");
$thn_sekarang = date("Y");
$jam_sekarang = date("H:i:s");

$nama_bln = array(1 => "Januari", "Februari", "Maret", "April", "Mei",
    "Juni", "Juli", "Agustus", "September",
    "Oktober", "November", "Desember");

function tanggal_indo($tanggal) {
  $bulan = array(1 => 'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
  );
  $split = explode('-', $tanggal);
  return $split[2] . ' ' . $bulan[(int) $split[1]] . ' ' . $split[0];
}

?>