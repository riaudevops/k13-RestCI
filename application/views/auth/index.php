<div class="login-box">
    <div class="login-logo">
        <a href="<?= base_url() ?>"><b>K</b>13</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">Silahkan login untuk menggunakan aplikasi</p>
        <?= $this->session->flashdata('message') ?>
        <form action="<?= base_url('auth') ?>" method="post">
            <div class="form-group has-feedback">
                <input name="username" class="form-control" placeholder="Username">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input name="password" type="password" class="form-control" placeholder="Password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">

                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                </div>
                <!-- /.col -->
            </div>

        </form>
    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
