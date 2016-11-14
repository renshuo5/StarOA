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
	String partnumber=request.getParameter("partnumber");
	System.out.println("partnumber = "+partnumber);
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>选择物料类别</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<script language="javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		 <script type="text/javascript" src="<%=basePath%>js/item.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></SCRIPT>
		<script language="javascript" src="js/public.js"></script>
	</head>

	<body >
	<s:fielderror></s:fielderror>
		<table >
			<tbody>
				<tr height="20">
					<td background="images/title_bg1.jpg">
						&nbsp;&nbsp;
					</td>
				</tr>
				<tr>
					<td height="1" bgcolor="#b1ceef"></td>
				</tr>
				<tr height="15">
					<td background="images/shadow_bg.jpg"></td>
				</tr>
			</tbody>
		</table>

		<%--查询--%>
		<table width="99%" border="0" cellspacing="1" cellpadding="2"
			align="center">
			<TR>
				<TD height=14 align=right noWrap>
					<!-- 在这里插入查询表单 -->
				</TD>
				<TD height=14 align="left" noWrap>
					
									<form action="item/itemtype/itemtype_selectSearch" method="post">
										物料类型名：
										<input type="text" name="itemtype.name" class="itemname"/>
										&nbsp;&nbsp; 物料类型描述：
										<input type="text" name="itemtype.description" class="itemname"/>
										&nbsp;&nbsp;
										<input class="frm_btn" type="submit" value="查询" />
										<br />
									</form>

				</TD>
			</TR>
		</table>


		<table class="list">
			<tr>
				<td colspan="9" align="right" background="images/title_bg2.jpg"
					bgcolor="#266cc1">
					<!--------------------------------添加--------------------------------------------- -->

				&nbsp;
					<!-- ------------------------------------添加------------------------------------ -->



				</td>
			</tr>
			<tr>
				<th>
						选择
				</th>
				<th>
						品名规格编号
				</th>
				<th>
						部品
	
				</th>
				<th >
						规格型号
			
				</th>
				<th >
					材料代码
				</th>
				<th>
						是否保税
				</th>
				<th>
						保税号
				</th>
				<th>
						简介
				</th>
				<th>
						备注
				</th>



			</tr>
			<!---------------------------LOOP START------------------------------>
			<!-- 列表数据栏 -->
			<c:if test="${!empty pm.datas}">
				<c:forEach items="${pm.datas }" var="itemtype">
					<tr>

						<td>
								<input type="radio" name="itemtypeid"
									onclick="selectItemType('${itemtype.item.id}','${itemtype.item.name}','${itemtype.id}','${itemtype.name}','${itemtype.mCode}','${itemtype.bondedNo}',<%=partnumber %>)">
							
						</td>

						<td>
							
								${itemtype.id}
					
						</td>
						<td >
							
								${itemtype.item.name}
						
						</td>
						<td>
							
								${itemtype.name}
						
						</td>
						<td>
							
								${itemtype.mCode}
						
						</td>
						<td>
							
								${itemtype.isbonded}
						
						</td>
						<td>
							
								${itemtype.bondedNo}
						
						</td>
						<td >
							
								${itemtype.description}

					
						</td>
						<td >
						
								${itemtype.notes}
					
						</td>


					</tr>
				</c:forEach>
			</c:if>
			<!----------------------LOOP END------------------------------->
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="9" align="center" bgcolor="#EFF3F7"
							class="TableBody1" onmouseover="this.bgColor= '#DEE7FF'"
							onmouseout="this.bgColor='#EFF3F7'">
							没有找到相应的记录<br/>
							<a href="<%=basePath%>item/item/item_selectInput?partnumber=<%=partnumber %>&isSelectItemType=1">点此返回</a>
						</td>
				</tr>
			</c:if>
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
</table>
		
											<!-- 分页导航条 开始-->
											
