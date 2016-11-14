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
	String paname = request.getParameter("paname");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">

	<head>
		<base href="<%=basePath%>">
		<title>人员信息</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		 <script type="text/javascript" src="<%=basePath%>js/persons.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script language="javascript" src="<%=basePath%>js/highLight.js"></script>
		<script language="javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script type="text/javascript">

	function selectItem(id, name) {
		if (window.opener) {
			window.opener.document.getElementById("employeeIdId_"+<%=paname%>).value = id;
			window.opener.document.getElementById("employeeNameId_"+<%=paname%>).value = name;
			window.close();
		}
	}
</script>

	</head>

	<body>
		<table>
			<tr>
				<td style="text-align: right">
					<form action="persons/employee/employee_searchSelect?paname=<%=paname%>" method="post">

						姓名:
						<input type="text" name="employee.empName" size="4"
							value="${employee.empName}" class="itemname"/>
						&nbsp;&nbsp; 性别:
						<select name="employee.sex">
							<option value="">
								请选择
							</option>
							<option value="男">
								男
							</option>
							<option value="女">
								女
							</option>
						</select>

						&nbsp;&nbsp; 部门:

						<select name="employee.department.dptName">
							<option value="">
								请选择
							</option>
							<c:forEach items="${departmentList}" var="dpt">
								<option value="${dpt.dptName}" name="${dpt.dptName}">
									${dpt.dptName}
								</option>
							</c:forEach>
						</select>

						&nbsp;&nbsp; 职位:

						<select name="employee.jobs.jobsName">
							<option value="">
								请选择
							</option>
							<c:forEach items="${jobsList}" var="jobs">
								<option value="${jobs.jobsName}" name="${jobs.jobsName}">
									${jobs.jobsName}
								</option>
							</c:forEach>
						</select>

						&nbsp;
						<input class="frm_btn" type="submit" value="模糊查询" />


					</form>
				</td>
			</tr>
		</table>
		<table class="title">
			<tr>
				<td>&nbsp;
					
				</td>
			</tr>
		</table>
		<table class="list">
			<tr>
				<th>
					选择
				</th>

				<th>
					员工号
				</th>

				<th>
					姓名
				</th>

				<th>
					性别
				</th>
				<th>
					部门

					<th>
						职位
					</th>
					<th>
						联系方式
					</th>
					<th>
						员工性质
					</th>
					<th>
						状态
					</th>
			</tr>
			<!---------------------------LOOP START------------------------------>

			<!-- 列表数据栏 -->
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas}" var="employee">
					<tr>
						<td>
							<div align="center">
								<input type="radio" name="employeeid"
									onclick="selectItem('${employee.empId}','${employee.empName}')">
							</div>
						</td>

						<td>
							<div align="center">
								<c:out value="${employee.empSn}" />

							</div>
						</td>
						<td>
							<div align="center">
								<a href="#"
									onClick="openWin('<%=basePath%>persons/employee/employee_show?employeeId=${employee.empId}','添加人员信息',550,450,'1');return false">
									<c:out value="${employee.empName}" /> </a>



							</div>
						</td>
						<td>
							<div align="center">
								<c:out value="${employee.sex}" />
							</div>
						</td>
						<td>
							<div align="center">
								<c:out value="${employee.department.dptName}" />
							</div>
						</td>

						<td>
							<div align="center">
								<c:out value="${employee.jobs.jobsName }" />
							</div>
						</td>
						<td>
							<div align="center">
								<c:out value="${employee.phoneNo}" />
							</div>
						</td>
						<td>
							<div align="center">
								<c:out value="${employee.nature}" />
							</div>
						</td>
						<td>
							<div align="center">
								<c:out value="${employee.status}" />

							</div>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<!----------------------LOOP END------------------------------->
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="9" align="center" bgcolor="#EFF3F7" class="TableBody1"
						onMouseOver="this.bgColor= '#DEE7FF'"
						onmouseout="this.bgColor='#EFF3F7'">
						没有找到相应的记录
					</td>
				</tr>
			</c:if>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
		</table>



        <table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
						<pg:param name="employee.department.dptName" />
						<pg:param name="employee.sex" />
						<pg:param name="employee.jobs.jobsName" />
						<pg:param name="employee.empName" />
                        <pg:param name="paname" />

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

							            <input type="hidden" name="employee.department.dptName"
											value="${employee.department.dptName}" />
										<input type="hidden" name="employee.empName"
											value="${employee.empName}" />
										<input type="hidden" name="employee.sex"
											value="${employee.sex}" />
										<input type="hidden" name="employee.jobs.jobsName"
											value="${employee.jobs.jobsName}" />
                                        <input type="hidden" name="paname"
											value="<%=paname%>" />

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
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>



		
				</TD>
			</TR>
		</TABLE>

	</body>
</html>