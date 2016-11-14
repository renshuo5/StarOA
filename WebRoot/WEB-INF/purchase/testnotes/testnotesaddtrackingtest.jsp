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
    <title>供应商资料</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" href="css/vip.css" rel="stylesheet"/>
    <script type="text/javascript" src="<%=basePath%>js/public.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
    <script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
  </head>
  <body>
    <table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>

    </table>
    <form action="produce/trackingtest/trackingtest_add_input" method="post">
    <input type="hidden" name="testnotesId" value="${testnotes.id }">
      <table align="center">
        <tr>
          <td colspan="100%" align="center"background="images/title_bg2.jpg">
             <font size="+1" color="#FFFFFF"> 审核量试通知单 </font>
          </td>
        </tr>
        <tr align="center">
           <td>制定部门：<input type="text" value="${testnotes.department.dptName}" disabled="disabled" /></td>
           <td>第（
                <input type="text" value="${testnotes.tiems}" size="5" disabled="disabled"/>）次提出</td>
           <td>发出日期：<input type="text" value="${testnotes.senddate}" disabled="disabled" /></td>
        </tr>
      </table>
      <table>
        <tr>
          <th>量试说明 </th>
        </tr>
      </table>
      <table>
      <tr align="center">
        <th> 产品名称 </th>
        <th> 品牌 </th>
        <th> 型号规格 </th>
        <th> 数量 </th>
        <th> 备注 </th>
      </tr>
      <tr align="center">
        <td><input type="text" value="${testnotes.supplierinfo.itemname}" disabled="disabled" /></td>
        <td><input type="text" value="${testnotes.brand}" disabled="disabled" /></td>
        <td><input type="text" value="${testnotes.supplierinfo.itemtypename}" disabled="disabled" /></td>
        <td><input type="text" value="${testnotes.num}" size="8" disabled="disabled" /></td>
        <td><input type="text" value="${testnotes.note}" size="8" disabled="disabled" /></td>
      </tr>
      </table>
      <table>
         <tr>
             <td>供应厂商：</td>
             <td colspan="5" align="left"><input type="text" value="${testnotes.supplierinfo.supcname}" disabled="disabled" />
             </td>
             
         </tr>
         <tr>
             
             <td rowspan="2">采购和要求量试依据:</td>
             <td colspan="5" align="left">
                 <textarea disabled="disabled" cols="40" rows="4">${testnotes.basis}</textarea>
             </td>
         </tr>
         <tr>
              <td colspan="6"> 经办：<input type="text" value="${testnotes.purper.empName }" disabled="disabled" />
                                                                  时间：<input type="text" value="${testnotes.purdate}" disabled="disabled" />
                                   <br/><br/>                                         
                                                                                主管：<input type="text" value="${testnotes.purmanper.empName }" disabled="disabled" />
                                                                                 时间：<input type="text" value="${testnotes.purmdate}" disabled="disabled" />
             </td>
         </tr>
      </table>
      <table><%--
         <tr>
            <td rowspan="2"> 工艺技术部门意见 </td>
            <td colspan="5" align="left">
             <textarea disabled="disabled" cols="50" rows="4">${testnotes.quadvice }</textarea>
            </td>
         </tr>
         --%><tr>
           <td colspan="6"><%-- 经办：<input type="text" value="${testnotes.quaper.empName }" disabled="disabled" />
                                   --%> 主管：<input type="text" value="${testnotes.quamanper.empName }" disabled="disabled" />
                                   时间：<input type="text" value="${testnotes.quadate}" disabled="disabled" />
           </td>
         </tr>
      </table>
      <table>
         <tr>
            <td style="width:15%">检验结果:</td>
            <td><c:if test="${testnotes.result}">
                <input type="radio" name="testnotes.result" value="true" checked disabled="disabled"/></c:if>
                <c:if test="${!testnotes.result}">
                <input type="radio" name="testnotes.result" value="true" disabled="disabled"/></c:if>合格&nbsp;
               <c:if test="${!testnotes.result}">
               <input type="radio" name="testnotes.result" value="false" checked disabled="disabled"/></c:if>
               <c:if test="${testnotes.result}">
               <input type="radio" name="testnotes.result" value="false" disabled="disabled"/></c:if>不合格
               &nbsp;&nbsp;&nbsp;&nbsp;
               	(检验报告单<input type="text" value="${testnotes.checkreport}" disabled="disabled"/>)
               	检验员<input type="text" value="${testnotes.examiner.empName}" disabled="disabled"/>
            </td>
         </tr>
      </table>
      <table>
      <tr align="center">
        <td align="center" width="10%"> 填制说明 </td>
        <td align="center" colspan="5"> “样品名称”栏目应填写同一供方且配套在我公司同一产品的样品。 
      </tr>
      </table>
			<table style="text-align:center" >
				<tr bgcolor="#f5f5f5">
          <td colspan="7"><div align="center">
              <input type="submit" value="添加量试跟踪单" class="frm_btn" >
            </div></td>
        </tr>
      </table>
                            
    </form>
  </body>
</html>