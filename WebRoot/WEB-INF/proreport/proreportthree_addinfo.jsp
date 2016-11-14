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
		 <script type="text/javascript" src="<%=basePath%>js/proreport.js"></script>
		<script language="javascript" src="<%=basePath %>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/textRightLeft.js"></script>
		<script type="text/javascript" src="<%=basePath %>My97DatePicker/WdatePicker.js"></script>
		<script language="javascript" type="text/javascript">
function add()
{
text1=document.getElementById('b');
text2=document.getElementById('a');
text3=document.getElementById('c');
text4=document.getElementById('d');

var value1;var value2; 
value1=parseFloat(text1.value);
value2=parseFloat(text2.value);
if(text1.value=="")
{
text3.value="";
text4.value=="";
}
else if( text2.value=="")
{
text3.value="";
}
else

text3.value=((value1/value2)*100).toFixed(5);
text4.value=text2.value-text1.value
setTimeout("add()", 5);

}
</script>
</head>


<body onLoad="add()">
	<form action="proreport/proreportthree_add" method="post">
	<table class="title" style="width:85%"><tr>
      <td > 
      						        三车间日生产质量报表	
      </td>
    </tr></table>
	<table id="editTable" class="addTable">
        <tr >
    	<td >日期	
        </td>
        <td >  
        	<input id="d244" type="text" class="Wdate" onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})"/>
    <input type="hidden" id="d244_2"   name="proreportthree.ptdate"/><font color="#FF0000">*</font>
        </td>
    </tr>
    <tr >
    	<td >生产批次
        </td>
        <td  >  
        	<input id="a"  type="text" name="proreportthree.probatch" class="itemname" /><font color="#FF0000">*</font>
        </td>
    </tr>
    
     <tr >
    	<td >合格批次</td>
        <td >  
        	<input id="b"  type="text" name="proreportthree.quabatch"  class="itemname" /><font color="#FF0000">*</font>
        </td>
    </tr>
    
    <tr >
    	<td >不合格批次</td>
        <td >  
        	<input id="d"  type="text" name="proreportthree.unqbatch" onClick="add()" class="itemname"/>
        </td>
    </tr>
        <tr >
    	<td >
        		合格率
        </td>
        <td >
        	<input id="c" type="text" name="proreportthree.passrate" size="5" onClick="add()" class="itemname"/>%
        </td>
    </tr>
     <tr >
    	<td > 		
        		不合格内容
        </td>
        <td >  
        	<textarea cols="30" rows="3" name="proreportthree.unqcon" class="itemname"></textarea>        </td>
    </tr>
    </table><table class="btn">
    <tr >
    	<td >
        	<input type="submit" name="submit" value="提交" class="frm_btn" />
        </td>
    </tr>   
    </table>
    </form>
    <SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
</body>
</html>
