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
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>




		<form action="warehouse/warehouse/warehouse_add" method="post">


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
					<input type="text" name="warehouse.itemType.item.name" disabled="disabled" value="${Warehouse.itemType.item.name}"/>
						
				</tr>

				<tr>
					<td>

						生产单位：

					</td>
					<td>
					<input type="text" name="warehouse.prunit" disabled="disabled" value="${warehouse.prunit}"/>
						
				</tr>


				<tr>
					<td>

						数量：

					</td>
					<td>
					<input type="text" name="warehouse.warno" disabled="disabled" value="${Warehouse.warno}"/>
						
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
						<input type="text" name="warehouse.winpector.empName" disabled="disabled" value="${warehouse.winpector.empName}"/>
						
					</td>
				</tr>

				<tr>
					<td>

						生产部验收：

					</td>
					<td>
						<input type="text" name="Warehouse.productionAcceptance" disabled="disabled" value="${Warehouse.productionAcceptance}"/>
						

					</td>
				</tr>

				<tr>
					<td>

						仓库验收：

					</td>
					<td>
					<input type="text" name="Warehouse.whmg.empName" disabled="disabled" value="${Warehouse.whmg.empName}"/>
						
					</td>
				</tr>



				<tr>
					<td>

						入库日期：

					</td>
					<td>
					<input type="text" name="Warehouse.warehouseDate" disabled="disabled" value="${Warehouse.warehouseDate}"/>
						
					</td>

				</tr>



				<tr>
					<td>

						说明：

					</td>
					<td>
						<input type="text" name="Warehouse.whnote" disabled="disabled" value="${Warehouse.whnote}"/>
						
					</td>
				</tr>


			</table>
			<table style="width:85%">
				<tr bgcolor="#f5f5f5">
					<td align="center">

					<input type="button" name="SYS_SET"  value="确定"
						class="frm_btn" size=5
						onclick="javascript:self.location='<%=basePath%>warehouse/warehouse/warehouse_list'" />

					</td>
				</tr>
			</table>
		</form>
		<br>
	</body>
</html>
