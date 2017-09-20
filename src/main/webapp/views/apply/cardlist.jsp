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

    <title>邮政储蓄银行信用卡</title>

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
            padding-top: 20px;
        }

        .row {
            margin-right: -5px;
            margin-left: -5px;
        }

        .col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {
            padding-right: 10px;
            padding-left: 10px;
        }

        .thumbnail {
            border: 2px solid #30b78f;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-xs-6 col-md-4">
            <a href="#">
                <div class="thumbnail">
                    <img src="<%=request.getContextPath()%>/static/images/card1.png">
                    <div class="caption">
                        <h4>苏通联名卡金卡</h4>
                        <p>
                            1. 免费赠送OBU<br/>
                            2. 高速通行<span class="highlight">9折</span><br/>
                            3. <span class="highlight">0元</span>洗车<br/>
                            4. 加油返现最高<span class="highlight">12%</span><br/>
                            5. 违章提醒
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xs-6 col-md-4">
            <a href="#">
                <div class="thumbnail">
                    <img src="<%=request.getContextPath()%>/static/images/card6.png">
                    <div class="caption">
                        <h4>慈善公益卡金卡</h4>
                        <p>
                            1. <span class="highlight">您消费，我捐款</span><br/>
                            2. 积分永久有效<br/>
                            3. 尊享网点<span class="highlight">VIP</span>服务<br/>
                            4. 南京南站高铁<span class="highlight">VIP</span>休息室服务
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="clearfix visible-xs-block"></div>
        <div class="col-xs-6 col-md-4">
            <a href="#">
                <div class="thumbnail">
                    <img src="<%=request.getContextPath()%>/static/images/card9.png">
                    <div class="caption">
                        <h4>鼎雅白金卡</h4>
                        <p>
                            1. 额度高，最高<span class="highlight">50万</span><br/>
                            2. 年费低，满足条件可减免<br/>
                            3. 权益多，<span class="highlight">不限次24小时道路救援等</span><br/>
                            4. 资费低，免挂失费、换卡费等<br/>
                            5. 尊享VIP，网点办理业务享受贵宾通道
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xs-6 col-md-4">
            <a href="#">
                <div class="thumbnail">
                    <img src="<%=request.getContextPath()%>/static/images/card14.png">
                    <div class="caption">
                        <h4>鼎致白金卡</h4>
                        <p>
                            1. 额度高，最高<span class="highlight">80万</span><br/>
                            2. 权益多，<span class="highlight">道路救援、机场高铁等多项服务</span><br/>
                            3. 资费低，免挂失费、换卡费等<br/>
                            4. 尊享银联&万事达白金服务礼遇<br/>
                            5. 尊享网点VIP服务
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="clearfix visible-xs-block"></div>
        <div class="col-xs-6 col-md-4">
            <a href="#">
                <div class="thumbnail">
                    <img src="<%=request.getContextPath()%>/static/images/card12.png">
                    <div class="caption">
                        <h4>自动分期卡成长卡</h4>
                        <p>
                            1. 分期费率低，<span class="highlight">0.54%</span>每期<br/>
                            2. 手续费减免<br/>
                            3. 分期档次多<br/>
                            4. <span class="highlight">双倍积分</span>
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xs-6 col-md-4">
            <a href="#">
                <div class="thumbnail">
                    <img src="<%=request.getContextPath()%>/static/images/card13.png">
                    <div class="caption">
                        <h4>自动分期鸿运卡</h4>
                        <p>
                            1. 额度高，最高<span class="highlight">15万</span><br/>
                            2. 分期费率低，<span class="highlight">0.57%</span>每期<br/>
                            3. 手续费减免<br/>
                            4. 分期档次多
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="clearfix visible-xs-block"></div>
        <div class="col-xs-6 col-md-4">
            <a href="#">
                <div class="thumbnail">
                    <img src="<%=request.getContextPath()%>/static/images/card11.png">
                    <div class="caption">
                        <h4>生肖信用卡</h4>
                        <p>
                            1. <span class="highlight">收藏价值高</span><br/>
                            2. 尊享<span class="highlight">VIP</span>服务<br/>
                            3. 免费交易提醒<br/>
                            4. 生日双倍积分
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xs-6 col-md-4">
            <a href="#">
                <div class="thumbnail">
                    <img src="<%=request.getContextPath()%>/static/images/card4.png">
                    <div class="caption">
                        <h4>EMS联名卡金卡</h4>
                        <p>
                            1. 自动成为中邮海外购会员<br/>
                            2. <span class="highlight">免收货币转换费</span><br/>
                            3. 海淘转运费最低<span class="highlight">8折</span>
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="clearfix visible-xs-block"></div>
        <div class="col-xs-6 col-md-4">
            <a href="#">
                <div class="thumbnail">
                    <img src="<%=request.getContextPath()%>/static/images/card7.png">
                    <div class="caption">
                        <h4>标准普卡IC信用卡</h4>
                        <p>
                            1. 终身<span class="highlight">免年费</span><br/>
                            2. 积分永久有效<br/>
                            3. 消费免息期长，最长<span class="highlight">50天</span>
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xs-6 col-md-4">
            <a href="#">
                <div class="thumbnail">
                    <img src="<%=request.getContextPath()%>/static/images/card8.png">
                    <div class="caption">
                        <h4>标准金卡IC信用卡</h4>
                        <p>
                            1. 预借现金比例高，<span class="highlight">50%</span><br/>
                            2. 安全性高，<span class="highlight">48小时失卡保障</span><br/>
                            3. 生日双倍积分<br/>
                            4. 免费短信提醒
                        </p>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>

<script src="<%=request.getContextPath()%>/static/lib/jQuery/jquery-2.2.3.min.js"></script>
<script src="<%=request.getContextPath()%>/static/lib/bootstrap/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $('.col-xs-6 a').attr('href', "form?t=" + new Date().getTime());
    });
</script>
</body>
</html>
