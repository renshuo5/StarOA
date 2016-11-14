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
<html>
  <head>
    <base href="<%=basePath%>">
    <title>配套发料</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   	<link rel="stylesheet" href="css/vip.css" type="text/css">
		<script language="javascript" src="js/public.js"></script>
		<script language="javascript" src="js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		   <script type="text/javascript" src="<%=basePath %>js/highLight.js"></script>
    <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <SCRIPT language=JavaScript src="js/FoshanRen.js"></SCRIPT>
  </head>
  
  <body >
  	<table class="title">
 		<tr>
    		<td class="title">要货计划单列表</td>
   		</tr>
  	</table>
    <table class="list">
      <tr>
      	<th>选择</th>
        <th>编号 </th>
        <th>编制人 </th>
        <th>编制单位 </th>
        <th>编制日期 </th>
        <th>报送日期 </th>
        <th>履行情况 </th>
      </tr>
      <!---------------------------LOOP START------------------------------>
      <c:if test="${!empty pm.datas}">
		<c:forEach items="${pm.datas }" var="p">
	        <tr>
	        <td>
	        	<c:choose>
	        		<c:when test="${p.department.dptName=='生产部' }">
	        			<input class="frm_btn" type="button" onclick="window.self.location='warehouse/supsendm3/supsendm3_selectedPreparation?preparation.id=${p.id }'" name="itemid" value="选择"/>
	        		</c:when>
	        		<c:otherwise>
	        			<input class="frm_btn" type="button" onclick="window.self.location='warehouse/supsendm/supsendm_selectedPreparation?preparation.id=${p.id }'" name="itemid" value="选择"/>
	        		</c:otherwise>
	        	</c:choose>
	        	
	        </td>
	          <td>${p.presn }</td>
	          <td align="center">${p.person.empName }</td>
	          <td align="center">${p.department.dptName }</td>
	          <td align="center"><fmt:formatDate value="${p.pdate }"/></td>
	          <td align="center"><fmt:formatDate value="${p.sdate }"/></td>
	          <td align="center">${p.fulfillment }</td>
	        </tr>
        </c:forEach>
        </c:if>
      <!----------------------LOOP END------------------------------->
        <!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<table class="btn">
					<tr>
						<td>
							没有找到相应的记录
						</td>
					</tr>
				</table>
			</c:if>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
    </table>
    <!--分页-->
    <table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
						<pg:param name="itemtype.name" />
						<pg:param name="itemtype.description" />
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

							<input type="hidden" name="itemtype.name"
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
