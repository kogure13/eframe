
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
            <th>NIP</th><th>Nama Karyawan</th><th>Jabatan</th>
            <th>Golongan</th><th>Peran</th>
            <th>Alamat</th><th>Telepon</th>            
          </tr>
        </thead>
        <tbody></tbody>
      </table>
    </div>
  </div>
</div>

<div id="add_model" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">            
      <div class="modal-header">                
        <h4 id="modal_title" class="modal-title"></h4>
      </div>
      <form id="form_model" name="form_model" novalidate="novalidate">
        <div class="modal-body">
          <input type="hidden" value="add" name="action" id="action">
          <input type="hidden" value="0" name="edit_id" id="edit_id">
          <div class="form-group">
            <div class="row">
              <div class="col-sm-6">
                <label for="nip" class="control-label">NIP:</label>
                <?=
                $userUI->inputText("input", "input-sm form-control", "nip", "nip", "Input NIP")
                ?>
              </div>
              <div class="col-sm-6">
                <label for="nama" class="control-label">Nama Pegawai:</label>
                <?=
                $userUI->inputText("input", "input-sm form-control", "nama", "nama", "Nama Lengkap")
                ?>
              </div>
            </div>                            
          </div>                        
          <div class="form-group">
            <div class="row">
              <div class="col-sm-3">
                <label for="jabatan" class="control-label">Jabatan:</label>
                <select name="jabatan" id="jabatan" class="form-control input-sm">
                  <option value="">Jabatan</option>
                </select>
              </div>
              <div class="col-sm-3">
                <label for="golongan" class="control-label">Golongan:</label>
                <select name="golongan" id="golongan" class="form-control input-sm">
                  <option value="">Golongan<option>
                </select>
              </div>                            
            </div>                        
          </div>
          <div class="form-group">
            <div class="row">
              <div class="col-sm-3">
                <label for="telepon" class="control-label">Telepon:</label>
                <?= $userUI->inputText("input", "input-sm form-control", "tlp", "tlp", "No. Telepon")?>
              </div>
              <div class="col-sm-6">
                <label for="alamat" class="control-label">Alamat:</label>
                <?= $userUI->closeTags("textarea", "input-sm form-control", "alamat", "alamat")?>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="row">
              <div class="col-sm-3">
                <label for="peran" class="control-label">Peran:</label>
                <select name="peran" id="peran" class="form-control input-sm">
                  <option value="">Peran</option>
                </select>
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
