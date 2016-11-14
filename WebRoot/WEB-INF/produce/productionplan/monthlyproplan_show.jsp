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
		<title>生产计划单</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath %>css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="js/public.js"></SCRIPT>
		</head>
		 <body>
<table>
  <tr
  ><td colspan="2" align="right">
  </td>

    <td colspan="1" align="right">
月份:${monString}</td>
     <td colspan="1" align="right">
      车间:${prscheck.department.dptName}
     </td>
  </tr>
  <tr>
    <td colspan="3" align="left"> 编号：${prscheck.psn}
     </td>
    <td  colspan="3" align="left"> 编制：${prscheck.employeeEdit.empName}
      </td>
  </tr>
  
  <table class="list">
  <tr >
    <th>项目内容</th>
    <th>单位</th>
    <th>数量</th>
    <th>完成日期</th>
    <th>备注</th>
  </tr>
<c:if test="${!empty pm.datas}">
					<c:forEach items="${pm.datas}" var="proSchedule">
							<tr>	
								<td >
									<div align="center"> 
					                     
								${proSchedule.pcontent}
									</div>
								</td>
								<td >
									<div align="center">
								${proSchedule.punit}
									</div>
								</td>
								<td>
									<div align="center">
									${proSchedule.pnumber}
								</div>
								</td>
								<td>
									<div align="center">
											${proSchedule.cdate}
									</div>
								</td>
								<td>
									<div align="center">
							${proSchedule.pnote}
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					</table> 
<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
						
						<pg:param name="prscheckId" value="${prscheck.id}"/>
						<pg:first>
							<a href="${pageUrl}" id="firstpageurl">首页</a>
						</pg:first>
						<pg:prev>
							<a href="${pageUrl }">《</a>
						</pg:prev>
						<pg:pages>
							<c:choose>
								<c:when test="${currentPageNumber eq pageNumber}">
									<font color="red">${pageNumber }</font>
								</c:when>
								<c:otherwise>
									<a href="${pageUrl }">${pageNumber }</a>
								</c:otherwise>
							</c:choose>
						</pg:pages>
						<pg:next>
							<a href="${pageUrl }">》</a>
						</pg:next>
						<pg:last>
							<a href="${pageUrl }">尾页</a>
						</pg:last>
					</pg:pager>
					&nbsp;&nbsp;
				</th>
				<!-- 更改pagesize 开始-->
				<th align=left valign="middle" noWrap width="10%">
					<div style="height: 20px; overflow: hidden; valign: middle">
						<form
							action="<%=request
							.getAttribute("javax.servlet.forward.servlet_path")
							.toString().substring(1)%>">

							<input type="hidden" name="prscheckId"
								value="${prscheck.id}" />

							
							<select name="pagesize" onchange="this.form.submit()"
								style="height: 16px; overflow: hidden; valign: middle">
								<c:forEach begin="1" end="50" step="3" var="i">
									<option value="${i}"
										<c:if test="${pagesize eq i }">selected</c:if>>
										${i}
									</option>
								</c:forEach>
							</select>
							行/页

						</form>
					</div>

				</th>
			</tr>
		</table>
        <tr>
      
       
            <c:if test="${prscheck.employeeAudit.empId!=null}">
        
         <td align="center" colspan="3">
           
           审核：${prscheck.employeeAudit.empName }</td>
       
        
        </c:if>
 		   <c:if test="${prscheck.employeeApprove.empId!=null}">
          
          <td align="left" colspan="2">	
 			批准：${prscheck.employeeApprove.empName }
       </td> 
          
          </c:if>
</tr>

</table>
</body>
</html>
