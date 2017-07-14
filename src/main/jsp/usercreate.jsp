<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                新建帐号
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">

                        <!-- form start -->
                        <form role="form" class="form-horizontal" action="save">
                            <div class="box-body">
                                <c:if test="${not empty error}">
                                    <div class="alert alert-danger" role="alert">${error}</div>
                                </c:if>

                                <div class="form-group">
                                    <label for="name" class="col-sm-2 control-label">姓名</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="name" name="name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="userCode" class="col-sm-2 control-label">工号</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="userCode" name="userCode">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">密码</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="password" name="password">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="bank2" class="col-sm-2 control-label">支行</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="bank-all" style="display: none;">
                                            <c:forEach items="${bankList}" var="item">
                                                <option value="${item.bankId}"
                                                        area="${item.area}">${item.bankName}</option>
                                            </c:forEach>
                                        </select>
                                        <select class="form-control" id="bank1">
                                            <option value="" selected disabled>请选择一级支行</option>
                                        </select>
                                        <select class="form-control" id="bank2" name="bankId"
                                                style="margin-top: 8px; display: none;">
                                            <option value="" selected disabled>请选择二级支行</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="role" class="col-sm-2 control-label">岗位</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="role" name="role">
                                            <option value="" selected disabled>请选择</option>
                                            <c:forEach items="${roleMap}" var="item">
                                                <option value="${item.key}">${item.value}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-body -->

                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary">确定</button>
                            </div>
                        </form>
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

<jsp:include page="include-script.jsp"/>
<script>
    $(function () {
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
    });
</script>
</body>
</html>
