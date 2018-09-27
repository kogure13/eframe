<?php
require_once '../../../config/class.php';

$db = new dbObj();
$connString = $db->getConstring();

$dataClass = new peran($connString);

$requestData = $_REQUEST;
$columns = array(    
    0 => 'id',
    1 => 'peran'
);

$dataClass->getData($requestData, $columns);

?>