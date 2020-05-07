<?php

namespace app\admin\model\client;

use think\Model;


class Address extends Model
{

    

    

    // 表名
    protected $table = 'address';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [

    ];

    public function getDefaultList(){
        return ['1'=>'是','0'=>'否'];
    }
    

    







}
