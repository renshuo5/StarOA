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
		<title>修改用户</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/vip.css" type="text/css">
				<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
			<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
<script language="javascript" src="js/public.js"></script>
	</head>

	<body >

		<table>
			
				<tr height="15">
					<td background="images/shadow_bg.jpg"></td>
				</tr>
			
		</table>

	
		<form action="security/user/user_update" method="post"  onsubmit="password.value =$.md5(password.value)">
		<input type="hidden" value="${user.id}" name="userId">
			
			<table class="addTable">
		
				<TR>
					<TD height=14 align="left" noWrap>
						用户名:
					</TD>
					<TD height=14 align="left" noWrap>
						<input type="text" value="${user.name}" name="userName">
					</TD>
				</TR>
			
				
				<TR>
					<TD height=14 align="left" noWrap>
						选择员工:
						</TD>
						<TD height=14 align="left" noWrap>
								<input id='employeeNameId_0' type="text" value="${user.employee.empName}" disabled="disabled">
							<input id='employeeIdId_0' value="${user.employee.empId}" name="employeeId" type="hidden"/>	
		<input  type='button' value='选择' class='frm_btn' onclick="openWin('<%=basePath%>persons/employee/employee_selectInput?paname=0','selectEmployee',800, 600, 1);return false">
		
					</TD>
				</TR>
				
					<TR>
					<TD height=14 align="left" noWrap>
						是否重置密码:
						</TD>
						<TD height=14 align="left" noWrap>
						<input type="checkbox"  name="defultPassword" value="d41d8cd98f00b204e9800998ecf8427e">
					(重置后密码为空)
					</TD>
				</TR>
				

				<tr></tr>
			
			</table>
			
			
		<div align="center" >
		<br/>
				</div>

			<table class="list" >
				
				<tr>
					<td colspan="5" align="left" background="images/title_bg2.jpg"
						>
						<div align="left">
							<font color="#FFFFFF">该用户的角色：</font>
						</div>
					</td>
				</tr>
				<tr>
					
					<th width="5%" >
						<div align="center">	选择</div>
					</th>
					<th width="20%" >
						<div align="center">
							角色名
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
						
						<td >
						<div align="center">


<input  type="checkbox" name="checkedRoleIdList" value="${role.id}"
						 <c:forEach items="${checkedRoleIdList }" var="id" >
						  <c:if test="${role.id==id}">
						  checked="checked" 
						  </c:if> 
						  
						</c:forEach>
						
						/>
						
						</div>
						</td>
						<td >
						${role.name }
						</td>
							<td >
						${role.description }
						</td>
						
								</tr>
							</c:forEach>
							</c:if>

			</table>
			
	
	<div align="center">
	<input type="submit" class="frm_btn" value="提交">
	</div>

		</form>
		
	</body>
</html>