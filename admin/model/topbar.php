
    <div class="topbar">
        <!-- LOGO -->
        <div class="topbar-left">
            <div class="text-center">
                <a href="index.php?page=home" class="logo">
                    <i class="fa fa-edit icon-c-logo"></i>
                    <span>
                      <img src="../assets/images/logo1.png" alt="<?=apps_title?>">
                    </span>
                </a>
            </div>
        </div>
        <!-- Button mobile view to collapse sidebar menu -->
        <div class="navbar navbar-default" role="navigation">
            <div class="container">
                <div class="">
                    <div class="pull-left">
                        <button class="button-menu-mobile open-left">
                            <i class="md md-menu"></i>
                        </button>
                        <span class="clearfix"></span>
                    </div>
                    <?php if(isset($_SESSION['eaudit_user'])) { ?>
                    <ul class="nav navbar-nav navbar-right pull-right">
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                          <?=$_SESSION['detail_user']?> (<span class="text-muted"><?=$user->role($_SESSION['role'])?></span>)
                          <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                          <li>
                            <a href="#">Profile</a>
                          </li>
                          <li>
                              <a href="?page=logout">logout</a>
                          </li>
                        </ul>
                      </li>
                    </ul>
                  <?php } ?>
                </div>
                <!--/.nav-collapse -->
            </div>
        </div>
    </div>
