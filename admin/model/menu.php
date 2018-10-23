
<div class="left side-menu">
  <div class="sidebar-inner slimscrollleft">
    <!--- Divider -->
    <div id="sidebar-menu">
      <ul>
        <li class="text-muted menu-title">Navigation</li>
        <li>
          <a href="?page=home">
            <i class="fa fa-dashboard"></i>
            <span>Dashboard</span>
          </a>
        </li>
        <?php if (isset($_SESSION['eaudit_user'])) { ?>
          <li style="display: <?= ($_SESSION['role'] == 2) ? 'block' : 'none' ?>">
            <a href="?page=kompetensi">
              <i class="ti-bar-chart"></i>
              <span>Peta Kompetensi</span>
            </a>
          </li>
          <li>
            <a href="?page=distribusi">
              <i class="ti-exchange-vertical"></i>
              <span>Distribusi</span>
            </a>
          </li>
          <?php if($_SESSION['role'] == 2) { ?> 
          <li>
            <a href="?page=sop">
              <i class="ti-reload"></i>
              <span>Lembar SOP</span>
            </a>
          </li>
          <li>
            <a href="?page=haudit">
              <i class="ti-files"></i>
              <span>Hasil Audit</span>
            </a>
          </li>  
            <?php }?>
          
          <?php if ($_SESSION['role'] == 1) { ?>
            <li>
              <a href="?page=kompilasi">
                <i class="ti-package"></i>
                <span>Kompilasi</span>
              </a>
            </li>
            <li>
              <a href="?page=pbisnis">
                <i class="ti-reload"></i>
                <span>Upload SOP</span>
              </a>
            </li>
            <li class="has-sub">
              <a href="#">
                <i class="fa fa-users"></i>
                <span>Karyawan</span>
                <span class="menu-arrow"></span>
              </a>
              <ul class="list-unstyled">
                <li>
                  <a href="?page=dkaryawan">Data Karyawan</a>
                </li>
                <li>
                  <a href="?page=dkompetensi">Data Kompetensi</a>
                </li>
              </ul>
            </li>
          <?php } ?>
          <li class="text-muted menu-title">Data Master</li>
          <?php if ($_SESSION['role'] == 1) { ?>
            <li>
              <a href="?page=user">
                <i class="ti-user"></i>
                <span>Master User</span>
              </a>
            </li>
            <li class="has-sub">
              <a href="#">
                <i class="ti-user"></i>
                <span>Master Karyawan</span>
                <span class="menu-arrow"></span>
              </a>
              <ul class="list-unstyled">
                <li>
                  <a href="?page=jabatan">Master jabatan</a>
                </li>
                <li>
                  <a href="?page=golongan">Master golongan</a>
                </li>
              </ul>
            </li>
            <li>
              <a href="?page=ktemuan">
                <i class="ti-ruler-alt"></i>
                <span>Kode Temuan</span>
              </a>
            </li>
            <li class="has-sub">
              <a href="#">
                <i class="ti-dashboard"></i>
                <span>Master Beranda</span>
                <span class="menu-arrow"></span>
              </a>
              <ul class="list-unstyled">
                <li>
                  <a href="?page=pengumuman">Pengumuman</a>
                </li>
                <li>
                  <a href="?page=berita">Berita</a>
                </li>
                <li>
                  <a href="?page=sambutan">Kata Sambutan</a>
                </li>
                <li>
                  <a href="?page=foto">Foto Kegiatan</a>
                </li>
                <li>
                  <a href="?page=carousel">Carousel</a>
                </li>
              </ul>
            </li>
          <?php } ?>
          <?php if ($_SESSION['role'] == 2) { ?>
            <li>
              <a href="?page=artikel">
                <i class="ti-files"></i>
                <span>Artikel</span>
              </a>
            </li>
          <?php } ?>
        <?php } else { ?>
          <li>
            <a href="?page=login">
              <i class="fa fa-sign-in"></i>
              <span>Login</span>
            </a>
          </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>
