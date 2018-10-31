<?php
include '../../../config/class.php';

$db = new dbObj();
$connString = $db->getConstring();

$dataClass = new karyawan($connString);

$requestData = $_REQUEST;
$columns = array(    
    0 => 'id',
    1 => 'nip',
    2 => 'nama',
    3 => 'id_jabatan',
    4 => 'id_golongan',
    5 => 'id_peran',
    6 => 'alamat',
    7 => 'tlp'
);

$dataClass->getData($requestData, $columns);

?>