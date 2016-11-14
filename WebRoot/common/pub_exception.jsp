<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<script language="javascript" src="script/public.js"></script>
<title>系统出现异常</title>
<style type="text/css">
font{
	font-family: "微软雅黑";
	font-size:18px;
	}
</style>
</head>
<body>
<center><img alt="" src="<%=basePath%>images/exception.jpg" /><font color=red>系统出现异常!</font></center>
<font>出错简要信息：</font><br/>
<s:property value="exception.message"/>
<br/>
<br/>
<font>出错详细信息：</font><br/>
<s:property value="exceptionStack"/>
</body>
</html>