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
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<title>修改权限资源</title>
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/security.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		
		<script language="javascript" src="js/public.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/resource.js"></script>
		
		<script type="text/javascript">
		 $(document).ready();
	
		</script>
		
	</head>
	<body>

		<table>

			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>

		</table>


		<form action="security/resource/resource_add" method="post">

			<table class="addTable">
				<tr>
					<td height=14 align="left" noWrap>
						请选择类型：
					</td>
					<td height=14 align="left" noWrap>
					 <span id="nav">
					  <select name="nav">
					   <option value="" selected="selected">请选择</option>
					   <c:forEach items="${navs}" var="nav">
					   <option value="${nav.id }">${nav.content}</option>
					   </c:forEach>
					  </select>
					  </span>
					  <span id="menu">
					  <select name="menu">
					   <option value="" selected="selected">请选择</option>
					  </select>
					  </span>
					  
					  <select name="resource.parentMenuItem.id" id="menuitem">
					   <option  value="" selected="selected">请选择</option>
					  </select>
					  
					</td>
				</tr>
				<tr>
				  <td height=14 align="left" noWrap>
				  是否为菜单资源：
				  </td>
				  <td height=14 align="left" noWrap>
				  <input type="radio" id="menuresource" name="isMenu" value="yes">是&nbsp;
				  <input type="radio" id="unmenuresource" name="isMenu" value="no">否
				  
				  </td>
				</tr>
				<tr>

					<td height=14 align="left" noWrap>
						权限资源名：
					</td>
					<td height=14 align="left" noWrap>

						<input type="text" name="resource.name" size="50" maxlength="50"
							id="resourcename" class="itemname" />
						<span id="checkresourcename"
							style="color: #FF0000; font-size: 12px;"></span>
				</tr>
				<tr>
					<td height=14 align="left" noWrap>
						权限资源类型：
					</td>
					<td height=14 align="left" noWrap>


						<input type="text" value="URL" name="resource.type"
							disabled="disabled" />

					</td>
				</tr>

				<tr>
					<td height=14 align="left" noWrap>
						权限资源值：
					</td>
					<td height=14 align="left" noWrap>


						<input type="text" name="resource.value" size="50" maxlength="100"
							id="resourcevalue" class="itemname" />
						<span id="checkresourcevalue"
							style="color: #FF0000; font-size: 12px;"></span>
					</td>
				</tr>


			</table>

			<div align="center">
				<input type="submit" name="SYS_SET" value=" 保 存 " class="frm_btn">
				<input type="button" class="frm_btn" value="关闭窗口"
					onclick=
	window.close();
>
			</div>

		</form>
		<br>
		
	</body>
</html>