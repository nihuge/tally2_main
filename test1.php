<?php
header("Content-Type:text/html;charset=utf-8");
		$dbms='oci';                                 //数据库类型 ,对于开发者来说，使用不同的数据库，只要改这个，不用记住那么多的函数
		$dbName='192.168.86.200:1521/pormals.lct2005.com';        //使用的数据库
		$user='njfor';                              //数据库连接用户名
		$pass='njfor';                              //对应的密码
		$dsn="$dbms:dbname=$dbName";
		try {
		    $pdo = new PDO($dsn, $user, $pass);     //初始化一个PDO对象，就是创建了数据库连接对象$pdo
		    echo "Oracle数据库连接成功<br/>";
		    $sql = 'SELECT VESSEL_CODE, VOYAGE, BL_SO_NO, CONTAINER_NUMBER, CONTAINER_SIZE, POL, POD, CONTAINER_WEIGHT, YARD_LOCATION, VESSEL_LOCATION, CONTAINER_TYPE, CONTAINER_SERVICE_TYPE, EF_IND, CONTAINER_REEF_TEMP, DAMAGE_IND, OWNER_CODE, JC_IND, IO_FLAG, OPERATION_TIME, USER_ID, DG_IND,agent_code,container_imo,operator_code,un_code,oper_ind  from ACTOMS.temp_vessel_report_tb';
		    $data = $pdo->query($sql);
		    var_dump($data);
		    $pdo = null;
		} catch (PDOException $e) {
		    die ("Error!: " . $e->getMessage() . "<br/>");
		}



 ?>