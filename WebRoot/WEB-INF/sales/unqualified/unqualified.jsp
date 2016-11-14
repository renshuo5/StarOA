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
		<link rel="stylesheet" href="<%=basePath %>css/vip.css"
			type="text/css">
		<script type="text/javascript" src="<%=basePath %>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath %>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript"
			src="<%=basePath %>My97DatePicker/WdatePicker.js"></script>

	</head>
	<body>

		<form
			action="sales/return/unqualified/unqualified_add?returnedId=${returned.retid }"
			method="post">
			<input type="hidden" name="returned.retid" value="${returned.retid}">
			<input type="hidden" name="buhege" value='0' />
			<table class="title">
				<tr>
					<td>
						不合格件报告单
					</td>
				</tr>
			</table>
			<table class="addTable" id="editTable">
				<tr>
					<td colspan="2" align="center">
						<div align="left">
							型号名称：
							<select name="unqualified.itemType.id">
								<option>
									请选择
								</option>
								<c:forEach items="${retgoods}" var="ret">
									<option value="${ret.itemType.id}">
										${ret.itemType.name}
									</option>
								</c:forEach>
							</select>
							*
						</div>
					</td>
					<td colspan="1" align="center">
						<div align="left">
							报告单位：
							<select name="unqualified.departmentRep.id">
								<option>
									请选择
								</option>
								<c:forEach items="${departments}" var="dpt">
									<option value="${dpt.id}">
										${dpt.dptName}
									</option>
								</c:forEach>
							</select>
							*
						</div>
					</td>

					<td colspan="1" align="center">
						<div align="left">
							报告人：

							<input id="employeeNameId_2" type="text" disabled="disabled"
								size="5" value="" align="left" />
							<input type="hidden" id="employeeIdId_2"
								name="unqualified.reportper.empId">
							<input type="button" value="选择" class="frm_btn"
								onclick="openWin('<%=basePath%>persons/employee/employee_selectInput?paname=2','人员选择',800, 600, 1);return false">
						</div>
					</td>

					<td colspan="2" align="center">
						<div align="left">
							负责人：
							<input id="employeeNameId_1" type="text" disabled="disabled"
								size="5" value="" align="left" />
							<input type="hidden" id="employeeIdId_1"
								name="unqualified.rebper.empId">
							<input type="button" value="选择" class="frm_btn"
								onclick="openWin('<%=basePath%>persons/employee/employee_selectInput?paname=1','人员选择',800, 600, 1);return false">
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<div align="left">
							不合格数量：
							<input type="text" size="13" name="unqualified.num" />
						</div>
					</td>
					<td colspan="1" align="center">
						<div align="left">
							接收单位：
							<select name="unqualified.departmentRec.id">
								<option>
									请选择
								</option>
								<c:forEach items="${departments}" var="ret">
									<option value="${ret.id}">
										${ret.dptName}
									</option>
								</c:forEach>
							</select>
							*
						</div>
					</td>
					<td colspan="1" align="center">
						<div align="left">
							接收人：
							<input id="employeeNameId_0" type="text" disabled="disabled"
								size="5" value="" align="left" />
							<input type="hidden" id="employeeIdId_0"
								name="unqualified.recper.empId">
							<input type="button" value="选择" class="frm_btn"
								onclick="openWin('<%=basePath%>persons/employee/employee_selectInput?paname=0','人员选择',800, 600, 1);return false">
						</div>
					</td>
					<td colspan="2" align="center">
						<div align="left">
							接收日期：
							<input id="d244" type="text" class="Wdate"
								onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
							<input type="hidden" id="d244_2" name="unqualified.recedate"
								value="" />
						</div>
					</td>
				</tr>
				<tr>
					<th width="10%">
						不合格编码*
					</th>
					<th width="15%">
						不合格状态
					</th>
					<th width="15%">
						发现日期
					</th>
					<th width="25%">
						负责部门处理情况
					</th>
					<th width="8%">
						添加
					</th>
					<th width="8%">
						删除
					</th>
				</tr>
				<!---------------------------LOOP START------------------------------>

				<tr id="rowTemplete_0">
					<td>
						<div align="center">
							<input type="text" name="unmcode" />
						</div>
					</td>
					<td>
						<div align="center">
							<input type="text" name="unmstatus" />
						</div>
					</td>
					<td>
						<div align="center">
							<input id="d244_0" type="text" class="Wdate"
								onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2_0',skin:'whyGreen'})" />
							<input type="hidden" id="d244_2_0" name="fdate" />
						</div>
					</td>
					<td>
						<div align="center">
							<input type="text" name="bdepartment" />
						</div>
					</td>
					<td>
						<div align="center">
							<img src="<%=basePath %>images/add.png"
								onclick="addBatchRow(this)" />
						</div>
					</td>
					<td>
						<div align="center">
							<img src="<%=basePath %>images/del.png"
								onclick="deleteBatchRow(this)" />
						</div>
					</td>
				</tr>
				
				<tr>
				   <td colspan="6">
					<div align="center"> 
						<input type="submit" value=" 提 交 " class="frm_btn">
					</div>
				  </td>
				</tr>




			</table>
		</form>
	</body>
</html>