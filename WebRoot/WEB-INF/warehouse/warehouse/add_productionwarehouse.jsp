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
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<title>产品进仓单</title>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		 <script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>


		<form action="warehouse/warehouse/warehouse_add" method="post">


			<table class="title" style="width:85%">
				<tr>
					<td >登记产品进仓单
					</td>
				</tr>
			</table>
			<table class="addTable">

				<tr>
					<td>
							生协号：
					</td>
					<td>
						<input type="text" name="warehouse.warsn" size="50"
							maxlength="100" class="checkEmptyShowInfo"/>
						<font color="#FF0000">*</font>

					</td>
				</tr>




				<tr>
					<td>
							产品名称：
						 
					</td>
					<td>

						<input type="text" class="checkEmptyShowInfo" size="10" id="itemNameId" disabled="disabled">
						<input type="hidden" name="itemId" id="itemIdId">
						
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
							规格型号：
						 
					</td>
					<td>

						<input type="text" class="selectin" name="warehouse.itemType.name"
							id="itemTypeNameId" disabled="disabled"></input>
						<input type="hidden" name="itemTypeId" id="itemTypeIdId"></input>
						<input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false">

						<font color="#FF0000">*</font>
					</td>
				</tr>

				<tr>
					<td>
							产品序列号：
						 
					</td>
					<td>
						<input type="text" class="checkEmptyShowInfo" name="warehouse.prno" size="50" maxlength="100" class="itemname"/>
						<font color="#FF0000">*</font>

					</td>
				</tr>


				<tr>
					<td>
							数量：
						 
					</td>
					<td>
						<input type="text" name="warehouse.warno" size="50"
							maxlength="100" class="checkEmptyShowInfo checkNumShowInfo"/>
						<font color="#FF0000">*</font>

					</td>
				</tr>
				<tr>
					<td>
							生产日期：
						 
					</td>
					<td>
						<input id="d244" type="text" class="Wdate checkDateInfo"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2"
							name="warehouse.dateOfManufacture" />
					</td>

				</tr>


				<tr>
					<td>
							生产单位：
						 
					</td>
					<td>
						<select class="selectone" name="warehouse.prunit">
							<option value="">请选择</option>
				<c:forEach items="${departments}" var="prunit">
				<option value="${prunit.dptName}">${prunit.dptName}</option>
				</c:forEach>
				</select>
						<font color="#FF0000">*</font>

					</td>
				</tr>

				<tr>
					<td>
							检验人：
						 
					</td>
					<td>
						<select class="selectone" name="warehouse.productionAcceptance">
						<option value="">请选择</option>
				<c:forEach items="${productionAcceptancesEmployees}" var="employ">
				<option value="${employ.empName}">${employ.empName}</option>
				</c:forEach>
				</select>
				<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
							生产部验收：
						 
					</td>
					<td>
						<input  type="text" disabled="disabled" size="50"
							maxlength="100" value="${winpector.employee.empName}" />
							<input type="hidden" name="warehouse.winpector.empId" value="${winpector.employee.empId}" />
						<font color="#FF0000">*</font>
					</td>
					<%--<td>
						<input type="text" name="warehouse.productionAcceptance" size="50"
							maxlength="100" class="itemname"/>
						<font color="#FF0000">*</font>

					</td>
				--%></tr>

				

				<tr>
					<td>
							说明：
						 
					</td>
					<td>


						<textarea name="warehouse.whnote" cols="40" rows="3" class="itemname"> </textarea>
						</td>
				</tr>
				</table>
				<table class="btn">
					<tr>
						<td>
								<input type="submit" name="SYS_SET" value=" 提 交 " class="frm_btn">
						</td>
					</tr>
				</table>
		</form>
		<br>
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>