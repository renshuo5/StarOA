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
		<title>合格名录</title>
		<link type="text/css" href="css/vip.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css" />
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>

		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
		<table style="width:85%">
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>

		</table>
		<form action="<%=basePath%>purchase/quaprolist/quaprolist_add"
			method="post">
			<input type="hidden" value="${supplier.id}" name="quaprolist.supplierinfo.id">

			<table class="title" style="width:85%">
				<tr>
					<td>
						添加合格供方
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						供方名称：
					</td>
					<td>
						<input type="text" disabled="disabled"
							value="${supidentified.supplierinfo.supcname}">
					</td>
				</tr>
				<tr>
					<td>
						产品名称：
					</td>
					<td>
						<input align="left" type="text" disabled="disabled"
							value="${supidentified.supplierinfo.itemname}" />
					</td>
				</tr>
				<tr>
					<td>
						品牌：
					</td>
					<td>
						<input align="left" type="text" disabled="disabled"
							value="${supidentified.brand}" />
						<input type="hidden" name="quaprolist.brand"
							value="${supidentified.brand}" />
					</td>
				</tr>
				<%--<tr>
					<td>
						考核级别：
					</td>
					<td>
						<SELECT name="quaprolist.asslevel">
							<option value="Alevel">
								A
							</option>
							<option value="Blevel">
								B
							</option>
							<option value="Clevel">
								C
							</option>
						</SELECT>
					</td>
				</tr>
				--%><tr>
					<td>
						备注：
					</td>
					<td>
						<textarea name="quaprolist.note" cols="30" rows="3">${quaprolist.note}</textarea>
					</td>
				</tr>
			</table>
			<table style="width:85%; text-align:center">
				<tr bgcolor="#f5f5f5">
					<td>
						<input type="submit" name="submit" value="提交" class="frm_btn" />
					</td>
				</tr>
			</table>
		</form>
		<br>
	</body>
</html>