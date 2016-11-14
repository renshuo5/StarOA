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
		<title>产品进仓单</title>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
	
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
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
		<form action="produce/produceschdul/produceschdul_update"
			method="post">
			<input type="hidden" value="${productionSchdul.id}"
				name="productionSchdul.id" />
			<table class="title" style="width: 95%">
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
						<input type="text" name="productionSchdul.cha_no"
							value="${productionSchdul.cha_no}" />
					</td>
				</tr>
				<tr>
					<td>
						编制人：
					</td>
					<td>
						<input type="hidden" name="employee_menumake"
							value="${productionSchdul.menumake.empId}" />
						<input type="text" disabled="disabled"
							value="${productionSchdul.menumake.empName}" />

					</td>
				</tr>
				<tr>
					<td>
						原打印机型：
					</td>
					<td>
						<input type="text" id="itemTypeNameId0" disabled="disabled"
							name="productionSchdul.itemType.name"
							value="${productionSchdul.itemType.name}">
						<input type="hidden" name="itemtype_former" id="itemTypeIdId0"
							value="${productionSchdul.itemType.id}">
						<input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>item/itemtype/itemtype_selectInput?partnumber=0','selectItem',800, 600, 1);return false">
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						改装成机型 ：
					</td>
					<td>
						<input type="text" id="itemTypeNameId1" disabled="disabled"
							name="productionSchdul.itemType2.name"
							value="${productionSchdul.itemType2.name}">
						<input type="hidden" name="itemtype_pre" id="itemTypeIdId1"
							value="${productionSchdul.itemType2.id}">
						<input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>item/itemtype/itemtype_selectInput?partnumber=1','selectItem',800, 600, 1);return false">
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						借出数量：
					</td>
					<td>
						<input type="text" name="productionSchdul.bno"
							value="${productionSchdul.bno}" />
					</td>
				</tr>
				<c:if test="${productionSchdul.competeno!=null}">
				<tr>
					<td>
						完成改机进仓数量：
					</td>
					<td>
						<input type="text" name="productionSchdul.competeno"
							value="${productionSchdul.competeno}" />
					</td>
				</tr>
				</c:if>
				<tr>
					<td>
						下达日期：
					</td>
					<td>
						<input id="d244_0" type="text" class="Wdate"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2_0',skin:'whyGreen'})"
							value="${productionSchdul.startdate}" />
						<input type="hidden" id="d244_2_0"
							name="productionSchdul.startdate"
							value="${productionSchdul.startdate}" />
					</td>
				</tr>
				<tr>
					<td>
						完成日期 ：
					</td>
					<td>
						<input id="d244_1" type="text" class="Wdate"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2_1',skin:'whyGreen'})"
							value="${productionSchdul.enddate}" />
						<input type="hidden" id="d244_2_1" name="productionSchdul.enddate"
							value="${productionSchdul.enddate}" />
					</td>
				</tr>
				<tr>
					<td>
						产成品序号记录：
					</td>
					<td>
						<textarea name="productionSchdul.prorecord" cols="45" rows="9">${productionSchdul.prorecord}</textarea>
					</td>
				</tr>
				<c:if test="${productionSchdul.wssign.empId!=null}">
				<tr>
					<td>
						车间签字 ：
					</td>
					<td>
						<input type="hidden" value="${productionSchdul.wssign.empId}"
							name="employee_wssign">
						<input type="text" disabled="disabled"
							value="${productionSchdul.wssign.empName}" />
					</td>
				</tr>
				</c:if>
				<c:if test="${productionSchdul.whsign.empId!=null}">
				<tr>
					<td>
						仓库签字：
					</td>
					<td>
						<input type="hidden" value="${productionSchdul.whsign.empId}"
							name="employee_whsign">
						<input type="text" disabled="disabled"
							value="${productionSchdul.whsign.empName}" />
					</td>
				</tr>
				</c:if>
				<c:if test="${productionSchdul.exsign.empId!=null}">
				<tr>
					<td>
						检验签字：
					</td>
					<td>
						<input type="hidden" value="${productionSchdul.exsign.empId}"
							name="employee_exsign">
						<input type="text" disabled="disabled"
							value="${productionSchdul.exsign.empName}" />
					</td>
				</tr>
				</c:if>
				<tr>
					<td>
						备注：
					</td>
					<td>
						<textarea name="productionSchdul.channote" cols="30" rows="4"
							>${productionSchdul.channote}</textarea>
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