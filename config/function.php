<?php
date_default_timezone_set('Asia/Jakarta');

define('company_name', 'Inspektorat Jenderal III');
define('company_short', 'ITJEN III KEMDIKBUD');
define('apps_title', 'e-Audit');
define('apps_name', 'Smart Aplication Information');
define('apps_short', 'SAI');


$seminggu = array("Minggu","Senin","Selasa","Rabu","Kamis","Jumat","Sabtu");
$hari = date("w");
$hari_ini = $seminggu[$hari];

$nospace_date = date("Ymd");
$tgl_skrg     = date("d");
$bln_sekarang = date("m");
$thn_sekarang = date("Y");
$jam_sekarang = date("H:i:s");

$nama_bln=array(1=> "Januari", "Februari", "Maret", "April", "Mei", 
                    "Juni", "Juli", "Agustus", "September", 
                    "Oktober", "November", "Desember");

//$bln_ini = $nama_bln[$bln_sekarang];

?>