
<%@ page contentType="text/html;charset=UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Frameset//EN">
<HTML>
<HEAD>
  <base href="<%=basePath%>">
<TITLE>管理中心 V1.0</TITLE>
<META http-equiv=Content-Type content="text/html; charset=UTF-8">
<META http-equiv=Pragma content=no-cache>
<META http-equiv=Cache-Control content=no-cache>
<META http-equiv=Expires content=-1000>
<LINK href="css/admin.css" type="text/css" rel="stylesheet">
</HEAD>
<FRAMESET border=0 frameSpacing=0 rows="60, 60,*" frameBorder=0>
<FRAME name=header src="controlcenter/header" frameBorder=0 noResize scrolling=no>
<FRAME name=navigate src="controlcenter/navigate" frameBorder=0 noResize scrolling=no>
<FRAMESET cols="180, *">
<frameset rows="*,80" frameborder="no" border="0" framespacing="0">
<FRAME name=menu src="controlcenter/personalCenter" frameBorder=0 noResize>
<FRAME name=button src="persons/Rasmessage/rasmessage_isCkeck" frameBorder=0 noResize>
</frameset>
<FRAME name=main src="controlcenter/main" frameBorder=0 noResize scrolling=yes>
</FRAMESET>
</FRAMESET>
<noframes>
</noframes>

</HTML>
