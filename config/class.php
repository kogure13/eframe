<?php
//databse object
class dbObj {
    // var $DB_Host = "localhost"; //koneksi localhost
    var $DB_Host = "192.168.0.128"; //koneksi ip\domain
    var $DB_Name = ""; //nama database
    var $DB_User = "root"; //user database
    // var $DB_Pass = ""; //password database
    var $DB_Pass = "password"; //password database
    var $conn;

    function getConstring() {
        $con = mysqli_connect($this->DB_Host, $this->DB_User, $this->DB_Pass, $this->DB_Name) or
                die("Connection failed: " . mysqli_connect_error());

        if (mysqli_connect_errno()) {
            printf("Connect failed: %s\n", mysqli_connect_error());
            exit();
        } else {
            $this->conn = $con;
        }

        return $this->conn;
    }
}//end class dbObj

class Main {

    function get_page() {
        if (!isset($_GET['page'])) {
            include_once 'view/home.php';
        } else {
            $pages = htmlentities($_GET['page']);
            $page_root = "view/" . $pages . ".php";

            if (file_exists($page_root)) {
                include_once $page_root;
            } elseif ($_GET['page'] == "ulogin") {
                header("location: model/login/");
            } elseif ($_GET['page'] == "logout") {
                $db = new dbObj();
                $connString = $db->getConstring();
                $user = new User($connString);
                $user->logout();
            } else {
                include_once 'model/404.php';
            }
        }
    }

    function get_head() {
        include_once 'model/head.php';
    }

    function get_topbar() {
        include_once 'model/topbar.php';
    }

    function get_footer() {
        include_once 'model/footer.php';
    }

    function get_menu() {
        include_once 'model/menu.php';
    }

    function get_login_page() {
        include_once 'model/login.php';
    }

    function getActScript() {
        if (isset($_GET['page'])) {
            $page = htmlentities($_GET['page']);
            $actRoot = "application/" . $page . "/script.js";

            echo '<script src="' . $actRoot . '"></script>';
        } else {
            $page = "home";
            $actRoot = "application/" . $page . "/script.js";

            echo '<script src="' . $actRoot . '"></script>';
        }
    }

}

class userUI {
    
    public function centerDIV($obj) {
        echo '<div align="center">';
        foreach ($obj as $data) {
            echo $data;
        }
        echo '</div>';
    }
    
    public function inputText($type, $class, $idname, $name) {
        return '<input type="'.$type.'" class="'.$class.'" id="'.$idname.'" name="'.$name.'" />';
    }
    
    public function areaText() {
        return '<textarea></textarea>';
    }

    public function pushBtn($type, $class, $idname, $val) {
        return '<button type="'.$type.'" class="'.$class.'" id="'.$idname.'">'.$val.'</button>';
    }        

    public function selectOption($class, $idname, $name) {
        return '<select class="'.$class.'" id="'.$idname.'" name="'.$name.'"></select>';
    }
    
}