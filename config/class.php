<?php
class dbObj {

  var $DB_Host = "localhost"; //koneksi localhost
  // var $DB_Host = "192.168.0.128"; //koneksi ip\domain
  var $DB_Name = "db_itjen"; //nama database
  var $DB_User = "root"; //user database
  var $DB_Pass = ""; //password database
  // var $DB_Pass = "password"; //password database
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
    $db = new dbObj();
    $connString = $db->getConstring();
    
    $userUI = new userUI($connString);
    $satker = new peran($connString);

    if (!isset($_GET['page'])) {
      $url = "view/home.php";
      include_once $url;
    } else {
      $pages = htmlentities($_GET['page']);
      $page_root = "view/" . $pages . ".php";

      if (file_exists($page_root)) {
        include_once $page_root;
      } elseif ($_GET['page'] == "login") {
        header("location: model/login/");
      } elseif ($_GET['page'] == "logout") {               
        $userUI->logout();
      } else {
        include_once 'model/404.php';
      }
    }
  }

  function page_title($page) {
    return $page;
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
    } else {
      $page = "home";
      $actRoot = "application/" . $page . "/script.js";
    }

    echo '<script src="' . $actRoot . '"></script>';
  }

}//end class Main

class userUI {

  function logout() {
    session_destroy();
    echo '<meta http-equiv="refresh" content="0;url=index.php" >';
  }

  public function centerDIV($obj) {
    echo '<div align="center">';
    foreach ($obj as $data) {
      echo $data;
    }
    echo '</div>';
  }

  public function inputText($type, $class, $idname, $name, $placeholder) {
    return '<input type="' . $type . '" class="' . $class . '" '
            . 'id="' . $idname . '" name="' . $name . '"'
            . 'placeholder="' . $placeholder . '" />';
  }
  
  public function rdck($type, $idname, $val, $name) {
    return '<input type="' . $type . '" '
            . 'id="' . $idname . '" name="' . $name . '"'
            . 'value="' . $val . '" />';
  }

  public function closeTags($tags, $class, $idname, $name) {
    return '<' . $tags . ' class="' . $class . '" id="' . $idname . '" '
            . 'name="' . $name . '"></' . $tags . '>';
  }

  public function pushBtn($type, $class, $idname, $val) {
    return '<button type="' . $type . '" class="' . $class . '" '
            . 'id="' . $idname . '">' . $val . '</button>';
  }

  public function editLink($id) {
    return '<a href="#" id="' . $id . '" class="act_btn" data-original-title="Edit">'
            . '<i class="fa fa-edit fa-fw"></i>'
            . '</a>';
  }

  public function deleteLink($id) {
    return '<a href="#" id="' . $id . '" class="act_btn" data-original-title="Delete">'
            . '<i class="fa fa-delete fa-fw"></i>'
            . '</a>';
  }

  public function detailLink($id) {
    return '<a href="#" id="' . $id . '" class="act_btn" data-original-title="Detail">'
            . '<i class="fa fa-detail fa-fw"></i>'
            . '</a>';
  }

}//end class userUI

class user {

  protected $conn;
  protected $data = [];

  function __construct($connString) {
    $this->conn = $connString;
  }

  public function getData($req, $col) {
    $this->data = $this->getRecords($req, $col);
    echo json_encode($this->data);
  }

