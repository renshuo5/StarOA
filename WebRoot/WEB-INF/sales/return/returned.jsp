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
		<title>退货通知</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/sales.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>

		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>

		<form action="sales/return/returned/returned_add" method="post">
			<input type="hidden" name="returnedId" value="${returned.retid}">
			<table class="title editTable" >
				<tr>
					<td>
						退 货 报 告 单
					</td>
				</tr>


			</table>
			<table class="addTable">

				<tr>
					<td>
						客户名称：
					</td>

					<td>
						<input type="text" name="returned.customern"
							id="returnedcustomern" class="itemname"></input>
						<span id="checkreturnedcustomern"
							style="color: #FF0000; font-size: 12px;"></span>
					</td>
				</tr>
				<tr>
					<td>
						退货日期：
					</td>
					<td>
						<input id="d244" type="text" class="Wdate"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" name="returned.retdate" />
					</td>
				</tr>
				<tr>
					<td>
						单号：
					</td>
					<td>
						<input type="text" name="returned.sn" id="returnedretid"
							class="itemname"></input>
						<span id="checkreturnedretid"
							style="color: #FF0000; font-size: 12px;"></span>
					</td>
				</tr>

			</table>
			<table  class="list editTable" id="tb" >
				<tr>

					<th>
						品名
					</th>
					<th>
						规格型号
					</th>
					<th>
						数量
					</th>
					<th>
						添加
					</th>
					<th>
						删除
					</th>
				</tr>

				<tr id="rowTemplete_0">
					<td align="center">
						<input type="text" size="10" id="itemNameId_0" disabled="disabled" class="itemname" >
						<input type="hidden" name="itemId" id="itemIdId_0"  >
						<span id="checkreturnedretid"
							style="color: #FF0000; font-size: 12px;"></span>
					</td>
					<td align="center">
						<input type="text" size="10" name="itemTypeNameIds"
							id="itemTypeNameId_0" disabled="disabled"></input>
						<input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false">
						<input type="hidden" name="itemTypeIds" id="itemTypeIdId_0"></input>
						<font color="#FF0000">*</font>
					</td>
					<td align="center">
						<input type="text" name="retnos"  class="itemname"></input>
						<span id="checkreturnedretnos"
							style="color: #FF0000; font-size: 12px;"></span>*
					</td>

					<td>
						<%--<img src="<%=basePath %>images/add.png"
							onclick="addBatchRow(this)" />
					--%>
					<img src="<%=basePath %>images/add.png"
							/>
					</td>
					<td>
						<img src="<%=basePath %>images/del.png"
							onclick="deleteBatchRow(this)" />
					</td>

				</tr>

			</table>
			<table class="addTable">
				<tr >
					
						<td>退货叙述
						</td>
						<td >
						<textarea name="returned. retnote" cols="50" rows="6"
							class="itemname"></textarea>
					</td>
				</tr>
				<tr >
					
						<td>出单人:</td>
					<td >
						<input type="text" disabled="disabled" name="signper"
							value="${signper.employee.empName}" />
						<input type="hidden" name="returned.signper.empId"
							value="${signper.employee.empId }" />
					</td>
				</tr>
			</table>
			<table class="addTable">

				<tr>
				    <td>
				    </td>
					<td >
						<input type="submit" value=" 提 交 " class="frm_btn" id="SYS_SET">
					</td>
				</tr>
			</table>

		</form>
<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>
