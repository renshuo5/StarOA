<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%> 
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
		<title>修改权限角色</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<script language="javascript" src="js/public.js"></script>
		<script language="javascript" src="js/jquery/jquery.js"></script>
	</head>

	<body bgcolor="#FFFFFF" text="#000000" marginwidth="0" marginheight="0">

		<table width="100%" cellspacing="0" cellpadding="0" border="0"
			align="center">
			<tbody>
				<tr height="20">
					<td background="images/title_bg1.jpg">
						&nbsp;&nbsp;当前位置:&nbsp;&nbsp;系统管理&nbsp;-&nbsp;系统公告&nbsp;-&nbsp;新建
					</td>
				</tr>
				<tr>
					<td height="1" bgcolor="#b1ceef"></td>
				</tr>
				<tr height="15">
					<td background="images/shadow_bg.jpg"></td>
				</tr>
			</tbody>
		</table>


		<form action="security/role/role_update" method="post">
	<div align="center">
标题：<input name="" type="text" size="100">
<br/>
<br/>
	</div>	
		

	<div align="center">
 <FCK:editor instanceName="articleAddEditor" basePath="/fckeditor" value="sdgsfgfdg" height="70%" width="99%"></FCK:editor><br>
</div>
	<div align="center">
	<input type="submit" class="frm_btn" value="提交">
</div>

	
		</form>
  </body>
</html>
