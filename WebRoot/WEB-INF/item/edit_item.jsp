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
<html>
	<head>
		<base href="<%=basePath%>">
		<title>编辑部品</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="<%=basePath %>js/public.js"></SCRIPT>
		<script language="javascript" src="<%=basePath %>js/item.js"></SCRIPT>
	</head>

	<body>

	
		<form action="item/item/item_update" method="post">
		<input type="hidden" value="${item.id}" name="item.id">
		<table class="title editTable"><tr><td>编辑部件</td></tr></table>
			<%--查询--%>
			<table class="addTable">
		
				<TR>
					<TD  noWrap>
						部品名:
					</TD>
					<TD  noWrap>
						<input type="text" value="${item.name}" name="item.name" class="itemname checkEmptyShowInfo" id="itemname">
					</TD>
				</TR>
				<TR>
					<TD  noWrap>
						类型:
						</TD>
						<TD noWrap>
						<SELECT name="item.itemcategory">
						<option value="${item.itemcategory}">${item.itemcategory.name }</option>
						<option value="MATERIAL">原料</option>
						<option value="SEMIFINISHED">中间件</option>
						<option value="PRODUCT">产品</option>
						</SELECT>
					</TD>
				</TR>
				
				<TR>
					<TD noWrap>
						物料描述:
						</TD>
						<TD height=14 align="left" noWrap>
						<input type="text" value="${item.description}" name="item.description"   class="itemname">
					</TD>
				</TR>
				<TR>
					<TD  noWrap>
						备注:
						</TD>
						<TD  noWrap>
						<input type="text" value="${item.notes}" name="item.notes" class="itemname">
					</TD>
				</TR>
			</table>
			<table class="btn"><tr><td><input type="submit" class="frm_btn" value="提交" id="SYS_SET"></td></tr>
	</table>

		</form>
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>