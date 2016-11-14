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
		<title>进料验收单</title>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		 <script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>


		<form action="warehouse/feedexamine/feedexamine_addpur" method="post">
			<input type="hidden" name="purorderId" value="${purorder.id}"/>


			<table class="title" style="width:85%">
				<tr>
					<td>填写进料验收单
					</td>
				</tr>
			</table>
			<table class="addTable" width="483" height="165">
				<tr>
					<td>
						类别：
					</td>
					<td>
						<select class="selectone" name="feedexamine.feestyle" id="selectdepartment">
						<option value="">
							请选择
						</option>
							<option value="元器件">
								元器件
							</option>
							<option value="钢材">
								钢材
							</option>
							<option value="其他">
								其他
							</option>
						</select>
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						来源：
					</td>
					<td>
						<select class="selectone" name="feedexamine.fromt" id="selectdepartment">
							<option value="">
								请选择
							</option>
							<option value="进口">
								进口
							</option>
							<option value="国产">
								国产
							</option>
						</select>
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						供应商：
					</td>
					<td>
						<input type="text" disabled="disabled" size="50" name="feedexamine.supplier.supplierinfo.supcname" maxlength="100"
							value="${purorder.quaprolist.supplierinfo.supcname}" />
						<input type="hidden" name="feedexamine.supplier.id" value="${purorder.quaprolist.id}"/>
							<font color="#FF0000">*</font>
		
					</td>
				</tr>
				<tr>


					<td>
						订单号：
					</td>
					<td>
						<input class="checkEmptyforall" type="text" name="feedexamine.orderno" size="50"
							maxlength="100" class="itemname" id="feedexamineorderno"/><span id="checkfeedexamineorderno" style="color: #FF0000; font-size: 12px;" ></span><font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						日期：
					</td>
					<td>
						<input id="d244" type="text" class="Wdate checkDateInfo"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" name="feedexamine.feeDate" />
						<font color="#FF0000">*</font>
					</td>

				</tr>
				<tr>
					<td>
						采购：
					</td>
					<td>
						<input type="text" disabled="disabled" size="50" name="feedexamine.feebuyer.empName" maxlength="100"
							value="${purorder.handing.empName}" />
						<input type="hidden" name="feedexamine.feebuyer.empId" value="${purorder.handing.empId}"/>
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
						型号规格
					</th>
					<th>
						货单数量
					</th>
					<th>
						备注
					</th>
					</tr>

			<c:forEach items="${purgoods}" var="purgood">
				<tr>
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
					<td>
						<div align="center">
							<input type="text" name="fpnums" disabled="disabled" value="${purgood.num}" />
							<input type="hidden" name="fpnums"  value="${purgood.num}" />
							<font color="#FF0000">*</font>
						</div>
					</td>

					<td>
						<div align="center">
							<input type="text" name="fnotes" />
						</div>
					</td>
					</tr>

				</c:forEach>
			
			</table>
			<table>
				<tr>
					<td>
						<div align="center">
							<input type="submit" name="SYS_SET" value=" 提 交 " class="frm_btn" id="SYS_SET">
							 <input type="button" class="frm_btn" value="取消" onclick=window.close();>
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
