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
		<script type="text/javascript" src="<%=basePath%>js/textRightLeft.js"></script>
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
			<table align="center">
				<tr>
					<td>
						申请单位：
						<input type="text" value="${supidentified.reqdpt.dptName}"
							disabled="disabled" />
						<input type="hidden" value="${supidentified.reqdpt.id}"
							name="reqdptId" />
						申请人：
						<input type="text" value="${supidentified.reqper.empName}"
							disabled="disabled" />
						<input type="hidden" value="${supidentified.reqper.empId}"
							name="supidentified.reqper.empId" />
						申请日期：
					<input type="text" value="${supidentified.reqdate}"
						disabled="disabled" />
					<input type="hidden" value="${supidentified.reqdate}"
						name="supidentified.reqdate" />
					<br />
					接收单位：
					<input type="text" value="${supidentified.recdpt.dptName}"
						disabled="disabled" />
					<input type="hidden" value="${supidentified.recdpt.id}"
						name="recdptId" />
					接收人：
					<input type="text" value="${supidentified.recper.empName}"
							disabled="disabled" />
						<input type="hidden" value="${supidentified.recper.empId}"
							name="supidentified.recper.empId" />
					接收日期：
					<input type="text" value="${supidentified.recdate}"
						disabled="disabled" />
					<input type="hidden" value="${supidentified.recdate}"
						name="supidentified.recdate" />
					</td>
				</tr>
			</table>
			<table class="title">
				<tr>
					<td>
						供方认定申请报告单
					</td>
				</tr>
			</table>
			<table class="addTable" style="width: 100%">
				<tr>
					<td>
						供方名称:
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
						品牌:
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
						供应产品名称:
					</td>
					<td>
						<input type="text" value="${supidentified.supplierinfo.itemname}"
							disabled="disabled" />
					</td>
				</tr>
				<tr>
					<td>
						型号规格:
					</td>
					<td>
						<input type="text"
							value="${supidentified.supplierinfo.itemtypename}"
							disabled="disabled" />
					</td>
				</tr>
				<tr>
					<td>
						品牌销售 :
					</td>
					<td>
						<c:if test="${supidentified.directosales}">
							直销
							<input type="hidden" name="supidentified.directosales"
								value="true" checked />
						</c:if>
						
						<c:if test="${!supidentified.directosales}">
							代销
							<input type="hidden" name="supidentified.directosales"
								value="false" checked />
						</c:if>
					</td>
				</tr>
				<tr>
					<td>
						申请认定理由:
					</td>
					<td>
						<textarea name="supidentified.reqreason" cols="70" rows="3"
							disabled="disabled">${supidentified.reqreason}</textarea>
						<input type="hidden" name="supidentified.reqreason"
							value="${supidentified.reqreason}" />
					</td>
				</tr>
				<tr>
					<td>
						申请附备资料:
					</td>
					<td>
						<textarea name="supidentified.reqinfo" cols="70" rows="3"
							disabled="disabled">${supidentified.reqinfo}</textarea>
						<input type="hidden" name="supidentified.reqinfo"
							value="${supidentified.reqinfo}" />
					</td>
				</tr>
				<tr>
					<td>
						采购认定意见:<br/>（认定交货能力和服务情况）
					</td>
					<td>
							<textarea name="supidentified.puradvice"
								cols="70" rows="3">${supidentified.puradvice}</textarea>
						<br/>
						<c:if test="${step==1}">
							经办：
							<input type="text" value="${auditUser.employee.empName}" disabled="disabled"  size="15"/>
						    <input type="hidden" value="${auditUser.employee.empId}" name="supidentified.purper.empId" />
						   日期：
							<input id="d2443" type="text" class="Wdate" value="${supidentified.purdate}"
								onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2_2',skin:'whyGreen'})" />
							<input type="hidden" id="d2441_2_2" value="${supidentified.purdate}" name="supidentified.purdate" />    
						         部门负责人：<input type="text" disabled="disabled"  size="15"/>
						
						</c:if>
						<c:if test="${step==2}">
						          经办：
						    <input type="text" value="${supidentified.purper.empName}" disabled="disabled"  size="15"/>
						    <input type="hidden" value="${supidentified.purper.empId}" name="supidentified.purper.empId" />
							日期：<input type="text" value="${supidentified.purdate}" readonly="readonly" name="supidentified.purdate"/>
			
							部门负责人：
							<input type="text" value="${auditUser.employee.empName}" disabled="disabled"  size="15"/>
						    <input type="hidden" value="${auditUser.employee.empId}" name="supidentified.purresper.empId" />
						   日期：
							<input id="d2443" type="text" class="Wdate" 
								onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2_2',skin:'whyGreen'})" />
							<input type="hidden" id="d2441_2_2" name="supidentified.pardate" />    
						</c:if>
						
					</td>
				</tr>
			</table>
			<table style="text-align:center; width:100%" class="editTable" >
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