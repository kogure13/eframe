<?php
require_once '../../../config/class.php';

$db = new dbObj();
$connString = $db->getConstring();

$userClass = new user($connString);

$requestData = $_REQUEST;
$columns = array(    
    0 => 'id',
    1 => 'username',
    2 => 'nama',
    3 => 'role'
);

$userClass->getData($requestData, $columns);

