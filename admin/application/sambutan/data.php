<?php

include_once '../../../config/class.php';

$db = new dbObj();
$connString = $db->getConstring();
$params = $_REQUEST;

$action = isset($params['action']) != '' ? $params['action'] : '';

