<div class="row">
  <div class="col-sm-12">
    <div class="card-box">

      <h4 class="page-title">Kompilasi Hasil Audit</h4>
      <h5 class="page-title-alt m-t-5"><?= company_name ?></h5>

      <form class="form-inline" role="form">
        <div class="form-group">
          <div class="input-group">
            <?= $userUI->inputText("text", "input-sm form-control", "", "", "Kode Temuan") ?>
            <span class="input-group-btn">
              <?= $userUI->pushBtn("button", "btn btn-sm btn-primary", "cari", "<i class=\"fa fa-search fa-fw\"></i>") ?>
            </span>
          </div>
        </div>
        <div class="form-group">
          <?= $userUI->pushBtn("button", "btn btn-sm btn-default", "cetak", ""
                  . "<i class=\"fa fa-print fa-fw\"></i> Cetak") ?>
        </div>
      </form>

    </div>
  </div>
</div>