<div class="row">
  <div class="col-lg-12">
    <div class="card-box" style="min-height: 700px">
      <div class="container">
        <div class="row">
          <div class="col-lg-2"></div>
          <div class="col-lg-7">
            <div class="media m-b-0">
              <div class="media-left">
                <a href="#">
                  <img src="../assets/images/logo_twh.png" class="media-object" alt="64x64" style="width: 64px; height: 64px;">
                </a>
              </div>
              <div class="media-body text-center">
                <h4 class="media-heading text-uppercase">
                  <?= kop_title1 ?><br/><?= kop_title2 ?><br/><?= kop_title3 ?>
                </h4>
              </div>
              <div class="media-right" style="width: 64px; height: 64px;"></div>
            </div>
          </div>
          <div class="col-lg-3"></div>
        </div>

        <div class="panel panel-border panel-inverse m-t-0">
          <div class="panel-heading text-center">
            <span class="text-uppercase m-t-5 m-b-5"
                  style="
                  font-weight: 600;
                  font-size: 12pt;
                  ">
              lembar disposisi
            </span>
          </div>
          <div class="panel-body">
            <table style="width: 100%">
              <tr>
                <td width="5%">Nomor</td><td width="1%">:</td><td id="noagenda" width="70%">
                  <?=$at['no_penugasaan']?>
                </td>
                <td width="10%">Tanggal</td><td>:</td><td id="tglagenda"><?=tanggal_indo($at['tgl_agenda'])?></td>
              </tr>
              <tr>
                <td>Perihal</td><td>:</td><td id="perihal"><?=$at['perihal']?></td>
              </tr>
              <tr>
                <td>Asal</td><td>:</td><td id="asal"><?=$at['asal']?></td>
              </tr>
              <tr>
                <td>Sifat</td><td>:</td><td id="sifat"><?=$at['sifat']?></td>
                <td>Untuk penugasaan</td><td>:</td><td id="tgltugas"><?=tanggal_indo($at['tgl_penugasaan'])?></td>
              </tr>
            </table>
            <div id="isi_disposisi" class="m-t-20 text-justify">
              <?=$at['isi_disposisi']?>
            </div>
          </div>
        </div>        
      </div>
    </div>
  </div>
</div>