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
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		 <script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
        <script language="javascript" src="<%=basePath%>js/textRightLeft.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript">


</script>

		<title>发送消息</title>
	</head>

	<body>
       <form action="persons/Rasmessage/rasmessage_replay">
      <input type="hidden" name="userId" value="${rasmessage.sper.id}"/>
 
		<table class="title" style="width:85%">
			<tr>
				<td>
					查看消息
				</td>
			</tr>
		</table>
		<table class="addTable">
			<tr>
				<td>
					接收人
				</td>
				<td>
					<c:out value="${rasmessage.rper.employee.empName}" />
				</td>
			</tr>

			<tr>
				<td>
					标 题
				</td>
				<td>
					<c:out value="${rasmessage.title}" />
				</td>
			</tr>
			<tr>
				<td>
					附件
				</td>
				<td>
					<c:choose>

						<c:when test="${rasmessage.fla1 eq '0'}">
							<div align="left">
								没有附件
							</div>
						</c:when>
						<c:otherwise>
							<div align="left">
								<a href="${rasmessage.accessories}">${rasmessage.fla1}</a>
							</div>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>


			<tr>
				<td>
					内 容
				</td>
				<td>
					<textarea name="rasmessage.content" cols="50" rows="4" readonly="readonly"
						value="${rasmessage.content}">${rasmessage.content}</textarea>
				</td>
			</tr>
		</table>
		<table>
			<tr>
				<td>
					<input type="submit" name="submit" value="回复" class="frm_btn"  />
                    
				</td>
			</tr>
		</table>
</form>
	</body>
</html>
