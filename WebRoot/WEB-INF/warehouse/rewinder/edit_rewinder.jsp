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
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		 <script type="text/javascript" src="<%=basePath%>js/rewinder.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/highLight.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body >

		<form action="warehouse/rewinder/rewinder_update" method="post">
			<input type="hidden" name="rewinder.rew_id" value="${rewinder.rew_id}" />
			<table class="title" style="width:85%">
				<tr>
					<td>收料通知单：
					</td>
				</tr>
				</table>
				<table class="addTable">
				<tr>
					<td>
							供货单位：
					</td>
					<td>
						<input name="rewinder.suplyu" value="${rewinder.suplyu}" type="text" size="50"
							maxlength="100" class="itemname"/>
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
							编制日期：
					</td>
					<td>
						<input id="d244" type="text" size="50" class="Wdate checkDateInfo" value="${rewinder.rew_date}"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" name="rewinder.rew_date" value="${rewinder.rew_date}"/>
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
							备注信息:
					</td>
					<td>
						<input name="rewinder.rewnote" value="${rewinder.rewnote}" type="text" size="50"
							maxlength="100" class="itemname"/>
					</td>
				</tr>
				<tr>
					<td>
							采购 :
					</td>
					<td>
						<input value="${rewinder.buyerEmployee.empName}" type="text" size="50"
							disabled="disabled" maxlength="100" />
							<input type="hidden" name="rewinder.buyerEmployee.empId" value="${rewinder.buyerEmployee.empId }" />
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
							检验 :
					</td>
					<td>
						<input value="${rewinder.rewinspector.empName}" type="text" size="50"
							disabled="disabled" maxlength="100" />
							<input type="hidden" name="rewinder.rewinspector.empId" value="${rewinder.rewinspector.empId }" />
					</td>
				</tr>
			</table>
			<table class="list editTable" id="tb">
				<tr>

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
					<%--<th>
						
							合格数
						
					</th>--%>
					<%--<th>
						
							单价
						
					</th>
					<th>
						
							金额
						
					</th>
					--%><%--<th>
						
							检验
						
					</th>
					--%><th>
						
							备注
						
					</th>
					<th>
						
							添加
						
					</th>
					<th>
						
							删除
						
					</th>
				</tr>
				<!-- 模板行开始 -->
				<tr id="rowTemplete_0">

					<td align="center" valign="top">
						<input name="bsnos" type="text" disabled="disabled" size="8">
					</td>
					<td align="center" valign="top">
						<input type="text" size="10" id="itemNameId_0" disabled="disabled" >
						<input type="hidden" name="itemId" id="itemIdId_0">
						<input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false">
					</td>
					<td align="center" valign="top">
						<input type="text" name="itemTypeNameIds" 
							id="itemTypeNameId_0" disabled="disabled"></input>
						<input type="hidden" name="itemTypeIds" id="itemTypeIdId_0"></input>
						</td>
					<td align="center" valign="top">
						<input name="rewunits" type="text" size="8">
					</td>
					<td align="center" valign="top">
						<input name="rewnos" type="text" size="8">
					</td>
					<%--<td align="center" valign="top">
						<input name="factnos" type="text" size="8">
					</td>--%>
					<%--<td align="center" valign="top">
						<input name="rewuprices"  type="text" size="10">
					</td>
					<td align="center" valign="top">
						<input name="rewprices" type="text" size="10">
					</td>
					--%><%--<td align="center" valign="top">
						<select name="rewexamines" >
							<option value="ture">
								合格
							</option>
							<option value="false">
								不合格
							</option>
						</select>
					</td>
					--%><td align="center" valign="top">
						
						<input name="rewnotes" type="text" size="8">
					</td>
					<td align="center"><img src="<%=basePath %>images/add.png" onclick="addBatchRow(this)" /></td>
					<td align="center"><img src="<%=basePath %>images/del.png" onclick="deleteBatchRow(this)" /></td>

				</tr>
				<!-- 模板行结束 -->
			<c:forEach items="${rewgoods}" var="rewgood" varStatus="vs">
				<tr>

					<td align="center" valign="top">
						<input name="bsnos" type="text" disabled="disabled" value="${rewgood.bsno}"size="8">
					</td>
					<td align="center" valign="top">
						<input type="text" size="10" id="itemNameId${vs.index }" disabled="disabled" value="${rewgood.itemType.item.name }">
						<input type="hidden" name="itemId" id="itemIdId${vs.index }" value="${rewgood.itemType.item.id }">
						<input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=${vs.index }','selectItem',800, 600, 1);return false">
						
					</td>
					<td align="center" valign="top">
						<input type="text" name="itemTypeNameIds" value="${rewgood.itemType.name}"
							id="itemTypeNameId${vs.index }" disabled="disabled"></input>
						<input type="hidden" name="itemTypeIds" id="itemTypeIdId${vs.index }" value="${rewgood.itemType.id }"></input>

						</td>
					<td align="center" valign="top">
						<input name="rewunits" value="${rewgood.rewunit}" type="text" size="8">
					</td>
					<td align="center" valign="top">
						<input name="rewnos" class="checkEmptyforall checkNumforall" value="${rewgood.rewno}" type="text" size="8">
					</td>
					<%--<td align="center" valign="top">
						<input name="factnos" value="${rewgood.factno}" type="text" size="8">
					</td>--%>
					<%--<td align="center" valign="top">
						<input name="rewuprices" value="${rewgood.rewuprice}" type="text" size="10">
					</td>
					<td align="center" valign="top">
						<input name="rewprices" value="${rewgood.rewprice}"type="text" size="10">
					</td>
					--%><td align="center" valign="top">
						
						<input name="rewnotes" value="${rewgood.rewnote}" type="text" size="8">
					</td>
					<td align="center"><img src="<%=basePath %>images/add.png" onclick="addBatchRow(this)" /></td>
					<td align="center"><img src="<%=basePath %>images/del.png" onclick="deleteBatchRow(this)" /></td>

				</tr>
				</c:forEach>
			</table>
			<table class="btn">
			<tr>
				<td>
					<div align="center">
						<input type="submit" name="SYS_SET" value=" 提 交 " class="frm_btn">
						 <input type="button" class="frm_btn" value="取消" onclick=window.close();>
					</div>
				</td>
			</tr>
			</table>
		</form>
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>
