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
		<title>外协件发货单审核列表</title>
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
				<TD style="text-align: right">

					<form action="warehouse/warehouse/warehouse_search" method="post">
						生协号：
						<input type="text" name="warehouse.warsn" />
						&nbsp;&nbsp; 产品名称：
						<input type="text" name="warehouse.itemType.item.name" />
						&nbsp;&nbsp;
						<input class="frm_btn" type="submit" value="查询" />
						<br />
					</form>

				</TD>
				<td style="text-align: right">
					<a href="warehouse/warehouse/warehouse_examineList"> <input
							type="button" name="SYS_SET" align="center" value="未审核"
							class="frm_btn" size=5> </input> </a>
				</td>
				<td style="text-align: right">
					<a href="sales/shipment/shippingnote1/shippingnote1_addInput">
						<input type="button" name="SYS_SET" align="center" value="添加 "
							class="frm_btn" size=5 />
				</td>
			</TR>
		</table>

		<table class="title">
			<tr>
				<td>
					外 协 件 发 货 单 审 核 列 表
				</td>
			</tr>
		</table>
		<table class="list">
			<tr>
				<th>
					序号
				</th>

				<th>
					收获单位
				</th>
				<th>

					接受单位
				</th>
				<th>
					日期
				</th>

				<th>
					状态
				</th>

				<th colspan="2">
					出荷报告单
				</th>



			</tr>
			<!---------------------------LOOP START------------------------------>


			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="shippingnote1" varStatus="vs">
					<c:forEach items="${shi1goods}" var="shi1good">
						<c:if
							test="${shi1good.shippingnote1.shi1id==shippingnote1.shi1id}">
							<tr>

								<td>

									<a
										href="sales/shipment/shippingnote1/shippingnote1_examineInput?Shippingnote1Id=${shippingnote1.shi1id}">
										${vs.count} 
								</td>
								<td>

									${shippingnote1.shi1send}

								</td>
								<td>


									${shippingnote1.shi1receive}


								</td>
								<td>

									${shippingnote1.shi1date}

								</td>
								<td>


									<c:if test="${ null != returned.signatory}"> 
										  已检验
										</c:if>
									<c:if test="${ null== returned.signatory}">
										<a href="#"
											onclick="openWin('<%=basePath%>warehouse/storescheduling/storescheduling_addInputWarehouse?warehouseId=${warehouse.war_id}','addStoschWarehouse',800,600);return false">
											待检验</a>
									</c:if>

								</td>

								<td>

									<a
										href="sales/shipment/shippingnote1/shippingnote1_taxboardInput?shi1goodId=${shi1good.shi1gid}">
										板卡${unqualified.unq_id} 
								</td>

								<td>
									<div align="center">
										<a
											href="sales/return/unqualified/unqualified_show?unqualifiedId=${unqualified.unq_id}">
											冷冲件${unqualified.unq_id} 
								</td>

							</tr>
						</c:if>
					</c:forEach>

				</c:forEach>
			</c:if>


		</table>

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