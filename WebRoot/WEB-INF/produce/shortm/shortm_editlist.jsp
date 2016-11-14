<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";%>
<html>
<head>
<base href="<%=basePath%>">
<title>缺料登记</title>
	<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath %>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath %>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath %>My97DatePicker/WdatePicker.js"></script>
</head>
<body>
 <table class="addTable">
 <form action="produce/shortm/shortm_add">
        <tr>
          <th colspan="11" align="center" background="images/title_bg2.jpg">缺 料 报 告 单          </th>
   <tr>
         
           <td colspan="2" >缺料编号：${shortm.shoid}</td>
            <td colspan="2" >时间：${shortm.sdate}</td>
            <td colspan="2" >申请单位：          ${shortm.department1.dptName }
          </td>
          <td colspan="2" >车间主任： ${ shortm.employee1.empName}      </td>
          <td colspan="2" align="center" >申请人：
              ${shortm.employee2.empName}         </td>
        </tr>
          </tr>
        
        <tr>
      
          <th width="10%" align="center" >材料名称 </th>
          <th width="10%" align="center" >型号 规格 </th>
          <th width="10%" align="center" >单位 </th>
          <th width="7%"  align="center" >数量 </th>
          <th width="16%" align="center" >用途 </th>
          <th width="8%"  align="center" >单价 </th>
          <th width="10%"  align="center" >金额 </th>
          <th   align="center" >备注 </th>
           <th align="center" >编辑 </th>
          <th   align="center" > 删除</th>
        </tr>
        <!---------------------------LOOP START------------------------------>
        <c:if test="${!empty pm.datas}">
					<c:forEach items="${pm.datas}" var="shogood">
        <tr id="rowTemplete_0" bgcolor="#EFF3F7"
						onmouseover="this.bgColor= '#DEE7FF'"
						onmouseout="this.bgColor='#EFF3F7'">
         
           <td align="center">${shogood.itemType.item.name }</td>
          <td align="center">
          ${shogood.itemType.name }
          </td>
        <td align="center">${shogood.unit } </td>
        <td align="center"> ${shogood.num}</td>
          <td align="center">${shogood.userf}</td>
          <td align="center">${shogood.uprice}</td>
          <td align="center">${shogood.price}</td>
          <td align="center">${shogood.note}</td>
            <td align="center"><a class="a03" href="#"
							onclick="openWin('produce/shortm/shortm_edit_shogood?shogoodID=${shogood.shog_id}&shortmID=${shortm.id}','editshogood',1000,600);return false"><img src="images/edit.gif" width="15" height="16" border="0"></a></td>
                                  <td align="center"><a href="#"
                                  
								onclick="del('produce/shortm/shortm_shogood_del?shogoodID=${shogood.shog_id}&shortmID=${shortm.id}');return false">
								<img src="images/del.gif" width="15" height="16" border="0">
							</a> </td>
         
   </tr>
   		</c:forEach>
			</c:if>
   	<!----------------------LOOP END------------------------------->
			<!-- 在列表数据为空的时候，要显示的提示信息 -->
			<c:if test="${empty pm.datas}">
				<tr>
					<td colspan="11" align="center" bgcolor="#EFF3F7"
						onmouseover="this.bgColor= '#DEE7FF'"
						onmouseout="this.bgColor='#EFF3F7'">
						没有找到相应的记录
					</td>
				</tr>
			</c:if>
 </table>
			
		
  </body>
</html>
					