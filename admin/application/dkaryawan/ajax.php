<?php
require_once '../../../config/class.php';

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
    5 => 'alamat',
    6 => 'tlp',
    7 => 'id_peran',
    8 => 'is_kordinator'
);

$dataClass->getData($requestData, $columns);

?>