



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
		<title>已发信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
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

		<table>
			<tr>
				<td style="text-align: right">
					<form action="persons/Rasmessage/rasmessage_sendedSearch"
						method="post">
						接收人:
						<input type="text" name="rasmessage.rper.employee.empName" size="4"
							value="${rasmessage.rper.employee.empName}" class="itemname" />
						&nbsp;&nbsp; 消息标题:
						<input type="text" name="rasmessage.title" size="4"
							value="${rasmessage.title}" class="itemname" />
						&nbsp;
						<input class="frm_btn" type="submit" value="模糊查询" />
					</form>
				</td>
			</tr>
		</table>
		<table class="title">
			<tr>
				<td>
					已发信息
				</td>
			</tr>
		</table>
		<table class="list">
			<tr>

				<th>
					接收人
				</th>

				<th>
					消息标题
				</th>
				<th>
					消息内容
				</th>
				<th>
					附件名
				</th>
				<th>
					发送时间
				</th>
				<th>
					删除
				</th>
			</tr>
			<!---------------------------LOOP START------------------------------>
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas}" var="rasmessage">
					<tr>

						<td align="center">
							<c:out value="${rasmessage.rper.employee.empName}" />
						</td>
						<td align="center">
							<c:out value="${rasmessage.title}" />
						</td>
						<td align="center">
							<c:out value="${rasmessage.content}" />
						</td>
						<td align="center">
							<c:choose>

								<c:when test="${rasmessage.fla1 eq '0'}">
									<div align="center">
										没有附件
									</div>
								</c:when>
								<c:otherwise>
									<div align="center">
										<a href="${rasmessage.accessories}">${rasmessage.fla1}</a>
									</div>
								</c:otherwise>
							</c:choose>
						</td>
						<td align="center">
							<fmt:formatDate value="${rasmessage.rastime}"
								pattern="yyyy-MM-dd" />
						</td>
						<td align="center">
							<a href="#"
								onclick="del('<%=basePath%>persons/Rasmessage/rasmessage_sendedDel?rasmessageId=${rasmessage.id}');return false"><img
									src="images/del.gif" width="15" height="16" border="0"> </a>
						</td>

					</tr>
				</c:forEach>
			</c:if>
			<!----------------------LOOP END------------------------------->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="11" align="center" bgcolor="#EFF3F7"
						class="TableBody1" onMouseOver=
	this.bgColor = '#DEE7FF';
onmouseout=
	th
	is.bgColor = '#EFF3F7'
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
						<pg:param name="rasmessage.sper.employee.empName" />
						<pg:param name="rasmessage.title" />
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

							<input type="hidden" name="rasmessage.rper.employee.empName"
								value="${rasmessage.rper.name}" />
							<input type="hidden" name="rasmessage.title"
								value="${rasmessage.title}" />
							<select name="pagesize" onChange="this.form.submit()"
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
                                                               		<br>
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>