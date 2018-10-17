<?php
require_once '../../../config/class.php';

$db = new dbObj();
$connString = $db->getConstring();

$dataClass = new pengumuman($connString);

$requestData = $_REQUEST;
$columns = array(    
    0 => 'id',
    1 => '',
    2 => 'judul',
    3 => 'pengumuman',
    4 => '',
    5 => ''
);

$dataClass->getData($requestData, $columns);

?>