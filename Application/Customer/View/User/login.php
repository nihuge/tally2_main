<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link rel="stylesheet" type="text/css" href="__PUBLIC__/admin/css/login.css" />
</head>
<body>
	<div class="form">
		<form action="__MODULE__/User/login" method="post">
			<input type="hidden" name="system" value="pc">
			<table>
				<tr>
					<td width="70" height="35" align="right" valign="middle">账&nbsp;&nbsp;号：</td>
					<td><input type="text" class="itext" name="customer_code" style="border-radius:5px;height:30px;border:0px;line-height:30px;"/></td>
				</tr>
				<tr>
					<td height="35" align="right" valign="middle" >密&nbsp;&nbsp;码：</td>
					<td><input type="password" class="itext" name="customer_pwd" style="border-radius:5px;height:30px;border:0px;line-height:30px"/></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" class="dl" value="登录" style="font-size:16px;line-height:10px;"/>&nbsp;&nbsp;<input type="reset" class="dl" value="重置" style="font-size:16px;line-height:10px;"/></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="class-foot">
	    <div class="class-foot-child">
	      <p>版权所有  南京中理外轮理货有限公司   苏ICP备10220284号-1</p>
	      <p><a href="http://new.xzitc.com" target="view_window">技术支持：携众信息</a></p>
	    </div>
	</div>
</body>
</html>