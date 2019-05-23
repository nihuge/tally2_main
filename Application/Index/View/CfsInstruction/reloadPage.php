<head>
<title>CFS 加载指令</title>
<link rel="stylesheet" type="text/css" href="__PUBLIC__/admin/css/pages.css">
<script src="__PUBLIC__/admin/js/jquery-1.js"></script>
<script src="__PUBLIC__/js/jquery.bigautocomplete.js"></script>
<link rel="stylesheet" href="__PUBLIC__/css/jquery.bigautocomplete.css" type="text/css" />
<style>
	.dis{
		background: #ccc;
		color:#ccc;
	}
</style>
</head>
<body>
	<div class="tanchuang">
		<form action="{:U('CfsInstruction/doReload')}" method="post">
			<h5 class="hh">加载指令</h5>
	        <hr style="width:300px;margin:5px auto;background:#abcdef;height:2px;">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="36" align="right" valign="middle">&nbsp;&nbsp;整箱：<input type="radio" name="type" value="blno" checked></td>
					<td>
					   &nbsp;&nbsp;&nbsp;&nbsp;拼箱：<input type="radio" name="type" value="ctnno" />
					</td>
				</tr>
				<tr >
					<td height="36" align="right" valign="middle">提单号：</td>
					<td><input type="text" class="article" name="blno" required="required" /></td>
				</tr>
				<tr >
					<td height="36" align="right" valign="middle">箱号：</td>
					<td><input type="text" class="dis article" name="ctnno" required="required" disabled /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>
					  <input type="submit" class="qr" value="确&nbsp;认" />&nbsp;&nbsp;&nbsp;
					  <input type="reset" class="qr" value="重&nbsp;置" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script>
$("input:radio").click(function(){
	var val = $("input:checked").val();
	if(val == "blno"){
		$("input[name='blno']").attr("disabled",false);
		$("input[name='blno']").removeClass("dis");
		$("input[name='ctnno']").attr("disabled",true);
		$("input[name='ctnno']").addClass("dis");
		$("input[name='code']").attr("disabled",true);
		$("input[name='code']").addClass("dis");
		$("input[name='voyage']").attr("disabled",true);
		$("input[name='voyage']").addClass("dis");
	} else {
		$("input[name='blno']").attr("disabled",true);
		$("input[name='blno']").addClass("dis");
		$("input[name='ctnno']").attr("disabled",false);
		$("input[name='ctnno']").removeClass("dis");
		$("input[name='code']").attr("disabled",false);
		$("input[name='code']").removeClass("dis");
		$("input[name='voyage']").attr("disabled",false);
		$("input[name='voyage']").removeClass("dis");
	}
});
</script>