
<div class="row">
  <div class="col-sm-12">
    <div class="card-box">
      <form id="form_model" name="form_model" method="post">
        <div class="modal-body">
          <input type="hidden" value="add" name="action" id="action">
          <input type="hidden" value="0" name="edit_id" id="edit_id">
          <input type="hidden" value="" name="penulis" id="penulis">
          <div class="form-group">
            <div class="row">
              <div class="col-sm-4">
                <label for="judul" class="control-label">Judul:</label>
                <?= $userUI->inputText("input", "input-sm form-control", "judul", "judul", "Judul Sambutan")
                ?>
              </div>              
            </div>                            
          </div>
          <div class="form-group">
            <div class="row">
              <div class="col-sm-12">
                <?= $userUI->closeTags("textarea", "", "textSambutan", "textSambutan") ?>
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