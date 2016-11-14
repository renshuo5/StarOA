<%@ page contentType="text/html;charset=UTF-8"%>
<%@page import="com.fjsdfx.starerp.security.model.User"%>
<%@page import="org.springframework.security.context.SecurityContext"%>
<%@page import="org.springframework.security.context.SecurityContextHolder"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%String path = request.getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
					User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
					%>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>缺料登记</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=basePath%>css/vip.css" type="text/css">
		<script type="text/javascript" src="<%=basePath %>js/jquery/jquery.js"></script>
		<script language="javascript" src="<%=basePath %>js/public.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/autoAddRow.js"></script>
		<script type="text/javascript"
			src="<%=basePath %>My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
		<table class="addTable">
				<tr>
					<th colspan="9" align="center" background="images/title_bg2.jpg">
						缺 料 报 告 单
					</th>
					<tr>

						<td colspan="1">
							缺料编号：${shortm.shoid}
						</td>
						<td colspan="2">
							时间：${shortm.sdate}
						</td>
						<td colspan="2">
							申请单位： ${shortm.department1.dptName }
						</td>
						<td colspan="2">
							车间主任： ${ shortm.employee1.empName}
						</td>
						<td colspan="2" align="center">
							申请人： ${shortm.employee2.empName}
						</td>
					</tr>
				</tr>

				<tr>

					<th width="13%" align="center">
						材料名称
					</th>
					<th width="13%" align="center">
						型号 规格
					</th>
					<th width="10%" align="center">
						单位
					</th>
					<th width="10%" align="center">
						数量
					</th>
					<th width="16%" align="center">
						用途
					</th>
					<th width="10%" align="center">
						单价
					</th>
					<th width="10%" align="center">
						金额
					</th>
					<th align="center" width="10%">
						备注
					</th>
				</tr>
				<!---------------------------LOOP START------------------------------>
				<c:if test="${!empty pm.datas}">
					<c:forEach items="${pm.datas}" var="shogood">
						<tr id="rowTemplete_0">

							<td align="center">
								${shogood.itemType.item.name }
							</td>
							<td align="center">
								${shogood.itemType.name }
							</td>
							<td align="center">
								${shogood.unit }
							</td>
							<td align="center">
								${shogood.num}
							</td>
							<td align="center">
								${shogood.userf}
							</td>
							<td align="center">
								${shogood.uprice}
							</td>
							<td align="center">
								${shogood.price}
							</td>
							<td align="center">
								${shogood.note}
							</td>

						</tr>
					</c:forEach>
				</c:if>
				<!----------------------LOOP END------------------------------->
				<!-- 在列表数据为空的时候，要显示的提示信息 -->
				<c:if test="${empty pm.datas}">
					<tr>
						<td colspan="8" align="center" bgcolor="#EFF3F7"
							onmouseover="this.bgColor= '#DEE7FF'"
							onmouseout="this.bgColor='#EFF3F7'"
							background="images/title_bg2.jpg">
							没有找到相应的记录
						</td>
					</tr>
				</c:if></table>

		<form action="produce/shortm/shortm_check_approve?shortmID=${shortm.id}" method="post">
		<table>
			<tr>
  <input type="hidden" name="step" value="${step}"/>
				<c:choose>
					<c:when test="${step==1&&(shortm.sho_check==''||shortm.sho_check==null)}">
						<td align="center" colspan="3">
							审核：
							<input type="text" name="shocheck" readonly="readonly" value="<%=user.getEmployee().getEmpName() %>"/>
					</c:when>
					<c:otherwise>
						<td align="center" colspan="3">
							审核：<input type="text" disabled="disabled" value="${shortm.sho_check}">
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${step==2&&(shortm.approve==''||shortm.approve==null)}">
						<td align="left" colspan="2">
							批准人：
							<input type="text" name="approve" readonly="readonly" value="<%=user.getEmployee().getEmpName() %>" />
					</c:when>
					<c:otherwise>
						<td align="left" colspan="2">
							批准人：<input type="text" disabled="disabled" value="${shortm.approve}">
					</c:otherwise>
				</c:choose>



			</tr>
			<c:choose>
				<c:when
					test="${shortm.sho_check!=''&&shortm.sho_check!=null&&shortm.approve!=''&&shortm.approve!=null}">
					
				</c:when>
				<c:otherwise>
					<tr>
						<td align="center" colspan="5">
							<input type="submit" align="middle" value="提交" class="frm_btn"/>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
	
					</table>
		</form>
		<c:choose>
				<c:when
					test="${shortm.sho_check!=''&&shortm.sho_check!=null&&shortm.approve!=''&&shortm.approve!=null}">
<table>
          <tr>
               <td>
                   <input type='button' value='物料请购' class='frm_btn' onClick="openWin('<%=basePath%>purchase/requisitions/requisitions_addInput?shortmId=${shortm.id}','selectItem',800, 600,1);return false"/>

               </td>
               <td>
                   <input type='button' value='采购订单' class='frm_btn' onClick="openWin('<%=basePath%>purchase/purorder/purorder_addInput?shortmId=${shortm.id}','selectItem',800,600,1);return false"/>

               </td>
          </tr>
       </table>
</c:when>
</c:choose>
	</body>
</html>
