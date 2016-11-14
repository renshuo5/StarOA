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
		<base href="<%=basePath%>"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>人力资源需求计划表</title>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css"/>
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css"/>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>
		<table class="title">
			<tr>
				<td>
					<c:out value="${yName}" />
					人力资源需求计划表
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
					用部门
				</th>
				<th>
					招聘性质
				</th>
				<th>
					基本要求
				</th>
			</tr>
			<c:if test="${!empty recruitments}">
				<c:forEach items="${recruitments}" var="recruitment">

					<tr>
						<td>
							<div align="center">
								<c:out value="${recruitment.recstyle}" />
							</div>
						</td>
						<td >
							<div align="center">
								<c:out value="${recruitment.recno}" />
							</div>
						</td>
						<td>
							<div align="center">
								<c:out value="${recruitment.department.dptName}" />
							</div>
						</td>
						<td >
							<div align="center">
								<c:out value="${recruitment.recnature}" />
							</div>
						</td>
						<td >
							<div align="center">
								<c:out value="${recruitment.baserec}" />
							</div>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty recruitments}">
				<tr>
					<td colspan="10" align="center" bgcolor="#EFF3F7"
						class="TableBody1" onMouseOver=this.bgColor
						= '#DEE7FF';
onmouseout=this.bgColor= '#EFF3F7';
>
							没有找到相应的记录
						</td>
				</tr>
			</c:if>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->

		</table>
        <table class="btn" style="width:100%">
        <tr>
        <td>
<input type="button" class="frm_btn" value="关闭窗口"
onclick=window.close();
;>
        </td>
        </tr>
        </table>
		
	</body>
</html>
