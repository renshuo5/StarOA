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
<html>
	<head>
		<base href="<%=basePath%>">
		<title>编辑部品型号</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script language="javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/item.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		
		<script type="text/javascript" src="<%=basePath%>js/oddEvenColor.js"></script>
		<SCRIPT type="text/javascript" src="<%=basePath%>js/highLight.js"></SCRIPT>

	
	</head>

	<body>
		<form action="item/itemtype/itemtype_update" method="post">
		<input type="hidden" class="kongzhi" value="${itemType.isCon }"/>
		<input type="hidden" class="baosui" value="${itemType.isbonded }"/>
			<%--查询--%>
			<table class="title editTable"><tr><td>编辑部品型号</td></tr></table>
			<table class="addTable">
				<TR>
					<TD height=14 noWrap>
						部品名:
					</TD>
					<TD height=14 noWrap>
						<input onchange="isDYJ();" type="text" id="itemNameId" disabled="disabled"
							name="itemType.item.name" value="${itemType.item.name }">
						<input type="hidden" name="sitemid" id="itemIdId"
							value="${itemType.item.id}">
						<input type="hidden" name="itemType.id" value="${itemType.id }" />
					</TD>
				</TR>
				<TR>
					<TD height=14 noWrap>
						规格型号:
					</TD>
					<TD height=14 noWrap>
						<input disabled="disabled" type="text" value="${itemType.name }" name="itemType.name"
							id="itemTypename" class="itemname">
						<span id="checkitemTypename"
							style="color: #FF0000; font-size: 12px;"></span>
					</TD>
				</TR>
				<TR>
					<TD height=14 noWrap>
						材料代码:
					</TD>
					<TD height=14 noWrap>
						<input disabled="disabled" type="text" name="itemType.mCode"
							value="${itemType.mCode }" id="itemTypemCode" class="itemname">
						<span id="checkitemTypemCode"
							style="color: #FF0000; font-size: 12px;"></span>
					</TD>
				</TR>
				<TR>
					<TD height=14 noWrap>
						是否保税:
					</TD>
					<TD height=14 noWrap>
						<input type="hidden" id="isBonded" name="itemType.isbonded" value="${itemType.isbonded }"/>
						<input type="text" disabled="disabled"/>
					</TD>
				</TR>
				<TR>
					<TD height=14 noWrap>
						保税号:
					</TD>
					<TD height=14 noWrap>
						<input type="text" name="itemType.bondedNo"
							value="${itemType.bondedNo }" disabled="disabled" class="need_hide"
							id="itemTypebondedNo">
					</TD>
				</TR>
				<TR>
					<TD height=14 noWrap>
						物料描述:
					</TD>
					<TD height=14 noWrap>
						<input disabled="disabled" type="text" name="itemType.description"
							value="${itemType.description }" class="itemname">
					</TD>
				</TR>
				<TR>
					<TD height=14 noWrap>
						备注:
					</TD>
					<TD height=14 noWrap>
						<input disabled="disabled" type="text" name="itemType.notes"
							value="${itemType.notes }" class="itemname">
					</TD>
				</TR>
			</table>
			<table class="title">
				<tr>
					<td>
						部件关系
					</td>
				</tr>
			</table>
			<table id="tb" class="list">
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
				</tr>
				<!---------------------------LOOP START------------------------------>
				<!-- 列表数据栏 -->

				<!-- 模板（开始）用于当作复制行的模板 -->
				<tr id="rowTemplete_0">
					<td>
						<input type='text' id='itemNameId_0' disabled='disabled'>
					</td>
					<td>
						<input type='text' id='itemTypeNameId_0' disabled='disabled'>
						<input type='hidden' name='partids' id='itemTypeIdId_0'>
						<input id='item_0' type='button' value='选择' class='frm_btn'
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false">
					</td>
					<td class="isCon_0">
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
						<input type='text' size=5 name='amounts' value='0'
							class="itemname" />
					</td>
				</tr>
				<!-- 模板（结束） -->
						<c:forEach items="${itemRelations}" var="i" varStatus="vs">
							<tr>
								<td>
									<input type='text' id='itemNameId${vs.index }'
										disabled='disabled'
										value="<c:out value='${i.part.item.name}'></c:out>">
								</td>
								<td>
									<input type='text' id='itemTypeNameId${vs.index }'
										disabled='disabled'
										value="<c:out value='${i.part.name}'></c:out>">
									<input type='hidden' name='partids'
										id='itemTypeIdId${vs.index }'
										value="<c:out value='${i.part.id}'></c:out>">
								</td>
								<td class="isCon${vs.index }">
						<select name="isCons" disabled="disabled" onchange="conChange(this,${vs.index });">
							<option value="1">是</option>
							<option value="0">否</option>
						</select>
						<input type="hidden" name="isCons0" value="${i.isCon }"/>
					</td>
					<td class="controllerunit${vs.index }">
						<SELECT name="controllerunits" disabled="disabled">
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
						<input type="hidden" name="controllerunits0" value="${i.controllerunitInfo }"/>
					</td>
								<td>
									<input type='text' size=5 name='amounts'
									 disabled="disabled" value='<c:out value='${i.partamount }'></c:out>' />
								</td>
							</tr>
						</c:forEach>

			</table>
			<table class="btn" style="width:100%">
				<tr>
					<td>

						<input type="button" onclick="window.close();" class="frm_btn" value="关闭窗口"/>
					</td>
				</tr>
			</table>
		</form>
		<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
        <script type="text/javascript">
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
        	var element = $(select);
      	  	var line = element.attr("id").indexOf("_")>=0?"_":"";
      	    var s = $(select);
      	    if(s.val()==1)
			{
				$($($(".controllerunit"+line+index).children("SELECT")).slideDown("800").children("option")[0]).attr("selected","selected");
			}
			else
			{
				$($(".controllerunit"+line+index).children("SELECT")).slideUp("800");
			}
        }
     	$(document).ready(function() {
         	isDYJ();
         	//页面上的是否控制器
         	var isCons = $("select[name='isCons']");
         	//隐藏的是否控制器
         	var isCons0 = $("input[name='isCons0']");
         	//页面上的控制器
         	var controllerunitInfos = $("select[name='controllerunits']");
         	//隐藏的控制器
         	var controllerunitInfos0 = $("input[name='controllerunits0']");
         	for(var i=1;i<isCons.length;i++){
             	var isCon = $(isCons[i])
				var options = isCon.children("option");
				var isCon0 = $(isCons0[i-1]);
				var controllerunitInfo0 = $(controllerunitInfos0[i-1]);
				var controllerunitInfo = $(controllerunitInfos[i]);
				var conOptions = controllerunitInfo.children("option");
				if(isCon0.val()==0)
				{
					$(isCon.children("option")[1]).attr("selected","selected");
					$(controllerunitInfos[i]).hide();
				}
				else if(isCon0.val()==1)
				{
					for(var j=0;j<conOptions.length;j++)
					{
						var option = $(conOptions[j]);
//						alert("option.val() = "+option.val()+", controllerunitInfo0.val() = "+controllerunitInfo0.val());
						if(option.val()==controllerunitInfo0.val())
						{
							option.attr("selected","selected");
						}
					}
				}
            }
         	//是否保税
         	var isBonded = $("#isBonded");
         	var showBonded = isBonded.next("input");
         	if(isBonded.val()==1)
         	{
             	showBonded.val("是");
             	$("#itemTypebondedNo").show();
            }else{
            	showBonded.val("否");
             	$("#itemTypebondedNo").hide();
            }
            //隐藏模板tr
            if(!$("#Button1").attr("checked")){
            	$("#tab").hide();
            }
        })
    </script>
		<script type="text/javascript">   
        	function   hidslt()   {   
        		$("#tab").toggle("normal");   
			}
			
    </script>
        
	</body>
</html>