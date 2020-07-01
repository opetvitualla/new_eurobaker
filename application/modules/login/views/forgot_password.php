<div class="preloader">
    <div class="loader">
        <div class="loader__figure"></div>
        <p class="loader__label">Euro Baker <span class="span_preloader">Please wait...</span></p>
    </div>
</div>
<div class="login_container">
    <div class="login_div_foget">
        <figure><img src="<?= base_url("assets/img/logo-text.png")?>" alt=""></figure>
        <form id="form_forgot_password" action="<?= base_url("login/forgot_password_process")?>" method="post">
            <div class="row">
                
                 <div class="col-md-12">
                    <input type="email" name="email" required placeholder="Enter Email Address" class="form-control">
                </div>
                <div class="col-md-12 mt-2">
                    <button class="btn btn-danger btn-login mt-2" type="submit">Submit</button>
                    <a class="fgpass" href="<?= base_url("login")?>">Login to your account</a>
                </div>
                    
            </div>
    </form>
    </div>
</div>
