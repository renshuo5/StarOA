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
		<title>选择物料</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css"
			type="text/css">

		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script type="text/javascript" src="<%=basePath%>js/examineOnly.js"></SCRIPT>

		<style type="text/css">
img.edit {
	cursor: hand;
}

img.delete {
	cursor: hand;
}

a.examineGray {
	text-decoration: none;
	cursor: default;
	background: repeat-x;
	background-image: url(<%=basePath%>images/examine_bg_gray.jpg);
}
</style>

	</head>
	<body>
		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>
		<table class="title">
			<tr>
				<td>
					生 产 计 划 单 审 核 列 表
				</td>
			</tr>
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

				<th>状态
				</th>
			</tr>
			<!---------------------------LOOP START------------------------------>
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas}" var="prscheck">
					<tr>
						<td>
							<div align="center">
								<a
									href="<%=basePath%>produce/productionplan/productionplan_au_dit?prscheckId=${prscheck.id}">生产计划单${prscheck.id}</a>
							</div>
						</td>
						<td>
							<div align="center">
								${prscheck.psn}
							</div>
						</td>
						<td>
							<div align="center">
								${prscheck.department.dptName}
							</div>
						</td>
						<td>
							<div align="center">
								${prscheck.employeeEdit.empName }
							</div>
						</td>
						<td>
							<div align="center">
								${prscheck.prsDate }
							</div>
						</td>



						<td class="examine">

							<c:if
								test="${prscheck.employeeAudit.empId==null&&prscheck.employeeApprove.empId==null}">
								<input type="hidden" name="status" value="00" />
							</c:if>
							<c:if
								test="${prscheck.employeeAudit.empId!=null&&prscheck.employeeApprove.empId==null}">
								<input type="hidden" name="status" value="10" />
							</c:if>

							<a
								href=" <%=basePath%>produce/productionplan/productionplan_au_dit?prscheckId=${prscheck.id}"><span>审核</span>
							</a>&rarr;

							<a
								href=" <%=basePath%>produce/productionplan/productionplan_auditAgain?prscheckId=${prscheck.id}"><span>批准
							</span>
							</a>
						</td>

					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="8" align="center" bgcolor="#EFF3F7"
						onmouseover="this.bgColor= '#DEE7FF'"
						onmouseout="t
	his.bgColor = '#EFF3F7'";>

						没有找到相应的记录
					</td>
				</tr>
			</c:if>
			<!----------------------LOOP END------------------------------->

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
						<div style="height: 20px; overflow: hidden; valign: middle">
							<form
								action="<%=request.getAttribute(
								"javax.servlet.forward.servlet_path")
								.toString().substring(1)%>">

								<input type="hidden" name="prscheck.psn"
									value="${prscheck.psn }" />

								<input type="hidden" name="itemtype.description"
									value="${itemtype.description}" />
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


	</body>
</html>