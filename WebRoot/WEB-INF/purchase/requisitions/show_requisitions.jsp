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
		<script type="text/javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>
		<form action="purchase/requisitions/requisitions_list" method="post">
			<input type="hidden" value="${requisitions.id}"
				name="requisitions.id">
			<table class="title" style="width:85%">
				<tr>
					<td>
						物料请购单
					</td>
				</tr>
			</table>
			<table class="addTable">
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
								<input name="unums" value="${resgood.unum}" size="12"
									disabled='disabled' />
							</td>
							<td>
								<input value="${resgood.uprice }" size="12" disabled='disabled' />
							</td>
							<td>
								<input value="${resgood.reqnum}" size="12" disabled='disabled' />
							</td>
							<td>
								<input value="${resgood.uprice*resgood.reqnum}" size="15"
									disabled='disabled' />
							</td>
							<td>
								<input type="text" value="${resgood.arrivaldate}"
									disabled='disabled' />
							</td>
							<td>
								<input value="${resgood.payment}" size="20" disabled='disabled' />
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<table class="addTable">

				<tr>
					<td>
						供应商
					</td>
					<td>
						<input type="text" disabled="disabled"
							value="${requisitions.quaprolist.supplierinfo.supcname}" />
					</td>
				</tr>
				<tr>
					<td>
						说明：
					</td>
					<td>
						<textarea disabled='disabled' cols="45" rows="5">${requisitions.directions}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						公司主管：
					</td>
					<td>
						<input type="text" value="${requisitions.cmanager.empName}"
							size="10" disabled='disabled' />
					</td>
				</tr>
				<tr>
					<td>
						公司分管：
					</td>
					<td>
						<input type="text" value="${requisitions.bmanager.empName}"
							size="10" disabled='disabled' />
					</td>
				</tr>
				<tr>
					<td>
						部门主管：
					</td>
					<td>
						<input type="text" value="${requisitions.dmanager.empName}"
							size="10" disabled='disabled' />
					</td>
				</tr>
				<tr>
					<td>
						部门分管：
					</td>
					<td>
						<input type="text" value="${requisitions.dpmanager.empName}"
							size="10" disabled='disabled' />
					</td>
				</tr>
				<tr>
					<td>
						采购员：
					</td>
					<td>
						<input type="text" value="${requisitions.buyer.empName}" size="10"
							disabled='disabled' />
					</td>
				</tr>
			</table>
			<table style="width:85%; text-align:center" >
				<tr bgcolor="#f5f5f5">
					<td>
						<input type="submit" value="返回" class="frm_btn" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>