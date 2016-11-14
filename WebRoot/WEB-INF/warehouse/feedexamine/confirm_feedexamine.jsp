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
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>


		<form action="warehouse/feedexamine/feedexamine_confirm" method="post">
			<input type="hidden" name="feedexamineId" value="${feedexamine.fee_id}" />


			<table class="title" style="width:85%">
				<tr>
					<td>进料验收单：
					</td>
				</tr>
		</table>
		<table class="addTable">
				<tr>
					<td>
							类别：
					</td>
					<td>
						${feedexamine.feestyle}
					</td>
				</tr>
				<tr>
					<td>
							来源：
					</td>
					<td>
						${feedexamine.feestyle}
					</td>
				</tr>
				<tr>
					<td>
							供应商：
					</td>
					<td>
						${feedexamine.supplier.supplierinfo.supcname}
					</td>
				</tr>
				<tr>


					<td>
							订单号：
					</td>
					<td>
						${feedexamine.orderno}
					</td>
				</tr>
				<tr>
					<td>
							日期：
					</td>
					<td>
						${feedexamine.feeDate}
					</td>

				</tr>
				<tr>
					<td>
							采购：
					</td>
					<td>
						${feedexamine.feebuyer.empName}
					</td>
				</tr>
				
			</table>
			<table class="list">
				<tr>
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
						确认实际数量
					</th>
					<th>
						备注
					</th>
				</tr>
		
			<c:forEach items="${feegoods}" var="feegood">
				<tr>
					<td align="center" valign="top">
						<input type="text" size="10" id="itemNameId_0" disabled="disabled" value="${feegood.itemType.item.name}"/>
					</td>
					<td align="center" valign="top">
						<input type="text" size="10" name="itemTypeNameIds" disabled="disabled" value="${feegood.itemType.name}"/>
							

					</td>
					<td>
						<div align="center">
							<input type="text" disabled="disabled" name="fpnums" value="${feegood.fpnum}"/>
						</div>
					</td>
					<td align="center">
						<input title=""/>
					
						<input type="checkbox" name="confirmnums"  class="checkboxEmpty"/>
					</td>
					<td>
						<div align="center">
							<input type="text" name="fnotes" value="${feegood.fnote}"/>
						</div>
					</td>
				</tr>

		</c:forEach>
			</table>
			<table>
				<tr bgcolor="f5f5f5">
					<td>
						<div align="center">
							<input type="submit" name="SYS_SET" value=" 提 交 " class="frm_btn">
							 <input type="button" class="frm_btn" value="取消" onclick=window.close();>
						</div>
					</td>
				</tr>
			</table>
			
		</form>

	</body>
</html>
