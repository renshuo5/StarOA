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
		<title>备品备料</title>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		 <script type="text/javascript" src="<%=basePath%>js/purchase.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
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

					<form action="purchase/spare/spare_search" method="post">
						供应商：
						<input type="text" name="spare.quaprolist.supplierinfo.supcname" class="itemname"/>
						<input class="frm_btn" type="submit" value="查询" />
						<input type="button" name="SYS_SET" align="center" value="添加 "
							class="frm_btn" size=5
							onclick="openWin('<%=basePath%>purchase/spare/spare_addInput','addspare',800,600);return false" />

					</form>
				</TD>
			</TR>
		</table>
		<table class="title">
			<tr>
				<td>
					备品备料
				</td>
			</tr>
		</table>
		<table class="list">
			<tr>
				<th>
					供应商
				</th>
				<th>
					品名
				</th>
				<th>
					规格型号
				</th>
				<th>
					单位
				</th>
				<th>
					数量
				</th>
				<th>
					单价
				</th>
				<th>
					总额（元）
				</th>
				<th>
					联系人
				</th>
				<th>
					联系方式
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
				<c:forEach items="${pm.datas}" var="spare">
					<tr>
						<td>
							${spare.quaprolist.supplierinfo.supcname}
						</td>
						<td>
							${spare.quaprolist.supplierinfo.itemname}
						</td>
						<td>
							${spare.quaprolist.supplierinfo.itemtypename}
						</td>
						<td>
							${spare.unit}
						</td>
						<td>
							${spare.num}
						</td>
						<td>
							${spare.uprice}
						</td>
						<td>
							<fmt:formatNumber value="${spare.uprice*spare.num}"
								pattern="#,##0.00#" />
						</td>
						<td>
							${spare.quaprolist.supplierinfo.business}
						</td>
						<td>
							${spare.quaprolist.supplierinfo.phone}
						</td>
						<td align="center">
							<a href="#"
								onclick="openWin('<%=basePath%>purchase/spare/spare_editInput?spareId=${spare.id}','addspare',800,600);return false">
								<img src="images/edit.gif" width="15" height="16" border="0">
							</a>
						</td>
						<td>
							<a href="#"
								onclick="del('purchase/spare/spare_del?spareId=${spare.id}');return false">
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
					<td colspan="11" align="center" bgcolor="#EFF3F7"
						class="TableBody1" onMouseOver=
	this.bgColor = "#DEE7FF" onmouseout=this.bgColor = "#EFF3F7">
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
						<pg:param name="spare.quaprolist.supplierinfo.supcname" />
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
					<div style="height: 28px; overflow: hidden; valign: middle">
						<form
							action="<%=request
							.getAttribute("javax.servlet.forward.servlet_path")
							.toString().substring(1)%>">

							<input type="hidden"
								name="spare.quaprolist.supplierinfo.supcname"
								value="${spare.quaprolist.supplierinfo.supcname}" />

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
