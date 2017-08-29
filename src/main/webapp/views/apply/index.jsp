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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/apply.css?v=2">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
        body {
            background-color: #fff;
        }

        html, body {
            height: 100%;
        }

        .container-fluid {
            padding: 0;
            height: 100%;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators" style="margin-bottom: 70px;">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            <li data-target="#carousel-example-generic" data-slide-to="4"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img class="background" src="<%=request.getContextPath()%>/static/images/background1.jpg">

                <div class="carousel-caption">
                    <div class="underline"></div>
                    <div>
                        <span class="highlight">0元</span>洗车
                    </div>
                </div>
            </div>
            <div class="item">
                <img class="background" src="<%=request.getContextPath()%>/static/images/background2.jpg">
                <div class="carousel-caption">
                    <div class="underline"></div>
                    <div>
                        <span class="highlight">9元</span>观影
                    </div>
                </div>
            </div>
            <div class="item">
                <img class="background" src="<%=request.getContextPath()%>/static/images/background3.jpg">
                <div class="carousel-caption">
                    <div class="underline"></div>
                    <div>
                        加油返现<span class="highlight">5%-12%</span>
                    </div>
                </div>
            </div>
            <div class="item">
                <img class="background" src="<%=request.getContextPath()%>/static/images/background4.jpg">
                <div class="carousel-caption">
                    <div class="underline"></div>
                    <div>
                        <span class="highlight">半价</span>甜点
                    </div>
                </div>
            </div>
            <div class="item">
                <img class="background" src="<%=request.getContextPath()%>/static/images/background5.jpg">
                <div class="carousel-caption">
                    <div class="underline"></div>
                    <div>
                        OBU免费赠<br/>
                        高速通行费<span class="highlight">9折</span>
                    </div>
                </div>
            </div>
        </div>
        <img class="top-logo" src="<%=request.getContextPath()%>/static/images/card-logo.png">
        <a type="button" class="btn btn-warning btn-lg" href="#">立即申请卡片</a>
        <img class="bottom-logo" src="<%=request.getContextPath()%>/static/images/bank-logo-white.png">
    </div>
</div>

<script src="<%=request.getContextPath()%>/static/lib/jQuery/jquery-2.2.3.min.js"></script>
<script src="<%=request.getContextPath()%>/static/lib/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/lib/carousel-swipe.js"></script>
<script>
    $(function () {
        $('.carousel').carousel();
        $('a[type="button"]').attr('href', "form?t=" + new Date().getTime());
    });
</script>

</body>
</html>
