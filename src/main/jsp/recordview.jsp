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
                申请记录
            </h1>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-xs-12">
                    <div class="box">

                        <div class="box-body">
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger" role="alert">${error}</div>
                            </c:if>

                            <dl class="dl-horizontal">
                                <dt>姓名</dt>
                                <dd>${record.userName}</dd>
                                <dt>联系方式</dt>
                                <dd>${record.phoneNumber}</dd>
                                <dt>行业信息</dt>
                                <dd>${record.profession}</dd>
                                <dt>是否有公积金或社保</dt>
                                <dd>${record.accumulationFund}</dd>
                                <dt>推荐机构</dt>
                                <dd>${record.organization.area} - ${record.organization.orgName}</dd>
                                <dt>经办支行</dt>
                                <dd>${record.bank.area} - ${record.bank.bankName}</dd>
                                <dt>申请时间</dt>
                                <dd>${record.createTime}</dd>
                                <dt>当前状态</dt>
                                <dd><strong>${record.statusName}</strong></dd>
                            </dl>
                        </div>
                        <!-- /.box-body -->

                        <c:if test="${admin.role == 'ROLE_ADMIN' || (admin.role == 'ROLE_BRANCH_MARKETER' && admin.bank == record.bank)}">
                            <form action="<%=request.getContextPath()%>/record/update" method="post">
                                <input type="hidden" name="recordId" value="${record.recordId}">
                                <input type="hidden" name="status">

                                <div class="box-footer">
                                    <c:if test="${record.status == 'INIT'}">
                                        <button type="button" class="btn btn-success" data-status="QUALIFIED">符合
                                        </button>
                                        <button type="button" class="btn btn-warning" data-status="UNQUALIFIED">不符合
                                        </button>
                                    </c:if>
                                    <c:if test="${record.status == 'QUALIFIED'}">
                                        <button type="button" class="btn btn-success" data-status="CONTACTED">已联系
                                        </button>
                                        <button type="button" class="btn btn-warning" data-status="UNCONTACTED">未联系
                                        </button>
                                    </c:if>
                                    <c:if test="${record.status == 'CONTACTED'}">
                                        <button type="button" class="btn btn-success" data-status="APPLY_SUCCESS">申请成功
                                        </button>
                                        <button type="button" class="btn btn-warning" data-status="APPLY_FAIL">申请失败
                                        </button>
                                    </c:if>
                                </div>
                            </form>
                        </c:if>
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
        $('form button').on('click', function () {
            var v = $(this).attr('data-status');
            $('input[name="status"]').val(v);
            $('form').submit();
        });
    });
</script>

</body>
</html>
