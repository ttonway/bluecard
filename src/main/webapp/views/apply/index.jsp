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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/apply.css?v=5">

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
    <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
        <!-- Indicators -->
        <ol class="carousel-indicators" style="margin-bottom: 140px;">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
            <li data-target="#carousel-example-generic" data-slide-to="4"></li>
            <li data-target="#carousel-example-generic" data-slide-to="5"></li>
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
                        1. 免费赠送OBU<br/>
                        2. 高速通行9折<br/>
                        3. 0元洗车<br/>
                        4. 加油返现<br/>
                        5. 违章提醒
                    </p>
                </div>
            </div>
            <div class="item">
                <img class="background" src="<%=request.getContextPath()%>/static/images/bg9.jpg">
                <img class="card" src="<%=request.getContextPath()%>/static/images/card9.png">
                <div class="carousel-caption">
                    <h4>鼎雅白金卡</h4>
                    <div class="underline"></div>
                    <p>
                        1. 额度高，最高50万<br/>
                        2. 年费低，满足条件可减免<br/>
                        3. 权益多，不限次24小时道路救援等<br/>
                        4. 资费低，免挂失费、换卡费等<br/>
                        5. 尊享VIP，网点办理业务享受贵宾通道
                    </p>
                </div>
            </div>
            <div class="item">
                <img class="background" src="<%=request.getContextPath()%>/static/images/bg14.jpg">
                <img class="card" src="<%=request.getContextPath()%>/static/images/card14.png">
                <div class="carousel-caption">
                    <h4>鼎致白金卡</h4>
                    <div class="underline"></div>
                    <p>
                        1. 额度高，最高80万<br/>
                        2. 权益多，道路救援、机场高铁等多项服务<br/>
                        3. 资费低，免挂失费、换卡费等<br/>
                        4. 尊享银联&万事达白金服务礼遇<br/>
                        5. 尊享网点VIP服务
                    </p>
                </div>
            </div>
            <div class="item">
                <img class="background" src="<%=request.getContextPath()%>/static/images/bg12.jpg">
                <img class="card" src="<%=request.getContextPath()%>/static/images/card12.png">
                <div class="carousel-caption">
                    <h4>自动分期卡成长卡</h4>
                    <div class="underline"></div>
                    <p>
                        1. 分期费率低，0.54%每期<br/>
                        2. 手续费减免<br/>
                        3. 分期档次多<br/>
                        4. 双倍积分<br/>
                        自动分期、期数任选
                    </p>
                </div>
            </div>
            <div class="item">
                <img class="background" src="<%=request.getContextPath()%>/static/images/bg5.jpg">
                <img class="card" src="<%=request.getContextPath()%>/static/images/card6.png">
                <div class="carousel-caption">
                    <h4>慈善公益卡金卡</h4>
                    <div class="underline"></div>
                    <p>
                        1. 您消费，我捐款<br/>
                        2. 积分永久有效<br/>
                        3. 尊享网点VIP服务<br/>
                        4. 南京南站高铁VIP休息室服务
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
                        1. 收藏价值高<br/>
                        2. 尊享VIP服务<br/>
                        3. 免费交易提醒<br/>
                        4. 生日双倍积分
                    </p>
                </div>
            </div>
        </div>

        <div class="card-tips">以上权益与活动详询邮储银行官网</div>
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
