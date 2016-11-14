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
		<title>维修品管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
	<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/produce.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></SCRIPT>
	</head>
	<body >


		<%--查询--%>
		<table>
			<TR>

				<TD height=14 align="right" >

					<form action="produce/repairproduction/repairproduction_search" method="post">
						设备名：
						<input type="text" name="repairproduction.itemTypeName" class="itemname"/>
						
					<input class="frm_btn" type="submit" value="查询" />
				</form>
				</TD>
				<td height=14 align="left"> 
				<input type="button" value="添加" onClick="openWin('<%=basePath%>produce/repairproduction/repairproduction_addInput','登记维修品',800,600,1)" class="frm_btn" >
				</td>
			</TR>
		</table>

				<table class="title">
				<tr>
					<td colspan="6" align="right" background="../images/title_bg2.jpg" bgcolor="#266cc1">
                   维修品
					</td>
				</tr>
				</table>
				<table class="list">
				<tr>
					<th >设备名</th>						
                    <th>数量</th>
                    <th >接收日期</th>
					<th >修复状况</th>
					<th >编辑</th>
					<th  >删除</th>
				</tr>
				<!---------------------------LOOP START------------------------------>
			 	
			<!-- 列表数据栏 -->
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="repairproduction">
					<tr>
					
						<td>
							<div align="center">
								${repairproduction.itemTypeName}
							</div>
						</td>
						<td>
							<div align="center">
								${repairproduction.pno}
							</div>
						</td>
						<td>
							<div align="center">
								${repairproduction.recDate}

							</div>
						</td>
						<td>
							<div align="center">
								${repairproduction.repstatus}

							</div>
						</td>
						<td align="center">

						
							<a class="a03" href="#"
							onclick="openWin('produce/repairproduction/repairproduction_editInput?repairproductionId=${repairproduction.id}','修改',800,600,1);return false">
							<img src="<%=basePath %>images/edit.gif" width="15" height="16" border="0"></a> 

						</td>

						<td align="center">

							<a href="#"
								onclick="del('produce/repairproduction/repairproduction_del?repairproductionId=${repairproduction.id}');return false">
								<img src="<%=basePath %>images/del.gif" width="15" height="16" border="0">
							</a>


						</td>

					</tr>
				</c:forEach>
			</c:if>
			</table>
			<!----------------------LOOP END------------------------------->
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
						<pg:param name="repairproduction.itemTypeName" />
						
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

							<input type="hidden" name="repairproduction.itemTypeName" value="${repairproduction.itemTypeName}" />
					<!-- <input type="hidden" name="repairproduction.pno"
						value="${repairproduction.pno}" />-->
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
