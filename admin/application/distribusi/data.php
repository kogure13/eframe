<?php

include_once '../../../config/class.php';

$db = new dbObj();
$connString = $db->getConstring();
$distribusi = new distribusi($connString);

$params = $_REQUEST;
$action = isset($params['action']) != '' ? $params['action'] : '';

switch ($action) {
  case 'iadd' : $distribusi->insert_iaudit($params);
    break;
}