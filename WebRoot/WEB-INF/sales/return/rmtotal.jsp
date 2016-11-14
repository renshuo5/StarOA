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
		<title>退货统计表</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath %>css/vip.css"
			type="text/css">
		<script type="text/javascript" src="<%=basePath %>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath %>js/public.js"></script>
	</head>

	<body>
		<table class="title">
			<tr>
				<td>
					退 货 统 计 月 报 表
				</th>
			</tr>
			</table>
			<table class="list">
			<tr>
				<td colspan="14" align="right">
					<select name="年"></select>
					年
					<select name="年"></select>
					月
				</td>
			</tr>
			<tr>
				<th>
					品名
				</th>
				<th>
					型号规格
				</th>
				<th>
					部品代码
				</th>
				<th>
					退货数
				</th>
				<th>
					修复合格数
				</th>
				<th>
					报废数
				</th>
				<th>
					累计退货数
				</th>
				<th>
					本月送货数
				</th>
				<th>
					累计送货数
				</th>
				<th>
					本月不合格率
				</th>
				<th>
					累计不合格率
				</th>
				<th>
					删除
				</th>
				<th>
					添加
				</th>
			</tr>
			<tr id="rowTemplete_0">
				<td>
					<select name=""></select>
				</td>
				<td>
					<select name=""></select>
				</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>

				<td align="center">
					<img src="<%=basePath %>images/add.png" onClick="addBatchRow(this)" />
				</td>
				<td align="center">
					<img src="<%=basePath %>images/del.png"
						onClick="deleteBatchRow(this)" />
				</td>
			</tr>

		</table>

	</body>
</html>
