<div class="row">
  <div class="col-sm-12">
    <div class="card-box">

      <h4 class="page-title">Kompilasi Hasil Audit</h4>
      <h5 class="page-title-alt m-t-5"><?= company_name ?></h5>

      <form>
        <div class="input-group">
          <?=$userUI->inputText("text", "input-sm form-control", "cari", "cari", "Silakan Pilih")?>
          <div class="input-group-btn">
            <?=$vSearch=$userUI->closeTags("i", "fa fa-search fa-fw", "", "")?>
            <?=$vprint=$userUI->closeTags("i", "fa fa-print fa-fw", "", "")?>
            <?=$vprint.=" Cetak"?>
            <?=$userUI->pushBtn("submit", "btn btn-sm btn-default", "e", $vSearch)?>
            <?=$userUI->pushBtn("submit", "btn btn-sm btn-danger", "e", $vprint)?>
          </div>
        </div>
      </form>

    </div>
  </div>
</div>