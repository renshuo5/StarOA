<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<title>不合格件</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>

	</head>
	<body>
	<!--  ${empty unqualified.returned.retid } -->	
	${ unqualified.unq_id }
		<form
			action="sales/return/unqualified/unqualified_torecheck?returnedId=${unqualified.returned.retid }"
			method="post">
			<input type="hidden" name="returned.retid" value="${returned.retid}">
			<input type="hidden" name="buhege" value="2">
			<input type="hidden" name="buhegeid" value="${unqualified.unq_id }">  
			<input type="hidden" name="unqualifiedId" value="${unqualified.unq_id }">
			<table class="title">
				<tr>
					<td>
						不合格件报告单
					</td>
				</tr>

			</table>
			<table class="addTable">
				<tr>
					<td>

						型号名称：
						<input type="text" value="${unqualified.itemType.name}"
							disabled="disabled">
					</td>
					<td>
						报告单位：
						<input type="text" value="${unqualified.departmentRep.dptName}"
							disabled="disabled">
					</td>
					<td>

						报告人：
						<input type="text" value="${unqualified.reportper.empName}"
							disabled="disabled">

					</td>
					<td>

						负责人：
						<input type="text" value="${unqualified.rebper.empName}"
							disabled="disabled">
					</td>
				</tr>
				<tr>
					<td>

						不合格数量：
						<input type="text" value="${unqualified.num}" disabled="disabled">


					</td>
					<td>

						接收单位：
						<input type="text" value="${unqualified.departmentRec.dptName}"
							disabled="disabled">


					</td>
					<td>

						接收人：
						<input type="text" value=" ${unqualified.recper.empName}"
							disabled="disabled">


					</td>
					<td>

						接收日期：
						<input type="text" value="${unqualified.recedate}"
							disabled="disabled">


					</td>
				</tr>
				<tr>
					<th>
						不合格编码
					</th>
					<th>
						不合格状态
					</th>
					<th>
						发现日期
					</th>
					<th>
						负责部门处理情况
					</th>

				</tr>
				<!---------------------------LOOP START------------------------------>

				<c:forEach items="${unqmessages}" var="unqmessage" varStatus="vs">
					<tr>
						<td>
							<input type="text" value="${unqmessage.unmcode}"
								disabled="disabled">

						</td>
						<td>
							<input type="text" value="${unqmessage.unmstatus}"
								disabled="disabled">

						</td>
						<td>
							<input type="text" value="${unqmessage.fdate}"
								disabled="disabled">

						</td>
						<td>
							<input type="text" value="${unqmessage.bdepartment}"
								disabled="disabled">

						</td>
					</tr>
				</c:forEach>
			</table>
			<table class="addTable">
				<tr>
					<td>
						送检人：
					</td>
					<td>
						<input type="text" disabled="disabled" 
							value="${inspector.employee.empName}" />
						<input type="hidden" name="inspector_1"
							value="${inspector.employee.empId }" />

					</td>
					<td>
						送检时间：
					</td>
					<td>
						<input id="d244" type="text" class="Wdate"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" name="insdate"
							/>
					</td>
				</tr>
			</table>
			<table class="addTable">

				 <tr>
				    <td>
				    </td>
					<td >
						<input type="submit" value=" 提 交 " class="frm_btn" id="SYS_SET">
					</td>
				</tr>
			</table>
			</form>
	</body>
</html>