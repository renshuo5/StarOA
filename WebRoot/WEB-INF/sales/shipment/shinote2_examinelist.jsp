<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
	<head>
		<base href="<%=basePath%>">
		<title>业务管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<script language="JavaScript">
		
	//到指定的分页页面
	function topage(page){
		var form = document.forms[0];
		form.page.value=page;
		form.submit();
	}

</script>
		<SCRIPT language=JavaScript src="/js/FoshanRen.js"></SCRIPT>
	</head>

	<body>


		<table class="title">
			<tr>
				<td>
					发 货 通 知 单 列 表
				</td>
			</tr>
			</table>
			<table class="list">
			<tr>
				<td>编（批）号
				</td>

				<td>收获单位
				</td>
				<td>数量
				</td>
				<td>日期
				</td>

				<td>备注
				</td>
				<td>状态
				</td>
			</tr>
			<!---------------------------LOOP START------------------------------>
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="shinote2">
					<tr>
						<td bgcolor="f5f5f5">
							<div align="center">
								<a
									href="sales/shipment/shinote2/shinote2_examineInput?shinote2Id=${shinote2.shi2id}">
									${shinote2.sn}
							</div>
						</td>
						<td bgcolor="f5f5f5">
							<div align="center">
								${shinote2.recunit}
							</div>
						</td>
						<c:forEach items="${shi2goods}" var="shi2good">
							<c:if test="${shi2good.shinote2.shi2id==shinote2.shi2id}">
								<td bgcolor="f5f5f5">
									<div align="center">
										${shi2good.shi2no}
									</div>
								</td>
								<td bgcolor="f5f5f5">
									<div align="center">
										${shinote2.shi2date}
									</div>
								</td>
								<td bgcolor="f5f5f5">
									<div align="center">
										${shi2good.shi2note}
									</div>
								</td>
							</c:if>
						</c:forEach>
						<td bgcolor="f5f5f5" align="center">
							<div align="center">
								<c:if
									test="${ null!= shinote2.schper && null!= shinote2.storageper && null!= shinote2.whmger && null!= shinote2.delper && null!= shinote2.mtab}"> 
										  已入库
										</c:if>
								<c:if
									test="${ null == shinote2.schper && null == shinote2.storageper && null == shinote2.whmger && null == shinote2.delper && null == shinote2.mtab}"> 
										 待审核
										</c:if>
							</div>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<!----------------------LOOP END------------------------------->




			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="6" align="center" bgcolor="#EFF3F7" class="TableBody1"
						onmouseover="this.bgColor= '#DEE7FF'"
						onmouseout="
	this.bgColor = "#EFF3F7">

						没有找到相应的记录
					</td>
				</tr>
			</c:if>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->



			<tr>
				<td bgcolor="f5f5f5" colspan="6" align="center">
					<table width="100%" border="0" cellspacing="1" cellpadding="3">
						<tr>
							<td width="15%"></td>
							<td width="85%">



								<TABLE width="778" border=0 align=center cellPadding=0
									cellSpacing=0 borderColor=#ffffff style="FONT-SIZE: 10pt">
									<TR height=28px valign="middle">
										<TD align=right noWrap background=images/list_middle.jpg>
											<!-- 分页导航条 开始-->
											<TABLE border=0 align=center cellPadding=0 cellSpacing=0>
												<TR height=28px valign="middle">
													<TD align=right noWrap background=images/list_middle.jpg>
														&nbsp;&nbsp;
														<pg:pager
															url="<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>"
															items="${pm.total}" maxPageItems="${pagesize}"
															export="currentPageNumber=pageNumber">
															<pg:param name="shinote2.sn" />

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
													</td>
													<!-- 更改pagesize 开始-->
													<td align=left valign="middle" noWrap width="10%"
														background=images/list_middle.jpg>
														<div
															style="height: 20px; overflow: hidden; valign: middle">
															<form
																action="<%=request.getAttribute(
						"javax.servlet.forward.servlet_path").toString()
						.substring(1)%>">

																<!--<input type="hidden" name="itemtype.name"
												value="${warehouse.warsn }" />
										
											-->
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
													</TD>
													<!-- 更改pagesize 结束-->
												</TR>
											</TABLE>
											<!-- 分页导航条 结束-->
										</TD>
									</TR>
								</TABLE>



							</td>



						</tr>
					</table>
				</td>
			</tr>

		</table>



	</body>
</html>