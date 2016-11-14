<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="../css/lanrentuku.css" />
    <script type="text/javascript" src="../js/jquery-1.4.js"></script>
    <script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="../js/xixi.js"></script>
    <style type="text/css">
body{
	background-image:url(../images/menu_bg2.jpg);
	background-repeat:no-repeat;
	margin:0;
	padding:0;
}
body, td, th {
	font-size: 18px;
	color: #FFF;
}
</style>
  </head>
  
  <body style="margin:0px">
    <table width="100%">
      <div style="margin:0px; padding:5px;">
        ${menuString }
        <div class="clear"></div>
      </div>
    </table>
  </body>
</html>