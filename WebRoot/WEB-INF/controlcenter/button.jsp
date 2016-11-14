<%@ page contentType="text/html;charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>My JSP 'button.jsp' starting page</title>
    <script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"> </script>
    <script type="text/javascript" src="<%=basePath%>js/shuaxin.js"> </script>
	
  </head>
  
  <body >
    <div id="tip"></div> <br>
   
     <input type="hidden" value="meg" id="meg"> 
  </body>
</html>
