<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>

		<base href="<%=basePath%>">
		<title>物料添加</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/highLight.js"></script>
		<sx:head />
	</head>
	<body>
		<table>

			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>
		<form action="sales/shipment/shippingnote1/shippingnote1_update"
			method="post">
			<input type="hidden" name="shippingnote1.shi1id"
				value="${shippingnote1.shi1id}" />
			<table class="title">

				<tr>
					<td>
						外协件发货通知单
					</td>
				</tr>

			</table>
			<table class="list" id="tb">

				<tr>
					<th>
						编（批）号
					</th>

					<th>
						收获单位
					</th>
					<th>
						部品名称
					</th>
					<th>
						规格型号
					</th>
					<th>
						数量（台）
					</th>
					<th>
						备注
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
					<td>
						<input type="text" name="shitimes"></input>
					</td>
					<td>
						<input type="text" name="shi1units"></input>
					</td>
					<td>

						<input type="text" size="10" id="itemNameId_0" disabled="disabled">
						<input type="hidden" name="itemId" id="itemIdId_0">
						<input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false">
					</td>
					<td>
						<input type="text" size="10" name="itemTypeNameIds"
							id="itemTypeNameId_0" disabled="disabled"></input>
						<input type="hidden" name="itemTypeIds" id="itemTypeIdId_0"></input>
					</td>
					<td>
						<input type="text" name="shi1nos"></input>
					</td>
					<td align="center">
						<input type="text" name="shinotes"></input>
					</td>
					<td align="center">
						<img src="<%=basePath%>images/add.png" onclick=
	addBatchRow(this);;
/>
					</td>
					<td align="center">
						<img src="<%=basePath%>images/del.png"
							onclick=
	deleteBatchRow(this);;
/>
					</td>

				</tr>

				<!---------模板行结束--------------->

				<c:forEach items="${shi1goods}" var="shi1good" varStatus="vs">
					<!-------------------------LOOP START---------------------------->
					<tr>
						<td>
							<input type="text" name="shitimes" value="${shi1good.shitime}"></input>
						</td>
						<td>
							<input type="text" name="shi1units" value="${shi1good.shi1unit}"></input>
						</td>
						<td>
							<input type="text" size="10" id="itemNameId${vs.index}"
								disabled="disabled" value="${shi1good.itemType.item.name}">
							<input type="hidden" name="itemId" id="itemIdId${vs.index}"
								value="${shi1good.itemType.item.id }">
							<input type="button" value="选择" class="frm_btn"
								onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=${vs.index}','selectItem',800, 600, 1);return false">
						</td>
						<td>
							<input type="text" name="itemTypeNameIds"
								value="${shi1good.itemType.name}"
								id="itemTypeNameId${vs.index }" disabled="disabled"></input>
							<input type="hidden" name="itemTypeIds"
								id="itemTypeIdId${vs.index}" value="${shi1good.itemType.id }"></input>
						</td>
						<td>
							<input type="text" name="shi1nos" value="${shi1good.shi1no}"></input>
						</td>
						<td align="center">
							<input type="text" name="shinotes" value="${shi1good.shinote}"></input>
						</td>
						<td align="center">
							<img src="<%=basePath%>images/add.png"
								onclick=
	addBatchRow(this);;
>
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
			<!--------------------LOOP END----------------------------->

			<table class="addTable" style="width:100%">
				<tr>
					<td>
						发送:
						<input name="shippingnote1.shi1send"
							value="${shippingnote1.shi1send}" type="text">
					</td>
					<td>
						接收:
						<input name="shippingnote1.shi1receive"  
							value="${shippingnote1.shi1receive}" type="text">
					</td>
					<td>
						填单:
						<input name="shippingnote1.shiw" value="${shippingnote1.shiw.empName}" disabled="disabled"
							type="text">
					</td>
					<td colspan="3" align="right" bgcolor="#f5f5f5">
						<input id="d244" type="text" class="Wdate"
							value="${shippingnote1.shi1date}"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" name="shippingnote1.shi1date"
							value="${shippingnote1.shi1date}" />
					</td>
				</tr>

			</table>
			<table class="btn" style="width:100%">

				<tr>
					<td>
						<input type="submit" value=" 提 交 " class="frm_btn">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>