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
		<script language="javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		 <script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		   <script type="text/javascript" src="<%=basePath %>js/highLight.js"></script>
		   <script type="text/javascript" src="<%=basePath%>js/examineOnly.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
    <script type="text/javascript" src="<%=basePath %>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>
		<table>
			<TR>

				<TD style="text-align:right">
					<input type="button" onclick="window.self.location='<%=basePath%>warehouse/supsendm/supsendm_list.action'" value="外协件配套发料表列表" class="frm_btn"/>
					<form action="warehouse/supsendm3/supsendm3_search" method="post">
						收料车间：
						<input type="text" name="supsendm3.department.dptName"/>
						&nbsp;&nbsp; 硬件版本：
						<input type="text" name="supsendm3.hawversion"/>
						&nbsp;&nbsp;
						<input class="frm_btn" type="submit" value="查询" />
						<input type="button" value="添加" class="frm_btn"
							onclick="openWin('<%=basePath%>warehouse/supsendm3/supsendm3_preparationList','preparationList',800, 600, 1);return false">
						<br />
					</form>
					<!-- ------------------------------------添加------------------------------------ -->
					
				</TD>
			</TR>
		</table>
		<table class="title">
	 		<tr>
	    		<td class="title">
	    			打印机配套发料表列表
	    		</td>
	   		</tr>
	  	</table>
		<table class="list">
			<tr>
				<th>
					收料车间
				</th>
				<th>
					产品名称
				</th>
				<th>
					型号规格
				</th>
				<th>
					硬件版本
				</th>
				<th>
					图号
				</th>
				<th>
					发料时间
				</th>
				<th>
					车间确认
				</th>
				<th>
					编辑
				</th>
				<th>
					删除
				</th>
			</tr>
			<!---------------------------LOOP START------------------------------>
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="s">
					<tr>
						<td>
							${s.department.dptName }
						</td>
						<td>
							${s.itemType.item.name }
						</td>
						<td>
							${s.itemType.name }
						</td>
						<td>
							${s.hawversion }
						</td>
						<td>
							${s.itemType.mCode }
						</td>
						<td>
							<fmt:formatDate value="${s.sudate }"/>
						</td>
						<td class="examine">
							<c:choose>
								<c:when test="${s.worshipConfirm!=1}">
									<input type="hidden" name="status" value="0" />
									<a id='item_0' href="#"
									onclick="openWin('<%=basePath%>warehouse/supsendm3/supsendm3_confirmInput?supsendm3.id=${s.id }','selectItem',800, 600, 1);return false" ><span>未确认</span></a>
								</c:when>
								<c:otherwise>
									<input type="hidden" name="status" value="1" />
									<a><span>已确认</span></a>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<a href="#"
								onclick="openWin('<%=basePath%>warehouse/supsendm3/supsendm3_editInput?supsendm3.id=${s.id }','editItemtype',800,600);return false">
								<img src="images/edit.gif" width="15" height="16" border="0">
							</a>
						</td>
						<td>
							<a href="#"
								onclick="del('<%=basePath%>warehouse/supsendm3/supsendm3_del?supsendm3.id=${s.id }');return false">
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
						<pg:param name="supsendm3.department.dptName" />
						<pg:param name="supsendm3.hawversion" />
						<pg:first>
							<a href="${pageUrl}" id="firstpageurl"> 首页 </a>
						</pg:first>
						<pg:prev>
							<a href="${pageUrl }"> 《 </a>
						</pg:prev>
						<pg:pages>
							<c:choose>
								<c:when test="${currentPageNumber eq pageNumber}">
									<font color="red">${pageNumber }</font>
								</c:when>
								<c:otherwise>
									<a href="${pageUrl }"> ${pageNumber } </a>
								</c:otherwise>
							</c:choose>
						</pg:pages>
						<pg:next>
							<a href="${pageUrl }"> 》 </a>
						</pg:next>
						<pg:last>
							<a href="${pageUrl }"> 尾页 </a>
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
							<input type="hidden" name="supsendm3.department.dptName" value="${supsendm3.department.dptName }" />
							<input type="hidden" name="supsendm3.hawversion" value="${supsendm3.hawversion }"/>
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
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>