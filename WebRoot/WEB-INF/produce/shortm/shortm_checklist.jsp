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
		
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="js/public.js"></SCRIPT></head>
	<body >


	<table>
			<tbody>
				<tr height="20">
					<td background="images/title_bg1.jpg">
						
					</td>
				</tr>
				<tr>
					<td height="1" bgcolor="#b1ceef"></td>
				</tr>
				<tr height="15">
					<td background="images/shadow_bg.jpg"></td>
				</tr>
			</tbody>
		</table>
		<table class="list">
				<tr>
			
					<td colspan="7" align="center" background="images/title_bg2.jpg" >
				   缺料单 列 表
			       </td>
			  </tr>
				<tr>
				<th width="10%" >
						<div align="center">缺料id单</div>				  </th>
					<th width="10%" >
						<div align="center">车间主任 </div>				  </th>
					
				  <th width="15%">
				  <div align="center">申请单位 </div>	
				  			  </th>
				  			    <th width="10%">
				  <div align="center">申请人 </div>				  </th>
                  <th width="15%" >
				  <div align="center">提交单位</div>				  </th>
                
			  <th width="20%" nowrap >
						<div align="center">日期</div>				  </th>
					
     <th width="" nowrap>
						<div align="center" width="20%">
							<font color="#FFFFFF">状态</font>						</div>				  </th>
			  </tr>
        
          			<tr>
						<td>
							<div align="center"><a href="<%=basePath%>produce/shortm/shortm_read_cheklist?prscheckId=${prscheck.id}">缺料id单${prscheck.id}</a></div>					  </td>
						<td>
							<div align="center">		${prscheck.psn}					</div>					  </td>
						<td>
							<div align="center">
														${prscheck.department.dptName}	</div>						</td>
						<td >
							<div align="center">			${prscheck.pper }				</div>						</td>
							<td   >
							<div align="center">		${prscheck.prsDate }				</div>						</td>
                          
                          
						<td    align="center">
                                                                    
						<br />						</td>
						<td    align="center">
                                    未审核                                
						<br />						</td>
					</tr>
				<tr>
					<td colspan="7" align="center" bgcolor="#EFF3F7"
						onmouseover="this.bgColor= '#DEE7FF'"
						onmouseout="this.bgColor='#EFF3F7'"
						>
						没有找到相应的记录
					</td>
				</tr>
            </table>
		<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
						
						<pg:param name="prscheck.psn" />
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

							<input type="hidden" name="prscheck.psn"
								value="${itemtype.name }" />

							<input type="hidden" name="itemtype.description"
								value="${itemtype.description}" />
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
	</body>
</html>