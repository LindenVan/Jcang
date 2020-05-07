define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'order/voreder/index' + location.search,
                    add_url: 'order/voreder/add',
                    edit_url: 'order/voreder/edit',
                    del_url: 'order/voreder/del',
                    multi_url: 'order/voreder/multi',
                    table: 'vorder',
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
                        {field: 'id', title: __('Id'),operate:false},
                        {field: 'order_key', title: __('Order_key')},
                        {field: 'username', title: __('Username'),operate:false},
                        {field: 'user_key', title: __('User_key')},
                        {field: 'user_tel', title: __('User_tel')},
                        {field: 'last_level', title: __('Last_level'),operate:false},
                        {field: 'shop_level', title: __('Shop_level'),operate:false},
                        {field: 'pay_price', title: __('Pay_price'),operate:false},
                        {field: 'pay_mode', title: __('Pay_mode'),operate:false},
                        {field: 'pay_time', title: __('Pay_time'),operate:false, addclass:'datetimerange'},
                        {field: 'operate', title: __('Operate'),operate:false, table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
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