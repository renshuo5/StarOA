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
		<title>产品进仓单</title>
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
		<script type="text/javascript" src="<%=basePath%>js/examineOnly.js"></script>
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

					<form action="warehouse/warehouse/warehouse_search" method="post">
						生协号：
						<input type="text" name="warehouse.warsn" class="itemname" />
						&nbsp;&nbsp; 规格型号：
						<input type="text" name="warehouse.itemType.name"
							class="itemname" />
						&nbsp;&nbsp;
						<input class="frm_btn" type="submit" value="查询" />
						<input type="button" name="SYS_SET" value="未审核"
							class="frm_btn" size=5
							onclick="javascript:self.location='<%=basePath%>warehouse/warehouse/warehouse_examineList'" />
						<input type="button" name="SYS_SET"  value="添加 "
							class="frm_btn" size=5
							onclick="openWin('<%=basePath%>warehouse/warehouse/warehouse_addInput','addWarehouse',800,600);return false" />

					</form>
				</td>
			</TR>
		</table>


		<table class="title">
			<tr>
				<td>
					产品进仓单
				</td>
			</tr>
		</table>
		<table class="list">
			<tr>
				<th>
					编号
				</th>
				<th>
					生协号
				</th>
				<th>
					产品名称
				</th>
				<th>
					型号规格
				</th>
				<th>
					进仓日期
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
			<!-- 列表数据栏 -->
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="warehouse">
					<tr>
						<td>
							<a
								href="warehouse/warehouse/warehouse_show?WarehouseId=${warehouse.war_id}">
								产品进仓单${warehouse.war_id}</a>
						</td>
						<td>


							${warehouse.warsn}
						</td>
						<td>
							${warehouse.itemType.item.name}
						</td>
						<td>
							${warehouse.itemType.name}
						</td>
						<td>
							${warehouse.warehouseDate }
						</td>
						
								  <c:if test="${null==warehouse.whmg}">
								 <td class="examine">
								
							<input name="status" type="hidden" value="${0}" />
							<a href="#"
									onclick="openWin('<%=basePath%>warehouse/storescheduling/storescheduling_addInputWarehouse?warehouseId=${warehouse.war_id}','addStoschWarehouse',800,600);return false">
									待审核</a>
							</td>
							</c:if>
							 <c:if test="${null!=warehouse.whmg}">
							 <td>
								已入库
									</td>
							 </c:if>
							<c:if test="${null==warehouse.whmg}">
						<td>

							<a href="#"
								onclick="openWin('<%=basePath%>warehouse/warehouse/warehouse_editInput?warehouseId=${warehouse.war_id}','editResource',800,600);return false">

								<img src="images/edit.gif" width="15" height="16" border="0">

							</a>

						</td>

						<td>
							<a href="#"
								onclick="del('<%=basePath%>warehouse/warehouse/warehouse_del?warehouseId=${warehouse.war_id}');return false">
								<img src="images/del.gif" width="15" height="16" border="0">
							</a>


						</td>
					</c:if>

					<c:if test="${null!=warehouse.whmg}">
						<td>
								<img src="images/edit.gif" width="15" height="16" border="0">

						</td>

						<td>
								<img src="images/del.gif" width="15" height="16" border="0">

						</td>
					</c:if>
					</tr>
				</c:forEach>
			</c:if>
			<!----------------------LOOP END------------------------------->
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="8" align="center" bgcolor="#EFF3F7" class="TableBody1"
						onmouseover=this.bgColor = '#DEE7FF';
onmouseout=this.bgColor= '#EFF3F7';
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
						<pg:param name="warehouse.warsn" />
						<pg:param name="warehouse.itemType.name" />
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

							<input type="hidden" name="warehouse.warsn"
								value="${warehouse.warsn}" />

							<input type="hidden" name="warehouse.itemType.name"
								value="${warehouse.itemType.name}" />
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
