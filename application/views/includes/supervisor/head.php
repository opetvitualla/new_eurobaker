<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    
    <title>Euro Baker</title>
    <!-- Bootstrap Core CSS -->
    <link href="<?= base_url("assets/module/select2/dist/css/select2.min.css")?>" rel="stylesheet">
    <link href="<?= base_url("assets/module/bootstrap/css/bootstrap.min.css")?>" rel="stylesheet">
    <link href="<?= base_url("assets/module/bootstrap/css/datatable/datatable.css")?>" rel="stylesheet">
    <link href="<?= base_url("assets/module/bootstrap/css/datatable/datatable2.css")?>" rel="stylesheet">
    <link href="<?= base_url("assets/module/bootstrap/css/datatable/table_pages.css")?>" rel="stylesheet">
    <link href="<?= base_url("assets/module/perfect-scrollbar/dist/css/perfect-scrollbar.min.css")?>" rel="stylesheet">
    <link href="<?= base_url("assets/module/c3-master/c3.min.css")?>" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<?= base_url("assets/css/style2.css")?>" rel="stylesheet">
    <link href="<?= base_url("assets/css/pages/dashboard2.css")?>" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="<?= base_url("assets/css/color.css")?>" rel="stylesheet">
    <link href="<?= base_url("assets/css/my_style.css")?>" rel="stylesheet">
      <link rel="stylesheet" href="<?= base_url("assets/css/preloader.css")?>">
    <?php
      $this->current_class = $this->router->fetch_class();
      echo (_user_css($this->current_class))?"\t\t<link rel='stylesheet' href='".base_url('assets/css/'._user_css($this->current_class))."'>\n":'';
    ?>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

</head>

<body class="fix-header card-no-border fix-sidebar">
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
   <div class="preloader">
        <div class="loader">
            <div class="loader__figure"></div>
            <p class="loader__label">Euro Baker <span class="span_preloader">Please wait...</span></p>
        </div>
    </div>