<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link type="text/css" href="css/vip.css" rel="stylesheet" />
		<link type="text/css" href="css/admin.css" rel="stylesheet" />
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">


		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>

		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/produce.js"></script>
		<title>月生产计划单</title>
	</head>

	<body>



		<form action="produce/productionplan/productionplan_edit"
			method="post">
			&nbsp;
			<input type="hidden" name="prscheck.id" value="${prscheck.id }" />

			<div>

				<table class="addTable">
					<tr>
						<td>

							编制日期:
						</td>
						<td>
							<input id="d244" type="text" class="Wdate"
								value="${prscheck.prsDate}"
								onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
							<input type="hidden" id="d244_2" value="${prscheck.prsDate}"
								name="prscheck.prsDate" />
						</td>
						<td>
					</tr>
					<tr>
						<td>
							月份:
						</td>
						<td>
							<input id="d244" type="text" class="Wdate" value="${monString}"
								onfocus="WdatePicker({dateFmt:'yyyy年M月',vel:'d244_2',skin:'whyGreen'})" />
							<input type="hidden" id="d244_2" value="${prscheck.sdate}"
								name="prscheck.sdate" />

						</td>
					</tr>
					<tr>
						<td>
							车间:
						</td>
						<td>
							<input type="text" disabled="disabled" name=""
								value="${prscheck.department.dptName }" />
							<input type="hidden" name="prscheck.department.id"
								value="${prscheck.department.id}" />
						</td>
					</tr>
					<tr>
						<td>
							编号：
						</td>
						<td>
							<input type="text" name="prscheck.psn" value="${prscheck.psn}"
								size="5" id="prscheckpsn" class="itemname" />
							<span id="checkprscheckpsn"
								style="color: #FF0000; font-size: 12px;"></span>
						</td>
					</tr>
					<tr>
						<td>
							编制：
						</td>
						<td>
							<input type="text" name="" size="20"
								value="${prscheck.employeeEdit.empName}" class="itemname" />
							<input type="hidden" name="prscheck.employeeEdit.empId" size="20"
								value="${prscheck.employeeEdit.empId}" />
						</td>
					</tr>
				</table>
			</div>
			<table class="list" id="tb">

				<tr align="center">

					<th>
						项目内容
					</th>
					<th>
						单位
					</th>
					<th>
						数量
					</th>
					<th>
						完成日期
					</th>
					<th>
						备注
					</th>
					<th>
						添加
					</th>
					<th>
						删除
					</th>
				</tr>
				<%--
      ----------------隐藏模板行
  --%>

				<tr id="rowTemplete_0">

					<td><input type="hidden" name=pcontents value=""/>
						
						<input type="text" disabled="disabled" name="itemNameList"
							size="8" id="itemNameId_0" />
           <input type="hidden" name="itemTypeids" id="itemTypeIdId_0" />
						<input type="text" disabled="disabled" name="itemTypeNameList"
							id="itemTypeNameId_0" size="12" />
						<input id='item_0' type='button' value='选择' class='frm_btn'
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false"/>
					</td>
					<td>
						<input type="text" name="punits" />
					</td>
					<td>
						<input type="text" name="pnumbers" class="checkNum"/>
					</td>
					<td>
						<input id="d244_0" type="text" class="Wdate"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2_0',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2_0" name="cdates" />
					</td>
					<td>
						<textarea name="pnotes">
            	</textarea>
					</td>
					<td>
						<img src="<%=basePath%>images/add.png"
							onclick="return addBatchRow(this)" />
					</td>
					<td>
						<img src="<%=basePath%>images/del.png"
							onclick="return deleteBatchRow(this)" />
					</td>
				</tr>
				<%-- 
  
隐藏模板行结束  
  
  --%>

				<c:if test="${!empty pm.datas}">
					<c:forEach items="${pm.datas}" var="proplan" varStatus="vs">
						<tr align="center">

							<td>

								 <input type="text" name="itemTypeids" value="${proplan.itemType.id}" />
						<input type="text" disabled="disabled" name="itemNameList"
							size="8" id="itemNameId_${vs.index}" value="${proplan.itemType.item.name }" />
          
						<input type="text" disabled="disabled" name="itemTypeNameList"
							id="itemTypeNameId_${vs.index }" size="12"  value="${proplan.itemType.name }"/>
						<input id='item_0' type='button' value='选择' class='frm_btn'
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false"/>

							</td>
							<td>
								<input type="text" name="punits" value="${proplan.punit}"
									class="itemname" />
							</td>
							<td>
								<input type="text" name="pnumbers" value="${proplan.pnumber}"
									class="itemname checkNum" />
							</td>
							<td>
								<input id="d244${vs.count}" value="${proplan.cdate}" type="text"
									class="Wdate"
									onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2442_${vs.count}',skin:'whyGreen'})" />
								<input type="hidden" id="d2442_${vs.count}" name="cdates"
									value="${proplan.cdate}" />
							</td>
							<td>
								<textarea name="pnotes" class="itemname">${proplan.pnote}
            	</textarea>
							</td>
							<td>
								<img src="<%=basePath%>images/add.png"
									onclick="return addBatchRow(this)" />
							</td>
							<td>
								<img src="<%=basePath%>images/del.png"
									onclick="return deleteBatchRow(this)" />
							</td>
						</tr>
					</c:forEach>
				</c:if>

			</table>
			<table>
				<tr bgcolor="#f5f5f5">
					<td>
						<input type="submit" value="提交" class="frm_btn" id="SYS_SET" />
					</td>
				</tr>
			</table>
		</form>
		<SCRIPT type=text/javascript>
	$(document).ready(registerPre);
</SCRIPT>
	</body>
</html>