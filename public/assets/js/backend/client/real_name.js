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
                    pass_url: 'client/real_name/pass',
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
                        {field: 'id_img', title: __('Id_img'),formatter: Table.api.formatter.images, events: Table.api.events.img,operate:false},
                        {field: 'create_time', title: __('Create_time'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'status', title: __('Status'),formatter:function(value){
                                if (value == 0) {
                                    return '未审核';
                                } else if (value == 1) {
                                    return '已通过';
                                }else if (value == 2) {
                                    return '被拒绝';
                                }
                            }},
                        {field: 'comment', title: __('Comment')},
                        {field: 'operate', title: __('Operate'), table: table,
                            buttons: [
                                {name: 'pass', text: '通过', title: '通过', icon: '',
                                    classname: 'btn btn-xs btn-success btn-ajax',refresh:'true',
                                    confirm:"确定要审核通过吗？",
                                    url: "client/real_name/pass",
                                },
                                {name: 'refuse', text: '拒绝', title: '拒绝', icon: '',
                                    classname: 'btn btn-xs btn-danger btn-ajax',refresh:'true',
                                    confirm:"确定要拒绝通过吗？",
                                    url: 'client/real_name/refuse'}
                            ],
                            events: Table.api.events.operate, formatter: Table.api.formatter.operate}
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
        },
        pass: function () {
            Fast.api.ajax({
                url: '/admin/customer/user/order_cancel',
                data: {"ids": order_sn},
            }, function (data, ret) {
                if(ret.code == 1){
                    Layer.closeAll();
                    Toastr.success(ret.msg);
                }else{
                    Layer.alert(ret.msg);
                }
            }, function (data, ret) {
                Layer.alert(ret.msg);
            });
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});