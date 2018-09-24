
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
            <th>Username</th><th>Fullname</th><th>Hak Akses</th>
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
                <label for="username" class="control-label">Username:</label>
                <input type="text" class="form-control input-sm" 
                       id="username" name="username" placeholder="Input Username" />
              </div>
              <div class="col-sm-6">
                <label for="password" class="control-label">Password:</label>
                <input type="password" class="form-control input-sm" 
                       id="password" name="password" placeholder="Input Password" />
              </div>
            </div>                            
          </div>                        
          <div class="form-group">
            <div class="row">
              <div class="col-sm-3">
                <label for="role" class="control-label">Role:</label>
                <select name="role" id="role" class="form-control input-sm">
                  <option value="">Role User</option>
                  <option value="1">Admin</option>
                  <option value="2">Pegawai</option>                                    
                </select>
              </div>
              <div class="col-sm-5">
                <label for="nama_user" class="control-label">Full name:</label>                                
                <input type="text" class="form-control input-sm" 
                       id="fname" name="fname" placeholder="Input Full Name" 
                       readonly="readonly" />    
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
