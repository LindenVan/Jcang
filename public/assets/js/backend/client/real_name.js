define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'client/real_name/index' + location.search,
                    add_url: 'client/real_name/add',
                    edit_url: 'client/real_name/edit',
                    del_url: 'client/real_name/del',
                    multi_url: 'client/real_name/multi',
                    table: 'real_name',
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
                        {field: 'id_key', title: __('Id_key')},
                        {field: 'tel', title: __('Tel')},
                        {field: 'user_key', title: __('User_key')},
                        {field: 'id_img', title: __('Id_img'),formatter:Table.api.formatter.images,operate:false},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange'},
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