  function getRecords($req, $col) {

    $sqlTot = "SELECT master_user.id, username, nama, role ";
    $sqlTot .= "FROM master_user ";
    $sqlTot .= "JOIN master_karyawan ON master_user.id_karyawan = master_karyawan.id";

    $sql = $sqlTot;

    $qTot = mysqli_query($this->conn, $sqlTot) or die("error fetch data: ");

    $totalData = mysqli_num_rows($qTot);
    $totalFiltered = $totalData;

    if (!empty($req['search']['value'])) {
      $sql .= " WHERE username LIKE '%" . $req['search']['value'] . "%' ";
      $sql .= " OR nama LIKE '%" . $req['search']['value'] . "%' ";

      $query = mysqli_query($this->conn, $sql) or die("ajax-grid-data.php: get PO");
      $totalFiltered = mysqli_num_rows($query);
      $sql .=" ORDER BY " . $col[$req['order'][0]['column']] . " " .
              $req['order'][0]['dir'] . " LIMIT " . $req['start'] . " ," . $req['length'] . " ";
      $query = mysqli_query($this->conn, $sql) or die("ajax-grid-data.php: get PO");
    } else {
      $sql .=" ORDER BY " . $col[$req['order'][0]['column']] . " 
            " . $req['order'][0]['dir'] . " LIMIT " . $req['start'] . " ,
            " . $req['length'] . " ";
      $query = mysqli_query($this->conn, $sql) or die("ajax-grid-data.php: get PO");
    }

    $act = new userUI($this->conn);

    while ($row = mysqli_fetch_assoc($query)) {
      $nestedData = [];
      $role = '';

      switch ($row['role']) {
        case '1' : $role = 'Admin';
          break;
        case '2' : $role = 'Pegawai';
          break;
      }

      $nestedData[] = $act->editLink($row['id']);
      $nestedData[] = $row['username'];
      $nestedData[] = $row['nama'];
      $nestedData[] = $role;

      $data[] = $nestedData;
    }
    if ($totalData > 0) {
      $json_data = array(
          "draw" => intval($req['draw']),
          "recordsTotal" => intval($totalData),
          "recordsFiltered" => intval($totalFiltered),
          "data" => $data
      );
    } else {
      $json_data = array(
          "draw" => 0,
          "recordsTotal" => 0,
          "recordsFiltered" => 0,
          "data" => []
      );
    }
    return $json_data;
  }

}//end class user

//class master karyawan
class jabatan {

  protected $conn;
  protected $data = [];

  function __construct($connString) {
    $this->conn = $connString;
  }

  public function getData($req, $col) {
    $this->data = $this->getRecords($req, $col);
    echo json_encode($this->data);
  }

  function getRecords($req, $col) {

    $sqlTot = "SELECT * ";
    $sqlTot .= "FROM master_jabatan ";

    $sql = $sqlTot;

    $qTot = mysqli_query($this->conn, $sqlTot) or die("error fetch data: ");

    $totalData = mysqli_num_rows($qTot);
    $totalFiltered = $totalData;

    if (!empty($req['search']['value'])) {
      $sql .= " WHERE jabatan LIKE '%" . $req['search']['value'] . "%' ";

      $query = mysqli_query($this->conn, $sql) or die("ajax-grid-data.php: get PO");
      $totalFiltered = mysqli_num_rows($query);
      $sql .=" ORDER BY " . $col[$req['order'][0]['column']] . " " .
              $req['order'][0]['dir'] . " LIMIT " . $req['start'] . " ," . $req['length'] . " ";
      $query = mysqli_query($this->conn, $sql) or die("ajax-grid-data.php: get PO");
    } else {
      $sql .=" ORDER BY " . $col[$req['order'][0]['column']] . " 
            " . $req['order'][0]['dir'] . " LIMIT " . $req['start'] . " ,
            " . $req['length'] . " ";
      $query = mysqli_query($this->conn, $sql) or die("ajax-grid-data.php: get PO");
    }

    $act = new userUI($this->conn);

    while ($row = mysqli_fetch_assoc($query)) {
      $nestedData = [];

      $nestedData[] = $act->editLink($row['id']);
      $nestedData[] = $row['jabatan'];

      $data[] = $nestedData;
    }
    if ($totalData > 0) {
      $json_data = array(
          "draw" => intval($req['draw']),
          "recordsTotal" => intval($totalData),
          "recordsFiltered" => intval($totalFiltered),
          "data" => $data
      );
    } else {
      $json_data = array(
          "draw" => 0,
          "recordsTotal" => 0,
          "recordsFiltered" => 0,
          "data" => []
      );
    }
    return $json_data;
  }

  public function getJabatan($id) {
    $sql = "SELECT * FROM master_jabatan WHERE id = '" . $id . "'";
    $query = mysqli_query($this->conn, $sql) or die();

    $row = mysqli_fetch_array($query);
    return $row['jabatan'];
  }

}//end class jabatan

