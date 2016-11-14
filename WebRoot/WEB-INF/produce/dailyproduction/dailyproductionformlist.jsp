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
		<title>日生产报表</title>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/warehouse.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/autoAddRow.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>
	<form action="produce/dailyproduction/dailyproduction_input" method="post">
		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>
		<p>日生产报表</p>
<tr>
				<td>制定单位:
				  <label>
				   ${dailyproductionform.department.dptName }
				    日期:
				    ${dailyproductionform.date }
 </label></td>
			</tr>
	<table class="addTable">
				<tr>
					<th rowspan="2">型号规格</th>
					<th colspan="3">投料</th>
					<th colspan="2">计划</th>
					<th colspan="3">进仓</th>
                  <th  rowspan="2">当日直通率</th>
                
				</tr>
				<tr>
				  <th>当日</th>
				  <th>月累计</th>
				  <th>年累计</th>
				  <th>当日</th>
				  <th>完成率</th>
				  <th >当日</th>
				  <th >月累计</th>
				  <th >年累计</th>
      </tr >
      <c:if test="${!empty pm.datas}">
			
<c:forEach items="${pm.datas}" var="dailyproduction">
						<tr id="rowTemplete_0">
							<td height="37">
							${dailyproduction.itemType.name }
						    </td>
						  <td>
						    ${dailyproduction.feedDaily}
				       </td>
							<td >${dailyproduction.feedMonth}</td>
							<td >${dailyproduction.feedYear}</td>
							<td >${dailyproduction.planDaily}</td>
							<td>${dailyproduction.planComplete}</td>
							<td>${dailyproduction.storeDaily}</td>
							<td>${dailyproduction.storeMonth}</td>
							<td>${dailyproduction.storeYear}</td>
                            <td>${dailyproduction.rateDaily}</td>
                     
						</tr>
				</c:forEach>
				</c:if>
				
				<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="4" align="center" bgcolor="#EFF3F7" class="TableBody1"
						onmouseover=this.bgColor = '#DEE7FF';
onmouseout=this.bgColor='#EFF3F7';
>
						没有找到相应的记录
					</td>
				</tr>
			</c:if>
				
	</table>
	
	  </table>
    <table class="addTable" >
	    <tr>
	      <td width="1010" align="center"><div align="center">
          </div></td>
        </tr>
    </table>
    </div>
    </form>
    </body>
</html>
