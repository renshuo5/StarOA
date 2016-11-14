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
		<title>外协件发货单审核页面</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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


		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>



		<form action="sales/shipment/shippingnote1/shippingnote1_add"
			method="post">


			<table class="title">
				<tr>
					<td>
						外协件发货通知单
					</td>
				</tr>
			</table>
			<table class="list">
				<tr>
					<th>
						编（批）号
					</th>

					<th>
						收获单位
					</th>
					<th>

						部品名称
					</th>
					<th>

						规格型号
					</th>
					<th>
						数量（台）
					</th>
					<th>
						备注
					</th>
					<th>
						添加
					</th>
					<th>

						删除
					</th>

				</tr>

				<!-------------------------LOOP START---------------------------->

				<c:forEach items="${shi1goods}" var="shi1good">
					<c:if test="${shi1good.shippingnote1.shi1id==shippingnote1.shi1id}">
						<tr>
							<td>
								${shi1good.shitime}
							</td>
							<td>
								${shi1good.shi1unit}
							</td>
							<td>
								${shi1good.itemType.item.name }
							</td>
							<td>
								${shi1good.itemType.name }
							</td>
							<td>
								${shi1good.shi1no}
							</td>
							<td>

								${shi1good.shinote}
							</td>
						</tr>

					</c:if>
				</c:forEach>
				<!--------------------LOOP END----------------------------->
			</table>
			<table class="addTable">

				<tr>
					<td>
						发送:
					</td>
					<td>
						${shippingnote1.shi1send}
					</td>
				</tr>
				<tr>
					<td>
						接收:
					</td>
					<td>
						${shippingnote1.shi1receive}
					</td>
				</tr>
				<tr>
					<td>
						填单:
					</td>
					<td>
						${shippingnote1.shiw}
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>