<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/lib/bootstrap-fileinput/css/fileinput.min.css">
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
                编辑活动内容
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">

                        <!-- form start -->
                        <form role="form" class="form-horizontal" enctype="multipart/form-data" method="post" action="save">
                            <div class="box-body">
                                <c:if test="${not empty error}">
                                    <div class="alert alert-danger" role="alert">${error}</div>
                                </c:if>

                                <div class="form-group">
                                    <label for="key" class="col-sm-2 control-label">类型</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="key" name="key">
                                            <option value="" selected disabled>请选择</option>
                                            <c:forEach items="${keyNameMap}" var="item">
                                                <option value="${item.key}">${item.value}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="file" class="col-sm-2 control-label">图片</label>
                                    <div class="col-sm-10">
                                        <input type="file" class="form-control" name="file" id="file">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="text" class="col-sm-2 control-label">文字</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" rows="3" id="text" name="text"></textarea>
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

<script src="<%=request.getContextPath()%>/static/lib/jQuery/jquery-2.2.3.min.js"></script>
<script src="<%=request.getContextPath()%>/static/lib/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="<%=request.getContextPath()%>/static/lib/datatables/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/static/lib/datatables/dataTables.bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/lib/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="<%=request.getContextPath()%>/static/lib/bootstrap-fileinput/js/locales/zh.js"></script>
<script src="<%=request.getContextPath()%>/static/lib/adminLTE/js/app.min.js"></script>
<script src="<%=request.getContextPath()%>/static/js/app.js"></script>
<script>
    $(function () {
        $('#file').fileinput({
            language: 'zh',
            browseClass: "btn btn-default btn-block",
            //showCaption: false,
            showRemove: false,
            showUpload: false,
            uploadAsync: false,
            allowedFileTypes: ["image"]
        });
    });
</script>
</body>
</html>
