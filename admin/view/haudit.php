
<div class="row haudit-table">
  <div class="col-sm-12">
    <div class="card-box">
      <div class="form-group pull-right" style="display: block;">
        <div class="btn-group">
          <button type="button" class="btn btn-sm btn-primary">
            <i class="fa fa-plus"></i>
          </button>
          <button id="btn_add" class="btn btn-sm btn-primary">                    
            <span id="btn_add_val"></span>
          </button>
        </div>                
      </div>

      <h4 class="page-title">Laporan Hasil Audit</h4>
      <h5 class="page-title-alt m-t-5"><?= company_name ?></h5>      

      <table id="lookup"
             class="table table-striped table-bordered dt-responsive nowrap" 
             cellspacing="0" width="100%">
        <thead>
          <tr>
            <th class="nosort" width="40px">Action</th>
            <th>Nama Audit</th><th>Nama Obrik</th>
          </tr>
        </thead>
        <tbody></tbody>
      </table>
    </div>
  </div>
</div>

<div class="row haudit-form" style="display: none;">
  <div class="col-sm-12">
    <div class="card-box">      
      <h4 class="page-title">Form Laporan Hasil Audit</h4>
      <h5 class="page-title-alt m-t-5"><?= company_name ?></h5>
      <div class="row">
        <div class="col-sm-4">
          <div class="form-group">
            <label for="nama audit">Nama Audit</label>
            <?=$userUI->inputText("text", "input-sm form-control", "namaAudit", "namaAudit", "Nama Audit")?>
          </div>
        </div>
        <div class="col-sm-4">
          <div class="form-group">
            <label for="nama obrik">Nama Obrik</label>
            <?=$userUI->inputText("text", "input-sm form-control", "namaObrik", "namaObrik", "Nama Obrik")?>
          </div>
        </div>
        <div class="col-sm-2">
          <div class="form-group">
            <label for="masa audit">Masa Audit</label>
            <?=$userUI->inputText("text", "input-sm form-control", "masaAudit", "masaAudit", "Masa Audit")?>
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="col-sm-4">
          <div class="form-group">
            <label for="dana audit">Dana yang diaudit</label>
            <?=$userUI->inputText("text", "input-sm form-control", "dana", "dana", "Dana Audit")?>
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="col-sm-4">
          <div class="form-group">
            <label for="nomor dipa">Nomor Dipa</label>
            <?=$userUI->inputText("text", "input-sm form-control", "noDipa", "noDipa", "No Dipa")?>
          </div>
        </div>
        <div class="col-sm-4">
          <div class="form-group">
            <label for="alokasi dana dipa">Alokasi Dana Dipa</label>
            <?=$userUI->inputText("text", "input-sm form-control", "alokasi", "alokasi", "Alokasi Dana Dipa")?>
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="col-sm-6">
          <div class="form-group">
            <label for="realisasi">realisasi</label>
            <?=$userUI->inputText("text", "input-sm form-control", "realisasi", "realisasi", "Realisasi")?>
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="col-sm-4">
          <div class="form-group">
            <label for="pengendali">Pengendali Teknis</label>
            <select name="pengendali" class="input-sm form-control">
              <option value="">Pengendali Teknis</option>
            </select>
          </div>
        </div>
        <div class="col-sm-4">
          <div class="form-group">
            <label for="ketua team">Ketua Team</label>
            <select name="ketuateam" class="input-sm form-control">
              <option value="">Ketua Team</option>
            </select>
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="col-sm-12">
          <div id="jsGridHaudit"></div>
        </div>
      </div>
      
      <div class="modal-footer">
        <div class="">
          <button type="button" id="btn_cancel" class="btn btn-sm btn-danger" data-dismiss="modal">Close</button>
          <button type="submit" id="btn_save" class="btn btn-sm btn-primary">Save</button>
        </div>
      </div>
    </div>
  </div>
</div>