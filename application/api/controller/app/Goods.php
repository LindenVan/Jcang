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

class Goods extends Api
{
    protected $noNeedLogin = '';
    protected $noNeedRight = '*';

    //我的商品展示
    public function myGoods(){
        $token = input("post.token");
        $id = $this->auth->parsingToken($token)['user_id'];
        $data = Db::table("users")->where("id","=","$id")
            ->alias('a')->join(['goods' => 'g'],"a.user_key = g.user_key")
            ->field('g.goods_id,g.title,g.goods_image,g.price,g.create_time,g.status')->select();
        if (!$data){
            $this->error('拉取商品失败');
        }
        foreach ($data as $key => $val){
            $data[$key]['goods_image'] = explode(",",$val['goods_image'])['0'];
        }
        $this->success("成功",$data);
    }
    public function addGoods(){
        $data = input("post.");
        $file = request()->file('file')?request()->file('file'):0;
        if (in_array("",$data)||!$file){
            $this->error("有数据为空");
        }

        $token = $data['token'];
        unset($data['token']);
        $data['user_key'] = $key = $this->auth->parsingToken($token)['user_key'];
        $id = $this->auth->parsingToken($token)['user_id'];
        $data['tel'] = Db::table('users')
            ->where('id','=',"$id")
            ->value('tel');
        $data['create_time'] = date("Y-m-d H:i:s");
        $data['goods_image'] = $this->uploads($file);
        $class = $data['class'];

        try {

            Db::startTrans();

            //将数据1存入表1，并获取ID:
            $re['t1'] = Db::table('goods')
                ->data($data)->insert();

            //将数据2写入表2
            $re['t2'] = Db::table('class')
                ->where("class_id","=","$class")
                ->setInc('have_num');

            //任意一个表写入失败都会抛出异常：
            if (in_array('0', $re)) {
                throw new Exception('操作失败');
            }

            Db::commit();
            $this->success('操作成功');

        } catch (Exception $e) {
            Db::rollback();
            $this->error($e);

        }

    }
}