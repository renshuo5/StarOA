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
		<title>外协件发货单</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		 <script type="text/javascript" src="<%=basePath%>js/sales.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/highLight.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>


		<table>
			<tr height="15">
				<td background="images/shadow_bg.jpg"></td>
			</tr>
		</table>


		<form action="sales/shipment/shippingnote1/shippingnote1_add"
			method="post">


			<table class="title">
				<tr>
					<td>
						外协件发货通知单
					</td>
				</tr>
			</table>
			<table class="list">
				<tr>
					<th>
						编（批）号
					</th>

					<th>
						收货单位
					</th>
					<th>

						部品名称
					</th>
					<th>

						规格型号
					</th>
					<th>
						数量（台）
					</th>
					<th>
						备注
					</th>
					<th>
						添加
					</th>
					<th>

						删除
					</th>

				</tr>

			  
				<!-------------------------LOOP START---------------------------->				
				<tr id="rowTemplete_0" >
						<td  >
							<input type="text" name="shitimes"  size="8"></input>
						</td>
						<td  >
							<input type="text" name="shi1units" size="8" ></input>
					  </td> 
						<td>
						<input type="text"  id="itemNameId_0" size="8" disabled="disabled">
						<input type="hidden" name="itemId" id="itemIdId_0">
					</td>
					<td>
						<input type="text"  name="itemTypeNameIds"  size="8"
							id="itemTypeNameId_0" disabled="disabled"></input>
						<input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false">

						<input type="hidden" name="itemTypeIds" id="itemTypeIdId_0"></input>
						<font color="#FF0000">*</font>
					</td>
					<td>
						<input type="text" name="shi1nos" size="8"></input>*
					</td>
					<td align="center">
						<input type="text" name="shinotes" size="8"></input>
					</td>
						<td>
						<img src="<%=basePath %>images/add.png"
							onclick="addBatchRow(this)" />
					</td>
					<td>
						<img src="<%=basePath %>images/del.png"
							onclick="deleteBatchRow(this)" />
					</td>
				</tr>
				</table>
				<!--------------------LOOP END----------------------------->

			      
				<table  class="addTable" style="width:100%">
                               <tr>
							   <td colspan="2" >送货人:<input name="shippingnote1.shi1send" type="text" class="itemname"></td>
                               <td colspan="2" >接收人:<input name="shippingnote1.shi1receive" type="text" class="itemname"></td> 
                                <td colspan="2" >填单:<input type="text" disabled="disabled" name="shiw" value="${shiw.employee.empName}" />
						                              <input type="hidden" name="shippingnote1.shiw.empId" value="${shiw.employee.empId }" /></td> 
                               <td colspan="3" align="right" >时间：
							 <input id="d244" type="text" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})"/>
                              <input type="hidden" id="d244_2" name="shippingnote1.shi1date"/> 
                              </td>
                               </tr>

				</table>
				

               <table class="btn" style="width:100%">
					<tr>
						<td>
							<div align="center">
								<input type="submit" value=" 提 交 " class="frm_btn">
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