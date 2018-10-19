
<div class="row table-distribusi">
  <div class="col-sm-12">
    <div class="card-box">
      <div class="form-group" style="display: <?= ($_SESSION['role'] == 1) ? 'block' : 'none' ?>">
        <div class="btn-group">
          <button type="button" class="btn btn-sm btn-primary">
            <i class="fa fa-plus"></i>
          </button>
          <button id="btn_add_distribusi" class="btn btn-sm btn-primary">
            <span id="btn_add_dist_val"></span>
          </button>
          <button type="button" class="btn btn-sm btn-success">
            <i class="fa fa-upload"></i>
          </button>
          <button id="btn_upload_dist" class="btn btn-sm btn-success">
            <span id="btn_upload_dist_val"></span>
          </button>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-12 col-sm-12">
          <ul class="nav nav-tabs navtab-bg">
            <li class="active" style="display: <?= ($_SESSION['role'] == 1) ? 'block' : 'none' ?>">
              <a href="#1" data-toggle="tab" aria-expanded="true">
                <span class="visible-xs"></span>
                <span class="hidden-xs">Terkirim</span>
              </a>
            </li>
            <li style="display: <?= ($_SESSION['role'] == 1) ? 'block' : 'none' ?>">
              <a href="#2" data-toggle="tab" aria-expanded="true">
                <span class="visible-xs"></span>
                <span class="hidden-xs">Upload</span>
              </a>
            </li>
            <li style="display: <?= ($_SESSION['role'] == 2) ? 'block' : 'none' ?>">
              <a href="#3" data-toggle="tab" aria-expanded="true">
                <span class="visible-xs"></span>
                <span class="hidden-xs">Diterima</span>
              </a>
            </li>
            <li style="display: <?= ($_SESSION['role'] == 2) ? 'block' : 'none' ?>">
              <a href="#4" data-toggle="tab" aria-expanded="true">
                <span class="visible-xs"></span>
                <span class="hidden-xs">Download</span>
              </a>
            </li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane <?= ($_SESSION['role'] == 1) ? 'active' : '' ?>" id="1">
              <?php include_once 'distribusi/tabTerkirim.php';?>
            </div>
            <div class="tab-pane" id="2">
              <?php include_once 'distribusi/tabUpload.php';?>
            </div>
            <div class="tab-pane <?= ($_SESSION['role'] == 2) ? 'active' : '' ?>" id="3">
              <?php include_once 'distribusi/tabTerima.php';?>
            </div>
            <div class="tab-pane" id="4">
              <?php include_once 'distribusi/tabDownload.php';?>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="card-box add-disposisi-form" style="display: none;">
  <h4 class="page-title">Lembar Disposisi</h4>
  <h5 class="page-title-alt m-t-5"><?= company_name ?></h5>

  <div class="row">
    <form id="form_iaudit" name="form_iaudit" novalidate="novalidate">
      <div class="col-sm-6">
        <div class="form-group">`
          <div class="row">
            <div class="col-sm-5">
              <label for="sifat distribusi">Sifat Distribusi</label>
              <select name="sifat" class="input-sm form-control">
                <option value="">Sifat Distribusi</option>
                <?= $sifat->sifat() ?>
              </select>
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="row">
            <div class="col-sm-6">
              <label for="no/tgl/agenda">No/Tgl Agenda</label>
              <?= $userUI->inputText("text", "input-sm form-control", "notgl", "notgl", "No/Tgl/Agenda") ?>
            </div>
            <div class="col-sm-6">
              <label for="tgl/Agenda">Tanggal Agenda</label>
              <?= $userUI->inputText("text", "input-sm form-control", "tglagenda", "tglagenda", "Tgl. Agenda") ?>
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="row">
            <div class="col-sm-12">
              <label for="perihal">Perihal</label>
              <?= $userUI->inputText("text", "input-sm form-control", "perihal", "perihal", "Perihal") ?>
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="row">
            <div class="col-sm-6">
              <label for="no/tgl/penugasaan">No/Tgl Penugasaan</label>
              <?= $userUI->inputText("text", "input-sm form-control", "notgl", "notgl", "No/Tgl/Agenda") ?>
            </div>
            <div class="col-sm-6">
              <label for="tgl/penugasaan">Tanggal Penugasaan</label>
              <?= $userUI->inputText("text", "input-sm form-control", "tgltugas", "tgltugas", "Tgl. Penugasaan") ?>
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="row">
            <div class="col-sm-12">
              <label for="asal">AsaL</label>
              <?= $userUI->inputText("text", "input-sm form-control", "asal", "asal", "") ?>
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="row">
            <div class="col-sm-12">
              <label for="pesan">Isi Disposisi:</label>
              <?= $userUI->closeTags("textarea", "input-sm form-control", "pesan", "pesan") ?>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <div class="">
            <button type="button" id="btn_cancel_iaudit" class="btn btn-sm btn-danger btn-cancel" 
                    form-name="form_iaudit" data-dismiss="modal">Close</button>
            <button type="submit" id="btn_add_iaudit" class="btn btn-sm btn-primary">Save</button>
          </div>
        </div>
      </div>

      <div class="col-sm-6">
        <label for="disposisi">Disposisi Kepada :</label>
        <?= $satker->getPeranData() ?>
      </div>

    </form>
  </div>
</div>

<div class="card-box add-disposisi-upload" style="display: none;">
  <h4 class="page-title">Lembar Disposisi</h4>
  <h5 class="page-title-alt m-t-5"><?= company_name ?></h5>

  <div class="row">
    <form id="form_uaudit" name="form_uaudit" novalidate="novalidate">
      <div class="col-sm-6">
        <div class="row">
          <div class="col-sm-6">
            <div class="form-group">
              <label for="pengirim">Pengirim</label>
              <?= $userUI->inputText("text", "input-sm form-control", "pengirim", "pengirim", "Pengirim") ?>
            </div>

          </div>
        </div>
        <div class="row">
          <div class="col-sm-6">
            <div class="form-group">
              <label for="nama beras">Nama File</label>
              <?= $userUI->inputText("text", "input-sm form-control", "namafile", "namafile", "Nama File") ?>
            </div>

            <div class="form-group">
              <?= $userUI->inputText("file", "", "xfiles", "xfiles", "") ?>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <div class="">
            <button type="button" id="btn_cancel_uaudit" class="btn btn-sm btn-danger btn-cancel" 
                    form-name="form_uaudit" data-dismiss="modal">Close</button>
            <button type="submit" id="btn_add_uaudit" class="btn btn-sm btn-primary">Save</button>
          </div>
        </div>
      </div>

      <div class="col-sm-6">
        <label for="disposisi">Disposisi Kepada :</label>
        <?= $satker->getPeranData() ?>
      </div>
    </form>
  </div>
</div>
