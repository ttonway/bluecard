$(function () {

    var tableEl = $('#user-table');
    var table;

    function reloadTable() {

        $("input[type='checkbox'][name='chk_all']").prop("checked", false);

        table = tableEl.DataTable({
            language: myApp.datatablesLang,
            "destroy": true,
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": false,
            "info": true,
            "autoWidth": false,
            "serverSide": true,
            "ajax": function (data, callback, settings) {

                $.ajax({
                    type: "post",
                    cache: false,
                    data: data,
                    url: "list",
                    success: function (res) {
                        var result = $.parseJSON(res);
                        if (result.code == 0) {
                            callback(result);
                        }
                    }
                });
            },
            "columns": [
                {
                    "class": 'td-checkbox',
                    "orderable": false,
                    "data": null,
                    "defaultContent": '<input type="checkbox" name="chk_item""/>'
                },
                {"data": "userId"},
                {"data": "name"},
                {"data": "userCode"},
                {"data": "bank.bankName"},
                {"data": "roleName"},
                {"data": "createTime"}
            ]
        });
    }

    reloadTable();

    tableEl.on("change", "input[type='checkbox'][name='chk_all']", function () {
        $("input[type='checkbox'][name='chk_item']").prop("checked", $(this).is(':checked'));
    });
    tableEl.on("change", "input[type='checkbox'][name='chk_item']", function () {
        var allChecked = $("input[type='checkbox'][name='chk_item']:not(:checked)").length === 0;
        $("input[type='checkbox'][name='chk_all']").prop("checked", allChecked);
    });



    $('#resetUser').on('click', function () {
        var len = $("input[type='checkbox'][name='chk_item']:checked").length;
        if (len == 0) {
            alert("请选择用户");
            return;
        } else if (len > 1) {
            alert("请选择单个用户");
            return;
        } else {
            $('#reset-modal .alert-success').hide();
            $('#reset-modal .alert-danger').hide();
            $('#reset-modal').modal();
        }
    });
    $('#reset-modal button.btn-primary').on('click', function () {
        var checkboxs = $("input[type='checkbox'][name='chk_item']:checked");
        if (checkboxs.length == 1) {
            var data = table.row(checkboxs.parents('tr')).data();
            $.ajax({
                type: "post",
                cache: false,
                data: {
                    userId: data.userId
                },
                url: "resetPwd",
                success: function (res) {
                    var result = $.parseJSON(res);
                    if (result.code == 0) {
                        $('#reset-modal .alert-success').text("重置成功");
                        $('#reset-modal .alert-success').show();

                        reloadTable();
                    } else {
                        $('#reset-modal .alert-danger').text("重置失败");
                        $('#reset-modal .alert-danger').show();
                    }
                }
            });
        }
    });


    $('#deleteUser').on('click', function () {
        var len = $("input[type='checkbox'][name='chk_item']:checked").length;
        if (len == 0) {
            alert("请选择用户");
            return;
        } else {
            $('#delete-modal .alert-success').hide();
            $('#delete-modal .alert-danger').hide();
            $('#delete-modal').modal();
        }
    });
    $('#delete-modal button.btn-danger').on('click', function () {
        var array = [];
        $("input[type='checkbox'][name='chk_item']:checked").each(function () {
            var data = table.row($(this).parents('tr')).data();
            array.push(data.userId);
        });
        if (array.length > 0) {
            $.ajax({
                type: "post",
                cache: false,
                traditional: true,
                data: {
                    userIds: array
                },
                url: "delete",
                success: function (res) {
                    var result = $.parseJSON(res);
                    if (result.code == 0) {
                        $('#delete-modal .alert-success').text("删除成功");
                        $('#delete-modal .alert-success').show();

                        reloadTable();
                    } else {
                        $('#delete-modal .alert-danger').text("删除失败");
                        $('#delete-modal .alert-danger').show();
                    }
                }
            });
        }
    });
});