<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">

	<head>
		<base href="<%=basePath%>">
		<title>生产订单管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>
            <table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>
    
		<table>
			<tr>
				<td style="text-align: right">
					<form action="persons/Rasmessage/rasmessage_search" method="post">
						发送人:
						<input type="text" name="rasmessage.sper.employee.empName" size="10"
							value="${rasmessage.sper.employee.empName}"class="itemname" />
						&nbsp;&nbsp; 消息标题:
						<input type="text" name="rasmessage.title" size="10"
							value="${rasmessage.title}" class="itemname"/>
						&nbsp;
						<input class="frm_btn" type="submit" value="模糊查询" />


						<input type="button" value="发送消息"
							onClick="openWin('<%=basePath%>persons/Rasmessage/rasmessage_addInput','发送消息',550,450,'1')"
							class="frm_btn">
					</form>
				</td>
			</tr>
		</table>
		<table class="title">
			<tr>
				<td>&nbsp;
					
				</td>
			</tr>
			</table>
			<table class="list">
			<tr>

				<th>发送人
				</th>

				<th>消息标题
				</th>

				<th>发送时间
				</th>
				<th>
					附件名
				</th>
				<th>状态
				</th>


				<th>删除
				</th>
			</tr>
			<!---------------------------LOOP START------------------------------>
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas}" var="rasmessage">
					<tr>

						<td >
							<div align="center">
								<c:out value="${rasmessage.sper.employee.empName}" />
							</div>
						</td>
						<td >
							<div align="center">
								<a href="#"
									onClick="openWin('<%=basePath%>persons/Rasmessage/rasmessage_show?rasmessageId=${rasmessage.id}','察看信息',550,450,'1');return false">
									<c:out value="${rasmessage.title}" /> </a>
							</div>
						</td>
						<td>
							<div align="center">
								<fmt:formatDate value="${rasmessage.rastime}"
									pattern="yyyy-MM-dd" />
							</div>
						</td>
						<td align="center">
							<c:choose>

								<c:when test="${rasmessage.fla1 eq '0'}">
									<div align="center">
										没有附件
									</div>
								</c:when>
								<c:otherwise>
									<div align="center">
										<a href="${rasmessage.accessories}">${rasmessage.fla1}</a>
									</div>
								</c:otherwise>
							</c:choose>
						</td>
						<td >
							<c:choose>

								<c:when test="${rasmessage.rasstatus eq '0'}">
									<div align="center">
										未看过
									</div>
								</c:when>
								<c:otherwise>
									<div align="center">
										已看过
									</div>
								</c:otherwise>
							</c:choose>
						</td>


						<td  align="center">
							<a href="#"
								onclick="del('<%=basePath%>persons/Rasmessage/rasmessage_del?rasmessageId=${rasmessage.id}');return false"><img
									src="images/del.gif" width="15" height="16" border="0"> </a>
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
						onmouseout="
	this.bgColor = '#EFF3F7'";>

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
										<pg:param name="rasmessage.sper.employee.empName" />
									<pg:param name="rasmessage.title" />
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

											<input type="hidden" name="rasmessage.sper.employee.empName"
											value="${rasmessage.sper.name}" />
										<input type="hidden" name="rasmessage.title"
											value="${rasmessage.title}" />
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
                                                       		<br>
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>