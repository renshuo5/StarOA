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
		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>
		<form action="purchase/supidentified/supidentified_update"
			method="post">
			<input type="hidden" value="${supidentified.id}"
				name="supidentified.id">
			<input type="hidden" value="${supidentified.samid}"
				name="supidentified.samid">
			<table class="title">
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						<input type="hidden" name="reqdptId"
							value="${supidentified.reqdpt.id}" />
						申请单位：
						<select id="reqdptName" name="reqdptName"
							onChange="reqdptId.value=this.options[reqdptName.selectedIndex].value;">
							<option value="${supidentified.reqdpt.id}">
								${supidentified.reqdpt.dptName}
							</option>
							<c:forEach items="${departmentList}" var="dpt">
								<c:if test="${supidentified.reqdpt.id!=dpt.id&&1==dpt.dptType}">
									<option value="${dpt.id}">
										${dpt.dptName}
									</option>
								</c:if>
							</c:forEach>
						</select>
						申请人：
						<input type="text" value="${auditUser.employee.empName}"
							disabled="disabled" />
						<input type="hidden" name="supidentified.reqper.empId"
							value="${auditUser.employee.empId}" />
						申请日期：
						<input id="d2441" type="text" class="Wdate checkDateInfo"
							value="${supidentified.reqdate}"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2_0',skin:'whyGreen'})" />
						<input type="hidden" value="${supidentified.reqdate}"
							id="d2441_2_0" name="supidentified.reqdate" />
						</tr>
					<tr>
					<td>
						接收单位：
						<input type="hidden" name="recdptId"
							value="${supidentified.recdpt.id}" />
						<select id="recdptName" name="recdptName"
							onChange="recdptId.value=this.options[recdptName.selectedIndex].value;">
							<option value="${supidentified.recdpt.id}">
								${supidentified.recdpt.dptName}
							</option>
							<c:forEach items="${departmentList}" var="dpt">
								<c:if test="${supidentified.recdpt.id!=dpt.id&&1==dpt.dptType}">
									<option value="${dpt.id}">
										${dpt.dptName}
									</option>
								</c:if>
							</c:forEach>
						</select>
						接收人：
						<input id="employeeNameId_0" type="text" disabled="disabled" size="13"
							value="${supidentified.recper.empName}" align="left" />
						<input type="hidden" id="employeeIdId_0" value="${supidentified.recper.empId}" name="supidentified.recper.empId">
						<input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>persons/employee/employee_selectInput?paname=0','人员选择',800, 600, 1);return false">
						接收日期：
						<input id="d2442" type="text" class="Wdate checkDateInfo"
							value="${supidentified.recdate}"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2_1',skin:'whyGreen'})" />
						<input type="hidden" value="${supidentified.recdate}"
							id="d2441_2_1" name="supidentified.recdate" />
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
						供方名称
					</td>
					<td>
						<input type="text" value="${supidentified.supplierinfo.supcname}"
							disabled="disabled" />
						<input type="hidden" name="supplierinfoId"
							value="${supidentified.supplierinfo.id}" />
					</td>
				</tr>
				<tr>
					<td>
						品牌
					</td>
					<td>
						<input type="text" value="${supidentified.brand}"
							disabled="disabled" />
						<input type="hidden" value="${supidentified.brand}"
							name="supidentified.brand" />
					</td>
				</tr>
				<tr>
					<td>
						供应产品名称
					</td>
					<td>
						<input type="text" value="${supidentified.supplierinfo.itemname}"
							disabled="disabled" />
					</td>
				</tr>
				<tr>
					<td>
						型号规格
					</td>
					<td>
						<input type="text"
							value="${supidentified.supplierinfo.itemtypename}"
							disabled="disabled" />
						</td>
				</tr>
				<tr>
					<td>
						品牌 销售:
					</td>
					<td>
						<c:if test="${supidentified.directosales}">
							<input type="radio" name="supidentified.directosales"
								value="true" checked />
						</c:if>
						<c:if test="${!supidentified.directosales}">
							<input type="radio" name="supidentified.directosales"
								value="true" />
						</c:if>
						直销
						<c:if
							test="${!supidentified.directosales && !empty supidentified.directosales}">
							<input type="radio" name="supidentified.directosales"
								value="false" checked />
						</c:if>
						<c:if
							test="${supidentified.directosales || empty supidentified.directosales}">
							<input type="radio" name="supidentified.directosales"
								value="false" />
						</c:if>
						代销
					</td>
				</tr>
				<tr>
					<td>
						申请认定理由
					</td>
					<td colspan="85%" width="">
						<textarea name="supidentified.reqreason" cols="70" rows="3">${supidentified.reqreason}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						申请附备资料
					</td>
					<td colspan="85%" width="">
						<textarea name="supidentified.reqinfo" cols="70" rows="3">${supidentified.reqinfo}</textarea>
					</td>
				</tr>
			</table>
			<table style="width:85%;text-align:center" class="editTable" >
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