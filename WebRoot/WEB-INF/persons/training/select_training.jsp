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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<title>培训信息</title>
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
					<form action="persons/training/training_searchSelect" method="post">
						培训时间：
						<input type="text" name="sDateString" value="${sDateString}" class="itemname"/>
						&nbsp;&nbsp;
						<input class="frm_btn" type="submit" value="模糊查询" />
						</form>
				</td>
				</tr></table>
                <form method="post" id="addInput"
					action="persons/ytrainplan/ytrainplan_addInput">
                <table>
				<tr>
				<td style="text-align: right">

					请选择你要添加的年份,如2010:
					<input type="text" name="yplanname.planname" value="" size="15"
						id="year" class="checkEmptyShowInfo"/><font color="#FF0000">*</font>

					<input type="submit" value="添加年度培训计划" class="frm_btn" />

				</td>
			
			</tr>
		</table>
<br/><br/>
		<table class="title">
			<tr>
				<td>&nbsp;
					
				</td>
			</tr>
		</table>
		<table class="list">
			<tr>
				<th>选择
					
				</th>
				<th>
					培训内容
				</th>


				<th>
					讲师
				</th>

				<th>
					培训人数
				</th>
				<th>
					执行单位
				</th>

				<th>
					开始时间
				</th>
				<th>
					结束时间
				</th>
				<th>
					是否考试
				</th>
			</tr>
			<!---------------------------LOOP START------------------------------>
			<!-- 列表数据栏 -->

			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas}" var="training">

					<tr>
						<!--<td width="8%" bgcolor="f5f5f5"><div align="center">
                          <label>
                            <input type="checkbox" name="trainingIds" value="${training.id}">
                          </label>
                      </div></td>-->
						<td>
							<div align="center">
								<label>
									<input type="checkbox" name="trainingIds"
										value="${training.id}">

								</label>
							</div>
						</td>
						<td>
							<div align="center">
								<c:out value="${training.traName}" />
							</div>
						</td>

						<td >
							<div align="center">
								<c:out value="${training.lecture}" />
							</div>
						</td>
						<td >
							<div align="center">
								<c:out value="${training.traNumber}" />
							</div>
						</td>
						<td >
							<div align="center">
								<c:out value="${training.department.dptName}" />
							</div>
						</td>

						<td >
							<div align="center">
								<fmt:formatDate value="${training.stDate}" pattern="yyyy-MM-dd" />
							</div>
						</td>
						<td >
							<div align="center">
								<fmt:formatDate value="${training.edDate}" pattern="yyyy-MM-dd" />
							</div>
						</td>
						<td >
							<div align="center">
								<c:out value="${training.exam}" />
							</div>
						</td>
					</tr>

				</c:forEach>
			</c:if>

			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="10" align="center" bgcolor="#EFF3F7"
						class="Tathis.bgColor='#DEE7FF';this.bgColor='#EFF3F7'">
						没有找到相应的记录
					</td>
				</tr>
			</c:if>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
		</table>

		</form>      
        <table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
							<tr height=28px valign="middle">
								<th align=right noWrap>
									<pg:pager
										url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
										items="${pm.total}" maxPageItems="${pagesize}"
										export="currentPageNumber=pageNumber">
										<pg:param name="sDateString" />
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

											<input type="hidden" name="sDateString" value="${sDateString}" />
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
					</table>
					<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>