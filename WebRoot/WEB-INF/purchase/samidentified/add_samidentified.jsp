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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>样品认定申请报告单</title>
		<link type="text/css" href="css/vip.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/purchase.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>

		</table>
		<form action="purchase/samidentified/samidentified_add" method="post">
			<table class="title">
				<tr>
					<td>
						样品认定申请报告单
					</td>
				</tr>
			</table>
			<table class="addTable" style="width: 100%">
				<tr>
					<td style="width: 15%">
						申请单位：
					</td>
					<td>
						<input type="hidden" name="departmentId" />
						<select id="dptName" name="dptName"
							onChange="departmentId.value=this.options[dptName.selectedIndex].value;" class="selectone">
							<option>
								请选择
							</option>
							<c:forEach items="${departmentList}" var="dpt">
								<c:if test="${1==dpt.dptType}">
									<option value="${dpt.id}">
										${dpt.dptName}
									</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					</tr>
					<tr>
					<td>
						经办人：
					</td>
					<td>
						<input type="text" value="${auditUser.employee.empName}"
							disabled="disabled" />
						<input type="hidden" name="samidentified.hangding.empId"
							value="${auditUser.employee.empId}" />
					</td>
					</tr>
				
				<tr>
					<td style="width: 15%">
						负责人：
					</td>
					<td>
						<input type="text" disabled="disabled" />
					</td>
					</tr>
					<tr>
					<td>
						时间：
					</td>
					<td>
						<input id="d2441" type="text" class="Wdate checkDateInfo"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2_0',skin:'whyGreen'})" />
						<input type="hidden" value="${samidentified.samdate}"
							id="d2441_2_0" name="samidentified.samdate" />
				</tr>
				
			</table>
			
			<table class="title">
				<tr>
					<td>
						申请内容
					</td>
				</tr>
			</table>
			<table class="addTable" style="width: 100%">
				<tr>
					<td>
						供方名称：
						<input type="text" size="15" id="supplierinfoSupcnameId" disabled="disabled" class="selectin"/>
						<input type="hidden" name="supplierinfoId" id="supplierinfoIdId" />
						<input id="supplierinfoe" type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>purchase/supplierinfo/supplierinfo_selectInput','selectSupplierinfo',800, 600, 1);return false" />
					</td>
					<td style="width: 29%; text-align: center">
						第
						<input type="text" name="samidentified.reqtime" size="5"
							id="samidentifiedreqtime" class="checkNumforall"/>
						次申请
					</td>
					<td>
						希望
						<input id="d2442" type="text" class="Wdate"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2_1',skin:'whyGreen'})" />
						<input type="hidden" id="d2441_2_1" name="samidentified.wantdate" />
						前完成
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left">
						属性：
						<input type="checkbox" name="newitem" value=1 />
						新产品
						<input type="checkbox" name="newsup" value=1 />
						新供方
						<input type="checkbox" name="techchange" value=1 />
						技术变更
						<input type="checkbox" name="redcost" value=1 />
						降低成本
						<input type="checkbox" name="entest" value=1 />
						进入量试&nbsp;
					</td>
					<td>
						适用产品：
						
			<input type="text" name="itemNames" id="itemNameId" disabled="disabled" class="selectin" size="12"/>
           <input type="hidden" name="itemId" id="itemIdId"/>
         <input type="text" name="itemTypeNames" id="itemTypeNameId" disabled="disabled"  size="12"/>
          <input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',900, 600);return false"/>
          	<input type="hidden" name="itemtypeId" id="itemTypeIdId"/>
						
		
				</td>
				</tr>
			</table>
			<table class="addTable" style="width: 100%">
				<tr>
					<th>
						样品名称
					</th>
					<th>
						品牌
					</th>
					<th>
						型号规格
					</th>
					<th>
						图号或料号
					</th>
					<th>
						数量
					</th>
					<th>
						单价
					</th>
				</tr>
				<tr>
					<td>
						<input type="text" id="itemnameId" size="22" disabled="disabled" />
					</td>
					<td>
						<input type="text" name="samidentified.brand" size="22" class="itemname"/>
					</td>
					<td>
						<input type="text" id="itemtypenameId" size="22"
							disabled="disabled" />
					</td>
					<td>
						<input type="text" name="samidentified.mcodename" size="25" class="checkNumShowInfo"/>
					</td>
					<td>
						<input type="text" name="samidentified.num" size="15" class="checkNumShowInfo"/>
					</td>
					<td>
						<input type="text" name="samidentified.uprice" size="15" class="checkFloatNum"/>
					</td>
				</tr>
			</table>
			<table class="addTable" style="width: 100%">
				<tr>
					<td>
						填制说明
					</td>
					<td>
						“样品名称”栏目应填写同一供方且配套在我公司同一产品的样品。
					</td>
				</tr>
			</table>
			<table style="text-align:center" >
				<tr bgcolor="#f5f5f5">
					<td>
						<input type="submit" value=" 提 交 " class="frm_btn">
					</td>
				</tr>
			</table>
		</form>
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>