<head>
    <title>起驳装箱_完成作业查询</title>
    <link rel="stylesheet" type="text/css" href="__PUBLIC__/css/page.css"/>
    <link rel="stylesheet" type="text/css" href="__PUBLIC__/admin/css/rule1.css"/>
    <script type="text/javascript" src="__PUBLIC__/js/my97/WdatePicker.js"></script>
    <script src="__PUBLIC__/js/jquery.bigautocomplete.js"></script>
    <link rel="stylesheet" href="__PUBLIC__/css/jquery.bigautocomplete.css" type="text/css"/>
    <script type="text/javascript">
        $(function () {
            $('.right_list2').find('table tbody tr:even').css('background', '#fff');
        })
    </script>
    <style>
        .searchabc ul li {
            list-style: none;
            float: left;
            margin-left: 30px;
        }

        .searchabc ul li a {
            text-decoration: none;
            color: #505050;
            line-height: 60px;
            font-family: "新宋体";
            font-size: 17px;
            background: #f0f0f0;
            border: 1px solid #f0f0f0;
            border-radius: 5px;
            padding: 10px 5px;
        }

        .searchabc ul li a:hover {
            color: #fff;
            background: #3398db;
        }
    </style>
</head>

<div id="wapper" class="sywapper">
    <div class="right">
        <div class="wrapper_o">
            <div class="title">
                <span></span>
            </div>
            <div style="min-height: 80px;width: 1176px; margin: 0 auto;">
                <div class="searchabc">
                    <p style="font-size:22px;color:#000;letter-spacing:2px;">起驳装箱查询统计</p>
                    <ul style="margin-left:-32px;">
                        <li><a href="__MODULE__/QbzxSearch/RealTime">实时作业查询</a></li>
                        <li><a href="__MODULE__/QbzxSearch/OperationFinish" style="background:#3398db;color:#fff;">完成作业查询</a>
                        </li>
                        <li><a href="__MODULE__/QbzxSearch/ProveByCtn">分箱单证查询</a></li>
                        <li><a href="__MODULE__/QbzxSearch/ProveByTicket">分票单证查询</a></li>
                        <!--li ><a href="__MODULE__/QbzxSearch/ProveByShip">分驳船单证查询</a></li-->
                    </ul>
                </div>
            </div>
        </div>
        <div class="right_list2">
            <div class="addrule" style="height: 110px">
                <form class="select" action="__ACTION__" method="get">
                    <input type="hidden" name="p" value="1">
                    <input type="hidden" name="c" value="QbzxSearch">
                    <input type="hidden" name="a" value="OperationFinish">
                    船 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<input type="text" class="input1" name="ship_name"
                                                                   id="shipname" autocomplete="off"
                                                                   style="text-transform: uppercase;"/> &nbsp;&nbsp;&nbsp;
                    航次：<input type="text" name="voyage" class="input1"> &nbsp;&nbsp;&nbsp;&nbsp;
                    作业地点： <select class="input1" name="location_name" style="width: 135px">
                        <option value="">--默认全部--</option>
                        <volist name="locationlist" id="l">
                            <option value="{$l['id']}">{$l['location_name']}</option>
                        </volist>
                    </select>&nbsp;&nbsp;&nbsp;&nbsp;
                    提&nbsp;&nbsp;单&nbsp;&nbsp;号： <input type="text" name="billno" class="input1"><br><br>
                    集装箱号：<input type="text" name="ctnno" class="input1">&nbsp;&nbsp;&nbsp;&nbsp;
                    整拼： <select class="input1" name="flflag" style="width: 135px">
                        <option value="">--默认全部--</option>
                        <option value="F">整箱</option>
                        <option value="L">拼箱</option>
                    </select> &nbsp;&nbsp;&nbsp;&nbsp;
                    箱 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型： <input type="text" name="ctn_type_code" class="input1">&nbsp;&nbsp;&nbsp;&nbsp;
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
                                                   style="background-color: #f1691e !important; border-color: #3398db; color: #fff; font-size: 16px; text-align: center; padding: 3px 15px;">
                </form>
                <br/>
                <form action="__CONTROLLER__/pack_img" method="post" style="float: left" id="getimg_form">

                    <input type="submit"
                           id="getimg_btn"
                           value="图片下载"
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
                                <th>船名</th>
                                <th>航次</th>
                                <th>作业场地</th>
                                <th>箱号</th>
                                <th>箱型尺寸</th>
                                <th>铅封号</th>
                                <th>总票数</th>
                                <th>总件数</th>
                                <th>总重量</th>
                                <th>总残损</th>
                                <th>完成时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <volist name="list" id="l">
                                <tr>
                                    <td>
                                        <input type="checkbox" name="ctn_id[]" value="{$l['ctn_id']}" id="choseid"/>
                                    </td>
                                    <td>{$l['ship_name']}</td>
                                    <td>{$l['voyage']}</td>
                                    <td>{$l['location_name']}</td>
                                    <td>{$l['ctnno']}</td>
                                    <td>{$l['ctn_type_code']}</td>
                                    <td>{$l['sealno']}</td>
                                    <td>{$l['total_ticket']}</td>
                                    <td>{$l['total_package']}</td>
                                    <td>{$l['total_weight']}</td>
                                    <td>{$l['damage_num']}</td>
                                    <td>{$l['createtime']}</td>
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
<script>
    function checkall(checked) {
        var input1 = $("input[id='choseid']");
        input1.each(function () {
                if (checked == true) {
                    if ($("input[id='pack_imgid_" + this.defaultValue + "']").length <= 0) {
                        $("input[id='getimg_btn']").before("<input type=\"hidden\" name=\"ctn_id[]\" value=\"" + this.defaultValue + "\" id=\"pack_imgid_" + this.defaultValue + "\"/>");
                    }
                } else {
                    $("input[id='pack_imgid_" + this.defaultValue + "']").remove();
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
                if ($("input[id='pack_imgid_" + this.defaultValue + "']").length <= 0) {
                    $("input[id='getimg_btn']").before("<input type=\"hidden\" name=\"ctn_id[]\" value=\"" + this.defaultValue + "\" id=\"pack_imgid_" + this.defaultValue + "\"/>");
                }
            } else {
                $("input[id='pack_imgid_" + this.defaultValue + "']").remove();
            }


            $("#checkAll").attr("checked", $cost_id.length == $("input[id='choseid']:checked").length ? true : false);

        });

    });

    $("#shipname").bigAutocomplete({
        width: 160,
        data: [
            <?php
            foreach ($shiplist as $s) {
                echo '{title:"' . $s['ship_code'] . '",show:"' . $s['ship_name'] . '"},';
                echo '{title:"' . $s['ship_name'] . '",show:"' . $s['ship_name'] . '"},';
            }
            ?>
        ],
        callback: function (data) {
            //alert(data.title);
        }
    });
</script>