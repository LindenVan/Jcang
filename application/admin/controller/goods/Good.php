<?php

namespace app\admin\controller\goods;

use app\common\controller\Backend;
use think\DB;

/**
 * 
 *
 * @icon fa fa-circle-o
 */
class Good extends Backend
{
    
    /**
     * Good模型对象
     * @var \app\admin\model\goods\Good
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\goods\Good;
        $this->view->assign('statusList',$this->model->statusList());
        $this->view->assign('classList',$this->model->classList());
    }

    public function SearchList(){
//        $json = cache('source');
//        if ($json===false){
            $list = Db::table('class')->select();

            $arr = [];
            foreach ($list as $key =>$val){
                $id = $val['class_id'];
                $arr[$id] = $val['class_name'];
            }
            $json = json($arr);
//            cache('source',$json);
//        }
        return $json;
    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */
    

}
