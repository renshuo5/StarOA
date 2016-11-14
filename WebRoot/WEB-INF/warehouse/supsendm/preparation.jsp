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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<title>要货计划单</title>
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<script language="javascript" src="js/public.js"></script>
		<script language="javascript" src="js/jquery/jquery.js"></script>
		   <script type="text/javascript" src="<%=basePath %>js/highLight.js"></script>
		   <script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
    <script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
	</head>
	<body>
		<%--<table>
			<tr>
				<td style="text-align: right">
					<input type="button" class="frm_btn" id="supsendm_add"
						value="制定默认配套发料表"
						onClick="window.self.location = '<%=basePath%>warehouse/supsendm/supsendm_addInput?preparation.id=${preparation.id }'">
				</td>
			</tr>
		</table>
		--%><table class="title">
			<tr>
				<td>要货计划单</td>
			</tr>
		</table>
		<table class="addTable editTable">
			<tr>
				<td>
					编号：
				</td>
				<td>
					<input type="text" name="preparation.presn"
						value="${preparation.presn }" size="15" disabled="disabled" />
				</td>
			</tr>
			<tr>
				<td>
					编制日期：
				</td>
				<td>
					<input type="text" name="preparation.pdate"
						value="<fmt:formatDate value='${preparation.pdate }'/>" size="15" disabled="disabled" />
				</td>
			</tr>
		</table>
		<table class="list">
			<tr>
				<th>
					品名
				</th>
				<th>
					型号规格
				</th>
				<th>
					数量（台）
				</th>
				<th>
					进仓时间
				</th>
				<th>
					备注
				</th>
				<th>
					发料表
				</th>
			</tr>
			<tr>
			</tr>
			<!---------------------------LOOP START------------------------------>
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="p">
					<tr>
						<td>
							<input type="hidden" value="${p.id }"/>
							${p.itemType.item.name }
						</td>
						<td>
							<input type="hidden" value="${p.itemType.id }"/>
							${p.itemType.name }
						</td>
						<td>
							${p.preNum }
						</td>
						<td>
							<fmt:formatDate value="${p.eDate }"/>
						</td>
						<td>
							${p.preNote }
						</td>
						<td>
							<c:choose>
								<c:when test="${p.addsup==1}">
									已制定
								</c:when>
								<c:otherwise>
									<c:if test="${isOnlyOne==1}">
										<input type="button" class="frm_btn" id="supsendm_add" value="制定"
										onClick="window.self.location='<%=basePath%>warehouse/supsendm/supsendm_addSingleInput?preparation.id=${preparation.id }&needNum=${p.preNum }&itemType.id=${p.itemType.id}'">
									</c:if>
									<c:if test="${isOnlyOne!=1}">
										<input type="button" class="frm_btn" id="supsendm_add" value="制定"
										onClick="openWin('<%=basePath%>warehouse/supsendm/supsendm_addSingleInput?preparation.id=${preparation.id }&needNum=${p.preNum }&itemType.id=${p.itemType.id}','editItemtype',800,600);return false">
									</c:if>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<!---------------------------LOOP END------------------------------>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="6" class="TableBody1">
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
					
						<pg:first>
							<a href="${pageUrl}&preparation.id=${preparation.id}" id="firstpageurl">首页</a>
						</pg:first>
						<pg:prev>
							<a href="${pageUrl }&preparation.id=${preparation.id}">《</a>
						</pg:prev>
						<pg:pages>
							<c:choose>
								<c:when test="${currentPageNumber eq pageNumber}">
									<font color="red">${pageNumber }</font>
								</c:when>
								<c:otherwise>
									<a href="${pageUrl }&preparation.id=${preparation.id}">${pageNumber }</a>
								</c:otherwise>
							</c:choose>
						</pg:pages>
						<pg:next>
							<a href="${pageUrl }&preparation.id=${preparation.id}">》</a>
						</pg:next>
						<pg:last>
							<a href="${pageUrl }&preparation.id=${preparation.id}">尾页</a>
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

							<input type="hidden" name="preparation.id" value="${preparation.id }"/>
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