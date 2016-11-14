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
		<title>收料通知单</title>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>


		<form action="warehouse/rewinder/rewinder_add" method="post">

			<table class="title editTable">
				<tr>
					<td>
						收料通知单
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr >
					<td>
							供货单位：
					</td>
					<td>
					<input type="text" name="rewinder.suplyu" disabled="disabled" value="${rewinder.suplyu}"/>
						
					</td>
				</tr>
				<tr  >
					<td>
					
							编制日期：
					</td>
					<td>
					<input type="text" name="rewinder.rew_date" disabled="disabled" value="${rewinder.rew_date}"/>
						
					</td>
				</tr>
				<tr  >
					<td>
							编号：
					</td>
					<td>
					<input type="text" name="rewinder.rew_id" disabled="disabled" value="${rewinder.rew_id}"/>
						
					</td>
				</tr>
				<tr  >
					<td>
							备注信息:
					</td>
					<td>
					<input type="text" name="rewinder.rewnote" disabled="disabled" value="${rewinder.rewnote}"/>
						
					</td>
				</tr>
				<tr  >
					<td>
							检验：
					</td>
					<td>
					<input type="text" name="rewinder.rewinspector.empName" disabled="disabled" value="${rewinder.rewinspector.empName}"/>
						
					</td>
				</tr>
				<tr  >
					<td>
							仓管:
					</td>
					<td>
					<input type="text" name="rewinder.whmanager.empName" disabled="disabled" value="${rewinder.whmanager.empName}"/>
						
					</td>
				</tr>
				<tr  >
					<td>
							采购 :
					</td>
					<td>
					<input type="text" name="rewinder.buyerEmployee.empName" disabled="disabled" value="${rewinder.buyerEmployee.empName}"/>
						
					</td>

				</tr>
			</table>
			<table class="list">

				<tr>
					<th >
							保税号
					</th>
					<th>
							品      名
					</th>
					<th >
							型 号 规 格
					</th>
					<th>
							单位
					</th>
					<th >
							数量
					</th>
					<th >
							单价
					</th>
					<th >
							金额
					</th>
					<th>
							检验
					</th>
					<th>
							备注
					</th>
				</tr>
				<c:forEach items="${rewgoods}" var="rewgood">

					<tr>
						<td align="center">
							${rewgood.bsno}
							<br>
						</td>
						<td align="center" valign="top">
							${rewgood.itemType.item.name}
						</td>
						<td align="center" valign="top">
							${rewgood.itemType.name}
						</td>
						<td align="center" valign="top">
							${rewgood.rewunit}
						</td>
						<td align="center" valign="top">
							${rewgood.factno}
						</td>
						<td align="center" valign="top">
							${rewgood.rewuprice}
						</td>
						<td align="center" valign="top">
							${rewgood.rewprice}
						</td>
						<td align="center" valign="top">
							${rewgood.rewexamine}
						</td>
						<td align="center" valign="top">
							${rewgood.rewnote}
						</td>
					</tr>
				</c:forEach>
			</table>
			<table class="btn" style="width:100%">
				<tr>
					<td>
					<c:if test="${shownum ==0}">
						<input type="button" name="SYS_SET"value="确定"
							class="frm_btn" size=5
							onclick="javascript:self.location='<%=basePath%>warehouse/rewinder/rewinder_examineList'" />
						</c:if>
						<c:if test="${shownum ==1}">
						<input type="button" name="SYS_SET"  value="确定"
							class="frm_btn" size=5
							onclick="javascript:self.location='<%=basePath%>warehouse/rewinder/rewinder_list'" />
						</c:if>
						<c:if test="${shownum ==2}">
						<input type="button" name="SYS_SET"  value="确定"
							class="frm_btn" size=5
							onclick="javascript:self.location='<%=basePath%>warehouse/rewinder/rewinder_unqualifylist'" />
						</c:if>

					</td>
				</tr>
			</table>
		</form>

	</body>
</html>
