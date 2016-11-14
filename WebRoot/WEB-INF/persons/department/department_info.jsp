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
		<title>部门信息</title>
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
					<input type="button" value="添加新部门"
						onClick="openWin('<%=basePath%>persons/department/department_addInput','添加新部门',800,600,'1')"
						class="frm_btn">
				</td>

			</tr>
		</table>
		<table class="title ">
			<tr>
				<td>&nbsp;
					
				</td>
			</tr>
		</table>
		<table class="list">
			<tr>
				<th>
					部门名称
				</th>
				<th>
					部门类别
				</th>
				<th>
					部门描述

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
				<c:forEach items="${pm.datas}" var="department">

					<tr>

						<td>
							<div align="center">
								<c:out value="${department.dptName}" />
							</div>
						</td>
						<td>
							<div align="center">
								<c:choose>
									<c:when test="${department.dptType==1}">
                       部门类
                    </c:when>
									<c:when test="${department.dptType==2}">
                      车间类
                    </c:when>
									<c:when test="${department.dptType==3}">
                        仓库类
                    </c:when>
								</c:choose>

							</div>
						</td>
						<td>
							<div align="center">
								<c:out value="${department.dptDes}" />
							</div>
						</td>



						<td align="center">

							<a href="#"
								onClick="openWin('<%=basePath%>persons/department/department_editInput?departmentId=${department.id}','添加部门信息',800,600,'1');return false">
								<img src="<%=basePath%>images/edit.gif" width="15" height="16"
									border="0"> </a>

						</td>
						<td align="center">

							<a href="#"
								onclick="del('<%=basePath%>persons/department/department_del?departmentId=${department.id}');return false"><img
									src="images/del.gif" width="15" height="16" border="0"> </a>

							<s:else></s:else>
							<br />

						</td>

					</tr>
				</c:forEach>
			</c:if>

			<!----------------------LOOP END------------------------------->

		</table>
        
        <table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
							<tr height=28px valign="middle">
								<th align=right noWrap>
									<pg:pager
										url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
										items="${pm.total}" maxPageItems="${pagesize}"
										export="currentPageNumber=pageNumber">
										
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
	</body>
</html>