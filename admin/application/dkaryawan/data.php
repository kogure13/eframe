<?php

include_once '../../../config/class.php';

$db = new dbObj();
$connString = $db->getConstring();
$params = $_REQUEST;
$tb_name = "master_karyawan";
$action = isset($params['action']) != '' ? $params['action'] : '';
$crudClass = new CRUD($connString);
switch ($action) {
  case 'add' : $crudClass->insertData($params, $tb_name);
    break;
  case 'edit' : $crudClass->updateData($params, $tb_name);
    break;
  case 'delete' : $crudClass->deleteData($params, $tb_name);
    break;
  default : break;
}

class CRUD {

  protected $conn;

  function __construct($connString) {
    $this->conn = $connString;
  }

  function insertData($params, $tb_name) {
    $numData = $this->cekData($params, $tb_name);
    if ($numData > 0) {
      echo 1;
    } else {
      $sql = "INSERT INTO " . $tb_name;
      $sql .= " (nip, nama, alamat, tlp, id_jabatan, id_golongan, id_peran)";
      $sql .= " VALUES('".$params['nip']."', '".addslashes($params['nama'])."', "
              . "'".addslashes($params['alamat'])."', '".$params['tlp']."', "
              . "'".$params['jabatan']."', '".$params['golongan']."', '".$params['peran']."')";
      
      $result = mysqli_query($this->conn, $sql) or die("error to insert data");
      echo 0;
    }
  }

  function updateData($params, $tb_name) {
    $numData = $this->cekData($params, $tb_name);
    if ($numData > 1) {
      echo 1;
    } else {
      $sql = "UPDATE " . $tb_name ." SET";
      $sql .= " nip = '".$params['nip']."', nama = '".addslashes($params['nama'])."', "
              . "alamat = '".addslashes($params['alamat'])."', tlp = '".$params['tlp']."', "
              . "id_jabatan = '".$params['jabatan']."', id_golongan = '".$params['golongan']."', "
              . "id_peran = '".$params['peran']."'";
      $sql .= " WHERE id = ".$params['edit_id'];
      $result = mysqli_query($this->conn, $sql) or die("error to update data");
      echo 0;
    }
  }

  function deleteData($params, $tb_name) {
    $sql = "DELETE FROM " . $tb_name;
    $sql .= " WHERE id = '" . $params['id'] . "'";
    $result = mysqli_query($this->conn, $sql) or die("error to delete data");
  }

  function cekData($params, $tb_name) {
    $sql = "SELECT * FROM " . $tb_name;
    $sql .= " WHERE nip = '" . $params['nip'] . "'";
    $query = mysqli_query($this->conn, $sql) or die('error to cek data');
    $numData = intval($query->num_rows);
    return $numData;
  }

}
