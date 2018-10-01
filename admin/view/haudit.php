
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

      <div class="modal-footer">
        <div class="">
          <button type="button" id="btn_cancel" class="btn btn-sm btn-danger" data-dismiss="modal">Close</button>
          <button type="submit" id="btn_save" class="btn btn-sm btn-primary">Save</button>
        </div>
      </div>
    </div>
  </div>