define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'client/users/index' + location.search,
                    add_url: 'client/users/add',
                    edit_url: 'client/users/edit',
                    del_url: 'client/users/del',
                    multi_url: 'client/users/multi',
                    table: 'users',
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
                        {field: 'user_key', title: __('User_key')},
                        {field: 'tel', title: __('Tel')},
                        /*{field: 'level', title: __('Level')},*/
                        {field: 'level',title: __('Level'),
                            searchList: {"0": __('无会员'), "1": __('一级会员'),"2":__('二级会员')},
                            formatter:function(value){
                                if (value == 0) {
                                    return '无会员';
                                } else if (value == 1) {
                                    return '一级会员';
                                } else if (value == 2) {
                                    return '二级会员';
                                }
                            }
                        },
                        {field: 'money', title: __('Money'), operate:'BETWEEN',operate:false},
                        {field: 'pending', title: __('Pending'), operate:'BETWEEN',operate:false},
                        {field: 'name', title: __('Name'),
                            operate:false
                        },
                        {field: 'id_number', title: __('Id_number'),operate:false},
                        {field: 'create_time', title: __('Create_time'),operate:false, addclass:'datetimerange'},
                        {field: 'last_time', title: __('Last_time'), operate:'RANGE', addclass:'datetimerange'},
                        /*{field: 'status', title: __('Status')},*/
                        {field: 'status',title: __('Status'),
                            searchList: {"0": __('正常'), "1": __('禁言'),"2":__('封号')},
                            formatter:function(value){
                                if (value == 0) {
                                    return '正常';
                                } else if (value == 1) {
                                    return '禁言';
                                } else if (value == 2) {
                                    return '封号';
                                }
                            },
                            // formatter:Table.api.formatter.toggle
                        },

                        {field: 'comment', title: __('Comment'),operate:false},
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
    $(document).on('click', '.btn-banned', function () {
        var data= table.bootstrapTable('getSelections');
        console.log(data);
        Layer.confirm(
            __('确定禁言这几项？', 5),
            {icon: 3, title: __('Warning'), offset: 0, shadeClose: true},
        );
    });
    return Controller;
});