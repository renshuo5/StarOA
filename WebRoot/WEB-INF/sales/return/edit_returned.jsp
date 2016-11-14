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
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>

		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>



		<form action="sales/return/returned/returned_update" method="post">
			<table class="title addTable">
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
							value="${returned.customern}" class="itemname"></input>
					</td>
				</tr>
				<tr>
					<td>
						退货日期：
					</td>
					<td>
						<input id="d244" type="text" class="Wdate"
							value="${returned.retdate}"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" name="returned.retdate"
							value="${returned.retdate}" />
					</td>
				</tr>
				<tr>
					<td>
						单号：
					</td>
					<td>
						<input type="text" name="returned.retid" value="${returned.retid}" class="itemname"></input>
					</td>
				</tr>

			</table>
			<table class="list editTable" id="tb">


				<tr>

					<!-- <td width="3%"  colspan="1"><p align="center">序号 </p></td>-->
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
				<!---------模板行开始--------------->
				<tr id="rowTemplete_0">
					<td valign="top" colspan="1">
						<input type="text" size="10" id="itemNameId_0" disabled="disabled">
						<input type="hidden" name="itemId" id="itemIdId_0">
						<input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false">
						<td valign="top" colspan="1">
							<input type="text" size="10" name="itemTypeNameIds"
								id="itemTypeNameId_0" disabled="disabled"></input>
							<input type="hidden" name="itemTypeIds" id="itemTypeIdId_0"></input>
						</td>


						<td valign="top" colspan="1">
							<input type="text" name="retnos" class="itemname"></input>
						</td>

						<td align="center" colspan="1">
							<img src="<%=basePath %>images/add.png"
								onclick="addBatchRow(this)" />
						</td>
						<td align="center" colspan="1">
							<img src="<%=basePath %>images/del.png"
								onclick="deleteBatchRow(this)" />
						</td>
				</tr>


				<!---------模板行结束--------------->

				<c:forEach items="${retgoods}" var="retgood" varStatus="vs">

					<tr>
						<td valign="top" colspan="1">
							<input type="text" size="10" id="itemNameId${vs.index}"
								disabled="disabled" value="${retgood.itemType.item.name}">
							<input type="hidden" name="itemId" id="itemIdId${vs.index}"
								value="${retgood.itemType.item.id }">
							<input type="button" value="选择" class="frm_btn"
								onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=${vs.index}','selectItem',800, 600, 1);return false">
							<td valign="top" colspan="1">
								<input type="text" name="itemTypeNameIds"
									value="${retgood.itemType.name}"
									id="itemTypeNameId${vs.index }" disabled="disabled"></input>
								<input type="hidden" name="itemTypeIds"
									id="itemTypeIdId${vs.index}" value="${retgood.itemType.id }"></input>
							</td>

							<td valign="top" colspan="1">
								<input type="text" name="retnos" value="${retgood.retno}"></input>
							</td>

							<td align="center">
								<img src="<%=basePath %>images/add.png"
									onclick="addBatchRow(this)" />
							</td>
							<td align="center">
								<img src="<%=basePath %>images/del.png"
									onclick="deleteBatchRow(this)" />
							</td>
					</tr>
				</c:forEach>

			</table>
			<table class="addTable" >
				<tr>
					<td>
							退
							<br>
							货
							<br>
							叙
							<br>
							述
					</td>

					<td>
						<textarea name="returned.retnote" cols="80" rows="6" class="itemname">${returned.retnote}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						出单人:</td> <td>
						<input type="text" disabled="disabled" name="signper" value="${signper.employee.empName}" />
					     <input type="hidden" name="returned.signper.empId" value="${signper.employee.empId }" />
					</td>
				</tr>


			</table>
			<table class="btn">
				<tr>
					<td>
						<div align="center">
							<input type="submit" value=" 提 交 " class="frm_btn">
						</div>
					</td>
				</tr>
			</table>
		</form>
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>
