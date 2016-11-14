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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>备品备料</title>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>

		 <script type="text/javascript" src="<%=basePath%>js/purchase.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript">
	function add() {
		var tuprice = document.forms[0].uprice.value;
		var tnum = document.forms[0].num.value;
		if (null != tuprice && 0 != tuprice && null != tnum && 0 != tnum) {
			document.forms[0].price.value = tuprice * tnum;
		} else {
			document.forms[0].price.value = "";
		}
	}
</script>
	</head>
	<body>
		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>
		<form action="purchase/spare/spare_add" method="post">

			<table class="title" style="width:85%">
				<tr>
					<td>
						添加备品备料
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						供应商：
					</td>
					<td>
						<input type="text" id="quaprolistnameId" disabled="disabled"
							name="spare.quaprolist.supplierinfo.supcname"/>
						<input type="hidden" name="quaprolistId" id="quaprolistIdId" />
						<font color="#FF0000">*</font>
						<input id="supplierinfoe" type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>purchase/quaprolist/quaprolist_selectInput','selectQuaprolist',800, 600, 1);return false" />

					</td>
				</tr>
				<tr>
					<td>
						品名：
					</td>
					<td>
						<input type="text" id="itemnameId" disabled="disabled" />
					</td>
				</tr>
				<tr>
					<td>
						规格型号：
					</td>
					<td>
						<input type="text" id="itemtypenameId" disabled="disabled" />
					</td>
				</tr>

				<tr>
					<td>
						联系人：
					</td>
					<td>
						<input type="text" id="businessnameId" disabled="disabled" />
					</td>
				</tr>
				<tr>
					<td>
						联系方式：
					</td>
					<td>
						<input type="text" id="phoneId" disabled="disabled" />
					</td>
				</tr>
				<tr>
					<td>
						单位：
					</td>
					<td>
						<input type="text" name="spare.unit" class="itemname"/>
					</td>
				</tr>
				<tr>
					<td>
						数量：
					</td>

					<td width="78%">
						<input type="text" name="spare.num" id="num" onBlur="add()" class="itemname"/><span  id="checknum" style="color: #FF0000; font-size: 12px;" ></span>
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						单价：
					</td>
					<td width="78%">
						<input type="text" name="spare.uprice" id="uprice" onBlur="add()" class="itemname"/><span  id="checkuprice" style="color: #FF0000; font-size: 12px;" ></span>
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						总额：
					</td>
					<td>
						<input type="text" name="price" id="price" disabled="disabled" />
					</td>
				</tr>
			</table>
			<table style="width:85%; text-align:center" >
				<tr bgcolor="#f5f5f5">
					<td>
							<input type="submit" name="SYS_SET" value=" 提 交 " class="frm_btn" id="add_spar">
					</td>
				</tr>
			</table>
			</form>

			<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
</html>
