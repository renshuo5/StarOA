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
		<title>退货单</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
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

					<form action="sales/return/returned/returned_search" method="post">
						客户名称：
						<input type="text" name="returned.customern" />

						&nbsp;&nbsp;
						<input class="frm_btn" type="submit" value="查询" />
						<br />
					</form>

				</TD>


			</TR>
		</table>



		<table class="title">
			<tr>
				<td>退 货 单 审 核 列 表
				</td>
			</tr>
			</table>
			<table class="list">
			<tr>

				<th>
					编（批）号
				</th>

				<th>
						客户名称
				</th>
				<th>
					退货理由
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

			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="returned">
					<tr>

						<td>
							<a
								href="sales/return/returned/returned_show?returnedId=${returned.retid}">
								退货单${returned.sn}</a>

						</td>
						<td>
							${returned.customern}

						</td>
						<td>
							${returned.retnote}
						</td>
						<td>
							${returned.retdate}
						</td>
						<td>


							<c:if test="${ null != returned.signatory}"> 
										  已入库
										</c:if>
							<c:if test="${ null== returned.signatory}">

								<a href="#"
									onclick="openWin('<%=basePath%>sales/return/returned/returned_examineInput?returnedId=${returned.retid}','examineReturned',800,600);return false">
									待审核</a>
							</c:if>
						</td>

						<td>

							<a href="#"
								onclick="openWin('<%=basePath%>sales/return/returned/returned_editInput?returnedId=${returned.retid}','editReturned',800,600);return false">
								<img src="images/edit.gif" width="15" height="16" border="0">
							</a>
						</td>

						<td>


							<a href="#"
								onclick="del('sales/return/returned/returned_del?returnedId=${returned.retid}&unqualifiedId=${unqualified.unq_id}');return false">
								<img src="images/del.gif" width="15" height="16" border="0">
							</a>


						</td>

					</tr>
				</c:forEach>
			</c:if>
			<!----------------------LOOP END------------------------------->
		</table>





		<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
						<pg:param name="itemtype.name" />
						<pg:param name="itemtype.description" />
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

							<input type="hidden" name="itemtype.name"
								value="${itemtype.name }" />

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

	</body>
</html>

