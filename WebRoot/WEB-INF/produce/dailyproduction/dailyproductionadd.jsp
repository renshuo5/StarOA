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
				     <select name="dailyproductionform.department.id">
              <option>请选择</option>
              <c:forEach items="${departments}" var="dpt">
                <option value="${dpt.id}"> ${dpt.dptName} </option>
              </c:forEach>
            </select>
				    日期:
<input id="d244_0" type="text" class="Wdate" onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2_0',skin:'whyGreen'})"/>
                   <input type="hidden" id="d244_2_0" name="dailyproductionform.date"/>  <br>
	  </label></td>
			</tr>
	<table class="addTable">
				<tr>
					<th rowspan="2">型号规格</th>
					<th colspan="3">投料</th>
					<th colspan="2">计划</th>
					<th colspan="3">进仓</th>
                  <th  rowspan="2">当日直通率</th>
                  <th rowspan="2">增加</th>
                  <th  rowspan="2">删除</th>
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
						<tr id="rowTemplete_0">
							<td height="37">
							<input type="text" name="itemTypeNames" id="itemTypeNameId_0" disabled="disabled" size="13"/>
          <input type="button" value="选择" class="frm_btn"
							onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',900, 600);return false">
          	<input type="hidden" name="itemTypeIds" id="itemTypeIdId_0"/>  
							
						    </td>
						  <td>
						    <input type="text"  onchange="changeNum(this,[0])" id="feedDailysId_0" name="feedDailys" onchange="changeNum(this,this.value)" size="8">
				       </td>
							<td ><input type="text" id="feedMonthsId_0" name="feedMonths" readonly="readonly" ></td>
							<td ><input type="text" id="feedYearsId_0" name="feedYears" readonly="readonly" size="8" ></td>
							<td ><input type="text" id="planDailysId_0" onchange="changeNum(this,[0])" name="planDailys"  size="8" ></td>
							<td><input type="text" id="planCompletesId_0" name="planCompletes" readonly="readonly"  size="8" value="0"></td>
							<td><input type="text" id="storeDailysId_0" onchange="changeNum(this,[0])" name="storeDailys" size="8"></td>
							<td><input type="text" id="storeMonthsId_0" name="storeMonths" readonly="readonly" size="8" ></td>
							<td><input type="text" id="storeYearsId_0" name="storeYears" readonly="readonly" size="8"></td>
                            <td><input type="text" id="rateDailysId_0" name="rateDailys" size="8"></td>
                     <td align="center"><img src="<%=basePath%>images/add.png" onClick="return addBatchRow(this)" /></td>
        <td align="center">
              <img src="<%=basePath%>images/del.png" onClick="return deleteBatchRow(this)" />     </td>
						</tr>
				
				
	</table>
	
	  </table>
    <table class="addTable" >
	    <tr>
	      <td width="1010" align="center"><div align="center">
	        <input type="submit" value=" 提 交 " class="frm_btn">
          </div></td>
        </tr>
    </table>
    </div>
    </form>
    <script type="text/javascript">
    
	function changeNum(param,index){
		var	elemtid=$(param).attr("id");
		var feedDaliysId="feedDailysId_"+index;
		var storeDailysId="storeDailysId_"+index;
		var planDailysId="planDailysId_"+index;
		var itemTypeIdsId="itemTypeIdId_"+index;
		var item_id=$("#"+itemTypeIdsId).attr("value");
	//	alert(item_id);
		
	var currentNum = param.value;
	params = {"item_id":item_id,"daily_num":currentNum};
	
	
	if(elemtid==feedDaliysId){
		
		$.ajax( {
			type : "POST",
			url : "produce/dailyproductionajax/dailyproduction_getprodct",
			data : params,
			dataType:"JSON",
			//async: false,
			success : function(data){
				data = eval("(" + data + ")");
			var	mresult = data.mresult;
			var yresult=data.yresult;
				
				 $("#feedMonthsId_"+index).val(mresult);
				 $("#feedYearsId_"+index).val(yresult);
			}
		});
		
		
		
		
	//alert(elemtid);
	}else if(elemtid==storeDailysId){
		$.ajax( {
			type : "POST",
			url : "produce/dailyproductionajax/dailyproduction_getprodctstore",
			data : params,
			dataType:"JSON",
			//async: false,
			success : function(data){
				data = eval("(" + data + ")");
			var	mresult = data.mresult;
			var yresult=data.yresult;
				
				 $("#storeMonthsId_"+index).val(mresult);
				 $("#storeYearsId_"+index).val(yresult);
			}
		});
		var planNum=$("#"+planDailysId).attr("value");
		//alert(planNum);
		//取进仓数 
		var storeNum=param.value;
	var compNum=storeNum/planNum;
	//alert(compNum);
	$("#planCompletesId_"+index).val(compNum);
//alert(param.value);
		}else if(elemtid==planDailysId){
			//alert(elemtid);	
			//计划数
			var planNum=param.value;
			//alert(planNum);
			//取进仓数 
			var storeNum=$("#"+storeDailysId).attr("value");
		var compNum=storeNum/planNum;
		
		$("#planCompletesId_"+index).val(compNum);
			
		}
	
		
		
			
		
			
		}
</script>
    </body>
</html>
