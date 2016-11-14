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
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>


		<form action="warehouse/rewinder/rewinder_examinepgb" method="post">
			<input type="hidden" name="rewinderId" value="${rewinder.rew_id}" />

			<table class="title" style="width:85%">
				<tr>
					<td>
						检验收料通知单：
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						供货单位：
					</td>
					<td>
					<input type="text" name="rewinder.suplyu" disabled="disabled" value="${rewinder.suplyu }"/>
					</td>
					
				</tr>
				<tr>
					<td>
						编制日期：
					</td>
					<td>
						<input type="text" name="rewinder.rew_date" disabled="disabled" value="${rewinder.rew_date}"/> 
					</td>
				</tr>
				<tr>
					<td>
						备注信息:
					</td>
					<td>
						<input type="text" name="rewinder.rewnote" disabled="disabled" value="${rewinder.rewnote }"/> 
						
					</td>
				</tr>
				<tr>
					<td>
						检验 :
					</td>
					<td>
						<input type="text" disabled="disabled" size="50"
							name="rewinspector" maxlength="100"
							value="${rewinspector.empName}" />
						<input type="hidden" name="rewinder.rewinspector.empId"
							value="${rewinspector.empId }" />
					</td>
				</tr>
				<tr>
					<td>
						采购 :
					</td>
					<td>
					<input type="text" name="rewinder.buyerEmployee.empName" disabled="disabled" value="${rewinder.buyerEmployee.empName}"/>
						<font color="#FF0000">*</font>
					</td>
				</tr>
			</table>
			<table class="list">

				<tr>

					<th>

						编号

					</th>
					<th>

						保税号

					</th>
					<th>

						品名

					</th>
					<th>

						型 号 规 格

					</th>
					<th>

						单位

					</th>
					<th>

						数量

					</th>
					<th>

						单价

					</th>
					<th>

						金额

					</th>
					<th>

						检验结果

					</th>
					<th>

						备注
					</th>
				</tr>

				<c:forEach items="${rewgoods}" var="rewgood">
					<c:if test="${rewgood.rewinder.rew_id==rewinder.rew_id}">
						<tr>
							<td align="center">
								${rewgood.rewgid}
							</td>
							<td align="center" valign="top">
								${rewgood.bsno}
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
								${rewgood.rewno}
							</td>
							<td align="center" valign="top">
								${rewgood.rewuprice}
							</td>
							<td align="center" valign="top">
								${rewgood.rewprice}
							</td>
							<td align="center" valign="top">
							<select name="rewexamines">
							<option value="true">
								合格
							</option>
							<option value="false">
								不合格
							</option>
						</select>
						<font color="#FF0000">*</font>
					</td>
							<td align="center" valign="top">
								${rewgood.rewnote}
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<table>
				<tr bgcolor="#f5f5f5">
					<td>
						<div align="center">
							<input type="submit" name="SYS_SET" value=" 提 交 " class="frm_btn">
							 <input type="button" class="frm_btn" value="取消" onclick=window.close();>
						</div>
					</td>
				</tr>
			</table>

		</form>
		<br>
	</body>
</html>
