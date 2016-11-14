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
		<title>权限资源</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/security.js"></script>

		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="js/public.js"></script>
	</head>

	<body>
		<table>

			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>

		</table>




		<table class=list>

			<tr>
				<td colspan="6" align="right" background="images/title_bg2.jpg">
					<div align="center">
						<font color="#FFFFFF">权限资源</font>
					</div>



				</td>
			</tr>

			<tr>
				<th width="20%">
					<div align="center">
						权限资源编号
					</div>
				</th>
				<th width="20%">
					<div align="center">
						权限资源名
					</div>
				</th>
				<th width="20%">
					<div align="center">
						权限资源类型
					</div>
				</th>
				<th width="30%">
					<div align="center">
						权限资源值
					</div>
				</th>
				<th width="5%">
					<div align="center">
						编辑
					</div>
				</th>

				<th width="5%">
					<div align="center">
						删除
					</div>
				</th>


			</tr>
			<!---------------------------LOOP START------------------------------>
			<!-- 列表数据栏 -->

			<c:if test="${resource!=null}">
				<tr>
					<td>
						<div align="center">
							${resource.id}
						</div>
					</td>
					<td>
						<div align="center">
							${resource.name}
						</div>
					</td>
					<td>
						<div align="center">
							${resource.type}

						</div>
					</td>
					<td>
						<div align="center">
							${resource.value}
						</div>
					</td>
					<td align="center">

						<a href="#"
							onclick="openWin('<%=basePath%>security/resource/resource_editInput?resourceid=${resource.id}','editResource',600,250);return false">

							<img src="images/edit.gif" width="15" height="16" border="0">

						</a>

					</td>

					<td align="center">

						<a href="#"
							onclick="del('<%=basePath%>security/resource/resource_del?resourceid=${resource.id}');return false">
							<img src="images/del.gif" width="15" height="16" border="0">
						</a>


					</td>

				</tr>
			</c:if>
			<c:if test="${resource==null}">

				<tr>
					<td colspan="6" style="color: red">
						数据已被删除，请返回
					</td>
				</tr>
			</c:if>




		</table>
		<table class="addTable">
			<tr>


				<td>
					<%--<input type="button" class="frm_btn" value="返回"
						onclick='javascript: history.go(-1);'/>
						--%><input type="button" class="frm_btn" value="返回"
						onclick="location.href='security/resource/resource_list'"/>
						
					

				</td>
			</tr>
		</table>

		<SCRIPT type=text/javascript>
	$(document).ready(registerPre);
</SCRIPT>
	</body>
</html>