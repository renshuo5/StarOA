<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";%>
<html>
<head>
<base href="<%=basePath%>">
<title>缺料品修改</title>
	<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath %>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath %>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath %>My97DatePicker/WdatePicker.js"></script>
</head>
<body>

<form action="produce/shortm/shortm_update">
<input type="hidden" name="shortmID" value="${shortm.id }"/>
<input type="hidden" name="shogoodID" value="${shogood.shog_id}">
 <table class="addTable">
        
        <tr>
          <th width="10%" align="center" >材料名称 </th>
          <th width="10%" align="center" >型号 规格 </th>
          <th width="10%" align="center" >单位 </th>
          <th width="7%"  align="center" >数量 </th>
          <th width="16%" align="center" >用途 </th>
          <th width="8%"  align="center" >单价 </th>
         
          <th   align="center" >备注 </th>
        
          <th width="5%" align="center" >删除   </th>
        </tr>
        <!---------------------------LOOP START------------------------------>
        <tr id="rowTemplete_0">
        
           <td align="center"><input type="text" name="itemNames" id="itemNameId_0" disabled="disabled" value="${shogood.itemType.item.name }" size="10"/>
           <input type="hidden" name="itemIds" id="itemIdId_0" value="${shogood.itemType.item.id }"/></td>
          <td align="center"><input type="text" name="itemTypeNames" id="itemTypeNameId_0" disabled="disabled" size="13" value="${shogood.itemType.name}"/>
          <input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',900, 600);return false">
          	<input type="hidden" name="itemTypeIds" id="itemTypeIdId_0" value="${shogood.itemType.id }"/>
          </td>
        <td align="center"><input type="text" name="units" value="${shogood.unit}" size="8" class="checkEmptyShowInfo"/></td>
        <td align="center"><input type="text" name="nums" value="${shogood.num}" size="8" class="checkNumShowInfo"/></td>
          <td align="center"><input type="text" name="userfs" value="${shogood.userf}" size="8"/></td>
          <td align="center"><input type="text" name="uprices" value="${shogood.uprice}" size="8" class="checkEmptyShowInfo"/></td>
          <input type="hidden"name="prices" value="${shogood.price}" size="8"/>
          <td align="center"><textarea name="notes" value="${shogood.note}" rows="2" cols="10"/></textarea></td>
         
        <td align="center">
              <img src="<%=basePath%>images/del.png" onClick="return deleteBatchRow(this)" />            </td>
   </tr>
        <tr>
          <td colspan="11" align="center" >
              <input name="AddDic" type="submit" class="frm_btn" id="AddDic" value="提交">
                        </td>
        <tr>
      </table>
      	</form>

  </body>
</html>
					