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
		<form action="purchase/supidentified/supidentified_list" method="post">
			<input type="hidden" value="${supidentified.id}"
				name="supidentified.id">
			<table align="center">
				<tr>
					<td>
						申请单位：
						<input type="text" value="${supidentified.reqdpt.dptName}"
							disabled="disabled" />
						申请人：
						<input type="text" value="${supidentified.reqper.empName}"
							disabled="disabled" />
						申请日期：
						<input type="text" value="${supidentified.reqdate}"
							disabled="disabled" />
						<br />
						接收单位：
						<input type="text" value="${supidentified.recdpt.dptName}"
							disabled="disabled" />
						接收人：
						<input type="text" value="${supidentified.recper.empName}"
							disabled="disabled" />
						接收日期：
						<input type="text" value="${supidentified.recdate}"
							disabled="disabled" />
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
						<input type="text" value="${supidentified.supplierinfo.supcname}"
							disabled="disabled" />
					</td>
				</tr>
				<tr>
					<td>
						品牌:
					</td>
					<td>
						<input type="text" value="${supidentified.brand}"
							disabled="disabled" />
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
						品牌销售:
					</td>
					<td>
						<c:if test="${supidentified.directosales}">
							直销
						</c:if>
						<c:if test="${!supidentified.directosales}">
						代销
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
					</td>
				</tr>
				<tr>
					<td>
						申请附备资料:
					</td>
					<td>
						<textarea name="supidentified.reqinfo" cols="70" rows="3"
							disabled="disabled">${supidentified.reqinfo}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						采购认定意见:
					</td>
					<td>
						<p>
							（认定交货能力和服务情况）
							<textarea name="" cols="70" rows="3" disabled="disabled">${supidentified.puradvice}</textarea>
						</p>
						<p>
							经办：
							<input type="text" value="${supidentified.purper.empName}"
								disabled="disabled" />
							
								日期：
							<input type="text" value="${supidentified.pardate}"
								disabled="disabled" />
							部门负责人：
							<input type="text" value="${supidentified.purresper.empName}"
								disabled="disabled" />
							日期：
							<input type="text" value="${supidentified.purdate}"
								disabled="disabled" />
						</p>
					</td>
				</tr>
				<tr>
					<td>
						品工部认定意见:
					</td>
					<td>
						<p>
							（认定交货能力和服务情况）
							<textarea name="" cols="70" rows="3" disabled="disabled">${supidentified.quadvice}</textarea>
						</p>
						<p>
							经办：
								日期：
							<input type="text" name="" value="${supidentified.quadate}"
								disabled="disabled" />
							<input type="text" name="" value="${supidentified.quaper.empName}"
								disabled="disabled" />
							部门负责人：
							<input type="text" name="" value="${supidentified.quaresper.empName}"
								disabled="disabled" />
							日期：
							<input type="text" name="" value="${supidentified.partdate}"
								disabled="disabled" />
						</p>
					</td>
				</tr>
				<tr>
					<td>
						总工或分管领导意见:
					</td>
					<td>
						<textarea name="" cols="70" rows="3" disabled="disabled">${supidentified.manadvice}</textarea>
						<p>
							签字：
							<input type="text"  value="${supidentified.manper.empName}"
								disabled="disabled" />
							日期：
							<input type="text" name="" value="${supidentified.mandate}"
								disabled="disabled" />
						</p>
					</td>
				</tr>
				<tr>
					<td>
						备注:
					</td>
					<td>
						<textarea name="" cols="70" rows="3" disabled="disabled">${supidentified.note}</textarea>
					</td>
				</tr>
				</table>
			<table style="width:85%; text-align:center" >
				<tr bgcolor="#f5f5f5">
						<td>
							<input type="submit" value="返回" class="frm_btn" />
						</td>
					</tr>
				</table>
		</form>
		<SCRIPT type=text/javascript>
	$(document).ready(registerPre);
</SCRIPT>
	</body>
</html>