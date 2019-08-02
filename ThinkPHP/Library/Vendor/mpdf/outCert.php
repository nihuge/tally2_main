<?php
require_once 'mpdf.php';

//header("Content-type: text/html; charset=utf-8");

class outCert
{

    private $search_arr = array(
        '{ward}',
        '{ship_name}',
        '{voyage}',
        '{nationality}',
        '{commenced_time}',
        '{list_time}',

        '{break.quantity}',
        '{break.unit}',
        '{break.holidays}',
        '{break.night_shifts}',

        '{loaded.feet_20.quantity}',
        '{loaded.feet_20.unit}',
        '{loaded.feet_20.holidays}',
        '{loaded.feet_20.night_shifts}',
        '{loaded.feet_40.quantity}',
        '{loaded.feet_40.unit}',
        '{loaded.feet_40.holidays}',
        '{loaded.feet_40.night_shifts}',
        '{loaded.feet_45.quantity}',
        '{loaded.feet_45.unit}',
        '{loaded.feet_45.holidays}',
        '{loaded.feet_45.night_shifts}',

        '{empty.feet_20.quantity}',
        '{empty.feet_20.unit}',
        '{empty.feet_20.holidays}',
        '{empty.feet_20.night_shifts}',
        '{empty.feet_40.quantity}',
        '{empty.feet_40.unit}',
        '{empty.feet_40.holidays}',
        '{empty.feet_40.night_shifts}',
        '{empty.feet_45.quantity}',
        '{empty.feet_45.unit}',
        '{empty.feet_45.holidays}',
        '{empty.feet_45.night_shifts}',

        '{special.name}',
        '{special.feet_20.quantity}',
        '{special.feet_20.unit}',
        '{special.feet_20.holidays}',
        '{special.feet_20.night_shifts}',
        '{special.feet_40.quantity}',
        '{special.feet_40.unit}',
        '{special.feet_40.holidays}',
        '{special.feet_40.night_shifts}',
        '{special.feet_45.quantity}',
        '{special.feet_45.unit}',
        '{special.feet_45.holidays}',
        '{special.feet_45.night_shifts}',

        '{other}',

        '{tally_name}',
        '{sign_picture}',

    );
    private $replace_arr = array();

    /*    private $headerhtml = <<<headhtml
    <table width="80%" style="margin:0 auto;border-bottom: 1px solid #4F81BD; vertical-align: middle; font-family:
    serif; font-size: 9pt; color: #000088;">
    <tbody>
    <tr>
    <td width="60%"></td>
    <td width="40%" align="right" style="text-align: right;"><img src="report_logo.png" width="148"></td>
    </tr>
    </tbody>
    </table>
    headhtml;

        private $foothtml = <<<foothtml
    <table width="80%" style=" vertical-align: bottom; font-family:
    serif; font-size: 9pt; color: #000088;">
    <tbody>
    <tr>
    <td style="text-align: center">{PAGENO}/{nb}</td>
    </tr>
    <tr align="center">
    <td align="center"><img src="report_foot_logo.png" style="margin-left: 60px;" width="800px" height="97px"></td>
    </tr>
    </tbody>
    </table>
    foothtml;*/

    private $html = <<<Reporthtml
	<table style="border-collapse: collapse; font-size: 15px;text-align: center;">
		<tbody>
<tr>
<td colspan="4">
	<img src="Public/img/cert_logo.jpg" height="70px">
	</td>
</tr>

<tr>
	<td>
	</td>

	<td style="font-size: 23px;" colspan="3">
TALLY&nbsp;CERTIFICATE
</td>
</tr>
<tr>
	<td>
	</td>
	<td style="font-size: 19px;" colspan="3">
{ward}
</td>
</tr>															
<tr>
	<td>
	</td>
	<td style="text-align: left">
		Vessel:&nbsp;<u>&nbsp;{ship_name}&nbsp;</u>
	</td>
	<td>
		Voy.&nbsp;No.&nbsp;<u>&nbsp;{voyage}&nbsp;</u>
	</td>
	<td style="text-align: left">
		Nationality:&nbsp;<u>&nbsp;{nationality}&nbsp;</u>
	</td>
</tr>
	<tr>
		<td>
	</td>
	<td colspan="2" style="text-align: left">
		Tally&nbsp;commenced&nbsp;on:&nbsp;<u>&nbsp;{commenced_time}&nbsp;</u>
	</td>

