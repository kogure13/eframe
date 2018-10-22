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
              <label for="no/tgl/agenda">No. Agenda</label>
              <?= $userUI->inputText("text", "input-sm form-control", "noagenda", "noagenda", "No. Agenda") ?>
            </div>
            <div class="col-sm-6">
              <label for="tgl/Agenda">Tanggal Agenda</label>
              <?= $userUI->inputText("text", "input-sm form-control tanggal", "tglagenda", "tglagenda", "Tgl. Agenda") ?>
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
              <label for="no/tgl/penugasaan">No. Penugasaan</label>
              <?= $userUI->inputText("text", "input-sm form-control", "notugas", "notugas", "No. Penugasan") ?>
            </div>
            <div class="col-sm-6">
              <label for="tgl/penugasaan">Tanggal Penugasaan</label>
              <?= $userUI->inputText("text", "input-sm form-control tanggal", "tgltugas", "tgltugas", "Tgl. Penugasan") ?>
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
              <label for="peran" id="peran">Isi Disposisi:</label>
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
        <label for="disposisi">Disposisi Kepada : <span id="errPeran"></span></label>
        <?= $satker->getPeranData() ?>
      </div>