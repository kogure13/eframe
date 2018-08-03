<?php
//set session
session_start();
//set config file
include './config/class.php';
include './config/function.php';

//
$main = new Main();
$userUI = new userUI();
include './model/main.php';
//end main
?>

