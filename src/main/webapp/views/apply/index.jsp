<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/apply.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div class="container-fluid" style="padding-left: 0; padding-right: 0;">
    <img class="img-responsive" src="<%=request.getContextPath()%>/static/images/banner.png" style="width: 100%;">
    <div style="height: 15px; background-color: #f2f2f2;"></div>

    <table class="table table-bordered">
        <tbody>
        <tr>
            <td class="block" rowspan="2">
                <a href="<%=request.getContextPath()%>/link/page/car">
                    <div style="padding-top: 20px;"><span class="highlight">0</span>元洗车</div>
                    <img class="img-responsive" style="padding-top: 20px;"
                         src="<%=request.getContextPath()%>/static/images/car.png">
                </a>
            </td>
            <td class="block">
                <a href="<%=request.getContextPath()%>/link/page/movie">
                    <div style="padding-top: 20px;"><span class="highlight">9</span>元观影</div>
                    <img class="img-responsive" src="<%=request.getContextPath()%>/static/images/popcorn.png">
                </a>
            </td>
        </tr>
        <tr>
            <td class="block">
                <a href="<%=request.getContextPath()%>/link/page/gasoline">
                    <div>加油返现<br/><span class="highlight">5%-12%</span></div>
                    <img class="img-responsive" src="<%=request.getContextPath()%>/static/images/gasoline.png">
                </a>
            </td>
        </tr>
        <tr>
            <td class="block">
                <a href="<%=request.getContextPath()%>/link/page/dessert">
                    <div style="padding-top: 20px;"><span class="highlight">半价</span>甜点</div>
                    <img class="img-responsive" src="<%=request.getContextPath()%>/static/images/dessert.png">
                </a>
            </td>
            <td class="block">
                <div style="font-size: 14px;">OBU免费领<br/>高速通行费<span class="highlight">9</span>折</div>
                <img class="img-responsive" src="<%=request.getContextPath()%>/static/images/pass.png">
            </td>
        </tr>
        </tbody>
    </table>

    <div class="row" style="padding-right: 80px; padding-left: 80px; padding-top: 15px;">
        <a type="button" class="btn btn-primary btn-lg btn-block" href="#">立即申请</a>
    </div>

</div>

<script src="<%=request.getContextPath()%>/static/lib/jQuery/jquery-2.2.3.min.js"></script>
<script>
    $('.btn-primary').attr('href', "form?t=" + new Date().getTime());
</script>
</body>
</html>
