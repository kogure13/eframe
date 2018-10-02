<?php
$userUI = new userUI();
?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
    <meta name="author" content="Coderthemes">

    <link rel="shortcut icon" href="assets/images/favicon_1.ico">

    <title>e-Auditor - Login</title>

    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/core.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/components.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/pages.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/responsive.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <script src="assets/js/modernizr.min.js"></script>

  </head>
  <body>

    <div class="account-pages"></div>
    <div class="clearfix"></div>
    <div class="wrapper-page">
      <div class=" card-box">
        <div class="row">
          <div class="col-sm-3">
            <img src="../assets/images/logo_twh.png" class="media-object" style="width: 100%;">
          </div>
          <div class="col-sm-9">
            <h3 class="media-heading"> Sign In Form <?= apps_title ?></h3>
            <h4 style="margin-bottom: 2px;"><?= apps_name ?></h4>
            <h5 style="margin-top: 2px;"><?= company_name ?></h5>
          </div>
        </div>

        <div class="panel-body">
          <form class="form-horizontal m-t-20" id="login" name="login">

            <div class="form-group ">
              <div class="col-xs-12">
                <?php echo $userUI->inputText("text", "input-sm form-control", "username", "username", "Username"); ?>
              </div>
            </div>

            <div class="form-group">
              <div class="col-xs-12">
                <?php echo $userUI->inputText("password", "input-sm form-control", "password", "password", "Password"); ?>
              </div>
            </div>


            <div class="form-group text-center m-t-40">
              <div class="col-xs-12">
                <button class="btn btn-primary btn-block text-uppercase" type="submit">Log In</button>
              </div>
            </div>
          </form> 
        </div>   
      </div>                              
    </div>

    <script>
      var resizefunc = [];
    </script>

    <!-- jQuery  -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/detect.js"></script>
    <script src="assets/js/fastclick.js"></script>
    <script src="assets/js/jquery.slimscroll.js"></script>
    <script src="assets/js/jquery.blockUI.js"></script>
    <script src="assets/js/waves.js"></script>
    <script src="assets/js/wow.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>


    <script src="assets/js/jquery.core.js"></script>
    <script src="assets/js/jquery.app.js"></script>
    <script src="application/login/script.js"></script>
  </body>
</html>
