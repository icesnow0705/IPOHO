<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.space.model.*"%>
<%@ page import="com.spacephoto.model.*"%>
<%@ page import="sun.misc.BASE64Encoder"%>

<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    SpaceService spaceSvc = new SpaceService();
    List<SpaceVO> list = spaceSvc.getAll();
    SpacePhotoService spacePhotoSvc = new SpacePhotoService();
    List<SpacePhotoVO> photolist = spacePhotoSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>所有場地</title>

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
		
	<header class="header menu_fixed">
		<div id="preloader"><div data-loader="circle-side"></div></div><!-- /Page Preload -->
		<div id="logo">
			<a href="<%=request.getContextPath()%>/space/spaceHome.jsp">
				<img src="<%=request.getContextPath()%>/plugins/img/logo.svg" width="150" height="36" alt="" class="logo_normal">
				<img src="<%=request.getContextPath()%>/plugins/img/logo_sticky.svg" width="150" height="36" alt="" class="logo_sticky">
			</a>
		</div>		
		<!-- /top_menu -->
		<a href="#menu" class="btn_mobile">
			<div class="hamburger hamburger--spin" id="hamburger">
				<div class="hamburger-box">
					<div class="hamburger-inner"></div>
				</div>
			</div>
		</a>
		<nav id="menu" class="main-menu">
			<ul>
				<li><span><a href="<%=request.getContextPath()%>/space/spaceHome.jsp">場地</a></span>
					<ul>
						<li><a href="<%=request.getContextPath()%>/space/addSpace.jsp">新增場地</a></li>
						<li><a href="<%=request.getContextPath()%>/space/listAllSpace.jsp">所有場地</a></li>
					</ul>
				</li>
				<li><span><a href="<%=request.getContextPath()%>/spacedetail/spaceDetailHome.jsp">場地明細</a></span>
					<ul>
						<li><a href="<%=request.getContextPath()%>/spacedetail/addSpaceDetail.jsp">新增場地明細</a></li>
						<li><a href="<%=request.getContextPath()%>/spacedetail/listAllSpaceDetail.jsp">所有場地明細</a></li>
					</ul>
				</li>
				<li><span><a href="<%=request.getContextPath()%>/spacephoto/spacePhotoHome.jsp">場地照片</a></span>
					<ul>
						<li><a href="<%=request.getContextPath()%>/spacephoto/addSpacePhoto.jsp">新增場地照片</a></li>
						<li><a href="<%=request.getContextPath()%>/spacephoto/listAllSpacePhoto.jsp">所有場地照片</a></li>
					</ul>
				</li>
				<li><span><a href="<%=request.getContextPath()%>/spacecomment/spaceCommentHome.jsp">場地評價</a></span>
					<ul>
						<li><a href="<%=request.getContextPath()%>/spacecomment/addSpaceComment.jsp">新增場地評價</a></li>
						<li><a href="<%=request.getContextPath()%>/spacecomment/listAllSpaceComment.jsp">所有場地評價</a></li>
					</ul>
				</li>				
			</ul>
		</nav>

	</header>
  <!-- /header -->

  <main>
		
	<section class="hero_in hotels">
		<div class="wrapper">
			<div class="container">
				<h1 class="fadeInUp"><span></span>全部場地資料</h1>
			</div>
		</div>
	</section>
	<!--/hero_in-->
	<% Base64.Encoder encoder = Base64.getEncoder(); %>
	<div class="container margin_60_35">
		<div class="box_list">
			<div class="row no-gutters">
				<div class="col-lg-5">
					<figure>
						<c:forEach var="spacePhotoVO" items="${photolist}" >
						  <small>123</small>
						  <a><img src="data:image/png;base64,<%=encoder.encodeToString(((SpacePhotoVO)pageContext.getAttribute("spacePhotoVO")).getSpacePhoto())%>" class="img-fluid" alt="" width="800" height="533"></a>
						</c:forEach>
					</figure>
				</div>
				<div class="col-lg-7">
					<div class="wrapper">
						<c:forEach var="spaceVO" items="${list}">
						  <div class="cat_star"><i class="icon_star" value=""></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i></div>
						  <h3><a href="hotel-detail.html">${spaceVO.spaceName}</a></h3>
						  <p>${spaceVO.spaceText}</p>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
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