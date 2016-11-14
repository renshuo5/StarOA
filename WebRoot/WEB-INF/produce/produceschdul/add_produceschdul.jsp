<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>打印机成品报告单</title>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
	   <script language="javascript" src="<%=basePath%>js/zjm.js"></script>
		
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
		<style type="text/css">
.tdright {
	font-size: 15px;
	color: #000;
	text-align: right;
	width: 30%;
}
</style>
	</head>
	<body>
		<form action="<%=basePath %>produce/produceschdul/produceschdul_add" method="post">
			<table class="title" style="width: 85%">
				<tr>
					<td>
						打印机成品报告单
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						编号：
					</td>
					<td>
						<input type="text" name="productionSchdul.cha_no" class="cnum" />
					</td>
				</tr>
				<tr>
					<td>
						编制单位：
					</td>
					<td>
						<input type="text" disabled="disabled" 
							value="${addUser.employee.empName}" />
						<input type="hidden" name="menumakeId"
							value="${addUser.employee.empId }" />
					</td>
				</tr>
				<tr>
					<td>
						原打印机型：
					</td>
					<td>
						<input type="text" id="itemTypeNameId0" disabled="disabled"
							name="productionSchdul.itemtype.name">
						<input type="hidden" name="itemtype_former" id="itemTypeIdId0">
						<input type="button" value="选择" class="frm_btn"
							onClick="openWin('<%=basePath%>item/itemtype/itemtype_selectInput?partnumber=0','selectItem',800, 600, 1);return false">
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						改装成机型 ：
					</td>
					<td>
						<input type="text" id="itemTypeNameId1" disabled="disabled">
						<input type="hidden" name="itemtype_pre" id="itemTypeIdId1">
						<input type="button" value="选择" class="frm_btn"
							onClick="openWin('<%=basePath%>item/itemtype/itemtype_selectInput?partnumber=1','selectItem',800, 600, 1);return false">
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						借出数量：
					</td>
					<td>
						<input type="text" name="productionSchdul.bno" class="checkNum_zjm"/>
					</td>
				</tr>
				
				<tr>
					<td>
						下达日期：
					</td>
					<td>
						<input id="d244_0" type="text" class="Wdate"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2_0',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2_0"
							name="productionSchdul.startdate" />
					</td>
				</tr>
				<tr>
					<td>
						完成日期 ：
					</td>
					<td>
						<input id="d244_1" type="text" class="Wdate"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2_1',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2_1" name="productionSchdul.enddate" />
					</td>
				</tr>
				<tr>
					<td>
						产成品序号记录：
					</td>
					<td>
						<textarea name="productionSchdul.prorecord" cols="30" rows="4"></textarea>
					</td>
				</tr>
				
				<tr>
					<td>
						备注：
					</td>
					<td>
						<textarea name="productionSchdul.channote" cols="30" rows="4"></textarea>
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						<input type="submit" name="SYS_SET" value=" 提 交 " class="frm_btn">
					</td>
					<td>
						<input type="button" class="frm_btn" value="取消"
							onclick=
	window.close();
>
					</td>
				</tr>
			</table>
		</form>
		<br>
		<SCRIPT type=text/javascript>
	$(document).ready(registerPre);
</SCRIPT>
	</body>
</html>