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
		<script language="javascript" src="<%=basePath %>js/oddEvenColor.js"></script>
		<script type="text/javascript" src="<%=basePath %>My97DatePicker/WdatePicker.js"></script>
		<script language="javascript" type="text/javascript">
function add()
{
text1=document.getElementById('b');
text2=document.getElementById('a');
text3=document.getElementById('c');

var value1;var value2; 
value1=parseFloat(text1.value);
value2=parseFloat(text2.value);
if(text1.value=="")
{
text3.value="";
}
else if( text2.value=="")
{
text3.value="";
}
else

text3.value=((value2-value1)/value2*100).toFixed(5);
setTimeout("add()", 5);

}
</script>
</head>


<body onLoad="add()">
<table class="title" style="width:85%"><tr>
      <td > 
      						         五车间日生产质量报表	
      </td>
    </tr></table>
	<form action="proreport/proreportfive_add" method="post">
	<table id="editTable" class="addTable">

         <tr >
    	<td >日期	
        </td>
        <td >  
        	<input id="d244" type="text" class="Wdate" onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})"/>
    <input type="hidden" id="d244_2"   name="proreportfive.rtdate"/><font color="#FF0000">*</font>
        </td>
    </tr>
    <tr >
    	<td >
       产量
        </td>
        <td  >   
        	<input id="a"  type="text" name="proreportfive.pronum"  class="itemname"/><font color="#FF0000">*</font>
        </td>
    </tr>
    
     <tr >
    	<td >不合格数
   	    </td>
        <td  >  
        	<input id="b"  type="text" name="proreportfive.unqnum" class="itemname" /><font color="#FF0000">*</font>
        </td>
    </tr>
       <tr >
    	<td  >  		
        		合格率
        </td>
        <td  >
        	<input id="c" type="text" name="proreportfive.passrate" align="middle" size="5" class="itemname"/>%
        </td>
    </tr>
      <tr >
    	<td  >巡检次数</td>
        <td  >  
        	<input type="text" name="proreportfive.insptime" class="itemname" />     <font color="#FF0000">*</font>  </td>
    </tr>
    <tr >
    	<th colspan="2">首检数</th>
    	</tr><tr>
            <td  >合格数</td>
            <td  >
                <input type="text" name="proreportfive.fiqua" class="itemname"/><font color="#FF0000">*</font>
            </td>
        </tr>
        <tr  >
            <td >不合格数</td>
            <td align="left" >
                <input type="text" name="proreportfive.fiunq" class="itemname" /><font color="#FF0000">*</font>
            </td>
        </tr>
   </table>
   <table class="btn">
    <tr >
    	<td  >
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
