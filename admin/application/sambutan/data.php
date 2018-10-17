<?php

include_once '../../../config/class.php';

$db = new dbObj();
$connString = $db->getConstring();
$sambutan = new sambutan($connString);
$params = $_REQUEST;

$action = isset($params['action']) != '' ? $params['action'] : '';
switch ($action) {
  case 'add' : $sambutan->insertData($params);
    break;
  default : $sambutan->getData();
    break;
}

class sambutan {

  protected $conn;
  protected $data = [];

  function __construct($connString) {
    $this->conn = $connString;
  }

  function getData() {
    $sql = "SELECT * FROM master_kata_pengantar";
    $result = mysqli_query($this->conn, $sql) or die('error to fetch sambutan');
    while ($row = mysqli_fetch_assoc($result)) {
      $data = $row;
    }
    echo json_encode($data);
  }
  
  function insertData($params) {
    $sql = "UPDATE master_kata_pengantar SET";
    $sql .= " kata = '".  addslashes($params['textSambutan'])."'";
    $result = mysqli_query($this->conn, $sql) or die('error update data');
    echo 1;
  }

}
?>