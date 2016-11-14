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
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/highLight.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>

		<form action="sales/shipment/shinote2/shinote2_add" method="post">
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
						<input id="d244" type="text" class="Wdate"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'2441',skin:'whyGreen'})" />
						<input type="hidden" id="2441" name="shinote2.makeDate" />
				</tr>
				<tr>
					<td>
						编号：
					</td>
					<td>
						<input type="text" name="shinote2.sn">
					</td>
				</tr>
				<tr>
					<td>
						供货单位：
					</td>
					<td>
						<input type="text" value="福建实达电子制造有限公司" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td>
						仓库
					</td>
					<td>

						<select name="shinote2.whname.id">
							<option>
								请选择
							</option>
							<c:forEach items="${whnames}" var="dpt">
								<option value="${dpt.id}">
									${dpt.dptName}
								</option>
							</c:forEach>
						</select>
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						分公司：
					</td>
					<td>
						<input type="text" name="shinote2.sbranch1">
						&nbsp;&nbsp;&nbsp;
						<input type="text" name="shinote2.sbranch2">
						&nbsp;&nbsp;&nbsp;
						<input type="text" name="shinote2.sbranch3">
					</td>
				</tr>
				<tr>
					<td>
						收货单位：
					</td>
					<td>
						<input type="text" name="shinote2.recunit">
					</td>
				</tr>
				<tr>
					<td>
						收货地址：
					</td>
					<td>
						<input type="text" name="shinote2.raddress">
					</td>
				</tr>
				<tr>
					<td>
						收货人：
					</td>
					<td>
						<input type="text" name="shinote2.recper">
					</td>
				</tr>
				<tr>
					<td>
						收函人：
					</td>
					<td>
						<input type="text" name="shinote2.letrecper">
					</td>
				</tr>
				<tr>
					<td>
						邮政编码：
					</td>
					<td>
						<input type="text" name="shinote2.rcode">
					</td>
				</tr>
				<tr>
					<td>
						收货方式：
					</td>
					<td>
						<input type="text" name="shinote2.recstyle">
					</td>
				</tr>
				<tr>
					<td>
						到站名：
					</td>
					<td>
						<input type="text" name="shinote2.tostation">
					</td>
				</tr>
				<tr>
					<td>
						总件数：
					</td>
					<td>
						<input type="text" name="shinote2.totals">
					</td>
				</tr>
				<tr>
					<td>
						实际发货时间：
					</td>
					<td>
						<input id="d244" type="text" class="Wdate"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" name="shinote2.shi2date" />
					</td>
				</tr>
				<tr>
					<td>
						货运单号：
					</td>
					<td>
						<input type="text" name="shinote2.trno">
					</td>
				</tr>
			</table>
			<table class="list">
				<tr>
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
				<tr id="rowTemplete_0">
					<td>
						<input name="orderids" type="text" size="8">
					</td>
					<td>
						<input type="text" size="8" id="itemNameId_0" disabled="disabled">
						<input type="hidden" name="itemId" id="itemIdId_0">
					</td>
					<td>
						<input type="text" size="8" name="itemTypeNameIds"
							id="itemTypeNameId_0" disabled="disabled"></input>
						<input type="hidden" name="itemTypeIds" id="itemTypeIdId_0"></input>
					</td>

					<td>
						<input name="itemTypeIds" type="text" size="8" id="itemmCode_0"
							disabled="disabled">
						<input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false">
						<font color="#FF0000">*</font>
					</td>
					<td>
						<input name="shi2nos" type="text" size="8">
						<font color="#FF0000">*</font>
					</td>
					<td>
						<input name="shi2no2s" type="text" size="8">

					</td>
					<td>
						<input name="shi2notes" type="text" size="8">

					</td>

					<td>
						<img src="<%=basePath %>images/add.png"
							onclick="addBatchRow(this)" />
					</td>
					<td>
						<img src="<%=basePath %>images/del.png"
							onclick="deleteBatchRow(this)" />
					</td>
				</tr>
			</table>

			<table class="addTable">
				<tr>
					<td>
						备注：
					</td>
					<td>
						<input type="text" name="shinote2.shi2note">
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

						<select name="shinote2.delper.empId">
							<option>
								请选择
							</option>
							<c:forEach items="${delper}" var="emp">
								<option value="${emp.empId}">
									${emp.empName}
								</option>
							</c:forEach>
						</select>
						<font color="#FF0000">*</font>
					</td>

				</tr>
				<tr>
					<td>
						制表：
					</td>
					<td>
						<select name="shinote2.mtab.empId">
							<option>
								请选择
							</option>
							<c:forEach items="${mtab}" var="emp">
								<option value="${emp.empId}">
									${emp.empName}
								</option>
							</c:forEach>
						</select>
						<font color="#FF0000">*</font>
					</td>

				</tr>
				<tr>
					<td>
						填表人：
					</td>
					<td>
						<input type="text" disabled="disabled" name="wper"
							value="${wper.employee.empName}" />
						<input type="hidden" name="shinote2.wper.empId"
							value="${wper.employee.empId }" />
					</td>
				</tr>
			</table>
			<table class="btn">
				<tr>
					<td align="center" colspan="8">
						<input type="submit" value=" 提 交 " class="frm_btn">
					</td>
				</tr>
			</table>



		</form>
	</body>
</html>
