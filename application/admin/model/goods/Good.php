<?php

namespace app\admin\model\goods;

use think\Model;
use think\DB;


class Good extends Model
{

    

    

    // 表名
    protected $table = 'goods';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [

    ];
    public function classList(){
        $list = Db::table('class')->select();
        $arr = [];
        foreach ($list as $key =>$val){
            $id = $val['class_id'];
            $name = $val['class_name'];
            $arr[] = ['id'=>$id,'name'=>$name];
        }
        return $arr;
    }
    public function statusList(){
        return ['0'=>'待审核','1'=>'已审核','2'=>'审核未通过'];
    }
    

    







}
