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
		<title>产品类别管理</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script language="javascript" src="js/public.js"></script>

		<script type="text/javascript">
	//到指定的分页页面
	function topage(page) {
		var form = document.forms[0];
		form.page.value = page;
		form.submit();
	}
</script>

	</head>

	<body bgcolor="#FFFFFF" text="#000000" marginwidth="0" marginheight="0">

		<!-- action="control/product/type/list" -->

		<table>
			<tbody>
				<tr height="15">
					<td background="images/shadow_bg.jpg"></td>
				</tr>
			</tbody>
		</table>
		<%--查询--%>

		<table class="list">
			<tr>

				<td width="85%" align="right" colspan="12">
					<input name="AddDic2" type="button" class="frm_btn" id="AddDic2"
						onClick=javascript:;;window.location.href=
						'../物料损益/物料变异申报表.html';value="物料变异">
					&nbsp;&nbsp;
					<input name="AddDic" type="button" class="frm_btn" id="AddDic"
						onClick=javascript:;;window.location.href=
						'../物料损益/报废申请表.html';value="报废">
				</td>
			</tr>

			<tr>
				<th width="4%" align="center"></th>
				<th width="7%" align="center">
					保税号
				</th>
				<th width="10%" align="center">
					保税名称代号
				</th>
				<th width="13%" align="center">
					保税名称规格
				</th>
				<th width="8%" align="center">
					单定
				</th>
				<th width="20%" align="center">
					一般部品发料数量
				</th>
				<th width="13%" align="center">
					保税部门发料数量
				</th>
				<th width="6%" align="center">
					本批结存
				</th>
				<th width="8%" align="center">
					上批结存
				</th>
				<th width="11%" align="center">
					备注
				</th>
			</tr>
			<!---------------------------LOOP START------------------------------>
			<tr>
				<td align="center">
					<input type="radio" name="set" />
				</td>
				<td align="center">
					3
				</td>
				<td align="center">
					碳膜电阻MPG38
				</td>
				<td align="center">
					RDM14TS472J
				</td>
				<td align="center">
					<div>
						6
					</div>
				</td>
				<td align="center"></td>
				<td align="center"></td>
				<td align="center"></td>
				<td align="center"></td>
				<td align="center"></td>
			</tr>
			<tr>
				<td align="center">
					<input type="radio" name="set" />
				</td>
				<td align="center">
					2
				</td>
				<td align="center">
					4
				</td>
				<td align="center">
					按键KHH
				</td>
				<td align="center">
					RDM14TS472J
				</td>
				<td align="center"></td>
				<td align="center"></td>
				<td align="center"></td>
				<td align="center"></td>
				<td align="center"></td>
			</tr>
		</table>


		<!----------------------LOOP END------------------------------->
		</table>
		<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
						<pg:param name="productionSchdul.itemType.name" />
						<pg:param name="productionSchdul.itemType2.name" />
						<pg:first>
							<a href="${pageUrl}" id="firstpageurl">首页</a>
						</pg:first>
						<pg:prev>
							<a href="${pageUrl }"><</a>
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
							<a href="${pageUrl }">></a>
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

							<input type="hidden" name="productionSchdul.itemType.name"
								value="${productionSchdul.itemType.name }" />

							<input type="hidden" name="productionSchdul.itemType2.name"
								value="${productionSchdul.itemType2.name}" />
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