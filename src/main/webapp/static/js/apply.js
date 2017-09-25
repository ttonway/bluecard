function calculateCreditLine(num) {
    var line;
    if (num <= 1500) {
        line = 1.0;
    } else if (num <= 1800) {
        line = 2.0;
    } else if (num <= 2500) {
        line = 2.5;
    } else if (num <= 3300) {
        line = 3.0;
    } else if (num <= 3800) {
        line = 3.5;
    } else if (num <= 5000) {
        line = 4.0;
    } else if (num <= 6500) {
        line = 4.5;
    } else if (num <= 7500) {
        line = 5.0;
    } else if (num <= 8500) {
        line = 5.5;
    } else if (num <= 10000) {
        line = 6.0;
    } else if (num <= 12000) {
        line = 7.5;
    } else if (num <= 16000) {
        line = 8.5;
    } else if (num <= 19000) {
        line = 9.0;
    } else {
        line = 10.0;
    }
    return line;
}


$(function () {
    (function () {
        var options1 = $('.input-single-select').find('li');
        options1.on('click', function (e) {
            var $target = $(e.target);
            $target.siblings('li').removeClass('on');
            $target.addClass('on');
        });

        var options2 = $('.input-multi-select').find('li');
        options2.on('click', function (e) {
            var $target = $(e.target);
            $target.toggleClass('on');
        });
    })();

    $('#profession-select').on('change', function () {
        if ($(this).val() == '其他') {
            $('#profession-other').show();
        } else {
            $('#profession-other').hide();
        }
    });

    $('#income').on('change input propertychange', function () {
        var num = parseInt($(this).val());
        var line = calculateCreditLine(num);
        // line *= 10000;
        $(this).siblings('p.help-block').text("您的申请额度预计为" + line + "万元，以实际办理为准。");
    });

    //org
    (function () {
        var org1 = $('#org-area');
        var org2 = $('#orgId');
        org2.select2({
            language: 'zh-CN'
        });

        org1.on('change', function () {
            if (org1.val()) {
                org2.next('.select2').show();
            } else {
                org2.next('.select2').hide();
            }
            var options = $('#org-all optgroup[label=' + org1.val() + '] option');
            org2.find('option:enabled').remove();
            org2.append('<option value="">无</option>');
            options.each(function () {
                org2.append($(this).clone());
            });
        }).change();
    })();

    //bank
    (function () {
        var areas = [];
        $('#bank-all option').each(function () {
            var area = $(this).attr('area');
            if (areas.indexOf(area) == -1) {
                areas.push(area);
            }
        });

        var bank1 = $('#bank1');
        var bank2 = $('#bank2');
        bank1.find('option:enabled').remove();
        $.each(areas, function (index, area) {
            bank1.append('<option>' + area + '</option>');
        });
        bank1.on('change', function () {
            if (bank1.val()) {
                bank2.show();
            } else {
                bank2.hide();
            }
            var options = $('#bank-all option[area=' + bank1.val() + ']');
            bank2.find('option:enabled').remove();
            options.each(function () {
                bank2.append($(this).clone());
            });
        });
    })();

}());


function submitForm() {
    var data = {
        name: $('input[name="name"]').val(),
        phone: $('input[name="phone"]').val(),
        profession: $('#profession-select').val(),
        fund: $('.input-single-select li.on[name="accumulation_fund"]').text(),
        orgId: $('select[name="orgId"]').val(),
        bankId: $('select[name="bankId"]').val(),
        refereePhone: $('input[name="referee-phone"]').val()

        // income: parseInt($('input[name="income"]').val())
    };
    if (data.profession == '其他') {
        data.profession = $('#profession-other').val();
    }

    if (!data.name) {
        alert("请输入姓名.");
        return;
    }
    var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
    if (!data.phone || !reg.test(data.phone)) {
        alert("请输入正确手机号码");
        return;
    }
    if (!data.profession) {
        alert("请选择行业.");
        return;
    }
    if (!data.fund) {
        alert("请选择是否有公积金或社保.");
        return;
    }
    // if (!data.income) {
    //     alert("请输入月工资收入.");
    //     return;
    // }
    // data.creditLine = calculateCreditLine(data.income) * 10000;
    if (!data.bankId) {
        alert("请选择经办支行.");
        return;
    }

    $.ajax({
        type: "post",
        cache: false,
        data: data,
        url: "submit",
        success: function (res) {
            var result = $.parseJSON(res);
            if (result.code == 0) {
                // $('#result-modal .modal-title').text("申请成功");
                // $('#result-modal .modal-body p').text("请保持电话畅通，我们会尽快与您联系。");
                // $('#result-modal').modal();
                window.location.href = "result";
            } else {
                $('#result-modal .modal-title').text("申请失败");
                $('#result-modal .modal-body p').text(result.msg);
                $('#result-modal').modal();
            }
        }
    });

}