	<td style="text-align: left">
		Date&nbsp;&nbsp;of&nbsp;&nbsp;list:&nbsp;<u>&nbsp;{list_time}&nbsp;</u>
	</td>
</tr>

</tbody>
</table>

<table width="88%" style="border-collapse: collapse;margin-left: 20px;text-align: center;">
<tbody>
<tr>
<td>
<img src="Public/img/cert_detail.jpg">
</td>
</tr>
</toby>
</table>

<table width="90%" style="border-collapse: collapse; font-size: 14px;margin-left: 35px;text-align: center;">
					<thead>
						<tr style="text-align:center;font-size:14px;">
							<th style="height:35px;border: 1px solid #000;width: 20px;">NO.</th>
							<th style="height:35px;border: 1px solid #000;width: 100px;" colspan="2">Tally items</th>
							<th style="height:35px;border: 1px solid #000;width: 100px;">Quantity</th>
							<th style="height:35px;border: 1px solid #000;width: 100px;">Unit</th>
							<th style="height:35px;border: 1px solid #000;width: 100px;">Tally on holidays</th>
							<th style="height:35px;border: 1px solid #000;width: 120px;">Tallied at night shifts</th>
						</tr>
					</thead>
                    <tbody>
                    <tr style="text-align:center;font-size:12px;height: 5%;">
                    	<th style="height:35px;border: 1px solid #000;width: 20px;">1</td>
                        <th style="height:35px;border: 1px solid #000;width: 100px;" colspan="2">Break&nbsp;-&nbsp;bulk&nbsp;cargo</td>
                        <th style="height:35px;border: 1px solid #000">{break.quantity}</td>
                        <th style="height:35px;border: 1px solid #000">{break.unit}</td>
                        <th style="height:35px;border: 1px solid #000">{break.holidays}</td>
						<th style="height:35px;border: 1px solid #000">{break.night_shifts}</td>
                    </tr>
                    <tr style="text-align:center;font-size:12px;height: 5%;">
                    	<th style="height:35px;border: 1px solid #000;width: 20px;" rowspan="9">2</td>
                        <th style="height:35px;border: 1px solid #000;width: 80px;" rowspan="3">Containers&nbsp;<br/><br/>(Loaded)</td>
                        <th style="height:35px;border: 1px solid #000;width: 20px;">20'</td>
                        <th style="height:35px;border: 1px solid #000;">{loaded.feet_20.quantity}</td>
                        <th style="height:35px;border: 1px solid #000">{loaded.feet_20.unit}</td>
                        <th style="height:35px;border: 1px solid #000">{loaded.feet_20.holidays}</td>
                        <th style="height:35px;border: 1px solid #000">{loaded.feet_20.night_shifts}</td>
                    </tr>
                    <tr style="text-align:center;font-size:12px;height: 5%;">
                        <th style="height:35px;border: 1px solid #000;width: 20px;">40'</td>
                        <th style="height:35px;border: 1px solid #000">{loaded.feet_40.quantity}</td>
                        <th style="height:35px;border: 1px solid #000">{loaded.feet_40.unit}</td>
                        <th style="height:35px;border: 1px solid #000">{loaded.feet_40.holidays}</td>
                        <th style="height:35px;border: 1px solid #000">{loaded.feet_40.night_shifts}</td>
                    </tr>
                    <tr style="text-align:center;font-size:12px;height: 5%;">
                        <th style="height:35px;border: 1px solid #000;width: 20px;">45'</td>
                        <th style="height:35px;border: 1px solid #000">{loaded.feet_45.quantity}</td>
                        <th style="height:35px;border: 1px solid #000">{loaded.feet_45.unit}</td>
                        <th style="height:35px;border: 1px solid #000">{loaded.feet_45.holidays}</td>
                        <th style="height:35px;border: 1px solid #000">{loaded.feet_45.night_shifts}</td>
                    </tr>
                    <tr style="text-align:center;font-size:12px;height: 5%;">
                        <th style="height:35px;border: 1px solid #000;width: 80px;" rowspan="3">Containers&nbsp;<br/><br/>(Empty)</td>
                        <th style="height:35px;border: 1px solid #000;width: 20px;">20'</td>
                        <th style="height:35px;border: 1px solid #000">{empty.feet_20.quantity}</td>
                        <th style="height:35px;border: 1px solid #000">{empty.feet_20.unit}</td>
                        <th style="height:35px;border: 1px solid #000">{empty.feet_20.holidays}</td>
                        <th style="height:35px;border: 1px solid #000">{empty.feet_20.night_shifts}</td>
                    </tr>
                    <tr style="text-align:center;font-size:12px;height: 5%;">
                        <th style="height:35px;border: 1px solid #000;width: 20px;">40'</td>
                        <th style="height:35px;border: 1px solid #000">{empty.feet_40.quantity}</td>
                        <th style="height:35px;border: 1px solid #000">{empty.feet_40.unit}</td>
                        <th style="height:35px;border: 1px solid #000">{empty.feet_40.holidays}</td>
                        <th style="height:35px;border: 1px solid #000">{empty.feet_40.night_shifts}</td>
                    </tr>
                    <tr style="text-align:center;font-size:12px;height: 5%;">
                        <th style="height:35px;border: 1px solid #000;width: 20px;">45'</td>
                        <th style="height:35px;border: 1px solid #000">{empty.feet_45.quantity}</td>
                        <th style="height:35px;border: 1px solid #000">{empty.feet_45.unit}</td>
                        <th style="height:35px;border: 1px solid #000">{empty.feet_45.holidays}</td>
                        <th style="height:35px;border: 1px solid #000">{empty.feet_45.night_shifts}</td>
                    </tr>
                    <tr style="text-align:center;font-size:12px;height: 5%;">
                        <th style="height:35px;border: 1px solid #000;width: 80px;" rowspan="3">{special.name}</td>
                        <th style="height:35px;border: 1px solid #000;width: 20px;">20'</td>
                        <th style="height:35px;border: 1px solid #000">{special.feet_20.quantity}</td>
                        <th style="height:35px;border: 1px solid #000">{special.feet_20.unit}</td>
                        <th style="height:35px;border: 1px solid #000">{special.feet_20.holidays}</td>
                        <th style="height:35px;border: 1px solid #000">{special.feet_20.night_shifts}</td>
                    </tr>
                    <tr style="text-align:center;font-size:12px;height: 5%;">
                        <th style="height:35px;border: 1px solid #000;width: 20px;">40'</td>
                        <th style="height:35px;border: 1px solid #000">{special.feet_40.quantity}</td>
                        <th style="height:35px;border: 1px solid #000">{special.feet_40.unit}</td>
                        <th style="height:35px;border: 1px solid #000">{special.feet_40.holidays}</td>
                        <th style="height:35px;border: 1px solid #000">{special.feet_40.night_shifts}</td>
                    </tr>
                    <tr style="text-align:center;font-size:12px;height: 5%;">
                        <th style="height:35px;border: 1px solid #000;width: 20px;">45'</td>
                        <th style="height:35px;border: 1px solid #000">{special.feet_45.quantity}</td>
                        <th style="height:35px;border: 1px solid #000">{special.feet_45.unit}</td>
                        <th style="height:35px;border: 1px solid #000">{special.feet_45.holidays}</td>
                        <th style="height:35px;border: 1px solid #000">{special.feet_45.night_shifts}</td>
                    </tr>
                    {other}
                    <tr style="font-size:11px;height: 5%;">
                    <th style="height:100px;" colspan="3" align="center">
                    <div style="margin-top: 70px;">
                    Chief&nbsp;Tally:&nbsp;<u>{tally_name}</u>
                    </div>
                    </td>
                    <th style="height:100px;" colspan="3" align="right">
                    <div style="margin-top: 70px;">
                    Master/Chief&nbsp;Officer/Entrusting&nbsp;party:&nbsp;
                    </div>
                    <th style="height:100px;" align="left">
                    <div style="margin-top: 70px;">
                    {sign_picture}
                    </div>
                    </td>
                    </tr>
                    </tbody>
</table>

Reporthtml;


