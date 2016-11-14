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
		<title>供方认定申请报告单</title>
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
		<table class="addTable">
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>
		<form action="purchase/supidentified/supidentified_add" method="post">
			<input type="hidden" value="${samidentified.id}"
				name="samidentifiedId">
			<input type="hidden" value="${samidentified.id}"
				name="supidentified.samid">
			<table class="title"  style="width:85%">
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						<input type="hidden" name="reqdptId" />
						申请单位：
						<select id="reqdptName" name="reqdptName"
							onChange="reqdptId.value=this.options[reqdptName.selectedIndex].value;" class="selectone">
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
					<td>
						申请人：
						<input type="text" value="${auditUser.employee.empName}"
							disabled="disabled" />
						<input type="hidden" name="supidentified.reqper.empId"
							value="${auditUser.employee.empId}" />
					</td>
					<td>
						申请日期：
						<input id="d2441" type="text" class="Wdate checkDateInfo"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2_0',skin:'whyGreen'})" />
						<input type="hidden" id="d2441_2_0" name="supidentified.reqdate" />
					</tr>
					<tr>
					<td>
						接收单位：
						<input type="hidden" name="recdptId" />
						<select id="recdptName" name="recdptName"
							onChange="recdptId.value=this.options[recdptName.selectedIndex].value;" class="selectone">
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
					<td>
						接收人：
						<input id="employeeNameId_0" type="text" disabled="disabled" size="13" value="" align="left" class="selectin" />
						<input type="hidden" id="employeeIdId_0" name="supidentified.recper.empId">
						<input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>persons/employee/employee_selectInput?paname=0','人员选择',800, 600, 1);return false">
					</td>
					<td>
						接收日期：
						<input id="d2442" type="text" class="Wdate checkDateInfo"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2_1',skin:'whyGreen'})" />
						<input type="hidden" id="d2441_2_1" name="supidentified.recdate" />
					</td>
				</tr>
			</table>
			<table class="list" style="width:85%">
				<tr>
					<th>
						供方认定申请报告单
					</th>
				</tr>
			</table>	
			<table class="addTable">
				<tr>
					<td>
						供方名称:
					</td>
					<td>
						<input type="text" value="${samidentified.supplierinfo.supcname}"
							disabled="disabled" />
						<input type="hidden" name="supplierinfoId"
							value="${samidentified.supplierinfo.id}" />
					</td>
				</tr>
				<tr>
					<td>
						品牌:
					</td>
					<td>
						<input type="text" value="${samidentified.brand}"
							disabled="disabled" />
						<input type="hidden" value="${samidentified.brand}"
							name="supidentified.brand" />
					</td>
				</tr>
				<tr>
					<td>
						供应产品名称:
					</td>
					<td>
						<input type="text" value="${samidentified.supplierinfo.itemname}"
							disabled="disabled" />
					</td>
				</tr>
				<tr>
					<td>
						型号规格:
					</td>
					<td>
						<input type="text"
							value="${samidentified.supplierinfo.itemtypename}"
							disabled="disabled" />
					</td>
				</tr>
				<tr>
					<td>
						品牌销售:
					</td>
					<td>
						<input type="radio" name="supidentified.directosales" value="true" />
						直销
						<input type="radio" name="supidentified.directosales"
							value="false" />
						代销
					</td>
				</tr>
				<tr>
					<td>
						申请认定理由:
					</td>
					<td>
						<textarea name="supidentified.reqreason" cols="70" rows="3"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						申请附备资料:
					</td>
					<td>
						<textarea name="supidentified.reqinfo" cols="70" rows="3"></textarea>
					</td>
				</tr>
			</table>
			<table style="width:85%;text-align:center" >
				<tr bgcolor="#f5f5f5">
					<td>
						<input type="submit" value="提交" class="frm_btn" />
					</td>
				</tr>
			</table>
		</form>
		<SCRIPT type=text/javascript>
	$(document).ready(registerPre);
</SCRIPT>
	</body>
</html>