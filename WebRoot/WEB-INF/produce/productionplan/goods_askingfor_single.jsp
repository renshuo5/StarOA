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
		<title>添加生产计划单</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath %>css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath %>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath %>js/public.js"></script>
  </head>
    <link rel="stylesheet" href="css/vip.css" type="text/css">

    
  </head>
  <body bgcolor="#FFFFFF" text="#000000" marginwidth="0" marginheight="0">
    <table border="0">
      <tr align="right">
       
          <input type="button" class="frm_btn" id="制定生产计划单" onClick="openWin('<%=basePath%>produce/productionplan/productionplan_make_list','月生产计划单',800,600)" value="制定生产计划单">
      </tr>
      <tr>
        <td> 编制日期： </td>
        <td></td>
        <td> 编号： </td>
        <td colspan="2"></td>
      </tr>
      <tr>
        <th align="center" bgcolor="#266cc1" ><font color="#FFFFFF">品名</font></th>
        <th width="40%" align="center" bgcolor="#266cc1"><font color="#FFFFFF">型号规格</font></th>
        <th align="center" bgcolor="#266cc1"><font color="#FFFFFF">数量（台）</font></th>
        <th align="center" bgcolor="#266cc1"><font color="#FFFFFF">进仓时间</font></th>
        <th width="30%" align="center" bgcolor="#266cc1"><font color="#FFFFFF">备注</font></th>
      </tr>
      <tr>
        <td align="center">打印机</th>
        <td align="center"></td>
        <td align="center"></td>
        <td align="center"> 年 月 日</td>
        <td align="center"></td>
      </tr>
    </table>
  </body>
</html>