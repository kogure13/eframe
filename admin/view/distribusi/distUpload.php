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
        <label for="disposisi">Disposisi Kepada : <span id="errPeranU"></span></label>
        <?= $satker->getPeranData() ?>
      </div>