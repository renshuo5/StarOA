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
		<title>选择物料</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath %>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
	    <script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
	    <script type="text/javascript" src="<%=basePath%>js/produce.js"></script>
		<script language="javascript" src="<%=basePath %>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/textRightLeft.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script type="text/javascript" src="<%=basePath %>My97DatePicker/WdatePicker.js"></script>
  </head>
  
  <body>
   <table>
				<tr height="15">
					<td background="images/shadow_bg.jpg"></td>
				</tr>
		</table>


<form action="produce/productionplan/productionplan_add" method="post">
<!--<html:hidden property="parentid"/>-->
<!--<input type="hidden" name="method" value="add">-->

  <table class="title editTable">
  
    <tr>
      <td>添加生产计划单</td>
    </tr>
    </table>
    <table class="addTable">
   	<tr> 
	      <td>计划月份：</td>
	      <td> 
                   <input id="d244" type="text" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy年M月',vel:'d244_2',skin:'whyGreen'})"/>
    <input type="hidden" id="d244_2" name="prscheck.sdate"/> 
                <font color="#FF0000">*</font></td>
   	</tr>
   	<TR>
					<TD>
						车间
						</TD>
					
						<TD>
						<select name="prscheck.department.id">
                      <option value="">请选择</option>
                         <c:forEach items="${departments}" var="dpt">
				           <option value="${dpt.id}">
				          ${dpt.dptName}
				           </option>
			             </c:forEach>
		            </select><font color="#FF0000">*</font>
					</TD>
				</TR>
   	<tr> 
	      <td>编号：</td>
	      <td><input type="text" name="prscheck.psn" id="prscheckpsn" class="itemname"/><span id="checkprscheckpsn" style="color: #FF0000; font-size: 12px;"></span><font color="#FF0000">*</font></td>
   	</tr>
   	 	<tr> 
	      <td>制表时间：</td>
	      <td> <input id="d244" type="text" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441',skin:'whyGreen'})"/>
    <input type="hidden" id="d2441" name="prscheck.prsDate"/><font color="#FF0000">*</font></td>
   	</tr>
   	<tr> 
	      <td>编制人：</td>
	      <td><input type="text" name="" value="${auditUser.employee.empName}" disabled="disabled"/>
								<input type="hidden" name="prscheck.employeeEdit.empId" value="${auditUser.employee.empId}"/><font color="#FF0000">*</font></td>
	      
   	</tr>
   	 </table><table class="list">
   	    	<tr>
            
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
      
  <tr id="rowTemplete_0">
       
        	<td>
          <input type="hidden" name=pcontents value=""/>
       <input type="hidden" name="itemIdList" />
						<input type="text" disabled="disabled" name="itemNameList"
							size="8" id="itemNameId_0" />
           <input type="hidden" name="itemTypeids" id="itemTypeIdId_0" />
						<input type="text" disabled="disabled" name="itemTypeNameList"
							id="itemTypeNameId_0" size="12" />
						<input id='item_0' type='button' value='选择' class='frm_btn'
							onclick="openWin('<%=basePath%>produce/productionplan/productionplan_selectItem?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false"><font color="#FF0000">*</font>
            </td>
            <td>
            	<input type="text" size="10" name="punits" class="itemname"/>
            </td>
             <td>
            	<input type="text" name="pnumbers" size="5" class="itemname checkNum"/><font color="#FF0000">*</font>
            </td>
             <td>
            	 <input id="d244_0" type="text" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2_0',skin:'whyGreen'})"/>
    <input type="hidden" id="d244_2_0" name="cdates"/> </td> 
<td>
            	<textarea name="pnotes" class="itemname" >
            	</textarea>
            </td>
            <td>
            <img src="<%=basePath%>images/add.png" onclick="return addBatchRow(this)" />
            </td>
            <td>
             <img src="<%=basePath%>images/del.png" onclick="return deleteBatchRow(this)" />
            </td>
        </tr> 
      
    
  </table><table class="btn" style="width:100%">
  
  <tr > 
      <td > <input type="hidden" name="addplan" value="${addplan}"/>
          <input type="submit" name="SYS_SET" value=" 保 存 " class="frm_btn" id="SYS_SET">
          <input type="button" class="frm_btn" value="关闭窗口" onclick=window.close();>
        </div></td>
    </tr>
  </table>
  </form>
  <SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
  </body>
</html>
