<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ttonway.bluecard.pojo.ApplyRecordStatistics" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="include-head.jsp"/>
</head>

<body class="hold-transition skin-green sidebar-mini">
<div class="wrapper">

    <jsp:include page="main-header.jsp"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <c:if test="${requestScope.stype eq ApplyRecordStatistics.TYPE_BANK}">
                    汇总信息 - 网点
                </c:if>
                <c:if test="${requestScope.stype eq ApplyRecordStatistics.TYPE_REFEREE}">
                    汇总信息 - 推荐手机号码
                </c:if>
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            &nbsp;
                            <div class="box-tools">
                                <div class="input-group input-group-sm" style="width: 150px;">
                                    <button type="button" class="btn btn-default pull-right" id="daterange-btn">
                                        <span><i class="fa fa-calendar"></i> 所有</span>
                                        <i class="fa fa-caret-down"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="s-table" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <c:if test="${requestScope.stype eq ApplyRecordStatistics.TYPE_BANK}">
                                        <th>支行</th>
                                    </c:if>
                                    <c:if test="${requestScope.stype eq ApplyRecordStatistics.TYPE_REFEREE}">
                                        <th>推荐人</th>
                                    </c:if>
                                    <th>未处理</th>
                                    <th>符合</th>
                                    <th>不符合</th>
                                    <th>未联系</th>
                                    <th>已联系</th>
                                    <th>申请成功</th>
                                    <th>申请失败</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
</div>
<!-- ./wrapper -->

<input type="hidden" id="stype" value='${stype}'>

<jsp:include page="include-script.jsp"/>
<script>

    $(function () {
        var tableEl = $('#s-table');

        function reloadTable() {

            var table = tableEl.DataTable({
                language: myApp.datatablesLang,
                "destroy": true,
                "paging": false,
                "lengthChange": false,
                "searching": false,
                "ordering": false,
                "info": true,
                "autoWidth": false,
                "serverSide": true,
                "ajax": function (data, callback, settings) {
                    data.stype = $('#stype').val();
                    data.minTime = $('#daterange-btn').attr('min-time');
                    data.maxTime = $('#daterange-btn').attr('max-time');
                    $.ajax({
                        type: "post",
                        cache: false,
                        data: data,
                        url: "<%=request.getContextPath()%>/statistics/list",
                        success: function (res) {
                            var result = $.parseJSON(res);
                            if (result.code == 0) {
                                callback(result);
                            }
                        }
                    });
                },
                "columns": [
                    {"data": "name"},
                    {"data": "initCount"},
                    {"data": "qualifiedCount"},
                    {"data": "unqualifiedCount"},
                    {"data": "contactedCount"},
                    {"data": "uncontactedCount"},
                    {"data": "successCount"},
                    {"data": "failCount"}
                ]
            });
        }

        $('#daterange-btn').daterangepicker(
                {
                    locale: {
                        applyLabel: '确认',
                        cancelLabel: '取消',
                        fromLabel: '起始时间',
                        toLabel: '结束时间',
                        customRangeLabel: '自定义',
                        daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
                        monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
                            '七月', '八月', '九月', '十月', '十一月', '十二月'],
                        firstDay: 1
                    },
                    ranges: {
                        '所有': [moment.invalid(), moment.invalid()],
                        '过去7天': [moment().subtract(6, 'days'), moment()],
                        '过去30天': [moment().subtract(29, 'days'), moment()],
                        '本月': [moment().startOf('month'), moment().endOf('month')]
                    },
                    startDate: moment(),
                    endDate: moment()
                },
                function (start, end) {
                    if (start.isValid && end.isValid()) {
                        $('#daterange-btn').attr('min-time', start.format("YYYY-MM-DD HH:mm:ss"));
                        $('#daterange-btn').attr('max-time', end.format("YYYY-MM-DD HH:mm:ss"));
                        $('#daterange-btn span').html(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));
                    } else {
                        $('#daterange-btn').attr('min-time', '');
                        $('#daterange-btn').attr('max-time', '');
                        $('#daterange-btn span').html('<i class="fa fa-calendar"></i> 所有');
                    }

                    $('.tbody .tr').remove();
                    reloadTable();
                }
        );

        reloadTable();
    });
</script>

</body>
</html>
