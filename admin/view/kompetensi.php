
<div class="row">
  <div class="col-lg-12 col-sm-12">
    <div class="card-box">
      <div class="pull-right" style="display: block;">
        <div class="row">
          <div class="col-sm-12 hidden-xs">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h4 class="panel-title" id="pkompetensi">
                  <?=strtoupper("Joko Sapto Pratolo, M.Si")?>                  
                </h4>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <h4 class="page-title">Lembar Pemantauan Kompetensi Auditor</h4>
      <h5 class="page-title-alt m-t-5"><?=company_name?></h5>
      
      <div class="row">
        <div class="col-lg-12 col-sm-12">
          <ul class="nav nav-tabs navtab-bg">
            <li class="active">
              <a href="#1" data-toggle="tab" aria-expanded="true">
                <span class="visible-xs"></span>
                <span class="hidden-xs">Kegiatan Audit</span>
              </a>
            </li>
            <li>
              <a href="#2" data-toggle="tab" aria-expanded="true">
                <span class="visible-xs"></span>
                <span class="hidden-xs">Kegiatan Pelayanan/Konsultasi</span>
              </a>
            </li>
            <li>
              <a href="#3" data-toggle="tab" aria-expanded="true">
                <span class="visible-xs"></span>
                <span class="hidden-xs">Kegiatan Pelatihan</span>
              </a>
            </li>            
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="1">
              <?php include 'kompetensi/ksectionA.php';?>
            </div>
            <div class="tab-pane" id="2">
              <?php include 'kompetensi/ksectionB.php';?>
            </div>
            <div class="tab-pane" id="3">
              <div id="jsGrid"></div>
            </div>            
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
