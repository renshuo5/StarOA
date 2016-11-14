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
	String partnumber=request.getParameter("partnumber");
	//String isSelectItemType = request.getParameter("isSelectItemType");
	//System.out.println("isSelectItemType is --------------------------"+isSelectItemType);
%>

<html>
	<head>
		<base href="<%=basePath%>">
		<title>选择物料</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/vip.css" type="text/css">
<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script><link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script language="javascript" src="js/public.js"></SCRIPT>
		<script type="text/javascript">

	function selectItem(id, name) {
		if (window.opener) {
			var itemid = $("#itemIdId",window.opener.document);
			var itemname = $("#itemNameId",window.opener.document);
			if(itemname) itemname.val(name);
			if(itemid) itemid.val(id);
			if (!window.ActiveXObject)
			{
				itemid.change();
				itemname.change();
			}
			window.close();
		}
	}
</script>

	</head>

	<body >

		<table >
			<tbody>
				<tr height="20">
					<td background="images/title_bg1.jpg">
						&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td height="1" bgcolor="#b1ceef"></td>
				</tr>
				<tr height="15">
					<td background="images/shadow_bg.jpg"></td>
				</tr>
			</tbody>
		</table>

		<%--查询--%>
		<table >
			<TR>
				<TD height=14 align=right noWrap>
					<!-- 在这里插入查询表单 -->
				</TD>
				<TD height=14 align="left" noWrap>
					
									<form action="item/item/item_selectSearch?partnumber=${partnumber}" method="post">
										部品名：
										<input type="text" name="sitem.name" class="itemname"/>
										&nbsp;&nbsp; 部品描述：
										<input type="text" name="sitem.description" class="itemname"/>
										&nbsp;&nbsp;
										<input class="frm_btn" type="submit" value="查询" />
										<br />
									</form>
				</TD>
			</TR>
		</table>
<table class="title">
<td>
选择部品
</td>
</table>

		<table class="list">
			
			<tr>
						<th >
					
					<%--<s:if test="${params.isSelectItemType==1}">
						<font color="#FFFFFF">型号</font>
					</s:if>
					<s:else>
						<font color="#FFFFFF">选择</font>
					</s:else>
					--%><c:choose>
						<c:when test="${isSelectItemType==1}">
						型号
						</c:when>
						<c:otherwise>
						选择
						</c:otherwise>
					</c:choose>
					
						</th>
						<th>
						
							部品编号
						
						</th>
						<th>
							
							部品名
						
						</th>
						<th width="15%" nowrap >
							<div align="center">
							部品类型
							</div>
						</th>
						<th width="25%">
							<div align="center">
							物料描述
							</div>
						</th>
						<th width="20%" nowrap >
							<div align="center">
							备注
							</div>
						</th>
					


					</tr>
					
			<!---------------------------LOOP START------------------------------>
			<!-- 列表数据栏 -->
			
			
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="item">
					<form id="item${item.id}" action="item/itemtype/itemtype_selectInput?partnumber=<%=partnumber%>" method="post">
						<input type="hidden" name="sitemid" value="${item.id}"/>
						<tr>

						<td >
							<div align="center">
							<c:choose>
								<c:when test="${isSelectItemType==1}">
									<input class="frm_btn" type="submit" name="itemid" value="选择"/>
								</c:when>
								<c:otherwise>
									<input type="radio" name="itemid"
									onclick="selectItem('${item.id}','${item.name}')">
								</c:otherwise>
							</c:choose>
							<%--<%
								if("1".equals(isSelectItemType))
								{
							%>
									<input class="frm_btn" type="submit" name="itemid" value="选择"/>
							<%
								}
								else
								{
							%>
									<input type="radio" name="itemid"
								onclick="selectItem('${item.id}','${item.name}')">
							<%
								}
							%>
							--%>
							</div>
						</td>

						<td>
									
								${item.id}
									
								</td>
								<td >
										${item.name}
									
								</td>
								<td >
									
									${item.itemcategory.name}

									
								</td>
								<td >
									
									${item.description}

									
								</td>
								<td>
										${item.notes}
									
								</td>
					</tr>
					</form>
				</c:forEach>
			</c:if>
			<!----------------------LOOP END------------------------------->
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="7" align="center" bgcolor="#EFF3F7"
							class="TableBody1" onmouseover="this.bgColor= '#DEE7FF'"
							onmouseout="this.bgColor='#EFF3F7'">
							没有找到相应的记录
						</td>
				</tr>
			</c:if>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
</table>
		
											<!-- 分页导航条 开始-->
										<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
										<tr height=28px valign="middle">
											<th align=right noWrap>
														<pg:pager
															url='<%=request.getAttribute(
						"javax.servlet.forward.servlet_path").toString()
						.substring(1)%>'
															items="${pm.total}" maxPageItems="${pagesize}"
															export="currentPageNumber=pageNumber">
															<pg:param name="sitem.name" />
															<pg:param name="sitem.description" />
															<pg:param name="partnumber"/>
															<pg:param name="isSelectItemType"/>
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

																<input type="hidden" name="sitem.name"
																	value="${sitem.name }" />
																<input type="hidden" name="isSelectItemType"
																	value="${isSelectItemType }" />
																<input type="hidden" name="partnumber" value="${partnumber}" />
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
													<!-- 更改pagesize 结束-->
												</tr>
											</TABLE>
											<!-- 分页导航条 结束-->
<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>