    public function setReportValue($report_arr)
    {
        //ward
        if ($report_arr['ward'] == 1) {
            $this->replace_arr[] = "(<span>Inward</span>&nbsp;/&nbsp;<del>Outward</del>)";
        } else {
            $this->replace_arr[] = "(<del>Inward</del>&nbsp;/&nbsp;<span>Outward</span>)";
        }
        //构成基本数据
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['ship_name']) ? $report_arr['ship_name'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['voyage']) ? $report_arr['voyage'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['nationality']) ? $report_arr['nationality'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['commenced_time']) ? $report_arr['commenced_time'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['list_time']) ? $report_arr['list_time'] : "");


        //构造散装货物数据
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['breakcargo']['quantity']) ? $report_arr['content']['content']['breakcargo']['quantity'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['breakcargo']['unit']) ? $report_arr['content']['content']['breakcargo']['unit'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['breakcargo']['holidays']) ? $report_arr['content']['content']['breakcargo']['holidays'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['breakcargo']['night_shifts']) ? $report_arr['content']['content']['breakcargo']['night_shifts'] : "");


        //构造重箱数据 20英尺
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['loaded']['feet_20']['quantity']) ? $report_arr['content']['content']['loaded']['feet_20']['quantity'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['loaded']['feet_20']['unit']) ? $report_arr['content']['content']['loaded']['feet_20']['unit'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['loaded']['feet_20']['holidays']) ? $report_arr['content']['content']['loaded']['feet_20']['holidays'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['loaded']['feet_20']['night_shifts']) ? $report_arr['content']['content']['loaded']['feet_20']['night_shifts'] : "");
        //40英尺
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['loaded']['feet_40']['quantity']) ? $report_arr['content']['content']['loaded']['feet_40']['quantity'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['loaded']['feet_40']['unit']) ? $report_arr['content']['content']['loaded']['feet_40']['unit'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['loaded']['feet_40']['holidays']) ? $report_arr['content']['content']['loaded']['feet_40']['holidays'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['loaded']['feet_40']['night_shifts']) ? $report_arr['content']['content']['loaded']['feet_40']['night_shifts'] : "");
        //45英尺
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['loaded']['feet_45']['quantity']) ? $report_arr['content']['content']['loaded']['feet_45']['quantity'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['loaded']['feet_45']['unit']) ? $report_arr['content']['content']['loaded']['feet_45']['unit'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['loaded']['feet_45']['holidays']) ? $report_arr['content']['content']['loaded']['feet_45']['holidays'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['loaded']['feet_45']['night_shifts']) ? $report_arr['content']['content']['loaded']['feet_45']['night_shifts'] : "");


        //构造空箱数据 20英尺
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['empty']['feet_20']['quantity']) ? $report_arr['content']['content']['empty']['feet_20']['quantity'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['empty']['feet_20']['unit']) ? $report_arr['content']['content']['empty']['feet_20']['unit'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['empty']['feet_20']['holidays']) ? $report_arr['content']['content']['empty']['feet_20']['holidays'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['empty']['feet_20']['night_shifts']) ? $report_arr['content']['content']['empty']['feet_20']['night_shifts'] : "");
        //40英尺
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['empty']['feet_40']['quantity']) ? $report_arr['content']['content']['empty']['feet_40']['quantity'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['empty']['feet_40']['unit']) ? $report_arr['content']['content']['empty']['feet_40']['unit'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['empty']['feet_40']['holidays']) ? $report_arr['content']['content']['empty']['feet_40']['holidays'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['empty']['feet_40']['night_shifts']) ? $report_arr['content']['content']['empty']['feet_40']['night_shifts'] : "");
        //45英尺
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['empty']['feet_45']['quantity']) ? $report_arr['content']['content']['empty']['feet_45']['quantity'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['empty']['feet_45']['unit']) ? $report_arr['content']['content']['empty']['feet_45']['unit'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['empty']['feet_45']['holidays']) ? $report_arr['content']['content']['empty']['feet_45']['holidays'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['empty']['feet_45']['night_shifts']) ? $report_arr['content']['content']['empty']['feet_45']['night_shifts'] : "");


        //构造特殊箱数据 特殊箱名称
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['special']['name']) ? $report_arr['content']['content']['special']['name'] : "");
        //20英尺
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['special']['feet_20']['quantity']) ? $report_arr['content']['content']['special']['feet_20']['quantity'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['special']['feet_20']['unit']) ? $report_arr['content']['content']['special']['feet_20']['unit'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['special']['feet_20']['holidays']) ? $report_arr['content']['content']['special']['feet_20']['holidays'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['special']['feet_20']['night_shifts']) ? $report_arr['content']['content']['special']['feet_20']['night_shifts'] : "");
        //40英尺
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['special']['feet_40']['quantity']) ? $report_arr['content']['content']['special']['feet_40']['quantity'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['special']['feet_40']['unit']) ? $report_arr['content']['content']['special']['feet_40']['unit'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['special']['feet_40']['holidays']) ? $report_arr['content']['content']['special']['feet_40']['holidays'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['special']['feet_40']['night_shifts']) ? $report_arr['content']['content']['special']['feet_40']['night_shifts'] : "");
        //45英尺
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['special']['feet_45']['quantity']) ? $report_arr['content']['content']['special']['feet_45']['quantity'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['special']['feet_45']['unit']) ? $report_arr['content']['content']['special']['feet_45']['unit'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['special']['feet_45']['holidays']) ? $report_arr['content']['content']['special']['feet_45']['holidays'] : "");
        $this->replace_arr[] = str_replace(array(" ", "\r\n", "\n"), array("&nbsp;", "<br/>", "<br/>"), isset($report_arr['content']['content']['special']['feet_45']['night_shifts']) ? $report_arr['content']['content']['special']['feet_45']['night_shifts'] : "");


        $other = '<tr style="text-align:center;font-size:12px;height: 5%;">
                    	<th style="height:30px;border: 1px solid #000;width: 20px;" >{id}</td>
                        <th style="height:30px;border: 1px solid #000;width: 100px;" colspan="2">{other_name}</td>
                        <th style="height:30px;border: 1px solid #000;width: 100px;">{value}</td>
                        <th style="height:30px;border: 1px solid #000"></td>
                        <th style="height:30px;border: 1px solid #000;width: 100px;"></td>
                        <th style="height:30px;border: 1px solid #000"></td>
                    </tr>';

        $other_html = "";
        for ($i = 3; $i <= 10; $i++) {
            $other_html .= str_replace(array("{id}", "{other_name}", "{value}"), array($i, $report_arr['content']['other'][$i - 3]['name'], $report_arr['content']['other'][$i - 3]['value']), $other);
        }

        $this->replace_arr[] = $other_html;
        $this->replace_arr[] = $report_arr['operator_name'];
        if ($report_arr['sign_picture'] != "") {
            $this->replace_arr[] = '<img src="Public/upload/cert/sign/' . $report_arr['sign_picture'] . '" width="120px" height="80px" style="margin-right:2px"/>';
        } else {
            $this->replace_arr[] = "_________";
        }


    }

    /**
     * 检测文件是否存在，不存在则新建
     * @param $dir
     * @param int $mode
     * @return bool
     */
    public function mkdirs($dir, $mode = 0777)
    {
        if (is_dir($dir) || @mkdir($dir, $mode)) return TRUE;
        if (!$this->mkdirs(dirname($dir), $mode)) return FALSE;
        return @mkdir($dir, $mode);
    }

    /**
     * 删除创建时间超过5天的文件
     * @param $dir
     * @return int
     */
    public function read_all_dir($dir)
    {
        $num = 0;
        $handle = opendir($dir);//读资源
        if ($handle) {
            $file = readdir($handle);
            while (($file = readdir($handle)) !== false) {
                if ($file != '.' && $file != '..') {
                    $cur_path = $dir . DIRECTORY_SEPARATOR . $file;
                    if (is_dir($cur_path)) {//判断是否为目录，递归读取文件
                        $num += $this->read_all_dir($cur_path);
                    } else {
                        if (time() - filemtime($cur_path) > 3600) {//如果此文件创建时间超过了一个小时则删除
                            @unlink($cur_path);
                            $num++;
                        }
//                    else{
//
//                    }
//                    $result['file'][] = $cur_path;
                    }
                }
            }
            closedir($handle);
        }
        return $num;
    }

    public function outputReport($type = "")
    {

        $mpdf = new mPDF('zh-cn', 'A4', 0, '宋体', 0, 0);
        //加入数据并渲染
//        if (!empty($this->replace_arr)) {
        $this->html = str_replace($this->search_arr, $this->replace_arr, $this->html);

//            $mpdf->allow_charset_conversion = true;
//            $mpdf->charset_in = 'iso-8859-4';


        //添加页眉和页脚到pdf中
//            $mpdf->SetHTMLHeader($this->headerhtml);
//            $mpdf->SetHTMLFooter($this->foothtml);

//            $mpdf->SetDisplayMode('fullpage');
//        $mpdf->shrink_tables_to_fit = 1;
//            $this->html = mb_convert_encoding($this->html, 'UTF-8', 'UTF-8');

        $mpdf->WriteHTML($this->html);


        if ($type != "") {
            $document_path = dirname(dirname(dirname(dirname(dirname(__FILE__)))));
            $return_path = "/Public/PDF/Cert/";
            $filename = uniqid("Cert__") . rand(100, 999) . ".pdf";

            $real_path = $document_path . $return_path;
            //判断目录是否存在。删除5天前的数据
            $this->mkdirs($real_path);
            $this->read_all_dir($real_path);

            $mpdf->Output($real_path . $filename, 'F');
            exit(json_encode(array(
                'code' => 1,
                'path' => $return_path . $filename
            ), JSON_UNESCAPED_SLASHES));
        } else {
            $mpdf->Output('Cert.pdf','I');
            exit;
        }

//            echo $this->html;
//        } else {
//            return array('error' => 1, 'msg' => "值为空");
//        }
    }
}

/*$aa = new outCert();
$value = array(
    'khmc' => '客户名称123123',
    'khbm' => '客户部门123123',
    'bfsj' => '拜访时间12312312',
    'bfdd' => '拜访地点123123123',
    'bfry' => '拜访人员123123123',
    'wfry' => '我方人员123123',
    'bfsy' => '拜访事由123123',
    'jlnr' => '交流内容',
    'jljg' => '交流结果',
    'ft' => array('http://imgbdb2.bendibao.com/img/20194/17/2019417114841_12763.png', 'http://imgbdb2.bendibao.com/img/20194/17/2019417114841_12763.png', 'http://imgbdb2.bendibao.com/img/20194/17/2019417114841_12763.png', 'http://imgbdb2.bendibao.com/img/20194/17/2019417114841_12763.png', 'http://imgbdb2.bendibao.com/img/20194/17/2019417114841_12763.png'),
);

$aa->setReportValue($value);
$aa->outputReport(111);*/
