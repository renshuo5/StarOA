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
		<title>外协件发货物列表</title>
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

		
		<input type="hidden" name="shippingnote1.shi1id"
			value="${shippingnote1.shi1id}">


		<table class="title">
			<tr>
				<td>
					质量检验外协件发货物审核列表
				</td>
			</tr>
		</table>
		<table class="list">
			<tr>
				<th>
					序号
				</th>

				<th>
					编（批）号
				</th>
				<th>

					收获单位
				</th>
				<th>
					名称
				</th>

				<th>
					型号规格
				</th>
				<th>
					数量（台）
				</th>
				<th>
					状态
				</th>

				<th  colspan="2">
					出荷报告单
				</th>

			</tr>
			<!---------------------------LOOP START------------------------------>


			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="shippingnote1" varStatus="vs">
					<c:forEach items="${shi1goods}" var="shi1good">
						<c:if
							test="${shi1good.shippingnote1.shi1id==shippingnote1.shi1id}">
							<tr>

								<td>

									<a
										href="sales/shipment/shippingnote1/shippingnote1_examineInput?Shippingnote1Id=${shippingnote1.shi1id}">
										${vs.count} 
								</td>
								<td>

									${shi1good.shitime}

								</td>
								<td>


									${shi1good.shi1unit}


								</td>
								<td>

									${shi1good.itemType.item.name}

								</td>
								<td>

									${shi1good.itemType.name}

								</td>
								<td>

									${shi1good.shi1no}

								</td>
								<td>


									<c:if test="${ null != shi1good.tax || null!= shi1good.tas}"> 
										  已处理
										</c:if>
									<c:if test="${ null== shi1good.tax && null== shi1good.tas}"> 
										 待处理
										</c:if>

								</td>

								<td>

									<c:if test="${ null != shi1good.tax}"> 
										  板卡
										</c:if>
									<c:if test="${ null== shi1good.tax && null== shi1good.tas}">

										<a href="#"
											onclick="openWin('sales/shipment/shippingnote1/shippingnote1_taxboardInput?shi1goodId=${shi1good.shi1gid}','addTaxboard',800,700,1);return false">


											板卡 
									</c:if>

								</td>

								<td>
									<div align="center">

										<c:if test="${ null != shi1good.tas}"> 
										   冷冲件
										</c:if>
										<c:if test="${ null== shi1good.tas && null==shi1good.tax}">

											<a href="#"
												onclick="openWin('sales/shipment/shippingnote1/shippingnote1_taxstamInput?shi1goodId=${shi1good.shi1gid}','addTaxboard',800,700);return false">
												冷冲件 
										</c:if>
								</td>

							</tr>
						</c:if>
					</c:forEach>

				</c:forEach>
			</c:if>
		</table>
		<table>
			<tr bgcolor="#f5f5f5">
				<td align="center">

					<input type="button" align="center" value="确定" class="frm_btn"
						size=5
						onclick="javascript:self.location='<%=basePath%>sales/shipment/shippingnote1/shippingnote1_goodlistAdd?shippingnote1Id=${shippingnote1.shi1id }'" />

				</td>
			</tr>
		</table>


		
	</body>
</html>