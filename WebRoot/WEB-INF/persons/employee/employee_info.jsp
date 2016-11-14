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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>人员信息</title>
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		 <script type="text/javascript" src="<%=basePath%>js/persons.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script language="javascript" src="<%=basePath%>js/highLight.js"></script>
		<script language="javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script language="javascript" src="<%=basePath%>js/addTableAlign.js"></script>
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
					<form action="persons/employee/employee_search" method="post">

						姓名:	<input type="text" name="employee.empName" size="10"
							value="${employee.empName}" class="itemname"/>					&nbsp;&nbsp; 性别:
				  <select name="employee.sex" >
				         
				            <option  <c:if test="${employee.sex==''}"> selected="selected" </c:if> value="" >
								请选择
							</option>
				          
						  
							<option <c:if test="${employee.sex=='男'}"> selected="selected" </c:if> value="男">
								男
							</option>
						   
							<option <c:if test="${employee.sex=='女'}"> selected="selected" </c:if> value="女">
								女
							</option>
						</select>

						&nbsp;&nbsp; 部门:

						<select name="employee.department.dptName">
							<option  <c:if test="${employee.department.dptName==''}"> selected="selected" </c:if> value="">
								请选择
							</option>
							<c:forEach items="${departmentList}" var="dpt">
								<option <c:if test="${employee.department.dptName==dpt.dptName}"> selected="selected" </c:if> value="${dpt.dptName}" name="${dpt.dptName}">
									${dpt.dptName}
								</option>
							</c:forEach>
						</select>

						&nbsp;&nbsp; 职位:

						<select name="employee.jobs.jobsName">
							<option <c:if test="${employee.jobs.jobsName==''}"> selected="selected" </c:if> value="">
								请选择
							</option>
							<c:forEach items="${jobsList}" var="jobs">
								<option <c:if test="${employee.jobs.jobsName==jobs.jobsName}"> selected="selected" </c:if>  value="${jobs.jobsName}" name="${jobs.jobsName}">
									${jobs.jobsName}
								</option>
							</c:forEach>
						</select>

						&nbsp;
						<input class="frm_btn" type="submit" value="模糊查询" />


						<input type="button" value="添加新人员信息"
							onClick="openWin('<%=basePath%>persons/employee/employee_addInput','添加新人员信息',800,600,'1');return false"
							class="frm_btn">
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
				</th>

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
				<th>
					修改
				</th>
				<th>
					删除
				</th>
			</tr>
			<!---------------------------LOOP START------------------------------>

			<!-- 列表数据栏 -->
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas}" var="employee">
					<tr>

						<td>
							<div align="center">
								<c:out value="${employee.empSn}" />

							</div>
						</td>
						<td>
							<div align="center">
								<a href="#"
									onClick="openWin('<%=basePath%>persons/employee/employee_show?employeeId=${employee.empId}','添加人员信息',800,600,'1');return false">
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

						<td>
							<div align="center">
								<s:property value="note" />
								<a href="#"
									onClick="openWin('<%=basePath%>persons/employee/employee_editInput?employeeId=${employee.empId}','添加人员信息',800,600,'1');return false">
									<img src="<%=basePath%>images/edit.gif" width="15" height="16"
										border="0"> </a>

							</div>
						</td>
						<td align="center">

							<a href="#"
								onclick="del('<%=basePath%>persons/employee/employee_del?employeeId=${employee.empId}');return false"><img
									src="images/del.gif" width="15" height="16" border="0"> </a>


						</td>

					</tr>
				</c:forEach>
			</c:if>
			<!----------------------LOOP END------------------------------->
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="11" align="center" bgcolor="#EFF3F7"
						class="TableBody1" onMouseOver=this.bgColor = '#DEE7FF';onmouseout=this.bgColor='#EFF3F7';;>
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
							<input type="hidden" name="employee.sex" value="${employee.sex}" />
							<input type="hidden" name="employee.jobs.jobsName"
								value="${employee.jobs.jobsName}" />


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

		<!-- 分页导航条 结束-->



		</TD>
		</TR>
		</TABLE>
<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>