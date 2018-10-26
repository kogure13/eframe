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

if ($data == "terkirim") {
  $columns = array(
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
} elseif ($data == "terima") {
  $columns = array(
      0 => 'id',
      1 => 'no_penugasaan',
      2 => 'perihal',
      3 => 'no_penugasaan',
      4 => 'asal',
      5 => 'isi_disposisi',
      6 => 'sifat'
  );
  $dataDistribusi->getTerima($requestData, $columns);
}
  

