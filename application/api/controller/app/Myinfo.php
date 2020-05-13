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
     *
     * 提交实名认证
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

}