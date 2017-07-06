<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ttonway.bluecard.pojo.AdminUserDetails" %>
<%@ page import="com.ttonway.bluecard.pojo.ApplyRecord" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<% AdminUserDetails userDetails = (AdminUserDetails) SecurityContextHolder.getContext()
        .getAuthentication()
        .getPrincipal(); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <link rel="shortcut icon" href="" type="image/x-icon"/>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/lib/font-awesome-4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/lib/ionicons-2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/lib/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/lib/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/lib/adminLTE/css/AdminLTE.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/lib/adminLTE/css/skins/skin-green.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/app.css">
</head>

<body class="hold-transition skin-green sidebar-mini">
<div class="wrapper">

    <jsp:include page="header.jsp"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                申请记录
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <a href="#" class="category active"
                               status="<%=ApplyRecord.STATUS_INIT%>">未处理<span>(0)</span></a>
                            <a href="#" class="category"
                               status="<%=ApplyRecord.STATUS_QUALIFIED%>">符合<span>(0)</span></a>
                            <a href="#" class="category"
                               status="<%=ApplyRecord.STATUS_UNQUALIFIED%>">不符合<span>(0)</span></a>
                            <a href="#" class="category"
                               status="<%=ApplyRecord.STATUS_UNCONTACTED%>">未联系<span>(0)</span></a>
                            <a href="#" class="category" status="<%=ApplyRecord.STATUS_CONTACTED%>">已联系<span>(0)</span></a>
                            <a href="#" class="category"
                               status="<%=ApplyRecord.STATUS_APPLY_SUCCESS%>">申请成功<span>(0)</span></a>
                            <a href="#" class="category"
                               status="<%=ApplyRecord.STATUS_APPLY_FAIL%>">申请失败<span>(0)</span></a>

                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="record-table" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th class="td-checkbox"><input type="checkbox" name="chk_all"/></th>
                                    <th>姓名</th>
                                    <th>联系方式</th>
                                    <th>行业信息</th>
                                    <th>是否有公积金</th>
                                    <th>推荐机构</th>
                                    <th>经办支行</th>
                                    <th>申请时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->

                        <div class="box-footer clearfix">
                            <a href="#" class="btn btn-default pull-left" id="showDelete">删除</a>
                        </div>
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

<div class="modal fade" id="delete-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">删除</h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-success" role="alert"></div>
                <div class="alert alert-danger" role="alert"></div>
                <p>确认删除吗？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger">确认删除</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script src="<%=request.getContextPath()%>/static/lib/jQuery/jquery-2.2.3.min.js"></script>
<script src="<%=request.getContextPath()%>/static/lib/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="<%=request.getContextPath()%>/static/lib/datatables/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/static/lib/datatables/dataTables.bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/lib/daterangepicker/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/static/lib/daterangepicker/daterangepicker.js"></script>
<script src="<%=request.getContextPath()%>/static/lib/adminLTE/js/app.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/app.js"></script>
<script src="<%=request.getContextPath()%>/static/js/recordlist.js"></script>
</body>
</html>