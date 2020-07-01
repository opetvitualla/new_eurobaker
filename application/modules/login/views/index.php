<div class="preloader">
    <div class="loader">
        <div class="loader__figure"></div>
        <p class="loader__label">Euro Baker <span class="span_preloader">Please wait...</span></p>
    </div>
</div>
<div class="login_container">
    
    <div class="login_div">
        <figure><img src="<?= base_url("assets/img/logo-text.png")?>" alt=""></figure>
        <form id="frm_login"  method="POST" action="<?= base_url()."login/login_process";?>">
         <div class="row">
                 <div class="col-md-12">
                    <input type="text" value="<?= (isset($_POST['username']) ? $_POST["username"] : '');?>" required placeholder="Enter Username" name="username" class="form-control">
                </div>
                <div class="col-md-12 mt-2">
                    <input name="password" required placeholder="Enter Password" type="password" class="form-control">
                    <button class="btn btn-danger btn-login mt-2" type="submit">Login</button>
                    <a class="fgpass" href="<?= base_url("login/forgot_password")?>">Forgot Password</a>
                </div>
          
        </div>
         </form>
    </div>

</div>


