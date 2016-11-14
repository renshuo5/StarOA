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
		<title>要货单列表</title>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js">
</script>
			<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		 <script type="text/javascript" src="<%=basePath%>js/produce.js"></script>
</script>
		<script language="javascript" src="<%=basePath%>js/public.js">
</script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js">
</script>
		<script type="text/javascript" src="<%=basePath%>js/highLight.js">
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
		<!-- 查询 -->
		<table>
			<tr>
				<td height=14 style="text-align: left" noWrap>

					
				</td>
				
				<td align="right">
					
				</td>
			
			</tr>
		</table>

		<!-- 标题 -->
		<table class="title">
			<tr>
				<td>
					要货计划单
				</td>
			</tr>
		</table>

		<!-- 列表 -->
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
					报送日期
				</th>
				<th>
					编制单位领导审批
				</th>
				<th>
				添加生产计划单
				</th>
				
			</tr>
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="preparation">
					<tr>
						<td>
							<a href=""
								onclick="openWin('produce/preparation/preparation_show?preparation.id=${preparation.id}','显示要货计划单',800,600,'1');return false"><c:out
									value="${preparation.presn }"></c:out> </a>
						</td>
						<td>
							<c:out value="${preparation.department.dptName }"></c:out>
						</td>
						<td>
							<fmt:formatDate pattern='yyyy年MM月dd日'
								value='${preparation.pdate}' />
						</td>
						<td>
							<c:out value="${preparation.person.empName }"></c:out>
						</td>
						<td>
							<fmt:formatDate value="${preparation.sdate}"
								pattern="yyyy年MM月dd日" />
						</td>
						<td>
							<c:out value="${preparation.pleader.empName }"></c:out>
						</td>
						<td>
							<input type="button" class="frm_btn" value="添加生产计划单"
								onclick="openWin('<%=basePath%>produce/productionplan/productionplan_make_list?addplan=${preparation.id}','addItemtype',800,600,1)" >
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
						<pg:param name="preparation.presn" />
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

							<input type="hidden" name="preparation.presn"
								value="${preparation.presn }" />

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
