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
		<title>冷冲件出荷报告</title>
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
		<form action="sales/shipment/shippingnote1/shippingnote1_taxstamAdd" method="post">
			<input type="hidden" name="shi1goodId" value="${shi1good.shi1gid}">

			<table class="title">
				<tr>
					<td>
						产 品 出 荷 报 告 单（冷冲件）
						</font>
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						品 名
					</td>
					<td>

						<input type="text" value="${shi1good.itemType.item.name}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>
						适 用 机 型
					</td>
					<td>

						<input type="text" value="${shi1good.itemType.name}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>
						货 品 代 码
					</td>
					<td>
						<input type="text" value="${shi1good.itemType.mCode}" readonly="readonly">

					</td>
				</tr>
				<tr>
					<td>
						批 号:
					</td>
					<td>
						<input type="text" value="${shi1good.shitime}" readonly="readonly">

					</td>
				</tr>
				<tr>
					<td>
						出 货 总 量
					</td>
					<td>
						<input type="text" value="${shi1good.shi1no}" readonly="readonly">
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<th>
						特 性 名 称
					</th>
					<th>
						检 验 水平或 项目
					</th>
					<th>
						检 查 数 量
					</th>
					<th>
						检 查 结 果
					</th>
				</tr>
				<tr>
					<td>
						尺 寸 检 查
					</td>
					<td>
						II级 ，AQL=
						<input type="text" name="taxstampingparts.sizecheckaql">
					</td>
					<td>
						<input type="text" name="taxstampingparts.sizechecknum">
					</td>
					<td>
						<input type="text" name="taxstampingparts.checkresult1">
					</td>
				</tr>

				<tr>
					<td rowspan="2">
						外 观 检 查
					</td>
					<td>
						锈迹、油污的、毛刺‘划伤等
					</td>
					<td>
						<input type="text" name="taxstampingparts.vischecknum1">
					</td>
					<td>
						<input type="text" name="taxstampingparts.checkresult2">
					</td>
				</tr>
				<tr>

					<td>
						锈迹、油污的、毛刺‘划伤等
					</td>
					<td>
						<input type="text" name="taxstampingparts.vischecknum2">
					</td>
					<td>
						<input type="text" name="taxstampingparts.chenkresult3">
					</td>

				</tr>
			</table>

			<table class="addTable">
				<tr>
					<td>
						最终判定:
					</td>
					<td>
						<input type="text" name="taxstampingparts.confirm">
					</td>
				</tr>
				<tr>
					<td>
						检 验 员:
					</td>
					<td>
						<select name="taxstampingparts.inspector.empId">
							<option>
								请选择
							</option>
							<c:forEach items="${inspector}" var="emp">
								<option value="${emp.empId}">
									${emp.empName}
								</option>
							</c:forEach>
						</select>*
					</td>
				</tr>
				<tr>
					<td>
						报告时间:
					</td>
					<td>
						<input id="d244" type="text" class="Wdate"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" name="taxstampingparts.repdate" />
					</td>
				</tr>
				<tr>
					<td>
						品管确认：
					</td>
					<td>
						<input type="text" disabled="disabled"  name="quaconfirm"
							value="${quaconfirm.employee.empName}" />
						<input type="hidden" name="taxstampingparts.quaconfirm.empId"
							value="${quaconfirm.employee.empId }" />
					</td>
				</tr>
				<tr>
					<td>
						负责人：
					</td>
					<td>
						<select name="taxstampingparts.rper.empId">
							<option>
								请选择
							</option>
							<c:forEach items="${rper}" var="emp">
								<option value="${emp.empId}">
									${emp.empName}
								</option>
							</c:forEach>
						</select>*
					</td>
				</tr>
				<tr>
					<td>
						时间：
					</td>
					<td>
						<input id="d2441" type="text" class="Wdate"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2',skin:'whyGreen'})" />
						<input type="hidden" id="d2441_2" name="taxstampingparts.makdate" />
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td align="center">
						<div align="center">
							<input type="submit" value=" 提 交 " class="frm_btn">
						</div>
					</td>
				</tr>
			</table>

		</form>
	</body>
</html>
