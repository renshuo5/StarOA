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
		<title>量试计划单</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css"
			type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
			<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<body>
				<form action="produce/trackingtest/trackingtest_update"
					method="post">
					<input type="hidden" name="trackingtest.id" value="${trackingtest.id}">
					
			<div>
					跟踪单流向：→（
					<select name="trackingtest.whDepartment.id">
						<option value="${trackingtest.whDepartment.id }">
							${trackingtest.whDepartment.dptName }
						</option>
						<c:forEach items="${departments}" var="dpt">
							<c:if
								test="${dpt.dptType==3&&dpt.id!=trackingtest.whDepartment.id}">
								<option value="${dpt.id}">
									${dpt.dptName}
								</option>


							</c:if>

						</c:forEach>
					</select>
					）仓库→（
					<select name="trackingtest.wsDepartment1.id">
						<option value="${trackingtest.wsDepartment1.id}">
							${trackingtest.wsDepartment1.dptName }
						</option>
						<c:forEach items="${departments}" var="dpt">
							<c:if
								test="${dpt.dptType==2&&dpt.id!=trackingtest.wsDepartment1.id}">

								<option value="${dpt.id}">
									${dpt.dptName}
								</option>
							</c:if>

						</c:forEach>
					</select>
					）车间→（
					<select name="trackingtest.wsDepartment2.id">
						<option value="${trackingtest.wsDepartment2.id }">
							${trackingtest.wsDepartment2.dptName }
						</option>
						<c:forEach items="${departments}" var="dpt">
							<c:if
								test="${dpt.dptType==2&&dpt.id!=trackingtest.wsDepartment2.id}">

								<option value="${dpt.id}">
									${dpt.dptName}
								</option>
							</c:if>

						</c:forEach>
					</select>
					）车间→检验部门→工艺→品工部
				</div>
			<table class="title addTable">
				<tr>
					<td>
						量试过程跟踪单
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<div colspan="50%">
						<td>
							样品名称
						</td>
						<td>
							<input type="text" disabled="disabled"
								value="${trackingtest.testnotes.supplierinfo.itemname }" />
						</td>
					</div>
					<div colspan="50%">
						<td>
							型号:
						</td>
						<td>
							<input type="text" disabled="disabled"
								value="${trackingtest.testnotes.supplierinfo.itemtypename }" />
							<input name="trackingtest.testnotes.id"
								value="${trackingtest.testnotes.id }" type="hidden" />
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							适用机种、部件
						</td>
						<td>
							<input type='text' id='itemNameId_0'
								value="${trackingtest.itemType.item.name }" disabled='disabled'>
							<input type='text' id='itemTypeNameId_0' disabled='disabled'
								value="${trackingtest.itemType.name }">
							<input type='text' name='trackingtest.itemType.id'
								value="${trackingtest.itemType.id}" id='itemTypeIdId_0'>
							<input id='item_0' type='button' value='选择' class='frm_btn'
								onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false">
						</td>
					</div>
					<div colspan="50%">
						<td>
							量试通知单号：
						</td>
						<td>
								<a href="#" onclick="openWin('<%=basePath%>purchase/testnotes/testnotes_show?testnotesId=${trackingtest.testnotes.id}','examineTestnotes',800,600);return false">
							量试通知单<c:out value="${trackingtest.testnotes.id}"></c:out></a>
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							计划量试日期:
						</td>
						<td>
								<input id="d244" type="text" value="${trackingtest.testdate}"
								class="Wdate"
								onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
							<input type="hidden" id="d244_2" name="trackingtest.testdate"  value="${trackingtest.testdate}"
								 />
						</td>
					</div>
					<div colspan="50%">
						<td>
							部件编号（批次号）：
						</td>
						<td>
							<input type="text" name="trackingtest.itempsn"
									value="${trackingtest.itempsn}" />
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							生产过程质量情况：
						</td>
						<td>
								生产过程质量情况：
								<textarea name="trackingtest.qualitySituation" cols="50"
									rows="3">${trackingtest.qualitySituation }</textarea>
						</td>
					</div>
					<div colspan="50%">
						<td>
							车间记录人:
						</td>
						<td>
							<input type="text" value="${trackingtest.empwsr1.empName }"
									disabled="disabled" />
								<input type="hidden" name="trackingtest.empwsr1.empId"
									value="${trackingtest.empwsr1.empId }">
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							日期：
						</td>
						<td>
						<input id="d2441" type="text"
									value="${trackingtest.whrecordate}" class="Wdate"
									onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2',skin:'whyGreen'})" />
								<input type="hidden" value="${trackingtest.whrecordate}"
									id="d2441_2" name="trackingtest.whrecordate" />
						</td>
					</div>
					<div colspan="50%">
						<td>
							部件检验情况：
						</td>
						<td>
				
								<textarea name="trackingtest.examineresult" cols="50" rows="3">${trackingtest.examineresult}</textarea>
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							检验员：
						</td>
						<td>
							<input type="text" value="${trackingtest.examiner1.empName }"
									disabled="disabled" />
								<input type="hidden" name="trackingtest.examiner1.empId"
									value="${trackingtest.examiner1.empId }">
						</td>
					</div>
					<div colspan="50%">
						<td>
							日期：
						</td>
						<td>
							<input id="d2442" type="text"
									value="${trackingtest.whexamineDate}" class="Wdate"
									onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2442_2',skin:'whyGreen'})" />
								<input type="hidden" value="${trackingtest.whexamineDate}"
									id="d2442_2" name="trackingtest.whexamineDate" />
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							整机成品编号（批次号）：
						</td>
						<td>
							<input type="text" value=" ${trackingtest.propsn}"
									name="trackingtest.propsn" />
						</td>
					</div>
					<div colspan="50%">
						<td>
							生产过程质量情况：
						</td>
						<td>
							<textarea name="trackingtest.proquasitudation" cols="50"
									rows="3">${trackingtest.proquasitudation}</textarea>
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							车间记录人:
						</td>
						<td>
							<input type="text" value="${trackingtest.empwsr2.empName }"
									disabled="disabled" />
								<input type="hidden" name="trackingtest.empwsr2.empId"
									value="${trackingtest.empwsr2.empId }">
						</td>
					</div>
					<div colspan="50%">
						<td>
							日期：
						</td>
						<td>
							<input id="d2443" type="text" value="${trackingtest.prorecdate}"
									class="Wdate"
									onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2443_2',skin:'whyGreen'})" />
								<input type="hidden" id="d2443_2"
									value="${trackingtest.prorecdate}"
									name="trackingtest.prorecdate" />
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							成品检验情况：
						</td>
						<td>
							<textarea name="trackingtest.proexasitudation" cols="50"
									rows="3">${trackingtest.proexasitudation }</textarea>
						</td>
					</div>
					<div colspan="50%">
						<td>
							检验员：
						</td>
						<td>
						<input type="text" value="${trackingtest.examiner2.empName }"
									disabled="disabled" />
								<input type="hidden" name="trackingtest.examiner2.empId"
									value="${trackingtest.examiner2.empId }">
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							日期：
						</td>
						<td>
								<input id="d2444" value="${trackingtest.proexadate}" type="text"
									class="Wdate"
									onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2444_2',skin:'whyGreen'})" />
								<input type="hidden" value="${trackingtest.proexadate}"
									id="d2444_2" name="trackingtest.proexadate" />
						</td>
					</div>

				</tr>
			

					<input type="hidden" name="trackingtestId"
						value="${trackingtest.id }">
					<tr>
						<th colspan="100%">
							例行试验
						</th>
					</tr>
					<tr>
						<div colspan="50%">
							<td>
								试验机号
							</td>
							<td>
							<input type="text" name="trackingtest.trypsn"
									value="${trackingtest.trypsn}" />
							</td>
						</div>
						<div colspan="50%">
							<td>
								实验内容:
							</td>
							<td>
								<input type="text" name="trackingtest.psncontent"
									value="${trackingtest.psncontent}" />
							</td>
						</div>
					</tr>
					<tr>
						<div colspan="50%">
							<td>
								试验记录:
							</td>
							<td>
							<textarea name="trackingtest.prorecord" cols="50" rows="3"">
							${trackingtest.prorecord}
							</textarea>
							</td>
							<td>
								试验人：
							</td>
							<td>
								<input type="text" value="${trackingtest.tryper.empName }"
									disabled="disabled" />
								<input type="hidden" name="trackingtest.tryper.empId"
									value="${trackingtest.tryper.empId }">
							</td>
						</div>
					</tr>
					<tr>
						<div colspan="50%">
							<td>
								日期：
							</td>
							<td>
								<input id="d2447" value="${trackingtest.trydate}" type="text"
									class="Wdate"
									onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2447_2',skin:'whyGreen'})" />
								<input type="hidden" value="${trackingtest.trydate}"
									id="d2447_2" name="trackingtest.trydate" />
							</td>
						</div>
						<div colspan="50%">
							<td>
								过程试用建议：
							</td>
							<td>
								<textarea name="trackingtest.tryadvice" cols="50" rows="3">${trackingtest.tryadvice}</textarea>
							</td>
						</div>
					</tr>
					<tr>
						<div colspan="50%">
							<td>
								主管：
							</td>
							<td>
							<input type="text" value="${trackingtest.manger.empName }"
										disabled="disabled" />
									<input type="hidden" name="trackingtest.manger.empId"
										value="${trackingtest.manger.empId }">
							</td>
						</div>
						<div colspan="50%">
							<td>
								日期：
							</td>
							<td>
								<input id="d2448" type="text"
										value="${trackingtest.trymanagerdate}" class="Wdate"
										onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2448_2',skin:'whyGreen'})" />
									<input type="hidden" id="d2448_2"
										value="${trackingtest.trymanagerdate}"
										name="trackingtest.trymanagerdate" />
							</td>
						</div>
					</tr>
			</table>
			<table>
				<tr>
					<td align="center">
						<input type="submit" name="SYS_SET" value=" 保 存 " class="frm_btn">
					</td>
				</tr>
			

			</table>
			</form>
		</body>
</html>