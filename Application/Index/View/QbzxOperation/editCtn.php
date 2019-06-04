<!DOCTYPE HTML>
<html>
<head>
    <title>起泊装箱_作业指令_修改箱</title>
    <link rel="stylesheet" type="text/css" href="__PUBLIC__/admin/css/pages.css">
    <script type="text/javascript"
            src="__PUBLIC__/js/jquery.min.js"></script>

    <script type="text/javascript"
            src="__PUBLIC__/js/jquery.firstebox.pack.js"></script>
</head>
<body>
<div class="tanchuang">
    <input type="file" id="halfclose" style="display:none;" onchange="filechange(event,'halfclose')"
           accept="image/png,image/jpeg"/>
    <input type="file" id="close" style="display:none;" onchange="filechange(event,'close')"
           accept="image/png,image/jpeg"/>
    <input type="file" id="seal" style="display:none;" onchange="filechange(event,'seal')"
           accept="image/png,image/jpeg"/>

    <volist name="empty_picture" id="l">
        <input type="file" id="{$l['id']}" style="display:none;" onchange="emptyfilechange(event,'{$l['id']}')"
               accept="image/png,image/jpeg"/>
    </volist>


    <form action="__ACTION__" method="post">
        <input type="hidden" name="operation_id" value="{$operation_id}">
        <input type="hidden" name="level_id" value="{$level_id}">
        <h5 class="hh">修改箱</h5>
        <p>
            <h5 style="color: red">(点击图片就可更换图片，提示上传成功时就已经生效，可以直接退出本窗口，不需要点击修改)</h5>
        </p>
        <br/>
        <hr style="width:300px;margin:5px auto;background:#abcdef;height:2px;">
        <table border="0">
            <tr>
                <td height="36" align="right" valign="middle">铅封号：</td>
                <td>
                    <input type="text" class="article" name="sealno" required="required" value="{$msg['sealno']}"/>
                </td>
            </tr>
            <tr>
                <td height="36" align="right" valign="middle">空箱重量：</td>
                <td>
                    <input type="text" class="article" name="empty_weight" required="required"
                           value="{$msg['empty_weight']}"/>
                </td>
            </tr>
            <tr>
                <td height="36" align="right" valign="middle">货物重量：</td>
                <td>
                    <input type="text" class="article" name="cargo_weight" required="required"
                           value="{$msg['cargo_weight']}"/>
                </td>
            </tr>
            <tr>
                <td>空箱照片修改</td>
                <td>
                    <volist name="empty_picture" id="l">
                        <img src="./Public/upload/qbzx/empty/{$l['empty_picture']}" onclick="imgupload('{$l['id']}')"
                             width="150px" height="200px"
                             id="img_{$l['id']}">
                    </volist>
                </td>
            </tr>
            <tr>
                <td>半关门照片修改</td>
                <td>
                    <img src="./Public/upload/qbzx/halfclosedoor/{$msg['halfclose_door_picture']}"
                         onclick="imgupload('halfclose')" width="150px"
                         height="200px"
                         id="img_halfclose">
                </td>
            </tr>
            <tr>
                <td>全关门照片修改</td>
                <td>
                    <img src="./Public/upload/qbzx/closedoor/{$msg['close_door_picture']}" onclick="imgupload('close')"
                         width="150px"
                         height="200px"
                         id="img_close">
                </td>
            </tr>
            <tr>
                <td>铅封照片修改</td>
                <td>
                    <img src="./Public/upload/qbzx/seal/{$msg['seal_picture']}" width="150px"
                         height="200px" onclick="imgupload('seal')"
                         id="img_seal">
                </td>
            </tr>
            <tr>
                <td height="36" align="right" valign="middle">修改原因：</td>
                <td>
                    <textarea rows="" cols="" name="remark" class="article"
                              style="width: 300px; height: 80px; border: 1px solid #888;"></textarea>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><input type="submit" class="qr" value="修&nbsp;改"/></td>
            </tr>

        </table>
    </form>


</div>
<script>
    var operation_id = '{$operation_id}';

    var imgupload = function (action) {
        $('#' + action).click();
    };


    /*$("#file").change(function (event) {*/
    var filechange = function (event, name) {
        var files = event.target.files, file;
        if (files && files.length > 0) {
            // 获取目前上传的文件
            file = files[0];//暂时不校验文件大小，虽然有可能超过php上传限制

            var formData = new FormData();
            formData.append("file", file);

            //ajax上传图片
            $.ajax({
                url: '__CONTROLLER__/ctnImgUpload/operation_id/' + operation_id + '/type/' + name,
                type: 'post',
                data: formData,
                dataType: 'json',
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    if (data.status == "ok") {
                        $('#img_' + name).attr('src', data.url);
                        alert("上传成功");
                    } else {
                        alert(data.msg);
                    }
                },
                error: function (data, status, e) {
                    alert(e);
                }
            });
        }
    };


    var emptyfilechange = function (event, id) {
        var files = event.target.files, file;
        if (files && files.length > 0) {
            // 获取目前上传的文件
            file = files[0];//暂时不校验文件大小，虽然有可能超过php上传限制

            var formData = new FormData();
            formData.append("file", file);

            //ajax上传图片
            $.ajax({
                url: '__CONTROLLER__/emptyImgUpload/operation_id/' + operation_id + '/id/' + id,
                type: 'post',
                data: formData,
                dataType: 'json',
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    if (data.status == "ok") {
                        $('#img_' + id).attr('src', data.url);
                        alert("上传成功");
                    } else {
                        alert(data.msg);
                    }
                },
                error: function (data, status, e) {
                    alert(e);
                }
            });
        }
    };
</script>

</body>