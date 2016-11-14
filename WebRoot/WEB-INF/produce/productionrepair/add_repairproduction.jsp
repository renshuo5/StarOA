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
<title>添加维修单</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/vip.css" type="text/css">
<script language="javascript" src="js/jquery/jquery.js"></script>
<script language="javascript" src="js/public.js"></script>
<script language="javascript" src="js/textRightLeft.js"></script>
<script language="JavaScript" type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>

<sx:head /> 
</head>
  

  <body>
  	

<form action="produce/repairproduction/repairproduction_add" method="post">	
<table class="title" >
	
    <tr>
      <td >添 加 维 修 品						           
      
      </td>
    </tr></table>
    <table class="addTable">
    <tr >
    	<td >产品:</td>
       <td >
               <input type='text'  value=""  name="repairproduction.itemTypeName">
				
		</td>
    </tr>
    
     <tr >
    	<td >数量:
        </td>
        <td >  
        	<input align="left" type="text"  name="repairproduction.pno" value="" />
        </td>
    </tr>
  <tr >
    	<td  >接收时间:  	
        </td>
        <td>  
         <input id="d244_0" type="text" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2_0',skin:'whyGreen'})"/>
    <input type="hidden" id="d244_2_0" name="repairproduction.recDate"/>
        </td>
    </tr>
    
     <tr >
    	<td >
        	修复状况:
        	
        </td>
        <td ><textarea cols="50" rows="3" name="repairproduction.repstatus"></textarea></td>
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
</html>
