
<div class="row table-distribusi">
  <div class="col-sm-12">
    <div class="card-box">
      <div class="form-group">
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
            <li class="active">
              <a href="#1" data-toggle="tab" aria-expanded="true">
                <span class="visible-xs"></span>
                <span class="hidden-xs">Terkirim</span>
              </a>
            </li>
            <li>
              <a href="#2" data-toggle="tab" aria-expanded="true">
                <span class="visible-xs"></span>
                <span class="hidden-xs">Upload</span>
              </a>
            </li>
            <li>
              <a href="#3" data-toggle="tab" aria-expanded="true">
                <span class="visible-xs"></span>
                <span class="hidden-xs">Diterima</span>
              </a>
            </li>
            <li>
              <a href="#4" data-toggle="tab" aria-expanded="true">
                <span class="visible-xs"></span>
                <span class="hidden-xs">Download</span>
              </a>
            </li>            
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="1">
            </div>
            <div class="tab-pane" id="2">
            </div>
            <div class="tab-pane" id="3">              
            </div>
            <div class="tab-pane" id="4">              
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="card-box add-disposisi-form" style="display: block;">
  <h4 class="page-title">Lembar Disposisi</h4>
  <h5 class="page-title-alt m-t-5"><?= company_name ?></h5>

  <div class="row">
    <div class="col-sm-6">

      <div class="form-group">`
        <div class="row">
          <div class="col-sm-5">

            <label for="sifat distribusi">Sifat Distribusi</label>
            <select name="sifat" class="input-sm form-control">
              <option value="">Sifat Distribusi</option>
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

    </div>

    <div class="col-sm-6">
      <label for="disposisi">Disposisi Kepada :</label>
      <?= $satker->getAllData() ?>
    </div>
  </div>
</div>
