<?php

include_once '../../../config/class.php';

$db = new dbObj();
$connString = $db->getConstring();
$pengumuman = new pengumuman($connString);

$params = $_REQUEST;
$action = isset($params['action']) != '' ? $params['action'] : '';

switch ($action) {
  case 'add': $pengumuman->insertData($params);
    break;
  case 'edit': $pengumuman->updateData($params);
    break;
  case 'delete': $pengumuman->deleteData($params);
    break;
  default : break;
}
