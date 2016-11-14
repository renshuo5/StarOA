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
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>发货通知单列表</title>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/sales.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script language="javascript" src="<%=basePath%>js/examineOnly.js"></script>
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

					<form action="sales/shipment/shinote2/shinote2_search"
						method="post">
						编号：
						<input type="text" name="shinote2.sn" class="itemname" />

						<input class="frm_btn" type="submit" value="查询" />




						<input type="button" name="SYS_SET" value="添加 " class="frm_btn"
							size=5
							onclick="openWin('<%=basePath%>sales/shipment/shinote2/shinote2_addInput','addshinote2',1000,600,'1');return false" />
					</form>
				</TD>

			</TR>
		</table>

		<table class="title">
			<tr>
				<td>
					发 货 通 知 单 列 表
				</td>
			</tr>
		</table>


		<table class="list">


			<tr>

				<th>
					编（批）号
				</th>

				<th>
					收货单位
				</th>
				<th>
					总件数
				</th>
				<th>
					日期
				</th>

				<th>
					备注
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
				<c:forEach items="${pm.datas }" var="shinote2">

					<tr>

						<td>
							<a href="#"
								onclick="openWin('sales/shipment/shinote2/shinote2_show?shinote2Id=${shinote2.shi2id}','showShinote',1000,800,1);return false">
								发货通知单${shinote2.sn} 
						</td>
						<td>

							${shinote2.recunit}

						</td>
						<td>


							${shinote2.totals}


						</td>
						<td>

							${shinote2.shi2date}

						</td>
						<td>

							${shinote2.shi2note}

						</td>
						<td class="examine">

							<c:if test="${null == shinote2.whmger}">
								<input name="status" type="hidden" value="${00}" />
							</c:if>

							<c:if test="${ null!= shinote2.whmger}">
								<input name="status" type="hidden" value="${11}" />
							</c:if>
							<a
								href="sales/shipment/shinote2/shinote2_examineInput?shinote2Id=${shinote2.shi2id}">
								待审核 </a>&rarr;
							<a> 已出库 </a>

						</td>

						<td align="center">


							<a href="#"
								onclick="openWin('sales/shipment/shinote2/shinote2_editInput?itemTypeId=${shi2good.itemType.id}&shinote2Id=${shinote2.shi2id}','updateShinote2',1000,600);return false">


								<img src="images/edit.gif" width="15" height="16" border="0">

							</a>

						</td>

						<td align="center">
							<a href="#"
								onclick="del('sales/shipment/shinote2/shinote2_del?shinote2Id=${shinote2.shi2id}');return false">
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
					<td colspan="6" align="center" bgcolor="#EFF3F7" class="TableBody1"
						onmouseover=this.bgColor
						= '#DEE7FF';
                       onmouseout=this.bgColor='#EFF3F7';
                       >
						没有找到相应的记录
					</td>
				</tr>
			</c:if>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
		</table>

		<!-----------------------------------分页--------------------------------------->


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
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>