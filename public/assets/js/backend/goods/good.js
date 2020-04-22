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
                        {field: 'goods_id', title: __('Goods_id')},
                        {field: 'title', title: __('Title')},
                        {field: 'class', title: __('Class')},
                        {field: 'price', title: __('Price'), operate:'BETWEEN'},
                        {field: 'num', title: __('Num')},
                        {field: 'browse', title: __('Browse')},
                        {field: 'collect', title: __('Collect')},
                        {field: 'tel', title: __('Tel')},
                        {field: 'user_key', title: __('User_key')},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'comment', title: __('Comment')},
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