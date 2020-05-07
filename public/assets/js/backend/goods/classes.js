define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'goods/classes/index' + location.search,
                    add_url: 'goods/classes/add',
                    multi_url: 'goods/classes/multi',
                    edit_url: 'goods/classes/edit',
                    del_url: 'goods/classes/del',
                    table: 'class',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'class_id',
                sortName: 'class_id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'class_id', title: __('Class_id')},
                        {field: 'class_name', title: __('Class_name')},
                        {field: 'have_num', title: __('Have_num')},
                        {field: 'cerate_time', title: __('Cerate_time'), operate:'RANGE', addclass:'datetimerange'},
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