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
		<title>三车间</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath %>css/vip.css" type="text/css">
			<script type="text/javascript" src="<%=basePath %>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath %>js/public.js"></script>
        <script language="javascript" src="<%=basePath %>js/highLight.js"></script>
        <script language="javascript" src="<%=basePath %>js/oddEvenColor.js"></script>
</head>


	<body>
	<div align="right" >
				<input type="button" value="添加" onClick="openWin('<%=basePath%>proreport/proreportthree_addInput','添加信息',400,300,1)"  class="frm_btn">
				</div>
    <table class="title">    <tr>
      <td>三		车		间		日		生		产		质		量		列		表 </td>
    </tr></table>
			<table class="list">
				
				
				<tr>
               
					<th width="9%" align="center">生产批次 </th>
                   <th width="9%" align="center">合格批次</th>
				  <th width="9%" align="center">不合格批次 </th>
                    <th width="8%" align="center">合格率</th>
					<th width="35%" align="center">不合格内容</th>
				    <th width="20%" align="center">日期</th>
                  
              	<th width="5%" align="center">删除</th>
			  </tr>
				<!---------------------------LOOP START------------------------------>
										<!-- 列表数据栏 -->
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="proreportthree">
					<tr>
                   
						<td ><c:out value="${proreportthree.probatch}"/></td>
                        <td ><c:out value="${proreportthree.quabatch}"/></td>
                        <td ><c:out value="${proreportthree.unqbatch}"/></td>
                        <td ><c:out value="${proreportthree.passrate}%"/></td>
                        <td ><c:out value="${proreportthree.unqcon}"/></td>
                        <td ><fmt:formatDate value="${proreportthree.ptdate}"pattern="yyyy-MM-dd"/></td>
                        <td >
                        <a href="#"  onclick="del('proreport/proreportthree_del?prtthreeId=${proreportthree.id}');return false"><img src="images/del.gif" width="15" height="16" border="0">
						    </a> 
							
                        </td>
            
					</tr>
						</c:forEach>
					</c:if>
				<!----------------------LOOP END------------------------------->
				<!-- 在列表数据为空的时候，要显示的提示信息 -->
				<c:if test="${empty pm.datas}">
					<tr>
						<td colspan="11" align="center" bgcolor="#EFF3F7"
							class="TableBody1" onMouseOver="this.bgColor= '#DEE7FF'"
							onmouseout="this.bgColor='#EFF3F7'">
							没有找到相应的记录
						</td>
					</tr>
				</c:if>
					<!-- 在列表数据为空的时候，要显示的提示信息 -->
			
			</table>
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
							<select name="pagesize" onChange="this.form.submit()"
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
    		<script language="JavaScript">
		function openWin(f,n,w,h,s){
	sb = s == "1" ? "1" : "0";
	l = (screen.width - w)/2;
	t = (screen.height - h)/2;
	sFeatures = "left="+ l +",top="+ t +",height="+ h +",width="+ w
			+ ",center=1,scrollbars=" + sb + ",status=0,directories=0,channelmode=0";
	openwin = window.open(f , n , sFeatures );
	if (!openwin.opener)
		openwin.opener = self;
	openwin.focus();
	return openwin;
	}

</script>
</html>