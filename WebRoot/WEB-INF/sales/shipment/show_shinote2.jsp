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
		<title>发 货 通 知 单</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/highLight.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/textRightLeft.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
		<table>
			<!--
				
				<tr height="15">
					<td background="images/shadow_bg.jpg"></td>
				</tr>
			-->
		</table>

		<form action="sales/shipment/shinote2/shinote2_update" method="post">
			<input type="hidden" name="shinote2.shi2id"
				value="${shinote2.shi2id}">

			<table class="title editTable">
				<tr>
					<td>
						发 货 通 知 单
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						制表时间：
					</td>
					<td>
						<input id="d2441" type="text" class="Wdate"
							value="${shinote2.makeDate}" disabled="disabled"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2',skin:'whyGreen'})" />
						<input type="hidden" id="d2441_2" name="shinote2.makeDate"
							value="${shinote2.makeDate}" />
				</tr>
				<tr>
					<td>
						编号：
					</td>
					<td>
						<input type="text" name="shinote2.sn" value="${shinote2.sn}"
							disabled="disabled">
					</td>
				</tr>
				<tr>
					<td align="right">
						供货单位：
					</td>
					<td>
						福建实达电子制造有限公司
					</td>
				</tr>
				<tr>
					<td>
						仓库：
					</td>
					<td>
						<input type="text" value="${shinote2.whname.dptName}"
							disabled="disabled" />
					</td>
				</tr>
				<tr>
					<td>
						分公司：
					</td>
					<td>
						<input type="text" name="shinote2.sbranch1"
							value="${shinote2.sbranch1}" disabled="disabled">
						&nbsp;&nbsp;&nbsp;
						<input type="text" name="shinote2.sbranch2"
							value="${shinote2.sbranch2}" disabled="disabled">
						&nbsp;&nbsp;&nbsp;
						<input type="text" name="shinote2.sbranch3"
							value="${shinote2.sbranch3}" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td>
						收货单位：
					</td>
					<td>
						<input type="text" name="shinote2.recunit"
							value="${shinote2.recunit}" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td>
						收货地址：
					</td>
					<td>
						<input type="text" name="shinote2.raddress"
							value="${shinote2.raddress}" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td>
						收货人：
					</td>
					<td>
						<input type="text" name="shinote2.recper"
							value="${shinote2.recper}" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td>
						收函人：
					</td>
					<td>
						<input type="text" name="shinote2.letrecper"
							value="${shinote2.letrecper}" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td>
						邮政编码：
					</td>
					<td>
						<input type="text" name="shinote2.rcode" value="${shinote2.rcode}"
							disabled="disabled">
					</td>
				</tr>
				<tr>
					<td>
						收货方式：
					</td>
					<td>
						<input type="text" name="shinote2.recstyle"
							value="${shinote2.recstyle}" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td>
						到站名：
					</td>
					<td>
						<input type="text" name="shinote2.tostation"
							value="${shinote2.tostation}" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td>
						总件数：
					</td>
					<td>
						<input type="text" name="shinote2.totals"
							value="${shinote2.totals}" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td>
						实际发货时间：
					</td>
					<td>
						<input id="d244" type="text" class="Wdate"
							value="${shinote2.shi2date}" disabled="disabled"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" name="shinote2.shi2date"
							value="${shinote2.shi2date}" />
					</td>
				</tr>
				<tr>
					<td>
						货运单号：
					</td>
					<td>
						<input type="text" name="shinote2.trno" value="${shinote2.trno}"
							disabled="disabled">
					</td>
				</tr>
			</table>
			<table class="list" id="tb">

				<tr align="center">
					<th>
						要货单号
					</th>
					<th>
						品名
					</th>
					<th>
						规格型号
					</th>
					<th>
						料号
					</th>
					<th>
						数量
					</th>
					<th>
						件数
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
						<input name="orderids" type="text">
					</td>
					<td>
						<input type="text" size="10" id="itemNameId_0" disabled="disabled">
						<input type="hidden" name="itemId" id="itemIdId_0">
					</td>
					<td>
						<input type="text" size="10" name="itemTypeNameIds"
							id="itemTypeNameId_0" disabled="disabled"></input>
						<input type="hidden" name="itemTypeIds" id="itemTypeIdId_0"></input>
					</td>

					<td>
						<input name="itemTypeIds" type="text" size="8" id="itemmCode_0"
							disabled="disabled">
					</td>
					<td>
						<input name="shi2nos" type="text">

					</td>
					<td>
						<input name="shi2no2s" type="text">

					</td>
					<td>
						<input name="shi2notes" type="text">

					</td>

					<td>
						<img src="<%=basePath%>images/add.png" onclick="addBatchRow(this)" />
					</td>
					<td>
						<img src="<%=basePath%>images/del.png"
							onclick="deleteBatchRow(this);" />

					</td>
				</tr>
				<!----------------------模板行结束---------------------------------->
				<c:forEach items="${shi2goods}" var="shi2good" varStatus="vs">

					<tr>
						<td>
							<input name="orderids" type="text" value="${shi2good.orderid}"
								disabled="disabled">
						</td>
						<td>
							<input type="text" size="10" id="itemNameId${vs.index}"
								disabled="disabled" value="${shi2good.itemType.item.name}">
							<input type="hidden" name="itemId" id="itemIdId${vs.index}"
								value="${shi2good.itemType.item.id }">

						</td>
						<td>
							<input type="text" name="itemTypeNameIds"
								value="${shi2good.itemType.name}"
								id="itemTypeNameId${vs.index }" disabled="disabled"></input>
							<input type="hidden" name="itemTypeIds"
								id="itemTypeIdId${vs.index}" value="${shi2good.itemType.id }"></input>
						</td>

						<td>
							<input name="itemTypeIds" type="text" size="8"
								id="itemmCode${vs.index}" value="${shi2good.itemType.mCode}"
								disabled="disabled">
						</td>
						<td>
							<input name="shi2nos" type="text" value="${shi2good.shi2no}"
								disabled="disabled">

						</td>
						<td>
							<input name="shi2no2s" type="text" value="${shi2good.shi2no2}"
								disabled="disabled">

						</td>
						<td>
							<input name="shi2notes" type="text" value="${shi2good.shi2note}"
								disabled="disabled">

						</td>

					</tr>

				</c:forEach>

			</table>

			<table class="addTable">
				<tr>
					<td>
						备注：
					</td>
					<td>
						<input type="text" name="shinote2.shi2note"
							value="${shinote2.shi2note}" disabled="disabled">
					</td>
				</tr>
				<%--
      <tr>
        <td>调度：</td>
        <td><input type="text" name="input26"></td>
      </tr>
      <tr>
        <td>储运：</td>
        <td><input type="text" name="input27"></td>
      </tr>
      <tr>
        <td>仓管：</td>
        <td><input type="text" name="input28" ></td>
      </tr>--%>
				<tr>
					<td>
						提货人：
					</td>
					<td>
						<input type="text" value="${shinote2.delper.empName}"
							disabled="disabled">
					</td>
				</tr>
				<tr>
					<td>
						制表：
					</td>
					<td>
						<input type="text" name="shinote2.mtab"
							value="${shinote2.mtab.empName}" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td>
						填表人：
					</td>
					<td>
						<input type="text" name="shinote2.wper"
							value="${shinote2.wper.empName}" disabled="disabled">
					</td>
				</tr>
				<%--<tr>
      <td  colspan="100%" height=14 align="center">

						<input type="button" name="SYS_SET" align="center" value="确定"
							class="frm_btn" size=5
							onclick="javascript:self.location='<%=basePath%>sales/shipment/shinote2/shinote2_list'" />


					</td>
					</tr>
					--%>
			</table>


		</form>
	</body>
</html>
