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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		 <script type="text/javascript" src="<%=basePath%>js/persons.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
		<title>编 辑 培训信息</title>
	</head>

	<body>
		<form action="persons/training/training_update" method="post">
			<input type="hidden" name="training.id" value="${training.id}">


			<table class="title addTable">
				<tr>
					<td>
						编 辑 培 训 信 息
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						培训名称
					</td>
					<td>
						<input align="left" type="text" name="training.traName"
							value="${training.traName}" class="checkEmptyShowInfo" id="trainingtraName"/><font color="#FF0000">*</font>
							<span  id="checktrainingtraName" style="color: #FF0000; font-size: 12px;" ></span>
					</td>
				</tr>

				<tr>
					<td>
						讲师
					</td>
					<td>
						<input align="left" type="text" name="training.lecture"
							value="${training.lecture}" class="checkEmptyShowInfo" id="traininglecture"/><font color="#FF0000">*</font>
							<span  id="checktraininglecture" style="color: #FF0000; font-size: 12px;" ></span>
					</td>
				</tr>

				<tr>
					<td>
						培训人数
					</td>
					<td>
						<input align="left" type="text" name="training.traNumber"
							value="${training.traNumber}" class="checkNumShowInfo" id="trainingtraNumber"/><font color="#FF0000">*</font>
							<span  id="checktrainingtraNumber" style="color: #FF0000; font-size: 12px;" ></span>
					</td>
				</tr>
				<tr>
					<td>
						<input type="hidden" name="departmentId" value="${training.department.id}" />
						执行单位
					</td>
					<td>
						<select id="dptName" name="dptName"
							onChange="departmentId.value=this.options[dptName.selectedIndex].value;">
							<option>
								<c:choose>
									<c:when test="${training.department.id!=null}">
               	${training.department.dptName}  
             
             </c:when>
									<c:otherwise>
                                 请选择
            
            </c:otherwise>

								</c:choose>
							</option>
							<c:forEach items="${departmentList}" var="dpt">
								<c:if test="${training.department.id!=dpt.id}">
									<option value="${dpt.id}" name="${dpt.dptName}">
										${dpt.dptName}
									</option>

								</c:if>

							</c:forEach>

						</select><font color="#FF0000">*</font>


					</td>
				</tr>

				<tr>
					<td>
						开始时间
					</td>
					<td>
						<input id="d2441" type="text" class="Wdate" value="${sDateString}"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'startDate',skin:'whyGreen'})" />
						<input type="hidden" id="startDate" name="training.stDate"
							value="${training.stDate}" /><font color="#FF0000">*</font>
					</td>
				</tr>

				<tr>
					<td>
						结束时间
					</td>
					<td>
						<input id="d2442" type="text" class="Wdate" value="${eDateString}"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'endDate',skin:'whyGreen'})" />
						<input type="hidden" id="endDate" name="training.edDate"
							value="${training.edDate}" /><font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						是否考试
					</td>
					<td>

						<select name="training.exam" id="trainingexam">
							<c:if test="${training.exam==''}">
								<option selected="selected" value="choose">
									请选择
								</option>
							</c:if>
							<option
								<c:if test="${training.exam=='是' }">selected="selected"</c:if>
								value="是">
								是
							</option>
							<option
								<c:if test="${training.exam=='否' }">selected="selected"</c:if>
								value="否">
								否
							</option>
						</select><font color="#FF0000">*</font>
					</td>
				</tr>
			</table>
			<table class="btn">
				<tr>
					<td>
						<input type="submit" name="submit" value="提交" class="frm_btn" id="SYS_SET"/>
					</td>
				</tr>
			</table>
		</form>
                		<br>
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>

</html>
