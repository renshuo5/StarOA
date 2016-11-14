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
		<title>领料单</title>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>
		<form action="warehouse/requisition/requisition_examine" method="post">
			<input type="hidden" name="requisitionId"
				value="${requisition.req_id}" />

			<table class="title" style="width:85%">
				<tr>
					<td>
						领料单：
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						单位：
					</td>
					<td>
					<input type="text" name="requisition.company" disabled="disabled" value="${requisition.company}"/>
						
					</td>
				</tr>
				<tr>
					<td>
						日期：
					</td>
					<td>
					<input type="text" name="requisition.reqDate" disabled="disabled" value="${requisition.reqDate}"/>
						
					</td>
				</tr>
				<tr>
					<td>
						领料人：
					</td>
					<td>
					<input type="text" name="requisition.pickingper" disabled="disabled" value="${requisition.pickingper.empName }"/>
						
					</td>
				</tr>
				<tr>
					<td>
						部门负责人：
					</td>
					<td>
						<input type="text" name="dptmanager" size="50" disabled="disabled"
							value="${requisition.dptmanager.empName}" maxlength="100" />
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						核准：
					</td>
					<td>
						<input type="text" name="confirmper.employee.empName" value="${confirmper.employee.empName}" disabled="disabled" size="50" maxlength="100" />
						<input type="hidden" name="requisition.confirmper.empId" value="${confirmper.employee.empId }"/>
						<font color="#FF0000">*</font>
					</td>
				</tr>

				<tr>
					<td>
						领料日期：
					</td>
					<td>
						<input id="d244" type="text" class="Wdate checkDateInfo"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" name="deliverDate" />
					</td>
				</tr>

			</table>
			<table class="list">

				<tr>
					<th>
						编号
					</th>
					<th>
						名 称
					</th>
					<th>
						规格型号
					</th>
					<th>
						计量单位
					</th>
					<th>
						申请数量
					</th>
					<th>
						实发数量
					</th>
					<th>
						单价
					</th>
					<th>
						金额
					</th>
					<th>
						用 途
					</th>
				</tr>
				<c:forEach items="${picgoods}" var="picgood">
					<tr>
						<td>
							${picgood.id}
						</td>
						<td>
							${picgood.itemType.item.name}
						</td>
						<td>
							${picgood.itemType.name}
						</td>
						<td>
							${picgood.calunit}
						</td>
						<td>
							${picgood.reqnum}
						</td>
						<td>
							<input type="text" class="checkNumforall" name="factnums" />
						</td>
						<td>
							${picgood.ruprice }
						</td>
						<td>
							${picgood.rprice }
						</td>
						<td>
							${picgood.userf }
						</td>

					</tr>
				</c:forEach>
			</table>
<table>
			<tr bgcolor="#f5f5f5">
				<td align="center">
					<input type="submit" name="SYS_SET" value=" 提 交 " class="frm_btn">
					 <input type="button" class="frm_btn" value="取消" onclick=window.close();>
				</td>
			</tr>
			</table>
		</form>
	</body>
</html>