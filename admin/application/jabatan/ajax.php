<?php
require_once '../../../config/class.php';

$db = new dbObj();
$connString = $db->getConstring();

$dataClass = new jabatan($connString);

$requestData = $_REQUEST;
$columns = array(    
    0 => 'id',
    1 => 'jabatan'
);

$dataClass->getData($requestData, $columns);

?>