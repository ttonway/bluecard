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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/apply.css?v=4">

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
        <ol class="carousel-indicators" style="margin-bottom: 140px;">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            <li data-target="#carousel-example-generic" data-slide-to="4"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img class="background" src="<%=request.getContextPath()%>/static/images/bg1.jpg">
                <img class="card" src="<%=request.getContextPath()%>/static/images/card1.png">
                <div class="carousel-caption">
                    <h4>苏通联名卡金卡</h4>
                    <div class="underline"></div>
                    <p>
                        1. 一卡双功能：信用卡及交通卡双功能<br/>
                        2. 先通行后扣款<br/>
                        3. 高速通行费9折<br/>
                        4. 违章短信提醒
                    </p>
                </div>
            </div>
            <div class="item">
                <img class="background" src="<%=request.getContextPath()%>/static/images/bg3.jpg">
                <img class="card" src="<%=request.getContextPath()%>/static/images/card4.png">
                <div class="carousel-caption">
                    <h4>EMS联名信用卡（金卡)</h4>
                    <div class="underline"></div>
                    <p>
                        1. 自动成为中邮海外购会员<br/>
                        2. 尊享海淘转运费折扣<br/>
                        3. 享境内寄递邮费优惠
                    </p>
                </div>
            </div>
            <div class="item">
                <img class="background" src="<%=request.getContextPath()%>/static/images/background5.jpg">
                <img class="card" src="<%=request.getContextPath()%>/static/images/card6.png">
                <div class="carousel-caption">
                    <h4>慈善公益卡金卡</h4>
                    <div class="underline"></div>
                    <p>
                        1. 公益功能：客户发卡及消费，邮储银行均向江苏省慈善总会捐赠一定金额。<br/>
                        2. 优惠权益：享各类优惠活动，同时享南京南站高铁免费vip休息室服务。<br/>
                        3. 分期付款随心选择<br/>
                        4. 密码短信双重保护<br/>
                        5. 积分永久有效
                    </p>
                </div>
            </div>
            <div class="item">
                <img class="background" src="<%=request.getContextPath()%>/static/images/bg9.jpg">
                <img class="card" src="<%=request.getContextPath()%>/static/images/card9.png">
                <div class="carousel-caption">
                    <h4>小白金（鼎雅）信用卡</h4>
                    <div class="underline"></div>
                    <p>
                        1. 多项资费减免<br/>
                        2. 贵宾专线服务<br/>
                        3. 专属积分礼遇<br/>
                        4. 网点VIP服务<br/>
                        5. 尊享全球白金卡礼遇<br/>
                        6. 首年免年费，消费满7万或20笔再免次年年费
                    </p>
                </div>
            </div>
            <div class="item">
                <img class="background" src="<%=request.getContextPath()%>/static/images/bg11.jpg">
                <img class="card" src="<%=request.getContextPath()%>/static/images/card11.png">
                <div class="carousel-caption">
                    <h4>生肖信用卡</h4>
                    <div class="underline"></div>
                    <p>
                        1. 具有较高的收藏有价值<br/>
                        2. 首年免年费，消费满6笔再免次年年费。<br/>
                        3. 免费交易提醒<br/>
                        4. 双倍积分礼遇<br/>
                        5. 尊享VIP服务
                    </p>
                </div>
            </div>
        </div>

        <a class="view-more-card" href="cardlist">查看更多卡片</a>
        <a type="button" class="btn btn-primary btn-lg" href="#">立即申请</a>
        <img class="bottom-logo" src="<%=request.getContextPath()%>/static/images/bank-logo-white.png">

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <img src="<%=request.getContextPath()%>/static/images/arrow-left.png" aria-hidden="true">
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <img src="<%=request.getContextPath()%>/static/images/arrow-right.png" aria-hidden="true">
            <span class="sr-only">Next</span>
        </a>
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
