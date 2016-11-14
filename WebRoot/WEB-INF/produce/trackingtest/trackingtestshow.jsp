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
			<div>
				跟踪单流向：→（
				<input type="text" disabled="disabled" size="5"
					value="${trackingtest.whDepartment.dptName}">
				）仓库→（
				<input type="text" value="${trackingtest.wsDepartment1.dptName}"
					size="5" disabled="disabled">
				）车间→（
				<input type="text" value="${trackingtest.wsDepartment1.dptName}"
					size="5" disabled="disabled" />
				）车间→检验部门→工艺→品工部
			</div>
			<form action="produce/trackingtest/trackingtest_list" method="post">
		
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
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							适用机种、部件
						</td>
						<td>
							<input type="text" value="${trackingtest.itemType.item.name }"
								disabled="disabled" size="10">
							<input disabled="disabled" type="text"
								value="${trackingtest.itemType.name }" size="10">
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
							<input type="text" disabled="disabled"
								value="${trackingtest.testdate}" />
						</td>
					</div>
					<div colspan="50%">
						<td>
							部件编号（批次号）：
						</td>
						<td>
							<input type="text" disabled="disabled"
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
							<textarea disabled="disabled" cols="50" rows="3">${trackingtest.qualitySituation }</textarea>
						</td>
					</div>
					<div colspan="50%">
						<td>
							车间记录人:
						</td>
						<td>
							<input type="text" value="${ trackingtest.empwsr1.empName }"
								disabled="disabled" />
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							日期：
						</td>
						<td>
							<input type="text" value="${trackingtest.whrecordate}"
								disabled="disabled">
						</td>
					</div>
					<div colspan="50%">
						<td>
							部件检验情况：
						</td>
						<td>
							<textarea disabled="disabled" cols="50" rows="3">${trackingtest.examineresult}</textarea>
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							检验员：
						</td>
						<td>
							<input type="text" value="${trackingtest.examiner1.empName}"
								disabled="disabled" />
						</td>
					</div>
					<div colspan="50%">
						<td>
							日期：
						</td>
						<td>
							<input type="text" value="${trackingtest.whexamineDate}"
								disabled="disabled" />
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
								disabled="disabled" />
						</td>
					</div>
					<div colspan="50%">
						<td>
							生产过程质量情况：
						</td>
						<td>
							<textarea disabled="disabled" cols="50" rows="3">${trackingtest.proquasitudation}</textarea>
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
						</td>
					</div>
					<div colspan="50%">
						<td>
							日期：
						</td>
						<td>
							<input type="text" disabled="disabled"
								value="${trackingtest.prorecdate}">
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							成品检验情况：
						</td>
						<td>
							<textarea disabled="disabled" cols="50" rows="3">${trackingtest.proexasitudation }</textarea>
						</td>
					</div>
					<div colspan="50%">
						<td>
							检验员：
						</td>
						<td>
							<input type="text" disabled="disabled"
								value="${trackingtest.examiner2.empName}" />
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							日期：
						</td>
						<td>
							<input type="text" disabled="disabled"
								value="${trackingtest.proexadate}" />
						</td>
					</div>

				</tr>
			
				
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
								<input type="text" disabled="disabled" value="${trackingtest.trypsn}" />
							</td>
						</div>
						<div colspan="50%">
							<td>
								实验内容:
							</td>
							<td>
								<input disabled="disabled" type="text" value="${trackingtest.psncontent}" />
							</td>
						</div>
					</tr>
					<tr>
						<div colspan="50%">
							<td>
								试验记录:
							</td>
							<td>
								<textarea name="prorecord" disabled="disabled" cols="50" rows="3" value=""><c:out value="${trackingtest.prorecord}"></c:out></textarea>
							</td>
							<td>
								试验人：
							</td>
							<td>
								<input type="text" name="" disabled="disabled"
									value="${trackingtest.tryper.empName}" />
							
							</td>
						</div>
					</tr>
					<tr>
						<div colspan="50%">
							<td>
								日期：
							</td>
							<td>
								<input id="d2445" disabled="disabled" type="text" value="${trackingtest.trydate}" />
								
							</td>
						</div>
						<div colspan="50%">
							<td>
								过程试用建议：
							</td>
							<td>
								<textarea name="tryadvice"  disabled="disabled" cols="50" rows="3"><c:out value="${trackingtest.tryadvice}"></c:out></textarea>
							</td>
						</div>
					</tr>
					<tr>
						<div colspan="50%">
							<td>
								主管：
							</td>
							<td>
								<input type="text" disabled="disabled" name=""
									value="${trackingtest.manger.empName }" />
								
							</td>
						</div>
						<div colspan="50%">
							<td>
								日期：
							</td>
							<td>
								
								<input type="text" id="d2446_2" disabled="disabled" value="${trackingtest.trymanagerdate}" />
							</td>
						</div>
					</tr>
			</table>
			<table>
				<tr>
					<td align="center">
						<input type="submit" name="SYS_SET" value=" 返 回 " class="frm_btn">
					</td>
				</tr>
				

			</table>
			</form>
		</body>
</html>