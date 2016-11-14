<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<%String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>报废申请单</title>
<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css"/>
<link rel="stylesheet" href="css/box_onfocus.css" type="text/css"/>
    <script language="javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
     <script type="text/javascript" src="<%=basePath%>js/produce.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/textRightLeft.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/autoAddRow.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/addTableAlign.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/oddEvenColor.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/highLight.js"></script>
    <script type="text/javascript" src="<%=basePath %>My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=basePath %>js/examine.js"></script>   
    <script type="text/javascript" src="<%=basePath %>js/examineOnly.js"></script>   
</head>

<body>
<form action="<%=basePath %>produce/discardverify/discardverify_add" method="post"> 
<table class="title">
	<tr>
    		<td >报废申请单</td>
        </tr>
        </table>
        
		<table class="addTable">
        	<tr>
        		<td>申请日期:
        		</td>
        		<td>
      					<input id="d244" type="text" class="Wdate"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" name="discardverify.rdate" />
    			</td>
            
            
       		</tr>
        <tr>
        	<td>机型：
        	</td>
        	<td>
        	<input type='text' id='itemTypeNameId_0' value="" disabled='disabled'/>
					
					<input type='hidden' name='partid' id='itemTypeIdId_0'/>
					<input id='item_0' type='button' value='选择' class='frm_btn' onclick="openWin('<%=basePath%>item/item/item_selectInput?isSelectItemType=1&partnumber=0','selectItem',800, 600, 1);return false" />
        	</td>
        	</tr>
        	<tr>
            <td>出废单位：
            </td>
            <td><input type="hidden" name="departmentId" value="${departmentId}" />
            	<select id="dptName"   class="selectone" name="dptName"
							onchange="departmentId.value=this.options[dptName.selectedIndex].value;">
							<option>
								请选择
							</option>
							<c:forEach items="${fdpts}" var="dpt">
								<option value="${dpt.id}" name="${dpt.dptName}" >
									${dpt.dptName}
								</option>
							</c:forEach>

			</select>
       </td>
       </tr>
       <tr>
            <td>车间负责人：</td>
            <td><input id="employeeNameId_0" type="text" disabled="disabled" value="" align="left" />
           <input type="hidden" id="employeeIdId_0" name="employeeId"/> 
            <input type="button" value="选择" class="frm_btn" onclick="openWin('<%=basePath%>persons/employee/employee_selectInput?paname=0','人员选择',800, 600, 1);return false"/>     </td>
           
        </tr>
        </table>
        
        <table class="title">
	<tr  >
    		<td >报废申请单</td>
        </tr>
        </table>
        	<table class="addTable">
        	
            	<tr>
                    <th>废品名称</th>
                    <th>图号或型号</th>
                    
                    <th >数  量</th>
                    <th >报  废  原  因</th>
                    <th >损失工时</th>
                    <th>损失材料（元）</th>
                   
                </tr>
                <tr id="rowTemplete_0">
                
                	<td align="center" >
                	<input type="hidden" name="itemTypeId" value="${itemType.id}"/>
                	<input type="text" size="15" disabled="disabled" name="itemType.mCode" value="${itemType.mCode}" /> 
                	</td>
                    <td >
                    
                    <input type="text" size="12" disabled="disabled" name="itemType.name" value="${itemType.name}" />
                   </td>
                   
                    <td align="center" ><input  type="text" size="10" name="discardproduction.number" class="checkEmpty checkNum" id="discardproductionnumber"/><span  id="checkdiscardproductionnumber" style="color: #FF0000; font-size: 12px;" ></span>
                    
                    
                    </td>
                    <td align="center" ><input type="text" size="12" name="discardproduction.reason"  class="checkEmpty" id="discardproductionreason"/><span  id="checkdiscardproductionreason" style="color: #FF0000; font-size: 12px;" ></span></td>
                  <td align="center" ><input type="text" size="15" name="discardproduction.losetime"  class="checkEmpty" id="discardproductionlosetime"/><span  id="checkdiscardproductionlosetime" style="color: #FF0000; font-size: 12px;" ></span></td>
                    <td align="center" ><input type="text" size="15" name="discardproduction.losemoney" class="checkEmpty checkNum" id="discardproductionlosemoney"/><span  id="checkdiscardproductionlosemoney" style="color: #FF0000; font-size: 12px;" ></span></td>
                    
                </tr>
        	</table>
        	
  <table>  
<tr>
<td > 
<input type="submit" value="提交"  class="frm_btn"/>
</td>
</tr>
</table>   
    </form>
    <SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
</body>
</html>
