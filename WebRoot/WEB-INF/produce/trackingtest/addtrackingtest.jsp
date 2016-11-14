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
		<link rel="stylesheet" href="<%=basePath %>css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath %>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath %>js/public.js"></script>
  <script type="text/javascript" src="<%=basePath %>My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript" src="<%=basePath %>js/addTableAlign.js"></script>
  <body>
    <form action="produce/trackingtest/trackingtest_add" method="post">
    <div> 跟踪单流向：→（
      <select name="trackingtest.whDepartment.id">
                      <option value="" class="selectone">请选择</option>
                         <c:forEach items="${departments}" var="dpt">
				           <c:if test="${dpt.dptType==3}">
				            <option value="${dpt.id}">
				          ${dpt.dptName}
				           </option>
				           
				           
				           </c:if>
				          
			             </c:forEach>
		            </select>
      ）<font color="#FF0000">*</font>
      仓库→（
      <select name="trackingtest.wsDepartment1.id">
                      <option value="" class="selectone">请选择</option>
                         <c:forEach items="${departments}" var="dpt">
                         <c:if test="${dpt.dptType==2}">
                         
                          <option value="${dpt.id}">
				          ${dpt.dptName}
				           </option>
                         </c:if>
				          
			             </c:forEach>
		            </select>
      ）<font color="#FF0000">*</font>
      车间→（
       <select name="trackingtest.wsDepartment2.id" class="selectone">
                     <option value="">请选择</option>
                         <c:forEach items="${departments}" var="dpt">
                         <c:if test="${dpt.dptType==2}">
                         
                          <option value="${dpt.id}">
				          ${dpt.dptName}
				           </option>
                         </c:if>
				          
			             </c:forEach>
		            </select>
      ）<font color="#FF0000">*</font>
      车间→检验部门→工艺→品工部 </div>
      <table class="title addTable" >
      
      <td>
      
          量试过程跟踪单 
      </td>
      
    



<table class="addTable">
				<tr >
					
						<td>样品名称、型号：
						</td>
						<td >
						<input type="text" size="10" disabled="disabled" value="${testnotes.supplierinfo.itemname}" >
						<input type="text" size="10" disabled="disabled" value="${testnotes.supplierinfo.itemtypename}" ><font color="#FF0000">*</font>
         <input type="hidden" name="trackingtest.testnotes.id" value="${testnotes.id}">
        
					</td>
				</tr>
				<tr >
					
						<td>适用机种、部件：</td>
					<td >
						<input type='text' id='itemNameId_0' disabled='disabled' class="selectin">
          <input type='text' id='itemTypeNameId_0' disabled='disabled'>
					<input type='hidden' name='trackingtest.itemType.id' id='itemTypeIdId_0'>
					 <input id='item_0' type='button' value='选择' class='frm_btn' onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false">
					</td>
				</tr>
				<tr><td class="tdright">试量通知单号：</td><td class="tdleft">${testnotes.id} <a href="#" onclick="openWin('<%=basePath%>purchase/testnotes/testnotes_show?testnotesId=${testnotes.id}','examineTestnotes',800,600);return false">
							量试通知单<c:out value="${trackingtest.testnotes.id}"></c:out></a></td></tr>	
				<tr><td>计划量试日期：</td><td><input id="d244" type="text" class="Wdate checkDateInfo" onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})"/><font color="#FF0000">*</font>
    <input type="hidden" id="d244_2" name="trackingtest.testdate"/></td></tr>
  
			
			</table>
<table><input type="submit" name="SYS_SET" value=" 保 存 " class="frm_btn" ></table>


    </form>
  </body>
</html>