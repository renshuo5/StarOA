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
		<title>招聘信息</title>
	</head>

	<body>
		<form action="persons/Recruitment/recruitment_update" method="post">
			<input type="hidden" name="recruitment.id" value="${recruitment.id}">
             <input type="hidden" name="recruitment.isyear" value="${recruitment.isyear}">
             <input type="hidden" name="recruitment.isCheck" value="${recruitment.isCheck}">
			<table class="title addTable">
				<tr>
					<td>
						编 辑 招 聘 信 息
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						需求类别
					</td>
					<td>
						<input type="text" value="${recruitment.recstyle}"
							name="recruitment.recstyle" class="checkEmptyShowInfo" id="recruitmentrecstyle"/><font color="#FF0000">*</font>
							<span  id="checkrecruitmentrecstyle" style="color: #FF0000; font-size: 12px;" ></span>
					</td>
				</tr>

				<tr>
					<td>
						需求人数
					</td>
					<td>
						<input type="text" value="${recruitment.recno}"
							name="recruitment.recno" class="checkNumShowInfo" id="recruitmentrecno"/><font color="#FF0000">*</font>
							<span  id="checkrecruitmentrecno" style="color: #FF0000; font-size: 12px;" ></span>
					</td>
				</tr>
				<tr>
					<td>
						登记日期
					</td>
					<td>
						<input  type="text" class="Wdate" value="${rString}"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441',skin:'whyGreen'})" />
						<input type="hidden" id="d2441" name="recruitment.rDate"
							value="${recruitment.rDate}" /><font color="#FF0000">*</font>
					</td>
				</tr>

				<tr>
					<td>
						需求部门
					</td>
					<td>
						<input type="hidden" name="departmentId" value="${departmentId}" />
						<select id="dptName" name="dptName"
							onChange="departmentId.value=this.options[dptName.selectedIndex].value;">
							<option>
								<c:choose>
									<c:when test="${recruitment.department.id!=null}">
               	${recruitment.department.dptName}  
             
             </c:when>
									<c:otherwise>
                                 请选择
            
            </c:otherwise>

								</c:choose>
							</option>
							<c:forEach items="${departmentList}" var="dpt">
								<c:if test="${recruitment.department.id!=dpt.id}">
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
						招聘性质
					</td>
					<td>
						<!--<input type="text" value="${recruitment.recnature}"
							name="recruitment.recnature" class="itemname"/><font color="#FF0000">*</font>-->
                            <select name="recruitment.recnature">

						<option
							<c:if test="${recruitment.recnature eq '聘用工'}">selected="selected"</c:if>
							value="聘用工">
							聘用工 
						</option>
						<option
							<c:if test="${recruitment.recnature eq '普通聘用工'}">selected="selected"</c:if>
							value="普通聘用工">
							普通聘用工
						</option>
						<option
							<c:if test="${recruitment.recnature eq '普工'}">selected="selected"</c:if>
							value="普工">
							普工
						</option>


					</select><font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						基本要求
					</td>
					<td>
						<textarea cols="50" rows="3" name="recruitment.baserec"
							value="${recruitment.baserec}" class="itemname">${recruitment.baserec}</textarea>
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
		<%--<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	--%></body>
</html>
