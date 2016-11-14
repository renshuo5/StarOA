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
		<title>板卡出荷报告</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css"
			type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
${taxboard.tax_id}
		<form action="sales/shipment/shippingnote1/shippingnote1_taxboardAdd">
			<input type="hidden" name="taxboard.tax_id" value="${taxboard.tax_id}">
			<input type="hidden" name="shi1goodId" value="${shi1good.shi1gid}">
			<table  class="title">
				<tr>
					<td>
						产 品 出 荷 报 告 单（板 卡）
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						品 名
					</td>
					<td>

						<input type="text" value="${shi1good.itemType.item.name}"  disabled="disabled">
					</td>
				</tr>
				<tr>
					<td>
						适 用 机 型
					</td>
					<td>

						<input type="text" value="${shi1good.itemType.name}" disabled="disabled"> 
					</td>
				</tr>
				<tr>
					<td>
						货 品 代 码
					</td>
					<td>
						<input type="text" value="${shi1good.itemType.mCode}" disabled="disabled">

					</td>
				</tr>
				<tr>
					<td>
						批 号:
					</td>
					<td>
						<input type="text" value="${shi1good.shitime}" disabled="disabled">

					</td>
				</tr>
				<tr>
					<td>
						出 货 总 量
					</td>
					<td>
						<input type="text" value="${shi1good.shi1no}" disabled="disabled">
					</td>
				</tr>
			</table>
           <c:forEach items="${taxboards}" var="taxboard">
			<table class="addTabel">
				<tr>
					<th>
						特 性 名 称
					</th>
					<th>
						检 验 水 平
					</th>
					<th>
						检 查 结 果
					</th>
				</tr>
				<tr>
					<td>
						外 观 检 验
					</td>
					<td>
						0.65
					</td>
					<td align="center">
						<input type="text" name="taxboard.outerchk" value="${taxboard.outerchk}" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td>
						ICT 测 试
					</td>
					<td>
						（0.1）
					</td>
					<td align="center">
						<input type="text" name="taxboard.ictchk" value="${taxboard.ictchk}" disabled="disabled"> 
					</td>
				</tr>
				<tr>
					<td>
						性 能 检 查
					</td>
					<td>
						（0.1）
					</td>
					<td align="center">
						<input type="text" name="taxboard.servicingchk" value="${taxboard.servicingchk}" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td>
						包 装 检 查
					</td>
					<td>
						（0.1）
					</td>
					<td align="center">
						<input type="text" name="taxboard.packingchk" value="${taxboard.packingchk}" disabled="disabled">
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td rowspan="3">
						<p>
							安
						</p>
						<p>
							全
						</p>
						<p>
							检
						</p>
						<p>
							查
						</p>
					</td>
					<td width="26%" height="51">
						检查数量
					</td>
					<td>
						检验项目
					</td>
					<td>
						条形码号
					</td>
					<td width="18%">
						检验结果
					</td>
				</tr>
				<tr>
					<td rowspan="2">
						<input type="text" name="taxboard.checknum" value="${taxboard.checknum}" disabled="disabled">
					</td>
					<td>
						绝缘（DCDC500V&gt;=100 兆欧
					</td>
					<td>
						&nbsp;
					</td>
					<td>
						<input type="text" name="taxboard.cresult" value="${taxboard.cresult}" disabled="disabled">

					</td>
				</tr>
				<tr>
					<td>
						耐压（AC1..5KV 1min/10mA)
					</td>
					<td>
						&nbsp;
					</td>
					<td>
						<input type="text" name="taxboard.cresult2" value="${taxboard.cresult2}" disabled="disabled">

					</td>
				</tr>
			</table>
			</c:forEach>
			<table class="addTable">
				<tr>
					<td>
						最终判定
					</td>
					<c:forEach items="${taxboards}" var="taxboard">
					<td>
						<input type="text" name="taxboard.detfinally" value="${taxboard.detfinally}" disabled="disabled" >
					</td>
					</c:forEach>
				</tr>
				<tr>
					<td>
						检 验 员
					</td>
					<td>
						<select name="taxboard.inspector.empId" disabled="disabled">
							<c:forEach items="${inspector}" var="emp">
								<option value="${emp.empId}">
									${emp.empName}
								</option>
							</c:forEach>
						</select>*
					</td>
				</tr>
				<tr>
					<td>
						报告时间
					</td>
					<td>
						<input id="d244" type="text" class="Wdate" value="${taxboard.rdate}" disabled="disabled"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" name="taxboard.rdate" value="${taxboard.rdate}" />
					</td>
				</tr>
				<tr>
					<td>
						品管确认：
					</td>
					<td>
						<input type="text" disabled="disabled"  name="quaconfirm"
							value="${quaconfirm.employee.empName}" />
						<input type="hidden" name="taxboard.quaconfirm.empId"
							value="${quaconfirm.employee.empId }" />
					</td>
				</tr>
				<tr>
					<td>
						负责人：
					</td>
					<td>
						<select name="taxboard.rper.empId" disabled="disabled">
							<c:forEach items="${rper}" var="emp">
								<option value="${emp.empId}">
									${emp.empName}
								</option>
							</c:forEach>
						</select>*
					</td>
				</tr>
				<tr>
					<td>
						时间
					</td>
					<td>
						<input id="d2441" type="text" class="Wdate" value="${taxboard.wdate}" disabled="disabled"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2',skin:'whyGreen'})" />
						<input type="hidden" id="d2441_2" name="taxboard.wdate" value="${taxboard.wdate}" />
					</td>
				</tr>
				</table>
				<table class="addTable">
				<%--<tr>
					<td align="center">
							<input type="submit" value=" 提 交 " class="frm_btn">
					</td>
				</tr>
			--%></table>
		</form>
	</body>
</html>
