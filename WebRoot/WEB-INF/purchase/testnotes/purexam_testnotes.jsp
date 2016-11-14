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
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>

		</table>
		<form action="purchase/testnotes/testnotes_update" method="post">
			<input type="hidden" name="testnotes.samid"
				value="${testnotes.samid}" />
			<input type="hidden" value="${testnotes.id}" name="testnotes.id">
			<input type="hidden" value="${testnotes.supplierinfo.id}"
				name="supplierinfoId">
			<table class="title">
				<tr>
					<td>
						确认量试通知单
					</td>
				</tr>
			</table>
			<table class="addTable" style="width:100%">
				<tr>
					<td>
						制定部门：
						<input type="text" value="${testnotes.department.dptName}"
							disabled="disabled" />
						<input type="hidden" value="${testnotes.department.id}"
							name="departmentId" />
					</td>
					<td>
						第（
						<input type="text" value="${testnotes.tiems}" size="5"
							disabled="disabled" />
						<input type="hidden" value="${testnotes.tiems}"
							name="testnotes.tiems" size="5" />
						）次提出
					</td>
					<td>
						发出日期：
						<input type="text" value="${testnotes.senddate}"
							disabled="disabled" />
						<input type="hidden" value="${testnotes.senddate}"
							name="testnotes.senddate" />
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<th>
						量试说明
					</th>
				</tr>
			</table>
			<table class="addTable" style="width:100%">
				<tr>
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
				<tr>
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
						<input type="text" value="${testnotes.note}" size="20"
							disabled="disabled" />
						<input type="hidden" value="${testnotes.note}"
							name="testnotes.note" size="8" />
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
						<textarea disabled="disabled" name="testnotes.basis" cols="40"
							rows="4">${testnotes.basis}</textarea>
						<input type="hidden" name="testnotes.basis"
							value="${testnotes.basis}" />
					<br/>
						经办：
						<input type="text" value="${testnotes.purper.empName}"
							disabled="disabled" />
						<input type="hidden" value="${testnotes.purper.empId}"
							name="testnotes.purper.empId" />
								时间：
						<input type="text" value="${testnotes.purdate}"
							disabled="disabled" />
						<input type="hidden" value="${testnotes.purdate}"
							name="testnotes.purdate" />
							<br/><br/>
						主管：
						<input type="text" value="${auditUser.employee.empName}"
							disabled="disabled" />
						<input type="hidden" value="${auditUser.employee.empId}"
							name="testnotes.purmanper.empId" />
							
				   时间：
				    <input id="d244_0" type="text" class="Wdate checkDateInfo" onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2_0',skin:'whyGreen'})"/>
    <input type="hidden" id="d244_2_0" name="testnotes.purmdate"/></td>
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
						<input type="submit" value=" 提 交 " class="frm_btn"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>