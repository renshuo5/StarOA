<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">

	<head>
		<base href="<%=basePath%>">
		<title>招聘内容</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<script language="javascript" src="js/public.js">
	
</script>
	</head>

	<body>
		<table class="title">

			<tr>
				<td>
					&nbsp;
				</td>
			</tr>
		</table>
		<table class="addTable">
			<tr>

				<td>
					需求类别
				</td>
				<td>
					需求人数
				</td>
				<td>
					需求部门
				</td>
				<td>
					招聘性质
				</td>
				<td>
					基本要求
				</td>
				<td>
					登记日期
				</td>

			</tr>
			<!---------------------------LOOP START------------------------------>
			<!-- 列表数据栏 -->
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas}" var="recruitment">
					<c:if test="${recruitment.isCheck==1}">

						<tr>
							<td bgcolor="f5f5f5">
								<div align="center">
									<c:out value="${recruitment.recstyle}" />
								</div>
							</td>
							<td bgcolor="f5f5f5">
								<div align="center">
									<c:out value="${recruitment.recno}" />
								</div>
							</td>
							<td bgcolor="f5f5f5">
								<div align="center">
									<c:out value="${recruitment.department.dptName}" />
								</div>
							</td>
							<td bgcolor="f5f5f5">
								<div align="center">
									<c:out value="${recruitment.recnature}" />
								</div>
							</td>

							<td bgcolor="f5f5f5">
								<div align="center">
									<c:out value="${recruitment.baserec}" />
								</div>
							</td>
							<td bgcolor="f5f5f5">
								<div align="center">
									<fmt:formatDate value="${recruitment.rDate}"
										pattern="yyyy-MM-dd" />
								</div>
							</td>


						</tr>
						<c:set var="total" value="${total+1}" />
					</c:if>
				</c:forEach>
			</c:if>
			<!----------------------LOOP END------------------------------->
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="11" align="center" bgcolor="#EFF3F7"
						class="TableBody1" onMouseOver=
	this.bgColor = '#DEE7FF';
onmouseout=
	this.bgColor = '#EFF3F7';
;>

						没有找到相应的记录
					</td>
				</tr>
			</c:if>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->

		</table>

		<TABLE width="778" border=0 align=center cellPadding=0 cellSpacing=0
			borderColor=#ffffff style="FONT-SIZE: 10pt">
			<TR height=28px valign="middle">
				<TD align=right noWrap background=images/list_middle.jpg>
					<!-- 分页导航条 开始-->
					<TABLE border=0 align=center cellPadding=0 cellSpacing=0>
						<TR height=28px valign="middle">
							<TD align=right noWrap background=images/list_middle.jpg>
								&nbsp;&nbsp;
								<pg:pager
									url="<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>"
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
							</td>
							<!-- 更改pagesize 开始-->
							<td align=left valign="middle" noWrap width="10%"
								background=images/list_middle.jpg>
								<div style="height: 20px; overflow: hidden; valign: middle">
									<form
										action="<%=request
							.getAttribute("javax.servlet.forward.servlet_path")
							.toString().substring(1)%>">

										<input type="hidden" name="annoucement.title"
											value="${annoucement.title}" />

										<select name="pagesize" onChange="this.form.submit()"
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
							</TD>
							<!-- 更改pagesize 结束-->
						</TR>
					</TABLE>
					<!-- 分页导航条 结束-->
				</TD>
			</TR>
		</TABLE>

	</body>
</html>