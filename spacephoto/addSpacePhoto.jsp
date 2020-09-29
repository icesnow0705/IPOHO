<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.spacephoto.model.*"%>

<%
  SpacePhotoVO spacePhotoVO = (SpacePhotoVO) request.getAttribute("spacePhotoVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>新增場地圖片</title>

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
					<h1 class="fadeInUp"><span></span>新增場地圖片</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->
		
<FORM METHOD="post" ACTION="spacephoto.do" enctype="multipart/form-data"  name="form1">
<table>
	<tr>
		<td>場地圖片ID:</td>
		<td><input type="TEXT" name="spacePhotoId" size="45" value="SPId"
			  /></td>
	</tr>
	<tr>
		<td>場地ID:</td>
		<td><input type="TEXT" name="spaceId" size="45" value="SPACE00002"
			 /></td>
	</tr>

	<tr>
		<td>場地圖片:</td>
		<td><input type="FILE" name="spacePhoto" placeholder="上傳場地圖片"
			 /></td>
	</tr>	
 	<jsp:useBean id="spacePhotoSvc" scope="page" class="com.spacephoto.model.SpacePhotoService" />

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>
</main>
<!--/main-->
</div>
<!-- page -->

<!-- COMMON SCRIPTS -->
  	<script src="<%=request.getContextPath()%>/plugins/js/common_scripts.js"></script>
  	<script src="<%=request.getContextPath()%>/plugins/js/main.js"></script>
	<script src="<%=request.getContextPath()%>/plugins/assets/validate.js"></script>
	
<!-- Map -->
	<script src="http://maps.googleapis.com/maps/api/js"></script>
	<script src="<%=request.getContextPath()%>/plugins/js/markerclusterer.js"></script>
	<script src="<%=request.getContextPath()%>/plugins/js/map_hotels.js"></script>
	<script src="<%=request.getContextPath()%>/plugins/js/infobox.js"></script>
	
<!-- Masonry Filtering -->
	<script src="<%=request.getContextPath()%>/plugins/js/isotope.min.js"></script>
	<script>
	$(window).on('load', function(){
	  var $container = $('.isotope-wrapper');
	  $container.isotope({ itemSelector: '.isotope-item', layoutMode: 'masonry' });
	});
	$('.filters_listing').on( 'click', 'input', 'change', function(){
	  var selector = $(this).attr('data-filter');
	  $('.isotope-wrapper').isotope({ filter: selector });
	});
	</script>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<%-- 
  java.sql.Date signupDate = null;
  try {
	    signupDate = spaceDetailVO.getSpaceDetailFreeDate();
   } catch (Exception e) {
	    signupDate = new java.sql.Date(System.currentTimeMillis());
   }
--%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        
</script>
</html>