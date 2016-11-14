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
		<title>添加培训信息</title>
	</head>

	<body>
		<form action="persons/training/training_add" method="post">
			<table class="title addTable">
				<tr>
					<td>
						添 加 培 训 信 息
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						培训名称
					</td>
					<td>
						<input align="left" type="text" name="training.traName" class="checkEmptyShowInfo" id="trainingtraName"/><font color="#FF0000">*</font>
						<span  id="checktrainingtraName" style="color: #FF0000; font-size: 12px;" ></span>
					</td>
				</tr>

				<tr>
					<td>
						讲师
					</td>
					<td>
						<input align="left" type="text" name="training.lecture" class="checkEmptyShowInfo" id="traininglecture"/><font color="#FF0000">*</font>
						<span  id="checktraininglecture" style="color: #FF0000; font-size: 12px;" ></span>
					</td>
				</tr>

				<tr>
					<td>
						培训人数
					</td>
					<td>
						<input align="left" type="text" name="training.traNumber" class="checkNumShowInfo checkEmptyShowInfo" id="trainingtraNumber"/><font color="#FF0000">*</font>
						<span  id="checktrainingtraNumber" style="color: #FF0000; font-size: 12px;" ></span>
					</td>
				</tr>
				<tr>
					<td>
						<input type="hidden" name="departmentId" value="${departmentId}" />
						执行单位
					</td>
					<td>
						<select id="dptName" name="dptName"
							onChange="departmentId.value=this.options[dptName.selectedIndex].value;" class="selectone">
							<option value="choose">
								请选择
							</option>
							<c:forEach items="${departmentList}" var="dpt">
								<option value="${dpt.id}" name="${dpt.dptName}">
									${dpt.dptName}
								</option>
							</c:forEach>

						</select><font color="#FF0000">*</font>


					</td>
				</tr>

				<tr>
					<td>
						开始时间
					</td>
					<td>
						<input id="d2441" type="text" class="Wdate"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'startDate',skin:'whyGreen'})" />
						<input type="hidden" id="startDate" name="training.stDate" class="checkDateInfo"/><font color="#FF0000">*</font>
					</td>
				</tr>

				<tr>
					<td>
						结束时间
					</td>
					<td>
						<input id="d2442" type="text" class="Wdate"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'endDate',skin:'whyGreen'})" />
						<input type="hidden" id="endDate" name="training.edDate" class="checkDateInfo"/><font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						是否考试
					</td>
					<td>
						<select name="training.exam" id="trainingexam" class="selectone">
							<option value="choose">
								请选择
							</option>
							<option value="是">
								是
							</option>
							<option value="否">
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
        		</form>
        		<br>
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>

</html>
