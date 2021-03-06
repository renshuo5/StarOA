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
		<title>显示要货计划单</title>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js">
</script>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js">
</script>
		<script type="text/javascript" src="js/addTableAlign.js">
</script>
		<script language="javascript" src="<%=basePath%>js/public.js">
</script>
	</head>

	<body>
			<table class="addTable">
				<tr>
					<td>
						编号
					</td>
					<td>
						<c:out value="${preparation.presn}"></c:out>
					</td>
				</tr>
				<tr>
					<td>
						编制单位
					</td>
					<td>
						<c:out value="${preparation.department.dptName}"></c:out>
					</td>
				</tr>
				<tr>
					<td>
						编制日期
					</td>
					<td>
						<fmt:formatDate pattern="yyyy年MM月dd日" value="${preparation.pdate}" />
					</td>
				</tr>
				<tr>
					<td>
						编制人
					</td>
					<td>
						<c:out value="${preparation.person.empName}"></c:out>
					</td>
				</tr>
				<tr>
					<td>
						报送日期
					</td>
					<td>
						<fmt:formatDate pattern="yyyy年MM月dd日" value="${preparation.sdate}" />
					</td>
				</tr>
			</table>

			<table class="addTable list" id="pergoods">
				<tr>
					<th>
						品名
					</th>
					<th>
						型号规格
					</th>
					<th>
						数量
					</th>
					<th>
						进仓时间
					</th>
					<th>
						备注
					</th>
				</tr>
				<c:forEach var="pergood" items="${pergoods}">
					<tr>
						<td>
							<c:out value="${pergood.itemType.item.name}"></c:out>
						</td>
						<td>
							<c:out value="${pergood.itemType.name}"></c:out>
						</td>
						<td>
							<c:out value="${pergood.preNum}"></c:out>
						</td>
						<td>
							<fmt:formatDate pattern="yyyy年MM月dd日" value="${pergood.eDate}" />
						</td>
						<td>
							<c:out value="${pergood.preNote}"></c:out>
						</td>
					</tr>
				</c:forEach>
			</table>
			<br />
			<br />
            <c:if test="${not empty accredition.content}">
			<table class="title editTable">
				<tr>
					<td>
						品工部审核
					</td>
				</tr>
			</table>
			<!-- 这里原来猜测可能是和 pergood表有关联的 来自动生成一条一条itemtype的对应到内容上 ，到时候需求有变动的话 ，可以采用字符串处理的办法  也可以改数据库字段 -->
			<table class="editTable">
				<tr>
					<td>
						<textarea id="content" rows="10" cols="80" readonly="readonly" ><c:out value="${accredition.content }"></c:out></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="100%">
						评审人：
						<input disabled="disabled" value="${accredition.employee.empName}" />
						评审日期：
						<fmt:formatDate pattern="yyyy年MM月dd日" value="${accredition.adate }"/>

					</td>
				</tr>
			</table>
			</c:if>
			<c:if test="${ not empty produceAccredition.content }">
			<table class="title editTable">
				<tr>
					<td>
						生产部审核
					</td>
				</tr>
			</table>
			<!-- 这里原来猜测可能是和 pergood表有关联的 来自动生成一条一条itemtype的对应到内容上 ，到时候需求有变动的话 ，可以采用字符串处理的办法  也可以改数据库字段 -->
			<table class="editTable">
				<tr>
					<td>
						<textarea id="produceContent" readonly="readonly" rows="10" cols="80"><c:out value="${produceAccredition.content }"></c:out></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="100%">
						评审人：
						<input disabled="disabled" value="${produceAccredition.employee.empName}" />
						评审日期：
						<fmt:formatDate pattern="yyyy年MM月dd日" value="${produceAccredition.adate}" />

					</td>
				</tr>
			</table>
			</c:if>
			<c:if test="${not empty preparation.fulfillment}">
			<table class="title editTable">
				<tr>
					<td>
						履行情况记录表
					</td>
				</tr>
			</table>
			<table class="editTable">
				<tr>
					<td>
						<textarea id="fulfill" readonly="readonly" rows="10" cols="80" name="preparation.fulfillment"><c:out value="${preparation.fulfillment}"></c:out></textarea>
					</td>
				</tr>
			</table>
			</c:if>
		     <c:if test="${not empty preparation.confimation}">
			<table class="title editTable">
				<tr>
					<td>
						变更或履行记录情况确认
					</td>
				</tr>
			</table>
			<table class="editTable">
				<tr>
					<td>
						<textarea id="confimation" rows="10" readonly="readonly" cols="80" name="preparation.confimation"><c:out value="${preparation.confimation}"></c:out></textarea>
					</td>
				</tr>
				
			</table>
			</c:if>
		<script type="text/javascript">
$(document).ready(function() {
	$("#content").attr("rows", "" + ($("#pergoods tr").length + 6));
	$("#produceContent").attr("rows", "" + ($("#pergoods tr").length + 6));
	$("#fulfill").attr("rows", "" + ($("#pergoods tr").length + 6));
	$("#confimation").attr("rows", "" + ($("#pergoods tr").length + 6));
});
</script>
	</body>
</html>
