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
                                <dt>推荐人手机号</dt>
                                <dd>${record.refereePhone}</dd>
                                <%--<dt>月收入</dt>--%>
                                <%--<dd>${record.income}</dd>--%>
                                <%--<dt>申请额度（万）</dt>--%>
                                <%--<dd>${record.creditLine / 10000}</dd>--%>
                                <dt>市县</dt>
                                <dd>${record.bank.area}</dd>
                                <dt>经办支行</dt>
                                <dd>${record.bank.bankName}</dd>
                                <dt>申请卡种</dt>
                                <dd>${record.cardName}</dd>
                                <dt>申请时间</dt>
                                <dd>${record.createTime}</dd>
                                <dt>当前状态</dt>
                                <dd><strong>${record.statusName}</strong></dd>
                                <c:if test="${not empty record.remark}">
                                    <dt>备注</dt>
                                    <dd><strong>${record.remark}</strong></dd>
                                </c:if>
                            </dl>
                        </div>
                        <!-- /.box-body -->

                        <c:if test="${admin.role == 'ROLE_ADMIN' || (admin.role == 'ROLE_BRANCH_MARKETER' && admin.bank == record.bank)}">
                            <div class="box-footer">
                                <form action="<%=request.getContextPath()%>/record/update" method="post"
                                      class="form-inline">
                                    <input type="hidden" name="recordId" value="${record.recordId}">
                                    <input type="hidden" name="status">
                                    <input type="hidden" name="remark">

                                    <c:if test="${record.status == 'INIT'}">
                                        <button type="button" class="btn btn-success" data-status="CONTACTED">已联系
                                        </button>
                                        <button type="button" class="btn btn-warning" data-status="UNCONTACTED">未联系
                                        </button>
                                    </c:if>
                                    <c:if test="${record.status == 'CONTACTED'}">
                                        <button type="button" class="btn btn-success" data-status="QUALIFIED">符合
                                        </button>
                                        <button type="button" class="btn btn-warning" data-status="UNQUALIFIED">不符合
                                        </button>
                                        <div class="form-group">
                                            <label class="sr-only" for="remark">备注</label>
                                            <select name="remark-select" class="form-control" id="remark">
                                                <option value="" selected disabled>请选择原因</option>
                                                <option>禁推人群</option>
                                                <option>测试人群</option>
                                                <option>外省工作</option>
                                                <option value="other">其他原因</option>
                                            </select>
                                        </div>
                                        <div class="form-group" style="display: none;">
                                            <label class="sr-only" for="remark-other">其他原因</label>
                                            <input name="remark-input" type="text" class="form-control" id="remark-other"
                                                   placeholder="请输入">
                                        </div>
                                    </c:if>
                                    <c:if test="${record.status == 'QUALIFIED'}">
                                        <button type="button" class="btn btn-success" data-status="APPLY_SUCCESS">申请成功
                                        </button>
                                        <button type="button" class="btn btn-warning" data-status="APPLY_FAIL">申请失败
                                        </button>
                                        <div class="form-group">
                                            <label class="sr-only" for="remark2">备注</label>
                                            <select name="remark-select" class="form-control" id="remark2">
                                                <option value="" selected disabled>请选择原因</option>
                                                <option>客户不愿意办</option>
                                                <option>客户资质不符</option>
                                                <option value="other">其他原因</option>
                                            </select>
                                        </div>
                                        <div class="form-group" style="display: none;">
                                            <label class="sr-only" for="remark-other2">其他原因</label>
                                            <input name="remark-input" type="text" class="form-control" id="remark-other2"
                                                   placeholder="请输入">
                                        </div>
                                    </c:if>
                                </form>
                            </div>
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
        $('select[name="remark-select"]').on('change', function () {
            if ($(this).val() == 'other') {
                $('input[name="remark-input"]').parent('.form-group').show();
            } else {
                $('input[name="remark-input"]').parent('.form-group').hide();
            }
        });

        $('form button').on('click', function () {
            var v = $(this).attr('data-status');
            $('input[name="status"]').val(v);

            var s = $('select[name="remark-select"]').val();
            if (s == 'other') {
                s = $('input[name="remark-input"]').val();
            }
            $('input[name="remark"]').val(s);
            $('form').submit();
        });
    });
</script>

</body>
</html>
