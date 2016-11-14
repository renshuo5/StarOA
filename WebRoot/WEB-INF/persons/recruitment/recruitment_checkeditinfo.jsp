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
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
		<title>审核招聘信息</title>
	</head>

	<body>
		<form action="persons/Recruitment/recruitment_checked" method="post">
			<input type="hidden" name="recruitment.id" value="${recruitment.id}">
            <input type="hidden" name="recruitment.isyear" value="${recruitment.isyear}">
			<table class="title addTable">
				<tr>
					<td>
						审 核招 聘 信 息
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						需求类别
					</td>
					<td>
						<input
							name="recruitment.recstyle" type="text" value="${recruitment.recstyle}" readonly="readonly" align="left" />
					</td>
				</tr>

				<tr>
					<td>
						需求人数
					</td>
					<td>
						<input
							name="recruitment.recno" type="text" value="${recruitment.recno}" readonly="readonly" align="left" />
					</td>
				</tr>
				<tr>
					<td>
						登记日期
					</td>
					<td><input type="text" name="" value="${rString}" readonly="readonly"/>
						<input type="hidden" id="d244_2" name="recruitment.rDate"
							value="${recruitment.rDate}" />
					</td>
				</tr>

				<tr>
					<td>
						需求部门
					</td>
					<td>
						<input type="hidden" name="departmentId" value="${recruitment.department.id}" />
						<input type="text" name="" value="${recruitment.department.dptName}" readonly="readonly"/>
					</td>
					
				</tr>

				<tr>
					<td>
						招聘性质
					</td>
					<td>
						<input
							name="recruitment.recnature" type="text" value="${recruitment.recnature}" readonly="readonly" align="left" />
					</td>
				</tr>
				<tr>
					<td>
						基本要求
					</td>
					<td>
						<textarea name="recruitment.baserec" cols="50" rows="3" readonly="readonly"
							value="${recruitment.baserec}">${recruitment.baserec}</textarea>
					</td>
				</tr>
			</table>
			<table class="btn">
				<tr>
					<td>
						<input type="submit" name="submit" value="审核" class="frm_btn" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
