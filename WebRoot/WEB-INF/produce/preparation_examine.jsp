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
		<title>领导审批</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js">
</script>
<script type="text/javascript" src="js/addTableAlign.js"></script>
<script type="text/javascript" src="js/oddEvenColor.js"></script>
<script type="text/javascript" src="js/highLight.js"></script>
<script type="text/javascript" src="js/textRightLeft.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js">
</script>
	</head>

	<body>
		<form action="produce/preparation/preparation_examine" method="post">
			<table class="addTable">
				<tr>
					<td>
						编号
					</td>
					<td>
						<input type="hidden" name="preparation.id" value="${preparation.id }" />
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
						
						<fmt:formatDate pattern='yyyy年MM月dd日' value='${preparation.pdate}' />
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
						
						<fmt:formatDate pattern="yyyy年MM月dd日" value="${preparation.sdate}"/>
					</td>
				</tr>
			</table>

			<table class="list editTable">
				<tr>
					<th>品名</th>
					<th>型号规格</th>
					<th>数量</th>
					<th>进仓时间</th>
					<th>备注</th>
				</tr>
				<c:forEach var="pergood" items="${pergoods}">
					<tr>
						<td><c:out value="${pergood.itemType.item.name}"></c:out></td>
						<td><c:out value="${pergood.itemType.name}"></c:out></td>
						<td><c:out value="${pergood.preNum}"></c:out></td>
						<td><fmt:formatDate pattern="yyyy年MM月dd日" value="${pergood.eDate}"/></td>
						<td><c:out value="${pergood.preNote}"></c:out></td>
					</tr>
				</c:forEach>
				</table>
				<table class="addTable">
				<tr>
					<td style="text-align:center">
						<input type="submit" value="提交" class="frm_btn"/>
					</td>
				</tr>
			</table>
		</form>

	</body>
</html>
