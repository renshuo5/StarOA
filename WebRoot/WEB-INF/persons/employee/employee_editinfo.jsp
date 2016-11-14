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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">

	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath%>js/jquery/jquery.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		 <script type="text/javascript" src="<%=basePath%>js/persons.js"></script>
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
			<script type="text/javascript" src="<%=basePath%>js/autoAddRow.js"></script>
		<script language="javascript" src="<%=basePath%>js/addTableAlign.js"></script>
		 <script type="text/javascript" src="<%=basePath%>js/uploadPreview.js"></script> 
      <script type="text/javascript"> 
        $(document).ready(function() { 
            //建议在#imgDiv的父元素上加个overflow:hidden;的css样式 
            $(".pic").uploadPreview({ width: 110, height: 130, imgDiv: "#imgDiv", imgType: ["bmp", "gif", "png", "jpg"] }); 
        }); 
    </script> 
		<title>人员信息</title>
	</head>

	<body>



		<form action="persons/employee/employee_update" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="employee.empId" value="${employee.empId}">
           
			<table class="title addTable">
				<tr>
					<td>
						人 员 信 息 表 格
					</td>
				</tr>
			</table>
			<table class="addTable">
				<tr>
					<td>
						员工号
					</td>
					<td>
						<input type="text" align="middle" border="0" name="employee.empSn"
							value="${employee.empSn}" class="checkEmptyShowInfo" id="employeeempSn"/>
