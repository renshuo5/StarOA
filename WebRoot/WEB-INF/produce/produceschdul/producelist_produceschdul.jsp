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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>业务管理</title>
		
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<script language="javascript" src="js/public.js"></script>
		<script language="javascript" src="js/jquery/jquery.js"></script>
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		 <script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		   <script type="text/javascript" src="<%=basePath %>js/highLight.js"></script>
    <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>
		
		<table class="title">
	 		<tr>
	    		<td class="title">
	    			生产查询
	    		</td>
	   		</tr>
	  	</table>
		<table class="list">
			<tr>
				<th>
					订单号
				</th>
				<th>
					编制单位
				</th>
				<th>
					编制人
				</th>
				<th>
					生产计划单编号
				</th>
				<th>
					配套表列表
				</th>
			</tr>
			<!---------------------------LOOP START------------------------------>
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="s">
					<tr>
						<td>
							<a href="#" onclick="openWin('produce/preparation/preparation_show?preparation.id=${s.preparation.id}','要货单信息',800,600,'1');return false">${s.preparation.presn}</a>
						</td>
						<td>
							${s.preparation.department.dptName }
						</td>
						<td>
							${s.preparation.person.empName }
						</td>
						<td>
							<c:choose>
								<c:when test="${empty s.prscheck}">
									无需生产计划单
								</c:when>
								<c:otherwise>
									<a href="<%=basePath %>produce/productionplan/productionplan_show?prscheckId=${s.prscheck.id}">生产计划单${s.prscheck.id}</a>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${s.preparation.department.dptName!='生产部'}">
									<a href="<%=basePath %>produce/produceschdul/produceschdul_supsendmList?preparation.id=${s.preparation.id}">配套发料表列表</a>
								</c:when>
								<c:otherwise>
									<a href="<%=basePath %>produce/produceschdul/produceschdul_supsendm3List?preparation.id=${s.preparation.id}">配套发料表列表</a>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			<!----------------------LOOP END------------------------------->
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="8" class="TableBody1">
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

						<!-- 用于查询传参 -->
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
					<div style="height: 26px; overflow: hidden; valign: middle">
						<form
							action="<%=request
					.getAttribute("javax.servlet.forward.servlet_path")
					.toString().substring(1)%>">

							<select name="pagesize" onchange="this.form.submit()"
								style="height: 20px; overflow: hidden; valign: middle">
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
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>