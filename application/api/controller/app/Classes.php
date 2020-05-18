<?php

namespace app\api\controller\app;

use app\common\controller\Api;
use app\common\library\Ems;
use app\common\library\Sms;
use fast\Random;
use think\Db;
use think\Validate;


/**
 * 首页接口模块
 */


class Classes extends Api
{
    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';


    //分类数据
    public function classList(){
        $classList= Db::table('class')->field('class_id,class_name')->select();
        if (!$classList){
            $this->error('获取失败');die();
        }
        $this->success('获取成功',$classList);
    }

    //分类下的商品
    public function classGoods(){
        $id = input('get.id');
        $classGoods = Db::table('goods')->where('class','=',"$id")
            ->field('goods_id,title,goods_image')->select();
        if (!$classGoods){
            $this->error('获取失败');die();
        }
        $this->success('获取成功',$classGoods);
    }
}