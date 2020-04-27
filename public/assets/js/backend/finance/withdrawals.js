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
                        {field: 'status', title: __('Status'),formatter:function(value){
                                if (value == 0) {
                                    return '未处理';
                                } else if (value == 1) {
                                    return '已处理';
                                }
                            }},
                        {field: 'comment', title: __('Comment')},
                        {field: 'operate', title: __('Operate'), table: table,
                            buttons: [
                                {name: 'handling', text: '处理', title: '处理', icon: '',
                                    classname: 'btn btn-xs btn-success btn-ajax',refresh:'true',
                                    confirm:"确定通过提现申请？",
                                    url: "finance/withdrawals/handling",
                                }
                            ],
                            formatter:function(value,row,index){
                                var that = $.extend({},this);
                                var table = $(that.table).clone(true);
                                if (row.status == 1){
                                    $(table).data("operate-handling",'');
                                }
                                that.table = table;
                                return Table.api.formatter.operate.call(that,value,row,index);
                            },
                            events: Table.api.events.operate,
                            formatter: Table.api.formatter.operate
                        }
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