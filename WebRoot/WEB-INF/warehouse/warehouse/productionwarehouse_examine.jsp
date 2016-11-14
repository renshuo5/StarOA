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
		<title>产品进仓单</title>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>

		<form action="warehouse/warehouse/warehouse_examine" method="post">
			<input type="hidden" name="warehouseId" value="${warehouse.war_id}" />

			<table class="title" style="width:85%">
				<tr>
					<td>
						产品进仓单：
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						生协号：
					</td>
					<td>
					<input type="text" name="warehouse.warsn" disabled="disabled" value="${warehouse.warsn}"/>
						
					</td>
				</tr>

				<tr>
					<td>
						产品名称：
					</td>
					<td>
					<input type="text" name="warehouse.itemType.item.name" disabled="disabled" value="${warehouse.itemType.item.name}"/> 
						
				</tr>
				<tr>
					<td>
						规格型号：
					</td>
					<td>
					<input type="text" name="warehouse.itemType.name" disabled="disabled" value="${warehouse.itemType.name}"/>
						
				</tr>
				<tr>
					<td>
						数量：
					</td>
					<td>
					<input type="text" name="warehouse.warno" disabled="disabled" value="${warehouse.warno}"/>
						

					</td>
				</tr>
				<tr>
					<td>
						生产日期：
					</td>
					<td>
					<input type="text" name="warehouse.dateOfManufacture" disabled="disabled" value="${warehouse.dateOfManufacture}"/>
						
					</td>
				</tr>
				<tr>
					<td>
						检验人：
					</td>
					<td>
					<input type="text" name="warehouse.winpector" disabled="disabled" value="${warehouse.winpector}"/>
						
					</td>
				</tr>

				<tr>
					<td>
						生产部验收：
					</td>
					<td>
						<input type="text" name="warehouse.productionAcceptance" disabled="disabled" value="${warehouse.productionAcceptance}"/>
						
					</td>
				</tr>
				<tr>
					<td>
						仓库验收：
					</td>
					<td>
						<input type="text" name="warehouseAcceptance" size="50"
							maxlength="100" />
						<font color="#FF0000">*</font>

					</td>
				</tr>
				<tr>
					<td>
						说明：
					</td>
					<td>
						<input type="text" name="warehouse.whnote" disabled="disabled" value="${warehouse.whnote}"/>
						


					</td>
				</tr>


			</table>
			<table>

				<tr bgcolor="#f5f5f5">
					<td>
						<div align="center">
							<input type="submit" name="SYS_SET" value="入库" class="frm_btn"
								onclick="openWin('<%=basePath%>warehouse/storescheduling/storescheduling_addWarehouse?warehouseId=${warehouse.war_id}','addStoschWarehouse',800,600);return false">
					 <input type="button" class="frm_btn" value="取消" onclick=window.close();>
					 </div>
					 </td>
				</tr>
			</table>
		</form>
		<br>
	</body>
</html>
