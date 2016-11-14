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
		<title>生产日报表</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		 <script type="text/javascript" src="<%=basePath%>js/sales.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>
		
		<%--查询--%>
		<table width="396">
				<TR>
				<TD height=14 align=right noWrap>
					<!-- 在这里插入查询表单 -->
				

					<form action="produce/dailyproduction/dailyproduction_search" method="post">
						编制单位：
							<select  name="dailyproductionform.department.dptName" >
             <option value="">请选择</option>
             <c:forEach items="${departments}" var="dpt">
				<option value="${dpt.dptName}" name="${dpt.dptName}" >
				${dpt.dptName}
				</option>
			</c:forEach>

             </select>

						&nbsp;&nbsp;
				      <input class="frm_btn" type="submit" value="查询" />
					 <input type="button" onclick="openWin('produce/dailyproduction/dailyproduction_add','dailyproduction',900,600);return false" value="添加" class="frm_btn">
					</form>
				  </TD>
			</TR>
		</table>



		<table class="title">
<tr>
				<td>
					日生产报表
				</td>
			</tr>
		</table>

		<table class="list">

			<tr>
				<th width="84">编号
				</th>
				<th width="127">编制单位</th>
				<th width="124">
					编制日期
				</th>
				<th width="37">删除</th>
			</tr>
			<c:if test="${!empty pm.datas}">
			
<c:forEach items="${pm.datas}" var="dailyproductionform">
<tr>
						<td>
							<div align="center" >
							<a onfocus="" onclick="openWin('<%=basePath%>produce/dailyproduction/dailyproduction_formlist?form_id=${dailyproductionform.id}',600,800,600);return false" >
						生产日报表
							<c:out value="${dailyproductionform.id}"></c:out>
							
                            </a>
                            <input type="hidden" name="form_id" value="${dailyproductionform.id} }">
                            </div>
					  </td>
						<td>	<c:out value="${dailyproductionform.department.dptName}"></c:out></td>
						<td>	<c:out value="${dailyproductionform.date}"></c:out></td>
						<td>
						<a href="#"
								onclick="del('produce/dailyproduction/dailyproduction_del?form_id=${dailyproductionform.id}');return false">
								<img src="images/del.gif" width="15" height="16" border="0">
							</a>
						</td>
					</tr>
</c:forEach>
					
</c:if>

			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="4" align="center" bgcolor="#EFF3F7" class="TableBody1"
						onmouseover=this.bgColor = '#DEE7FF';
onmouseout=this.bgColor='#EFF3F7';
>
						没有找到相应的记录
					</td>
				</tr>
			</c:if>

		</table>

		<table width="35%" borderColor=#ffffff class="pager" style="FONT-SIZE: 10pt">
<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
						<pg:param name="dailyproductionform.id" />
						
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

							<input type="hidden" name="dailyproductionform.id"
								value="${dailyproductionform.id }" />

							
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

<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>


