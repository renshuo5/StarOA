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
		<title>业务管理</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="js/public.js">
		<script language="javascript"  src="js/FoshanRen.js"> </script>
		<script language="JavaScript">
	//到指定的分页页面
	function topage(page) {
		var form = document.forms[0];
		form.page.value = page;
		form.submit();
	}
	function selectSusgood(id, index) {
		$("#")
	}
</script>

	</head>

	<body>


		<table>
			<tbody>
				<tr height="15">
					<td background="images/shadow_bg.jpg"></td>
				</tr>
			</tbody>
		</table>


		<%--查询--%>
		<table class="title">
				<tr>
					<td>
						发料物料表
					</td>
				</tr>
			</table>


		<table class="list">


			<tr>

				<th width="7%" align="center">
					序号
				</th>
				<th width="14%" align="center">
					保税名称代号
				</th>
				<th width="10%" align="center">
					保税名称规格
				</th>
				<th width="7%" align="center">
					控制器信息
				</th>
				<th width="10%" align="center">
					实发数量
				</th>
				<th width="11%" align="center">
					备注
				</th>
				<th width="22%" align="center">
					操作
				</th>
			</tr>
			<!---------------------------LOOP START------------------------------>



			<!----------------------LOOP END------------------------------->


			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="susgood" varStatus="vs">
					<tr>
						<td>
							${susgood.seriNum }
						</td>
						<td>

							${susgood.itemType.item.name }
						</td>
						<td>

							${susgood.itemType.name }
						</td>
						<td>
							<label></label>
							<input type="hidden" class="controllerunitInfo" value="${susgood.controllerunitInfo }"/>
						</td>
						<td>
							${susgood.pracNum }

						</td>
						<td>
							${susgood.note }
						</td>
						<td>
							<input name="AddDic2" type="button" class="frm_btn" id="AddDic2"
								onclick="openWin('<%=basePath%>warehouse/variation/variation_addInput?itemType.id=${susgood.itemType.id }&itemType1.id=${susgood.supsendm3.itemType.id }','addVariation',800,600);return false"
								value="物料变异">
							&nbsp;&nbsp;
							<%--<input name="AddDic2" type="button" class="frm_btn" id="AddDic2"
								onClick="javascript:window.location.href='<%=basePath%>warehouse/variation/variation_addInput?itemType.id=${susgood.itemType.id }'"
								value="物料变异">
							<input name="AddDic" type="button" class="frm_btn" id="AddDic"
								onclick="javascript:window.location.href='../物料损益/报废申请表.html'"
								value="报废">
								--%>
								<input type="button" value="报废"
						onClick="openWin('<%=basePath%>produce/discardverify/discardverify_list?itemTypeId=${susgood.itemType.id }','填写报废',800,600,'1')"
						class="frm_btn">
						</td>
					</tr>
				</c:forEach>
			</c:if>
			

			<!----------------------LOOP END------------------------------->
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<table>
					<tr>
					<td>
						没有找到相应的记录
					</td>
				</tr>
				</table>
			</c:if>

		</table>
		<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
					<pg:pager
						url='<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>'
						items="${pm.total}" maxPageItems="${pagesize}"
						export="currentPageNumber=pageNumber">
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
		<SCRIPT type="text/javascript">
			$(document).ready(function(){
				var controllerunitInfo = $(".controllerunitInfo");
				var conVal;
				switch (controllerunitInfo.val()) {
				case "parallelport":
					conVal="并口";break;
				case "parportU":
					conVal="并+U";break;
				case "serialoparport":
					conVal="并口|串口";break;
				case "serialaparport":
					conVal="并口+串口";break;
				case "parportethpot":
					conVal="并口+网口";break;
				case "ip090k":
					conVal="IP090K（并口）";break;
				case "ip690k":
					conVal="IP690K（并口）";break;
				default:
					break;
				}
				controllerunitInfo.prev("label").text(conVal);
			});
		</SCRIPT>
	</body>
</html>