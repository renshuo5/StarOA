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
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>


		<form action="warehouse/warehouse/warehouse_update" method="post">
			<input type="hidden" name="warehouse.war_id"
				value="${warehouse.war_id}" />

			<table class="title" style="width: 85%">
				<tr>
					<td>
						修改产品进仓单：
					</td>
				</tr>
			</table>
			<table class="addTable">

				<tr>
					<td>
						生协号：

					</td>
					<td>


						<input type="text" name="warehouse.warsn"
							value=" ${warehouse.warsn }" size="50" maxlength="100"
							class="checkEmptyShowInfo" />
						<font color="#FF0000">*</font>

					</td>
				</tr>




				<tr>
					<td>
						产品名称：

					</td>
					<td>

						<input type="text" size="10" class="checkEmptyShowInfo"
							value="${warehouse.itemType.item.name}" id="itemNameId"
							disabled="disabled">
						<input type="hidden" name="itemId" class="selectin" id="itemIdId">
						<input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=','selectItem',800, 600, 1);return false">
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						规格型号：

					</td>
					<td>

						<input type="text" name="warehouse.itemType.name"
							value="${warehouse.itemType.name}" id="itemTypeNameId"
							disabled="disabled"></input>

						<input type="hidden" name="itemTypeId" id="itemTypeIdId"></input>
						<input type="hidden" name="warehouse.itemType.id"
							value="${warehouse.itemType.id}" />

						<font color="#FF0000">*</font>
					</td>
				</tr>

				<tr>
					<td>
						产品序列号：

					</td>
					<td>


						<input type="text" name="warehouse.prno" value="${warehouse.prno}"
							size="50" maxlength="100" class="checkEmptyShowInfo" />
						<font color="#FF0000">*</font>

					</td>
				</tr>


				<tr>
					<td>
						数量：

					</td>
					<td>


						<input type="text" name="warehouse.warno"
							value="${warehouse.warno}" size="50" maxlength="100"
							class="checkEmptyShowInfo checkNumShowInfo" />
						<font color="#FF0000">*</font>

					</td>
				</tr>
				<tr>
					<td>
						生产日期：

					</td>
					<td>
						<input id="d244" type="text" class="Wdate checkDateInfo"
							value="${warehouse.dateOfManufacture}"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2"
							name="warehouse.dateOfManufacture"
							value="${warehouse.dateOfManufacture}" />
						<font color="#FF0000">*</font>
					</td>

				</tr>


				<tr>
					<td>
						生产单位：

					</td>
					<td>
						<select class="selectone" name="warehouse.prunit">
							<option value="">
								${warehouse.prunit}
							</option>
							<c:forEach items="${departments}" var="prunit">
								<option value="${prunit.dptName}">
									${prunit.dptName}
								</option>
							</c:forEach>
						</select>
						<font color="#FF0000">*</font>

					</td>
				</tr>

				<tr>
					<td>
						检验人：

					</td>
					<td>


						<input type="text" disabled="disabled"
							name="warehouse.winpector.empName"
							value="${warehouse.winpector.empName}" size="50" maxlength="100"
							class="itemname" />
						<input type="hidden" name="warehouse.winpector.empId"
							value="${warehouse.winpector.empId}" />
						<font color="#FF0000">*</font>

					</td>
				</tr>
				<tr>
					<td>
						生产部验收：

					</td>
					<td>


						<input type="text" name="warehouse. productionAcceptance"
							value="${warehouse. productionAcceptance}" size="50"
							maxlength="100" class="checkEmptyShowInfo" />
						<font color="#FF0000">*</font>

					</td>
				</tr>

				<tr>
					<td>
						说明：

					</td>
					<td>

						<textarea name="warehouse.whnote" cols="40" rows="3"
							class="itemname">${warehouse.whnote} </textarea>

					</td>
				</tr>

			</table>
			<table class="btn">
				<tr>
					<td>
						<input type="submit" name="SYS_SET" value=" 提 交 " class="frm_btn">
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