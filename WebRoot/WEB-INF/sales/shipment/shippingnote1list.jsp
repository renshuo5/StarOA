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
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		 <script type="text/javascript" src="<%=basePath%>js/sales.js"></script>
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
				<TD style="text-align:right">
					<form action="sales/shipment/shippingnote1/shippingnote1_search"
						method="post">
						收货单位：
						<input type="text" name="shippingnote1.shi1send" class="itemname"/>
						<input class="frm_btn" type="submit" value="查询" />
						
					</form>

				</TD>				
			</TR>
		</table>


		<table class="title">
			<tr>
				<td>
					外 协 件 交 货 单 所 有 物 品
				</td>
			</tr>
		</table>

		<table class="list">

			<tr>
				<th>
					编（批）号
				</th>

				<th>
					收货单位
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
										
										<a href="#"
												onclick="openWin('sales/shipment/shippingnote1/shippingnote1_tasShow?shi1goodId=${shi1good.shi1gid}','addTaxboard',800,700);return false">
												冷冲件  
										  
										</c:if>
						<c:if test="${ null!= shi1good.tax}"> 
						
						<a href="#"
												onclick="openWin('sales/shipment/shippingnote1/shippingnote1_taxShow?shi1goodId=${shi1good.shi1gid}','addTaxboard',800,700);return false">
										 板卡
										</c:if>
					</td>
				</tr>
				
			</c:forEach>
			<!--------------------LOOP END----------------------------->
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="6" align="center" bgcolor="#EFF3F7" class="TableBody1"
						onmouseover=this.bgColor = '#DEE7FF';
onmouseout=this.bgColor='#EFF3F7';
>
						没有找到相应的记录
					</td>
				</tr>
			</c:if>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<%--
                               <tr>
							   <td colspan="2" >发送:${shippingnote1.shi1send} </td>
                               <td colspan="2" >接收:${shippingnote1.shi1receive}</td> 
                                <td colspan="2" >填单:${shippingnote1.shiw}</td> 
                               </tr>
                    
                
            
    --%>
		</table>

		<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
						<pg:param name="itemtype.name" />
						<pg:param name="itemtype.description" />
						<pg:first>
							<a href="${pageUrl}" id="firstpageurl">首页</a>
						</pg:first>
						<pg:prev>
							<a href="${pageUrl }">《</a>
						</pg:prev>
						<pg:pages>
							<c:choose>
								<c:when test="${currentPageNumber eq pageNumber}">
									<font color="red">${pageNumber }</font>
								</c:when>
								<c:otherwise>
									<a href="${pageUrl }">${pageNumber }</a>
								</c:otherwise>
							</c:choose>
						</pg:pages>
						<pg:next>
							<a href="${pageUrl }">》</a>
						</pg:next>
						<pg:last>
							<a href="${pageUrl }">尾页</a>
						</pg:last>
					</pg:pager>
					&nbsp;&nbsp;
				</th>
				<!-- 更改pagesize 开始-->
				<th align=left valign="middle" noWrap width="10%">
					<div style="height: 20px; overflow: hidden; valign: middle">
						<form
							action="<%=request
					.getAttribute("javax.servlet.forward.servlet_path")
					.toString().substring(1)%>">

							<input type="hidden" name="itemtype.name"
								value="${itemtype.name }" />

							<input type="hidden" name="itemtype.description"
								value="${itemtype.description}" />
							<select name="pagesize" onchange="this.form.submit()"
								style="height: 16px; overflow: hidden; valign: middle">
								<c:forEach begin="1" end="50" step="3" var="i">
									<option value="${i}"
										<c:if test="${pagesize eq i }">selected</c:if>>
										${i}
									</option>
								</c:forEach>
							</select>
							行/页

						</form>
					</div>

				</th>
			</tr>
		</table>
<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>

	</body>
</html>