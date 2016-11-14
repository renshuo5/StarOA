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
		<title>领料单</title>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		 <script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/highLight.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/textRightLeft.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript">
</script>


	</head>

	<body >

		<form action="warehouse/requisition/requisition_add" method="post">
			<input type="hidden" name="requisitionId"
				value="${requisition.req_id}" />

			<table class="title" style="width:85%">
				<tr>
					<td>
						填写领料单：
					</td>
				</tr>
				</table>
				<table class="addTable">
					<tr>
						<td>
							单位：
						</td>
						<td>
							<input type="text" name="requisition.company" size="50"
								maxlength="100" class="itemname" id="requisitioncompany"/>
							<span  id="checkrequisitioncompany" style="color: #FF0000; font-size: 12px;" ></span>
							<font color="#FF0000">*</font>
						</td>
					</tr>

					<tr>
						<td>
							日期：
						</td>
						<td>
							<input id="d244" type="text" class="Wdate checkDateInfo"
								onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
							<input type="hidden" id="d244_2" name="requisition.reqDate" />
							<font color="#FF0000">*</font>
						</td>
					</tr>
					<tr>
						<td>
							部门负责人：
						</td>
						
						<td>
						<select class="selectone" name="requisition.dptmanager.empId">
						<option value="">请选择</option>
				<c:forEach items="${dptmanagers}" var="dptmanager">
				<option value="${dptmanager.empId}">${dptmanager.empName}</option>
				</c:forEach>
				</select>
				<font color="#FF0000">*</font>
					</tr>
					<tr>
						<td>
							领料人：
						</td>
						<td>
							<input type="text" value="${pickingper.employee.empName}" disabled="disabled" size="50"/>
							<input type="hidden" name="requisition.pickingper.empId" value="${pickingper.employee.empId}"/>
							<font color="#FF0000">*</font>
						</td>
					</tr>
				</table>
				<table class="list">
					<tr>
						<th>
							材料代码
						</th>
						<th>
							名 称
						</th>
						<th>
							规格型号
						</th>
						<th>
							计量单位
						</th>
						<th>
							申请数量
						</th>
						<th>
							单价
						</th>
						<th>
							用 途
						</th>
						<th>
							添加
						</th>
						<th>
							删除
						</th>
					</tr>
					<tr id="rowTemplete_0">
					
					
						<td valign="top">
						<input name="itemTypeIds" type="text" size="8" id="itemmCode_0" disabled="disabled">
						</td>
						<td align="center" valign="top">
							<input type="text" size="10" id="itemNameId_0"
								disabled="disabled">
							<input type="hidden" name="itemId" id="itemIdId_0">
						</td>
						<td align="center" valign="top">
							<input type="text" size="6" class="selectin" name="itemTypeNameIds"
								id="itemTypeNameId_0" disabled="disabled"></input>
							<input type="hidden" name="itemTypeIds" id="itemTypeIdId_0"></input>
							<input type="button" value="选择" class="frm_btn"
								onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false">
								<font color="#FF0000">*</font>
						</td>
						<td align="center">
							<input type="text" name="calunits" class="checkEmptyforall" />
							<font color="#FF0000">*</font>
						</td>
						<td align="center">
							<input type="text" id="num_0"  name="reqnums" class="checkEmptyforall checkNumforall" />
							<font color="#FF0000">*</font>
						</td>
						<td align="center">
							<input type="text" id="uprice_0" name="ruprices" class="checkEmptyforall" />
							<font color="#FF0000">*</font>
						</td>
						<td align="center">
							<input type="text" name="userfs"  />
						</td>
						<td align="center">
							<img src="<%=basePath %>images/add.png"
								onclick="addBatchRow(this)" />
						</td>
						<td align="center">
							<img src="<%=basePath %>images/del.png"
								onclick="deleteBatchRow(this)" />
						</td>
					
					</tr>
				</table>
				<table>
				<tr bgcolor="#f5f5f5">
					<td align="center">
							<input type="submit" name="SYS_SET" value=" 提 交 " class="frm_btn" id="SYS_SET">
							 <input type="button" class="frm_btn" value="取消" onclick=window.close();>
					</td>
				</tr>
				</table>
				</form>
				<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
        	<SCRIPT type=text/javascript>
            $(#add1)
        </SCRIPT>
	</body>
</html>
