
<div class="row table-distribusi">
  <div class="col-sm-12">
    <div class="card-box">
      <div class="form-group" style="display: <?= ($_SESSION['role'] == 1) ? 'block' : 'none' ?>">
        <div class="btn-group">
          <button type="button" class="btn btn-sm btn-primary">
            <i class="fa fa-plus"></i>
          </button>
          <button id="btn_add_distribusi" class="btn btn-sm btn-primary">
            <span id="btn_add_dist_val"></span>
          </button>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-12 col-sm-12">
          <ul class="nav nav-tabs navtab-bg">
            <li class="active" style="display: <?= ($_SESSION['role'] == 1) ? 'block' : 'none' ?>">
              <a href="#1" data-toggle="tab" aria-expanded="true">
                <span class="visible-xs"></span>
                <span class="hidden-xs">Terkirim</span>
              </a>
            </li>
            <li style="display: <?= ($_SESSION['role'] == 2) ? 'block' : 'none' ?>">
              <a href="#3" data-toggle="tab" aria-expanded="true">
                <span class="visible-xs"></span>
                <span class="hidden-xs">Diterima</span>
              </a>
            </li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane <?= ($_SESSION['role'] == 1) ? 'active' : '' ?>" id="1">
              <?php include_once 'distribusi/tabTerkirim.php'; ?>
            </div>
            <div class="tab-pane <?= ($_SESSION['role'] == 2) ? 'active' : '' ?>" id="3">
              <?php include_once 'distribusi/tabTerima.php'; ?>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="card-box add-disposisi-form" style="display: none;">
  <h4 class="page-title">Lembar Disposisi</h4>
  <h5 class="page-title-alt m-t-5"><?= company_name ?></h5>

  <div class="row">
    <form id="form_iaudit" name="form_iaudit" novalidate="novalidate">
      <input type="hidden" value="iadd" name="action" id="action_iaudit">
      <input type="hidden" value="0" name="edit_id" id="edit_id_iaudit">
      <?php include_once 'distribusi/distForm.php'; ?>
    </form>
  </div>
</div>

<div class="card-box add-disposisi-upload" style="display: none;">
  <h4 class="page-title">Lembar Disposisi</h4>
  <h5 class="page-title-alt m-t-5"><?= company_name ?></h5>

  <div class="row">
    <form id="form_uaudit" name="form_uaudit" novalidate="novalidate">
      <input type="hidden" value="uadd" name="action" id="action_uaudit">
      <input type="hidden" value="0" name="edit_id" id="edit_id_uaudit">
      <?php include_once 'distribusi/distUpload.php'; ?>
    </form>
  </div>
</div>
