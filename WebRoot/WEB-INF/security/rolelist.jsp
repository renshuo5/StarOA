<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<title>权限角色</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<link rel="stylesheet" href="css/vip.css" type="text/css">
			<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>js/security.js"></script>
		
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="js/public.js"></script>
	</head>

	<body >
		<table>
			
				<tr height="15">
					<td background="images/shadow_bg.jpg"></td>
				</tr>
			
		</table>

		<%--查询--%>
		<table>
		<TR>
			
			<TD style="text-align:right">
				
				<form action="security/role/role_search" method="post">
					权限角色名：
					<input type="text" name="role.name" class="itemname"/>
					&nbsp;&nbsp;
					<input class="frm_btn" type="submit" value="查询" />
					<br />
				</form>
			</TD>
				
				
			<td>
			<%--<form action="security/role/role_addInput" method="post">
			  <input class="frm_btn"  value="添加权限角色" type="submit"/>
			</form>
			  --%>
			  <input class="frm_btn" type="button" value="添加权限资源"
						onclick="openWin('<%=basePath%>security/role/role_addInput','addResource',1500,600,1);return false" />
			</td>
			

		</TR>
		</table>
		

		<table class="list">
					<tr>
						<td colspan="5" align="right" background="images/title_bg2.jpg">
							<!--------------------------------添加--------------------------------------------- -->

							<div align="right">
	&nbsp;
							</div>
							<!-- ------------------------------------添加------------------------------------ -->



						</td>
					</tr>
					<tr>
						<th width="10%" >
							<div align="center">
								权限角色编号
							</div>
						</th>
						<th width="20%" nowrap>
							<div align="center">
								权限角色名
							</div>
						</th>
						<th width="30%" >
							<div align="center">
								权限角色描述
							</div>
						</th>
						
						<th width="5%" >
							<div align="center">
								编辑
							</div>
						</th>

						<th width="5%" nowrap >
							<div align="center">
								删除
							</div>
						</th>


					</tr>
					<!---------------------------LOOP START------------------------------>
				<!-- 列表数据栏 -->
				<c:if test="${!empty pm.datas}">
					<c:forEach items="${pm.datas }" var="role">
							<tr>
								<td >
									<div align="center">
								${role.id}
									</div>
								</td>
								<td >
									<div align="center">
										${role.name}
									</div>
								</td>
								<td >
									<div align="center">
									${role.description}

									</div>
								</td>
								
								<td align="center">
	
									<a href="#"
									onclick="openWin('<%=basePath %>security/role/role_editInput?roleId=${role.id}','editItemtype',1500,600,1);return false">

									<img src="images/edit.gif" width="15" height="16" border="0">

								 </a>
									
								</td>

								<td align="center">

									 <a href="#"  onclick="del('<%=basePath%>security/role/role_del?roleId=${role.id}');return false"> 
										<img src="images/del.gif" width="15" height="16" border="0">
									</a> 


								</td>

							</tr>
						</c:forEach>
					</c:if>
					<!----------------------LOOP END------------------------------->
					<!-- 在列表数据为空的时候，要显示的提示信息 -->
				<c:if test="${empty pm.datas}">
					<tr>
						<td colspan="5" align="center" bgcolor="#EFF3F7"
							class="TableBody1" onmouseover="this.bgColor= '#DEE7FF'"
							onmouseout="this.bgColor='#EFF3F7'">
							没有找到相应的记录
						</td>
					</tr>
				</c:if>
					<!-- 在列表数据为空的时候，要显示的提示信息 -->
					
				<tr>
						<td  colspan="6" align="center">
									
									
									
									
									
						
						

<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
						<pg:param name="role.name" />
						<pg:first>
							<a href="${pageUrl}" id="firstpageurl">首页</a>
						</pg:first>
						<pg:prev>
							<a href="${pageUrl }">《</a>
						</pg:prev>
						<pg:pages>
							<c:choose>
								<c:when test="${currentPageNumber eq pageNumber}">
									<font color="red">${pageNumber }</font>
								</c:when>
								<c:otherwise>
									<a href="${pageUrl }">${pageNumber }</a>
								</c:otherwise>
							</c:choose>
						</pg:pages>
						<pg:next>
							<a href="${pageUrl }">》</a>
						</pg:next>
						<pg:last>
							<a href="${pageUrl }">尾页</a>
						</pg:last>
					</pg:pager>
					&nbsp;&nbsp;
				</th>
				<!-- 更改pagesize 开始-->
				<th align=left valign="middle" noWrap width="10%">
					<div style="height: 20px; overflow: hidden; valign: middle">
						<form
							action="<%=request
							.getAttribute("javax.servlet.forward.servlet_path")
							.toString().substring(1)%>">

						<input type="hidden" name="role.name"
												value="${role.name }" />

							
							<select name="pagesize" onchange="this.form.submit()"
								style="height: 16px; overflow: hidden; valign: middle">
								<c:forEach begin="1" end="50" step="3" var="i">
									<option value="${i}"
										<c:if test="${pagesize eq i }">selected</c:if>>
										${i}
									</option>
								</c:forEach>
							</select>
							行/页

						</form>
					</div>

				</th>
			</tr>
		</table>
	<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>								
									
					

	</body>
</html>