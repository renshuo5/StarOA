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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<title>修改密码</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script language="javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>js/jquery/jquery.md5.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/security.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>

	</head>

	<body>

		<form action="security/user/user_passwordsSave"
			onsubmit="oldPassword.value =$.md5(oldPassword.value);newPassword.value =$.md5(newPassword.value)">
			<table class="addTable">
				<tr>
					<td>
						原密码：
					</td>
					<td align="left">
						<input type="password" name="oldPassword" id="oldPassword"
							class="itemname" />
					</td>
				</tr>
				<tr>
					<td>
						新密码：
					</td>
					<td align="left">
						<input type="password" name="newPassword" id="newPassword"
							class="itemname" />
						<span id="checknewPassword"
							style="color: #FF0000; font-size: 12px;"></span>
					</td>
				</tr>
				<tr>
					<td>
						确认新密码：
					</td>
					<td align="left">
						<input type="password" class="itemname" id="newPasswordagain" />
					</td>
				</tr>

			</table>

			<table class="btn">
				<tr>
					<td>
						<input class="frm_btn" type="submit" value="确定" />
					</td>
				</tr>
			</table>
		</form>
		<SCRIPT type=text/javascript>
	$(document).ready(registerPre);
</SCRIPT>
	</body>
</html>
