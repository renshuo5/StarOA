<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>403</title>
		<style>
<!--
body {
	font-family: arial, sans-serif
}

div.nav {
	margin-top: 1ex
}

div.nav A {
	font-size: 10pt;
	font-family: arial, sans-serif
}

span.nav {
	font-size: 10pt;
	font-family: arial, sans-serif;
	font-weight: bold
}

div.nav A,span.big {
	font-size: 12pt;
	color: #0000cc
}

div.nav A {
	font-size: 10pt;
	color: black
}

A.l:link {
	color: #6f6f6f
}

A.u:link {
	color: green
}
//
-->
</style>
		<script>
	var rc = 404;
	//-->
</script>

	</head>
	<body bgcolor="#ffffff" text="#000000">
		<table border="0" cellpadding="2" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td rowspan="3" nowrap="nowrap" width="1%">
						<img src="images/error.gif"/>
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td bgcolor="#3366cc">
						<font color="#ffffff" face="arial,sans-serif"><b>Error</b>
						</font>
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
			</tbody>
		</table>
		<blockquote>
			<h1>
				错误
			</h1>
			对不起，您没有访问权限。请确认自己是否具有该访问权限。
			<p>
			</p>
		</blockquote>
		<table cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td bgcolor="#3366cc">
						<img alt="" height="4" width="1">
					</td>
				</tr>
			</tbody>
		</table>
	</body>

</html>
