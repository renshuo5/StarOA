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
<html>
	<head>
		<base href="<%=basePath%>">
		<title>物料变异</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath %>css/vip.css" type="text/css">
    <script language="javascript" src="<%=basePath %>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath %>js/public.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/autoAddRow.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/addTableAlign.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/oddEvenColor.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/highLight.js"></script>
    <script type="text/javascript" src="<%=basePath %>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
		<form action="<%=basePath %>warehouse/variation/variation_add" method="post">
		<table class="title editTable">
			<tr>
				<td> 
					物料变异申报表 
				</td>
			</tr>
		</table>
		<table class="addTable">
			<tr>
				<td>
					单位：
				</td>
				<td>
					<SELECT name="variation.dpt_id.id">
						<c:forEach items="${workshops}" var="d">
							<option value="${d.id }">${d.dptName }</option>
						</c:forEach>
					</SELECT>
				</td>
			</tr>
			<tr>
				<td>
					申报日期：
				</td>
				<td>
					<input id="d244_0" type="text" class="Wdate" onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2_0',skin:'whyGreen'})"/>
        			<input type="hidden" id="d244_2_0" name="variation.vardate"/>
				</td>
			</tr>
			<tr>
				<td>
					代码（料号）
				</td>
				<td>
					<input type="text" disabled="disabled" value="${itemType.mCode }" name="vargood.itemType.mCode"/>
				</td>
			</tr>
			<tr>
				<td>
					物品名称
				</td>
				<td>
					<input type="text" value="${itemType.item.name }-${itemType.name}" disabled="disabled" name="vargood.itemType.name"/>
					<input type="hidden" value="${itemType.id }" name="vargood.itemType.id"/>
				</td>
			</tr>
			<tr>
				<td>
					适用机种
				</td>
				<td>
					<input type="text" name="forStyle" value="${itemType1.item.name}-${itemType1.name}" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<td>
					接料/入库时间
				</td>
				<td>
					<input id="d244_1" type="text" class="Wdate" onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_1_0',skin:'whyGreen'})"/>
        			<input type="hidden" id="d244_1_0" name="vargood.etdate"/>
				</td>
			</tr>
			<tr>
				<td>
					接料/入库数量
				</td>
				<td>
					<input type="text" class="checkNumShowInfo checkEmptyShowInfo" name="vargood.etno"/>
				</td>
			</tr>
			<tr>
				<td>
					退换/隔离数量
				</td>
				<td>
					<input type="text" class="checkNumShowInfo checkEmptyShowInfo" name="vargood.chno"/>
				</td>
			</tr>
			<tr>
				<td>
					变异现象或原因
				</td>
				<td>
					<textarea name="vargood.vagReason" id="textarea" cols="50" rows="5"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					备注
				</td>
				<td>
					<textarea name="variation.varnote" id="textarea3" cols="50" rows="5"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					单位主管：</td><td>
					<select name="variation.umanager.empId">
						<c:forEach items="${workshopWorkers}" var="e">
							<option value="${e.empId }">${e.empName }</option>
						</c:forEach>
					</select>
				</td>
				</tr>
				<tr>
				<td>
					申报人：</td><td>
					<input name="variation.appper.empName" value="${currentUser.employee.empName}" disabled="disabled" align="middle" type="text" />
					<input name="variation.appper.empId" value="${currentUser.employee.empId}" type="hidden" />
				</td>
			</tr>
		</table>


		<table class="btn">
			<tr>
				<td>
					<input type="submit" value="提交" class="frm_btn" />
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>