<table borderColor=#ffffff style="FONT-SIZE: 10pt" class="pager">
			<tr height=28px valign="middle">
				<th align=right noWrap>
														<pg:pager
															url='<%=request.getAttribute(
						"javax.servlet.forward.servlet_path").toString()
						.substring(1)%>'
															items="${pm.total}" maxPageItems="${pagesize}"
															export="currentPageNumber=pageNumber">
															<pg:param name="itemtype.name" />
															<pg:param name="itemtype.description" />
															<pg:param name="partnumber" />
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
																<input type="hidden" name="partnumber"
																	value="<%=partnumber %>" />

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
													</TH>
													<!-- 更改pagesize 结束-->
												</TR>
											</TABLE>
											<!-- 分页导航条 结束-->
	
<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
        <script type="text/javascript">

		function selectItemType(itemid,itemname,itemtypeid,itemtypename,itemtypemcode,itemtypebondednoid,partnumber) {
			if (window.opener) {
				//alert($("#itemTypeIdId"+partnumber,window.opener.document).val());
				//alert($("#itemTypeIdId",window.opener.document).val());
				//alert($("#itemTypeIdId_"+partnumber,window.opener.document).val());
				if($("#itemTypeIdId"+partnumber,window.opener.document).val()!=undefined)
				{
//					alert(1);
					var itemid = $("#itemIdId"+partnumber,window.opener.document);
					var itemName = $("#itemNameId"+partnumber,window.opener.document);
					var itemTypeId = $("#itemTypeIdId"+partnumber,window.opener.document);
					var itemTypeName = $("#itemTypeNameId"+partnumber,window.opener.document);
					var itemmCode = $("#itemmCode"+partnumber,window.opener.document);
					var itemTypeBondedNo = $("#itemTypeBondedNoId"+partnumber,window.opener.document);
					if(itemid) itemid.val(itemid).change();
					if(itemName) itemName.val(itemname).change();
					if(itemTypeId) itemTypeId.val(itemtypeid).change();
					if(itemTypeName) itemTypeName.val(itemtypename).change();
					if(itemmCode) itemmCode.val(itemtypemcode).change();
					if(itemTypeBondedNo) itemTypeBondedNo.val(itemtypebondednoid).change();
				}
				else if($("#itemTypeIdId",window.opener.document).val()!=undefined)
				{
//					alert(2);
					var itemid = $("#itemIdId",window.opener.document);
					var itemName = $("#itemNameId",window.opener.document);
					var itemTypeId = $("#itemTypeIdId",window.opener.document);
					var itemTypeName = $("#itemTypeNameId",window.opener.document);
					var itemmCode = $("#itemmCode",window.opener.document);
					var itemTypeBondedNo = $("#itemTypeBondedNoId",window.opener.document);
					if(itemid) itemid.val(itemid).change();
					if(itemName) itemName.val(itemname).change();
					if(itemTypeId) itemTypeId.val(itemtypeid).change();
					if(itemTypeName) itemTypeName.val(itemtypename).change();
					if(itemmCode) itemmCode.val(itemtypemcode).change();
					if(itemTypeBondedNo) itemTypeBondedNo.val(itemtypebondednoid).change();
				}
				else if($("#itemTypeIdId_"+partnumber,window.opener.document).val()!=undefined)
				{
//					alert(3);
					var itemid = $("#itemIdId_"+partnumber,window.opener.document);
					var itemName = $("#itemNameId_"+partnumber,window.opener.document);
					var itemTypeId = $("#itemTypeIdId_"+partnumber,window.opener.document);
					var itemTypeName = $("#itemTypeNameId_"+partnumber,window.opener.document);
					var itemmCode = $("#itemmCode_"+partnumber,window.opener.document);
					var itemTypeBondedNo = $("#itemTypeBondedNoId_"+partnumber,window.opener.document);
					if(itemid) itemid.val(itemid).change();
					if(itemName) itemName.val(itemname).change();
					if(itemTypeId) itemTypeId.val(itemtypeid).change();
					if(itemTypeName) itemTypeName.val(itemtypename).change();
					if(itemmCode) itemmCode.val(itemtypemcode).change();
					if(itemTypeBondedNo) itemTypeBondedNo.val(itemtypebondednoid).change();
				}
				window.close();
			}
		}
		

</script>

	</body>
</html>