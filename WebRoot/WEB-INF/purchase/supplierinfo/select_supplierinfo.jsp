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
	String supplierinfonumber = request
			.getParameter("supplierinfonumber");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>供应商资料</title>
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/highLight.js"></script>
		<script type="text/javascript">
	function selectSupplierinfo(id, supcname, itemname, itemtypename) {
		if (window.opener) {
			window.opener.document.all.supplierinfoIdId.value = id;
			window.opener.document.all.supplierinfoSupcnameId.value = supcname;
			window.opener.document.all.itemnameId.value = itemname;
			window.opener.document.all.itemtypenameId.value = itemtypename;
			window.close();
		}
	}
</script>
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

					<form
						action="purchase/supplierinfo/supplierinfo_selectSearch?supplierinfonumber=${supplierinfonumber}"
						method="post">
						供方名称：
						<input type="text" name="supplierinfo.supcname" />
						&nbsp;&nbsp;
						<input class="frm_btn" type="submit" value="查询" />
						<br />
					</form>

				</TD>
			</TR>
		</table>


		<table class="title">
			<tr>
				<td>
					<!--------------------------------添加--------------------------------------------- -->

					&nbsp;
					<!-- ------------------------------------添加------------------------------------ -->



				</td>
			</tr>
		</table>
		<table class="list">
			<tr>
				<th>
					选择
				</th>
				<th>
					供方名称
				</th>
				<th>
					地址
				</th>
				<th>
					联系电话
				</th>
				<th>
					备注
				</th>
			</tr>
			<!---------------------------LOOP START------------------------------>
			<!-- 列表数据栏 -->
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="supplierinfo">
					<tr>
						<td>
							<div align="center">
								<input type="radio" name="supplierinfoId"
									onclick="selectSupplierinfo('${supplierinfo.id}','${supplierinfo.supcname}','${supplierinfo.itemname}','${supplierinfo.itemtypename}')">
							</div>
						</td>
						<td>
							<div align="center">
								${supplierinfo.supcname}
							</div>
						</td>
						<td>
							<div align="center">
								${supplierinfo.address}
							</div>
						</td>
						<td>
							<div align="center">
								${supplierinfo.phone}

							</div>
						</td>
						<td>
							<div align="center">
								${supplierinfo.notes}
							</div>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<!----------------------LOOP END------------------------------->
		<!-- 在列表数据为空的时候，要显示的提示信息 -->
		<c:if test="${empty pm.datas}">
			<tr>
				<td colspan="7" align="center" bgcolor="#EFF3F7" class="TableBody1"
					onmou this.bgColor='#DEE7FF' ;onmo this.bgColor='#EFF3F7'">
					没有找到相应的记录
		</c:if>
		<!-- 在列表数据为空的时候，要显示的提示信息 -->

		<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
						<pg:param name="supplierinfo.supcname" />
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
							action="<%=request
							.getAttribute("javax.servlet.forward.servlet_path")
							.toString().substring(1)%>">

							<input type="hidden" name="supplierinfo.supcname"
								value="${supplierinfo.supcname }" />
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