class golongan {

  protected $conn;
  protected $data = [];

  function __construct($connString) {
    $this->conn = $connString;
  }

  public function getData($req, $col) {
    $this->data = $this->getRecords($req, $col);
    echo json_encode($this->data);
  }

  function getRecords($req, $col) {

    $sqlTot = "SELECT * ";
    $sqlTot .= "FROM master_golongan ";

    $sql = $sqlTot;

    $qTot = mysqli_query($this->conn, $sqlTot) or die("error fetch data: ");

    $totalData = mysqli_num_rows($qTot);
    $totalFiltered = $totalData;

    if (!empty($req['search']['value'])) {
      $sql .= " WHERE golongan LIKE '%" . $req['search']['value'] . "%' ";

      $query = mysqli_query($this->conn, $sql) or die("ajax-grid-data.php: get PO");
      $totalFiltered = mysqli_num_rows($query);
      $sql .=" ORDER BY " . $col[$req['order'][0]['column']] . " " .
              $req['order'][0]['dir'] . " LIMIT " . $req['start'] . " ," . $req['length'] . " ";
      $query = mysqli_query($this->conn, $sql) or die("ajax-grid-data.php: get PO");
    } else {
      $sql .=" ORDER BY " . $col[$req['order'][0]['column']] . " 
            " . $req['order'][0]['dir'] . " LIMIT " . $req['start'] . " ,
            " . $req['length'] . " ";
      $query = mysqli_query($this->conn, $sql) or die("ajax-grid-data.php: get PO");
    }

    $act = new userUI($this->conn);

    while ($row = mysqli_fetch_assoc($query)) {
      $nestedData = [];

      $nestedData[] = $act->editLink($row['id']);
      $nestedData[] = $row['golongan'];

      $data[] = $nestedData;
    }
    if ($totalData > 0) {
      $json_data = array(
          "draw" => intval($req['draw']),
          "recordsTotal" => intval($totalData),
          "recordsFiltered" => intval($totalFiltered),
          "data" => $data
      );
    } else {
      $json_data = array(
          "draw" => 0,
          "recordsTotal" => 0,
          "recordsFiltered" => 0,
          "data" => []
      );
    }
    return $json_data;
  }

  public function getGolongan($id) {
    $sql = "SELECT * FROM master_golongan WHERE id = '" . $id . "'";
    $query = mysqli_query($this->conn, $sql) or die();

    $row = mysqli_fetch_array($query);
    return $row['golongan'];
  }

}//end class golongan

class peran {

  protected $conn;
  protected $data = [];

  function __construct($connString) {
    $this->conn = $connString;
  }

  public function getData($req, $col) {
    $this->data = $this->getRecords($req, $col);
    echo json_encode($this->data);
  }

  function getRecords($req, $col) {

    $sqlTot = "SELECT * ";
    $sqlTot .= "FROM master_peran ";

    $sql = $sqlTot;

    $qTot = mysqli_query($this->conn, $sqlTot) or die("error fetch data: ");

    $totalData = mysqli_num_rows($qTot);
    $totalFiltered = $totalData;

    if (!empty($req['search']['value'])) {
      $sql .= " WHERE peran LIKE '%" . $req['search']['value'] . "%' ";

      $query = mysqli_query($this->conn, $sql) or die("ajax-grid-data.php: get PO");
      $totalFiltered = mysqli_num_rows($query);
      $sql .=" ORDER BY " . $col[$req['order'][0]['column']] . " " .
              $req['order'][0]['dir'] . " LIMIT " . $req['start'] . " ," . $req['length'] . " ";
      $query = mysqli_query($this->conn, $sql) or die("ajax-grid-data.php: get PO");
    } else {
      $sql .=" ORDER BY " . $col[$req['order'][0]['column']] . " 
            " . $req['order'][0]['dir'] . " LIMIT " . $req['start'] . " ,
            " . $req['length'] . " ";
      $query = mysqli_query($this->conn, $sql) or die("ajax-grid-data.php: get PO");
    }

    $act = new userUI($this->conn);

    while ($row = mysqli_fetch_assoc($query)) {
      $nestedData = [];

      $nestedData[] = $act->editLink($row['id']);
      $nestedData[] = $row['peran'];

      $data[] = $nestedData;
    }
    if ($totalData > 0) {
      $json_data = array(
          "draw" => intval($req['draw']),
          "recordsTotal" => intval($totalData),
          "recordsFiltered" => intval($totalFiltered),
          "data" => $data
      );
    } else {
      $json_data = array(
          "draw" => 0,
          "recordsTotal" => 0,
          "recordsFiltered" => 0,
          "data" => []
      );
    }
    return $json_data;
  }

