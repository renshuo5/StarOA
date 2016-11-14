<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
<head>
	<title>Spring Security</title>
</head>

<body>

      
    <form method="post" id="loginForm" action="${pageContext.request.contextPath}/j_spring_security_check">
        <p>User Name：</p>       
        <p><input type="text" name="j_username" id="j_username" /></p>
        <p>Password：</p>     
        <p><input type="password" name="j_password" id="j_password" /></p>
        <p><input type="submit" value="submit" /></p>
    </form>
      
</body>

</html> 