
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
																							<div align="center">
	<br/>
	<br/>
<b><span style="font-size: 10pt;">${annoucement.title }</span></b>
<br/>
<br/>
</div>	
<div align="right"><hr width="90%" size="1" noshade="">${annoucement.date}</div>
																						</td>
																					</tr>
																					
																					<tr>
																						<td valign="top" align="center" height="110">
																							<br>
																						${annoucement.content}
																						</td>
																					</tr>
																				</tbody>
																			</table>
																		</td>
																	</tr>
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