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
		<title>收料通知单</title>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		 <script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>
		<form action="warehouse/rewinder/rewinder_add3" method="post">
			<input type="hidden" name="purorderId" value="${purorder.id}" />

		<table class="title" style="width:85%">
				<tr>
					<td>
						收料通知单
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						供货单位：
					</td>
					<td>
						<input name="rewinder.suplyu" type="text" size="50" disabled="disabled"
							maxlength="100" value="${purorder.quaprolist.supplierinfo.supcname}"class="itemname"/>
						<input name="rewinder.suplyu" type="hidden" size="50"
							maxlength="100" value="${purorder.quaprolist.supplierinfo.supcname}"/>
					
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						编制日期：
					</td>
					<td>
						<input id="d244" type="text" size="50" class="Wdate checkDateInfo"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" name="rewinder.rew_date" />
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						备注信息:
					</td>
					<td>
						<input name="rewinder.rewnote" type="text" size="50"
							maxlength="100" class="itemname"/>
					</td>
				</tr>

				<tr>
					<td>
						采购 :
					</td>
					<td>
						<input type="text" disabled="disabled" size="50" maxlength="100"
							name = "rewinder.buyerEmployee.empName" value="${purorder.handing.empName}" />
						<input type="hidden" name="rewinder.buyerEmployee.empId" value="${purorder.handing.empId}"/>
						<font color="#FF0000">*</font>
					</td>
				</tr>
			</table>
			<table class="list">
				<tr>
				<th>

						保税号

					</th>
					<th>

						品名

					</th>
					<th>

						型 号 规 格

					</th>
					<th>

						单位

					</th>
					<th>

						数量

					</th>
					<th>

						单价

					</th>
					<th>

						金额

					</th>
					<th>

						备注

					</th>
					</tr>
				<c:forEach items="${purgoods}" var="purgood">
				<tr id="rowTemplete_0">
				<td align="center" valign="top">
						<input type="text" value="${purgood.itemtype.bondedNo}" size="10" id="itemNameId_0" disabled="disabled">
						<input type="hidden"  name="bsnos" id="itemIdId_0">

					</td>
					<td align="center" valign="top">
						<input type="text"  value="${purgood.itemtype.item.name}" size="10" id="itemNameId_0" disabled="disabled">
						<input type="hidden"name="itemId" id="itemIdId_0">

					</td>
					<td align="center" valign="top">
						<input type="text" size="8" name="itemTypeNameIds" value="${purgood.itemtype.name }"
							id="itemTypeNameId_0" disabled="disabled"></input>
						<input type="hidden" name="itemTypeIds" value="${purgood.itemtype.id }"/>

					</td>
					<td align="center" colspan="1" valign="top">
						<input name="rewunits" value="${purgood.unit}" disabled="disabled" type="text" size="8">
						<input name="rewunits" value="${purgood.unit}" type="hidden" size="8">
					</td>
					<td align="center" colspan="1" valign="top">
						<input name="rewnos" disabled="disabled" value="${purgood.num}"type="text" size="8">
						<input name="rewnos" value="${purgood.num}" type="hidden" size="8">
					</td>
					<td align="center" valign="top">
						<input name="rewuprices" disabled="disabled"  value="${purgood.uprice}" type="text" size="10">
						<input name="rewuprices" value="${purgood.uprice}" type="hidden" size="8">
					</td>
					<td align="center" valign="top">
						<input name="rewprices" disabled="disabled" value="${purgood.uprice*purgood.num}" type="text" size="10">
						<input name="rewprices" value="${purgood.uprice*purgood.num}" type="hidden" size="8">
					</td>
					<td align="center" valign="top">

						<input name="rewnotes" type="text" size="8">
					</td>
					</tr>
			</c:forEach>
			</table>
			<table>
				<tr bgcolor="f5f5f5">
					<td>
							<input type="submit" name="SYS_SET" value=" 提 交 " class="frm_btn">
							 <input type="button" class="frm_btn" value="取消" onclick=window.close();>
					</td>
				</tr>
			</table>
		</form>
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>
