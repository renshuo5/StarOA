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
	    <script type="text/javascript" src="<%=basePath%>js/purchase.js"></script>
	    <script type="text/javascript" src="<%=basePath%>js/persons.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
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
		<form action="<%=basePath%>purchase/supplierinfo/supplierinfo_update"
			method="post">
			<input type="hidden" value="${supplierinfo.id}"
				name="supplierinfo.id">
			<table class="title">
				<tr>
					<td>
						供方资料表
					</td>
				</tr>
			</table>
			<table class="addTable" style="width: 100%">
				<tr>
					<td>
						名称:
					</td>
					<td>
						（中文）
						<input type="text" value="${supplierinfo.supcname}"
							name="supplierinfo.supcname" id="supplierinfosupcname_C"
							 />
						&nbsp;&nbsp;（英文）
						<input type="text" value="${supplierinfo.supename}"
							name="supplierinfo.supename" id="supplierinfosupename_E"
							 class="checkEnglish"/>
						<span id="checksupplierinfosupename"
							style="color: #FF0000; font-size: 12px;"></span>
					</td>
				</tr>
				<tr>
					<td>
						地址:
					</td>
					<td>
						<input type="text" value="${supplierinfo.address}"
							name="supplierinfo.address" size="25" id="supplierinfoaddress"
							class="checkEmptyShowInfo" />
						<span id="checksupplierinfoaddress"
							style="color: #FF0000; font-size: 12px;"></span>
					</td>
				</tr>
				<tr>
					<td>
						联系电话:
					</td>
					<td>
						<input type="text" value="${supplierinfo.phone}"
							name="supplierinfo.phone" size="25" id="supplierinfophone"
							class="employeephoneNo"/>
<span id="checksupplierinfophone"
							style="color: #FF0000; font-size: 12px;"></span>
					</td>
				</tr>
			</table>
			<table class="addTable" style="width: 100%">
				<tr>
					<th>
						联系人
					</th>
				</tr>
			</table>
			<table class="addTable" style="width: 100%">
				<tr>
					<td>
						业务：
					</td>
					<td>
						<input type="text" value="${supplierinfo.business}"
							name="supplierinfo.business" size="25" id="supplierinfobusiness"
							class="checkEmptyShowInfo" />
						<span id="checksupplierinfobusiness"
							style="color: #FF0000; font-size: 12px;"></span>
					</td>
				</tr>
				<tr>
					<td>
						质量：
					</td>
					<td>
						<input type="text" value="${supplierinfo.quality}"
							name="supplierinfo.quality" size="25" id="supplierinfoquality"
							class="checkEmptyShowInfo" />
						<span id="checksupplierinfoquality"
							style="color: #FF0000; font-size: 12px;"></span>
					</td>
				</tr>
				<tr>
					<td>
						技术：
					</td>
					<td>
						<input type="text" value="${supplierinfo.tech}"
							name="supplierinfo.tech" size="25" id="supplierinfotech"
							class="checkEmptyShowInfo" />
						<span id="checksupplierinfotech"
							style="color: #FF0000; font-size: 12px;"></span>
					</td>
				</tr>
			</table>
			<table class="addTable" style="width: 100%">
				<tr>
					<th>
						相关资料
					</th>
				</tr>
			</table>
			<table class="addTable" style="width: 100%">
				<tr>
					<td>
						(1)产品的取证情况：
					</td>
					<td>
						<textarea name="supplierinfo.obtain" cols="40" rows="4"
							>${supplierinfo.obtain}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						(2)企业质量管理情况：
					</td>
					<td>
						<textarea name="supplierinfo.quamger" cols="40" rows="4"
							>${supplierinfo.quamger}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						(3)企业管理获奖情况：
					</td>
					<td>
						<textarea name="supplierinfo.award" cols="40" rows="4"
							>${supplierinfo.award}</textarea>
					</td>
				</tr>
			</table>
			<table class="addTable" style="width: 100%">
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
				<tr>
					<td>
						<input value="${supplierinfo.itemname}" type="text"
							name="supplierinfo.itemname" size="16" />
					</td>
					<td>
						<input value="${supplierinfo.itemtypename}" type="text"
							name="supplierinfo.itemtypename" size="18" />
					</td>
					<td>
						<input value="${supplierinfo.output}" type="text"
							name="supplierinfo.output" size="12" class="checkNumShowInfo"/>
					</td>
					<td>
						<input value="${supplierinfo.qsituation}" type="text"
							name="supplierinfo.qsituation" size="12" />
					</td>
					<td>
						<input value="${supplierinfo.muser}" type="text"
							name="supplierinfo.muser" size="20" />
					</td>
					<td>
						<input value="${supplierinfo.availability}" type="text"
							name="supplierinfo.availability" size="20" />
					</td>
					<td>
						<input value="${supplierinfo.supcycle}" type="text"
							name="supplierinfo.supcycle" size="18" />
					</td>
				</tr>
			</table>
			<table class="addTable" style="width: 100%">
				<tr>
					<td>
						备注：
					</td>
					<td>
						<textarea name="supplierinfo.notes" cols="40" rows="4">${supplierinfo.notes}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						填表人:
					</td>
					<td>
						<input type="text" value="${auditUser.employee.empName}" size="7"
							disabled="disabled" />
						<input type="hidden" name="supplierinfo.wper.empId"
							value="${auditUser.employee.empId}" />
						日期：
						<input id="d2441" type="text" class="Wdate checkDateInfo"
							value="${supplierinfo.wdate}"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2_0',skin:'whyGreen'})" />
						<input type="hidden" value="${supplierinfo.wdate}" id="d244_2_0"
							name="supplierinfo.wdate" />
					</td>
				</tr>
				<tr>
					<td>
						审核人:
					</td>
					<td>
						<input type="text" disabled="disabled" size="7" />
						日期：
						<input type="text" name="" disabled="disabled" />
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
		<br>
		<SCRIPT type=text/javascript>
	$(document).ready(registerPre);
</SCRIPT>
	</body>
</html>