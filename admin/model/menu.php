<?php

$db = new dbObj();
$connString = $db->getConstring();

$menu = new menu($connString);

mysql_connect("localhost", "root", "root");
mysql_select_db("tutorialweb");
$menu = mysql_query("SELECT * FROM menu ORDER BY menu_id ASC");
while ($dataMenu = mysql_fetch_assoc($menu)) {
    $menu_id = $dataMenu['menu_id'];
    $submenu = mysql_query("SELECT * FROM submenu WHERE menu_id='$menu_id' ORDER BY submenu_id ASC");
    if (mysql_num_rows($submenu) == 0) {
        echo '<li><a href="' . $dataMenu['menu_link'] . '">' . $dataMenu['menu'] . '</a></li>';
    } else {
        echo '
							<li class="dropdown">
								<a href="' . $dataMenu['menu_link'] . '" class="dropdown-toggle" data-toggle="dropdown">' . $dataMenu['menu'] . ' <b class="caret"></b></a>
								<ul class="dropdown-menu">';
        while ($dataSubmenu = mysql_fetch_assoc($submenu)) {
            echo '<li><a href="' . $dataSubmenu['submenu_link'] . '">' . $dataSubmenu['submenu'] . '</a></li>';
        }
        echo '
								</ul>
							</li>
							';
    }
}
