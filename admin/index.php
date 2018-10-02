<?php

session_start();
require '../config/class.php';
require '../config/function.php';

$main = new Main();
if(!isset($_SESSION['eaudit_user'])) {
  include './model/login.php';
}else{
  include './model/main.php';
}

?>
