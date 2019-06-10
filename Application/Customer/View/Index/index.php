<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>首页</title>
</head>
<body>
<?php if ($_SESSION['id'] == '') {
    echo "123";
}
?>
<div class="wrapper_o">
    <div class="title" style="min-height: 80px"><br/>
        <center><span style="color:skyblue;">{$customerMsg['customer_name']}，您好！ 欢迎登录南京中理客户系统</span></center>
        <br><br>
        <div>

        </div>
    </div>
    <div style="border: solid #1E9FFF 4px;text-align: center;width: 800px;height:300px;margin:0 auto">
        <if condition="$WxQrimg neq no">
            <div style="text-align: center;">
                <span style="color:skyblue;font-size: 20px">您还未绑定微信，绑定微信后可接收货物进程通知。如有需要请扫描下方二维码</span>
            </div>
            <div style="border: #2e2f2f solid 2px;width: 220px;text-align: center;margin:0 auto;margin-top: 40px;">
                {$WxQrimg}
            </div>
            <else/>
            <div style="text-align: center;margin-top: 120px;">
                <span style="color:skyblue;font-size: 30px">您的微信已经绑定，业务状态变更时会接收到提醒</span>
            </div>
        </if>
    </div>
</div>
</body>
</html>