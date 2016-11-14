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
		<title>仓库审核退货通知</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>

		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>



		<form action="sales/return/returned/returned_examine?" method="post">
			<input type="hidden" name="returnedId" value="${returned.retid}">

			<table class="title editTable">
				<tr>
					<td>
						退 货 报 告 单 仓 管 审 核
					</td>
				</tr>
			</table>


			<table class="addTable">
				<tr>
					<td>
						客户名称：
					</td>

					<td>
						<input type="text" value="${returned.customern}"
							disabled="disabled"></input>
					</td>
				</tr>
				<tr>
					<td>
						退货日期：
					</td>
					<td>
						<input id="d244" type="text" class="Wdate"
							value="${returned.retdate}" disabled="disabled"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" value="${returned.retdate}"
							disabled="disabled" />
					</td>
				</tr>
				<tr>
					<td>
						单号：
					</td>
					<td>
						<input type="text" value="${returned.sn}" disabled="disabled"></input>
					</td>
				</tr>

			</table>
			<table class="list editTable" id="tb">
				<tr>

					<th>
						品名
					</th>
					<th>
						规格型号
					</th>
					<th>
						数量
					</th>


				</tr>


				<c:forEach items="${retgoods}" var="retgood" varStatus="vs">

					<tr>
						<td valign="top" colspan="1">
							<input type="text" size="10" id="itemNameId${vs.index}"
								disabled="disabled" value="${retgood.itemType.item.name}">
						</td>
						<td valign="top" colspan="1">
							<input type="text" disabled="disabled"
								value="${retgood.itemType.name}" />

						</td>

						<td valign="top" colspan="1">
							<input type="text" value="${retgood.retno}" disabled="disabled"></input>
						</td>

					</tr>
				</c:forEach>

			</table>
			<table class="addTable">
				<tr>
					<td>
						退货叙述：
					</td>

					<td>
						<textarea cols="80" rows="6" disabled="disabled">  ${returned.retnote}  </textarea>
					</td>
				</tr>
				<tr>
					<td>
						出单人:
					</td>
					<td>

						<input value="${returned.signper.empName}" disabled="disabled"
							type="text">
					</td>
				</tr>
				<tr>

				</tr>
			</table>



			<table class="addTable">
				<tr>
					<td>
						仓 库 接 收
					</td>

					<td>
						以上物品型号、规格、数量核对有出入的填写下框
						<br>
						实际接收：
						<br>
						<textarea name="whreceive" cols="50" rows="6"> </textarea>
					</td>
				</tr>
				<tr>
					<td>
						签收人:
					</td>
					<td>
						<input type="text" disabled="disabled" name="signatory"
							value="${signatory.employee.empName}" />
						<input type="hidden" name="returned.signatory.empId"
							value="${signatory.employee.empId }" />

					</td>
				</tr>
				<tr>
					<td>
						日期：
					</td>
					<td>
						<input id="d2442" type="text" class="Wdate"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2442_2',skin:'whyGreen'})" />
						<input type="hidden" id="d2442_2" name="whradate" />
					</td>
				</tr>
			</table>
				<table class="addTable">

				<tr>
				    <td>
				    </td>
					<td >
						<input type="submit" value=" 提 交 " class="frm_btn" id="SYS_SET">
					</td>
				</tr>
			</table>

		</form>
	</body>
</html>
