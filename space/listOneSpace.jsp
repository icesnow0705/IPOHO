<%@ page import="sun.misc.BASE64Encoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spacephoto.model.*"%>
<%@ page import="com.space.model.*"%>

<%
  SpaceVO spaceVO = (SpaceVO) request.getAttribute("spaceVO"); //SpaceServlet.java(Concroller), 存入req的spaceVO物件
  SpacePhotoVO spacePhotoVO = (SpacePhotoVO) request.getAttribute("spacePhotoVO");
  SpacePhotoService spacePhotoSvc = new SpacePhotoService();
  List<SpacePhotoVO> photolist = spacePhotoSvc.getAllPhoto(spaceVO.getSpaceId());
  pageContext.setAttribute("list",photolist);
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>場地資料</title>

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
			<a href="<%=request.getContextPath()%>/frontend/space/spaceHome.jsp">
				<img src="<%=request.getContextPath()%>/plugins/img/logo.svg" width="150" height="36" alt="" class="logo_normal">
				<img src="<%=request.getContextPath()%>/plugins/img/logo_sticky.svg" width="150" height="36" alt="" class="logo_sticky">
			</a>
		</div>		
		<ul id="top_menu">
			<li><a href="cart-1.html" class="cart-menu-btn" title="Cart"><strong>4</strong></a></li>
			<li><a href="#sign-in-dialog" id="sign-in" class="login" title="Sign In">Sign In</a></li>
			<li><a href="wishlist.html" class="wishlist_bt_top" title="Your wishlist">Your wishlist</a></li>
		</ul>
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
				<li><span><a href="<%=request.getContextPath()%>/frontend/space/spaceHome.jsp">場地</a></span>
					<ul>
						<li>
							<span><a href="<%=request.getContextPath()%>/frontend/space/spaceHome.jsp">我的場地</a></span>
							<ul>
								<li><a href="<%=request.getContextPath()%>/frontend/space/addSpace.jsp">新增場地</a></li>
								<li><a href="<%=request.getContextPath()%>/frontend/space/listAllSpace.jsp">所有場地</a></li>
							</ul>
						</li>
						<li>
							<span><a href="<%=request.getContextPath()%>/frontend/spacedetail/spaceDetailHome.jsp">我的場地明細</a></span>
							<ul>
								<li><a href="<%=request.getContextPath()%>/frontend/spacedetail/addSpaceDetail.jsp">新增場地明細</a></li>
								<li><a href="<%=request.getContextPath()%>/frontend/spacedetail/listAllSpaceDetail.jsp">所有場地明細</a></li>
							</ul>
						</li>
						<li>
							<span><a href="<%=request.getContextPath()%>/frontend/spacephoto/spacePhotoHome.jsp">場地照片</a></span>
							<ul>
								<li><a href="<%=request.getContextPath()%>/frontend/spacephoto/addSpacePhoto.jsp">新增場地照片</a></li>
								<li><a href="<%=request.getContextPath()%>/frontend/spacephoto/listAllSpacePhoto.jsp">所有場地照片</a></li>
							</ul>
						</li>
						<li>
							<span><a href="<%=request.getContextPath()%>/frontend/spacecomment/spaceCommentHome.jsp">場地評價</a></span>
							<ul>
								<li><a href="<%=request.getContextPath()%>/frontend/spacecomment/addSpaceComment.jsp">新增場地評價</a></li>
								<li><a href="<%=request.getContextPath()%>/frontend/spacecomment/listAllSpaceComment.jsp">所有場地評價</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li><span><a></a></span>
				</li>
				<li><span><a></a></span>
				</li>
				<li><span><a></a></span>
				</li>
				<li><span><a></a></span>
				</li>
				<li><span><a></a></span>
				</li>
				<li><span><a></a></span>
				</li>
				<li><span><a></a></span>
				</li>
				<li><span><a></a></span>
				</li>
				<li><span><a></a></span>
				</li>
				<li><span><a></a></span>
				</li>
			</ul>
		</nav>

	</header>
  <!-- /header -->

  <main>
		
		<section class="hero_in hotels">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span><%=spaceVO.getSpaceName()%></h1>
				</div>
			</div>
		</section>
	<!--/hero_in-->
	<div class="bg_color_1">
		<div class="container margin_60_35">
			<div class="row">
				<div class="col-lg-8">
					<section id="description">
						<h2>場地介紹</h2>
						<p><%=spaceVO.getSpaceText()%></p>
						<h3>場地規則</h3>
						<p><%=spaceVO.getSpaceRule()%></p>
						<h3>場地退費須知</h3>
						<p><%=spaceVO.getSpaceRefund()%></p>
						<div class="row">
							<div class="col-lg-6">
								<ul class="bullets">
									<li>場地類型：<%=spaceVO.getSpaceType()%></li>
									<li>場地地址：<%=spaceVO.getSpaceAddress()%></li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul class="bullets">
									<li>場地設備：<%=spaceVO.getSpaceEquipment()%></li>
									<li>場地容納人數：<%=spaceVO.getSpaceContain()%>人</li>
								</ul>
							</div>
						</div>
						<!-- /row -->
						<hr>
						<h3>場地照片</h3>
						<div class="room_type first">
							<div class="row">
							<c:forEach var="spacePhotoVO" items="${list}">
								<div class="col-md-4">
									<img src="<%=request.getContextPath()%>/space/showpicture?spaceId=${spacePhotoVO.spaceId}" class="img-fluid" width="273" height="184">
									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/spacephoto/spacephoto.do" style="margin-bottom: 0px;">
			     						<input type="submit" value="修改">
			     						<input type="hidden" name="spacePhotoId"  value="${spacePhotoVO.spacePhotoId}">
			     						<input type="hidden" name="action"	value="getOne_For_Update">
			     					</FORM>
			     					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/spacephoto/spacephoto.do" style="margin-bottom: 0px;">
			     						<input type="submit" value="刪除">
			     						<input type="hidden" name="spacePhotoId"  value="${spacePhotoVO.spacePhotoId}">
			     						<input type="hidden" name="action" value="delete">
			     					</FORM>
								</div>
							</c:forEach>
							</div>
							<!-- /row -->
						</div>
						<hr>
						<h3>Location</h3>
						<div id="map" class="map map_single add_bottom_30"></div>
						<!-- End Map -->
					</section>
					<!-- /section -->
				</div>
				<!-- /col -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /bg_color_1 -->
</main>
<!--/main-->
</div>
<!-- page -->

<!-- COMMON SCRIPTS -->
  	<script src="<%=request.getContextPath()%>/plugins/js/common_scripts.js"></script>
  	<script src="<%=request.getContextPath()%>/plugins/js/main.js"></script>
	
<!-- Map -->
	<script src="http://maps.googleapis.com/maps/api/js"></script>
	<script src="<%=request.getContextPath()%>/plugins/js/map_single_hotel.js"></script>
	<script src="<%=request.getContextPath()%>/plugins/js/infobox.js"></script>
	
</body>
</html>