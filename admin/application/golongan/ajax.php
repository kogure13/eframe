<?php
require_once '../../../config/class.php';

$db = new dbObj();
$connString = $db->getConstring();

$dataClass = new golongan($connString);

$requestData = $_REQUEST;
$columns = array(    
    0 => 'golongan',
    1 => 'id'
);

$dataClass->getData($requestData, $columns);

?>