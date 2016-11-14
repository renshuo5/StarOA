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
		<title>业务管理</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/produce.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/examineOnly.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="js/public.js">
			
		<script language="javascript" src="js/FoshanRen.js"> </script>
		<script language="JavaScript">
	//到指定的分页页面
	function topage(page) {
		var form = document.forms[0];
		form.page.value = page;
		form.submit();

		
	}
</script>

		<style type="text/css">
img.edit {
	cursor: hand;
}

img.delete {
	cursor: hand;
}

a.examineGray {
	text-decoration: none;
	cursor: default;
	background: repeat-x;
	background-image: url(<%=basePath%>images/examine_bg_gray.jpg);
}
</style>

	</head>

	<body>


		<table>
			<tbody>
				<tr height="15">
					<td background="images/shadow_bg.jpg"></td>
				</tr>
			</tbody>
		</table>
		<%--查询--%>
		<table>
			<TR>
				<TD height=14 align="right" noWrap>
					<!-- 在这里插入查询表单 -->
				</TD>
				<TD height=14 style="text-align: right" noWrap>

					<form action="produce/produceschdul/produceschdul_search"
						method="post">
						原打印机型：
						<input type="text" name="productionSchdul.itemType.name" id="form"
							class="itemname" />
						&nbsp;&nbsp;
						<input class="frm_btn" type="submit" value="查询" />
						<input type="button" name="SYS_SET" align="center" value="添加 "
							class="frm_btn" size=5
							onclick="openWin('<%=basePath%>produce/produceschdul/produceschdul_addInput','添加改机',800,600,1);return false" />
						</input>
						<br />
					</form>
				</TD>
			</TR>
		</table>


		<table class="title">

			<td>
				改机通知单
			</td>
		</table>

		<table class="list">


			<tr>
				<th>系号
				</th>

				<th>原打印机型
					
				</th>
				<th width="10%" bgcolor="#266cc1">
					<div align="center">
						借出数量
					</div>
				</th>

				<th width="13%" nowrap bgcolor="#266cc1">
					<div align="center">
						下达日期
					</div>
				</th>

				<th width="15%" nowrap bgcolor="#266cc1">
					<div align="center">
						<font color="#FFFFFF">备注</font>
					</div>
				</th>
				<th width="22%" nowrap bgcolor="#266cc1">
					<div align="center">
						<font color="#FFFFFF">状态</font>
					</div>
				</th>
				<th width="5%" nowrap bgcolor="#266cc1">
					<div align="center">
						<font color="#FFFFFF">编辑</font>
					</div>
				</th>

				<th width="5%" nowrap bgcolor="#266cc1">
					<div align="center">
						<font color="#FFFFFF">删除</font>
					</div>
				</th>
			</tr>
			<!---------------------------LOOP START------------------------------>



			<!----------------------LOOP END------------------------------->

			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="productionSchdul">
					<c:if
						test="${!(productionSchdul.wssign.empId!=null&&productionSchdul.exsign.empId==null&&productionSchdul.whsign.empId==null&&
								  productionSchdul.menumake.empId!=null)}">
						<tr>

							<td>
								<div align="center">
									<a
										href="produce/produceschdul/produceschdul_show?productionSchdulid=${productionSchdul.id}">改机通知单
										${productionSchdul.id} </a>
								</div>
							</td>
							<td>
								<div align="center">
									${productionSchdul.itemType.name}
								</div>
							</td>
							<td>
								<div align="center">
									${productionSchdul.bno}
								</div>
							</td>
							<td>
								<div align="center">
									${productionSchdul.startdate}
								</div>
							</td>
							<td>
								<div align="center">
									${productionSchdul.channote}

								</div>
							</td>
										
							<td class="examine">
								<c:if
									test="${productionSchdul.menumake.empId!=null&&productionSchdul.exsign.empId==null&&productionSchdul.wssign.empId==null&&productionSchdul.whsign.empId==null}">
									<input type="hidden" name="status" value="000" />
								</c:if>
								<c:if
									test="${(productionSchdul.menumake.empId!=null)&&(productionSchdul.wssign.empId!=null)&&(productionSchdul.whsign.empId!=null)&&(productionSchdul.exsign.empId==null)}">
									<input type="hidden" name="status" value="110" />
								</c:if>

								<c:if
									test="${productionSchdul.menumake.empId!=null&&productionSchdul.exsign.empId!=null&&productionSchdul.wssign.empId!=null&&productionSchdul.whsign.empId!=null}">
									<input type="hidden" name="status" value="111" />
								</c:if>
								
								<a
									href="produce/produceschdul/produceschdul_examine_wait?productionSchdulid=${productionSchdul.id}"><span>车间</span>
								</a>&rarr;
								<a
									href="#"><span>仓库
								</span> </a>&rarr;
								<a href="produce/produceschdul/produceschdul_examine_change?productionSchdulid=${productionSchdul.id}"><span>品工部检验</span>
								</a>
							</td>

							<td align="center">
                               <c:if test="${productionSchdul.wssign!=null}">
                             				<img src="images/edit.gif" width="15" height="16" border="0">

                               </c:if>
                               <c:if test="${productionSchdul.wssign==null}">
								<a href="#"
									onclick="openWin('<%=basePath %>produce/produceschdul/produceschdul_editInput?productionSchdulid=${productionSchdul.id}','editItemtype',800,600,1);return false">

									<img src="images/edit.gif" width="15" height="16" border="0">

								</a>
								</c:if>

							</td>

							<td align="center">

								<a href="#"
									onclick="del('<%=basePath %>produce/produceschdul/produceschdul_del?productionSchdulid=${productionSchdul.id}');return false">
									<img src="images/del.gif" width="15" height="16" border="0">
								</a>


							</td>

						</tr>
					</c:if>
				</c:forEach>
			</c:if>
			<!----------------------LOOP END------------------------------->
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="8" align="center" bgcolor="#EFF3F7"
						onmouseover=this.bgColor = '#DEE7FF';
onmouseout=this.bgColor='#EFF3F7';
;>

						没有找到相应的记录
					</td>
				</tr>
			</c:if>

		</table>
		<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
						<pg:param name="productionSchdul.itemType.name" />
						<%--<pg:param name="productionSchdul.itemType2.name" />
						--%><pg:first>
							<a href="${pageUrl}" id="firstpageurl">首页</a>
						</pg:first>
						<pg:prev>
							<a href="${pageUrl }"><</a>
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
							<a href="${pageUrl }">></a>
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

							<input type="hidden" name="productionSchdul.itemType.name"
								value="${productionSchdul.itemType.name }" />

							<%--<input type="hidden" name="productionSchdul.itemType2.name"
								value="${productionSchdul.itemType2.name}" />
							--%><select name="pagesize" onchange="this.form.submit()"
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