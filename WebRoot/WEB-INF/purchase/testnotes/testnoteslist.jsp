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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>量试通知单表</title>
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/purchase.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script type="text/javascript" src="<%=basePath%>js/examineOnly.js"></script>
	</head>
	<body>
		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>

		<!-- 查询 -->
		<table>
			<tr>
				<td style="text-align: right">
					<form action="purchase/testnotes/testnotes_search" method="post">
						供应商名称：
						<input type="text" name="testnotes.supplierinfo.supcname"
							class="itemname" />
						&nbsp;&nbsp;
						<input class="frm_btn" type="submit" value="查询" />
						<input class="frm_btn" type="button"
							onclick="document.location='purchase/testnotes/testnotes_samidList'"
							value="添加" />
					</form>
				</td>
			</tr>
		</table>
		<table class="title">
			<tr>
				<td>
					量试通知单资料
				</td>
			</tr>
		</table>
		<table class="list">
			<tr>
				<th>
					量试通知单
				</th>
				<th>
					供方名称
				</th>
				<th>
					制定部门
				</th>
				<th>
					日期
				</th>
				<th>
					审核状态
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
				<c:forEach items="${pm.datas }" var="testnotes">
					<tr align="center">
						<td>
							<div align="center">
								<a
									href="purchase/testnotes/testnotes_show?testnotesId=${testnotes.id}">
									量试通知单<c:out value="${testnotes.id}"></c:out>
								</a>
							</div>
						</td>

						<td>
							<div align="center">
								<c:out value="${testnotes.supplierinfo.supcname}"></c:out>
							</div>
						</td>
						<td>
							<div align="center">
								<c:out value="${testnotes.department.dptName}"></c:out>
							</div>
						</td>

						<td>
							<div align="center">
								<c:out value="${testnotes.senddate}"></c:out>
							</div>
						</td>
						
							<td class="examine">
							<c:if test="${null==testnotes.purmanper.empId&&null==testnotes.quamanper.empId}">
								<input name="status" type="hidden" value="${00}" />
								<a href="#"
									onclick="openWin('<%=basePath%>purchase/testnotes/testnotes_purexam?testnotesId=${testnotes.id}','examineSamidentified',900,600,'1');return false">
									<span>采购确认</span> </a>
							
						</c:if>
						<c:if test="${null!=testnotes.purmanper.empId&&null==testnotes.quamanper.empId}">
						
								<input name="status" type="hidden" value="${01}" />
								
									<a href="#"><span>已通过(
									<c:out value="${testnotes.purmanper.empName}"></c:out>
									)</span></a>
								
							</c:if>
						
						<c:if test="${null!=testnotes.purmanper.empId&&null!=testnotes.quamanper.empId}">
							<input name="status" type="hidden" value="${11}" />
							<a href="#">
							<span>
									已审核</span></a>
								</c:if>
							</td>
						
						<c:if test="${empty testnotes.purmanper.empId}">
							<td align="center">
								<a href="#"
									onclick="openWin('<%=basePath%>purchase/testnotes/testnotes_editInput?testnotesId=${testnotes.id}','editTestnotes',900,600);return false">
									<img src="images/edit.gif" width="15" height="16" border="0">
								</a>
							</td>
						</c:if>
						<c:if test="${!empty testnotes.purmanper.empId}">
							<td>
							</td>
						</c:if>
						<td align="center">
							<div align="center">
								<a href="#"
									onclick="del('<%=basePath%>purchase/testnotes/testnotes_del?testnotesId=${testnotes.id}');return false">
									<img src="images/del.gif" width="15" height="16" border="0">
								</a>
							</div>
						</td>

					</tr>
				</c:forEach>
			</c:if>
			<!----------------------LOOP END------------------------------->
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="8" align="center" bgcolor="#EFF3F7" class="TableBody1"
						onmouseover="this.bgColor= '#DEE7FF'"
						onmouseout="this.bgColor = '#EFF3F7'">
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
						<pg:param name="testnotes.supplierinfo.supcname" />
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
					<div style="height: 28px; overflow: hidden; valign: middle">
						<form
							action="<%=request.getAttribute(
								"javax.servlet.forward.servlet_path")
								.toString().substring(1)%>">

							<input type="hidden" name="testnotes.supplierinfo.supcname"
								value="${testnotes.supplierinfo.supcname }" />
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
