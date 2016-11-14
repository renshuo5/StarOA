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
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
	</head>
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
		<table class="title addTalbe">
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
						<a href="#"
							onclick="openWin('<%=basePath%>purchase/testnotes/testnotes_show?testnotesId=${trackingtest.testnotes.id}','examineTestnotes',800,600);return false">
							量试通知单<c:out value="${trackingtest.testnotes.id}"></c:out>
						</a>
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
			<form action="produce/trackingtest/trackingtest_proaudit"
				method="post">

				<input type="hidden" name="trackingtestId"
					value="${trackingtest.id }">
				<tr>
					<div colspan="50%">
						<td>
							整机成品编号（批次号）：
						</td>
						<td>
							<input id="text1" type="text1" name="propsn" value="${trackingtest.propsn}" class="checkEmptyShowInfo"/><font color="#FF0000">*</font>
						</td>
					</div>
					<div colspan="50%">
						<td>
							生产过程质量情况：
						</td>
						<td>
							<textarea cols="50"  id="text2" name="proquasitudation" rows="3" class="checkEmptyShowInfo">${trackingtest.proquasitudation}</textarea><font color="#FF0000">*</font>
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							<%--<input type="checkbox" checked="checked" id="che1" onclick=
	hidslt1();
name="empwsr2empId"
								>--%>
								<input type="hidden" name="empwsr2empId" value="${auditUser.employee.empId }">
							车间记录人:
						</td>
						<td>
							<input type="text"  disabled="disabled"
								value="${auditUser.employee.empName }" /><%--
								<input type="text" id="tab3" disabled="disabled"
								value="${trackingtest.empwsr2.empName }" />--%>
								<font color="#FF0000">*</font>
						</td>
					</div>
					<div colspan="50%">
						<td>
							日期：
						</td>
						<td>
							<input id="d2443" type="text" class="Wdate checkDateInfo" value="${trackingtest.prorecdate }"
								onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2443_2',skin:'whyGreen'})" />
							<input type="hidden" id="d2443_2" name="prorecdate" value="${trackingtest.prorecdate }" />
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							成品检验情况：
						</td>
						<td>
							<textarea name="proexasitudation" id="text2" cols="50" rows="3">${trackingtest.proexasitudation }</textarea>
						</td>
					</div>
					<div colspan="50%">
						<td>
							<input type="hidden"  
name="examiner2empId"
								value="${auditUser.employee.empId }">
							检验员：
						</td>
						<td>
							<input type="text" disabled="disabled" 
								value="${auditUser.employee.empName }" />
								<font color="#FF0000">*</font><%--
						<input type="text" disabled="disabled" id="tab4"
								value="${trackingtest.examiner2.empName }" />
						--%></td>
					</div>
				</tr>
				<tr>
					<td>
						日期：
					</td>
					<td>
						<input id="d2444" type="text" class="Wdate checkDateInfo"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2444_2',skin:'whyGreen'})" />
						<input type="hidden" id="d2444_2" name="proexadate" />
					</td>
				</tr>
		</table>
		<table>
			<tr>
				<td align="center">
					<input type="submit" name="SYS_SET" value=" 保 存 " class="frm_btn">
				</td>
			</tr>
			</form>

		</table>
		<script type="text/javascript">
	$(document).ready(function() {
		//隐藏模板tr

			$("#tab1").hide();
			$("#tab2").hide();
		
        	if($("#text1").val()!=""){

        		$("#text1").attr("readonly","readonly")

            	}

        	if($("#text2").val()!=""){

        		$("#text2").attr("readonly","readonly")

            	}
        	if($("#tab3").val()==""){
        		
        		$("#che1").attr("checked","")

            	}
			
		})
</script>
		<script type="text/javascript">
	function hidslt1() {

		$("#tab1").toggle("slow");
		$("#tab3").toggle("slow");
	}
</script>
		<script type="text/javascript">
	function hidslt2() {

		$("#tab2").toggle("slow");
		$("#tab4").toggle("slow");
	}
</script>
	</body>
</html>