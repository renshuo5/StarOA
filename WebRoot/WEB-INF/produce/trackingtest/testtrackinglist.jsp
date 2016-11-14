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
		 <script type="text/javascript" src="<%=basePath%>js/produce.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></SCRIPT>
		<script type="text/javascript" src="<%=basePath%>js/examineOnly.js"></script>
		
		<style type="text/css">
img.edit {
	cursor: hand;
}

img.delete {
	cursor: hand;
}

a.examineGray{
	text-decoration:none;
	cursor:default;
	background:repeat-x;
	background-image:url(<%=basePath %>images/examine_bg_gray.jpg);
}
		</style>
  </head>
 <body>

		<table><input type="hidden" value="${sl}" name="sl">
		
				<tr height="15">
					<td background="images/shadow_bg.jpg"></td>
				</tr>
		</table>

		<%--查询--%>
		<table>
			<TR>

				<TD style="text-align:right">
					<form action="produce/trackingtest/trackingtest_search" method="post">
						编号：
							<input type="text" name="trackingtest.id" class="itemname" />
							&nbsp;&nbsp;
					产品名称：
							<input type="text" name="trackingtest.testnotes.supplierinfo.itemname" class="itemname" />
							&nbsp;&nbsp; 
							<input class="frm_btn" type="submit" value="查询" />
					</form>
				</TD>
			</TR>
		</table>


		<table class="list">
			<tr>
				<td colspan="8" align="right" background="images/title_bg2.jpg"
					bgcolor="#266cc1">
					<!--------------------------------添加--------------------------------------------- -->

					<div align="right">
			
					&nbsp;
			
					</div>
					<!-- ------------------------------------添加------------------------------------ -->



				</td>
			</tr>
			<tr>
							 
					<th width="15%" >
						<div align="center">编号</div>				  </th>
					<th width="15%" >
						<div align="center">产品名称</div>				  </th>
					
				  <th width="15%">
				  <div align="center">型号</div>				  </th>
                  <th width="20%" >
				  <div align="center">制定日期</div>				  </th>
                
		
     <th width="" nowrap>
						<div align="center" width="20%">
							<font color="#FFFFFF">状态</font>						</div>				  </th>
				<th width="5%" >
					<div align="center">
						<font color=>编辑</font>
					</div>
				</th>

				<th width="5%" nowrap>
					<div align="center">
						<font>删除</font>
					</div>
				</th>


			</tr>
			<!---------------------------LOOP START------------------------------>
			<!-- 列表数据栏 -->
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="trackingtest">
				<tr>	<td><c:if test="${empty sl}">
				<div align="center"><a href="<%=basePath%>produce/trackingtest/trackingtest_show?trackingtestId=${trackingtest.id}">量试跟踪单${trackingtest.id}</a></div>
				
				</c:if>
				<c:if test="${!empty sl}">
											<div align="center"><a href="<%=basePath%>produce/trackingtest/trackingtest_wsshow?trackingtestId=${trackingtest.id}">量试跟踪单${trackingtest.id}</a></div>					  </td>
				
				</c:if>
							
						<td>
							<div align="center">		${trackingtest.testnotes.supplierinfo.itemname }		</div>					  </td>
						
						<td >
							<div align="center">			${trackingtest.testnotes.supplierinfo.itemtypename }			</div>						</td>
							<td   >
							<div align="center">		${trackingtest.testdate }			</div>						</td>
                          
                          
					
                                                          <td class="examine">
					<c:if test="${trackingtest.examiner1.empId==null&&trackingtest.examiner2.empId==null&&trackingtest.manger.empId==null}" >
			<input type="hidden" name="status" value="000" /></c:if>
						<c:if test="${trackingtest.examiner1.empId!=null&&trackingtest.examiner2.empId==null&&trackingtest.manger.empId==null}" >
					    <input type="hidden" name="status" value="100" />
					</c:if>
					
						<c:if test="${trackingtest.examiner1.empId!=null&&trackingtest.examiner2.empId!=null&&trackingtest.manger.empId==null}">
					    <input type="hidden" name="status" value="110" />
					</c:if>
					<c:if test="${trackingtest.examiner1.empId!=null&&trackingtest.examiner2.empId!=null&&trackingtest.manger.empId!=null}">
					    <input type="hidden" name="status" value="111" />
					</c:if>
						<a
							href="produce/trackingtest/trackingtest_wsaudit_input?trackingtestId=${trackingtest.id}"><span>车间三/五</span>
						</a>&rarr;<a
							href="produce/trackingtest/trackingtest_proaudit_input?trackingtestId=${trackingtest.id}"><span>车间一
						</span>
						</a>&rarr;<a
							href="produce/trackingtest/trackingtest_quaudit_input?trackingtestId=${trackingtest.id}"><span>品工部</span>
						</a>
					</td>
						<td align="center">
<c:if test="${!(trackingtest.examiner1.empId!=null&&trackingtest.examiner2.empId!=null&&trackingtest.manger.empId!=null)}">
							<%--									<a   href="#" onclick="openWin('item/item/item_editInput?itemid=${item.id}','editItem',600,250);return false">--%>
							<a class="a03" href="#"
							onclick="openWin('<%=basePath%>produce/trackingtest/trackingtest_edit_input?trackingtestId=${trackingtest.id}','updateprscheck',800,600,1);return false"><img src="images/edit.gif" width="15" height="16" border="0"></a> 
</c:if>
						</td>

						<td align="center">


<a href="#" onclick="del('<%=basePath%>produce/trackingtest/trackingtest_del?trackingtestId=${trackingtest.id}');return false">
								<img src="images/del.gif" width="15" height="16" border="0">
							</a>


							


						</td>

					</tr>
				</c:forEach>
			</c:if>
			<!----------------------LOOP END------------------------------->
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
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
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
								value="${prscheck.psn }" />

							
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