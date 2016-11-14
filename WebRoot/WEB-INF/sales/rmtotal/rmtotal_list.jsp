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
		<title>退货统计列表</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		 <link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		 <script type="text/javascript" src="<%=basePath%>js/sales.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<table>
		<tr height="15">
			<td background="images/shadow_bg.jpg"></td>
		</tr>
	</table>

	<body>


		<%--查询--%>
		<table>
			<TR>
				<TD style="text-align: right">

					<form action="sales/return/rmtotal/rmtotal_search"
						method="post">
						规格型号：
						<input type="text" name="rmtotal.itemType.name"
							class="itemname" />
						&nbsp;&nbsp;
						<input class="frm_btn" type="submit" value="查询" />											

				
					<input type="button" name="SYS_SET" value="添加 " class="frm_btn"
						size=5
						onclick="openWin('<%=basePath%>sales/return/rmtotal/rmtotal_addInput','addrmtotal',800,600);return false" />
					</form>
				</TD>
			</TR>
		</table>

		<table class="title">
			<tr>
				<td>
					退 货 统 计 月 报 表
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
					部品代码
				</th>
				<th>
					退货数
				</th>
				<th>
					修复合格数
				</th>
				<th>
					报废数
				</th>
				<th>
					累计退货数
				</th>
				<th>
					本月送货数
				</th>
				<th>
					累计送货数
				</th>
				<th>
					本月不合格率
				</th>
				<th>
					累计不合格率
				</th>
				<th>
					修改
				</th>
				<th>
					删除
				</th>
			</tr>
			<!---------------------------LOOP START------------------------------>
			<!-- 列表数据栏 -->
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="rmtotal">
					<tr>
						<td>
							<div align="center">
								${rmtotal.itemType.item.name}
							</div>
						</td>
						<td>
							<div align="center">
								${rmtotal.itemType.name}
							</div>
						</td>
						<td>
							<div align="center">
								${rmtotal.itemType.mCode}
							</div>
						</td>
						<td>
							<div align="center">
								${rmtotal.rnum}
							</div>
						</td>
						<td>
							<div align="center">
								${rmtotal.repairnum}
							</div>
						</td>
						<td>
							<div align="center">
								${rmtotal.scrapnum}
							</div>
						</td>
						<td>
							<div align="center">
								${rmtotal.rtotal}
							</div>
						</td>
						<td>
							<div align="center">
								${rmtotal.msendnum}

							</div>
						</td>
						<td>
							<div align="center">
								${rmtotal.tsendnum}
							</div>
						</td>
						<td>
							<div align="center">
								${rmtotal.munqrate}
							</div>
						</td>
						<td>
							<div align="center">
								${rmtotal.tunqrate}
							</div>
						</td>
						<td align="center">

							<a href="#"
								onclick="openWin('sales/return/rmtotal/rmtotal_editInput?rmtotalId=${rmtotal.rmt_id}','editItemtype',800,600);return false">

								<img src="images/edit.gif" width="15" height="16" border="0">

							</a>

						</td>

						<td align="center">

							<a href="#"
								onclick="del('sales/return/rmtotal/rmtotal_del?rmtotalId=${rmtotal.rmt_id}');return false">
								<img src="images/del.gif" width="15" height="16" border="0">
							</a>


						</td>

					</tr>
				</c:forEach>
			</c:if>

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

		<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
						<pg:param name="rmtotal.itemType.name" />
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
							<input type="hidden" name="rmtotal.itemType.name"
								value="${rmtotal.itemType.name}" />							
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


