<?php

namespace app\admin\controller\client;

use app\common\controller\Backend;
use think\DB;

/**
 * 
 *
 * @icon fa fa-circle-o
 */
class RealName extends Backend
{
    
    /**
     * RealName模型对象
     * @var \app\admin\model\client\RealName
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\client\RealName;

    }

    public function pass($ids = null){
        $data = DB::table('real_name')->where('id','=',$ids)
            ->field('id_key,username,user_key')->find();
        $save['name'] = $data['username'];
        $save['id_number'] = $data['id_key'];
        $key = $data['user_key'];

        try {

            Db::startTrans();

            //将数据1存入表1，并获取ID:
            $re['t1'] = DB::table('users')
                ->where("user_key",'=',$key)
                ->update($save);

            //将数据2写入表2
            $re['t2'] = DB::table('real_name')
                ->where('id','=',$ids)
                ->setField('status','1');

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
    public function refuse($ids = null){
        $flag = DB::table('real_name')->where('id','=',$ids)->setField('status','2');
        if (!$flag){
            $this->error('操作失败');
            die();
        }
        $this->success('操作成功');
    }
    

    

}
