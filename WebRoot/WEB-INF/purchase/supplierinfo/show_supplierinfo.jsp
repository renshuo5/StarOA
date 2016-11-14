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
		<title>供应商资料</title>
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
		<form action="purchase/supplierinfo/supplierinfo_list" method="post">
			<table class="title" style="width: 85%">
				<tr>
					<td>
						供方资料表
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						名称:
					</td>
					<td>
						（中文）
						<input disabled="disabled" type="text"
							value="${supplierinfo.supcname}">
						&nbsp;&nbsp;（英文）
						<input disabled="disabled" type="text"
							value="${supplierinfo.supename}" />
					</td>
				</tr>
				<tr>
					<td>
						地址:
					</td>
					<td>
						<input disabled="disabled" type="text"
							value="${supplierinfo.address}" size="25" />
					</td>
				</tr>
				<tr>
					<td>
						联系电话:
					</td>
					<td>
						<input disabled="disabled" type="text"
							value="${supplierinfo.phone}" size="25" />
					</td>
				</tr>
			</table>
			<table class="addTable editTable">
				<tr>
					<th>
						联系人
					</th>
				</tr>
			</table>
			<table class="addTable editTable">
				<tr>
					<td>
						业务：
					</td>
					<td>
						<input disabled="disabled" type="text"
							value="${supplierinfo.business}" size="25" />
					</td>
				</tr>
				<tr>
					<td>
						质量：
					</td>
					<td>
						<input disabled="disabled" type="text"
							value="${supplierinfo.quality}" size="25" />
					</td>
				</tr>
				<tr>
					<td>
						技术：
					</td>
					<td>
						<input disabled="disabled" type="text"
							value="${supplierinfo.tech}" size="25" />
					</td>
				</tr>
			</table>
			<table class="addTable editTable">
				<tr>
					<th>
						相关资料
					</th>
				</tr>
			</table>
			<table class="addTable editTable">
				<tr>
					<td>
						(1)产品的取证情况：
					</td>
					<td>
						<textarea disabled="disabled" cols="40" rows="4">${supplierinfo.obtain}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						(2)企业质量管理情况：
					</td>
					<td>
						<textarea disabled="disabled" cols="40" rows="4">${supplierinfo.quamger}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						(3)企业管理获奖情况：
					</td>
					<td>
						<textarea disabled="disabled" cols="40" rows="4">${supplierinfo.award}</textarea>
					</td>
				</tr>
			</table>
			<table class="addTable editTable">
				<tr>
					<th colspan="8">
						主要产品
					</th>
				</tr>
				<tr>
					<th>
						产品名称
					</th>
					<th>
						规格型号
					</th>
					<th>
						年产量
					</th>
					<th>
						质量状况
					</th>
					<th>
						主要用户
					</th>
					<th>
						供货能力
					</th>
					<th>
						供货周期
					</th>
				</tr>
				<tr align="center">
					<td>
						<input value="${supplierinfo.itemname}" type="text"
							name="supplierinfo.itemname" size="16" disabled="disabled" />
					</td>
					<td>
						<input value="${supplierinfo.itemtypename}" type="text"
							name="supplierinfo.itemtypename" size="18" disabled="disabled" />
					</td>
					<td>
						<input value="${supplierinfo.output}" type="text"
							name="supplierinfo.output" size="12" disabled="disabled" />
					</td>
					<td>
						<input value="${supplierinfo.qsituation}" type="text"
							name="supplierinfo.qsituation" size="12" disabled="disabled" />
					</td>
					<td>
						<input value="${supplierinfo.muser}" type="text"
							name="supplierinfo.muser" size="20" disabled="disabled" />
					</td>
					<td>
						<input value="${supplierinfo.availability}" type="text"
							name="supplierinfo.availability" size="20" disabled="disabled" />
					</td>
					<td>
						<input value="${supplierinfo.supcycle}" type="text"
							name="supplierinfo.supcycle" size="18" disabled="disabled" />
					</td>
				</tr>
			</table>
			<table class="addTable editTable">
				<tr>
					<td>
						备注：
					</td>
					<td>
						<textarea disabled="disabled" name="supplierinfo.notes" cols="40"
							rows="4">${supplierinfo.notes}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						填表人:
					</td>
					<td>
						<input disabled="disabled" value="${supplierinfo.wper.empName}"
							type="text" />
						日期：
						<input disabled="disabled" value="${supplierinfo.wdate}"
							type="text" />
					</td>
				</tr>
				<tr>
					<td>
						审核人:
					</td>
					<td>
						<input disabled="disabled"
							value="${supplierinfo.checkper.empName}" type="text" />
						日期：
						<input disabled="disabled" value="${supplierinfo.checkdate}"
							type="text" />
					</td>
				</tr>
			</table>
			<table style="width:85%; text-align:center" >
				<tr bgcolor="#f5f5f5">
					<td>
						<input type="submit" value="返回" class="frm_btn">
					</td>
				</tr>
			</table>
		</form>
		<br>
	</body>
</html>