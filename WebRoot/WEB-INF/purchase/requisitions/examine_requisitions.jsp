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
		<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
		<form action="purchase/requisitions/requisitions_update" method="post">
			<input type="hidden" value="${requisitions.id}"
				name="requisitions.id">
			<table class="title">
				<tr>
					<td>
						物料请购单
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
								<input value="${resgood.unum}" disabled='disabled' size="7" />
								<input type="hidden" name="unums" value="${resgood.unum}" />
							</td>
							<td>
								<input value="${resgood.uprice }" size="10" disabled='disabled' />
								<input type="hidden" name="uprices" value="${resgood.uprice }"
									size="7" />
							</td>
							<td>
								<input value="${resgood.reqnum}" size="12" disabled='disabled' />
								<input type="hidden" name="reqnums" value="${resgood.reqnum}"
									size="7" />
							</td>
							<td>
								<input value="${resgood.uprice*resgood.reqnum}" size="15"
									disabled='disabled' />
							</td>
							<td>
							    <input value="${resgood.arrivaldate}" disabled="disabled"/>
								<input type="hidden" name="arrivaldates" value="${resgood.arrivaldate}" />
							</td>
							<td>
								<input value="${resgood.payment}" size="20" disabled="disabled"/>
								<input type="hidden" name="payments" value="${resgood.payment}" />
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
					    <input value="${requisitions.quaprolist.supplierinfo.supcname}" disabled="disabled"/>
						<input type="hidden" name="quaprolistId" value="${requisitions.quaprolist.id}" />
					</td>
				</tr>
				<tr>
					<td>
						说明：
					</td>
					<td>
						<textarea disabled="disabled" cols="45" rows="5">${requisitions.directions}</textarea>
						<input type="hidden" name="requisitions.directions" value="${requisitions.directions}"/>
					</td>
				</tr>
			</table>
			<table class="addTable" style="width:100%">
				<c:if test="${step==2}">
				<tr>
					<td>
						部门主管：
					</td>
					<td>
						<c:if test="${null!=requisitions.dmanager.empId}">
					    <input type="text" value="${requisitions.dmanager.empName}" disabled="disabled"/>
					    <input type="hidden" value="${requisitions.dmanager.empId}" name="requisitions.dmanager.empId"/></c:if>
					    <c:if test="${null==requisitions.dmanager.empId}">
					    <input  disabled="disabled"/>
					    </c:if>
					</td>
				</tr>
				<tr>
					<td>
						部门分管：
					</td>
					<td>
					    <c:if test="${null!=requisitions.dpmanager.empId}">
						<input type="text" value="${requisitions.dpmanager.empName}" disabled="disabled"/>
					    <input type="hidden" value="${requisitions.dpmanager.empId}" name="requisitions.dpmanager.empId"/></c:if>
						<c:if test="${null==requisitions.dpmanager.empId}">
					    <input  disabled="disabled"/>
					    </c:if>
					</td>
				</tr>
				</c:if>
				<tr>
					<td>
						采购员：
					</td>
					<td>
						<input type="text" value="${requisitions.buyer.empName}" disabled="disabled"/>
					    <input type="hidden" value="${requisitions.buyer.empId}" name="requisitions.buyer.empId"/>
					</td>
				</tr>
				<c:if test="${step==1}">
				<tr>
					<td>
						部门主管
					    <input type="checkbox" name="requisitions.dmanager.empId" value="${auditUser.employee.empId}"/>
					</td>
					<td>
						<input type="text" value="${auditUser.employee.empName}" disabled="disabled" size="10">
					
					    <input type="checkbox" name="requisitions.dpmanager.empId" value="${auditUser.employee.empId}"/>
						部门分管
					</td>
				</tr>
				</c:if>
				<c:if test="${step==2}">
				<tr>
					<td>
						公司主管
					    <input type="checkbox" name="requisitions.cmanager.empId" value="${auditUser.employee.empId}"/>
					</td>
					<td>
						<input type="text"  value="${auditUser.employee.empName}" disabled="disabled" size="10">
					
					    <input type="checkbox" name="requisitions.bmanager.empId" value="${auditUser.employee.empId}"/>
						公司分管
				</tr>
				</c:if>
			</table>
			<table style="text-align:center" >
				<tr bgcolor="#f5f5f5">
					<td>
						<input type="submit" value=" 提 交 " class="frm_btn" />
					</td>
				</tr>
			</table>
		</form>
		
		<script type="text/javascript">
     	$(document).ready(function() {
            //隐藏模板tr
            
            	$("#tab1").hide();
            	$("#tab2").hide();
        })
    </script>
		<script type="text/javascript">   
        	function   hidslt1()   {   
	
        		$("#tab1").toggle("slow");   
        		$("#tab3").toggle("slow"); 
			}
			
    </script>
    		<script type="text/javascript">   
        	function   hidslt2()   {   
	
        		$("#tab1").toggle("slow");   
        		//$("#che1").checked=true;
        		$("#tab3").toggle("slow"); 
			}
			
    </script>
	</body>
</html>