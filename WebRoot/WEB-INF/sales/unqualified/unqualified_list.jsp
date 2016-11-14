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

<html>
	<head>
		<base href="<%=basePath%>">
		<title>业务管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/sales.js"></script>
		<script language="JavaScript">
		
	//到指定的分页页面
	function topage(page){
		var form = document.forms[0];
		form.page.value=page;
		form.submit();
	}

</script>

		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<SCRIPT language=JavaScript src="/js/FoshanRen.js"></SCRIPT>
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


		<%--查询--%>
		<table>
			<TR>
				<TD style="text-align: right">

					<form action="sales/return/returned/returned_search" method="post">
						客户名称：
						<input type="text" name="returned.customern" class="itemname" />

						&nbsp;&nbsp;
						<input class="frm_btn" type="submit" value="查询" />
						<br />
					</form>

				</TD>
			</TR>
		</table>

		<table class="title">
			<tr>
				<td>
					不合格件列表
				</td>
			</tr>
		</table>
		<table class="list">
			<tr>
				<th>
					编（批）号
				</th>

				<th>
					客户名称
				</th>
				<th>
					退货理由
				</th>
				<th>
					日期
				</th>
				<th>
					不合格件单
				</th>

				<th>
					备注
				</th>

				<th>
					删除
				</th>

			</tr>
			<!---------------------------LOOP START------------------------------>
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="returned">
					<c:forEach items="${unqualifieds}" var="unqualified">
						<c:if test="${unqualified.returned.retid==returned.retid}">
							<tr>
								<td>
									<div align="center">
										<a
											href="sales/return/returned/returned_show?ReturnedId=${returned.retid}">
											退货报告单${returned.sn} </a>
									</div>
								</td>
								<td>
									<div align="center">
										${returned.customern}
									</div>
								</td>
								<td>
									<div align="center">
										${returned.retnote}
									</div>
								</td>
								<td>
									<div align="center">
										${returned.retdate}
									</div>
								</td>
								<td>

									<a href="#"
										onclick="openWin('<%=basePath%>sales/return/unqualified/unqualified_show?unqualifiedId=${unqualified.unq_id}','showUnqualified',800,600);return false">
										不合格单${unqualified.unq_id} </a>
								</td>

								<td>

									<div align="center">

										<c:if test="${unqualified.inspector!=null&&returned.deals!='2'}">
                                      已返工送检
                                      </c:if>
                                      <c:if test="${unqualified.inspector!=null&&returned.deals=='2'}">
                                      返工合格
                                      </c:if>
										<c:if test="${unqualified.inspector==null}">
											<a
												href="<%=basePath%>sales/return/unqualified/unqualified_recheck?unqualifiedId=${unqualified.unq_id}">
												返工送检 </a>
										</c:if>
									</div>
								</td>



								<td>


									<a href="#"
										onclick="del('sales/return/returned/returned_del?returnedId=${returned.retid}&unqualifiedId=${unqualified.unq_id}');return false">
										<img src="images/del.gif" width="15" height="16" border="0">
									</a>


								</td>

							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>
			</c:if>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="6" align="center" bgcolor="#EFF3F7" class="TableBody1"
						onmouseover=this.bgColor = '#DEE7FF';
onmouseout=this.bgColor='#EFF3F7';
>
						没有找到相应的记录
					</td>
				</tr>
			</c:if>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<!----------------------LOOP END------------------------------->
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
