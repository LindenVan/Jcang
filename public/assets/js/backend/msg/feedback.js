define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'msg/feedback/index' + location.search,
                    add_url: 'msg/feedback/add',
                    edit_url: 'msg/feedback/edit',
                    del_url: 'msg/feedback/del',
                    multi_url: 'msg/feedback/multi',
                    table: 'feedback',
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
                        {field: 'user_name', title: __('User_name')},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'status', title: __('Status'),
                            formatter:function (value) {
                                if (value == 0) {
                                    return '未处理';
                                } else if (value == 1) {
                                    return '已处理';
                                }
                            }
                        },
                        {field: 'operate', title: __('Operate'),
                            buttons:[
                                {name: 'toview', text: '查看', title: '反馈信息', icon: '',
                                    classname: 'btn btn-xs btn-primary btn-dialog',refresh:'true',
                                    url: "msg/feedback/edit",
                                },
                                {name: 'handling', text: '处理', title: '处理', icon: '',
                                    classname: 'btn btn-xs btn-success btn-ajax',refresh:'true',
                                    confirm:"请确认！",
                                    url: "msg/feedback/hand",
                                    visible:function (row) {
                                        if (row['status']==0){
                                            return true;
                                        }else {
                                            return false;
                                        }
                                    }
                                },{name: 'handling', text: '已处理',
                                    classname: 'btn btn-xs btn-success btn-dialog disabled',
                                    visible:function (row) {
                                        if (row['status']!=0){
                                            return true;
                                        }else {
                                            return false;
                                        }
                                    }
                                },
                            ],
                            table: table, events: Table.api.events.operate,
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