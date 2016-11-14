<p><a href="${pageContext.request.contextPath}/j_spring_security_logout">logout</a></p>

<p>Hello ${currentUser.name}, your role is: ${currentUser.authoritiesString}</p>
<a href="admin.jsp"> admin</a>
<a href="user.jsp"> user</a>