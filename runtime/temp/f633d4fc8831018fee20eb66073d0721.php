<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:88:"E:\phpStudy\PHPTutorial\WWW\jiacang\public/../application/admin\view\goods\good\add.html";i:1588838164;s:78:"E:\phpStudy\PHPTutorial\WWW\jiacang\application\admin\view\layout\default.html";i:1588746048;s:75:"E:\phpStudy\PHPTutorial\WWW\jiacang\application\admin\view\common\meta.html";i:1583049507;s:77:"E:\phpStudy\PHPTutorial\WWW\jiacang\application\admin\view\common\script.html";i:1583049507;}*/ ?>
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
                                <form id="add-form" class="form-horizontal" role="form" data-toggle="validator" method="POST" action="">

    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Title'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-title" class="form-control" name="row[title]" type="text">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Details'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-details" class="form-control" name="row[details]" type="text">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Class'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <select id="c-class" class="form-control selectpicker" name="row[class]">
                <?php if(is_array($classList) || $classList instanceof \think\Collection || $classList instanceof \think\Paginator): if( count($classList)==0 ) : echo "" ;else: foreach($classList as $key=>$v): ?>
                    <option value="<?php echo $v['id']; ?>" <?php if(in_array(($key), explode(',',"1"))): ?>selected<?php endif; ?>><?php echo $v['name']; ?></option>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Price'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-price" class="form-control" step="0.01" name="row[price]" type="number">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Goods_image'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <div class="input-group">
                <input id="c-goods_image" class="form-control" size="50" name="row[goods_image]" type="text">
                <div class="input-group-addon no-border no-padding">
                    <span><button type="button" id="plupload-goods_image" class="btn btn-danger plupload" data-input-id="c-goods_image" data-mimetype="image/gif,image/jpeg,image/png,image/jpg,image/bmp" data-multiple="false" data-preview-id="p-goods_image"><i class="fa fa-upload"></i> <?php echo __('Upload'); ?></button></span>
                    <span><button type="button" id="fachoose-goods_image" class="btn btn-primary fachoose" data-input-id="c-goods_image" data-mimetype="image/*" data-multiple="false"><i class="fa fa-list"></i> <?php echo __('Choose'); ?></button></span>
                </div>
                <span class="msg-box n-right" for="c-goods_image"></span>
            </div>
            <ul class="row list-inline plupload-preview" id="p-goods_image"></ul>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Num'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-num" class="form-control" name="row[num]" type="number">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Tel'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-tel" class="form-control" name="row[tel]" type="text">
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('User_key'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-user_key" class="form-control" name="row[user_key]" type="text">
        </div>
    </div>

            <input id="c-create_time" class="form-control datetimepicker" data-date-format="YYYY-MM-DD HH:mm:ss" data-use-current="true" name="row[create_time]" type="hidden" value="<?php echo date('Y-m-d H:i:s'); ?>">
            <input id="c-status" value="0" class="form-control" name="row[status]" type="hidden">

    <div class="form-group">
        <label class="control-label col-xs-12 col-sm-2"><?php echo __('Comment'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <textarea id="c-comment" class="form-control " rows="5" name="row[comment]" cols="50"></textarea>
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