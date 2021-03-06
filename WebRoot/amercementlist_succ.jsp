<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>罚单列表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/list.css">
<link href="css/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>   
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #EEF2FB;
}
</style>
<script type="text/javascript">
	function submitForm() {
		var frm = document.studentForm;
		frm.submit();
	} 
	$(document).ready(function(){
				$(".list_tb tr").mouseover(function(){
					$(this).addClass("highlight");
				}).mouseout(function(){
					$(this).removeClass("highlight");
				})
			});
</script>

</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="17" valign="top" background="images/mail_leftbg.gif"><img
				src="images/left-top-right.gif" width="17" height="29" />
			</td>
			<td valign="top" background="images/content-bg.gif">
				<table width="100%" height="30" border="0" cellpadding="0"
					cellspacing="0" class="left_topbg" id="table2">
					<tr>
						<td height="30"><div class="titlebt">罚单列表</div>
						</td>
					</tr>
				</table></td>
			<td width="16" valign="top" background="images/mail_rightbg.gif"><img
				src="images/nav-right-bg.gif" width="16" height="29" />
			</td>
		</tr>

		<tr>
			<td height="48px" valign="middle" background="images/mail_leftbg.gif"></td>
			<td valign="top" bgcolor="#F7F8F9">
				<table width="99%" height="0" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td valign="top">
							<table width="99%"  height="0"border="0" align="center"cellpadding="0" cellspacing="0">
								<tr>
									<td class="left_txt">当前位置》罚单列表</td>
								</tr>
								<tr>
									<td height="20">
										<table width="100%" height="1" border="0"cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
											<tr>
												<td></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td background="images/mail_rightbg.gif">&nbsp;</td>
		</tr>
		
		<tr>
			<td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
			<td valign="top" bgcolor="#F7F8F9">
				<div class="list">
					<h3><font size=2>罚单列表</font></h3>
					<table class="list_tb">
						<tr>
							<th>序号</th>
							<th>罚款学生学号</th>
							<th>姓名</th>
							<th>图书名称</th>
							<th>图书编号</th>
							<th>罚款项目 </th>
							<th>罚款金额 (元)</th>
							<th>是否缴纳</th>
							<th>缴纳时间</th>
							<th>操作</th>
							<th>操作</th>
						</tr>
						<!-- 取出page -->
						<s:set name="page" value="#request.page"></s:set>
						<s:iterator value="#request.amercement" id="amercement"  status="status">
						 	<s:if test="#status.odd">
    							<tr style="background-color:#F7FFFF">
    						</s:if>
						    <s:else>
						        <tr style="background-color:#eef3f7">
						    </s:else>
						    	<td><s:property value="#status.count+(#page.pageNow-1)*#page.pageSize"/></td>
								<td><s:property value="#amercement.student.studentNumber" />
								</td>
								<td><s:property value="#amercement.student.studentName" />
								</td>
								<td><s:property value="#amercement.borrow.book.bookname" />
								</td>
								<td><s:property value="#amercement.borrow.book.bookNumber" />
								</td>
								<td><s:property value="#amercement.detail" />
								</td>
								<td><s:property value="#amercement.mulct" />
								</td>
								<td>
									<s:if test="#amercement.pay">已缴纳</s:if>
									<s:else>未缴纳</s:else>
								</td>
								<td><s:property value="#amercement.payTime" />
								</td>
								<td><a href="amercement_updateView?amercement.id=<s:property value="#amercement.id"/>">编辑</a>
								</td>
								<td><span onClick="if(!confirm('确定删除该信息吗？'))return false;else return true;">删除</span>
								</td>
							</tr>
						</s:iterator>
					</table>
					
					<font size="2">共</font>
					<s:property value="#page.totalPage" />
					<font size="2">页   &nbsp;&nbsp;当前第</font>
					<s:property value="#page.pageNow" />
					<font size="2">页&nbsp;&nbsp; 共</font>
					<s:property value="#page.totalSize" />
					<font size="2">条记录&nbsp;&nbsp;</font>
					</font> 
					<!-- 首页始终显示第一页 -->
					<a href="amercement_list?pageNow=1">首页</a>
					<!-- 如果有前一页就提交前一页的pageNow值 -->
					<s:if test="#page.hasPre">
						<a
							href="amercement_list?pageNow=<s:property value="#page.pageNow-1"/>">上一页</a>
					</s:if>
					<!-- 如果没有就提交第一页的pageNow值 -->
					<s:else>
						<a href="amercement_list?pageNow=1">上一页</a>
					</s:else>
					<!-- 如果有下一页就提交下一页的pageNow值 -->
					<s:if test="#page.hasNext">
						<a
							href="amercement_list?pageNow=<s:property value="#page.pageNow+1"/>">下一页</a>
					</s:if>
					<!-- 如果没有就提交最后一页的pageNow值 -->
					<s:else>
						<a
							href="amercement_list?pageNow=<s:property value="#page.totalPage"/>">下一页</a>
					</s:else>
					<!-- 尾页始终提交最后一页的pageNow值 -->
					<a href="amercement_list?pageNow=<s:property value="#page.totalPage"/>">尾页</a>
					<form name="studentForm" action="amercement_list"
						method="post" style="display: inline;margin:0px;">
						<font size="2" >&nbsp;&nbsp;跳转到:</font> <select name="pageNow" onchange="submitForm()">
							<s:bean name="org.apache.struts2.util.Counter" id="counter">
								<s:param name="first" value="1" />
								<s:param name="last" value="#page.totalPage" />
								<s:iterator>
									<option value="<s:property/>"
										<s:if test="pageNow == currenter -1">selected</s:if>>
										<s:property />
									</option>
								</s:iterator>
							</s:bean>
						</select>
					</form>
				</div>
				</td>
			<td background="images/mail_rightbg.gif">&nbsp;</td>
		</tr>

		<tr>
			<td valign="bottom" background="images/mail_leftbg.gif"><img
				src="images/buttom_left2.gif" width="17" height="17" />
			</td>
			<td background="images/buttom_bgs.gif"><img
				src="images/buttom_bgs.gif" width="17" height="17">
			</td>
			<td valign="bottom" background="images/mail_rightbg.gif"><img
				src="images/buttom_right2.gif" width="16" height="17" />
			</td>
		</tr>
	</table>
</body>
</html>

