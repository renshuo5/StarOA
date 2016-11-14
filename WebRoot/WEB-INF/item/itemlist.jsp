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
		<title>物料管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		 <script type="text/javascript" src="<%=basePath%>js/item.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="js/public.js">

	     
 </script>
	</head>

	<body>
	
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

					<form action="item/item/item_search" method="post">
						部品名：
						<input type="text" name="sitem.name"  class="itemname" />
						&nbsp;&nbsp; 部品描述：
						<input type="text" name="sitem.description" class="itemname"/>
						&nbsp;&nbsp;
						<input class="frm_btn" type="submit" value="查询" />
						<input class="frm_btn" type="button" onclick="openWin('<%=basePath%>item/item/item_addInput','addItemtype',800,600);return false" value="添加部品" />
						<br />
					</form>
					<!-- ------------------------------------添加------------------------------------ -->
					
				</TD>
			</TR>
		</table>


		<table class="title">
			<tr>
				<td>
					部品列表
				</td>
			</tr>
			</table>
			<table class="list">
			<tr>
				<th>
					部品编号
				</th>
				<th>
					部品名称
				</th>
				<th>
					部品类型
				</th>
				<th>
					部品描述
				</th>
				<th>
				备注
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
				<c:forEach items="${pm.datas }" var="item">
					<tr>
						<td>
							<div align="center">
								${item.id}
							</div>
						</td>
						<td>
							<div align="center">
								${item.name}
							</div>
						</td>
						<td>
							<div align="center">
								${item.itemcategory.name}
							</div>
						</td>
						<td>
							<div align="center">
								${item.description}
							</div>
						</td>
						<td>
							<div align="center">
								${item.notes}
							</div>
						</td>
						<td align="center">
							<a class="a03" href="#"
							onclick="openWin('<%=basePath%>item/item/item_editInput?itemid=${item.id}','addItemtype',800,600);return false"><img src="images/edit.gif" width="15" height="16" border="0"></a> 
						</td>
						<td align="center">
							<a href="#"
								onclick="del('<%=basePath%>item/item/item_del?itemid=${item.id}');return false">
								<img src="images/del.gif" width="15" height="16" border="0">
							</a>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			</table>
			<!----------------------LOOP END------------------------------->
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
						<pg:param name="sitem.name" />
						<pg:param name="sitem.description" />
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

							<input type="hidden" name="sitem.name" value="${sitem.name }" />
						<input type="hidden" name="sitem.description"
						value="${sitem.description}" />
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