<?php
include_once '../../../config/class.php';

$db = new dbObj();
$connString = $db->getConstring();

if(isset($_GET['id'])) {
  $id = $_GET['id'];
} else {
  exit(); //stop scritp;
}

if($id > 0) {
  $dtKaryawan = new karyawan($connString);
  $dtKaryawan->dtKaryawan($id);
} else {
  mysql_errorno();
}


?>
