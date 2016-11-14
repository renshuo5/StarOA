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
			<table class="title addTable" >
				<tr>
					<td>
						量试过程跟踪单：
					</td>
				</tr>
			</table>
	<form action="produce/trackingtest/trackingtest_wsaudit"
					method="post">
			<input type="hidden" name="trackingtestId"
						value="${trackingtest.id}">
			<table class="addTable">
				<tr>
					<td>
						样品名称：
					</td>
					<td>
						<input type="text" disabled="disabled"
							value="${trackingtest.testnotes.supplierinfo.itemname }" />
					</td>
				</tr>
				<tr>
					<td>
						型号:
					</td>
					<td>
						<input type="text" disabled="disabled"
							value="${trackingtest.testnotes.supplierinfo.itemtypename }" />
					</td>
				</tr>
				<tr>
					<td>
						适用机种、部件：
					</td>
					<td>
						<input type="text" value="${trackingtest.itemType.item.name }"
							disabled="disabled" size="10">
						<input disabled="disabled" type="text"
							value="${trackingtest.itemType.name }" size="10">
					</td>
				</tr>
				<tr>
					<td class="tdright">
						量试通知单号：
					</td>
					<td class="tdleft">
						<a href="#" onclick="openWin('<%=basePath%>purchase/testnotes/testnotes_show?testnotesId=${trackingtest.testnotes.id}','examineTestnotes',800,600);return false">
							量试通知单<c:out value="${trackingtest.testnotes.id}"></c:out></a>
					</td>
				</tr>
				<tr>
					<td>
						计划量试日期
					</td>
					<td>
						<input type="text" disabled="disabled"
							value="${trackingtest.testdate}" />
					</td>
				</tr>
				
					
					<tr>
						<td>
							部件编号（批次号）：
						</td>
						<td>
					
							<input id="text1" type="text" name="itempsn" value="${trackingtest.itempsn}" class="checkEmptyShowInfo"/>
						<font color="#FF0000">*</font></td>
					</tr>
					<tr>
						<td>
							生产过程质量情况：
						</td>
						<td>
							<textarea id="text2" name="qualitySituation" cols="15" rows="2" class="checkEmptyShowInfo"><c:out value="${trackingtest.qualitySituation}"></c:out></textarea><font color="#FF0000">*</font>
						</td>
					</tr>
					<tr>
						<td>
							<%--<input id="text1" onclick="hidslt1()" type="checkbox"  name="empwsr1empId"
								value="${auditUser.employee.empId}">--%>车间记录人:
						</td>
						<td>
							<input  type="text" value="${auditUser.employee.empName}"
								readonly="readonly"/>
								<input type="hidden" name="empwsr1empId" value="${auditUser.employee.empId}">
									<%--<input id="tab3" type="text" value="${trackingtest.empwsr1.empName}"
								disabled="disabled" />--%><font color="#FF0000">*</font>
							
						</td>
					</tr>
					<tr>
						<td>
							日期：
						</td>
						<td>
							<input id="d244"  type="text" class="Wdate checkDateInfo"
								onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" value="${trackingtest.whrecordate }"/>
							<input type="hidden" id="d244_2" name="whrecordate" value="${trackingtest.whrecordate }"  />

						</td>
					</tr>
					<tr>
						<td>
							部件检验情况：
						</td>
						<td>
							<textarea id="text2" name="examineresult" cols="15" rows="2" class="checkEmptyShowInfo">${trackingtest.examineresult}</textarea><font color="#FF0000">*</font>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td>
							<%--<input onclick='hidslt2()'   type="checkbox"  name="examiner1empId"
								value="${auditUser.employee.empId}">
						--%>检验员：</td>
						<td>
					
						<input  type="text"  value="${auditUser.employee.empName}"
								readonly="readonly" />
						<input type="hidden" name="examiner1empId" value="${auditUser.employee.empId}">
						<%--<input type="text" id="tab4" value="${trackingtest.examiner1.empName}"
								disabled="disabled" />
							
						--%></td>
					</tr>
					<tr>
						<td>
							日期：
						</td>
						<td>
							<input id="d2441" type="text" class="Wdate checkDateInfo"
								onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2',skin:'whyGreen'})" />
							<input type="hidden" id="d2441_2" name="whexamineDate" />
						</td>
					</tr>
			</table>
			<table class="addTabel">
				<tr>
					<td>
						<input type="submit" name="SYS_SET" value=" 保 存 " class="frm_btn">
					</td>
				</tr>

				
			</table>
			</form>
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
            
        })
    </script>
		<script type="text/javascript">   
        	function   hidslt1()   {   
	
        		$("#tab1").toggle("slow");   
        		$("#tab3").toggle("slow");   
			}
			
    </script>
    		<script type="text/javascript">   
        	function   hidslt2()   {   
	
        		$("#tab2").toggle("slow");  
        		$("#tab4").toggle("slow");    
			}
			
    </script>
    
    <script type="text/javascript">
    
    
    
    </script>
    
		</body>
</html>