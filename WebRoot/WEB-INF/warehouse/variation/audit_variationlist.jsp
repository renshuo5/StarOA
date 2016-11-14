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
		<title>物料变异列表</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<script language="javascript" src="js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script type="text/javascript" src="<%=basePath%>js/examineOnly.js"></script>
	</head>
	<body>
		<table class="title">
			<tr>
				<td>物料变异申报表列表</td>
			</tr>
		</table>
		<table class="list">
			
			<tr>
				<th>
					编号
				</th>
				<th>
					品名
				</th>
				<th>
					型号规格
				</th>
				<th>
					料号
				</th>
				<th>
					适用机种
				</th>
				<th>
					单位
				</th>
				<th>
					日期
				</th>
				<th>
					审核状态
				</th>
				
			</tr>

			<!---------------------------LOOP START------------------------------>
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="vargood">
			<tr>
				<td align="center">
					${vargood.variation.var_id }
				</td>
				<td>
					${vargood.itemType.item.name }
				</td>
				<td>
					${vargood.itemType.name }
				</td>
				<td>
					${vargood.itemType.mCode }
				</td>
				<td>
					${vargood.forstyle }
				</td>
				<td>
					${vargood.variation.dpt_id.dptName }
				</td>
				<td>
					<fmt:formatDate value="${vargood.variation.vardate }"/>
				</td>
				<td class="examine">
					<c:choose>
						<c:when test="${vargood.variation.quaadvice == 0}">
							<input type="hidden" name="status" value="0" />
							<a href="<%=basePath %>warehouse/variation/variation_audit?vargood.vag_id=${vargood.vag_id}"><span>未审核</span></a>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="status" value="1" />
							<a><span>已审核</span></a>
						</c:otherwise>
					</c:choose>
				</td>
				
			</tr>
			</c:forEach>
			</c:if>
			<!----------------------LOOP END------------------------------->
	
		</table>
		<c:if test="${empty pm.datas}">
				<table>
					<tr>
					<td>
						没有找到相应的记录
					</td>
				</tr>
				</table>
			</c:if>
		<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
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