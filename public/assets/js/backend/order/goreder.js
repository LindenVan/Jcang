define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'order/goreder/index' + location.search,
                    add_url: 'order/goreder/add',
                    edit_url: 'order/goreder/edit',
                    del_url: 'order/goreder/del',
                    multi_url: 'order/goreder/multi',
                    table: 'order',
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
                        {field: 'order_key', title: __('Order_key')},
                        {field: 'buyer_tel', title: __('Buyer_tel')},
                        {field: 'buyer_key', title: __('Buyer_key')},
                        {field: 'buyer_name', title: __('Buyer_name')},
                        {field: 'goods_title', title: __('Goods_title')},
                        {field: 'goods_img', title: __('Goods_img')},
                        {field: 'comment', title: __('Comment')},
                        {field: 'is_goods', title: __('Is_goods')},
                        {field: 'issuer_tel', title: __('Issuer_tel')},
                        {field: 'issuer_key', title: __('Issuer_key')},
                        {field: 'goods_price', title: __('Goods_price'), operate:'BETWEEN'},
                        {field: 'pay_price', title: __('Pay_price'), operate:'BETWEEN'},
                        {field: 'pay_mode', title: __('Pay_mode')},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'address', title: __('Address')},
                        {field: 'logistics', title: __('Logistics')},
                        {field: 'logistics_key', title: __('Logistics_key')},
                        {field: 'logistics_status', title: __('Logistics_status')},
                        {field: 'take_time', title: __('Take_time'), operate:'RANGE', addclass:'datetimerange'},
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