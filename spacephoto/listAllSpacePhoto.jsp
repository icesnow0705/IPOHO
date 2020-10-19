<%@ page import="sun.misc.BASE64Encoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spacePhoto.model.*"%>

<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    SpacePhotoService spacePhotoSvc = new SpacePhotoService();
    List<SpacePhotoVO> list = spacePhotoSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>所有場地照片</title>

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
					<h1 class="fadeInUp"><span></span>所有場地照片</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->

<table>
	<tr>
		<th>場地照片ID</th>
		<th>場地ID</th>
		<th>場地照片</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="spacePhotoVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	
	<% 	Base64.Encoder encoder = Base64.getEncoder(); %>
	
		<tr>
			<td>${spacePhotoVO.spacePhotoId}</td>
			<td>${spacePhotoVO.spaceId}</td>
			<td><img src="data:image/png;base64,<%=encoder.encodeToString(((SpacePhotoVO)pageContext.getAttribute("spacePhotoVO")).getSpacePhoto())%>" class="perview" width="273" height="184"/></td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/spacephoto/spacephoto.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="spacePhotoId"  value="${spacePhotoVO.spacePhotoId}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/spacephoto/spacephoto.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="spacePhotoId"  value="${spacePhotoVO.spacePhotoId}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>
</main>
<!--/main-->
</div>
<!-- page -->

<!-- COMMON SCRIPTS -->
  	<script src="<%=request.getContextPath()%>/plugins/js/common_scripts.js"></script>
  	<script src="<%=request.getContextPath()%>/plugins/js/main.js"></script>
	
<!-- Map -->
	<script src="http://maps.googleapis.com/maps/api/js"></script>
	<script src="<%=request.getContextPath()%>/plugins/js/markerclusterer.js"></script>
	<script src="<%=request.getContextPath()%>/plugins/js/map_hotels.js"></script>
	<script src="<%=request.getContextPath()%>/plugins/js/infobox.js"></script>
	
</body>
</html>