
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
%><html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<base href="<%=basePath%>">


		<title>公告</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5"
			name="vs_targetSchema">
		<link href="css/external/normal.css" type="text/css" rel="stylesheet">


			<font face="宋体"></font>
			<table id="tableall" width="770" align="center" border="0"
				cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td align="center">
							<!--header -->
							<table id="TableTop" width="770" align="center" border="0"
								cellpadding="0" cellspacing="0">
								<tbody>
									<tr>
										<td>
											<link href="css/external/style.css" rel="stylesheet"
												type="text/css">
											<div class="header-neiy">
												<div class="logo" align="left">
													<img src="images/external/logo.jpg">
												</div>
												<!--表单查询开始-->

												<table id="01" width="770" align="center" border="0"
													cellpadding="0" cellspacing="0" height="31">
													<tbody>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<!--endheader -->
						</td>
					</tr>
					<tr>
						<td valign="top" width="770" align="center" bgcolor="#ffffff"
							height="471">
							<!--center -->
							<table id="tablecenter" width="100%" border="0" cellpadding="0"
								cellspacing="0" height="601">
								<tbody>
									<tr valign="top">

										<td width="100%" align="center">
											<table id="table_c2" width="100%" border="0" cellpadding="0"
												cellspacing="0" height="100%">
												<tbody>
													<tr>
														<td background="images/external/news_05.jpg" height="42">
															<object
																codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0"
																classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
																viewastext="" width="100%" height="59">
																<param name="_cx" value="15372">
																<param name="_cy" value="1561">
																<param name="FlashVars" value="">
																<param name="Movie" value="flash/external/flash/12.swf">
																<param name="Src" value="flash/external/12.swf">
																<param name="WMode" value="Transparent">
																<param name="Play" value="-1">
																<param name="Loop" value="-1">
																<param name="Quality" value="High">
																<param name="SAlign" value="">
																<param name="Menu" value="-1">
																<param name="Base" value="">
																<param name="AllowScriptAccess" value="always">
																<param name="Scale" value="ShowAll">
																<param name="DeviceFont" value="0">
																<param name="EmbedMovie" value="0">
																<param name="BGColor" value="">
																<param name="SWRemote" value="">
																<param name="MovieData" value="">
																<param name="SeamlessTabbing" value="1">
																<embed src="flash/external/12.swf" quality="high"
																	pluginspage="http://www.macromedia.com/go/getflashplayer"
																	type="application/x-shockwave-flash"
																	wmode="transparent" width="100%" height="59">
															</object>
														</td>
													</tr>
													<!--newscontent-->
													<tr>
														<td valign="top" align="center" height="527">
															<br>
															<table width="98%" border="0" cellpadding="0"
																cellspacing="0">
																<tbody>
																	<tr>
																		<td class="input" valign="top" align="center">
																			<table width="96%" border="0" cellpadding="0"
																				cellspacing="0" height="133">
																				<tbody>
																					<tr>
																						<td height="23">
																							<table width="102%" border="0" cellpadding="0"
																								cellspacing="0">
																								<tbody>
																									<tr>
																										<td width="5%" align="center"
																											bgcolor="#ddebba" height="21">
																											<font color="#ffffff" size="1">◆</font>
																										</td>
																										<td 95%="" width="" bgcolor="#84a230">
																											<font color="#ffffff"><strong>
																													公告</strong> </font>
																										</td>
																									</tr>
																								</tbody>
																							</table>
																						</td>
																					</tr>
																					<tr>
																						<td valign="top" align="center" height="110">
																							<br>
																							<table width="96%" border="0" cellpadding="0"
																								cellspacing="0">
																								<tbody>
																									

																									<s:iterator value="pm.datas" status="stuts" >



																										<s:if test="#stuts.odd == true">

																											<tr height="30">
																										<td width="15%" align="center"
																											bgcolor="#f0f5fb">
																											<font color="#ff6600">⊙</font>
																										</td>
																										<td width="85%" bgcolor="#f0f5fb">
																											<a
																												href="external/annoucement_show?annoucementid=${id }"
																												title="${title }" target="_blank">${title }</a>
																										</td>
																									</tr>
																										</s:if>



																										<s:else>
																											<tr height="30">
																										<td width="15%" align="center"
																											>
																											<font color="#ff6600">⊙</font>
																										</td>
																										<td width="85%" >
																											<a
																												href="external/annoucement_show?annoucementid=${id }"
																												title="${title }" target="_blank">${title }</a>
																										</td>
																									</tr>

																											
																										</s:else>




																										</tr>

																									</s:iterator>





																								</tbody>
																							</table>
																						</td>
																					</tr>
																				</tbody>
																			</table>
																		</td>
																	</tr>
																</tbody>
															</table>
															<TABLE width="700" border=0 align=center cellPadding=0 cellSpacing=0
				borderColor=#ffffff style="FONT-SIZE: 10pt">
				<TR height=28px valign="middle">
					<TD align=right noWrap background=images/list_middle.jpg>
						<!-- 分页导航条 开始-->
						<TABLE border=0 align=center cellPadding=0 cellSpacing=0>
							<TR height=28px valign="middle">
								<TD align=right noWrap 
									background=images/list_middle.jpg>
									&nbsp;&nbsp;
									<pg:pager
										url="<%=request.getAttribute("javax.servlet.forward.servlet_path").toString().substring(1) %>"
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
								</td>
								<!-- 更改pagesize 开始-->
								<td align=left valign="middle" noWrap width="10%"
									background=images/list_middle.jpg>
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
								</TD>
								<!-- 更改pagesize 结束-->
							</TR>
						</TABLE>
														</td>
													</tr>
													<!--newscontent-->
												</tbody>
											</table>
											<!--endtable_c2-->
										</td>
									</tr>
								</tbody>
							</table>
							<!--endtablecenter-->
							<!--endcenter -->
						</td>
					</tr>


				</tbody>
			</table>
			</font>
			</td>
			</tr>
			</tbody>
			</table>
			<!-- endtableall-->
		</form>
	</body>
</html>