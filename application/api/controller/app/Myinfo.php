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

class Myinfo extends Api
{
    protected $noNeedLogin = '';
    protected $noNeedRight = '*';

    public function saveNickname(){
        $nickname = input('post.nickname');
        $unique = Db::table('users')->where('nickname','=',"$nickname")->find();
        if ($unique){
            $this->error('已被使用');
            die();
        }
        $token = input('post.token');
        $id = $this->auth->parsingToken($token)['user_id'];
        $savenickname = Db::table('users')->where('id','=',"$id")
            ->setField('nickname',"$nickname");
        if (!$savenickname){
            $this->error('昵称修改失败');
            die();
        }
        $this->success('昵称已修改');
    }

    public function u(){}

    /**
     * 提交实名认证
     *
     */
    public function realName(){
        $token = input('post.token');
        $id = $this->auth->parsingToken($token)['user_id'];
        $data = Db::table('users')->where("id=$id")->field('tel,user_key')->find();
        $user_key = $data['user_key'];
        $unique = Db::table("real_name")->where("user_key","=","$user_key")
            ->where("status","<>","2")->find();
        if ($unique){
            $this->error('已有验证');
            die();
        }
        $data['username'] = input('post.name');
        $data['id_key'] = input('post.idcard');
        $front = request()->file('front');
        $reverse = request()->file('reverse');
        $file[] = $front;$file[] = $reverse;
        $data['id_images'] = $img_flag = $this->uploads($file);
        $data['create_time'] = date('Y-m-d H:i:s');
        if (!$img_flag){
            $this->error('信息上传失败201');
            die();
        }
        $flag = Db::table('real_name')->data($data)->insert();

        if (!$flag){
            $this->error('信息上传失败202');
            die();
        }
        $this->success('上传成功待审核');
    }
    /*
     * 我的地址
     * get
     * token
     */
    public function myAddress(){
        $token = input('get.token');
        $key = $this->auth->parsingToken($token)['user_key'];
        $address = Db::table("address")
            ->where('address_key','=',"$key")
            ->order('is_default desc')->select();
        if (!$address){
            $this->error('未获取到地址');
            die();
        }
        $this->success('地址获取成功',$address);
    }

    /*
     * 地址详情
     * get
     * token,id
     */
    public function addressInfo(){
        $token = input('get.token');
        $id = input('get.id');
        $key = $this->auth->parsingToken($token)['user_key'];
        $address = Db::table("address")
            ->where('address_key','=',"$key")
            ->where('address_id','=',"$id'")->find();
        $temp = $address['addess_comment'];unset($address['addess_comment']);
        $temp = explode('-',$temp);
        $address['addess1'] = $temp['0'];//拆分出市区
        $address['addess2'] = $temp['1'];//拆分出地址
        if (!$address){
            $this->error('获取失败');
            die();
        }
        $this->success('获取成功',$address);
    }
    /*
     * 修改地址信息
     * post
     * token,address_name,user_tel,is_default,id,address[1],address[2]
     */
    public function saveAddress(){
        $data = input('post.');
        $token = $data['token'];unset($data['token']);
        $key = $this->auth->parsingToken($token)['user_key'];
        $id = $data['id'];unset($data['id']);
        $data['address_comment'] = implode('-',$data['address']);unset($data['address']);
//        $data['create_time'] = date('Y-m-d H:i:s');
        $save = Db::table('address')
            ->where("address_key","=","$key")
            ->where("address_id","=","$id")->update($data);
        if ($data['is_default']==1){
            Db::table('address')
                ->where("address_key","=","$key")
                ->where("address_id","<>","$id")
                ->setField('is_default','0');
        }
        if (!$save){
            $this->error('信息更改失败');die();
        }
        $this->success('修改成功');

    }

    /*
     * 新增地址信息
     * post
     * token,address_name,user_tel,is_default,id,address[1],address[2]
     */
    public function addAddress(){
        $data = input('post.');
        $token = $data['token'];unset($data['token']);
        $key = $this->auth->parsingToken($token)['user_key'];
        $data['address_comment'] = implode('-',$data['address']);unset($data['address']);
        $data['add_time'] = date('Y-m-d H:i:s');
        $save = Db::table('address')
            ->where("address_key","=","$key")
            ->insert($data);
        echo $save;die();
        if ($data['is_default']==1){
            Db::table('address')
                ->where("address_key","=","$key")
                ->where("address_id","<>","$save")
                ->setField('is_default','0');
        }
        if (!$save){
            $this->error('信息更改失败');die();
        }
        $this->success('修改成功');

    }

}