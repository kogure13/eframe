<?php

include_once '../../../config/class.php';

$db = new dbObj();
$connString = $db->getConstring();

$requestData = $_REQUEST;
$dataDistribusi = new distribusi($connString);

if (isset($_GET['data'])) {
  $data = $_GET['data'];
} else {
  exit();
}

switch ($data) {
  case 'terkirim': $columns = array(
        0 => 'id',
        1 => 'no_agenda',
        2 => 'tgl_agenda',
        3 => 'no_penugasaan',
        4 => 'tgl_penugasaan',
        5 => 'asal',
        6 => 'perihal',
        7 => 'isi_disposisi',
        8 => 'sifat'
    );
    $dataDistribusi->getTerkirim($requestData, $columns);
    break;
  case 'terima': $columns = array(
    );
    break;
}  

