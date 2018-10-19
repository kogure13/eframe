<?php

include_once '../../../config/class.php';
$db = new dbObj();
$connString = $db->getConstring();
$optionClass = new option($connString);
$optionClass->getData('', 'master_peran');

class option {

  protected $conn;
  protected $data = [];

  function __construct($connString) {
    $this->conn = $connString;
  }

  function getData($id, $tb_name) {
    $sql = "SELECT *";
    $sql .= " FROM $tb_name";
    
    $result = mysqli_query($this->conn, $sql) or die('error to fecth data');

    while ($row = mysqli_fetch_assoc($result)) {
      $data[] = $row;
    }
    echo json_encode($data);
  }

}
?>