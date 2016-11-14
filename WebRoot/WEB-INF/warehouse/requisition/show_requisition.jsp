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
		<title>领料单</title>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>

		<form action="warehouse/requisition/requisition_add" method="post">

			<table class="title" style="width:85%">
				<tr>
					<td>领料单:
					</td>
				</tr>
				</table>
			<table class="addTable">

				<tr>
					<td>
							单位：
					</td>
					<td>
					<input type="text" name="requisition.company" disabled="disabled" value="${requisition.company}"/>
						
					</td>
				</tr>
				<tr>
					<td>
							日期：
					</td>
					<td>
					<input type="text" name="requisition.reqDate" disabled="disabled" value="${requisition.reqDate}"/>
						
					</td>
				</tr>

				<tr>
					<td>
							核准：
					</td>
					<td>
					<input type="text" name="requisition.confirmper.empName" disabled="disabled" value="${requisition.confirmper.empName}"/>
						
					</td>
				</tr>
				<tr>
					<td>
							部门负责人：
					</td>
					<td>
					<input type="text" name="requisition.dptmanager" disabled="disabled" value="${requisition.dptmanager.empName}"/>
						
					</td>
				</tr>
				<tr>
					<td>
							领料人：
					</td>
					<td>
					<input type="text" name="requisition.pickingper" disabled="disabled" value="${requisition.pickingper.empName}"/>
						
					</td>
				</tr>
			</table>
			<table class="list">
				<tr >
					<th>
						编号
					</th>
					<th>
						材料代码
					</th>
					<th>
						品名
					</th>
					<th>
						规格型号
					</th>
					<th>
						计量单位
					</th>
					<th>
						申请数量
					</th>
					<th>
						实发数量
					</th>

					<th>
						单价
					</th>
					<th>
						金额
					</th>
					<th>
						用途
					</th>

				</tr>
				<c:forEach items="${picgoods}" var="picgood">
				<tr>
					<td align="center">
						${picgood.id}
					</td>
					<td align="center">
					<%--<input name="itemTypeIds" type="text" size="8" id="itemmCode${vs.index}" value="${shi2good.itemType.mCode}"  disabled="disabled">
					--%>
						${picgood.itemType.mCode }
					</td>
					<td align="center">
						${picgood.itemType.item.name}
					</td>
					<td align="center">
						${picgood.itemType.name}
					</td>
					<td align="center">
						${picgood.calunit}
					</td>
					<td align="center">
						${picgood.reqnum}
					</td>
					<td align="center">
						${picgood.factnum }
					</td>
					<td align="center">
						${picgood.ruprice }
					</td>
					<td align="center">
						${picgood.rprice }
					</td>
					<td align="center">
						${picgood.userf }
					</td>

				</tr>
				</c:forEach>
			</table>

			<table>
				<tr>
					<td align="center">
						
					<input type="button" name="SYS_SET"value="确定"
							class="frm_btn" size=5
							onclick="javascript:self.location='<%=basePath%>warehouse/requisition/requisition_list'" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
