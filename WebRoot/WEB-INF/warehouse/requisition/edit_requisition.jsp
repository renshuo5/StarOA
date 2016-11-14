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
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>

		<form action="warehouse/requisition/requisition_update" method="post">
			<input type="hidden" name="requisition.req_id"
				value="${requisition.req_id}" />
			<table class="title" style="width: 85%">
				<tr>
					<td>
						修改领料单：
					</td>
				</tr>
			</table>
				<table class="addTable">
					<tr>
						<td>
							单位：
						</td>
						<td>
							<input type="text" name="requisition.company"
								value="${requisition.company}" size="50" maxlength="100"
								class="itemname" id="requisitioncompany" />
							<font color="#FF0000">*</font>
						</td>
					</tr>

					<tr>
						<td>
							日期：
						</td>
						<td>
							<input id="d244" type="text" class="Wdate"
								value="${requisition.reqDate }"
								onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
							<input type="hidden" id="d244_2" name="requisition.reqDate"
								value="${requisition.reqDate}" />
							<font color="#FF0000">*</font>
						</td>
					</tr>
					<tr>
						<td>
							部门负责人：
						</td>
						<td>
					
						<select name="dptmanager">
						<option value="requisition.dptmanager.empId">${requisition.dptmanager.empName}</option>
				<c:forEach items="${dptmanagers}" var="manager">
				
				<c:if test="${manager.empId!=requisition.dptmanager.empId}">
				<option value="${manager.empId}">${manager.empName}</option>
				</c:if>
				
				</c:forEach>
				</select>
				<font color="#FF0000">*</font>
					</tr>
					<tr>
						<td>
							领料人：
						</td>
						<td>
							<input type="text" name=""
								disabled="disabled"
								
								value="${requisition.pickingper.empName}" size="50"
								maxlength="100" />
									<input type="hidden" name="requisition.pickingper.empId"
								
								
								value="${requisition.pickingper.empId}" size="50"
								maxlength="100" />
						</td>
					</tr>
				</table>
				<table class="list" id="tb">
					<!-- 模板行开始 -->
					<tr>
						<th>
							材料代码
						</th>
						<th>
							名 称
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
							单价
						</th>
						<th>
							金额
						</th>
						<th>
							用 途
						</th>
						<th>
							添加
						</th>
						<th>
							删除
						</th>
					</tr>

					<tr id="rowTemplete_0">
						<td align="center" valign="top">
							<input name="itemTypeIds" type="text" size="8" id="itemmCode_0"
								disabled="disabled">
						</td>
						<td align="center" valign="top">
							<input type="text" size="10" id="itemNameId_0"
								disabled="disabled">
							<input type="hidden" name="itemId" id="itemIdId_0">

						</td>
						<td align="center" valign="top">
							<input type="text" size="10" name="itemTypeNameIds"
								id="itemTypeNameId_0" disabled="disabled"></input>
							<input type="hidden" name="itemTypeIds" id="itemTypeIdId_0"></input>
							<input type="button" value="选择" class="frm_btn"
								onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false">
							<font color="#FF0000">*</font>

						</td>
						<td align="center">
							<input type="text" name="calunits" class="itemname" />
							<font color="#FF0000">*</font>
						</td>
						<td align="center">
							<input type="text" name="reqnums" class="itemname" />
							<font color="#FF0000">*</font>
						</td>
						<td align="center">
							<input type="text" name="ruprices" class="itemname" />
							<font color="#FF0000">*</font>
						</td>
						<td align="center">
							<input type="text" name="rprices" class="itemname" />
						</td>
						<td align="center">
							<input type="text" name="userfs" class="itemname" />
							<font color="#FF0000">*</font>
						</td>
						<td align="center">
							<img src="<%=basePath%>images/add.png"
								onclick=
	addBatchRow(this);;;
/>
						</td>
						<td align="center">
							<img src="<%=basePath%>images/del.png"
								onclick=
	deleteBatchRow(this);;;
/>
						</td>
					</tr>
					<!-- 模板行结束 -->
					<c:forEach items="${picgoods}" var="picgood" varStatus="vs">
						<tr>
							<td align="center" valign="top">
								<input name="itemTypeIds" type="text" size="8"
									id="itemmCode${vs.index}" value="${picgood.itemType.mCode}"
									disabled="disabled">
							</td>
							<td align="center" valign="top">
								<input type="text" size="10" id="itemNameId${vs.index }"
									disabled="disabled" value="${picgood.itemType.item.name }">
								<input type="hidden" name="itemId" id="itemIdId${vs.index }"
									value="${picgood.itemType.item.id }">
								<input type="button" value="选择" class="frm_btn"
									onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=${vs.index }','selectItem',800, 600, 1);return false">

							</td>
							<td align="center" valign="top">
								<input type="text" name="itemTypeNameIds"
									value="${picgood.itemType.name}"
									id="itemTypeNameId${vs.index }" disabled="disabled"></input>
								<input type="hidden" name="itemTypeIds"
									id="itemTypeIdId${vs.index }" value="${picgood.itemType.id }"></input>

							</td>
							<td align="center">
								<input type="text" name="calunits" value="${picgood.calunit}"
									class="itemname" />
							</td>
							<td align="center">
								<input type="text" name="reqnums" value="${picgood.reqnum}"
									class="itemname" />
							</td>
							<td align="center">
								<input type="text" name="ruprices" value="${picgood.ruprice}"
									class="itemname" />
							</td>
							<td align="center">
								<input type="text" name="rprices" value="${picgood.rprice}"
									class="itemname" />
							</td>
							<td align="center">
								<input type="text" name="userfs" value="${picgood.userf}"
									class="itemname" />
							</td>
							<td align="center">
								<img src="<%=basePath%>images/add.png"
									onclick=
	addBatchRow(this);;;
/>
							</td>
							<td align="center">
								<img src="<%=basePath%>images/del.png"
									onclick=
	deleteBatchRow(this);;;
/>
							</td>
						</tr>
					</c:forEach>
				</table>
				<table>
					<tr bgcolor="#f5f5f5">
						<td align="center">
							<input type="submit" name="SYS_SET" value=" 提 交 " class="frm_btn"
								id="SYS_SET">
							<input type="button" class="frm_btn" value="取消"
								onclick=
	window.close();
>
						</td>
					</tr>
				</table>
				<SCRIPT type=text/javascript>
	$(document).ready(registerPre);
</SCRIPT>
		</form>
	</body>
</html>
