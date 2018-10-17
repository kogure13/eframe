<?php
include_once '../../../config/class.php';

$db = new dbObj();
$connString = $db->getConstring();
$sambutan = new sambutan($connString);
$params = $_REQUEST;

$action = isset($params['action']) != '' ? $params['action'] : '';
switch ($action) {
  case 'add' : $sambutan->insertData($params);
    break;
  default : $sambutan->getData();
    break;
}

?>