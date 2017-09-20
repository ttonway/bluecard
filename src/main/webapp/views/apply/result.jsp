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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>

    </style>
</head>

<body>

<div class="container-fluid" style="padding-left: 0; padding-right: 0; text-align: center;">
    <img class="img-responsive" src="<%=request.getContextPath()%>/static/images/result_ok.png"
         style="margin: auto; padding: 30px 0 10px 0;">
    <h3>您的申请已成功</h3>
    <h4 style="color: #31b88e; margin-bottom: 20px;">我们将尽快与您联系</h4>
    <a href="http://c.eqxiu.com/s/40lGexs0">
        <img class="img-responsive" src="<%=request.getContextPath()%>/static/images/result_img.jpg"
             style="width: 100%;">
        <h5 style="color: #272727;">点击查看活动详情</h5>
    </a>
</div>

</body>
</html>
