<?php
require_once '../../../config/class.php';

$db = new dbObj();
$connString = $db->getConstring();

$dataClass = new user($connString);

$requestData = $_REQUEST;
$columns = array(    
    0 => 'id',
    1 => 'username',
    2 => 'nama',
    3 => 'role'
);

$dataClass->getData($requestData, $columns);

?>