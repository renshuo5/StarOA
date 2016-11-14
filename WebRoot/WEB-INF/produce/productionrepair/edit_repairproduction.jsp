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
<html>
<head>
 
<base href="<%=basePath%>">
<title>修改维修单</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/vip.css" type="text/css">
<script language="javascript" src="js/jquery/jquery.js"></script>
<script language="javascript" src="js/public.js"></script>
<script language="javascript" src="js/textRightLeft.js"></script>
<script language="JavaScript" type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>

<sx:head /> 
</head>
  
  <body>
  <body>
  
  	
<form action="produce/repairproduction/repairproduction_update" method="post">	
<input type="hidden" name="repairproduction.id" value="${repairproduction.id}">
<table class="title" style="width:85%">
	
    <tr>
      <td >修 改 维 修 品						           
      
      </td>
    </tr></table>
<table class="addTable">
    
    <tr >
    	<td  >产品:</td>
       <td >
					<input type='text' name="repairproduction.itemTypeName" value="${repairproduction.itemTypeName }" >
					
				</td>
    </tr>
    
     <tr >
    	<td  >数量:	
        </td>
        <td >  
        	<input align="left" type="text"  name="repairproduction.pno" value="${repairproduction.pno }" />
        </td>
    </tr>
  <tr >
    	<td >接收时间:       	
        </td>
        <td >  
         <input id="d244_0" type="text" class="Wdate" value="${recDate}" onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2_0',skin:'whyGreen'})"/>
    <input type="hidden" id="d244_2_0" name="repairproduction.recDate" value="${repairproduction.recDate}"/>
        </td>
    </tr>
    
     <tr >
    	<td >
    		
        	修复状况:
        	
        </td>
        <td ><textarea cols="50" rows="3" name="repairproduction.repstatus" >${repairproduction.repstatus }</textarea></td>
    </tr>
    <tr >
    <td></td>
    	<td >
        	<!--  <input type="submit" name="submit" value="提交" />-->
        	<input type="submit" name="SYS_SET" value=" 保 存 " class="frm_btn">
          <input type="button" class="frm_btn" value="关闭窗口" onclick=window.close();>
        </td>
    </tr>   
    </table>
    </form>
</body>
  </body>
</html>
