
<div class="row">
  <div class="col-sm-12">
    <div class="card-box">
      <div class="form-group">
        <div class="btn-group">
          <button type="button" class="btn btn-sm btn-primary">
            <i class="fa fa-plus"></i>
          </button>
          <button id="btn_add" class="btn btn-sm btn-primary">                    
            <span id="btn_add_val"></span>
          </button>
        </div>                
      </div>

      <table id="lookup"
             class="table table-striped table-bordered dt-responsive nowrap" 
             cellspacing="0" width="100%">
        <thead>
          <tr>
            <th class="nosort" width="40px">Action</th>
            <th>Penulis</th><th>Judul</th><th>Isi</th>
            <th>Tanggal Berita</th><th>Update Terakhir</th>
          </tr>
        </thead>
        <tbody></tbody>
      </table>
    </div>
  </div>
</div>

<div id="add_model" class="modal fade">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">            
      <div class="modal-header">                
        <h4 id="modal_title" class="modal-title"></h4>
      </div>
      <form id="form_model" name="form_model" novalidate="novalidate">
        <div class="modal-body">
          <input type="hidden" value="add" name="action" id="action">
          <input type="hidden" value="0" name="edit_id" id="edit_id">
          <input type="hidden" value="" name="penulis" id="penulis">
          <div class="form-group">
            <div class="row">
              <div class="col-sm-4">
                <label for="judul" class="control-label">Judul:</label>
                <?= $userUI->inputText("input", "input-sm form-control", "judul", "judul", "Judul Berita")
                ?>
              </div>              
            </div>                            
          </div>
          <div class="form-group">
            <div class="row">
              <div class="col-sm-12">
                <?= $userUI->closeTags("textarea", "", "textBerita", "textBerita") ?>
              </div>
            </div>              
          </div>
        </div>
        <div class="modal-footer">
          <div class="">
            <button type="button" id="btn_cancel" class="btn btn-sm btn-danger" data-dismiss="modal">Close</button>
            <button type="submit" id="btn_add" class="btn btn-sm btn-primary">Save</button>
          </div>                        
        </div>
      </form>
    </div>
  </div>
</div>
