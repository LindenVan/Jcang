define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'finance/withdrawals/index' + location.search,
                    add_url: 'finance/withdrawals/add',
                    edit_url: 'finance/withdrawals/edit',
                    del_url: 'finance/withdrawals/del',
                    multi_url: 'finance/withdrawals/multi',
                    table: 'withdrawals',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'wdr_id',
                sortName: 'wdr_id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'wdr_id', title: __('Wdr_id')},
                        {field: 'user_name', title: __('User_name')},
                        {field: 'id_number', title: __('Id_number')},
                        {field: 'money', title: __('Money'), operate:'BETWEEN'},
                        {field: 'poundage', title: __('Poundage'), operate:'BETWEEN'},
                        {field: 'actual_money', title: __('Actual_money'), operate:'BETWEEN'},
                        {field: 'cash_account', title: __('Cash_account')},
                        {field: 'wdr_time', title: __('Wdr_time'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'tel', title: __('Tel')},
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