<?php
//set session
session_start();
//set config file
require_once './config/class.php';
//
$userUI = new userUI();

$username = $userUI->inputText('text', 'input-sm', 'username', 'username');
$password = $userUI->inputText('password', 'input-sm', 'password', 'password');
$obj = array(
    0 => $username,
    1 => $password
);
echo $userUI->centerDIV($obj);
?>

