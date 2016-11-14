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
		<link rel="stylesheet" href="css/box_onfocus.css" type="text/css">
		<script language="javascript" src="<%=basePath%>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/persons.js"></script>
		
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
		<form action="persons/employee/employee_add" method="post"
			enctype="multipart/form-data">
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
						员工号:
					</td>
					<td>
						<input type="text" align="middle" border="0" name="employee.empSn"
							class="checkEmptyShowInfo"  />
						<font color="#FF0000">*</font>
						
					</td>

					<td>
						员工性质:
					</td>
					<td>
						<select name="employee.nature" id="employeenature" class="selectone">
							<option value="choose">
								请选择
							</option>
							<option value="正式">
								正式
							</option>
							<option value="正式招聘">
								正式招聘
							</option>
							<option value="普通招聘">
								普通招聘
							</option>
							<option value="普通工">
								普通工
							</option>
							<option value="勤杂工">
								勤杂工
							</option>
						</select>
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						姓名:
					</td>
					<td style="text-align:left">
						<input type="text" align="middle" name="employee.empName"
							class="checkEmptyShowInfo"  />
						<font color="#FF0000">*</font>
						
					</td>
					<td colspan="2" rowspan="7" style="text-align:center">
						<img src="<%=basePath%>images/persons.jpg" width="110"
							height="130" id="imgDiv"/><br/>
						<input type="file" name="uploadFile" class="pic">
					</td>
				</tr>
				<tr>
					<td>
						性别:
					</td>
					<td>
						<select name="employee.sex" id="employeesex" class="selectone">
							<option value="choose">
								请选择
							</option>
							<option value="男">
								男
							</option>
							<option value="女">
								女
							</option>
						</select>
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td>
						出生年月:
					</td>
					<td>
						<input size="18" id="d244" type="text" class="Wdate"
							onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'d244_2',skin:'whyGreen'})" />
						<input type="hidden" id="d244_2" name="employee.birdate" class="checkDateInfo"/>
						<font color="#FF0000">*</font>
					</td>
				</tr>

				<tr>
					<td>
						政治面貌:
					</td>
					<td>
						<select name="employee.political">
							<option value="群众">
								群众
							</option>
							<option value="共青团员">
								共青团员
							</option>
							<option value="中共党员">
								中共党员
							</option>

						</select>


					</td>
				</tr>
				<tr>
					<td>
						身份证:
					</td>
					<td>
						<input size="22" type="text" align="middle" border="0"
							name="employee.idCardNo" class="persons" id="employeeidCardNo" />
						<font color="#FF0000">*</font>
						<span id="checkemployeeidCardNo"
							style="color: #FF0000; font-size: 12px;"></span>
					</td>
				</tr>
				<tr>
					<td>
						婚姻情况:
					</td>
					<td>
						<select name="employee.marStatus">
							<option value="">
								请选择
							</option>
							<option value="未婚">
								未婚
							</option>
							<option value="已婚">
								已婚
							</option>
						</select>
					</td>
				</tr>

				<tr>
					<td>
						联系方式:
					</td>
					<td>
						<input type="text" align="middle" name="employee.phoneNo"
							 id="employeephoneNo" class="employeephoneNo"/>
						<font color="#FF0000">*</font>
						
					</td>
				</tr>


				<tr>
					<td>
						宿舍号:
					</td>
					<td>
						<input type="text" align="right" name="employee.dormitory"
							class="itemname" />
						&nbsp;&nbsp;&nbsp;&nbsp;
					</td>
					
					<td>
						状态
					</td>
					<td>
						<select name="employee.status" id="employeestatus" class="selectone">
							<option value="choose">
								请选择
							</option>
							<option value="在职">
								在职
							</option>
							<option value="自离">
								自离
							</option>
							<option value="内退">
								内退
							</option>
							<option value="辞职">
								辞职
							</option>
						</select>
						<font color="#FF0000">*</font>
					</td>
				</tr>
				<input type="hidden" name="departmentId" value="${departmentId}" />
				<tr>
					<td>
						所在部门:
					</td>
					<td>
						<select id="dptName" name="dptName"
							onChange="departmentId.value=this.options[dptName.selectedIndex].value;" class="selectone">
							<option value="choose" class="">
								请选择
							</option>
							<c:forEach items="${departmentList}" var="dpt">
								<option value="${dpt.id}" name="${dpt.dptName}">
									${dpt.dptName}
								</option>
							</c:forEach>
						</select>
						<font color="#FF0000">*</font>

					</td>
					<td>
						职位:
					</td>
					<td>
						<input type="hidden" name="jobsId" value="${jobsId}" />

						<select id="jobsName" name="jobsName"
							onChange="jobsId.value=this.options[jobsName.selectedIndex].value;" class="selectone">
							<option value="choose">
								请选择
							</option>
							<c:forEach items="${jobsList}" var="jobs">
								<option value="${jobs.id}" name="${jobs.jobsName}">
									${jobs.jobsName}
								</option>
							</c:forEach>

						</select>
						<font color="#FF0000">*</font>

					</td>
				</tr>

				<tr>
					<div colspan="50%">
						<td>
							职称:
						</td>
						<td>
							<input type="text" align="middle" border="0" name="employee.jobTitle"
								class="itemname" />
						</td>
					</div>
					<div colspan="50%">
						<td>
							文化程度:
						</td>
						<td>
							<select name="employee.education">
								<option value="">
									请选择
								</option>
								<option value="初中学历以下">
									初中学历以下
								</option>
								<option value="初中毕业">
									初中毕业
								</option>
								<option value="高中毕业">
									高中毕业
								</option>
								<option value="中专">
									中专
								</option>
								<option value="大专">
									大专
								</option>
								<option value="本科">
									本科
								</option>
								<option value="本科以上学历">
									本科以上学历
								</option>



							</select>
							&nbsp;
						</td>
					</div>
				</tr>
				<tr>
					<div colspan="50%">
						<td>
							进入公司时间:
						</td>
						<td>

							<input size="18" id="d2441" type="text" class="Wdate"
								onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'startDate',skin:'whyGreen'})" />
							<input type="hidden" id="startDate" name="employee.eDate" class="checkDateInfo"/>

							<font color="#FF0000">*</font>
						</td>
					</div>
					<div colspan="50%">
						<td>
							离开公司时间:
						</td>
						<td>
							<input size="18"  type="text" class="Wdate"
								onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'endDate',skin:'whyGreen'})" />
							<input type="hidden"  id="endDate" name="employee.lDate" />
						</td>
					</div>
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
								onFocus="WdatePicker({dateFmt:'yyyy年M月d日',vel:'2_0',skin:'whyGreen'})" />
							<input type="hidden" id="2_0" name="stDates" class="Wdate "/>
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
			<table class="btn">
				<tr>
					<td>
						<input type="submit" value="提交" class="frm_btn" id="SYS_SET" />
					</td>
				</tr>
			</table>

		</form>
	</body>
</html>
