<?php

include_once '../../../config/class.php';
$db = new dbObj();
$connString = $db->getConstring();
$homeClass = new home($connString);

$params = $_REQUEST;

$action = isset($paramsp['action']) != '' ? $params['action'] : '';

switch ($action) {
  default :
    $json_data = array(
        'kata' =>  $homeClass->getKata($params),
        'pengumuman' => $homeClass->getPengumuman($params)
    );
    echo json_encode($json_data);
    break;
}

