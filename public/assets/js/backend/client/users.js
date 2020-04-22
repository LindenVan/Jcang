define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'client/users/index' + location.search,
                    add_url: 'client/users/add',
                    edit_url: 'client/users/edit',
                    del_url: 'client/users/del',
                    multi_url: 'client/users/multi',
                    table: 'users',
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
                        {field: 'user_key', title: __('User_key')},
                        {field: 'tel', title: __('Tel')},
                        {field: 'level', title: __('Level')},
                        {field: 'money', title: __('Money'), operate:'BETWEEN'},
                        {field: 'pending', title: __('Pending'), operate:'BETWEEN'},
                        {field: 'name', title: __('Name')},
                        {field: 'id_number', title: __('Id_number')},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'last_time', title: __('Last_time'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'status', title: __('Status')},
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