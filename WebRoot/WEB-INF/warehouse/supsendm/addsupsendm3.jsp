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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<title>配套发料表</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="css/vip.css" type="text/css" />
		<script language="javascript" src="js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css" />
		<script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/textRightLeft.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/highLight.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/stock.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/supsendm3.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>
	<form action="<%=basePath %>warehouse/supsendm3/supsendm3_add.action" method="post">
		<input type="hidden" name="isExtra" value="${isExtra }"/>
		<input type="hidden" name="itemType.id" value="${itemType.id}"/> 
		<input type="hidden" name="preparation.id" value="${preparation.id}" />
		<table class="title editTable">
				<tr>
					<td>
						打印机配套发料表
						<c:if test="${isExtra==1}">
							(补发)
						</c:if>
					</td>
				</tr>
			</table>
		<table class="addTable">
			<tr>
				<td>
					领料车间：
				</td>
				<td>
					<select name="supsendm3.department.dptName">
						<option value="一车间">
							一车间
						</option>
						<option value="三车间">
							三车间
						</option>
						<option value="五车间">
							五车间
						</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					产品名称：
				</td>
				<td>
					<input type="text" name="supsendm3.itemType.item.name"
						value="${itemType.item.name }" readonly="readonly" />
					<input type="hidden" name="supsendm3.itemType.item.id"
						value="${itemType.item.id }" />
				</td>
			</tr>
			<tr>
				<td>
					产品规格：
				</td>
				<td>
					<input type="text" name="supsendm3.itemType.name"
						value="${itemType.name }" readonly="readonly" />
					<input type="hidden" name="supsendm3.itemType.id"
						value="${itemType.id }" />
				</td>
			</tr>
			<tr>
				<td>
					硬件版本：
				</td>
				<td>
					<input type="text" name="supsendm3.hawversion" class="checkEmptyShowInfo"/>
				</td>
			</tr>
			<tr>
				<td>
					图号：
				</td>
				<td>
					<input type="text" name="supsendm3.itemType.mCode"
						value="${itemType.mCode }" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td>
					要货数量：
				</td>
				<td>
					<input type="text" readonly="readonly" name="supsendm3.needNum" id="needNum" value="${needNum }"/>
				</td>
			</tr>
			<tr>
				<td>
					发料时间：
				</td>
				<td>
					<input id="d244_0" type="text" class="Wdate"
						onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2_0',skin:'whyGreen'})" />
					<input type="hidden" id="d244_2_0" name="supsendm3.sudate" />
				</td>
			</tr>
		</table>
		<table class="title">
				<tr>
					<td>
						发料列表
					</td>
				</tr>
			</table>
		<table class="list" id="tb" style="width: 100%">
			<tr>
				<th>
					序号
				</th>
				<th>
					子件代码
				</th>
				<th>
					部品名称
				</th>
				<th>
					型号规格
				</th>
				<th>
					接口类型
				</th>
				<th>
					单机
				</th>
				<th>
					应发数量
				</th>
				<th>
					实发数量
				</th>
				<th>
					备注
				</th>
				<%--<th width="5%">
					添加
				</th>
				<th width="5%">
					删除
				</th>
			--%></tr>
			<!-- 模板开始 -->
			<tr id="rowTemplete_0">
				<td>
					<input type="text" readonly="readonly" name="seriNums" size="5"/>
					<input type="hidden" id="itemTypeIdId_0" name="itemTypeIds"/>
				</td>
				<td>
					<input type="text" readonly="readonly" id="itemmCode_0" size="5"/>
				</td>
				<td>
					<input type="text" id="itemNameId_0" name="itemNames"
						readonly="readonly" size="8" />
					<input type="hidden" id="itemIdId_0" name="itemIds"/>
				</td>
				<td>
					<input type="text" id="itemTypeNameId_0" name="itemTypeName"
						readonly="readonly" size="8" />
					<%--<input id='item_0' type='button' value='选择' class='frm_btn'
						onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false" />
				--%></td>
				<td width="5%">
					<input type="hidden" name="controllerunitInfos" id="controllerunit_0"/>
					<input type="text" readonly="readonly" name="cons" size="10"/>
					<%--<select name="controllerunitInfos" style="width:100px">
						<option value="parallelport">
							并口
						</option>
						<option value="parportU">
							并+U
						</option>
						<option value="serialoparport">
							并口|串口
						</option>
						<option value="serialaparport">
							并口+串口
						</option>
						<option value="parportethpot">
							并口+网口
						</option>
						<option value="ip090k">
							IP090K（并口）
						</option>
						<option value="ip690k">
							IP690K（并口）
						</option>
					</select>
				--%></td>
				<td>
					<input type="text" readonly="readonly" name="singlesets" size="5"/>
				</td>
				<td>
					<input type="text" readonly="readonly" name="needNums" size="5"/>
				</td>
				<td>
					<input type="text" readonly="readonly" name="pracNums" size="5"/>
				</td>
				<td>
					<input type="text" name="notes"/>
				</td>
				<%--<td>
					<img src="<%=basePath%>images/add.png"
						onclick="return addBatchRow(this)" />
				</td>
				<td>
					<img src="<%=basePath%>images/del.png"
						onclick="return deleteBatchRow(this)" />
				</td>
			--%></tr>
			<!-- 模板结束 -->
			<!---------------------------LOOP START------------------------------>
			<c:if test="${!empty susgood3s}">
				<c:forEach items="${susgood3s }" var="s" varStatus="vs">
					<tr>
						<td>
							<c:if test="${isExtra==1}">
								<input type="hidden" name="susgood3ids" value="${s.id}"/>
							</c:if>
							<input type="text" readonly="readonly" name="seriNums" value="${s.seriNum }" size="5"/>
							<input type="hidden" id="itemTypeIdId${vs.index }" value="${s.itemType.id }" name="itemTypeIds" />
						</td>
						<td>
							<input type="text" readonly="readonly" size="5" name="subCodes" value="${s.itemType.mCode }"/>
						</td>
						<td>
							<input type="text" id="itemNameId${vs.index }" name="itemNames"
								readonly="readonly" size="8" value="${s.itemType.item.name }"/>
						</td>
						<td>
							<input type="text" id="itemTypeNameId${vs.index }" name="itemTypeName"
								readonly="readonly" value="${s.itemType.name }"
								size="8" />
							<%--<input id='item${vs.index }' type='button' value='选择' class='frm_btn'
								onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=${vs.index }','selectItem',800, 600, 1);return false" />
						--%></td>
						<td width="5%">
							<input type="hidden" name="controllerunitInfos" id="controllerunit${vs.index }" value="${s.controllerunitInfo}"/>
							<input type="text" readonly="readonly" name="cons" size="10"/>
							<%--<select name="controllerunitInfos" style="width:100px">
								<option value="parallelport">
									并口
								</option>
								<option value="parportU">
									并+U
								</option>
								<option value="serialoparport">
									并口|串口
								</option>
								<option value="serialaparport">
									并口+串口
								</option>
								<option value="parportethpot">
									并口+网口
								</option>
								<option value="ip090k">
									IP090K（并口）
								</option>
								<option value="ip690k">
									IP690K（并口）
								</option>
							</select>
						--%></td>
						<td>
							<input type="text" readonly="readonly" name="singlesets" size="5" value="${s.singleset }"/>
						</td>
						<td>
							<input type="text" readonly="readonly" name="needNums" size="5" value="${s.needNum }"/>
						</td>
						<td>
							<input type="text" readonly="readonly" name="pracNums" size="5" value="${s.pracNum }"/>
						</td>
						<td>
							<input type="text" name="notes" value="${s.note }"/>
						</td>
						<%--<td>
							<img src="<%=basePath%>images/add.png"
								onclick="return addBatchRow(this)" />
						</td>
						<td>
							<img src="<%=basePath%>images/del.png"
								onclick="return deleteBatchRow(this)" />
						</td>
					--%></tr>
				</c:forEach>
			</c:if>
		</table>
		<table class="btn">
				<tr>
					<td>
						<input type="submit" class="frm_btn" value="提交"/>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
