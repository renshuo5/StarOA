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
		<title>生产计划单列表</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/produce.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></SCRIPT>
		<script type="text/javascript" src="<%=basePath%>js/examineOnly.js"></script>
		
		<style type="text/css">
img.edit {
	cursor: hand;
}

img.delete {
	cursor: hand;
}

a.examineGray{
	text-decoration:none;
	cursor:default;
	background:repeat-x;
	background-image:url(<%=basePath %>images/examine_bg_gray.jpg);
}
		</style>
		
		</head>
		<body>

			<table>
				<tr height="15">
					<td background="images/shadow_bg.jpg"></td>
				</tr>
			</table>

			<%--查询--%>
			<table>
				<TR>

					<TD style="text-align:right">

						<form action="produce/productionplan/productionplan_search"
							method="post">
							编制人：
							<input type="text" name="prscheck.employeeEdit.empName" class="itemname" />
							&nbsp;&nbsp; 编制号：
							<input type="text" name="prscheck.psn" class="itemname" />
							&nbsp;&nbsp;
							<input class="frm_btn" type="submit" value="查询" />
					</td>
					<td>

						

					</td></form>
					</TD>
				</TR>
			</table>
			<table class="title">

				<td>
					生 产 计 划 单 列 表
				</td>
			</table>

			<table class="list">

				<tr>
					<th>
						序号
					</th>
					<th>
						编 号
					</th>

					<th>
						车间
					</th>
					<th>
						编制人
					</th>

					<th>
						日期
					</th>

					<th>
						状态
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
					<c:forEach items="${pm.datas }" var="prscheck">
						<tr>
							<td>
								<div align="center">
									<a
										href="<%=basePath%>produce/productionplan/productionplan_show?prscheckId=${prscheck.id}">生产计划单${prscheck.id}</a>
								</div>
							</td>
							<td>
								<div align="center">
									<c:out value="${prscheck.psn}"></c:out>
								</div>
							</td>
							<td>
								<div align="center">
									<c:out value="${prscheck.department.dptName}"></c:out>

								</div>
							</td>
							<td>
								<div align="center">
									<c:out value="${prscheck.employeeEdit.empName}"></c:out>
								</div>
							</td>
							<td>
								<div align="center">
									<c:out value="${prscheck.prsDate }"></c:out>
								</div>
							</td>


							<td class="examine">

								<c:if
									test="${prscheck.employeeAudit.empId==null&&prscheck.employeeApprove.empId==null}">
									<input type="hidden" name="status" value="0" />
								</c:if>
								<c:if
									test="${prscheck.employeeAudit.empId!=null&&prscheck.employeeApprove.empId==null}">
									<input type="hidden" name="status" value="10" />
								</c:if>
								<c:if
									test="${prscheck.employeeAudit.empId!=null&&prscheck.employeeApprove.empId!=null}">
									<input type="hidden" name="status" value="11" />
								</c:if>
								<a
									href=" <%=basePath%>produce/productionplan/productionplan_au_dit?prscheckId=${prscheck.id}"><span>审核</span>
								</a>&rarr;<a
									href=" <%=basePath%>produce/productionplan/productionplan_auditAgain?prscheckId=${prscheck.id}"><span>批准
								</span> </a>
							</td>
							<td align="center">

								<%--									<a   href="#" onclick="openWin('item/item/item_editInput?itemid=${item.id}','editItem',600,250);return false">--%>
								
								<c:if
									test="${!(prscheck.employeeAudit.empId!=null&&prscheck.employeeApprove.empId!=null)}">
								<a class="a03" href="#"
									onclick="openWin('<%=basePath%>produce/productionplan/productionplan_edit_input?prscheckId=${prscheck.id}','updateprscheck',800,600);return false"><img
										src="images/edit.gif" width="15" height="16" border="0">
								</a>
</c:if>
							</td>

							<td align="center">

								<a href="#"
									onclick="del('<%=basePath%>produce/productionplan/productionplan_del?prscheckId=${prscheck.id}');return false">
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
						<td colspan="8" align="center" bgcolor="#EFF3F7"
							onmouseover=
	this.bgColor = '#DEE7FF';
onmouseout=
	this.bgColor = '#EFF3F7';
;>

							没有找到相应的记录
						</td>
					</tr>
				</c:if>
				<!-- 在列表数据为空的时候，要显示的提示信息 -->
				<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
					<tr height=28px valign="middle">
						<th align=right noWrap>
							<pg:pager
								url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
								items="${pm.total}" maxPageItems="${pagesize}"
								export="currentPageNumber=pageNumber">

								<pg:param name="prscheck.psn" />


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
							<div style="height: 26px; overflow: hidden; valign: middle">
								<form
									action="<%=request
							.getAttribute("javax.servlet.forward.servlet_path")
							.toString().substring(1)%>">

									<input type="hidden" name="prscheck.psn"
										value="${prscheck.psn }" />


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
			</table>
			<SCRIPT type=text/javascript>
	$(document).ready(registerPre);
</SCRIPT>
		</body>
</html>