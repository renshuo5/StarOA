<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<base href="<%=basePath%>">
		<title>培训信息</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>

		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>



	</head>

	<body>

		<form action="persons/ytrainplan/ytrainplan_edite" method="post">
		<table class="title">
				<tr>
					<td>
						年度培训计划表
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td>
						<input size="18" id="d2442" type="text" class="Wdate"
							onFocus="WdatePicker({dateFmt:'yyyy',vel:'2',skin:'whyGreen'})"
							value="${planname}" />
						<input type="hidden" id="2" name="yplanname1.names"
							value="${yplanname1.names}" />
						<input type="hidden" name="yplanname1.id" value="${yplanname1.id}" />
						年度培训计划表
						</font>
					</td>
				</tr>
			</table>
			<table class="title">
				<tr>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>
			<table class="list">
				<tr>
					<th rowspan="2">
						培训内容
					</th>
					<th rowspan="2">
						执行单位
					</th>
					<th rowspan="2">
						配合单位
					</th>
					<th rowspan="2">
						培训地点
					</th>

					<th colspan="4">
						时间安排
					</th>
					<th rowspan="2">
						添加
					</th>
					<th rowspan="2">
						删除
					</th>

				</tr>
				<tr>
					<th>
						一季
					</th>
					<th>
						二季
					</th>
					<th>
						三季
					</th>
					<th>
						四季
					</th>


				</tr>
				<c:if test="${!empty ytrainplanlist}">
					<c:forEach items="${ytrainplanlist}" var="ytrainplan"
						varStatus="vs">
						<tr>
							<td align="center">

								<input name="contents" type="text" value="${ytrainplan.content}"
									size="12" /><font color="#FF0000">*</font>
							</td>
							<td align="center">
								<input type="hidden" name="departmentIds"
									id="departmentIds_${vs.index+1}"
									value="${ytrainplan.department.id}" />
								<select name="dptName"
									onChange="document.getElementById('departmentIds_${vs.index+1}').value=this.options[document.getElementById('dptName_${vs.index+1}').selectedIndex].value;"
									id="dptName_${vs.index+1}">
									<option>
										<c:choose>
											<c:when test="${ytrainplan.department.id!=null}">
							               	${ytrainplan.department.dptName}  
							             
							             </c:when>
											<c:otherwise>
							                                 请选择
							            
							            </c:otherwise>

										</c:choose>
									</option>
									<c:forEach items="${departmentList}" var="dpt">
										<c:if test="${dpt.id!=ytrainplan.department.id}">
											<option value="${dpt.id}" name="${dpt.dptName}">
												${dpt.dptName}
											</option>
										</c:if>
									</c:forEach>
								</select>
								<font color="#FF0000">*</font>
							</td>
							<td align="center">
								<input type="hidden" name="departmentId1s"
									id="departmentId1s_${vs.index+1}"
									value="${ytrainplan.withf.id}" />
								<select name="dptName1"
									onChange="document.getElementById('departmentId1s_${vs.index+1}').value=this.options[document.getElementById('dptName1_${vs.index+1}').selectedIndex].value;"
									id="dptName1_${vs.index+1}">
									<option>
										<c:choose>
											<c:when test="${ytrainplan.withf.id!=null}">
							               	${ytrainplan.withf.dptName}  
							             
							             </c:when>
											<c:otherwise>
							                                 请选择
							            
							            </c:otherwise>

										</c:choose>
									</option>
									<c:forEach items="${departmentList}" var="dpt1">
										<c:if test="${dpt1.id!=ytrainplan.withf.id}">
											<option value="${dpt1.id}" name="${dpt1.dptName}">
												${dpt1.dptName}
											</option>
										</c:if>
									</c:forEach>

								</select>
								<font color="#FF0000">*</font>
							</td>
							<td align="center">
								<input type="text" name="adds" value="${ytrainplan.traddress }"
									size="12" class="itemname" />
							</td>
							<td>
								<select id="select1_${vs.index+1}" name="schdate1s">
									<option>
										请选择
									</option>
									<option
										<c:if test="${ytrainplan.schdate1=='0'}">selected="selected"</c:if>
										value="0" name="否">
										否
									</option>
									<option
										<c:if test="${ytrainplan.schdate1=='1'}">selected="selected"</c:if>
										value="1" name="是">
										是
									</option>
								</select><font color="#FF0000">*</font>
							</td>
							<td align="center">
								<select id="select2_${vs.index+1}" name="schdate2s">
									<option>
										请选择
									</option>
									<option
										<c:if test="${ytrainplan.schdate2=='0'}">selected="selected"</c:if>
										value="0" name="否">
										否
									</option>
									<option
										<c:if test="${ytrainplan.schdate2=='1'}">selected="selected"</c:if>
										value="1" name="是">
										是
									</option>
								</select><font color="#FF0000">*</font>
							</td>
							<td align="center">
								<select id="select3_${vs.index+1}" name="schdate3s">
									<option>
										请选择
									</option>
									<option
										<c:if test="${ytrainplan.schdate3=='0'}">selected="selected"</c:if>
										value="0" name="否">
										否
									</option>
									<option
										<c:if test="${ytrainplan.schdate3=='1'}">selected="selected"</c:if>
										value="1" name="是">
										是
									</option>
								</select><font color="#FF0000">*</font>
							</td>
							<td align="center">

								<select id="select4_${vs.index+1}" name="schdate4s">
									<option>
										请选择
									</option>
									<option
										<c:if test="${ytrainplan.schdate4=='0'}">selected="selected"</c:if>
										value="0" name="否">
										否
									</option>
									<option
										<c:if test="${ytrainplan.schdate4=='1'}">selected="selected"</c:if>
										value="1" name="是">
										是
									</option>
								</select><font color="#FF0000">*</font>
							</td>

							<td>
								<img src="<%=basePath %>images/add.png"
									onclick="addBatchRow(this)" />
							</td>
							<td>
								<img src="<%=basePath %>images/del.png"
									onclick="deleteBatchRow1(this,${vs.index+1})" />
							</td>
						</tr>

					</c:forEach>
				</c:if>

				<tr id="rowTemplete_0">
					<td align="center">

						<input name="contents" type="text" value="" size="12" /><font color="#FF0000">*</font>
					</td>
					<td align="center">
						<input type="hidden" name="departmentIds" id="departmentIds_0" />
						<select name="dptName"
							onChange="document.getElementById('departmentIds_0').value=this.options[document.getElementById('dptName_0').selectedIndex].value;"
							id="dptName_0">
							<option>
								请选择
							</option>
							<c:forEach items="${departmentList}" var="dpt">
								<option value="${dpt.id}" name="${dpt.dptName}">
									${dpt.dptName}
								</option>
							</c:forEach>
						</select>
						<font color="#FF0000">*</font>
					</td>
					<td align="center">
						<input type="hidden" name="departmentId1s" id="departmentId1s_0" />
						<select name="dptName1"
							onChange="document.getElementById('departmentId1s_0').value=this.options[document.getElementById('dptName1_0').selectedIndex].value;"
							id="dptName1_0">
							<option>
								请选择
							</option>
							<c:forEach items="${departmentList}" var="dpt1">
								<option value="${dpt1.id}" name="${dpt1.dptName}">
									${dpt1.dptName}
								</option>
							</c:forEach>

						</select>
						<font color="#FF0000">*</font>
					</td>
					<td align="center">
						<input type="text" name="adds" value="" size="12" class="itemname" />
					</td>
					<td>
						<input type="hidden" name="schdate1s" id="schdate1s_0" />
						<select id="select1_0"
							onChange="document.getElementById('schdate1s_0').value=this.options[document.getElementById('select1_0').selectedIndex].value;">
							<option>
								请选择
							</option>
							<option value="0" name="否">
								否
							</option>
							<option value="1" name="是">
								是
							</option>
						</select><font color="#FF0000">*</font>
					</td>
					<td align="center">
						<input type="hidden" name="schdate2s" id="schdate2s_0" />
						<select id="select2_0"
							onChange="document.getElementById('schdate2s_0').value=this.options[document.getElementById('select2_0').selectedIndex].value;">
							<option>
								请选择
							</option>
							<option value="0" name="否">
								否
							</option>
							<option value="1" name="是">
								是
							</option>
						</select><font color="#FF0000">*</font>
					</td>
					<td align="center">
						<input type="hidden" name="schdate3s" id="schdate3s_0" />
						<select id="select3_0"
							onChange="document.getElementById('schdate3s_0').value=this.options[document.getElementById('select3_0').selectedIndex].value;">
							<option>
								请选择
							</option>
							<option value="0" name="否">
								否
							</option>
							<option value="1" name="是">
								是
							</option>
						</select><font color="#FF0000">*</font>
					</td>
					<td align="center">
						<input type="hidden" name="schdate4s" id="schdate4s_0" />
						<select id="select4_0"
							onChange="document.getElementById('schdate4s_0').value=this.options[document.getElementById('select4_0').selectedIndex].value;">
							<option>
								请选择
							</option>
							<option value="0" name="否">
								否
							</option>
							<option value="1" name="是">
								是
							</option>
						</select><font color="#FF0000">*</font>
					</td>

					<td>
						<img src="<%=basePath %>images/add.png"
							onclick="addBatchRow(this)" />
					</td>
					<td>
						<img src="<%=basePath %>images/del.png"
							onclick="deleteBatchRow2(this)" />
					</td>
				</tr>
			</table>
			<table align="center">
				<tr>
					<td>
						<input name="提交" type="submit" value="提交" class="frm_btn" />
					</td>
				</tr>
			</table>
		</form>
		<%--
        					<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	--%>
	</body>

</html>