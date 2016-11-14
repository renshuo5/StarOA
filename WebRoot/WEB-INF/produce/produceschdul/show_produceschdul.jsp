<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//System.out.println("basePath: "+basePath);
%>
<html>
	<head>

		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>打印机成品报告单</title>
		<link rel="stylesheet" type="text/css" href="css/zjm.css">
		
		
		
		
		
	</head>

	<body >

		<form action="produce/produceschdul/produceschdul_add" method="post">
			<table class="title editTable">
				<tr>
					<td>
						打印机成品报告单
					</td>
				</tr>
			</table>
			<table class="list">
				<tr>

					<th>
						编号：
					</th>
					<td>

						<c:out value="${productionSchdul.cha_no }"></c:out>

					</td>
				</tr>
				<tr>
					<th>
						制单：
					</th>
					<td>

						<c:out value="${productionSchdul.menumake.empName}"></c:out>

					</td>
				</tr>
				<tr>
					<th>
						原打印机型:
					</th>
					<td>

						<c:out value="${productionSchdul.itemType.name}"></c:out>
					</td>
				</tr>
				<tr>
					<th>
						借出数量:
					</th>
					<td>

						<c:out value="${productionSchdul.bno}"></c:out>
					</td>
				</tr>
				<tr>
					<th>
						产成品序号记录:
					</th>
					<td>

						<c:out value="${productionSchdul.prorecord}"></c:out>
					</td>
				</tr>
				<tr>
					<th>
						改装成机型:
					</th>
					<td>

						<c:out value="${productionSchdul.itemType2.name}"></c:out>
					</td>
				</tr>
				<c:if test="${productionSchdul.competeno!=null}">
				<tr>
					<th>
						完成改机进仓数量:
					</th>
					<td>

						<c:out value="${productionSchdul.competeno}"></c:out>
					</td>

				</tr>
				</c:if>
				<tr>
					<th>
						下达日期:
					</th>
					<td>

						<c:out value="${productionSchdul.startdate}"></c:out>

					</td>
				</tr>
				<tr>
					<th>
						完成日期:
					</th>
					<td>

						<c:out value="${productionSchdul.enddate}"></c:out>
					</td>
				</tr>

				<c:if test="${productionSchdul.wssign.empId!=null}">
					<tr>

						<th>
							车间签字:
						</th>
						<td>

							<c:out value="	${productionSchdul.wssign.empName }"></c:out>
						</td>
					</tr>
				</c:if>
				<c:if test="${productionSchdul.whsign.empName!=null}">
					<tr>
						<th>
							仓库签字:
						</th>
						<td>

							<c:out value="${productionSchdul.whsign.empName }"></c:out>
						</td>
					</tr>
				</c:if>
				<c:if test="${productionSchdul.exsign.empName!=null}">
					<tr>
						<th>
							检验签字:
						</th>
						<td>

							<c:out value="${productionSchdul.exsign.empName }"></c:out>
						</td>
					</tr>
				</c:if>
				<tr>
					<th>
						备注：
					</th>
					<td>

						<c:out value="${productionSchdul.channote}"></c:out>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
