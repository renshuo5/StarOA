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
		<title>质量分析</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		 <script type="text/javascript" src="<%=basePath%>js/sales.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>

	</head>

	<body>
		<form action="sales/return/qualityanalysis/qualityanalysis_add"
			method="post">

			<table class="title  editTable">
				<tr>
					<th colspan="7" background="images/title_bg2.jpg" align="center">
						产 品 退 货 质 量 分 析 表
					</th>
				</tr>
			</table>
			<table class="addTable editTable">
				<tr>
					<td>
						名产品称
					</td>
					<td>
					
							<select name="">
								<option>
									请选择
								</option>
								<c:forEach items="${retgoods}" var="ret">
									<option value="${ret.itemType.item.id}">
										${ret.itemType.item.name}
									</option>
								</c:forEach>
							</select>*
					
					</td>
				</tr>
				<tr>
					<td>
						型号规格
					</td>
					<td>
				
							<select name="qualityanalysis.itemType.id">
								<option>
									请选择
								</option>
								<c:forEach items="${retgoods}" var="ret">
									<option value="${ret.itemType.id}">
										${ret.itemType.name}
									</option>
								</c:forEach>
							</select>*
					
						
					</td>
				</tr>
				<tr>
					<td>
						退货数
					</td>
					<td>
						<input type="text" name="qualityanalysis.rnum" class="itemname"/>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						送货数
					</td>
					<td>
						<input type="text" name="qualityanalysis.snum" class="itemname"/>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						主要故障想象
					</td>
					<td>
						<input type="text" name="qualityanalysis.mainfault" class="itemname"/>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						原因分析
					</td>
					<td>
						<input type='text' name="qualityanalysis.analysis" class="itemname"/>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						对策措施
					</td>
					<td>
						<input type="text" name="qualityanalysis.measures" class="itemname"/>
						&nbsp;
					</td>
				</tr>
				</table>
				<table class="addTable ">
				<tr>
					<td align="center" colspan="10" style="text-align:center">
						<input type="submit" value=" 提 交 " class="frm_btn">
					</td>
				</tr>
			</table>
		</form>
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>
