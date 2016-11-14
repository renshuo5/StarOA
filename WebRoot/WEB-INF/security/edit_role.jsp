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
		<title>修改权限角色</title>
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/security.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script type="text/javascript" src="<%=basePath%>js/menu.js"></script>

		<script language="javascript" src="js/public.js"></script>
	</head>

	<body>

		<table>

			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>

		</table>


		<form action="security/role/role_update" method="post">
			<input type="hidden" value="${role.id}" name="role.id">

			<table class="addTable">

				<TR>
					<TD height=14 align="left" noWrap>
						角色名:
					</TD>
					<TD height=14 align="left" noWrap>
						<input type="text" value="${role.name}" name="role.name"
							id="rolename" class="itemname">

						<span id="checkrolename" style="color: #FF0000; font-size: 12px;"></span>
						(角色名请以ROLE_开头，并且不能与已有角色名重复，否则将视为非法角色)
					</TD>
				</TR>

				<TR>
					<TD height=14 align="left" noWrap>
						角色描述:
					</TD>
					<TD height=14 align="left" noWrap>
						<input type="text" value="${role.description}"
							name="role.description" id="roleDescription" class="itemname">
						<span id="checkroleDescription"
							style="color: #FF0000; font-size: 12px;"></span>
					</TD>
				</TR>


				<tr></tr>

			</table>


			<div align="center">
				<br />
			</div>
			<table class="list">

				<tr>
					<td colspan="4" align="left" background="images/title_bg2.jpg">
						<div align="center">
							<font color="#FFFFFF">请选择该角色的权限：</font>
						</div>
					</td>
				</tr>

			</table>

			<c:if test="${navs!=null}">
				<table cellpadding="0px" cellspacing="3px" align="center"
					style="text-align: left;">
					<tr>
						<c:forEach items="${navs}" var="nav">
							<td valign="top" width="200px" style="border: 0px solid black;">

								<table cellspacing="1px" cellpadding="0px"
									style="text-align: left; border: 0px">
									<tr>

										<td style="text-align: left; color: #FFFFFF; font-size: 16px;border: 0px"
											bgcolor="#0173DA" height="35px">
											<input type="checkbox" value="${nav.content }"
												name="${nav.id }" id="nav${nav.id}">
											${nav.content }
										</td>
									</tr>
									<c:forEach items="${menus}" var="menu">
										<c:if test="${menu.nav.id==nav.id}">
											<tr>
												<td style="text-align: left;" bgcolor="#1f93e6" height="28px">
													&nbsp;&nbsp;&nbsp;
													<input type="checkbox" value="${menu.content}"
														id="nav${nav.id}menu${menu.id}" name="${menu.id}">
													${menu.content }
												</td>
											</tr>
											<c:forEach items="${itemMenus}" var="itemMenu">
												<c:if test="${itemMenu.menu.id==menu.id}">
													<tr>
														<td style="text-align: left; color: #FFFFFF"
															bgcolor="#456789">
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<input type="checkbox" value="${itemMenu.content }"
																name="${itemMenu.id}"
																id="nav${nav.id}menu${menu.id}item${itemMenu.id}">
															${itemMenu.content }
														</td>
													</tr>
													<c:forEach items="${testResources}" var="testResource">
														<c:if
															test="${testResource.parentMenuItem.id==itemMenu.id}">
															<tr>
																<td
																	style="text-align: left; color: black; font-size: 12px;border: 0px">
																	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	<input type="checkbox" value="${testResource.id }"
																		name="checkedResourceIdList"
																		id="nav${nav.id}menu${menu.id}item${itemMenu.id}resource${testResource.id}"
																		<c:forEach items="${checkedResourceIdList }" var="id" >
						                                                   <c:if test="${testResource.id==id}">
						                                                               checked="checked" 
						                                                  </c:if> 
						  
						                                               </c:forEach>
						                                               >
																	${testResource.name }
																</td>
															</tr>

														</c:if>
													</c:forEach>

												</c:if>
											</c:forEach>
										</c:if>
									</c:forEach>

								</table>

							</td>


						</c:forEach>
					</tr>

				</table>

			</c:if>

			<br />
			<div align="center">
				<input type="submit" class="frm_btn" value="提交">
			</div>

		</form>
		<SCRIPT type=text/javascript>
	$(document).ready();
</SCRIPT>
	</body>
</html>