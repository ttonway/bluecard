$(function () {

    var tableEl = $('#record-table');
    var table;

    function reloadTable() {

        $("input[type='checkbox'][name='chk_all']").prop("checked", false);

        table = tableEl.DataTable({
            language: myApp.datatablesLang,
            "destroy": true,
            "paging": true,
            "lengthChange": false,
            "searching": true,
            "ordering": false,
            "info": true,
            "autoWidth": false,
            "serverSide": true,
            "ajax": function (data, callback, settings) {
                data.status = $('.category.active').attr('status');
                data.searchValue = data.search.value;
                $.ajax({
                    type: "post",
                    cache: false,
                    data: data,
                    url: "list",
                    success: function (res) {
                        var result = $.parseJSON(res);
                        if (result.code == 0) {
                            var cntList = result.cntlist;
                            var cntMap = {};
                            for (var i = 0; i < cntList.length; i++) {
                                var map = cntList[i];
                                cntMap[map.status] = map.cnt;
                            }
                            $('.category').each(function () {
                                var cnt = cntMap[$(this).attr('status')] || 0;
                                $(this).find('span').text("(" + cnt + ")");
                            });

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
                {
                    "class": 'record-id',
                    "data": "userName",
                    "render": function (data, type, full, meta) {
                        return '<a href="view/' + full.recordId + '">' + data + '</a>';
                    }
                },
                {"data": "phoneNumber"},
                {"data": "profession"},
                {"data": "accumulationFund"},
                {
                    "data": "organization",
                    "render": function (data, type, full, meta) {
                        return data ? data.orgName : '';
                    }
                },
                {"data": "bank.bankName"},
                {"data": "createTime"}
            ]
        });
    }

    reloadTable();
    $('.category').on('click', function () {
        $('.category').removeClass('active');
        $(this).addClass('active');
        reloadTable();
    });

    tableEl.on("change", "input[type='checkbox'][name='chk_all']", function () {
        $("input[type='checkbox'][name='chk_item']").prop("checked", $(this).is(':checked'));
    });
    tableEl.on("change", "input[type='checkbox'][name='chk_item']", function () {
        var allChecked = $("input[type='checkbox'][name='chk_item']:not(:checked)").length === 0;
        $("input[type='checkbox'][name='chk_all']").prop("checked", allChecked);
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
        var loanid = [];
        var flag = 1;
        $("input[type='checkbox'][name='chk_item']:checked").each(function () {
            var data = table.row($(this).parents('tr')).data();
            if (data.status != 0) {
                $('#delete-modal .alert-danger').text("只能删除待联系客户");
                $('#delete-modal .alert-danger').show();
                flag = 0;
            }
            loanid.push(data.loanid);
        });
        if (flag == 1 && loanid.length > 0) {
            $.ajax({
                type: "post",
                cache: false,
                traditional: true,
                data: {
                    loanid: loanid,
                    r: Math.random()
                },
                url: "loan/delete",
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