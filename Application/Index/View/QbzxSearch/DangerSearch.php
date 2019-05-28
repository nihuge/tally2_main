<head>
    <title>起驳装箱_危险品统计查询</title>
    <script src="__PUBLIC__/js/jquery.bigautocomplete.js"></script>
    <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/page.css"/>
    <link rel="stylesheet" type="text/css" href="__PUBLIC__/admin/css/rule.css"/>
    <link rel="stylesheet" href="__PUBLIC__/css/jquery.bigautocomplete.css"
          type="text/css"/>
    <script type="text/javascript" src="__PUBLIC__/js/my97/WdatePicker.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.right_list2').find('table tbody tr:even').css('background', '#fff');
        })
    </script>
</head>

<div id="wapper">
    <div class="right">
        <div class="right_top" style="background: none; border: 0">
            <div class="right_l" style="font-size: 16px;">
                当前位置：<a href="__MODULE__/Search/index">查询统计</a>&nbsp;&gt;&nbsp;危险品统计查询
            </div>
        </div>
        <div class="right_list2">
            <div class="addrule">
                <form class="select" action="__ACTION__" method="get">
                    <input type="hidden" name="p" value="1">
                    <input type="hidden" name="c" value="QbzxSearch">
                    <input type="hidden" name="a" value="DangerSearch">
                    船名：<!-- <select class="input1" name="ship_name" style="width: 135px">
							   <option value="">--默认全部--</option>
							   <volist name="shiplist" id="sl">
							   <option value="{$sl['id']}">{$sl['ship_name']}</option>
							   </volist>
						      </select> -->
                    <input type="text" name="ship_name" id='ship_name' class="input1">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    航次：<input type="text" name="voyage" class="input1"> &nbsp;&nbsp;&nbsp;&nbsp;
                    作业地点：<!-- <select class="input1" name="location_name" style="width: 135px">
							      <option value="">--默认全部--</option>
							      <volist name="locationlist" id="l">
							      <option value="{$l['id']}">{$l['location_name']}</option>
							      </volist>
						        </select>-->
                    <input type="text" name="location_name" id='location_name' class="input1">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    提单号：<input type="text" name="billno" class="input1">
                    <!--                    &nbsp;&nbsp;&nbsp;&nbsp;-->
                    <!--                    打印记录：<select class="input1" name="printed" style="width: 135px">-->
                    <!--                        <option value="">--默认全部--</option>-->
                    <!--                        <option value="1">已打印</option>-->
                    <!--                        <option value="2">未打印</option>-->
                    <!--                    </select>-->
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    危险品等级：<input type="text" name="dangerlevel" class="input1">
                    <br><br>
                    集装箱号：<input type="text" name="ctnno" class="input1">&nbsp;&nbsp;&nbsp;&nbsp;
                    整拼： <select class="input1" name="flflag" style="width: 135px">
                        <option value="">--默认全部--</option>
                        <option value="F">整箱</option>
                        <option value="L">拼箱</option>
                    </select> &nbsp;&nbsp;&nbsp;&nbsp;
                    箱型：<input type="text" name="ctn_type_code" class="input1">&nbsp;&nbsp;&nbsp;&nbsp;
                    <!--
                    箱型： <select class="input1" name="cube" style="width: 135px">
                        <option value="">--默认全部--</option>
                        <volist name="containerlist" id="cl">
                        <option value="{$cl['containertypecode']}">{$cl['containertypecode']}</option>
                        </volist>
                    </select> &nbsp;&nbsp;&nbsp;&nbsp;
                    -->
                    完成时间： 从 <input type="text" name="begin_time" class="input1 Wdate" onClick="WdatePicker()"
                                   style="width: 90px"> 到 <input type="text" name="end_time"
                                                                 class="input1 Wdate" onClick="WdatePicker()"
                                                                 style="width: 90px">
                    &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="查询"
                                                   style="background-color: #3398db !important; border-color: #3398db; color: #fff; font-size: 16px; text-align: center; padding: 3px 15px;">
                </form>
                <br>
                <form action="__CONTROLLER__/print_danger_pdf" method="post" style="float: left" id="downreport_form"
                      target="_blank">

                    <input type="submit"
                           id="downreport_btn"
                           value="下载危险品统计报告"
                           style="background-color: #3398db !important; border-color: #3398db; color: #fff; font-size: 16px; text-align: center; padding: 3px 15px;">
                </form>

            </div>
            <div style="clear: both;"></div>
            <div class="row" style="margin-top: 10px">
                <div class="col-xs-12">
                    <div>
                        <table width="100%" class="table">
                            <thead>
                            <tr>
                                <th><input id="checkAll" type="checkbox" id="checkAll"/>&nbsp;全选</th>
                                <th>提单号</th>
                                <th>箱号</th>
                                <th>箱型尺寸</th>
                                <th>箱主</th>
                                <th>货名</th>
                                <th>总件数</th>
                                <th>单位</th>
                                <th>危险品等级</th>
                                <th>备注</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <volist name="list" id="l">
                                <tr>
                                    <td>
                                        <input type="checkbox" name="ctn_id[]" value="{$l['ctn_id']}" id="choseid"/>
                                    </td>

                                    <td>
                                        <volist name="l.content" id="c">
                                            {$c['billno']}<br/>
                                        </volist>
                                    </td>

                                    <td>{$l['ctnno']}</td>
                                    <td>{$l['ctn_type_code']}</td>
                                    <td>{$l['ctn_master']}</td>
                                    <td>{$cargo_name[$l['content'][0]['billno']]}</td>
                                    <td>{$l['total_package']}</td>
                                    <td>{$l['content'][0]['package']}</td>
                                    <td>{$l['dangerlevel']}</td>
                                    <td>{$l['remark']}</td>
                                    <td>
                                        <a href="__CONTROLLER__/OperationFinishDetail/ctn_id/{$l['ctn_id']}">查看</a>
                                    </td>
                                </tr>
                            </volist>
                            </tbody>
                        </table>
                        <div class="pages">{$page}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function checkall(checked) {
        var input1 = $("input[id='choseid']");
        input1.each(function () {
                if (checked == true) {
                    if ($("input[id='down_reportid_" + this.defaultValue + "']").length <= 0) {
                        $("input[id='downreport_btn']").before("<input type=\"hidden\" name=\"ctn_id[]\" value=\"" + this.defaultValue + "\" id=\"down_reportid_" + this.defaultValue + "\"/>");
                    }
                } else {
                    $("input[id='down_reportid_" + this.defaultValue + "']").remove();
                }
            }
        );
    }

    $(function () {
        $("#checkAll").click(function () {

                $("input[id='choseid']").attr("checked", this.checked);
                checkall(this.checked);

            }
        );

        var $cost_id = $("input[id='choseid']");

        $cost_id.click(function () {
            if (this.checked == true) {
                if ($("input[id='down_reportid_" + this.defaultValue + "']").length <= 0) {
                    $("input[id='downreport_btn']").before("<input type=\"hidden\" name=\"ctn_id[]\" value=\"" + this.defaultValue + "\" id=\"down_reportid_" + this.defaultValue + "\"/>");
                }
            } else {
                $("input[id='down_reportid_" + this.defaultValue + "']").remove();
            }


            $("#checkAll").attr("checked", $cost_id.length == $("input[id='choseid']:checked").length ? true : false);

        });

    });
    $("#ship_name").bigAutocomplete({
        width: 135,
        data: [
            <?php
            foreach ($shiplist as $s) {
                echo '{title:"' . $s['ship_code'] . '",show:"' . $s['ship_name'] . '"},';
                echo '{title:"' . $s['ship_name'] . '",show:"' . $s['ship_name'] . '"},';
            }
            ?>
        ],
        callback: function (data) {

        }
    });
    $("#location_name").bigAutocomplete({
        width: 160,
        data: [
            <?php
            foreach ($locationlist as $l) {
                echo '{title:"' . $l['location_code'] . '",show:"' . $l['location_name'] . '"},';
                echo '{title:"' . $l['location_name'] . '",show:"' . $l['location_name'] . '"},';
            }
            ?>
        ],
        callback: function (data) {
            //alert(data.title);
        }
    });
</script>
