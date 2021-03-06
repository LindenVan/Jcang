<?php

namespace app\admin\controller\finance;

use app\common\controller\Backend;
use think\DB;

/**
 * 
 *
 * @icon fa fa-circle-o
 */
class Withdrawals extends Backend
{
    
    /**
     * Withdrawals模型对象
     * @var \app\admin\model\finance\Withdrawals
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\finance\Withdrawals;

    }
    public function pass($ids = null){
        $flag = DB::table('Withdrawals')->where('wdr_id','=',$ids)->setField('status','1');
        if (!$flag){
            $this->error('操作失败');
            die();
        }
        $this->success('操作成功');
    }
    public function refuse($ids = null){
        $flag = DB::table('Withdrawals')->where('wdr_id','=',$ids)->setField('status','2');
        if (!$flag){
            $this->error('操作失败');
            die();
        }
        $this->success('操作成功');
    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */
    

}
