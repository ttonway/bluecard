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

                data.r = Math.random();
                $.ajax({
                    type: "post",
                    cache: false,
                    data: data,
                    url: "partnermgr/list",
                    success: function (res) {
                        var result = $.parseJSON(res);
                        if (result.code == 0) {
                            for (var i = 0; i < result.data.length; i++) {
                                var map = result.data[i];
                                if (map.partnerType == "whitecollar") {
                                    map.type = "白领";
                                } else if (map.partnerType == "shop") {
                                    map.type = "商家";
                                }
                            }

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
                {"data": "type"},
                {"data": "userName"},
                {"data": "phoneNumber"},
                {"data": "bank"},
                {"data": "needMaterial"},
                {
                    "class": 'view-details',
                    "orderable": false,
                    "data": null,
                    "defaultContent": '<a href="####">详情</a>'
                }
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


    tableEl.on("click", ".view-details a", function () {
        var data = table.row($(this).parents('tr')).data();

        $.ajax({
            type: "post",
            cache: false,
            data: {
                partnerId: data.partnerId,
                r: Math.random()
            },
            url: "partnermgr/get",
            success: function (res) {
                var result = $.parseJSON(res);
                if (result.code == 0) {
                    var dl = $('#details-modal dl');
                    dl.html('');

                    var map = result.result;

                    var type;
                    if (map.partnerType == "whitecollar") {
                        type = "白领";
                    } else if (map.partnerType == "shop") {
                        type = "商家";
                    }
                    dl.append('<dt>类型：</dt><dd>' + type + '</dd>');
                    dl.append('<dt>是否为我行老客户：</dt><dd>' + map.oldCustomer + '</dd>');
                    dl.append('<dt>姓名：</dt><dd>' + map.userName + '</dd>');
                    dl.append('<dt>联系方式：</dt><dd>' + map.phoneNumber + '</dd>');
                    if (map.partnerType == "whitecollar") {
                        dl.append('<dt>单位性质：</dt><dd>' + map.workUnitType + '</dd>');
                        if (map.workUnitName)
                            dl.append('<dt>单位名称：</dt><dd>' + map.workUnitName + '</dd>');
                    } else if (map.partnerType == "shop") {
                        dl.append('<dt>店面名称：</dt><dd>' + map.shopName + '</dd>');
                        dl.append('<dt>店面位置：</dt><dd>' + map.shopAddress + '</dd>');
                    }
                    dl.append('<dt>合作区域：</dt><dd>' + map.bank + '</dd>');
                    dl.append('<dt>我需要实体宣传材料：</dt><dd>' + map.needMaterial + '</dd>');
                    if (map.needMaterial == "是") {
                        dl.append('<dt>实体宣传材料：</dt><dd>' + map.materials + '</dd>');
                        dl.append('<dt>收货人：</dt><dd>' + map.receiver + '</dd>');
                        dl.append('<dt>手机号码：</dt><dd>' + map.receiverPhoneNumber + '</dd>');
                        dl.append('<dt>所在区或县：</dt><dd>' + map.receiverArea + '</dd>');
                        dl.append('<dt>详细地址：</dt><dd>' + map.receiverAddress + '</dd>');
                    }
                    dl.append('<dt>业绩（通过／总数）：</dt><dd>' + map.passLoanCount + '/' + map.totalLoanCount + '</dd>');

                    $('#details-modal').modal();
                }
            }
        });
    });


    $('#export').on('click', function () {
        var params = {r: Math.random()};
        var url = "partnermgr/export?" + $.param(params);
        location.href = url;
    });
    // 删除
    $('#showDelete').on('click', function () {
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
            array.push(data.partnerId);
        });
        if (array.length > 0) {
            $.ajax({
                type: "post",
                cache: false,
                traditional: true,
                data: {
                    partnerIds: array,
                    r: Math.random()
                },
                url: "partnermgr/delete",
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