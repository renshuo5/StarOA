<%@ page contentType="text/html;charset=UTF-8" import="com.fjsdfx.starerp.security.model.User,org.springframework.security.context.SecurityContextHolder"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%

User user =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
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
		<link rel="stylesheet" href="<%=basePath%>css/vip.css"
			type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></SCRIPT>
	</head>
	<body>
	
	
    
   
		<table>
			<tr>
				
				<td colspan="1" align="right">
					月份:${monString}
				</td>
				<td colspan="1" align="right">
					车间:${prscheck.department.dptName}
				</td>
			</tr>
			<tr>
				<td colspan="3" align="left">
					编号：${prscheck.psn}
				</td>
				<td colspan="3" align="left">
					编制：${prscheck.employeeEdit.empName}
				</td>
			</tr>
</table>
			<table class="list">
				<tr align="center">
					<th>
						项目内容
					</th>
					<th>
						单位
					</th>
					<th>
						数量
					</th>
					<th>
						完成日期
					</th>
					<th>
						备注
					</th>
				</tr>
				<c:if test="${!empty pm.datas}">
					<c:forEach items="${pm.datas}" var="proSchedule">
						<tr>
							<td>
								<div align="center">

									${proSchedule.pcontent}
								</div>
							</td>
							<td>
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

							<pg:param name="prscheckId" value="${prscheck.id}" />
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

								<input type="hidden" name="prscheckId" value="${prscheck.id}" />


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
			<form action="produce/productionplan/productionplan_approve?prscheckId=${prscheck.id}"
				method="post">
				<tr>
						<table class="addTable" style="width:100%">
			
					<tr>
							
							
					<td>&nbsp;<input type="checkbox"  onclick='hidslt2()' name="employeeApproveId" value="${auditUser.employee.empId}" />
								
					批准:</td>
								
				      <td > 
								<input type="text" id="tab2" name=""  value="${auditUser.employee.empName}" disabled="disabled"/>&nbsp;
								<input type="text"   id="tab5" name=""  value="${prscheck.employeeApprove.empName}" disabled="disabled"/>&nbsp;
					</td>
			                     
			
				    </tr>

				
				</table>
			<table class="btn">
			<tr>
					<td>
						<input type="submit" align="middle" name="submit" value="提交"
							class="frm_btn" />
					</td>
				</tr>
			</table>
			</tr>
			</form>
	
	<script type="text/javascript">
     	$(document).ready(function() {
            //隐藏模板tr
            
            	$("#tab1").hide();
            	$("#tab2").hide();
            	$("#tab3").hide();
            	
        })
    </script>
		<script type="text/javascript">   
        	function   hidslt1()   {   
	
        		$("#tab1").toggle("slow"); 
        		$("#tab3").toggle("slow"); 
        		$("#tab4").toggle("slow"); 
        		
			}
			
    </script>
     </script>
		<script type="text/javascript">   
        	function   hidslt2()   {   
			
        		$("#tab2").toggle("slow");   
        		$("#tab5").toggle("slow");   
			}
			
    </script>
	</body>
</html>
