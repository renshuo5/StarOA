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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">

	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
		<script language="javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script language="javascript" src="<%=basePath%>js/textRightLeft.js"></script>
		<title>人员信息</title>
	</head>
	<body>
		<table class="title" style="width:85%">
			<tr>
				<td>
					人 员 信 息 表 格
				</td>
			</tr>
		</table>
		<table class="addTable">
			<tr>
					<td style="width:50%">员工号:</td>
				<td>
					<c:out value="${employee.empSn}" />
				</td>
				
				
					<td>
						员工性质:
					</td>
					<td>
						<c:out value="${employee.nature}" />
					</td>
				
			</tr>
			<tr>
				<div colspan="80%">
					<td>
						姓名:
					</td>
					<td>
						<c:out value="${employee.empName}" />
					</td>
				</div>
				<div colspan="20%" >
					<td >
						<c:choose>
							<c:when test="${!empty employee.pic}">
								<img src="${employee.pic}" width="110" height="130" />
							</c:when>
							<c:otherwise>
								<img src="<%=basePath%>images/persons.jpg" width="110"
									height="130" />
							</c:otherwise>
						</c:choose>
					</td>
					<td></td>
					
					
				</div>
			</tr>
			<tr>
				<div colspan="50%">
					<td>
						性别:
					</td>
					<td>
						<c:out value="${employee.sex}" />
					</td>
				</div>
				<div colspan="50%">
					<td>
						出生年月:
					</td>
					<td>
						<c:out value="${birString}" />
					</td>
				</div>
			</tr>

			<tr>
				<div colspan="50%">
					<td>
						政治面貌:
					</td>
					<td>
						<c:out value="${employee.political}" />
					</td>
				</div>
				<div colspan="50%">
					<td>
						身份证:
					</td>
					<td>
						<c:out value="${employee.idCardNo}" />
					</td>
				</div>
			</tr>
			<tr>
				<div colspan="50%">
					<td>
						婚姻情况:
					</td>
					<td>
						<c:out value="${employee.marStatus}" />
					</td>
				</div>
				<div colspan="50%">
					<td>
						联系方式:
					</td>
					<td>
						<c:out value="${employee.phoneNo}" />
					</td>
				</div>
			</tr>


			<tr>
				
					<td>
						宿舍号:
					</td>
					<td>
						<c:out value="${employee.dormitory}" />
					</td>
				</div>
				
				<td>
					状态:
				</td>
				<td>
					<c:out value="${employee.status}" />
				</td>
				</div>
			</tr>

			<tr>
				
					<td>
						所在部门:
					</td>
					<td>
						<c:out value="${employee.department.dptName}" />
					</td>
				</div>
				
					<td>
						职位:
					</td>
					<td>
						<c:out value="${employee.jobs.jobsName}" />
					</td>
				</div>
			</tr>

			<tr>
				
					<td>
						职称:
					</td>
					<td>
						<c:out value="${employee.jobTitle}" />
					</td>
				</div>
				
					<td>
						文化程度:
					</td>
					<td>
						<c:out value="${employee.education}" />
						&nbsp;
					</td>
				</div>
			</tr>
			<tr>
				
					<td>
						进入公司时间:
					</td>
					<td>
						<c:out value="${eDateString}" />
					</td>
				
				
					<td>
						离开公司时间:
					</td>
					<td>
						<c:out value="${lDateString}" />
					</td>
				
			</tr>
			<tr>
			</tr>
			
		</table>
		<table class="title" style="width: 85%">
				<tr>
					<td>
						培训情况
					</td>
				</tr>
			</table>
		<table class="list" style="width: 85%">
						
                 <tr>
                       <th align="center">培训名称</th>
                      <th align="center">培训时间</th>      
                      
                </tr>
                <c:if test="${!empty lists}">
				<c:forEach items="${lists}" var="empTrain">
				<tr >
					<td align="center">
						<c:out value="${empTrain.traName}" />
								
					</td>
					<td align="center">
						<fmt:formatDate value="${empTrain.stDate}" pattern="yyyy-MM-dd" />
					</td>
				</tr>
            </c:forEach>
			</c:if>
			<c:if test="${empty lists}">
				<tr align="center">
					<td>
						没有找到相应的记录
					</td>
				</tr>
			</c:if>
			</table>
		<table class="btn">
			<tr>
				<td>
					<input type="button" class="frm_btn" value="关闭窗口"
						onclick=window.close();;>
				</td>
			</tr>
		</table>
	</body>
</html>
