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
		<title>年度培训计划表</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>

		<table class="title">
			<tr>
				<td>
					<c:out value="${planname}" />
					年度培训计划表
				</td>
			</tr></table>
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
				
					
				</tr>
				<tr>
				 <th >
						一季
					</th>
				 <th >二季</th>
				 <th >三季</th>
				 <th >四季</th>
					
			  </tr>
				<c:if test="${!empty ytrainplanlist}">
					<c:forEach items="${ytrainplanlist}" var="ytrainplan">
						<tr>
							<td>
								<div align="center">
									<c:out value="${ytrainplan.content}" />
								</div>
							</td>
							<td >
								<div align="center">
									<c:out value="${ytrainplan.department.dptName}" />
								</div>
							</td>
							<td >
								<div align="center">
									<c:out value="${ytrainplan.withf.dptName}" />
								</div>
							</td>
							<td >
								<div align="center">
									<c:out value="${ytrainplan.traddress}" />
								</div>
							</td>
							<td >
								<div align="center">
									<c:choose>
										<c:when test="${'1' eq ytrainplan.schdate1}">
                       是
                    </c:when>
										<c:otherwise>
                       否
                    </c:otherwise>
									</c:choose>
								</div>
							</td>
							<td >
								<div align="center">
									<c:choose>
										<c:when test="${'1' eq ytrainplan.schdate2}">
                       是
                    </c:when>
										<c:otherwise>
                       否
                    </c:otherwise>
									</c:choose>
								</div>
							</td>
							<td >
								<div align="center">
									<c:choose>
										<c:when test="${'1' eq ytrainplan.schdate3}">
                       是
                    </c:when>
										<c:otherwise>
                       否
                    </c:otherwise>
									</c:choose>
								</div>
							</td>
							<td >
								<div align="center">
									<c:choose>
										<c:when test="${'1' eq ytrainplan.schdate4}">
                       是
                    </c:when>
										<c:otherwise>
                       否
                    </c:otherwise>
									</c:choose>
								</div>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<!-- 在列表数据为空的时候，要显示的提示信息 -->
				<c:if test="${empty ytrainplanlist}">
					<tr>
						<td colspan="10" align="center" bgcolor="#EFF3F7"
							class="TableBody1" onMouseOver=this.bgColor
							= '#DEE7FF';
onmouseout=this.bgColor= '#EFF3F7';
>
						没有找到相应的记录
					</td>
					</tr>
				</c:if>
			</table>
            <table class="btn" style="width:100%">
        <tr>
        <td>
<input type="button" class="frm_btn" value="关闭窗口"
onclick=window.close();
;>
        </td>
        </tr>
        </table>
	</body>

</html>