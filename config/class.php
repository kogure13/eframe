<?php

class dbObj {

  var $DB_Host = "localhost"; //koneksi localhost
  var $DB_Name = "db_itjen"; //nama database
  var $DB_User = "root"; //user database
  var $DB_Pass = "1234"; //password database

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
    $sifat = new distribusi($connString);

    if (!isset($_GET['page'])) {
      $url = "view/home.php";
      include_once $url;
    } else {
      $pages = htmlentities($_GET['page']);
      $page_root = "view/" . $pages . ".php";

      if (file_exists($page_root)) {
        include_once $page_root;
      } elseif ($_GET['page'] == "login") {
        echo '<meta http-equiv="refresh" content="0; url=\'model/login/index.php\'">';
        //header("location: model/login/");
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
    $db = new dbObj();
    $connString = $db->getConstring();
    $user = new user($connString);
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
    $sqlTot .= "LEFT OUTER JOIN master_karyawan ON master_user.id_karyawan = master_karyawan.id";

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

      $nestedData[] = $act->editLink($row['id']);
      $nestedData[] = $row['username'];
      $nestedData[] = $row['nama'];
      $nestedData[] = $this->role($row['role']);

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

  function role($data) {
    switch ($data) {
      case '1' : return $role = 'Admin';
        break;
      case '2' : return $role = 'Pegawai';
        break;
    }
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
    $sql = "SELECT * FROM master_peran WHERE id = '" . $id . "'";
    $query = mysqli_query($this->conn, $sql) or die();

    $row = mysqli_fetch_array($query);
    return $row['peran'];
  }

  public function getPeranData() {
    $userUI = new userUI($this->conn);
    $peran = new peran($this->conn);
    $sql = "SELECT * FROM master_peran";
    $query = mysqli_query($this->conn, $sql) or die();

    echo '<div class="row">';
    while ($row = mysqli_fetch_assoc($query)) {
      echo '<div class="col-sm-6">';
      echo $userUI->rdck("checkbox", "idkelompok", $row['id'], "idkelompok");
      echo $row['peran'];
      echo '<ol>';
      echo $this->peranKelompok($row['id']);
      echo '</ol>';
      echo '</div>';
    }
    echo '</div>';
  }

  public function peranKelompok($id) {
    //$data = [];
    $sql = "SELECT * FROM kelompok_peran WHERE id_peran = '" . $id . "'";
    $query = mysqli_query($this->conn, $sql) or die;

    while ($row = mysqli_fetch_assoc($query)) {
      echo '<li>' . $row['keterangan'] . '</li>';
    }

    //echo json_encode($data);
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

  function dtKaryawan($id) {
    $json_data = [];
    $sql = "SELECT * FROM master_karyawan";
    $sql .= " WHERE id = ".$id;

    $query = mysqli_query($this->conn, $sql) or die('error to fecth data');
    while ($row = mysqli_fetch_assoc($query)) {
      $json_data = $row;
    }
    echo json_encode($json_data);
  }

}//end class karyawan
//end class master karyawan

class distribusi {

  protected $conn;
  protected $data = [];

  public function sifat() {

    $sifat_distribusi = array(
        "Rahasia" => "Rahasia",
        "Penting" => "penting",
        "Biasa" => "Biasa",
        "Segera" => "Segera",
        "Sangat Segera" => "Sangat Segera"
    );

    foreach ($sifat_distribusi as $key => $value) {
      echo '<option value="'.$value.'">'.$key.'</option>';
    }
  }

}//end class distribusi

class home {
  protected $conn;
  protected $data = [];
  
  function __construct($connString) {
    $this->conn = $connString;
  }

  public function getKata($params) {
    $sql = "SELECT * FROM master_kata_pengantar";
    $result = mysqli_query($this->conn, $sql) or die('error to kata pengantar');
    $row = mysqli_fetch_assoc($result);
    
    return $row['kata'];
  }
  
  public function getPengumuman($params) {
    $sql = "SELECT * FROM master_pengumuman";
    $result = mysqli_query($this->conn, $sql) or die('error fetch pengumuman');
    while ($row = mysqli_fetch_assoc($result)) {
      $data[] = $row;
    }
    
    return $data;
  }
}//end class home

class sambutan {

  protected $conn;
  protected $data = [];

  function __construct($connString) {
    $this->conn = $connString;
  }

  function getData() {
    $sql = "SELECT * FROM master_kata_pengantar";
    $result = mysqli_query($this->conn, $sql) or die('error to fetch sambutan');
    while ($row = mysqli_fetch_assoc($result)) {
      $data = $row;
    }
    echo json_encode($data);
  }
  
  function insertData($params) {
    $sql = "UPDATE master_kata_pengantar SET";
    $sql .= " kata = '".  addslashes($params['textSambutan'])."'";
    $result = mysqli_query($this->conn, $sql) or die('error update data');
    echo 1;
  }

}//end class sambutan

class pengumuman {
  protected $ccnn;
  protected $data = [];
  
  function __construct($connString) {
    $this->conn = $connString;
  }
  
  function getData($req, $col) {
    $this->data = $this->getRecords($req, $col);
    echo json_encode($this->data);
  }
  
  function getRecords($req, $col) {
    $sqlTot = "SELECT * ";
    $sqlTot .= "FROM master_pengumuman ";

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
      $nestedData[] = NULL;
      $nestedData[] = $row['judul'];
      $nestedData[] = $row['pengumuman'];
      $nestedData[] = $row['createddate'];
      $nestedData[] = $row['modifieddate'];      

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
}//end class pengumuman

class read {
  protected $conn;
  protected $data = [];
  
  function __construct($connString) {
    $this->conn = $connString;
  }
  
  public function readPg($id) {
    $sql = "SELECT id, judul, pengumuman AS content, createddate AS tgl ";
    $sql .= " FROM master_pengumuman";
    $sql .= " WHERE id = '".$id."'";
    
    $result = mysqli_query($this->conn, $sql) or die('error fetch read pengumuman');
    while ($row = mysqli_fetch_assoc($result)) {
      $data = $row;
    }
    
    echo json_encode($data);
  }
}//end class read artikel/pengumuman

?>
