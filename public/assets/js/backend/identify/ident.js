define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'identify/ident/index' + location.search,
                    add_url: 'identify/ident/add',
                    edit_url: 'identify/ident/edit',
                    del_url: 'identify/ident/del',
                    multi_url: 'identify/ident/multi',
                    table: 'identify',
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
                        {field: 'user_tel', title: __('User_tel')},
                        {field: 'user_key', title: __('User_key')},
                        {field: 'filename', title: __('Filename')
                            process: function (value, arg) {
                                return value.replace(/\*/g, '%');
                                return '' + row.filename + '';
                            }
                        },
                        {field: 'attachment', title: __('Attachment')},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'status', title: __('Status'),
                            formatter:function(value){
                                if (value == 0) {
                                    return '未处理';
                                } else if (value == 1) {
                                    return '已处理';
                                }
                            }
                        },
                        {field: 'operate', title: __('Operate'),
                            buttons: [
                                {name: 'handling', text: '处理', title: '处理', icon: '',
                                    classname: 'btn btn-xs btn-success btn-dialog',refresh:'true',
                                    url: "identify/ident/hand",
                                    visible:function (row) {
                                        if (row['status']==0){
                                            return true;
                                        }else {
                                            return false;
                                        }
                                    }
                                }
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
        hand:function(){
            Controller.api.bindevent();
            Form.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});