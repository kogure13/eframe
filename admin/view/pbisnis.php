<div class="row">
  <div class="col-sm-12">
    <div class="card-box">


      <h4 class="page-title">Upload SOP</h4>
      <h5 class="page-title-alt m-t-5"><?= company_name ?></h5>


      <table id="lookup"
             class="table table-striped table-bordered dt-responsive nowrap" 
             cellspacing="0" width="100%">
        <thead>
          <tr>
            <th class="nosort" width="40px">Action</th>
            <th>Sub Main</th><th>Activities</th>
            <th>Prosedur</th><th>Nama</th>
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
                <label for="sub main" class="control-label">Sub Main:</label>
                <select name="" class="input-sm form-control">
                  <option value=""></option>
                </select>
              </div>
            </div>
          </div>

          <div class="form-group">
            <div class="row">
              <div class="col-sm-6">
                <label for="activities">Activities</label>
                <select name="" class="input-sm form-control">
                  <option value=""></option>
                </select>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <div class="row">
              <div class="col-sm-6">
                <label for="prosedur">Prosedur</label>
                <select name="" class="input-sm form-control">
                  <option value=""></option>
                </select>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <div class="row">
              <div class="col-sm-6">
                <label for="nama files">NAama SOP</label>
                <?= $userUI->inputText("text", "input-sm form-control", "namafiles", "namafiles", "") ?>
              </div>
            </div>
          </div>
          
          <div class="form-group">
            <div class="row">
              <div class="col-sm-6">
                <label for=""></label>
                <?= $userUI->inputText("file", "", "xfiles", "xfiles", "") ?>
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