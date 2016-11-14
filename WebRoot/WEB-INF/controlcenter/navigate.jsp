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
    

 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>head1</title>
    
    <base href="<%=basePath%>"/>
    <style type="text/css">
<!--
/*通用*/
body {
	font:12px "微软雅黑", Arial, Verdana, Tahoma, "宋体";
}
* {
	padding:0px;
	margin:0px;
}
* li {
	list-style:none;
}
a {
	text-decoration:none;
	color:#20537A;
}
a:hover {
	text-decoration:underline;
}
.clearfix:after {
	content: "\0020";
	display: block;
	height: 0;
	clear: both;
}
.clearfix {
	_zoom: 1;
}
*+html .clearfix {
	overflow:auto;
}
.menu_navcc {
	width:1030px;
	margin:0 auto;
}
.menu_nav {
	width:1030px;
	height:48px;
	background:url(images/nav_bg.gif) repeat-x;
	float:left;
	margin-top:13px;
}
.menu_nav .nav_content {
	padding-left:25px;
	background:url(images/nav_l_bg.gif) no-repeat;
	float:left;
}
.menu_nav .nav_content li {
	width:88px;
	height:48px;
	padding-left:15px;
	padding-right:13px;
	background:url(images/nav_li_right.gif) no-repeat right center;
	float:left;
	line-height:48px;
	text-align:center;
	font-size:18px;
	font-weight:500;
}
.menu_nav .nav_content li a {
	color:#fff;
	width:88px;
	height:48px;
	display:block;
}
.menu_nav .nav_content li.current {
	line-height:37px;
}
.menu_nav .nav_content li em {
	background:url(images/bid_new.gif) no-repeat;
	width:35px;
	height:21px;
	display:inline-block;
	position:absolute;
	top:-20px;
	left:40px;
}
.menu_nav .nav_content li.current a, .menu_nav .nav_content li a:hover {
	width:88px;
	height:37px;
	background:url(images/nav_li_current.gif) no-repeat;
	display:block;
	color:#fff;
}
.menu_nav .nav_content li a:hover {
	background:url(images/nav_li_hover.gif) no-repeat;
	line-height:37px;
	text-decoration:none;
}
.menu_nav_right {
	padding-right:20px;
	background:url(images/nav_r_bg.gif) no-repeat right top;
	float:right;
	margin-left:50px;
	padding-top:13px;
	height:23px;
	padding-bottom:12px;
}
-->
</style>
<script type="text/javascript" src="js/jquery-1.4.js">
	
</script>

<script type="text/javascript" >
	$(document).ready(function(){
		$("a").click(function(){
			$(".current").removeClass();
			$(this).parent("li").addClass("current");
		})
	});
</script>

  </head>
  <body style="vertical-align:inherit; background-repeat:no-repeat" background="images/top_bg6.jpg">
  <table>
  <tr>
  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
  <td>
    <div style="clear:both"></div>
    <div class="menu_navcc">
      <div class="menu_nav clearfix">
        ${navString }
        <div class="menu_nav_right">
        </div>
      </div>
    </div>
    <!--nav,end-->
    </td>
    </tr>
    </table>
  </body>
</html>   
  
