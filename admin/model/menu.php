<?php

$db = new dbObj();
$connString = $db->getConstring();

$menu = new menu($connString);

//mysql_connect("localhost", "root", "root");
//mysql_select_db("tutorialweb");
//$menu = mysql_query("SELECT * FROM menu ORDER BY menu_id ASC");
//while ($dataMenu = mysql_fetch_assoc($menu)) {
//    $menu_id = $dataMenu['menu_id'];
//    $submenu = mysql_query("SELECT * FROM submenu WHERE menu_id='$menu_id' ORDER BY submenu_id ASC");
//    if (mysql_num_rows($submenu) == 0) {
//        echo '<li><a href="' . $dataMenu['menu_link'] . '">' . $dataMenu['menu'] . '</a></li>';
//    } else {
//        echo '
//							<li class="dropdown">
//								<a href="' . $dataMenu['menu_link'] . '" class="dropdown-toggle" data-toggle="dropdown">' . $dataMenu['menu'] . ' <b class="caret"></b></a>
//								<ul class="dropdown-menu">';
//        while ($dataSubmenu = mysql_fetch_assoc($submenu)) {
//            echo '<li><a href="' . $dataSubmenu['submenu_link'] . '">' . $dataSubmenu['submenu'] . '</a></li>';
//        }
//        echo '
//								</ul>
//							</li>
//							';
//    }
//}
?>


<div class="left side-menu">
    <div class="sidebar-inner slimscrollleft">
        <div class="user-details">
            <div class="pull-left">
                <img src="#" alt="" class="thumb-md img-circle">
            </div>
            <div class="user-info">
                <div class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Login username<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0)"><i class="md md-face-unlock"></i> Profile<div class="ripple-wrapper"></div></a></li>
                        <li><a href="javascript:void(0)"><i class="md md-settings"></i> Settings</a></li>
                        <li><a href="javascript:void(0)"><i class="md md-lock"></i> Lock screen</a></li>
                        <li><a href="javascript:void(0)"><i class="md md-settings-power"></i> Logout</a></li>
                    </ul>
                </div>
                <p class="text-muted m-0">role user</p>
            </div>
        </div>
        <!--- Divider -->
        <div id="sidebar-menu">
            <ul>
                <li class="text-muted menu-title">Navigation</li>
                <li>
                    <a href="?page=home" class="">
                        <i class="fa fa-dashboard"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="has-sub">
    <a href="#" class="">
        <i class="ti-agenda"></i>
        <span>Data Master</span>
        <span class="menu-arrow"></span>									
    </a>
    <ul class="list-unstyled">
        <li>
            <a href="#">Master user</a>
        </li>
        <li>
            <a href="#">Master peran</a>
        </li>
        <li>
            <a href="#">Master jabatan</a>
        </li>                        
        <li>
            <a href="#">Master golongan</a>
        </li>                
    </ul>
</li>
                <li>
                    <a href="?page=pemilih" class="">
                        <i class="fa fa-users"></i>
                        <span>Data Pemilih</span>
                    </a>
                </li>
                <li>
                    <a href="?page=laporan" class="">
                        <i class="fa fa-bar-chart-o"></i>
                        <span>Laporan</span>
                    </a>
                </li>
                <li class="text-muted menu-title">Data Master</li>
                <li>
                    <a href="?page=user" class="">
                        <i class="fa fa-users"></i>
                        <span>Master User</span>
                    </a>
                </li>                
            </ul>
        </div>
    </div>
</div>
