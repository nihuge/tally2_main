<!DOCTYPE HTML>
<html>
<head>
    <title>起泊装箱_作业指令_修改关</title>
    <link rel="stylesheet" type="text/css" href="__PUBLIC__/admin/css/pages.css">
    <link rel="stylesheet" type="text/css" href="__PUBLIC__/admin/css/pages.css">
    <script type="text/javascript"
            src="__PUBLIC__/js/jquery.min.js"></script>

    <script type="text/javascript"
            src="__PUBLIC__/js/jquery.firstebox.pack.js"></script>
</head>
<body>
<div class="tanchuang">
    <input type="file" id="cargo_picture" style="display:none;" onchange="filechange(event)"
           accept="image/png,image/jpeg"/>

    <volist name="damageimg" id="img">
        <input type="file" id="{$img['id']}" style="display:none;" onchange="damagefilechange(event,'{$img['id']}')"
               accept="image/png,image/jpeg"/>
    </volist>

    <form action="__ACTION__" method="post">
        <input type="hidden" name="operation_id" value="{$operation_id}">
        <input type="hidden" name="level_id" value="{$level_id}">
        <h5 class="hh">修改关</h5>
        <hr style="width:300px;margin:5px auto;background:#abcdef;height:2px;">
        <table border="0">
            <tr>
                <td height="36" align="right" valign="middle">提单号：</td>
                <td>
                    <input type="text" class="article" name="billno" required="required" value="{$msg['billno']}"/>
                </td>
            </tr>
            <tr>
                <td height="36" align="right" valign="middle">货物件数：</td>
                <td>
                    <input type="text" class="article" name="cargo_number" required="required"
                           value="{$msg['cargo_number']}"/>
                </td>
            </tr>
            <tr>
                <td height="36" align="right" valign="middle">残损件数：</td>
                <td>
                    <input type="text" class="article" name="damage_num" required="required"
                           value="{$msg['damage_num']}"/>
                </td>
            </tr>
            <tr>
                <td height="36" align="right" valign="middle">关照片修改</td>
                <td>
                    <img src="./Public/upload/qbzx/cargo/{$levelimg['cargo_picture']}"
                         onclick="imgupload('cargo_picture')"
                         width="150px" height="200px"
                         id="img_cargo_picture"/>
                </td>
            </tr>
            <tr>
                <td height="36" align="right" valign="middle">关残损照片修改</td>
                <td>
                    <?php if (!empty($damageimg)) { ?>
                        <volist name="damageimg" id="img">
                            <img src="./Public/upload/qbzx/cdamage/{$img['damage_picture']}"
                                 onclick="imgupload('{$img['id']}')"
                                 width="150px" height="200px"
                                 id="img_{$img['id']}"/>
                        </volist>
                    <?php } else {
                        echo "无残损照片";
                    } ?>

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

    var level_id = '{$level_id}';
    var operation_id = '{$operation_id}';

    var imgupload = function (action) {
        $('#' + action).click();
    };


    /*$("#file").change(function (event) {*/
    var filechange = function (event) {
        var files = event.target.files, file;
        if (files && files.length > 0) {
            // 获取目前上传的文件
            file = files[0];//暂时不校验文件大小，虽然有可能超过php上传限制

            var formData = new FormData();
            formData.append("file", file);

            //ajax上传图片
            $.ajax({
                url: '__CONTROLLER__/levelImgUpload/operation_id/' + operation_id + '/level_id/' + level_id,
                type: 'post',
                data: formData,
                dataType: 'json',
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    if (data.status == "ok") {
                        $('#img_cargo_picture').attr('src', data.url);
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


    var damagefilechange = function (event, id) {
        var files = event.target.files, file;
        if (files && files.length > 0) {
            // 获取目前上传的文件
            file = files[0];//暂时不校验文件大小，虽然有可能超过php上传限制

            var formData = new FormData();
            formData.append("file", file);

            //ajax上传图片
            $.ajax({
                url: '__CONTROLLER__/damageImgUpload/operation_id/' + operation_id + '/level_id/' + level_id + '/id/' + id,
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