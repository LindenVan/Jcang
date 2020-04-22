define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'client/address/index' + location.search,
                    add_url: 'client/address/add',
                    edit_url: 'client/address/edit',
                    del_url: 'client/address/del',
                    multi_url: 'client/address/multi',
                    table: 'address',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'address_id',
                sortName: 'address_id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'address_id', title: __('Address_id')},
                        {field: 'address_key', title: __('Address_key')},
                        {field: 'address_name', title: __('Address_name')},
                        {field: 'user_tel', title: __('User_tel')},
                        {field: 'address_comment', title: __('Address_comment')},
                        {field: 'is_default', title: __('Is_default')},
                        {field: 'add_time', title: __('Add_time'), operate:'RANGE', addclass:'datetimerange'},
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