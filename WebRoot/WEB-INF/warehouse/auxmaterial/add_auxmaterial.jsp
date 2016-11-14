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
		<title>辅助材料</title>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
		<form action="warehouse/auxmaterial/auxmaterial_add" method="post">

			<table class="title" style="width:85%">
				<tr>
					<td>
						填写辅助材料
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						供应商：
					</td>
					<td>
						<input class="selectin" type="text" id="quaprolistnameId" disabled="disabled"
							name="auxmaterial.quaprolist.supplierinfo.supcname" />
						<input type="hidden" name="quaprolistId" id="quaprolistIdId" />
						<input id="supplierinfoe" type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>purchase/quaprolist/quaprolist_selectInput','selectQuaprolist',800, 600, 1);return false" />
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						品名：
					</td>
					<td>
						<input type="text" id="itemnameId" disabled="disabled" />
						<font color="#FF0000">*</font>
					</td>
				</tr>

				<tr>
					<td>
						材料代码：
					</td>
					<td>

						<input type="text" id="itemtypenameId" disabled="disabled" />

						<font color="#FF0000">*</font>
					</td>
				</tr>

				<tr>
					<td>
						联系人：
					</td>
					<td>

						<input type="text" id="businessnameId" disabled="disabled" />

						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						联系方式：
					</td>
					<td>

						<input type="text" id="phoneId" disabled="disabled" />

						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						单位：
					</td>
					<td>
						<input type="text" name="auxmaterial.unit" size="45"
							maxlength="100" class="checkEmptyShowInfo" id="auxmaterialunit" />
						<span id="checkauxmaterialunit"
							style="color: #FF0000; font-size: 12px;"></span>
						<font color="#FF0000">*</font>
					</td>
				</tr>

				<tr>
					<td>
						采购日期：
					</td>
					<td>
						<input id="d244" type="text" class="Wdate checkDateInfo"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" name="auxmaterial.purDate" />
						<font color="#FF0000">*</font>
					</td>

				</tr>


				<tr>
					<td>
						价格：
					</td>
					<td>
						<input type="text" name="auxmaterial.uprice" size="45"
							maxlength="100" class="checkEmptyShowInfo" id="auxmaterialuprice" />
						<span id="checkauxmaterialuprice"
							style="color: #FF0000; font-size: 12px;"></span>
							<font color="#FF0000">*</font>

					</td>
				</tr>
				<tr>
					<td>
						进仓数：
					</td>
					<td>
						<input type="text" name="auxmaterial.ewhnum" size="45"
							maxlength="100" class="checkNumShowInfo" id="auxmaterialewhnum" />
					</td>
				</tr>
				<tr>
					<td>
						出仓数：
					</td>
					<td>
						<input type="text" name="auxmaterial.owhnum" size="45"
							maxlength="100" class="checkNumShowInfo" id="auxmaterialowhnum" />	</td>
				</tr>
			</table>
			<table style="width:85%">
				<tr bgcolor="#f5f5f5">
					<td>
						<div align="center">
							<input type="submit" name="SYS_SET" value=" 提 交 " class="frm_btn"
								id="SYS_SET">
							 <input type="button" class="frm_btn" value="取消" onclick=window.close();>

						</div>
					</td>
				</tr>
			</table>
			<SCRIPT type=text/javascript>
	$(document).ready(registerPre);
</SCRIPT>
</form>
	</body>
</html>
