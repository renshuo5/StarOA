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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/security.js"></script>
		 <script type="text/javascript" src="<%=basePath%>js/annoucement.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
		<title>发送消息</title>
	</head>

	<body>
		<form action="persons/Rasmessage/rasmessage_add" method="post"
			enctype="multipart/form-data">
			<table class="title addTable">
				<tr>
					<td>
						发送消息
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						接收人
					</td>
					<td>
						<input name="rasmessage.rper.name" Id="userNameId" type="text"
							disabled="disabled" value="" align="left" />
						<input type="hidden" id="userIdId" name="userId">
							<input type="button" value="选择" class="frm_btn"
								onclick="openWin('<%=basePath%>persons/Rasmessage/rasmessage_selectInput','人员选择',800, 600, '1');return false"><font color="#FF0000">*</font>
					</td>
				</tr>

				<tr>
					<td>
						标 题
					</td>
					<td>
						<input align="left" type="text" value="" name="rasmessage.title" class="itemname" id="rasmessagetitle"/><font color="#FF0000">*</font>
						<span  id="checkrasmessagetitle" style="color: #FF0000; font-size: 12px;" ></span>
					</td>
				</tr>
				<tr>
					<td>
						附件
					</td>
					<td>
						<input type="file" name="uploadFile">
					</td>
				</tr>


				<tr>
					<td>
						内 容
					</td>
					<td>
						<textarea cols="50" rows="4" name="rasmessage.content" class="itemname"></textarea>
					</td>
				</tr>
			</table>
			<table class="btn">
				<tr>
					<td>
						<input type="submit" name="submit" value="发送" class="frm_btn" id="SYS_SET"/>
					</td>
				</tr>
			</table>
		</form>
        <br>
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
	</body>
	</body>
</html>
