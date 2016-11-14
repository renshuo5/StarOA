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
		<title>收料通知单</title>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
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
				<TD style="text-align: right">

					<form action="warehouse/rewinder/rewinder_search" method="post">
						供货单位：
						<input type="text" name="rewinder.suplyu" class="itemname"/>
						<input class="frm_btn" type="submit" value="查询" />
					</form>

				</TD>
			</TR>
		</table>
		<table class="title">
			<tr>
				<td>
					收料通知单不合格列表
				</td>
			</tr>
		</table>

		<table class="list">

			<tr>
				<th>
					编号
				</th>
				<th>
					供货单位
				</th>
				<th>
					采购
				</th>
				<th>
					编制日期
				</th>
				<th>
					编辑
				</th>
				<%--<th>
					删除
				</th>

			--%></tr>
			<!---------------------------LOOP START------------------------------>

			<!-- 列表数据栏 -->


			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas}" var="rewinder">
					<tr>
						<td>
							<a
								href="warehouse/rewinder/rewinder_showUnqualify?RewinderId=${rewinder.rew_id}">
								收料通知单${rewinder.rew_id} </a>
						</td>

						<td>
							${rewinder.suplyu}
						</td>
						<td>
							${rewinder.buyerEmployee.empName}
						</td>
						<td>
							${rewinder.rew_date}
						</td>
						<td>

							<a href="#"
								onclick="openWin('<%=basePath%>warehouse/rewinder/rewinder_editInput?rewinderId=${rewinder.rew_id}','editRewinder',1024,768);return false">

								<img src="images/edit.gif" width="15" height="16" border="0">

							</a>

						</td>

						<%--<td>

							<a href="#"
								onclick="del('<%=basePath%>warehouse/rewinder/rewinder_del?rewinderId=${rewinder.rew_id}');return false">
								<img src="images/del.gif" width="15" height="16" border="0">
							</a>


						</td>
					--%></tr>
				</c:forEach>

			</c:if>
			<!----------------------LOOP END------------------------------->
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="8" align="center" bgcolor="#EFF3F7" class="TableBody1"
						onmouseover=this.bgColor = '#DEE7FF';
onmouseout=this.bgColor='#EFF3F7';
>
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
						<pg:param name="rewinder.suplyu" />
						<%--<pg:param name="rewgood.itemType.item.name" />
										--%>
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

							<input type="hidden" name="rewinder.suplyu"
								value="${rewinder.suplyu}" />

							<%--<input type="hidden" name="itemtype.description"
												value="${rewgood.itemType.item.name}" />
											--%>
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