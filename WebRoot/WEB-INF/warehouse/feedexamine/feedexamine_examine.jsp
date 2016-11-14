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
		<title>进料验收单</title>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>


		<form action="warehouse/feedexamine/feedexamine_examinepgb" method="post">
			<input type="hidden" name="feedexamineId"
				value="${feedexamine.fee_id}" />

			<table class="title" style="width:85%">
				<tr>
					<td >进料验收单：
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
							类别：
					</td>
					<td>
					<input type="text" name="feedexamine.feestyle" disabled="disabled" value="${feedexamine.feestyle}"/> 
						
					</td>
				</tr>

				<tr >
					<td>
							来源：
					</td>
					<td>
					<input type="text" name="feedexamine.fromt" disabled="disabled" value="${feedexamine.fromt}"/> 
						
					</td>
				</tr>

				<tr>
					<td>
							进货单号：
					</td>
					<td>
					<input type="text" name="feedexamine.fee_id" disabled="disabled" value="${feedexamine.fee_id}"/> 
						
					</td>

				</tr>

				<tr >
					<td>
							供应商：
					</td>
					<td>
					<input type="text" name="feedexamine.supplier.supplierinfo.supcname" disabled="disabled" value="${feedexamine.supplier.supplierinfo.supcname}"/> 
						
					</td>

				</tr>

				<tr>
					<td>
							订单号：
					</td>
					<td>
					<input type="text" name="feedexamine.orderno" disabled="disabled" value="${feedexamine.orderno}"/> 
						
					</td>
				</tr>

				<tr>
					<td>
							日期：
					</td>
					<td>
					<input type="text" name="feedexamine.feeDate" disabled="disabled" value="${feedexamine.feeDate}"/> 
						
					</td>

				</tr>

				<tr>
					<td>
							采购：
					</td>
					<td>
					<input type="text" name="feedexamine.feebuyer.empName" disabled="disabled" value="${feedexamine.feebuyer.empName}"/> 
						
					</td>
				</tr>
				<tr >
					<td>
							检验：
					</td>
					<td>
						<input type="text" disabled="disabled" size="10" maxlength="100" 
							value="${finspector.employee.empName }"/>
						<input type="hidden" disabled="disabled" name="feedexamine.finspector.empId" value="${finspector.employee.empId}"/>
					</td>
				</tr>

			</table>
			<table class="list">
				<tr>
					<th>
						保税号
					</th>
					<th>
						品名
					</th>
					<th>
						型号规格
					</th>
					<th>
						货单数量
					</th>

					<th>
						检验结果
					</th>
					<th>
						合格数
					</th>
					<th>
						备注
					</th>
				</tr>
				<!---------------------------LOOP START------------------------------>
				<c:forEach items="${feegoods}" var="feegood">
					<tr>
						<td>
							<div align="center">
								${feegood.itemType.bondedNo }
							</div>
						</td>
						<td>
							<div align="center">
								${feegood.itemType.item.name }
							</div>
						</td>
						<td>
							<div align="center">
								${feegood.itemType.name }
							</div>
						</td>
						<td>
							<div align="center">
								${feegood.fpnum }
							</div>
						</td>
						<td align="center">
							<div>
								<select name="exresults" >
									<option value="true">
										合格
									</option>
									<option value="false">
										不符标准
									</option>
									<option value="false">
										不合格
									</option>
								</select>
							</div>
						</td>
						<td>
							<div align="center">
								<input type="text" name="factnos" class="checkNumforall"/>
							</div>
						</td>
						<td align="center">
							<div>
								${feegood.fnote}
							</div>
						</td>
					</tr>
				</c:forEach>
				</table>
				<table>
					<tr bgcolor="#f5f5f5">
						<td align="center">
								<input type="submit" name="SYS_SET" value=" 提 交 "
									class="frm_btn">
								 <input type="button" class="frm_btn" value="取消" onclick=window.close();>
						</td>
					</tr>
				</table>
		</form>

	</body>
</html>
