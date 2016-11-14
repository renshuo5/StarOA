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
<title>工艺部审核</title>
<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css"/>
		<script type="text/javascript" src="<%=basePath %>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath %>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/addTableAlign.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/autoAddRow.js"></script>
		<script type="text/javascript" src="<%=basePath %>My97DatePicker/WdatePicker.js"></script>
</head>

<body>
        <form action="<%=basePath %>produce/discardverify/discardverify_sAdd" method="post"> 
		<input type="hidden" name="scrId" id="itemTypeIdId_9" value="${discardverify.scr_id}"/>
<table class="title">
	<tr  >
    		<td >报废申请单</td>
        </tr>
        </table> 
	<table class="addTable"> 
        <tr>
        	<td>申请日期:
        	</td>
        	<td>
						<input name="discardverify.rdate" type="text" disabled="disabled" id="d244_2" value="${discardverify.rdate}" readonly="readonly"/>
</td>
        </tr>
        <tr>
        	<td>机型：</td>
        	<td>
        	<input type='text' disabled='disabled' id='itemTypeNameId_3' value="${discardverify.itemType.name}" readonly="readonly"/>
					
			  <input type='hidden' name='partid' id='itemTypeIdId_0' value="${discardverify.itemType.id}"/>
					
   	    </td>
   	    </tr>
   	    <tr>
            <td>出废单位：</td>
            <td><input type="hidden" name="departmentId" value="${discardverify.fdpt.id}" />
              <input type='text' disabled='disabled' id='itemTypeNameId_0' value="${discardverify.fdpt.dptName}" readonly="readonly"/>
       </td>
       </tr>
       <tr>
            <td>车间负责：</td>
            <td>
            <input type="text" disabled="disabled" id="employeeNameId_0" value="${discardverify.emp_id.empName}" readonly="readonly" align="left" />
           <input type="hidden" id="employeeIdId_0" name="employeeId1" value="${discardverify.emp_id.empId}"/> 
          </td>
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
                
                	<td  >
                	<input type="hidden" name="itemTypeId" value="${discardproduction.ite_id.id}"/>
                	<input type="text" disabled="disabled" value="${discardproduction.ite_id.mCode}" readonly="readonly" /> 
                	</td>
                    <td>
                	<input type="text" disabled="disabled" value="${discardproduction.ite_id.name}" readonly="readonly" />
                    </td>
                <td  >
                <input name="discardproduction.number" type="text" disabled="disabled" readonly="readonly" value="${discardproduction.number}"/></td>
                    <td  ><input name="discardproduction.reason" type="text" disabled="disabled" readonly="readonly" value="${discardproduction.reason}" /></td>
                  <td  ><input name="discardproduction.losetime" type="text" disabled="disabled" readonly="readonly" value="${discardproduction.losetime}" /></td>
                    <td  ><input name="discardproduction.losemoney" type="text" disabled="disabled" readonly="readonly" value="${discardproduction.losemoney}"/></td>
                    
                </tr>
        	</table>
        <table>
            <tr>
       	    <td>  
       	    <p align="left">品工部意见：
                </p>               
          <textarea id="content" readonly="readonly" name="discardreviewf.advice" cols="120" rows="10" value="${discardreviewf.advice}"> 
          </textarea>
                <p align="right">
                主管：<u>${discardreviewf.manager.empName}  </u>日期：
                <input name="discardreviewf.date" type="text" disabled="disabled" id="d244_2" value="${discardreviewf.date}" readonly="readonly"/>
    <input type="hidden" id="d244_2_0" name=""/></p>
                
              </td>
      </tr>
      </table>
      <table>
            <tr>
       	    <td colspan="3" align="center">
                <p align="left">工艺意见：</p>
                <textarea name="discardreviews.advice" cols="120" rows="10" class="checkEmptyShowInfo"></textarea><br />
                <p align="right">
                                            主管：<u><c:out value="${rperString.employee.empName}"/> 
                <input type="hidden" name="employeeId3" value="${rperString.employee.empId}"/> 
                    </u>日期：
                    <input id="d241212" type="text" class="Wdate"
							onfocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d241212_4',skin:'whyGreen'})" />
						<input type="hidden" id="d241212_4" name="discardreviews.date" /></p>
                                  是否领导审核：是：<input type="radio" name="discardreviews.flag" value="1"/>
                                          
              </td>
            </tr>
            </table>
            <table>
<tr>
<td> 
<input type="submit" value="提交" class="frm_btn"/>
</td>
</tr>
</table>
    </form>
</body>
</html>
