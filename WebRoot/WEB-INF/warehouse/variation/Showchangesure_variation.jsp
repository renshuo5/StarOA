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
<html>
	<head>
		<base href="<%=basePath%>">
		<title>物料变异</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<script language="javascript" src="js/public.js"></script>
		<script language="javascript" src="js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/highLight.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
		<form action="<%=basePath%>warehouse/variation/variation_addscheck"
			method="post">
			<input type="hidden" name="vargood.vag_id" value="${vargood.vag_id }" />
			<table class="title">
				<tr>
					<th>
						物料变异审批表
					</th>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						单位：
					</td>
					<td>
						<input type="text" disabled="disabled"
							value="${vargood.variation.dpt_id.dptName }" />
					</td>
				</tr>
				<tr>
					<td>
						申报日期：
					</td>
					<td>
						<input type="text" disabled="disabled"
							value="<fmt:formatDate value='${vargood.variation.vardate }'/>" />
					 <input type="hidden" value="${vargood.variation.var_id }" name="vardateId">
							
					</td>
				</tr>
				<tr>
					<td>
						代码（料号）
					</td>
					<td>
						<input type="text" disabled="disabled"
							value="${vargood.itemType.mCode }" name="vargood.itemType.mCode" />
							 <input type="hidden" value="${vargood.itemType.id }" name="itemType0">
					</td>
				</tr>
				<tr>
					<td>
						物品名称
					</td>
					<td>
						<input type="text"
							value="${vargood.itemType.item.name }-${vargood.itemType.name}"
							disabled="disabled" name="vargood.itemType.name" />
						<input type="hidden" value="${vargood.itemType.id }"
							name="itemTypeId" />
					</td>
				</tr>
				<tr>
					<td>
						适用机种
					</td>
					<td>
						<input type="text" value="${vargood.forstyle }" name="vargood.forstyle"
							readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td>
						接料/入库时间
					</td>
					<td>
						<input type="text" readonly="readonly" name="vargood.etdate"
							value="<fmt:formatDate value='${vargood.etdate }'/>" />
					</td>
				</tr>
				<tr>
					<td>
						接料/入库数量
					</td>
					<td>
						<input type="text" readonly="readonly" value="${vargood.etno }" name="vargood.etno" />
					</td>
				</tr>
				<tr>
					<td>
						退换/隔离数量
					</td>
					<td>
						<input type="text" readonly="readonly" value="${vargood.chno }" name="vargood.chno" />
					</td>
				</tr>
				<tr>
					<td>
						变异现象或原因
					</td>
					<td>
						<textarea readonly="readonly" id="textarea" cols="50" rows="5" name="vargood.vagReason">${vargood.vagReason }</textarea>
					</td>
				</tr>
				<tr>
					<td>
						品管（设计）意见
					</td>
					<td>
						&nbsp;&nbsp;
						<input type="radio" name="vargood.variation.quaadvice" value="3" disabled="disabled" />
						可代用&nbsp;&nbsp;
						<input type="radio" name="vargood.variation.quaadvice" value="1" disabled="disabled" />
						报废 &nbsp;&nbsp;
						<input type="radio" name="vargood.variation.quaadvice" value="2" checked="true"/>
						换货<input type="hidden" name=""> 
						<br />
						<textarea name="vargood.variation.quanote" id="textarea2" disabled="disabled"
							cols="80" rows="8">
							${vargood.variation.quanote }
						</textarea>
						<input type="hidden" value="${vargood.variation.var_id }" name="variationId0">
						
					</td>
				</tr>
				<tr>
					<td>
						备注
					</td>
					<td>
						<textarea name="vargood.variation.varnote" disabled="disabled"
							id="textarea3" cols="50" rows="5">${vargood.variation.varnote }</textarea>
						<input type="hidden" value="${vargood.variation.var_id }" name="variationId">
							
							
					</td>
				</tr>
				<tr>
					<td>
						单位主管：
					</td>
					<td>
						<input type="text" value="${vargood.variation.umanager.empName }"
							disabled="disabled" />
						<input type="hidden" value="${vargood.variation.umanager.empId }" name="umanagerId">
							
					</td>
				</tr>
				<tr>
					<td>
						申报人：
					</td>
					<td>
						<input type="text" value="${vargood.variation.appper.empName }"
							disabled="disabled" />
							<input type="hidden" value="${vargood.variation.appper.empId }" name="apperId">
							<input type="hidden" value="${vargood.variation.var_id}" >
					</td>

				</tr>
				<tr>
					<td>
						车间确认：
					</td>
					<td>

						<input type="text" disabled="disabled"
							value="${addUser.employee.empName}" />
						<input type="hidden" name="cscheckId"
							value="${addUser.employee.empId }" />

					</td>
				</tr>
				
			</table>


			<table>
				<tr>
					<td>
						<input type="submit" value="确定" class="frm_btn" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
