define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'goods/good/index' + location.search,
                    add_url: 'goods/good/add',
                    edit_url: 'goods/good/edit',
                    del_url: 'goods/good/del',
                    multi_url: 'goods/good/multi',
                    table: 'goods',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'goods_id',
                sortName: 'goods_id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'goods_id', title: __('Goods_id'),operate:false},
                        {field: 'title', title: __('Title')},
                        {field: 'details', title: __('Details'),operate:false},
                        {field: 'class', title: __('Class'),
                            searchList:$.getJSON("goods/good/SearchList")
                        },
                        {field: 'price', title: __('Price'),operate:false},
                        {field: 'goods_image', title: __('Goods_image'),operate:false, events: Table.api.events.image, formatter: Table.api.formatter.image},
                        {field: 'num', title: __('Num'),operate:false},
                        {field: 'browse', title: __('Browse'),operate:false},
                        {field: 'collect', title: __('Collect'),operate:false},
                        {field: 'tel', title: __('Tel')},
                        {field: 'user_key', title: __('User_key'),operate:false},
                        {field: 'create_time', title: __('Create_time'),operate:false, addclass:'datetimerange'},
                        {field: 'status', title: __('Status'),
                            searchList: {"0": __('待审核'), "1": __('已审核'),"2":__('不通过')},

                            formatter:function(value){
                                if (value == 0) {
                                    return '待审核';
                                } else if (value == 1) {
                                    return '已审核';
                                } else if (value == 2) {
                                    return '审核不通过';
                                }
                            }
                        },
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});