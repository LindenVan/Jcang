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

class Index extends Api
{
    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';

    /**
     * 测试方法
     *
     * @ApiTitle    (首页)
     * @ApiMethod   (POST)
     * @ApiRoute    (/api/app/index/IndexData)sssss
     * @ApiReturn   ({
    'code':'1',
    'mesg':'返回成功',
    'data': {

    }
     * })
     */
    public function IndexData(){
        $banner = Db::table('banner')->where('is_index','=','1')
            ->field('image,url')->select();
        if (!$banner){
            $this->error('获取失败');die();
        }
        $goodsList = Db::table('goods')->where('status','=','1')
            ->orderRaw('rand()')->limit('4')
            ->field('goods_id,title,goods_image,price')->select();

        if (!$goodsList){
            $this->error('获取失败');die();
        }

        $NewGood = Db::table('goods')->where('status','=','1')
            ->order('create_time desc')->limit('4')
            ->field('goods_id,title,goods_image,price')->select();
        if (!$goodsList){
            $this->error('获取失败');die();
        }
        $Indexdata['banner'] = $banner;
        $Indexdata['goodsList'] = $goodsList;
        $Indexdata['newgood'] = $goodsList;
        $this->success('获取成功',$Indexdata);
    }

    public function recommend(){
        $goodsList = Db::table('goods')->where('status','=','1')
            ->orderRaw('rand()')->limit('4')
            ->field('goods_id,title,goods_image,price')->select();

        if (!$goodsList){
            $this->error('获取失败');die();
        }
        $this->success('获取成功',$goodsList);
    }

    public function test(){

        $token = input('token');
        $tok = $this->auth->test($token);
//        $data = Token::get($token);
        print_r($tok);
    }



}