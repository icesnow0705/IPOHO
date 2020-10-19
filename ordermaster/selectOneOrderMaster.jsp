<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.orderMaster.model.*"%>

<%
	OrderMasterVO orderMasterVO = (OrderMasterVO)request.getAttribute("selectOneOrderMaster");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>訂單確認</title>

<!-- GOOGLE WEB FONT -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<!-- BASE CSS -->
    <link href="<%=request.getContextPath()%>/plugins/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/plugins/css/style.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/plugins/css/vendors.css" rel="stylesheet">

<!-- Your custom styles -->
    <link href="<%=request.getContextPath()%>/plugins/css/custom.css" rel="stylesheet" type="text/css">

</head>
<body>
<div id="page">
<%@ include file="/frontend/header.jsp" %>

  <main>
		
		<section class="hero_in hotels">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>訂單確認</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->

<table>
	<tr>
		<th>訂單編號</th>
		<th>會員編號</th>
		<th>訂單創建日期</th>
		<th>訂單狀態</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>

	
	<tr>
		<td><%=orderMasterVO.getOrderMasterId()%></td>
		<td><%=orderMasterVO.getMemberId()%></td>
		<td><%=orderMasterVO.getOrderCreateDate()%></td>
		<td><%=orderMasterVO.getOrderStatus()%></td>
		<td>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrderMasterServlet" style="margin-bottom: 0px;">
			    <input type="submit" value="修改">
			    <input type="hidden" name="orderMasterId"  value="<%=orderMasterVO.getOrderMasterId()%>">
			    <input type="hidden" name="action"	value="selectOneUpdate"></FORM>
		</td>
		<td>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/OrderMasterServlet" style="margin-bottom: 0px;">
			    <button name="delete" value="刪除" type="submit" class="delete" onclick="javascript:return confirm('確認刪除?');">刪除</button>
			    <input type="hidden" name="orderMasterId"  value="<%=orderMasterVO.getOrderMasterId()%>">
			    <input type="hidden" name="action" value=deleteOrderMaster></FORM>
		</td>
	</tr>

</table>
</main>
</div>

</body>
</html>