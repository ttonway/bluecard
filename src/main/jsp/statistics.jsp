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
                汇总信息
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">

                        <div class="box-body">
                            <table id="org-table" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>支行</th>
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
                                <c:forEach items="${list}" var="item">
                                    <tr>
                                        <td>${item.bankName}</td>
                                        <td>${item.initCount}</td>
                                        <td>${item.qualifiedCount}</td>
                                        <td>${item.unqualifiedCount}</td>
                                        <td>${item.contactedCount}</td>
                                        <td>${item.uncontactedCount}</td>
                                        <td>${item.successCount}</td>
                                        <td>${item.failCount}</td>
                                    </tr>
                                </c:forEach>
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

<jsp:include page="include-script.jsp"/>

</body>
</html>
