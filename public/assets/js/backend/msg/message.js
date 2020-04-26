define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'msg/message/index' + location.search,
                    add_url: 'msg/message/add',
                    edit_url: 'msg/message/edit',
                    del_url: 'msg/message/del',
                    multi_url: 'msg/message/multi',
                    table: 'message',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'username', title: __('Username')},
                        {field: 'user_key', title: __('User_key')},
                        {field: 'user_tel', title: __('User_tel')},
                        // {field: 'comment', title: __('Comment')},
                        {field: 'comment', title: __('Comment'), formatter: function(value){return value.toString().substr(0, 20)}},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'tel', title: __('Tel')},
                        {field: 'key', title: __('Key')},
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