<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta content="telephone=no" name="format-detection">
    <meta name="wap-font-scale" content="no">

    <title>信用卡申请</title>

    <link rel="shortcut icon" href="" type="image/x-icon"/>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/lib/select2/select2.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/apply.css?v=1">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body class="with-navbar">

<nav class="navbar navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">个人信息填写</a>
        </div>
    </div>
</nav>

<div class="container">
    <div class="page-header">
        请如实填写下方内容
    </div>
    <form method="post" action="submitForm.htm">
        <div class="form-group">
            <label for="name">姓名</label>
            <input type="text" class="form-control" id="name" name="name">
        </div>

        <div class="form-group">
            <label for="phone">联系方式</label>
            <input type="text" class="form-control" id="phone" name="phone">
        </div>

        <div class="form-group">
            <label for="profession-select">行业信息</label>
            <select class="form-control" id="profession-select">
                <option value="" selected disabled>请选择</option>
                <option>公务员、事业单位、国有企业</option>
                <option>公立学校、公立医院</option>
                <option>金融、通信、烟草、电力</option>
                <option>民营企业</option>
                <option>个体经营者</option>
                <option>无稳定职业但为邮储银行VIP客户</option>
                <option>其他</option>
            </select>

            <input type="text" class="form-control" id="profession-other" placeholder="手动输入"
                   style="margin-top: 8px; display: none;">
        </div>

        <div class="form-group">
            <label for="accumulation_fund">是否有公积金或社保</label>
            <ul id="accumulation_fund" class="form-control input-single-select">
                <li name="accumulation_fund">是<span class="glyphicon glyphicon-ok"></span></li>
                <li name="accumulation_fund">否<span class="glyphicon glyphicon-ok"></span></li>
            </ul>
        </div>

        <%--<div class="form-group">--%>
            <%--<label for="income">额度测算</label>--%>
            <%--<input type="number" class="form-control" id="income" name="income" placeholder="请输入您的月工资收入（元）">--%>
            <%--<p class="help-block"></p>--%>
        <%--</div>--%>

        <div class="form-group">
            <label for="bank1">经办支行</label>
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

        <div class="form-group">
            <label for="orgId">推荐机构（如有，请选择）</label>
            <select class="form-control" id="org-all" style="display: none;">
                <c:forEach items="${orgMapList}" var="item">
                    <optgroup label="${item.key}">
                        <c:forEach items="${item.value}" var="org">
                            <option value="${org.orgId}">${org.orgName}</option>
                        </c:forEach>
                    </optgroup>
                </c:forEach>
            </select>
            <select class="form-control" id="org-area">
                <option value="" selected disabled>请选择地区</option>
                <c:forEach items="${orgMapList}" var="item">
                    <option>${item.key}</option>
                </c:forEach>
            </select>
            <div style="margin-top: 8px;"></div>
            <select class="form-control" id="orgId" name="orgId">
            </select>
        </div>

        <div class="form-group">
            <label for="referee-phone">推荐人手机号</label>
            <input type="text" class="form-control" id="referee-phone" name="referee-phone">
        </div>

        <input type="hidden" name="profession">
        <input type="hidden" name="fund">
        <button type="button" class="btn btn-primary btn-block" onclick="submitForm()" style="margin-top: 30px;">申请
        </button>
    </form>
</div>

<div class="modal fade" id="result-modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">申请成功</h4>
            </div>
            <div class="modal-body">
                <p>sssss</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script src="<%=request.getContextPath()%>/static/lib/jQuery/jquery-2.2.3.min.js"></script>
<script src="<%=request.getContextPath()%>/static/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/lib/select2/select2.full.min.js"></script>
<script src="<%=request.getContextPath()%>/static/lib/select2/i18n/zh-CN.js"></script>
<script src="<%=request.getContextPath()%>/static/js/apply.js?v=3"></script>

</body>
</html>
