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
	Integer number = 0;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>采购订单</title>
		<link type="text/css" href="css/vip.css" rel="stylesheet" />
		<script type="text/javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>js/addTableAlignPur.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/textRightLeft.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>
		<form action="" method="post">
			<input type="hidden" value="${purorder.id}" name="purorder.id" />
			<table class="title">
				<tr>
					<td>
						采购订单
					</td>
				</tr>
			</table>
			<table class="addTable" style="width: 100%">
				<tr>
					<td>
						地址：
					</td>
					<td>
						福清市融侨经济技术开发区
					</td>
					<td>
						电话：
					</td>
					<td>
						0591—5380202
					</td>
				</tr>
				<tr>
					<td>
						传真：
					</td>
					<td>
						0591—5380145
					</td>

					<td>
						编号：
					</td>
					<td>
						<input value="${purorder.pno }" disabled="disabled" />
					</td>
				</tr>
				<tr>
					<td>
						供应商：
					</td>
					<td>
						<input type="text" disabled="disabled"
							value="${purorder.quaprolist.supplierinfo.supcname}" />
					</td>
					<td>
						厂商编号：
					</td>
					<td>
						<input type="text" value="${purorder.firm}" size="10"
							disabled="disabled" />
					</td>
				</tr>
				<tr>
					<td>
						联络人：
					</td>
					<td>
						<input type="text"
							value="${purorder.quaprolist.supplierinfo.business}"
							disabled="disabled" id="businessnameId" size="10">
					</td>
					<td>
						订购日期：
					</td>
					<td>
						<input type="text" value="${purorder.purdate}" disabled="disabled" />
					</td>
				</tr>
			</table>
			<table class="addTable" style="width: 100%">
				<tr>
					<th>
						材料编码
					</th>
					<th>
						品名
					</th>
					<th>
						型号规格
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
						交期
					</th>
					<th>
						品牌
					</th>
					<th>
						备注
					</th>
				</tr>
				<c:set var="mul" value="0"></c:set>
				<c:set var="sum" value="0"></c:set>
				<!---------------------------LOOP START------------------------------>
				<c:if test="${!empty purgoods}">
					<c:forEach items="${purgoods}" var="purgood" varStatus="sr">
						<c:set var="mul" value="${purgood.num*purgood.uprice}"></c:set>
						<c:set var="sum" value="${sum+mul}"></c:set>
						<tr align="center">
							<td>
								<input value="${purgood.itemtype.mCode}" size="15"
									disabled="disabled" />
							</td>
							<td>
								<input value="${purgood.itemtype.item.name }" size="15"
									disabled="disabled" />
							</td>
							<td>
								<input value="${purgood.itemtype.name}" size="15"
									disabled="disabled" />
							</td>
							<td>
								<input size="7" value="${purgood.unit}" disabled="disabled" />
							</td>
							<td>
								<input value="${purgood.num}" size="7" disabled="disabled" />
							</td>
							<td>
								<input value="${purgood.uprice }" size="7" disabled="disabled" />
							</td>
							<td>
								<input type="text" value="${purgood.delydate}"
									disabled="disabled" />
							</td>
							<td>
								<input type="text" value="${purorder.quaprolist.brand}"
									disabled="disabled" />
							</td>
							<td>
								<input name="notes" size="30" value="${purgood.note}"
									disabled="disabled" />
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<!----------------------LOOP END------------------------------->
			</table>
			<table class="addTable" style="width: 100%">
				<tr>
					<td colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;合计金额:&nbsp;
					
						<input type="text" value="${sum}" disabled="disabled" size="18">
					</td>
				</tr>

				<tr>
					<td>
						附<br> 注
					</td>
					<td>
						<textarea disabled="disabled" cols="80" rows="6">${purorder.pnote}</textarea>
					</td>
				</tr>
				<tr>
					<td>
						注<br/> 意 <br/>事<br/> 项
					</td>
					<td>
						1．请照订单所列之交期，数量交货。
						<br>
						2．如无特殊注明，供应商应承担运输过程各项费用及货物的品质变异、损毁之风险。对于境外采购，则依相关国际贸易条例执行。
						<br />
						3．本订单之规格依据相应的部品承认书。验收依据相应的部品规格书或EPSON的品质标准。品质不符要求全数退货。并由供应商承担由此造成的一切损失。
						<br />
						4．订单所列交期为至交货地点的日期，交货香港的另请提前七天交安孚。逾期我司将按每日该批货款的0.5%扣款。
						<br />
						5．交货地点：
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;□福建实达电子制造有限公司（福建省福清市融侨经济技术开发区）
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系人：            
						电话：（591）5380202—234    传真：（591）5380145    邮编：350301
						<br>
						&nbsp;&nbsp;&nbsp;&nbsp;□香港安孚公司（H.K.ANFULL）    联系人：郑建斌   
						电话：（852）27538899    传真：（852）27959231
						<br>
						6．如无特殊注明，供应商收到订单后，若确认无误则在“供应商确认”栏签章并回传以示合同成立，不另签合同。
						7．如有特殊要求，另附传真：&nbsp;&nbsp;  
						<label>
							<c:if test="${purorder.srep}">
								<input type="radio" name="purorder.srep" value="true" checked
									disabled="disabled" />
							</c:if>
							<c:if test="${!purorder.srep}">
								<input type="radio" name="purorder.srep" value="true"
									disabled="disabled" />
							</c:if>
							有 &nbsp;
							<c:if test="${!purorder.srep}">
								<input type="radio" name="purorder.srep" value="false" checked
									disabled="disabled" />
							</c:if>
							<c:if test="${purorder.srep}">
								<input type="radio" name="purorder.srep" value="false"
									disabled="disabled" />
							</c:if>
							无
						</label>
					</td>
				</tr>
			</table>
			<table class="addTable" style="width: 100%">
				<tr>
					<td>
						供应商确认:
					</td>
					<td>
						<input type="text" name="purorder.purconfirm" 
							disabled="disabled" />
					</td>
					<td>
						审批:
					</td>
					<td>
						<input type="text" value="${purorder.approval.empName }" disabled="disabled" />
					</td>
				</tr>
				<tr>
					<td>
						审核:
					</td>
					<td>
						<input type="text" value="${purorder.audit.empName }" disabled="disabled" />
					</td>
					<td>
						经办:
					</td>
					<td>
						<input type="text" value="${purorder.handing.empName}" 
							disabled="disabled" />
					</td>
				</tr>
			</table>
		</form>
		<table>
			<tr>
				<td>
					<input type='button' value='进料验收单' class='frm_btn'
						onClick="javascript:self.location='<%=basePath%>warehouse/feedexamine/feedexamine_addInput2?purorderId=${purorder.id}'" />

				</td>
				<td>
					<input type='button' value='收料通知单' class='frm_btn'
						onClick="javascript:self.location='<%=basePath%>warehouse/rewinder/rewinder_addInput3?purorderId=${purorder.id}'" />

				</td>
			</tr>
		</table>
	</body>
</html>