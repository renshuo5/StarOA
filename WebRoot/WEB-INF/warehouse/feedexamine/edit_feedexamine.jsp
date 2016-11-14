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
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>

		<form action="warehouse/feedexamine/feedexamine_update" method="post">
			<input type="hidden" name="feedexamine.fee_id"
				value="${feedexamine.fee_id}" />
			<table class="title">
				<tr>
					<td>
						修改进料验收单：
					</td>
				</tr>
			</table>
			<table class="addTable">
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
						<input type="text" id="quaprolistnameId"  value="${feedexamine.supplier.supplierinfo.supcname}"/>
						<input type="hidden" name="quaprolistId" id="quaprolistIdId" />
						<input id="supplierinfoe" type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>purchase/quaprolist/quaprolist_selectInput','selectQuaprolist',800, 600, 1);return false" />
						
					</td>

				</tr>

				<tr>
					<td>
						订单号：
					</td>
					<td>
						<input class="checkEmptyShowInfo" name="feedexamine.orderno" value="${feedexamine.orderno}"
							type="text" size="50" maxlength="100" id="feedexamineorderno" class="itemname"/><span id="checkfeedexamineorderno" style="color: #FF0000; font-size: 12px;">
							</span>
							<font color="#FF0000">*</font>
					</td>
				</tr>

				<tr>
					<td>
						日期：
					</td>
					<td>
						<input id="d244" type="text" class="Wdate checkDateInfo"
							value="${feedexamine.feeDate }"
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
						<input value="${feedexamine.feebuyer.empName}" disabled="disabled"
							type="text" size="50" maxlength="100" id="feedexaminefeebuyer" class="itemname"/>
						<input type="hidden" name="feedexamine.feebuyer.empId" value="${feedexamine.feebuyer.empId}"/>
		
					</td>
				</tr>
			</table>
			<table class="list" id="tb">
				<!-- 模板行开始 -->
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
					<th>
						添加
					</th>
					<th>
						删除
					</th>
				</tr>


				<tr id="rowTemplete_0">
					<td>
						<div align="center">
							<input type="text" name="bsnos" class="itemname" />
						</div>
					</td>
					<td align="center" valign="top">
						<input type="text" size="10" id="itemNameId_0" disabled="disabled">
						<input type="hidden" name="itemId" id="itemIdId_0">
						<input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false">
					</td>
					<td align="center" align="top">
						<input type="text" size="10" name="itemTypeNameIds"
							id="itemTypeNameId_0" disabled="disabled"></input>
						<input type="hidden" name="itemTypeIds" id="itemTypeIdId_0"></input>

					</td>
					<td>
						<div align="center">
							<input type="text" name="fpnums" class="itemname"/>
						</div>
					</td>

					<td>
						<div align="center">
							<input type="text" name="fnotes" class="itemname"/>
						</div>
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
				<!-- 模板行结束 -->
				<c:forEach items="${feegoods}" var="feegood" varStatus="vs">
					<tr>
						<td>
							<div align="center">
								<input type="text" name="bsnos" value="${feegood.bsno}" />
							</div>
						</td>
						<td align="center" valign="top">
							<input type="text" size="10" id="itemNameId${vs.index}"
								disabled="disabled" value="${feegood.itemType.item.name}">
							<input type="hidden" name="itemId" id="itemIdId${vs.index }"
								value="${feegood.itemType.item.id }">
							<input type="button" value="选择" class="frm_btn"
								onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=${vs.index }','selectItem',800, 600, 1);return false">
						</td>
						<td align="center" align="top">
							<input type="text" size="10" name="itemTypeNameIds"
								value="${feegood.itemType.name }"
								id="itemTypeNameId${vs.index }" disabled="disabled"></input>
							<input type="hidden" name="itemTypeIds"
								id="itemTypeIdId${vs.index }" value="${feegood.itemType.id }"></input>
							<font color="#FF0000">*</font>
						</td>
						<td>
							<div align="center">
								<input type="text" class="checkNumforall" name="fpnums" value="${feegood.fpnum }" />
							</div>
							<font color="#FF0000">*</font>
						</td>

						<td>
							<div align="center">
								<input type="text" name="fnotes" value="${feegood.fnote }" />
							</div>
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
			<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
        </form>
	</body>
</html>
