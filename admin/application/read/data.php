<?php

include_once '../../../config/class.php';

$db = new dbObj();
$connString = $db->getConstring();
$readClass = new read($connString);

$params = $_REQUEST;
$action = isset($_REQUEST['action']) != '' ? $_REQUEST['action'] : '';

switch ($_GET['aText']) {
case 'pg': $readClass->readPg($_GET['q']);  break;
case 'aa': $readClass->readAa($_GET['q']);  break;
}