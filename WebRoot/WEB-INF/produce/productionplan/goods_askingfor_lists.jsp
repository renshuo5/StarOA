<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>生产订单管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/vip.css" type="text/css">
   
  </head>
  
  <body bgcolor="#FFFFFF" text="#000000" marginwidth="0" marginheight="0">
    <form aciton="" method="post">
      <table border="0">
        <tr>
          <td colspan="100%" align="right"><input name="query" type="button" class="frm_btn" id="query"
										onClick="javascript:window.location.href='../../生产部订单/query_orderForm_List.jspl'"
										value=" 查 询 "></td>
        </tr>
        <tr>
          <td colspan="7" align="right" background="images/title_bg2.jpg" bgcolor="#266cc1"><!--	------------------------------分页--------------------------------------------- -->
            
            <s:property value="pageview.totalrecord" />
            条记录&nbsp;|&nbsp;共
            <s:property value="pageview.totalpage" />
            页&nbsp;|&nbsp;
            
            <!-- ----------------------------------- 分页LOOP start------------------------------------- -->
            
            <s:bean name="org.apache.struts2.util.Counter" id="counter">
              <s:param name="first" value="1" />
              <s:param name="last" value="pageview.totalpage" />
              <s:iterator>
                <a
									href="control/product/type/list?pageview.currentpage=${current-1}&parentid=${parentid}&query=${query}&queryname=${queryname}">
                  第
                  <s:property value="current-1" />
                  页&nbsp;
                </a>
              </s:iterator>
            </s:bean>
            
            <!-- ----------------------------------- 分页LOOP end--------------------------------------------- -->
            
            <!--	<%@ include file="/WEB-INF/page/share/fenye.jsp" %> --></td>
        </tr>
        <tr>
          <td width="12%" bgcolor="#266cc1"><div align="center"><font color="#FFFFFF">编号</font></div></td>
          <td width="20%" bgcolor="#266cc1"><div align="center"><font color="#FFFFFF">类型（是外协还是总公司指派）</font></div></td>
          <td width="20%" nowrap bgcolor="#266cc1"><div align="center"><font color="#FFFFFF">编制单位</font></div></td>
          <td width="15%" bgcolor="#266cc1"><div align="center">
              <font color="#FFFFFF">日期</font>
            </div></td>
          <td width="" nowrap bgcolor="#266cc1"><div align="center">
              <font color="#FFFFFF">备注</font>
            </div></td>
        </tr>
        <!---------------------------LOOP START------------------------------>
        <s:iterator value="producttypelist">
          <tr>
            <td bgcolor="f5f5f5"><div align="center">
                <a href="要货计划单.jspl?id=${id}">
                  要货计划单
                </a>
              </div></td>
            <td bgcolor="f5f5f5">&nbsp;</td>
            <td bgcolor="f5f5f5"><div align="center">
                <a href='control/product/type/list?parentid=${typeid}'>
                  <s:property value="name" />
                </a>
              </div></td>
            <td bgcolor="f5f5f5" align="center"> 年 月 日 </td>
            <td bgcolor="f5f5f5" align="center"><s:if test="parent.name!=null">
                <s:property value="parent.name" />
              </s:if>
              <s:else>无</s:else>
              <br /></td>
          </tr>
        </s:iterator>
        <!----------------------LOOP END------------------------------->
        
      </table>
    </form>
  </body>
</html>
