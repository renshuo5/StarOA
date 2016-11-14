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
		<title>添加类别</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath %>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/item.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="js/public.js"></SCRIPT>
		

</head>
<body >

<table>
			<tbody>
				<tr>
					<td height="1" bgcolor="#b1ceef"></td>
				</tr>
				<tr height="15">
					<td background="images/shadow_bg.jpg"></td>
				</tr>
			</tbody>
		</table>


<form action="item/item/item_add" method="post">
<!--<html:hidden property="parentid"/>-->
  <table class="addTable" width="474" height="149" style="width: 774px;">
    <tr>
      <td colspan="6" background="images/title_bg2.jpg" > <font color="#FFFFFF">添加部品：</font></td>
    </tr>
   	<tr> 
	      <td width="22%" > <div align="right">部品名：</div></td>
	      <td width="78%"><input type="text" name="item.name"  size="50" maxlength="100"  id="itemname" class="checkEmptyShowInfo"/></td>
   	</tr>
   	<TR>
					<TD height=14 align="right" noWrap>
						部品类型：
						</TD>
						<TD height=14 align="left" noWrap>
						<SELECT name="item.itemcategory">
							<option value="MATERIAL">原料</option>
							<option value="SEMIFINISHED">中间件</option>
							<option value="PRODUCT">产品</option>
						</SELECT>
					</TD>
				</TR>
   	<tr> 
	      <td width="22%" > <div align="right">简介：</div></td>
	      <td width="78%"><input type="text" name="item.description" size="50" maxlength="100"/></td>
   	</tr>
   	<tr> 
	      <td width="22%" > <div align="right">备注：</div></td>
	      <td width="78%"><input type="text" name="item.notes" size="50" maxlength="100"/></td>
   	</tr>
  </table>
  <table>
  	<tr> 
      <td colspan="2"> <div align="center"> 
          <input type="submit" value=" 保 存 " class="frm_btn" id="additem">
          <input type="button" class="frm_btn" value="关闭窗口" onclick=window.close();>
        </div></td>
    </tr>
  </table>
</form>
<br>
<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
</body>
</html>