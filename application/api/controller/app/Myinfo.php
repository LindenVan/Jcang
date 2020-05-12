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

    //实名认证
    public function realName(){
        $token = input('post.token');
        $id = $this->auth->parsingToken($token)['user_id'];
        $data = Db::table('users')->where("id=$id")->field('tel,user_key')->find();
        $data['username'] = input('post.name');
        $data['id_key'] = input('post.idcard');

        $front = request()->file('front');
        $reverse = request()->file('reverse');
        $file[] = $front;
        $file[] = $reverse;
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
//        return json_encode($data);
    }
    public function uploads($files)
    {
        // 获取表单上传文件
        $flag = 1;
        foreach ($files as $file) {
            // 移动到框架应用根目录/public/uploads/ 目录下
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
            if (!$info){
                $flag = 0;
            }
            $data[] = '/uploads/' . $info->getSaveName();
        }
        $url = implode(',', $data);
        $url = str_replace("\\","/",$url);
        if ($flag) {
            return $url;
        } else {
            return false;
        }
    }
}