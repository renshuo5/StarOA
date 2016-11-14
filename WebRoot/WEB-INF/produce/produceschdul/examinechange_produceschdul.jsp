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
		<form action="produce/produceschdul/produceschdul_excheck"
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
							value="${productionSchdul.cha_no}" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td>
						编制人：
					</td>
					<td>
						
						<input type="text" disabled="disabled"
							value="${productionSchdul.menumake.empName}" />
						<input type="hidden" name="menumakeId"
							value="${productionSchdul.menumake.empId}" />

					</td>
				</tr>
				<tr>
					<td>
						原打印机型：
					</td>
					<td>
						<input type="text" disabled="disabled"
							value="${productionSchdul.itemType.name}">
						<input type="hidden" name="itemTypeId"
							value="${productionSchdul.itemType.id}" />
					</td>
				</tr>
				<tr>
					<td>
						改装成机型 ：
					</td>
					<td>
						<input type="text" disabled="disabled"
							value="${productionSchdul.itemType2.name}">
						<input type="hidden" name="itemTypeId2"
							value="${productionSchdul.itemType2.id}" />
					</td>
				</tr>
				<tr>
					<td>
						借出数量：
					</td>
					<td>
						<input type="text" name="productionSchdul.bno" readonly="readonly" 
							value="${productionSchdul.bno}" />
					</td>
				</tr>
				<tr>
					<td>
						完成改机进仓数量：
					</td>
					<td>
						<input type="text" name="productionSchdul.competeno" />
					</td>
				</tr>
				<tr>
					<td>
						下达日期：
					</td>
					<td>
						<input type="text" id="d244_2_0"
							name="productionSchdul.startdate" readonly="readonly" 
							value="${productionSchdul.startdate}" />
					</td>
				</tr>
				<tr>
					<td>
						完成日期 ：
					</td>
					<td>
						
						<input type="text" id="d244_2_1" name="productionSchdul.enddate" 
							readonly="readonly" value="${productionSchdul.enddate}" />
					</td>
				</tr>
				<tr>
					<td>
						产成品序号记录：
					</td>
					<td>
						<textarea name="productionSchdul.prorecord" cols="45" rows="9" 
							readonly="readonly">${productionSchdul.prorecord}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						车间签字 ：
					</td>
					<td>
						<input type="text" disabled="disabled"
							value="${productionSchdul.wssign.empName}" />
						<input type="hidden" name="wssignId"
							value="${productionSchdul.wssign.empId}" />
					</td>
				</tr>
				<tr>
					<td>
						仓库签字：
					</td>
					<td>
							<input type="text" disabled="disabled"
							value="${productionSchdul.whsign.empName}" />
						<input type="hidden" name="whsignId"
							value="${productionSchdul.whsign.empId}" />
					</td>
				</tr>
				<tr>
					<td>
						检验签字：
					</td>
					<td>
							<input type="text" disabled="disabled"
							value="${addUser.employee.empName}" />
						<input type="hidden" name="exsignId"
							value="${addUser.employee.empId }" />
					</td>
				</tr>
				<tr>
					<td>
						备注：
					</td>
					<td>
						<textarea name="productionSchdul.channote" cols="65" rows="4" 
							readonly="readonly">${productionSchdul.channote}</textarea>
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
               
					<td>
						<input type="submit" name="SYS_SET" value=" 审核" class="frm_btn">
					</td>
					<td>
						<input type="button" class="frm_btn" value="取消"
							onclick="javascript:history.go(-1)";>
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