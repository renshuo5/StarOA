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
		<title>退货通知</title>
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



		<form action="sales/return/returned/returned_update" method="post">
			<table class="title editTable" >
				<tr>
					<td>退 货 报 告 单
					</td>
				</tr>
			</table>

			<table class="addTable">


				<tr>
					<td>
						客户名称：
					</td>

					<td>
						<input type="text" name="returned.customern"
							value="${returned.customern}" disabled="disabled"></input>
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
						<input type="hidden" id="d244_2" name="returned.retdate"
							value="${returned.retdate}" disabled="disabled" />
					</td>
				</tr>
				<tr>
					<td>
						单号：
					</td>
					<td>
						<input type="text" name="returned.sn" value="${returned.sn}"
							disabled="disabled"></input>
					</td>
				</tr>

			</table>
			<table class="list editTable" id="tb" >


				<tr>

					<!-- <td width="3%"  colspan="1"><p align="center">序号 </p></td>-->
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
						<td>
							<input type="text" size="10" id="itemNameId${vs.index}"
								disabled="disabled" value="${retgood.itemType.item.name}">
							<input type="hidden" name="itemId" id="itemIdId${vs.index}"
								value="${retgood.itemType.item.id }">
							<input type="button" value="选择" class="frm_btn"
								onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=${vs.index}','selectItem',800, 600, 1);return false">
						</td>
						<td>
							<input type="text" name="itemTypeNameIds"
								value="${retgood.itemType.name}"
								id="itemTypeNameId${vs.index }" disabled="disabled"></input>
							<input type="hidden" name="itemTypeIds"
								id="itemTypeIdId${vs.index}" value="${retgood.itemType.id}"></input>
						</td>
						<td>
							<input type="text"  name="retnos"  value="${retgood.retno}"
								disabled="disabled"></input>
						</td>


					</tr>
				</c:forEach>

			</table>
			<table class="addTable">
				<tr>
					<td>
						退 货 叙 述

					</td>
					<td>
						<textarea cols="50" rows="6" disabled="disabled">${returned.retnote}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						出单人:
					</td>
					<td>
						<input value="${returned.signper.empName}" type="text"
							disabled="disabled">
					</td>
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
						<textarea cols="50" rows="6" disabled="disabled">${returned.whreceive} </textarea>
					</td>
				</tr>
				<tr>
					<td>
						签收人:
					</td>
					<td>
						<input type="text" disabled="disabled"
							name="returned.signatory.empName"
							value="${returned.signatory.empName}" disabled="disabled" />
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
							value="${returned.whradate}" disabled="disabled"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2442_2',skin:'whyGreen'})" />
						<input type="hidden" id="d2442_2" name="whradate"
							value="${returned.whradate}" />
					</td>
				</tr>
			</table>

			<table class="addTable">
				<tr>
					<td>
						品 工 部 处 理 意 见
					</td>
					<td>
						<textarea name="qualityadvice" cols="50" rows="6" disabled="disabled">${returned.qualityadvice}</textarea>
						
					</td>
				</tr>
				<tr>
				
				<c:if test="${returned.deals=='0'}">
				<td>
				   报废   <input type="radio" name="deal" value="0" checked="checked"/>
				  
				</td>
				<td>
				     返工  <input type="radio" name="deal" value="1" disabled="disabled"/>
				</td>
				</c:if>
				
				<c:if test="${returned.deals=='1'}">
				<td>
								   报废   <input type="radio" name="deal" value="0" disabled="disabled"/>
				
				</td>
				  <td>  
				    返工  <input type="radio" name="deal" value="1" checked="checked"/>
				
				   
				</td>
				 </c:if>
				
				  
				
				</tr>
				<tr>
					<td>
						主管:
					</td>
					<td>
						<input type="text" disabled="disabled" name="qualitymanager"
							value="${returned.qualitymanager.empName}" />
						<input type="hidden" name="returned.qualitymanager.empId"
							value="${qualitymanager.employee.empId }" />
					</td>
				</tr>
				
				<tr>
					<td>
						日期:
					</td>
					<td>
						<input id="d2443" type="text" class="Wdate" value="${returned.qualitydate}" disabled="disabled"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2443_2',skin:'whyGreen'})" />
						<input type="hidden" id="d2443_2" name="qualitydate" value="${returned.qualitydate}" />
					</td>
				</tr>
				<tr>
					<td>
						备 注
					</td>
					<td>
						<textarea name="qualitynote" cols="50" rows="6" disabled="disabled" >${returned.qualitynote}</textarea>
					</td>
				</tr>
			</table>
			
			
			
				<table class="addTable">
				<tr>
					<td style="text-align:center">

						<%--<input type="button" name="SYS_SET"  value="确定"
							class="frm_btn" size=5
							onclick="javascript:self.location='<%=basePath%>sales/return/returned/returned_examineList'" />
                        --%>
                        
                        	<input type="button" class="frm_btn" value="返回"
							onclick="javascript:history.go(-1)"/>
                        </td>
				</tr>

			</table>


		</form>
	</body>
</html>
