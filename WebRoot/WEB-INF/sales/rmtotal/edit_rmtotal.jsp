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
		<title>退货统计修改页面</title>
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
		<form action="sales/return/rmtotal/rmtotal_update" method="post">
			<input type="hidden" name="rmtotal.rmt_id" value="${rmtotal.rmt_id}">


			<table class="title editTable">
				<tr>
					<td>
						退 货 统 计 月 报 表 编 辑
					</td>
				</tr>
			</table>


			<table class="addTable">
				<tr>
					<td>
						品名:
					</td>
					<td>
						<select name="">
							${rmtotal.itemType.item.name}
							<c:forEach items="${retgoods}" var="ret">

								<option value="${ret.itemType.item.id}">
									${ret.itemType.item.name}
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						型号规格:
					</td>
					<td>
						<select name="rmtotal.itemType.id">
							<option value="${rmtotal.itemType.id}">
								${rmtotal.itemType.name}
							</option>
							<c:forEach items="${retgoods}" var="ret">
								<option value="${ret.itemType.id}">
									${ret.itemType.name}
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						部品代码:
					</td>
					<td>
						<select name="">
							${rmtotal.itemType.mCode}
							<c:forEach items="${retgoods}" var="ret">

								<option value="${ret.itemType.item.id}">
									${ret.itemType.mCode}
								</option>
							</c:forEach>
						</select>
					</td>

				</tr>
				<tr>
					<td>
						退货数:
					</td>
					<td>
						<input name="rmtotal.rnum" type="text" value="${rmtotal.rnum}">
					</td>
				</tr>
				<tr>
					<td>
						修复合格数:
					</td>
					<td>
						<input name="rmtotal.repairnum" type="text"
							value="${rmtotal.repairnum}">
					</td>
				</tr>
				<tr>
					<td>
						报废数:
					</td>
					<td>
						<input name="rmtotal.scrapnum" type="text"
							value="${rmtotal.scrapnum}">
					</td>
				</tr>
				<tr>
					<td>
						累计退货数:
					</td>
					<td>
						<input name="rmtotal.rtotal" type="text" value="${rmtotal.rtotal}">
					</td>
				</tr>
				<tr>
					<td>
						本月送货数:
					</td>
					<td>
						<input name="rmtotal.msendnum" type="text"
							value="${rmtotal.msendnum}">
					</td>
				</tr>
				<tr>
					<td>
						累计送货数:
					</td>
					<td>
						<input name="rmtotal.tsendnum" type="text"
							value="${rmtotal.tsendnum}">
					</td>
				</tr>
				<tr>
					<td>
						本月不合格率:
					</td>
					<td>
						<input name="rmtotal.munqrate" type="text"
							value="${rmtotal.munqrate}">
					</td>
				</tr>
				<tr>
					<td>
						累计不合格率:
					</td>
					<td>
						<input name="rmtotal.tunqrate" type="text"
							value="${rmtotal.tunqrate}">
					</td>
				</tr>
			</table>
			<table  style="text-align:center">
				<tr>
					<td align="center">
						<input type="submit" value=" 提 交 " class="frm_btn">
					</td>
				</tr>
			</table>



		</form>
	</body>
</html>