  public function getPeran($id) {
    $sql = "SELECT * FROM master_peran WHERE id = '".$id."'";
    $query = mysqli_query($this->conn, $sql) or die();
    
    $row = mysqli_fetch_array($query);
    return $row['peran'];
  }
  
  public function getAllData() {
    $sql = "SELECT * FROM master_peran";
    $query = mysqli_query($this->conn, $sql) or die();
    
    while ($row = mysqli_fetch_assoc($query)) {
      echo $row['peran'];
      echo ' ';
    }
  }

}//end class peran

class karyawan {

  protected $conn;
  protected $data = [];

  function __construct($connString) {
    $this->conn = $connString;
  }

  public function getData($req, $col) {
    $this->data = $this->getRecords($req, $col);
    echo json_encode($this->data);
  }

  function getRecords($req, $col) {

    $sqlTot = "SELECT * ";
    $sqlTot .= "FROM master_karyawan ";

    $sql = $sqlTot;

    $qTot = mysqli_query($this->conn, $sqlTot) or die("error fetch data: ");

    $totalData = mysqli_num_rows($qTot);
    $totalFiltered = $totalData;

    if (!empty($req['search']['value'])) {
      $sql .= " WHERE nama LIKE '%" . $req['search']['value'] . "%' ";
      $sql .= " OR nip LIKE '%" . $req['search']['value'] . "%'";

      $query = mysqli_query($this->conn, $sql) or die("ajax-grid-data.php: get PO");
      $totalFiltered = mysqli_num_rows($query);
      $sql .=" ORDER BY " . $col[$req['order'][0]['column']] . " " .
              $req['order'][0]['dir'] . " LIMIT " . $req['start'] . " ," . $req['length'] . " ";
      $query = mysqli_query($this->conn, $sql) or die("ajax-grid-data.php: get PO");
    } else {
      $sql .=" ORDER BY " . $col[$req['order'][0]['column']] . " 
            " . $req['order'][0]['dir'] . " LIMIT " . $req['start'] . " ,
            " . $req['length'] . " ";
      $query = mysqli_query($this->conn, $sql) or die("ajax-grid-data.php: get PO");
    }

    $act = new userUI($this->conn);
    $jabatan = new jabatan($this->conn);
    $golongan = new golongan($this->conn);
    $peran = new peran($this->conn);

    while ($row = mysqli_fetch_assoc($query)) {
      $nestedData = [];

      $nestedData[] = $act->editLink($row['id']);
      $nestedData[] = $row['nip'];
      $nestedData[] = $row['nama'];
      $nestedData[] = $jabatan->getJabatan($row['id_jabatan']);
      $nestedData[] = $golongan->getGolongan($row['id_golongan']);
      $nestedData[] = $row['alamat'];
      $nestedData[] = $row['tlp'];
      $nestedData[] = $peran->getPeran($row['id_peran']);
      $nestedData[] = $row['is_kordinator'];

      $data[] = $nestedData;
    }
    if ($totalData > 0) {
      $json_data = array(
          "draw" => intval($req['draw']),
          "recordsTotal" => intval($totalData),
          "recordsFiltered" => intval($totalFiltered),
          "data" => $data
      );
    } else {
      $json_data = array(
          "draw" => 0,
          "recordsTotal" => 0,
          "recordsFiltered" => 0,
          "data" => []
      );
    }
    return $json_data;
  }

}//end class karyawan
//end class master karyawan

class distribusi {
  protected $conn;
  protected $data = [];    
}//end class distribusi
?>