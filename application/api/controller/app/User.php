<?php

namespace app\api\controller\app;

use app\common\controller\Api;
use app\common\library\Ems;
use app\common\library\Sms;
use fast\Random;
use think\Db;
use think\Validate;


/**
 * 用户接口模块
 */
class User extends Api
{
    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';

    public function _initialize()
    {
        parent::_initialize();
    }
    public function uniquetel(){
        $tel = input('tel');
        if (empty($tel)){
            $this->error('不能为空');die();
        }
        $flag = Db::table('users')->where('tel','=',"$tel")->find();
        if ($flag){
            $this->error('改手机号已被注册');die();
        }
        $this->success('success');
    }

    /**
     * 注册接口
     * @param string $tel 手机号
     * @param string $password 密码
     */
    public function signup(){
        $data = input('param.');
        $tel = $data['tel'];
        $data['password'] = md5($data['password']);
        $data['create_time'] = date('Y-m-d H:i:s');
        //校验数据
        if (!$data['password'] || !$data['tel']) {
            $this->error("无效的数据");
        }
        //是否被注册
        $flag = Db::table('users')->where('tel','=',"$tel")->find();
        if ($flag){
            $this->error('改手机号已被注册');die();
        }
        $data['user_key'] = uniqid(rand(1000,9999));
        $flag = DB::table('users')->data($data)->insert();
        if (!$flag){
            $this->error("注册失败");
            die();
        }
        $this->success("注册成功");
    }

    /**
     * 登录接口
     * @param string $tel 手机号
     * @param string $password 密码
     */
    public function login()
    {
        $tel = $this->request->request('tel');
        $password = $this->request->request('password');

        if (!$tel || !$password) {
            $this->error(__('Invalid parameters'));
        }
        $ret = $this->auth->login($tel, $password);
        if ($ret) {
            $data = ['userinfo' => $this->auth->getUserinfo()];
            $this->success(__('Logged in successful'), $data);
        } else {
            $this->error($this->auth->getError());
        }
    }

}
