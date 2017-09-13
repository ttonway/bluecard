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
                            1. 一卡双功能：信用卡及交通卡双功能<br/>
                            2. 先通行后扣款<br/>
                            3. 高速通行费9折<br/>
                            4. 违章短信提醒
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xs-6 col-md-4">
            <a href="#">
                <div class="thumbnail">
                    <img src="<%=request.getContextPath()%>/static/images/card2.png">
                    <div class="caption">
                        <h4>苏通联名卡普卡</h4>
                        <p>
                            1. 一卡双功能：信用卡及交通卡双功能<br/>
                            2. 先通行后扣款<br/>
                            3. 高速通行费9折<br/>
                            4. 违章短信提醒
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="clearfix visible-xs-block"></div>
        <div class="col-xs-6 col-md-4">
            <a href="#">
                <div class="thumbnail">
                    <img src="<%=request.getContextPath()%>/static/images/card3.png">
                    <div class="caption">
                        <h4>EMS联名信用卡（普卡)</h4>
                        <p>
                            1. 自动成为中邮海外购会员<br/>
                            2. 尊享海淘转运费折扣<br/>
                            3. 享境内寄递邮费优惠
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
                        <h4>EMS联名信用卡（金卡)</h4>
                        <p>
                            1. 自动成为中邮海外购会员<br/>
                            2. 尊享海淘转运费折扣<br/>
                            3. 享境内寄递邮费优惠
                        </p>
                    </div>
                </div>
            </a>
        </div>
        <div class="clearfix visible-xs-block"></div>
        <div class="col-xs-6 col-md-4">
            <a href="#">
                <div class="thumbnail">
                    <img src="<%=request.getContextPath()%>/static/images/card5.png">
                    <div class="caption">
                        <h4>慈善公益卡普卡</h4>
                        <p>
                            1. 公益功能：客户发卡及消费，邮储银行均向江苏省慈善总会捐赠一定金额。<br/>
                            2. 优惠权益：享各类优惠活动，同时享南京南站高铁免费vip休息室服务。<br/>
                            3. 分期付款随心选择<br/>
                            4. 密码短信双重保护<br/>
                            5. 积分永久有效<br/>
                            6. 首年免年费，消费满6笔再免次年年费
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
                            1. 公益功能：客户发卡及消费，邮储银行均向江苏省慈善总会捐赠一定金额。<br/>
                            2. 优惠权益：享各类优惠活动，同时享南京南站高铁免费vip休息室服务。<br/>
                            3. 分期付款随心选择<br/>
                            4. 密码短信双重保护<br/>
                            5. 积分永久有效
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
                        <h4>普卡</h4>
                        <p>
                            1. 永久免年费<br/>
                            2. 分期付款手续费低<br/>
                            3. 密码短信双重保护<br/>
                            4. 消费享受长达50天免息还款期<br/>
                            5. 账单日可选<br/>
                            6. 积分永久有效
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
                        <h4>金卡</h4>
                        <p>
                            1. 实时交易提醒<br/>
                            2. 50%预借现金比例<br/>
                            3. 生日双倍积分<br/>
                            4. 尊享VIP服务<br/>
                            5. 应急额度调整
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
                        <h4>小白金（鼎雅）信用卡</h4>
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
            </a>
        </div>
        <div class="col-xs-6 col-md-4">
            <a href="#">
                <div class="thumbnail">
                    <img src="<%=request.getContextPath()%>/static/images/card10.png">
                    <div class="caption">
                        <h4>全币种卡</h4>
                        <p>
                            1. 银联&万事达双网络<br/>
                            2. 境外消费免收货币转换手续费<br/>
                            3. 支持海外网站购物支付，部分网站5%返现<br/>
                            4. 支付宝钱包和微信钱包便利支付<br/>
                            5. 首年免年费，消费满12笔再免次年年费
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
                            1. 具有较高的收藏有价值<br/>
                            2. 首年免年费，消费满6笔再免次年年费。<br/>
                            3. 免费交易提醒<br/>
                            4. 双倍积分礼遇<br/>
                            5. 尊享VIP服务
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
