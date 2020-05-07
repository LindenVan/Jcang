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
                        {field: 'id', title: __('Id'),operate:false},
                        {field: 'username', title: __('Username'),operate:'LIKE %'},
                        {field: 'id_key', title: __('Id_key')},
                        {field: 'tel', title: __('Tel')},
                        {field: 'user_key', title: __('User_key')},
                        {field: 'id_images', title: __('Id_images'), events: Table.api.events.image, formatter: Table.api.formatter.images,operate:false},
                        {field: 'create_time', title: __('Create_time'), operate:false, addclass:'datetimerange'},
                        {field: 'status', title: __('Status'),
                            searchList:{'0':'未审核','1':'已通过','2':'被拒绝'},
                            formatter:function(value){
                                if (value == 0) {
                                    return '未审核';
                                } else if (value == 1) {
                                    return '已通过';
                                }else if (value == 2) {
                                    return '被拒绝';
                                }
                            }
                        },
                        {field: 'comment', title: __('Comment'),operate:false},
                        {field: 'operate', title: __('Operate'), table: table,
                            buttons: [
                                {name: 'pass', text: '通过', title: '通过', icon: '',
                                    classname: 'btn btn-xs btn-success btn-ajax',refresh:'true',
                                    confirm:"确定要审核通过吗？",
                                    url: "client/real_name/pass",
                                    visible:function (row) {
                                        if (row['status']==0){
                                            return true;
                                        }else {
                                            return false;
                                        }
                                    }
                                },
                                {name: 'refuse', text: '拒绝', title: '拒绝', icon: '',
                                    classname: 'btn btn-xs btn-danger btn-ajax',refresh:'true',
                                    confirm:"确定要拒绝通过吗？",
                                    url: 'client/real_name/refuse',
                                    visible:function (row) {
                                        if (row['status']==0){
                                            return true;
                                        }else {
                                            return false;
                                        }
                                    }
                                },
                                {name: 'been_operating', text: '已被操作', title: '已被操作', icon: '',
                                    classname: 'btn btn-xs btn-primary btn-ajax disabled',refresh:'true',
                                    visible:function (row) {
                                        if (row['status']!=0){
                                            return true;
                                        }else {
                                            return false;
                                        }
                                    }
                                }
                            ],
                            events: Table.api.events.operate, formatter: Table.api.formatter.operate
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