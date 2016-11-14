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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>物料请购单</title>
		<link type="text/css" href="css/vip.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
	
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/purchase.js"></script>
			<script type="text/javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript">
	function add(offset) {
		eval( "document.all.price_" + offset + ".value = document.all.uprice_"+offset+".value*document.all.num_"+offset + ".value");
	}
</script>
	</head>
	<body>
		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>
		<form action="purchase/requisitions/requisitions_update" method="post">
			<input type="hidden" value="${requisitions.id}"
				name="requisitions.id">
			<table class="title">
    <tr>
		<td>物料请购单
		</td>
	</tr>
	</table>
			<table class="addTable" style="width:100%">
				<tr>
					<th>
						料号
					</th>
					<th>
						品名
					</th>
					<th>
						型号规格
					</th>
					<th>
						单机数
					</th>
					<th>
						单价
					</th>
					<th>
						订购数量
					</th>
					<th>
						价格(元)
					</th>
					<th>
						到货日期
					</th>
					<th>
						付款条件
					</th>
				</tr>

				<!---------------------------LOOP START------------------------------>
				<c:if test="${!empty resgoods}">
					<c:forEach items="${resgoods}" var="resgood" varStatus="sr">
						<tr align="center">
							<td>
								<input value="${resgood.itemtype.mCode}" size="15"
									disabled='disabled' />
								<input type="hidden" value="${resgood.itemtype.id}"
									name="itemtypeids" />
							</td>
							<td>
								<input value="${resgood.itemtype.item.name }" size="15"
									disabled='disabled' />
							</td>
							<td>
								<input value="${resgood.itemtype.name}" size="15"
									disabled='disabled' />
							</td>
							<td>
								<input name="unums" value="${resgood.unum}" size="10" class="checkNum checkEmpty"/>
							</td>
							<td>
								<input value="${resgood.uprice }" id="uprice_${sr.index }" size="10" disabled='disabled' />
								<input type="hidden" name="uprices" value="${resgood.uprice }"
									size="10" />
							</td>
							<td>
								<input value="${resgood.reqnum}" id="num_${sr.index }" onBlur="add(${sr.index })" size="12" name="reqnums" size="7" class="checkNum"/>
							</td>
							<td>
								<input value="${resgood.uprice*resgood.reqnum}" id="price_${sr.index }" size="15"
									disabled='disabled' />
							</td>
							<td>
								<input id="d244_${sr.index }" type="text" class="Wdate"
									value="${resgood.arrivaldate}"
									onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2_${sr.index }',skin:'whyGreen'})" />
								<input type="hidden" id="d2441_2_${sr.index }"
									value="${resgood.arrivaldate}" name="arrivaldates" />

							</td>
							<td>
								<input name="payments" value="${resgood.payment}" size="20" />
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<table class="addTable" style="width:100%">
				<tr>
					<td>
						供应商:
					</td>
					<td>
						<input type="text" id="quaprolistnameId" disabled="disabled"
							value="${requisitions.quaprolist.supplierinfo.supcname}" />
						<input type="hidden" name="quaprolistId" id="quaprolistIdId"
							value="${requisitions.quaprolist.id}" />
						<input id="supplierinfoe" type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>purchase/quaprolist/quaprolist_selectInput','selectQuaprolist',800, 600, 1);return false" />
					</td>
				</tr>
				<tr>
					<td>
						说明：
					</td>
					<td>
						<textarea name="requisitions.directions" cols="45" rows="5" class="itemname">${requisitions.directions}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						采购员：
					</td>
					<td>
						<input type="text" value="${auditUser.employee.empName}"
							disabled="disabled" />
						<input type="hidden" name="requisitions.buyer.empId"
							value="${auditUser.employee.empId}" />
					</td>
				</tr>
			</table>
			<table style="text-align:center" >
				<tr bgcolor="#f5f5f5">
					<td>
						<input type="submit" value=" 提 交 "  class="frm_btn"/>
					</td>
				</tr>
			</table>
		</form>
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>