<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<%String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 
<base href="<%=basePath%>">
<title>产品进仓单</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/vip.css" type="text/css">
<script language="javascript" src="js/public.js"></script>
<script language="JavaScript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<sx:head /> 
</head>

<body>
	
    <table class="title">
    	<tr>
    		<td align="center">领料单</td>
        </tr>
        </table>
        <table>
        <tr>
        	<td  colspan="4">单位：<select id="dptName" name="dptName" ">
             <option>请选择</option>
             <c:forEach items="${fdpts}" var="dpt">
				<option value="${dpt.id}">
				${dpt.dptName}
				</option>
			</c:forEach>	  
       </select></td>
            <td  colspan="5" >日期：<input id="d244_0" type="text" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2_0',skin:'whyGreen'})"/>
    <input type="hidden" id="d244_2_0" name=""/></td>
        </tr>
        <tr>
        	<th>材料代码</th>
            <th >名　　称</th>
            <th >型号名称</th>
            <th >计量单位</th>
            <th >申请数量</th>
            <th >实发数量</th>
            <th >单价</th>
            <th >金额</th>
            <th >用　　途</th>
        </tr>
        <tr>
        	<td valign="top">
						<input name="itemTypeIds" type="text" size="8" id="itemmCode_0" disabled="disabled">
						</td>
						<td align="center" valign="top">
							<input type="text" size="10" id="itemNameId_0"
								disabled="disabled">
							<input type="hidden" name="itemId" id="itemIdId_0">
						</td>
						<td align="center" align="top">
							<input type="text" size="10" name="itemTypeNameIds"
								id="itemTypeNameId_0" disabled="disabled"></input>
							<input type="hidden" name="itemTypeIds" id="itemTypeIdId_0"></input>
							<input type="button" value="选择" class="frm_btn"
								onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false">
						</td>
            <td align="center"><input type="text" name="" size="5" /></td>
            <td align="center"><input type="text" name="" size="5" /></td>
            <td align="center"><input type="text" name="" size="5" /></td>
            <td align="center"><input type="text" name="" size="7" /></td>
            <td align="center"><input type="text" name="" size="7" /></td>
            <td align="center"><input type="text" name="" size="10" /></td>
            
        </tr>
        <tr>
        	<td colspan="2">金　额　合　计</td>
            <td colspan="7"><input type="text" name="" /></td>
        </tr>
        <tr>
        	<td colspan="2">核准：<input /></td>
            <td colspan="3">部门负责人：<input Id="employeeNameId_0" type="text" disabled="disabled" value="" align="left" />
           <input type="hidden" id="employeeIdId_0" name="employeeId"> 
            <input type="button" value="选择" class="frm_btn"
	onclick="openWin('<%=basePath%>persons/employee/employee_selectInput?paname=0','人员选择',800, 600, 1);return false"
>  </td>
            <td colspan="4">领料人：<input /></td>
        </tr>
         <tr>
        	<td colspan="9" align="center"><input type="button" name="cancel" value="提交" class="frm_btn" onclick="javascript:window.location.href='审核.html'" ></td>

        </tr>
    </table>
    
</body>
</html>
