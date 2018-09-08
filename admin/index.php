<?php

session_start();
require '../config/class.php';
require '../config/function.php';

$main = new Main();
include './model/main.php';
?>