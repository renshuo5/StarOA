<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
<title>缺料登记</title>
	<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css"/>
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css"/>
		<script type="text/javascript" src="<%=basePath %>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/produce.js"></script>
		<script language="javascript" src="<%=basePath %>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath %>My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<form action="produce/shortm/shortm_add" method="post">
<table class="title" style="width: 85%">
    <tr>
     <td>缺 料 报 告 单</td>
   	</tr>
</table>
 <table class="addTable">
   <tr>
          <td class="tdright">编号：
          </td><td class="tdleft">
          <input type="text" name="shortm.shoid" size="8" class="checkEmptyShowInfo"/> </td>
   </tr>
   <tr>
           <td class="tdright">时间：
           </td><td class="tdleft">
            <input id="d244_0" type="text" class="Wdate checkDateInfo" onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2_0',skin:'whyGreen'})"/>
    <input type="hidden" id="d244_2_0" name="shortm.sdate"/></td>
   </tr>
   <tr>
       <td class="tdright">申请单位:
       </td><td class="tdleft">      
            <select name="shortm.department1.id" class="selectin"> 
              <option>请选择</option>
              <c:forEach items="${departments}" var="dpt2">
                <option value="${dpt2.id}"> ${dpt2.dptName} </option>
              </c:forEach>
            </select>
          </td>
    </tr>
    <tr>
          <td class="tdright">车间主任：
          </td><td class="tdleft">
           <select name="shortm.employee1.empId"  class="selectin">
              <option>请选择</option>
              <c:forEach items="${employees}" var="emp1">
                <option value="${emp1.empId}"> ${emp1.empName} </option>
              </c:forEach>
            </select>
           </td>
    </tr>
    <tr>
          <td class="tdright">申请人：
          </td><td class="tdleft">
          <select name="shortm.employee2.empId"  class="selectin">
              <option>请选择</option>
              <c:forEach items="${employees}" var="emp2">
                <option value="${emp2.empId}"> ${emp2.empName} </option>
              </c:forEach>
            </select>
                     </td>
        </tr>
        </table>
        <table class="list editTable">
        <tr>
          <th>材料名称 </th>
          <th>型号 规格 </th>
          <th>单位 </th>
          <th>数量 </th>
          <th>用途 </th>
          <th>单价 </th>
          <th>备注 </th>
          <th>添加  </th>
          <th>删除   </th>
        </tr>
        <!---------------------------LOOP START------------------------------>
        <tr id="rowTemplete_0" class="oddRow">
           <td align="center">
           <input type="text" name="itemNames" id="itemNameId_0" disabled="disabled" class="selectin" size="6"/>
           <input type="hidden" name="itemIds" id="itemIdId_0"/></td>
          <td align="center" valign="top">
          <input type="text" name="itemTypeNames" id="itemTypeNameId_0" disabled="disabled" size="6"/>
          <input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',900, 600);return false"/>
          	<input type="hidden" name="itemTypeIds" id="itemTypeIdId_0"/>
          </td>
        <td align="center" ><input type="text" name="units" size="6" class="checkEmptyShowInfo"/></td>
        <td align="center"><input type="text" name="nums" size="6" class="checkNumShowInfo"/></td>
          <td align="center"><input type="text" name="userfs" size="8" /></td>
          <td align="center"><input type="text" name="uprices" size="6" class="checkFloatNum"/>
          <input type="hidden" name="prices" size="6" /></td>
          <td align="center"><input type="text" name="notes"></input>

          </td>
           <td align="center"><img src="<%=basePath%>images/add.png" onclick="return addBatchRow(this)" /></td>
        <td align="center">
              <img src="<%=basePath%>images/del.png" onclick="return deleteBatchRow(this)" />            </td>
   </tr>
        <tr>
          <td align="center" colspan="11">
              <input name="AddDic" type="submit" class="frm_btn" id="AddDic" value="提交"/>
                        </td>
        </tr>
      </table>
      	</form>
<script type=text/javascript>
            $(document).ready(registerPre);
        </script>
  </body>
</html>
					