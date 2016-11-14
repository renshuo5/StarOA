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
		<title>量试通知单</title>
		<link type="text/css" href="css/vip.css" rel="stylesheet" />
<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
	<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	
	</head>
	<body>
		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>

		</table>
		<form action="purchase/testnotes/testnotes_updateInput" method="post">
			<input type="hidden" name="testnotes.samid"
				value="${testnotes.samid}" />
			<input type="hidden" value="${testnotes.id}" name="testnotes.id">
			<input type="hidden" value="${testnotes.supplierinfo.id}"
				name="supplierinfoId">
			<table class="title">
				<tr>
					<td>
						编辑量试通知单
					</td>
				</tr>
			</table>
			<table class="addTable" style="width:100%">
				<tr>
					<td>
						制定部门：
						<input type="hidden" name="departmentId"
					value="${testnotes.department.id}" />
						<select id="dptName" name="dptName"
							onChange="departmentId.value=this.options[dptName.selectedIndex].value;">
							<option value="${testnotes.department.id}">
								${testnotes.department.dptName}
							</option>
							<c:forEach items="${departmentList}" var="dpt">
								<c:if test="${testnotes.department.id!=dpt.id&&1==dpt.dptType}">
									<option value="${dpt.id}" >
										${dpt.dptName}
									</option>
								</c:if>
							</c:forEach>
						</select>
					</td>
					<td>
						第（
						<input type="text" value="${testnotes.tiems}"
							name="testnotes.tiems" size="5" class="checkNumforall"/>
						）次提出
					</td>
					<td>
					&nbsp;	发出日期：
						<input id="d2441" type="text" class="Wdate checkDateInfo"
							value="${testnotes.senddate}"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2_0',skin:'whyGreen'})" />
						<input type="hidden" id="d2441_2_0" value="${testnotes.senddate}"
							name="testnotes.senddate" />
					</td>
				</tr>
			</table>
			<table class="list">
				<tr>
					<th>
						量试说明
					</th>
				</tr>
			</table>
			<table class="addTable" style="width:100%">
				<tr align="center">
					<th>
						产品名称
					</th>
					<th>
						品牌
					</th>
					<th>
						型号规格
					</th>
					<th>
						数量
					</th>
					<th width="25%">
						备注
					</th>
				</tr>
				<tr align="center">
					<td>
						<input type="text" value="${testnotes.supplierinfo.itemname}"
							disabled="disabled" />
					</td>
					<td>
						<input type="text" value="${testnotes.brand}" disabled="disabled" />
						<input type="hidden" value="${testnotes.brand}"
							name="testnotes.brand" />
					</td>
					<td>
						<input type="text" value="${testnotes.supplierinfo.itemtypename}"
							disabled="disabled" />
					</td>
					<td>
						<input type="text" value="${testnotes.num}" size="8"
							disabled="disabled" />
						<input type="hidden" value="${testnotes.num}" name="testnotes.num" />
					</td>
					<td>
						<input type="text" value="${testnotes.note}" name="testnotes.note"
							size="20" />
					</td>
				</tr>
			</table>
			<table class="addTable" style="width: 100%">
				<tr>
					<td>
						供应厂商：
					</td>
					<td>
						<input type="text" value="${testnotes.supplierinfo.supcname}"
							disabled="disabled" />
					</td>

				</tr>
				<tr>

					<td>
						采购和要求量试依据:
					</td>
					<td>
						<textarea name="testnotes.basis" cols="40" rows="4">${testnotes.basis}</textarea>
					<br/>
						经办：
						<input type="text" value="${auditUser.employee.empName}" disabled="disabled"/>
						<input type="hidden" name="testnotes.purper.empId" value="${auditUser.employee.empId}" />
							时间：
					<input id="d2442" type="text" class="Wdate checkDateInfo"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2_1',skin:'whyGreen'})" />
						<input type="hidden" id="d2441_2_1" name="testnotes.purdate" />
					</td>
				</tr>
			</table>
			<table class="addTable" style="width: 100%">
				<tr>
					<td>
						填制说明
					</td>
					<td>
						“样品名称”栏目应填写同一供方且配套在我公司同一产品的样品。
				</tr>
			</table>
			<table style="text-align:center" >
				<tr bgcolor="#f5f5f5">
					<td>
						<input type="submit" value=" 提 交 " class="frm_btn">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>