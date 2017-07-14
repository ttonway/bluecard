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

<jsp:include page="include-script.jsp"/>
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
