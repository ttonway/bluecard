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
                新建机构
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
                                    <label for="area" class="col-sm-2 control-label">地区</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" id="area" name="area">
                                            <option value="" selected disabled>请选择</option>
                                            <c:forEach items="${areaList}" var="item">
                                                <option>${item}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="orgName" class="col-sm-2 control-label">机构名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="orgName" name="orgName">
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
</body>
</html>