<span  id="checkemployeeempSn" style="color: #FF0000; font-size: 12px;" ></span>
					</td>

					<td>
						员工性质
					</td>


					<td>
						<select name="employee.nature">
							<c:if test="${employee.nature==''}">
								<option selected="selected" value="">
									请选择
								</option>
							</c:if>
							<option
								<c:if test="${employee.nature=='正式' }">selected="selected"</c:if>
								value="正式">
								正式
							</option>

							<option
								<c:if test="${employee.nature=='正式招聘' }">selected="selected"</c:if>
								value="正式招聘">
								正式招聘
							</option>

							<option
								<c:if test="${employee.nature=='普通招聘'}">selected="selected"</c:if>
								value="普通招聘">
								普通招聘
							</option>

							<option
								<c:if test="${employee.nature=='普通工' }">selected="selected"</c:if>
								value="普通工">
								普通工
							</option>

							<option
								<c:if test="${employee.nature=='勤杂工'}">selected="selected"</c:if>
								value="勤杂工">
								勤杂工
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						姓名
					</td>
					<td style="text-align:left">
						<input type="text" align="middle" name="employee.empName"
							value="${employee.empName} " class="checkEmptyShowInfo" id="employeeempName"/>
							<span  id="checkemployeeempName" style="color: #FF0000; font-size: 12px;" ></span>
					</td>
					<td colspan="2" rowspan="7" style="text-align:center">
						<c:choose>
							<c:when test="${!empty employee.pic}">
								<img src="${employee.pic}" width="110" height="130" id="imgDiv"/>
								<input type="hidden" name="employee.pic" value="${employee.pic}">
							</c:when>
							<c:otherwise>
								<img src="<%=basePath%>images/persons.jpg" width="110"
									height="130" id="imgDiv"/>
							</c:otherwise>
						</c:choose>
						<br />
						<input type="file" name="uploadFile" class="pic">
					</td>
				</tr>
				<tr>
					<td>
						性别
					</td>
					<td>
						<select name="employee.sex" value="${employee.sex }">
							<c:if test="${employee.sex==''}">
								<option selected="selected" >
									请选择
								</option>
							</c:if>
							<option
								<c:if test="${employee.sex=='男' }">selected="selected"</c:if>
								value="男">
								男
							</option>
							<option
								<c:if test="${employee.sex=='女' }">selected="selected"</c:if>
								value="女">
								女
							</option>
                          </select>
                            
					</td>
				</tr>
				<tr>
					<td>
						出生年月
					</td>
					<td>

						<input id="d244" type="text" class="Wdate" value="${birString}"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" name="employee.birdate"
							value="${employee.birdate}" />

					</td>
				</tr>

				<tr>
					<td>
						政治面貌
					</td>
					<td>


						<select name="employee.political">
							<c:if test="${employee.political==null}">
								<option selected="selected" value="">
									请选择
								</option>
							</c:if>
							<option
								<c:if test="${employee.political=='群众' }">selected="selected"</c:if>
								value="群众">
								群众
							</option>
							<option
								<c:if test="${employee.political=='共青团员' }">selected="selected"</c:if>
								value="共青团员">
								共青团员
							</option>
							<option
								<c:if test="${employee.political=='中共党员' }">selected="selected"</c:if>
								value="中共党员">
								中共党员
							</option>



						</select>

						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						身份证
					</td>
					<td>
						<input input size="22" type="text" align="middle" border="0"
							name="employee.idCardNo" value="${employee.idCardNo }" class="itemname" id="employeeidCardNo" />
							<span  id="checkemployeeidCardNo" style="color: #FF0000; font-size: 12px;" ></span>
					</td>
				</tr>
				<tr>
					<td>
						婚姻情况
					</td>
					<td>
						<select name="employee.marStatus">

							<c:if test="${employee.marStatus==''}">
								<option selected="selected" value="">
									请选择
								</option>
							</c:if>

							<option
								<c:if test="${employee.marStatus=='未婚' }">selected="selected"</c:if>
								value="未婚">
								未婚
							</option>
							<option
								<c:if test="${employee.marStatus=='已婚' }">selected="selected"</c:if>
								value="已婚">
								已婚
							</option>

						</select>
					</td>
				</tr>

				<tr>
					<td>
						联系方式
					</td>
					<td>
						<input type="text" align="middle" value="${employee.phoneNo}"
							name="employee.phoneNo" class="employeephoneNo" id="employeephoneNo"/>
							
					</td>
				</tr>


				<tr>
					<td>
						宿舍号
					</td>
					<td>
						<input type="text" align="middle" value="${employee.dormitory}"
							name="employee.dormitory" />
					</td>
					<td>
						状态
					</td>
					<td>
						<select name="employee.status">

							<c:if test="${employee.status==''}">
								<option selected="selected" value="">
									请选择
								</option>
							</c:if>

							<option
								<c:if test="${employee.status=='在职' }">selected="selected"</c:if>
								value="在职">
								在职
							</option>
							<option
								<c:if test="${employee.status=='自离' }">selected="selected"</c:if>
								value="自离">
								自离
							</option>
							<option
								<c:if test="${employee.status=='内退' }">selected="selected"</c:if>
								value="内退">
								内退
							</option>
							<option
								<c:if test="${employee.status=='辞职' }">selected="selected"</c:if>
								value="辞职">
								辞职
							</option>

						</select>
					</td>
				</tr>
				<input type="hidden" name="departmentId" value="${departmentId}" />
				<tr>
					<td>
						所在部门
					</td>
					<td>

						<select id="dptName" name="dptName"
							onChange="departmentId.value=this.options[dptName.selectedIndex].value;">
							<option>
								<c:choose>
									<c:when test="${employee.department.id!=null}">
               	${employee.department.dptName}  
             
             </c:when>
									<c:otherwise>
                                 请选择
            
            </c:otherwise>

								</c:choose>
							</option>
							<c:forEach items="${departmentList}" var="dpt">
								<c:if test="${employee.department.id!=dpt.id}">
									<option value="${dpt.id}" name="${dpt.dptName}">
										${dpt.dptName}
									</option>

								</c:if>

							</c:forEach>

						</select>
					</td>
					<td>
						职位
					</td>
					<td>
						<input type="hidden" name="jobsId" value="${jobsId}" />
						<select id="jobsName" name="jobsName"
							onChange="jobsId.value=this.options[jobsName.selectedIndex].value;">
							<option>
								<c:choose>
									<c:when test="${employee.jobs.id!=null}">
               	${employee.jobs.jobsName}  
             
             </c:when>
									<c:otherwise>
                                 请选择
            
            </c:otherwise>

								</c:choose>
							</option>
							<c:forEach items="${jobsList}" var="jobs">
								<c:if test="${employee.jobs.id!=jobs.id}">
									<option value="${jobs.id}" name="${jobs.jobsName}">
										${jobs.jobsName}
									</option>


								</c:if>

							</c:forEach>

						</select>
					</td>
				</tr>

				<tr>
					<td>
						职称
					</td>
					<td>
						<input type="text" align="middle" border="0" name="employee.jobTitle" value="${employee.jobTitle}"/>
					</td>
					<td>
						文化程度
					</td>
					<td>
						<select name="employee.education">

							<c:if test="${employee.education==''}">
								<option selected="selected" value="">
									请选择
								</option>
							</c:if>
							<option
								<c:if test="${employee.education=='初中学历以下' }">selected="selected"</c:if>
								value="初中学历以下">
								初中学历以下
							</option>

							<option
								<c:if test="${employee.education=='初中毕业'}">selected="selected"</c:if>
								value="初中毕业">
								初中毕业
							</option>

							<option
								<c:if test="${employee.education=='高中毕业'}">selected="selected"</c:if>
								value="高中毕业">
								高中毕业
							</option>

							<option
								<c:if test="${employee.education=='中专' }">selected="selected"</c:if>
								value="中专">
								中专
							</option>

							<option
								<c:if test="${employee.education=='大专'}">selected="selected"</c:if>
								value="大专">
								大专
							</option>

							<option
								<c:if test="${employee.education=='本科'}">selected="selected"</c:if>
								value="本科">
								本科
							</option>

							<option
								<c:if test="${employee.education=='本科以上学历'}">selected="selected"</c:if>
								value="本科以上学历">
								本科以上学历
							</option>


						</select>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td>
						进入公司时间
					</td>
					<td>
						<input id="d244" type="text" class="Wdate" value="${eDateString}"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'2',skin:'whyGreen'})" />
						<input type="hidden" id="2" name="employee.eDate"
							value="${employee.eDate}" />

					</td>
					<td>
						离开公司时间
					</td>
					<td>
						<input id="d244" type="text" class="Wdate" value="${lDateString} "
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'3',skin:'whyGreen'})" />
						<input type="hidden" id="3" name="employee.lDate "
							value="${employee.lDate}" />


					</td>
				</tr>
				
			</table>
			<table class="title" style="width: 85%">
				<tr>
					<td>
						培训情况
					</td>
				</tr>
			</table>
			<table class="list" style="width: 85%">
						
                 <tr>
                      <th align="center">培训名称</th>
                      <th align="center">培训时间</th>      
                      <th align="center">添加</th>      
                      <th align="center">删除</th>      
                </tr>
                
                
             
               
                 <c:if test="${!empty lists}">
				<c:forEach items="${lists}" var="empTrain" varStatus="vs">
				<tr >
				
					<td align="center">
						<select name="traNames">
								<option <c:if test="${empTrain.traName==''}">selected="selected"</c:if> value="">
									请选择
								</option>
								<option <c:if test="${empTrain.traName=='新入司培训'}">selected="selected"</c:if> value="新入司培训">
									新入司培训
								</option>
								<option <c:if test="${empTrain.traName=='关键岗位培训'}">selected="selected"</c:if> value="关键岗位培训">
									关键岗位培训
								</option>
								<option <c:if test="${empTrain.traName=='干部培训'}">selected="selected"</c:if> value="干部培训">
									干部培训
								</option>
								<option <c:if test="${empTrain.traName=='班，组长培训'}">selected="selected"</c:if> value="班，组长培训">
									班，组长培训
								</option>
								<option <c:if test="${empTrain.traName=='体系培训'}">selected="selected"</c:if> value="体系培训">
									体系培训
								</option>
								<option <c:if test="${empTrain.traName=='安全培训'}">selected="selected"</c:if> value="安全培训">
									安全培训
								</option>
								</select>
								
					</td>
					<td align="center">
						<input size="18" id="d24429_${vs.index+1}" type="text" class="Wdate" value="<fmt:formatDate value="${empTrain.stDate}" pattern="yyyy-MM-dd" />"
								onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'2_${vs.index+1}',skin:'whyGreen'})" />
							<input type="hidden" id="2_${vs.index+1}" name="stDates" value="${empTrain.stDate}"/>
					</td>
					<td>
						<img src="<%=basePath %>images/add.png"
							onclick="addBatchRow(this)" />
					</td>
					<td>
						<img src="<%=basePath %>images/del.png"
							onclick="deleteBatchRow1(this,${vs.index+1})" />
					</td>
            
				</tr>
				
				
            </c:forEach>
			</c:if>
			
			
				<tr id="rowTemplete_0">
					<td align="center">
						<select name="traNames" class="selectone">
								<option value="">
									请选择
								</option>
								<option value="新入司培训">
									新入司培训
								</option>
								<option value="关键岗位培训">
									关键岗位培训
								</option>
								<option value="干部培训">
									干部培训
								</option>
								<option value="班，组长培训">
									班，组长培训
								</option>
								<option value="体系培训">
									体系培训
								</option>
								<option value="安全培训">
									安全培训
								</option>
								</select>
								
					</td>
					<td align="center">
						<input size="18" id="d24429_0" type="text" class="Wdate checkDate_peixun"
								onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'3_0',skin:'whyGreen'})" />
							<input type="hidden" id="3_0" name="stDates" />
					</td>
					<td>
						<img src="<%=basePath %>images/add.png"
							onclick="addBatchRow(this)" />
					</td>
					<td>
						<img src="<%=basePath %>images/del.png"
							onclick="deleteBatchRow2(this)" />
					</td>

				</tr>
			
			</table>
			<table class="btn">
				<tr>
					<td>
						<input type="submit" value="修改" class="frm_btn" id="SYS_SET"/>
					</td>
				</tr>
			</table>
		</form>
		<%--<SCRIPT type=text/javascript>
            $(document).ready(registerPre);
        </SCRIPT>
		
	--%></body>
</html>
