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
<html>
	<head>
		<base href="<%=basePath%>">
		<title>权限资源</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script language="javascript" src="js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/annoucement.js"></script>
	</head>

	<body bgcolor="#FFFFFF" text="#000000" marginwidth="0" marginheight="0">
		<table width="100%" cellspacing="0" cellpadding="0" border="0"
			align="center">
			<tbody>
				<tr height="20">
					<td background="images/title_bg1.jpg">
						&nbsp;&nbsp;当前位置:&nbsp;&nbsp;系统管理&nbsp;-&nbsp;系统公告

					</td>
				</tr>
				<tr>
					<td height="1" bgcolor="#b1ceef"></td>
				</tr>
				<tr height="15">
					<td background="images/shadow_bg.jpg"></td>
				</tr>
			</tbody>
		</table>

		<%--查询--%>
		<table>
			<TR>
				<TD height=14 align=right noWrap>
					<!-- 在这里插入查询表单 -->
				</TD>
				<TD height=14 align="left" noWrap>

					<form action="annoucement/annoucement/annoucement_search"
						method="post">
						标题：
						<input type="text" name="annoucement.title" class="itemname" />
						&nbsp;&nbsp;
						<input class="frm_btn" type="submit" value="查询" /> <input type="button" class="frm_btn" onclick="openWin('<%=basePath%>annoucement/annoucement/annoucement_addInput','addItemtype',800,600);return false" value="新建公告">
						
					</form>

				</TD>
			</TR>
		</table>


		<table class="title">
			<tr>
				<td>
					<!--------------------------------添加--------------------------------------------- -->

					<div align="right">
						<a class="a03" href="annoucement/annoucement/annoucement_addInput">新建公告</a>

					</div>
					<!-- ------------------------------------添加------------------------------------ -->



				</td>
			</tr>
			</table>
			<table class="list" >
			<tr>
				<th>
					公告编号
				</th>
				<th>
					公告标题
				</th>
				<th>
					发布日期
				</th>

				<th>
					编辑
				</th>

				<th>
					删除
				</th>


			</tr>
			<!---------------------------LOOP START------------------------------>
			<!-- 列表数据栏 -->
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="annoucement">
					<tr>
						<td bgcolor="f5f5f5">
							<div align="center">
								${annoucement.id}
							</div>
						</td>
						<td bgcolor="f5f5f5">
							<div align="center">
								<a
									href="annoucement/annoucement/annoucement_show?annoucementid=${annoucement.id}">
									${annoucement.title} </a>
							</div>
						</td>
						<td bgcolor="f5f5f5">
							<div align="center">
								${annoucement.date}

							</div>
						</td>

						<td bgcolor="f5f5f5" align="center">

							<a
								href="annoucement/annoucement/annoucement_editInput?annoucementid=${annoucement.id}">

								<img src="images/edit.gif" width="15" height="16" border="0">

							</a>

						</td>

						<td bgcolor="f5f5f5" align="center">

							<a href="#"
								onclick="del('<%=basePath%>annoucement/annoucement/annoucement_del?annoucementid=${annoucement.id}');return false">
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
					<td colspan="6" align="center" bgcolor="#EFF3F7" class="TableBody1"
						onmouseover=this.bgColor = '#DEE7FF';
onmouseout=this.bgColor= '#EFF3F7';
;>

						没有找到相应的记录
					</td>
				</tr>
			</c:if>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
		</table>

		<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
						<pg:param name="annoucement.title" />
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
							<input type="hidden" name="annoucement.title"
								value="${annoucement.title}" />
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