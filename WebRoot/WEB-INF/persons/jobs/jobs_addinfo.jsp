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
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
		<script language="javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<title>添加职位</title>
	</head>

	<body>
		<form action="persons/jobs/jobs_add" method="post">
			<table class="title addTable">
				<tr>
					<td>
						添 加 职 位
					</td>
				</tr>

			</table>
			<table class="addTable">

				<tr>
					<td>
						职位名称
					</td>
					<td>
						<input align="left" type="text" name="jobs.jobsName" class="checkEmptyShowInfo" id="jobsjobsName"/><font color="#FF0000">*</font>
						<span  id="checkjobsjobsName" style="color: #FF0000; font-size: 12px;" ></span>
					</td>
				</tr>


				<tr>
					<td>
						职位描述
					</td>
					<td>
						<textarea name="jobs.jobsDes" cols="50" rows="3" class="itemname"></textarea>
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
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>
