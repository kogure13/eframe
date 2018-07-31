<?php
//set session
session_start();
//set config file
require_once './config/class.php';
//
$db = new dbObj();
$db->getConstring();
?>