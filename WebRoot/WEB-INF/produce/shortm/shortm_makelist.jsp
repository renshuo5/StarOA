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
		<title>缺料登记</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
	<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
	<script type="text/javascript" src="<%=basePath %>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath %>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/produce.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/examineOnly.js"></script>
    
  </head>
  <body> 
  <table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>	
<!-- 查询 -->
<form action="produce/shortm/shortm_search" method="post">
				<table>
				<tr>
				<td style="text-align:right">
				申请单位:<select  name="shortm.department1.dptName" >
                        <option value="">请选择</option>
             <c:forEach items="${departments}" var="dpt">
				<option value="${dpt.dptName}" name="${dpt.dptName}" >
				${dpt.dptName}
				</option>
			</c:forEach>
             </select>
             申请人: <select name="shortm.employee2.empName">
              <option>请选择</option>
              <c:forEach items="${employees}" var="emp2">
                <option value="${emp2.empName}"> ${emp2.empName} </option>
              </c:forEach>
            </select>
         状态：<input type="text" name="shortm.state" class="itemname">
          
         <input type="submit" value="查询" class="frm_btn"/></td>
                
                </tr></table>
                </form>
                <table class="title">
			<tr>
				<td>
					制定采购
				</td>
			</tr>
		</table>
  	<table  class="list">
    
				<tr>
					<th width="10%" align="center">编号 </th>
					<th width="10%" align="center">申请单位 </th>
                  <th width="10%"  align="center">申请人</th>
                  <th width="15%"  align="center"><font color="#FFFFFF">日期 </th>
                    <th width="" align="center">状态</th>
                  <th width="5%" align="center">删除</th>
			  </tr>
			  
			  
	  <!-- ------------------loopstart----------------------------- -->
			  <!-- 列表数据栏 -->
			  	<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="shortm">
			  <tr  bgcolor="#EFF3F7"
						onmouseover="this.bgColor= '#DEE7FF'"
						onmouseout="this.bgColor='#EFF3F7'">
						<td align="center">
						${shortm.shoid}</td>
		<td align="center">${shortm.department1.dptName }</td>
					<td align="center">${shortm.employee2.empName}</td>
				
                                <td align="center">${shortm.sdate}</td>
                             <td align="center" class="examine">
                             
                              <c:if test="${shortm.state==1}">
                             
                             <a href="<%=basePath%>produce/shortm/shortm_shortm_approve?shortmID=${shortm.id}">
                         <input name="status" type="hidden" value="${00}" />
                           <span>已审核</span>
                            </a>
                             </c:if>
                           
                             </td>
                              
                                  <td align="center"><a href="#"
								onclick="del('produce/shortm/shortm_shortm_del?shortmID=${shortm.id}');return false">
								<img src="images/del.gif" width="15" height="16" border="0">
							</a> </td>
                                 
					</tr>
						</c:forEach>
			</c:if>
		
					<!-- -------------------------loopend------------------------------ -->
								<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="8" align="center" bgcolor="#EFF3F7"
						onmouseover="this.bgColor= '#DEE7FF'"
						onmouseout="this.bgColor='#EFF3F7'">
						没有找到相应的记录
					</td>
				</tr>
			</c:if>
			</table>
		
			<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
						<tr height=28px valign="middle"  colspan="6">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
						<pg:param name="sitem.name" />
						<pg:param name="sitem.description" />
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

							<input type="hidden" name="sitem.name" value="${sitem.name }" />
					<input type="hidden" name="sitem.description"
						value="${sitem.description}" />
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
					
			</table>
  <SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
  </body>
</html>