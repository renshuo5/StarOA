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
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<title>库存查询</title>
		<meta http-equiv="pragma" content="no-cache" />
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
		<table>
		<tr>
			<td style="text-align:right">

				<form action="warehouse/stock/stock_bondedsearch" method="post">
					货名：
					<input type="text" name="stock.itemType.item.name" class="itemname" />
					&nbsp;&nbsp;
					<input class="frm_btn" type="submit" value="查询" />
					<input type="button" name="SYS_SET"  value="非保税品"
						class="frm_btn" size=5
						onclick="javascript:self.location='<%=basePath%>warehouse/stock/stock_generallist'" />
				</form>
			</td>
		</tr>
		</table>
		<table class="title">
			<tr>
				<td>
					保税品库存查询
				</td>
			</tr>
		</table>
		<table class="list">

			<tr>
				<th>
					货名
				</th>
				<th>
					型号规格
					</th>
					<th>
						存储仓库名
					</th>
					<th>
						库存数量
					</th>
					<th>
						报废数量
					</th>
			</tr>
			<!---------------------------LOOP START------------------------------>
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas}" var="stock">
					<tr>
						<td>
							<div align="center">
								${stock.itemType.item.name}
							</div>
						</td>
						<td>

							<div align="center">

								${stock.itemType.name}

							</div>

						</td>
						<td>

							<div align="center">

								${stock.whname}

							</div>

						</td>
						<td>
							<div align="center">
								<c:choose>
									<c:when test="${stock.stonum<1000}">
										<label style="color: red">${stock.stonum}</label>
									</c:when>
									<c:otherwise>
										${stock.stonum}
									</c:otherwise>
								</c:choose>

							</div>
						</td>
						<td>
							<div align="center">
								${stock.scrnum}
							</div>
						</td>


					</tr>

				</c:forEach>
			</c:if>
			<!----------------------LOOP END------------------------------->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="10" align="center" bgcolor="#EFF3F7"
						class="TableBody1" onmouseover=this.bgColor
						= '#DEE7FF';onmouseout=this.bgColor='#EFF3F7';>
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
						<pg:param name="stock.itemType.item.name" />
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

							<input type="hidden" name="stock.itemType.item.name"
								value="${stock.itemType.item.name }" />
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