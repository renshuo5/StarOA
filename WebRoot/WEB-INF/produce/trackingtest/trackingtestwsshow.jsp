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
		<title>量试计划单</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css"
			type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
			<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<body>
			<div>
				跟踪单流向：→（
				<input type="text" disabled="disabled" size="5"
					value="${trackingtest.whDepartment.dptName}">
				）仓库→（
				<input type="text" value="${trackingtest.wsDepartment1.dptName}"
					size="5" disabled="disabled">
				）车间→（
				<input type="text" value="${trackingtest.wsDepartment1.dptName}"
					size="5" disabled="disabled" />
				）车间→检验部门→工艺→品工部
			</div>
			<table class="title addTable" >
				<tr>
					<td>
						量试过程跟踪单
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<div colspan="50%">
						<td>
							样品名称
						</td>
						<td>
							<input type="text" disabled="disabled"
								value="${trackingtest.testnotes.supplierinfo.itemname }" />
						</td>
					</div>
					<div colspan="50%">
						<td>
							型号:
						</td>
						<td>
							<input type="text" disabled="disabled"
								value="${trackingtest.testnotes.supplierinfo.itemtypename }" />
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							适用机种、部件
						</td>
						<td>
							<input type="text" value="${trackingtest.itemType.item.name }"
								disabled="disabled" size="10">
							<input disabled="disabled" type="text"
								value="${trackingtest.itemType.name }" size="10">
						</td>
					</div>
					<div colspan="50%">
						<td>
							量试通知单号：
						</td>
						<td>
							<a href="#" onclick="openWin('<%=basePath%>purchase/testnotes/testnotes_show?testnotesId=${trackingtest.testnotes.id}','examineTestnotes',800,600);return false">
							量试通知单<c:out value="${trackingtest.testnotes.id}"></c:out></a>
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							计划量试日期:
						</td>
						<td>
							<input type="text" disabled="disabled"
								value="${trackingtest.testdate}" />
						</td>
					</div>
					
				</tr>
				
			

			</table>
		</body>
</html>