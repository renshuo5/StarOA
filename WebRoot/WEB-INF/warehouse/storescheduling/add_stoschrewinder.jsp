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
		<title>收料入库调度</title>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/highLight.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>

		<form action="warehouse/storescheduling/storescheduling_addrewinder"
			method="post">
			<input type="hidden" name="rewinderId" value="${rewinder.rew_id}" />

			<table class="title" style="width: 85%">
				<tr>
					<td>
						收料入库调度
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>

						入库单编号：

					</td>
					<td>
						<input name="storescheduling.storsn" type="text" size="50"
							maxlength="100" disabled="disabled" value="${rewinder.rew_id}" />
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>

						申请入库时间：

					</td>
					<td>
						<input id="d244" type="text" size="50" class="Wdate checkDateInfo"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" name="storescheduling.reqstodate" />
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>

						应入库数量：

					</td>
					<td>
						<input name="storescheduling.stonum" disabled="disabled"
							value="${stonum}" type="text" size="50" maxlength="100" />
					</td>
				</tr>
				<tr>
					<td>

						仓库验收：

					</td>
					<td>
						<input disabled="disabled" type="text" size="50" maxlength="100"
							value="${whmanager.employee.empName}" />
						<input type="hidden" name="rewinder.whmanager.empId"
							value="${whmanager.employee.empId}" />
					</td>
				</tr>
			</table>
			<table class="list editTable">
				<tr>
					<th>

						编号

					</th>
					<th>

						名称

					</th>
					<th>

						规格型号

					</th>
					<th>

						保税

					</th>
					<th>

						合格数量

					</th>
					<th>

						入库数量

					</th>
					<th>

						仓库名
					</th>
				</tr>
				<c:forEach items="${rewgoods}" var="rewgood">
					<c:if test="${rewgood.rewinder.rew_id==rewinder.rew_id}">
						<tr>
							<td align="center">
								<input name="rewinder.rew_id" type="text" disabled="disabled"
									value="${rewinder.rew_id}" size="8" />
							</td>
							<td align="center">
								<input name="stoschgood.itemType.item.name" type="text"
									disabled="disabled" value="${rewgood.itemType.item.name}"
									size="8" />
								<input type="hidden" name="itemTypeIds"
									value="${rewgood.itemType.id}" />
							</td>
							<td align="center">
								<input name="" type="text" disabled="disabled"
									value="${rewgood.itemType.name}" size="8" />
							</td>
							<td align="center">
								<input name="stoschgood.itemType.bondedNo" type="text"
									disabled="disabled" value="${rewgood.itemType.bondedNo}"
									size="8" />
							</td>
							<td align="center">
								<input name="qualitynums" type="text" disabled="disabled"
									value="${rewgood.factno}" size="8" />
							</td>
							<td align="center">
								<input name="stonums" type="text" size="8" class="checkEmptyforall checkNumforall"/>
							</td>
							<td align="center">
								<select class="selectone" name="departmentIds">
									<option value="">
										请选择
									</option>
									<c:forEach items="${departments}" var="dpt">
										<option value="${dpt.id}">
											${dpt.dptName}
										</option>
									</c:forEach>
								</select>

							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<table class="btn">
				<tr>
					<td>
						<input type="submit" name="SYS_SET" value=" 提 交 " class="frm_btn">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
