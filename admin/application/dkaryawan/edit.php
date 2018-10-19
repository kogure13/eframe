<?php

include_once '../../../config/class.php';
$db = new dbObj();
$connString = $db->getConstring();
$editClass = new edit($connString);

if (!isset($_GET['id'])) {
  exit();
} else {
  $id = $_GET['id'];
  $tb_name = $_GET['tb_name'];
}

if ($id > 0) {
  $editClass->getData($id, $tb_name);
} else {
  mysql_errno();
}

class edit {

  protected $conn;
  protected $data = [];

  function __construct($connString) {
    $this->conn = $connString;
  }

  function getData($id, $tb_name) {
    $sql = "SELECT *";
    $sql .= " FROM $tb_name";
    $sql .= " WHERE $tb_name.id = $id";
    
    $result = mysqli_query($this->conn, $sql) or die('error to fecth data');

    while ($row = mysqli_fetch_assoc($result)) {
      $data = $row;
    }
    echo json_encode($data);
  }

}
?>