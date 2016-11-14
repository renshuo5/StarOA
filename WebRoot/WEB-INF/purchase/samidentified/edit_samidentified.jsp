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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>样品认定申请报告单</title>
    <link type="text/css" href="css/vip.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
  
    <script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/purchase.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
      <script type="text/javascript" src="<%=basePath%>js/public.js"></script>
    <script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
  </head>
  <body>
    <table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>

    </table>
    <form action="purchase/samidentified/samidentified_update" method="post">
    <input type="hidden" value="${samidentified.id}" name="samidentified.id">
      <table class="title">
        <tr>
          <td>样品认定申请报告单 </td>
        </tr>
        </table>
        <table class="addTable" style="width: 100%">
        <tr>
           <td style="width: 15%">申请单位：</td>
           <td>
           <input type="hidden" name="departmentId" value="${samidentified.department.id}"/>
               <select id="dptName" name="dptName" onChange="departmentId.value=this.options[dptName.selectedIndex].value;">
             <option value="${samidentified.department.id}" >${samidentified.department.dptName}</option>
             <c:forEach items="${departmentList}" var="dpt">
               <c:if test="${samidentified.department.id!=dpt.id&&1==dpt.dptType}">
				<option value="${dpt.id}" >
				${dpt.dptName}
				</option></c:if>
			</c:forEach>
              </select>
            </td>
           <td>经办人：</td>
           <td class="tdleft">
               <input type="text" value="${auditUser.employee.empName}" size="7"
							disabled="disabled" />
						<input type="hidden" name="samidentified.hangding.empId"
							value="${auditUser.employee.empId}" />
			</td>
        </tr>
        <tr align="center">
            <td style="width: 15%">负责人：</td>
            <td>
               <input type="text" disabled="disabled" name="" /></td>
            <td>时间：</td>
            <td><input id="d2442" type="text" class="Wdate checkDateInfo" value="${samidentified.samdate}"
						onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2_1',skin:'whyGreen'})" />
                     <input type="hidden"  value="${samidentified.samdate}" id="d2441_2_1" name="samidentified.samdate" />
            </td>
      </tr>
      </table>
      <table class="addTable" style="width: 100%">
        <tr>
          <th>申请内容 </th>
        </tr>
      </table>
      <table class="addTable" style="width: 100%">
        <tr>
        <td> 供方名称：
            <input type="text" id="supplierinfoSupcnameId"  size="15" value="${samidentified.supplierinfo.supcname}" disabled="disabled" />
            <input type="hidden" name="supplierinfoId" id="supplierinfoIdId" value="${samidentified.supplierinfo.id}"/>
            <input id="supplierinfoe" type="button" value="选择" class="frm_btn"
				                          onclick="openWin('<%=basePath%>purchase/supplierinfo/supplierinfo_selectInput','selectSupplierinfo',800, 600, 1);return false"/>
        </td>
        <td style="width: 29%; text-align:center" >
          第
          <input type="text" value="${samidentified.reqtime}" name="samidentified.reqtime" size="5" class="checkNumforall"/>
          次申请 </td><td align="left" colspan="35%">希望
          <input id="d2441" type="text" class="Wdate" value="${samidentified.wantdate}"
						onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d2441_2_0',skin:'whyGreen'})" />
          <input type="hidden"  value="${samidentified.wantdate}" id="d2441_2_0" name="samidentified.wantdate" />
          前完成 </td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:left"> 属性：
          <c:if test="${!empty samidentified.newitem}">
          <input type="checkbox"  name="newitem" checked /></c:if>
          <c:if test="${empty samidentified.newitem}">
          <input type="checkbox"  name="newitem" /></c:if>
          新产品
          <c:if test="${!empty samidentified.newsup}">
          <input type="checkbox"  name="newsup" checked /></c:if>
          <c:if test="${empty samidentified.newsup}">
          <input type="checkbox"  name="newsup" /></c:if>
          新供方
          <c:if test="${!empty samidentified.techchange}">
          <input type="checkbox"  name="techchange" checked /></c:if>
          <c:if test="${empty samidentified.techchange}">
          <input type="checkbox"  name="techchange" /></c:if>
          技术变更
          <c:if test="${!empty samidentified.redcost}">
          <input type="checkbox"  name="redcost" checked /></c:if>
          <c:if test="${empty samidentified.redcost}">
          <input type="checkbox"  name="redcost" /></c:if>
          降低成本
          <c:if test="${!empty samidentified.entest}">
          <input type="checkbox"  name="entest" checked /></c:if>
          <c:if test="${empty samidentified.entest}">
          <input type="checkbox"  name="entest" /></c:if>
          进入量试
          </td>
        <td> 适用产品：
             <input type="text" value="${samidentified.itemtype.name}" id="itemTypeNameId" size="15" disabled="disabled" />
             <input type="text" value="${samidentified.itemtype.item.name}" id="itemNameId" size="15" disabled="disabled" />
		     <input type="hidden" name="itemtypeId" id="itemTypeIdId" value="${samidentified.itemtype.id}" />
			 <input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>item/itemtype/itemtype_selectInput?isSelectItemType=0','selectItem',800, 600, 1);return false">
        </td>
      </tr>
      </table>
      <table class="addTable" style="width: 100%">
      <tr align="center">
        <th> 样品名称 </th>
        <th> 品牌 </th>
        <th> 型号规格 </th>
        <th> 图号或料号 </th>
        <th> 数量 </th>
        <th> 单价 </th>
      </tr>
      <tr>
        <td><input type="text" value="${samidentified.supplierinfo.itemname}" size="22" id="itemnameId" disabled="disabled" /></td>
        <td><input type="text" value="${samidentified.brand}" name="samidentified.brand" size="22" class="itemname"/></td>
        <td><input type="text" value="${samidentified.supplierinfo.itemtypename}" size="22" id="itemtypenameId" disabled="disabled" /></td>
        <td><input type="text" value="${samidentified.mcodename}" name="samidentified.mcodename" size="25" class="itemname"/></td>
        <td><input type="text" value="${samidentified.num}" name="samidentified.num" size="15" class="checkNumShowInfo"/></td>
        <td><input type="text" value="${samidentified.uprice}" name="samidentified.uprice" size="15" class="checkEmptyShowInfo"/></td>
      </tr>
      </table>
      <table class="addTable" style="width: 100%">
      <tr align="center">
        <td align="center" width="10%"> 填制说明 </td>
        <td align="center" colspan="5"> “样品名称”栏目应填写同一供方且配套在我公司同一产品的样品。 
      </tr>
      </table>
			<table style="text-align:center" >
				<tr bgcolor="#f5f5f5">
          <td colspan="7"><div align="center">
              <input type="submit" value=" 提 交 " class="frm_btn"/>
            </div>
          </td>
        </tr>
      </table>
    </form>
    <SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
  </body>
</html>