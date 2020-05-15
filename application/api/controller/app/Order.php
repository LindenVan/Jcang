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

class Order extends Api
{
    protected $noNeedLogin = '';
    protected $noNeedRight = '*';

    //获取订单列表
    public function getOrder(){
        $token = input('token');
        $statu = input('status');
        $key = $this->auth->parsingToken($token)['user_key'];
        if ($statu == 'all'){
            $order = Db::table('order')
                ->where('buyer_key','=',"$key")
                ->select();
            if (!$order){
                $this->error('没有相关订单');
            }
            $this->success('获取订单成功',$order);
            die();
        }
        $order = Db::table('order')
            ->where('buyer_key','=',"$key")
            ->where('logistics_status','=',"$statu")
            ->select();
        if (!$order){
            $this->error('没有相关订单',$order);
        }
        $this->success('获取订单成功',$order);
        die();
    }
}