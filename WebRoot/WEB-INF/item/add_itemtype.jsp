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


<!DOCTYPE html PUBLIC "-//W3C//Dtd XHTML 1.0 Transitional//EN" "http://www.w3.org/tr/xhtml1/Dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<title>添加部品型号</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="css/vip.css" type="text/css" />
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css" />
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script language="javascript" src="<%=basePath%>js/item.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/highLight.js"></script>

	</head>

	<body>

		<form action="item/itemtype/itemtype_add" method="post">
			<%--查询--%>
			<table class="title editTable">
				<tr>
					<td>
						添加部品型号
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						部品名:
					</td>
					<td>

						<input onchange="isDYJ();" onpropertychange="isDYJ();" type="text"
							id="itemNameId" readonly="readonly" name="itemType.item.name"
							class="itemname" />


						<input type="hidden" name="sitemid" id="itemIdId" />
						<input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=0','selectItem',800, 600, 1);return false" />
					</td>
				</tr>
				<tr>
					<td height=14 noWrap>
						规格型号:
					</td>
					<td height=14 noWrap>
						<input type="text" name="itemType.name" class="itemname checkEmptyShowInfo"
							id="itemTypename">
					</td>
				</tr>
				<tr>
					<td height=14 noWrap>
						材料代码:
					</td>
					<td height=14 noWrap>
						<input type="text" name="itemType.mCode" class="itemname checkEmptyShowInfo" id="itemTypemCode">
					</td>
				</tr>
				<tr>
					<td height=14 noWrap>
						是否保税:
					</td>
					<td height=14 noWrap>
						<SELECT name="itemType.isbonded">
							<option value="0">
								否
							</option>
							<option value="1">
								是
							</option>
						</SELECT>
					</td>
				</tr>
				<tr>
					<td height=14 noWrap>
						保税号:
					</td>
					<td height=14 noWrap>
						<input type="text" name="itemType.bondedNo" class="need_hide checkEmptyShowInfo"
							id="itemTypebondedNo">
					</td>
				</tr>
				<tr>
					<td height=14 noWrap>
						物料描述:
					</td>
					<td height=14 noWrap>
						<input type="text" name="itemType.description" class="itemname">
						<span id="checkitemTypedescription"
							style="color: #FF0000; font-size: 12px;"></span>
					</td>
				</tr>
				<tr>
					<td height=14 noWrap>
						备注:
					</td>
					<td height=14 noWrap>
						<input type="text" name="itemType.notes" class="itemname">
					</td>
				</tr>


			</table>
			<table class="title">
				<tr>
					<td>
						部件关系
					</td>
				</tr>
			</table>
			<table class="list">
				<tr>
					<th>
						部品名
					</th>
					<th>
						型号规格
					</th>
					<th class="isCon">
						是否控制器
					</th>
					<th class="controllerunit">
						接口信息
					</th>
					<th>
						部件数量
					</th>
					<th>
						添加
					</th>
					<th>
						删除
					</th>
				</tr>
				<!---------------------------LOOP START------------------------------>
				<!-- 列表数据栏 -->


				<tr id="rowTemplete_0">
					<td>
						<input type='text' size="10" id='itemNameId_0' disabled='disabled'>
					</td>
					<td>
						<input size="15" type='text' class="checkEmpty" id='itemTypeNameId_0' disabled='disabled'>
						<input type='hidden' name='partids' id='itemTypeIdId_0'>
						<input id='item_0' type='button' value='选择' class='frm_btn'
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false">
					</td>
					<td>
						<select name="isCons" onchange="conChange(this,[0]);">
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
					</td>
					<td class="controllerunit_0">
						<SELECT name="controllerunits">
							<option value="parallelport">
								并口
							</option>
							<option value="parportU">
								并+U
							</option>
							<option value="serialoparport">
								并口|串口
							</option>
							<option value="serialaparport">
								并口+串口
							</option>
							<option value="parportethpot">
								并口+网口
							</option>
							<option value="ip090k">
								IP090K（并口）
							</option>
							<option value="ip690k">
								IP690K（并口）
							</option>
						</SELECT>
					</td>
					<td>
						<input type='text' size=5 name='amounts' class="checkEmpty itemname checkNum" value='1' />
					</td>
					<td>
						<img class="copyRowBtn" src="<%=basePath%>images/add.png"
							onclick="addBatchRow(this);isDYJ();" />
					</td>
					<td>
						<img src="<%=basePath%>images/del.png"
							onclick="deleteBatchRow(this);isDYJ();" />
					</td>
				</tr>
			</table>
			<table class="btn" style="width: 100%">
				<tr>
					<td>
						<input type="submit" class="frm_btn" value="提交" id="SYS_SET">
					</td>
				</tr>
			</table>

		</form>

		<script type="text/javascript">
     	$(document).ready(function() {
            //隐藏模板tr
            $(".no_hide").hide();
            /*$(".copyRowBtn").click(function(){
                alert("hello");
            	isDYJ();
            });*/
        })
   		 </script>

		<script type="text/javascript">
   
        	function   hidslt()   {   
			
        		$(".no_hide").toggle("slow");   
			}
			function isDYJ(){
				var item = $("#itemNameId");
				if(item.val()!="打印机")
				{
					$("select[name='isCons']").parent("td").hide();
					$("select[name='controllerunits']").parent("td").hide();
					$(".controllerunit").hide();
					$(".isCon").hide();
				}else{
					$("select[name='isCons']").parent("td").show();
					$("select[name='controllerunits']").parent("td").show();
					$(".controllerunit").show();
					$(".isCon").show();
					$($("select[name='isCons']").children("option")[0]).attr("selected","selected");
				}
			}
			function conChange(select,index){
				var s = $(select);
				if(s.val()==1)
				{
					$($($(".controllerunit_"+index).children("SELECT")).slideDown("800").children("option")[0]).attr("selected","selected");
				}
				else
				{
					$($(".controllerunit_"+index).children("SELECT")).slideUp("800");
				}
			}
			
  </script>
		<script type=text/javascript>
          $(document).ready(registerPre);
	</script>
	</body>
</html>