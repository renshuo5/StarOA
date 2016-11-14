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
<html>
	<head>
		<base href="<%=basePath%>">
		<title>规格型号</title>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="<%=basePath %>css/vip.css" type="text/css"/>
		<link rel="stylesheet" href="<%=basePath %>css/box_onfocus.css" type="text/css"/>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/item.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="js/public.js"></script>
	</head>

	<body >
		<table>
			<tbody>
				<tr height="20">
					<td background="images/title_bg1.jpg">
						
					</td>
				</tr>
		</table>
		<%--查询--%>
		<table>
			<TR>
				<TD style="text-align:right">
					<form action="item/itemtype/itemtype_search" method="post">
						规格型号：
						<input type="text" name="itemType.name" class="itemname"/>
						&nbsp;&nbsp; 简介：
						<input type="text" name="itemType.description" class="itemname"/>
						&nbsp;&nbsp;
						<input class="frm_btn" type="submit" value="查询" />
						<input class="frm_btn" onclick="openWin('<%=basePath%>item/itemtype/itemtype_addInput','addItemtype',800,600);return false" type="button" value="添加规格型号" />
						<br />
					</form>
				</TD>
			</TR>
		</table>
<table class="title">
			<tr>
				<td>
					型号规格列表
				</td>
			</tr>
			</table>
		<table class="list">
			<tr>
				<th width="10%">
					
						品名规格编号
					
				</th>
				<th width="10%" >
					
						部品
					
				</th>
				<th width="10%"  >
					
					规格型号
					
				</th>
				<th width="10%" >
					材料代码
				</th>
				<th width="8%" >
					是否保税
				
				</th>
				<th width="10%"  >
					保税号
					
				</th>
				<th width="15%"  >
					简介
				</th>
				<th width="17%" >
					备注
				</th>
				<th width="5%" >
					编辑
				</th>

				<th width="5%" >
					删除
				</th>


			</tr>
			<!---------------------------LOOP START------------------------------>
			<!-- 列表数据栏 -->
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="itemtype">
					<tr>
						<td >
							<div align="center">
								
								
								
							${itemtype.id}
							</div>
						</td>
						<td >
							<div align="center">
							<a href="#"
								onclick="openWin('item/itemtype/itemtype_show?itemtypeid=${itemtype.id}','showItemtype',800,600,1);return false">
							${itemtype.item.name}</a>
								
							</div>
						</td>
						<td>
							<div align="center">
								${itemtype.name}
							</div>
						</td>
						<td>
							<div align="center">
								${itemtype.mCode}
							</div>
						</td>
						<td>
							<div align="center">
								<c:choose>
									<c:when test="${itemtype.isbonded==1}">是</c:when>
									<c:otherwise>否</c:otherwise>
								</c:choose>
							</div>
						</td>
						<td>
							<div align="center">
								${itemtype.bondedNo}
							</div>
						</td>
						<td >
							<div align="center">
								${itemtype.description}

							</div>
						</td>
						<td >
							<div align="center">
								${itemtype.notes}
							</div>
						</td>
						<td align="center">

							<a href="#"
								onclick="openWin('item/itemtype/itemtype_editInput?itemtypeid=${itemtype.id}&sitemid=${itemtype.item.id }','editItemtype',800,600);return false">

								<img src="images/edit.gif" width="15" height="16" border="0">

							</a>

						</td>

						<td align="center">

							<a href="#"
								onclick="del('item/itemtype/itemtype_del?itemtypeid=${itemtype.id}');return false">
								<img src="images/del.gif" width="15" height="16" border="0">
							</a>


						</td>

					</tr>
				</c:forEach>
			</c:if>
			<!----------------------LOOP END------------------------------->
</table>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<table>
					<tr>
					<td>
						没有找到相应的记录
					</td>
				</tr>
				</table>
			</c:if>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
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