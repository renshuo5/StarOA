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
		<title>添加权限角色</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/vip.css" type="text/css">
	<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/security.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script type="text/javascript" src="js/jquery/jquery.md5.js"></script> 
<script language="javascript" src="js/public.js"></script>
	</head>

	<body >

		<table>
			
				<tr height="15">
					<td background="images/shadow_bg.jpg"></td>
				</tr>
			
		</table>

	
		<form action="security/user/user_add" method="post"  onsubmit="password.value =$.md5(password.value)">
			
			<table class="addTable">
		
				<TR>
					<TD height=14 align="left" noWrap>
						用户名:
					</TD>
					<TD height=14 align="left" noWrap>
						<input type="text" value="${user.name}" name="userName" id="username" class="itemname">
						<span id="checkusername" style="color: #FF0000; font-size: 12px;"></span>
					</TD>
				</TR>
				
				<TR>
					<TD height=14 align="left" noWrap>
						用户密码:
						</TD>
						<TD height=14 align="left" noWrap>
						<input type="password" value="${user.password}" name="userPassword" id="password" class="itemname">
						<span id="checkpassword" style="color: #FF0000; font-size: 12px;"></span>
					</TD>
				</TR>
				
				<TR>
					<TD height=14 align="left" noWrap>
						选择员工:
						</TD>
						<TD height=14 align="left" noWrap>
						<input id='employeeNameId_0' type="text" value="${user.employee.empName}" disabled="disabled">
							<input id='employeeIdId_0' name="employeeId" value="${user.employee.empId}" type="hidden"/>	
		<input  type='button' value='选择' class='frm_btn' onclick="openWin('<%=basePath%>persons/employee/employee_selectInput?paname=0','selectEmployee',800, 600, 1);return false">
		
					</TD>
				</TR>

				<tr></tr>
			
			</table>
			
				<table class="list">
				
				<tr>
					<td colspan="5" align="left" background="images/title_bg2.jpg">
						<div align="left">
							<font color="#FFFFFF">该用户的角色权限：</font>
						</div>
					</td>
				</tr>
				<tr>
					
					<th width="5%" >
						<div align="center">	选择</div>
					</th>
					<th width="20%" >
						<div align="center">
							角色权限
						</div>
					</th>
				
<th width="20%" >
						<div align="center">
						角色描述
						</div>
					</th>

				</tr>
				<!---------------------------LOOP START------------------------------>
				<!-- 列表数据栏 -->

				<c:if test="${!empty roleList}">
					<c:forEach items="${roleList }" var="role" >
							<tr>
						
						<td>
						<div align="center">
						<input  type="checkbox" name="checkedRoleIdList" value="${role.id}"/>
						</div>
						</td>
						<td >
						<c:out value="${role.name }"></c:out>
						</td>
						<td >
						<c:out value="${role.description }"></c:out>
						</td>
								</tr>
							</c:forEach>
							</c:if>

			</table>
			<table class="btn" style="width:100%"><tr><td>
	<input type="submit" class="frm_btn" value="提交"></td></tr></table>

		</form>
	<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>	
	</body>
</html>