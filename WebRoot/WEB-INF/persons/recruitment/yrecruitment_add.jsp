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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>人力资源需求计划表</title>
		<link rel="stylesheet" href="css/vip.css" type="text/css"/>
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css"/>
		<script language="javascript" src="js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script language="javascript" src="js/autoAddRow.js"
			type="text/javascript"></script>
			<script type="text/javascript" src="<%=basePath%>js/shuaxin.js"></script>
        <script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>
		<form action="persons/Recruitment/recruitment_yadd" method="post">
		  <table class="title">
		  		<tr>
		  			<td>
		  				人力资源需求计划表
		  			</td>
		  		</tr>
		  </table>
			<table>
				<tr>
					<td>
					<input size="18" id="d2443" type="text" class="Wdate checkEmptyShowInfo"
								onFocus="WdatePicker({dateFmt:'yyyy',vel:'3',skin:'whyGreen'})" />
							<input type="hidden" id="3" name="yrecruitment.recruitmentName" />
						人力资源需求计划表
					</td>
					<td><div id="mesg" align="left"></div>
					<input type="hidden" id="year1" /></td>
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
					<th>
						需求类别
					</th>
					<th>
						需求人数
					</th>
					<th>
						用部门
					</th>
					<th>
						招聘性质
					</th>
					<th>
						基本要求
					</th>
					<th>
						添加
					</th>
					<th>
						删除
					</th>
				</tr>
						<tr id="rowTemplete_0">
							<td >
								<input name="recstylelist" type="text" 
									 align="left" class="checkEmptyShowInfo"/><font color="#FF0000">*</font>
							</td>
							<td >
								<input name="recnolist" type="text" 
									 align="left" class="checkNumShowInfo"/>
							</td>
							<td >
								<input type="hidden" name="departmentIds"
									 id="departmentIds_0" />
								<select name="dptName"
									onChange="document.getElementById('departmentIds_0').value=this.options[document.getElementById('dptName_0').selectedIndex].value;"
									id="dptName_0" class="selectone">
									<option>
										请选择
									</option>
									<c:forEach items="${departmentList}" var="dpt">
										<option value="${dpt.id}" name="${dpt.dptName}">
											${dpt.dptName}
										</option>
									</c:forEach>
								</select><font color="#FF0000">*</font>
							</td>
							<td >
								<input name="recnaturelist" type="text" 
									 align="left" />
							</td>
							<td >
								<textarea name="basereclist" cols="50" rows="3"
									></textarea>
							</td>
							<td>
						<img src="<%=basePath %>images/add.png"
							onclick="addBatchRow(this)" />
					</td>
					<td>
						<img src="<%=basePath %>images/del.png"
							onclick="deleteBatchRow(this)" />
					</td>
						</tr>
						
			</table>
			<table class="addTable" align="center">
				<tr>
					<td>
						<input name="提交" type="submit" value="提交" class="frm_btn" />
					</td>
				</tr>


			</table>
		</form>
		</center>
	</body>
</html>
