<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>要货计划单</title>

		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<!-- javascript -->
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js">
</script>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js">
</script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js">
</script>
		<script type="text/javascript" src="<%=basePath%>js/public.js">
</script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js">
</script>
		
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<!-- css -->
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/vip.css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		 <script type="text/javascript" src="<%=basePath%>js/produce.js"></script>

	</head>

	<body>
		<form action="produce/preparation/preparation_add" method="post">
			<table class="addTable">
				<tr>
					<td>
						编号
					</td>
					<td>
						<input type="text" name="preparation.presn" class="itemname" id="preparationpresn" /><span  id="checkpreparationpresn" style="color: #FF0000; font-size: 12px;" ></span>
					</td>
				</tr>
				<tr>

					<td>
						编制单位
					</td>
					<td>
						<input type="hidden" name="dptId" value="${department.id }"/>
						<input type="text" disabled="disabled" value="${department.dptName }"/>
					</td>
				</tr>
				<tr>
					<td>
						编制日期
					</td>
					<td>
						<input id="d244" type="text" class="Wdate"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_1',skin:'whyGreen'})" />
						<input type="hidden" id="d244_1" name="preparation.pdate" />
					</td>
				</tr>
				<tr>
					<td>
						编制人
					</td>
					<td>
						<input type="text" disabled="disabled"
							value="${preparation.person.empName }" />
					</td>
				</tr>
				<tr>
					<td>
						报送日期
					</td>
					<td>
						<input id="d245" type="text" class="Wdate"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" name="preparation.sdate" />
					</td>
				</tr>
			</table>

			<!-- 添加要货内容 -->
			<table class="list">
				<tr>
					<th>
						品名
					</th>
					<th>
						型号规格
					</th>
					<th>
						数量
					</th>
					<th>
						进仓时间
					</th>
					<th>
						备注
					</th>
					<th>
						添加
					</th>
					<th>
						删除
					</th>
				</tr>
				<tr id="rowTemplete_0">
					<td>
						<input type="hidden" name="itemIdList" />
						<input type="text" disabled="disabled" name="itemNameList"
							size="8" id="itemNameId_0" />
					</td>
					<td>
						<input type="hidden" name="itemTypeIdList" id="itemTypeIdId_0" />
						<input type="text" disabled="disabled" name="itemTypeNameList"
							id="itemTypeNameId_0" />
						<input id='item_0' type='button' value='选择' class="frm_btn"
							onclick="openWin('<%=basePath%>produce/preparation/preparation_selectItem?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false">
					</td>
					<td>
						<input type="text" name="preNumList" size="5" class="checkNum"/>
					</td>
					<td>
					    <input type="hidden" id="d244_2_0" name="edateList" />
						<input id="d244_0" type="text" class="Wdate" 
							onfocus="WdatePicker({dateFmt:'yyyy年MM月dd日',vel:'d244_2_0',skin:'whyGreen'})" />
						
					</td>
					<td>
						<input type="text" name="prenoteList" />
					</td>
					<td align="center">
						<img alt="添加" src="images/add.png" onclick="addBatchRow(this)">
					</td>
					<td align="center">
						<img src="images/del.png" alt="删除" onclick="deleteBatchRow(this)">
					</td>
				</tr>
				</table>
				<table class="btn" style="width:100%">
				<tr>
					<td>
						<input type="submit" value="提交" class="frm_btn"  id="SYS_SET"/>
					</td>
				</tr>
			</table>
		</form>
<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>

	</body>
</html>
