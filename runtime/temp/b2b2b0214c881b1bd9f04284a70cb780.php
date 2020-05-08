<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:92:"E:\phpStudy\PHPTutorial\WWW\jiacang\public/../application/admin\view\order\voreder\edit.html";i:1587891363;s:78:"E:\phpStudy\PHPTutorial\WWW\jiacang\application\admin\view\layout\default.html";i:1588746048;s:75:"E:\phpStudy\PHPTutorial\WWW\jiacang\application\admin\view\common\meta.html";i:1583049507;s:77:"E:\phpStudy\PHPTutorial\WWW\jiacang\application\admin\view\common\script.html";i:1583049507;}*/ ?>
<!DOCTYPE html>
<html lang="<?php echo $config['language']; ?>">
    <head>
        <meta charset="utf-8">
<title><?php echo (isset($title) && ($title !== '')?$title:''); ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="renderer" content="webkit">

<link rel="shortcut icon" href="/assets/img/favicon.ico" />
<!-- Loading Bootstrap -->
<link href="/assets/css/backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.css?v=<?php echo \think\Config::get('site.version'); ?>" rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
<!--[if lt IE 9]>
  <script src="/assets/js/html5shiv.js"></script>
  <script src="/assets/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
    var require = {
        config:  <?php echo json_encode($config); ?>
    };
</script>
    </head>

    <body class="inside-header inside-aside <?php echo defined('IS_DIALOG') && IS_DIALOG ? 'is-dialog' : ''; ?>">
        <div id="main" role="main">
            <div class="tab-content tab-addtabs">
                <div id="content">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <section class="content-header hide">
                                <h1>
                                    <?php echo __('Dashboard'); ?>
                                    <small><?php echo __('Control panel'); ?></small>
                                </h1>
                            </section>
                            <?php if(!IS_DIALOG && !\think\Config::get('fastadmin.multiplenav')): ?>
                            <!-- RIBBON -->
                            <div id="ribbon">
                                <!--<ol class="breadcrumb pull-left">-->
                                    <!--<li><a href="dashboard" class="addtabsit"><i class="fa fa-dashboard"></i> <?php echo __('Dashboard'); ?></a></li>-->
                                <!--</ol>-->
                                <ol class="breadcrumb pull-right">
                                    <?php foreach($breadcrumb as $vo): ?>
                                    <li><a href="javascript:;" data-url="<?php echo $vo['url']; ?>"><?php echo $vo['title']; ?></a></li>
                                    <?php endforeach; ?>
                                </ol>
                            </div>
                            <!-- END RIBBON -->
                            <?php endif; ?>
                            <div class="content">
                                <form id="edit-form" class="form-horizontal" role="form" data-toggle="validator" method="POST" action="">

    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Order_key'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-order_key" class="form-control" name="row[order_key]" type="text" value="<?php echo htmlentities($row['order_key']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Username'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-username" class="form-control" name="row[username]" type="text" value="<?php echo htmlentities($row['username']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('User_key'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-user_key" class="form-control" name="row[user_key]" type="text" value="<?php echo htmlentities($row['user_key']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('User_tel'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-user_tel" class="form-control" name="row[user_tel]" type="text" value="<?php echo htmlentities($row['user_tel']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Last_level'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-last_level" class="form-control" name="row[last_level]" type="number" value="<?php echo htmlentities($row['last_level']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Shop_level'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-shop_level" class="form-control" name="row[shop_level]" type="number" value="<?php echo htmlentities($row['shop_level']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Pay_price'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-pay_price" class="form-control" step="0.01" name="row[pay_price]" type="number" value="<?php echo htmlentities($row['pay_price']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Pay_mode'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-pay_mode" class="form-control" name="row[pay_mode]" type="number" value="<?php echo htmlentities($row['pay_mode']); ?>">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Pay_time'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-pay_time" class="form-control datetimepicker" data-date-format="YYYY-MM-DD HH:mm:ss" data-use-current="true" name="row[pay_time]" type="text" value="<?php echo $row['pay_time']; ?>">
        </div>
    </div>
    <div class="form-group layer-footer">
        <label class="control-label col-xs-12 col-sm-2"></label>
        <div class="col-xs-12 col-sm-8">
            <button type="submit" class="btn btn-success btn-embossed disabled"><?php echo __('OK'); ?></button>
            <button type="reset" class="btn btn-default btn-embossed"><?php echo __('Reset'); ?></button>
        </div>
    </div>
</form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/assets/js/require<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js" data-main="/assets/js/require-backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js?v=<?php echo htmlentities($site['version']); ?>"></script>
    </body>
</html>