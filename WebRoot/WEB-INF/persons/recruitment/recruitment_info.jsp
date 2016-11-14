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
		<title>招聘内容</title>
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

	<bod>
    
    		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>
	<table>
		<tr>
			<td style="text-align: right">
				<form action="persons/Recruitment/recruitment_search" method="post">
					需求类别:
					<input type="text" name="recruitment.recstyle" size="4"
						value="${recruitment.recstyle}" class="itemname" />
					&nbsp;&nbsp; 部门:

					<select name="recruitment.department.dptName">
						<option value="">
							请选择
						</option>
						<c:forEach items="${departmentList}" var="dpt">
							<option value="${dpt.dptName}" name="${dpt.dptName}">
								${dpt.dptName}
							</option>
						</c:forEach>
					</select>


					&nbsp;
					<input class="frm_btn" type="submit" value="模糊查询" />


					<input type="button" value="添加新招聘"
						onClick="openWin('<%=basePath%>persons/Recruitment/recruitment_addInput','添加新招聘',800,600,'1')"
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
				需求类别

			</th>
			<th>
				需求人数

			</th>
			<th>
				需求部门

			</th>
			<th>
				招聘性质

			</th>
			<th>
				基本要求

			</th>
			<th>
				登记日期

			</th>
			<th>
				修改

			</th>
			<th>
				审核

			</th>
			<th>
				删除

			</th>
		</tr>
		<!---------------------------LOOP START------------------------------>
		<!-- 列表数据栏 -->
		<c:if test="${!empty pm.datas}">
			<c:forEach items="${pm.datas}" var="recruitment">


				<tr>
					<td>
						
							<c:out value="${recruitment.recstyle}" />
					</td>
					<td>
						
							<c:out value="${recruitment.recno}" />
					</td>
					<td>
					
							<c:out value="${recruitment.department.dptName}" />
					</td>
					<td>
						
							<c:out value="${recruitment.recnature}" />
					</td>

					<td>
						
							<c:out value="${recruitment.baserec}" />
					</td>
					<td >
						
							<fmt:formatDate value="${recruitment.rDate}" pattern="yyyy-MM-dd" />
					</td>

					<td >
						<s:property value="note" />
						<a href="#"
							onClick="openWin('<%=basePath%>persons/Recruitment/recruitment_editInput?recruitmentId=${recruitment.id}','添加人员信息',800,600,'1');return false">
							<img src="<%=basePath%>images/edit.gif" width="15" height="16"
								border="0"> </a>
					</td>
					<td>
						<c:choose>
							<c:when test="${recruitment.isCheck==0}">
								<a href="#"
									onClick="openWin('<%=basePath%>persons/Recruitment/recruitment_editInputCheck?recruitmentId=${recruitment.id}','审核信息',800,600,'1');return false">
									<img src="<%=basePath%>images/3245.jpg" width="20"
										height="16" border="0"> </a>
							</c:when>
							<c:otherwise>
                       通过
                    </c:otherwise>
						</c:choose>
					</td>
					<td  align="center">

						<a href="#"
							onclick="del('<%=basePath%>persons/Recruitment/recruitment_del?recruitmentId=${recruitment.id}');return false"><img
								src="images/del.gif" width="15" height="16" border="0"> </a>
						<br />

					</td>

				</tr>

			</c:forEach>
		</c:if>
		<!----------------------LOOP END------------------------------->
		<!-- 在列表数据为空的时候，要显示的提示信息 -->
		<c:if test="${empty pm.datas}">
			<tr>
				<td colspan="12" align="center" bgcolor="#EFF3F7" class="TableBody1"
					onMouseOver=
	this.bgColor = '#DEE7FF';
onmouseout=
	this.bgColor = '#EFF3F7';
;>

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
										<pg:param name="recruitment.recstyle" />
								<pg:param name="recruitment.department.dptName" />
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

											<input type="hidden" name="recruitment.recstyle"
										value="${recruitment.recstyle}" />
									<input type="hidden" name="recruitment.department.dptName"
										value="${recruitment.department.dptName}" />
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
	</body>
</html>