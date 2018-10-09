<?php
session_start();
include '../../../config/class.php';

$dbObj = new dbObj();
$connString = $dbObj->getConstring();

$params = $_REQUEST;

$login = new login($connString);
$login->getData($params);

class login {
  protected $conn;
  protected $data = [];

  function __construct($connString) {
    $this->conn = $connString;
  }

  function getData($params) {
    $uname = $params['username'];
    $pass = $params['password'];

    $sql = "SELECT * ";
    $sql .= " FROM master_user";
    $sql .= " WHERE username = '$uname'";

    $sqlTot = $sql;
    $q = mysqli_query($this->conn, $sqlTot) or die(0);
    $numq = intval($q->num_rows);

    if($numq > 0) {
      $query = mysqli_query($this->conn, $sql) or die(0);
      $row = mysqli_fetch_assoc($query);
      if($pass == $row['password']) {
        $_SESSION['eaudit_user'] = true;
        $_SESSION['detail_user'] = $row['username'];
        $_SESSION['id_user'] = $row['id'];
        $_SESSION['id_ref'] = $row['id_karyawan'];
        $_SESSION['role'] = $row['role'];

        echo 1;
      } else {
        echo 0;
      }
    } else {
      echo 404;
    } //end if
  }//end get data
}
?>
