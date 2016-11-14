
<%@ page contentType="text/html;charset=UTF-8" import="com.fjsdfx.starerp.security.model.User,org.springframework.security.context.SecurityContextHolder"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

User user =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
  <base href="<%=basePath%>">
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="css/admin.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY>
<TABLE cellSpacing=0 cellPadding=0 width="100%" 
background="images/header_bg.jpg" border=0>
  <TR height=56>
    <TD width=500><IMG height=56 src="images/logo.gif" 
    width=500></TD>
    <TD style="FONT-WEIGHT: bold; COLOR: #fff; PADDING-TOP: 20px" 
      align=middle>当前用户：<%=user.getName() %> &nbsp;&nbsp; <A style="COLOR: #fff" 
      href="" 
      target=main></A> &nbsp;&nbsp; <A style="COLOR: #fff" 
      onclick="if (confirm('确定要退出吗？')) return true; else return false;" 
      href="${pageContext.request.contextPath}/j_spring_security_logout" target=_top>退出系统</A> 
    </TD>
    <TD align=right width=68>&nbsp;</TD>
  </TR></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TR bgColor=#1c5db6 height=4>
    <TD></TD></TR></TABLE></BODY></HTML>