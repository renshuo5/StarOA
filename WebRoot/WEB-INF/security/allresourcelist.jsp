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
		<table>
			<TR>

				<TD style="text-align: right">



					<input class="frm_btn" type="button" value="添加权限资源"
						onclick="openWin('<%=basePath%>security/resource/resource_addInput','addResource',600,250);return false" />
				</TD>



			</TR>
		</table>

		<table class="list">

			<tr>
				<td colspan="4" align="left" background="images/title_bg2.jpg">
					<div align="center">
						<font color="#FFFFFF">所有资源列表</font>
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

									<td
										style="text-align: left; color: #FFFFFF; font-size: 16px; border: 0px"
										bgcolor="#0173DA" height="35px">

										${nav.content }
									</td>
								</tr>
								<c:forEach items="${menus}" var="menu">
									<c:if test="${menu.nav.id==nav.id}">
										<tr>
											<td style="text-align: left;" bgcolor="#1f93e6" height="28px">

												&nbsp;&nbsp;${menu.content }
											</td>
										</tr>
										<c:forEach items="${itemMenus}" var="itemMenu">
											<c:if test="${itemMenu.menu.id==menu.id}">
												<tr>
													<td style="text-align: left; color: #FFFFFF"
														bgcolor="#456789">

														&nbsp;&nbsp;${itemMenu.content }
													</td>
												</tr>
												<c:forEach items="${resources}" var="resource">
													<c:if test="${resource.parentMenuItem.id==itemMenu.id}">
														<tr>
															<td
																style="text-align: left; color: black; font-size: 12px;">

																<a
																	href=" 
																	<%=basePath%>security/resource/resource_show?resourceid=${resource.id}">
																	&nbsp;&nbsp;&nbsp;&nbsp; ${resource.name}</a>
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
		


		<SCRIPT type=text/javascript>
	$(document).ready();
</SCRIPT>
	</body>
</html>