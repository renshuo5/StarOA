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
		<title>外协件发货单</title>
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


	<%--查询--%>
			<table>
				<TR>
					<TD style="text-align: right">

	                   <form action="sales/shipment/shippingnote1/shippingnote1_search"
							method="post">
							交货单位：
							<input type="text" name="warehouse.warsn" />

							<input class="frm_btn" type="submit" value="查询" />
						</form>
					</TD>
				</TR>
			</table>


        <table class="title">
			<tr>
				<td>
					外协件交货单
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
						状态
					</th>
					<th>
						备注
					</th>


				</tr>

				<!-------------------------LOOP START---------------------------->
				<c:forEach items="${shi1goods}" var="shi1good">
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
							<c:if test="${ null == shi1good.tax && null==shi1good.tas}"> 
										  待检验
										</c:if>
							<c:if test="${ null!= shi1good.tax || null!= shi1good.tas}"> 
										 已检验
										</c:if>

						</td>
						<td>

							<c:if test="${ null != shi1good.tas}"> 
										  冷冲件
										</c:if>
							<c:if test="${ null!= shi1good.tax}"> 
										 板卡
										</c:if>
						</td>
					</tr>
				</c:forEach>
				<!--------------------LOOP END----------------------------->

		</table><table class="addTable" style="width:100%">
			
				<tr>
					<td>
						发货人:
					<input type="text" value="${shippingnote1.shi1send}"  disabled="disabled">
					
					</td>
				
					<td>
						接收人:
					<input type="text" value="${shippingnote1.shi1receive}"  disabled="disabled">
					</td>
				
					<td>
						填单:
					<input type="text" value="${shippingnote1.shiw.empName}"  disabled="disabled">
					</td>
				</tr>
	
	</table>
        <table class="btn" style="width:100%">
			   <tr>
				<td align="center">

					<input type="button" name="SYS_SET" align="center" value="确定"
						class="frm_btn" size=5
						onclick="javascript:self.location='<%=basePath%>sales/shipment/shippingnote1/shippingnote1_sendedAdd?shippingnote1Id=${shippingnote1.shi1id }&flag=${flag }'" />

				</td>
			</tr>

	
	</body>
</html>