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
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<title>领导审批列表</title>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css"
			type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js">
</script>
		<script language="javascript" src="<%=basePath%>js/public.js">
</script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js">
</script>
		<script type="text/javascript" src="<%=basePath%>js/highLight.js">
</script>
		<script type="text/javascript" src="<%=basePath %>js/examineOnly.js">
</script>
<script type="text/javascript" src="<%=basePath %>js/showTips.js">
</script>

		<style type="text/css">
img.edit {
	cursor: hand;
}

img.delete {
	cursor: hand;
}


</style>
	</head>

	<body>
		<table class="title">
			<tr>
				<td>
					审核列表
				</td>
			</tr>
		</table>

		<table class="list">
			<tr>
				<th>
					编制号
				</th>
				<th>
					编制单位
				</th>
				<th>
					编制日期
				</th>
				<th>
					编制人
				</th>
				<th>
					审核状态
				</th>
				<th>
					报送日期
				</th>
				<th>
					编辑
				</th>
				<th>
					删除
				</th>
			</tr>
			
			<c:if test="${!empty pm.datas}">
			
				<c:forEach items="${pm.datas }" var="preparation" varStatus="vs">
				
					<tr>
					
						<td>
							<a href="" onclick="openWin('produce/preparation/preparation_showOutOrder?preparation.id=${preparation.id}','要货单信息',800,600,'1');return false"><c:out
									value="${preparation.presn}"></c:out> </a>
						</td>
						<td>
							<c:out value="${preparation.department.dptName}"></c:out>
						</td>
						<td>
							<fmt:formatDate pattern='yyyy年MM月dd日' value='${preparation.pdate}' />
						</td>
						<td>
							<c:out value="${preparation.person.empName}"></c:out>
						</td>
						<td class="examine">
							<input name="status" id="as" type="hidden" value="${status[vs.index] }" />
							<a 
								href="produce/preparation/preparation_examineInput?preparation.id=${preparation.id}"><span>领导审</span>
							</a>&rarr;
							<a href="produce/preparation/preparation_pingongExamineInput?preparation.id=${preparation.id}"><span>品工部审</span>
							</a>&rarr;
							<a href="produce/preparation/preparation_produceExamineInput?preparation.id=${preparation.id}"><span>生产部审</span>
							</a>
						</td>
						<td>
							<fmt:formatDate value="${preparation.sdate}" pattern="yyyy年MM月dd日" /> 
						</td>
						<td>
							<c:if test="${empty preparation.pleader}">
								<img src="images/edit.gif" class="edit"
									onclick="openWin('<%=basePath %>produce/preparation/preparation_editInput?preparation.id=${preparation.id}','addItemtype',800,600)" />
							</c:if>
							<c:if test="${!empty preparation.pleader}">
								已审不可修改
							</c:if>
						</td>
						<td>
							<img src="images/del.png" class="delete"
								onclick="del('<%=basePath %>produce/preparation/preparation_del?preparation.id=${preparation.id}')" />
						</td>
						
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="100%">
						没有找到相应的记录
					</td>
				</tr>
			</c:if>
		</table>

		<!-- 分页 -->


		<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">

						<!-- 用于查询传参 -->
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
					<div style="height: 26px; overflow: hidden; valign: middle">
						<form
							action="<%=request
					.getAttribute("javax.servlet.forward.servlet_path")
					.toString().substring(1)%>">

							<select name="pagesize" onchange="this.form.submit()"
								style="height: 20px; overflow: hidden; valign: middle">
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
