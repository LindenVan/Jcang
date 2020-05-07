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
                        {field: 'wdr_id', title: __('Wdr_id'),operate:false},
                        {field: 'user_name', title: __('User_name'),operate:false},
                        {field: 'id_number', title: __('Id_number')},{field: 'user_key', title: __('User_key')},
                        {field: 'money', title: __('Money'),operate:false},
                        {field: 'poundage', title: __('Poundage'),operate:false},
                        {field: 'actual_money', title: __('Actual_money'),operate:false},
                        {field: 'cash_account', title: __('Cash_account'),operate:false},
                        {field: 'wdr_time', title: __('Wdr_time'),operate:false, addclass:'datetimerange'},
                        {field: 'tel', title: __('Tel')},
                        {field: 'status', title: __('Status'),
                            searchList: {"0": __('未处理'), "1": __('已处理')},
                            formatter:function(value){
                                if (value == 0) {
                                    return '未处理';
                                } else if (value == 1) {
                                    return '已处理';
                                }
                            }},
                        {field: 'comment', title: __('Comment'),operate:false},
                        {field: 'operate', title: __('Operate'), table: table,
                            buttons: [
                                {name: 'handling', text: '处理', title: '处理', icon: '',
                                    classname: 'btn btn-xs btn-success btn-ajax ',refresh:'true',
                                    confirm:"确定通过提现申请？",
                                    url: "finance/withdrawals/handling",
                                    visible:function (row) {
                                        if (row['status']==0){
                                            return true;
                                        }else {
                                            return false;
                                        }
                                    }
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