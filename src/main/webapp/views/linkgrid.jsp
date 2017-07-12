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
                活动内容
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            &nbsp;
                            <div class="pull-right box-tools">
                                <a href="create" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i></a>
                            </div>
                        </div>
                        <!-- /.box-header -->

                        <div class="box-body">
                            <c:forEach items="${linkList}" var="item">
                                <div class="col-sm-12 col-md-6">
                                    <a href="<%=request.getContextPath()%>/link/page/${item.key}">
                                        <div class="thumbnail">
                                            <img src="<%=request.getContextPath()%>/link/image/${item.key}">
                                            <div class="caption">
                                                <h3>${item.name}</h3>
                                                <p style="word-wrap: break-word;">${item.text}</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
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

<jsp:include page="include-script.jsp"/>
</body>
</html>
