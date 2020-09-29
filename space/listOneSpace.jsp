<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.space.model.*"%>

<%
  SpaceVO spaceVO = (SpaceVO) request.getAttribute("spaceVO"); //SpaceServlet.java(Concroller), 存入req的spaceVO物件
%>

<html>
<head>
<title>場地資料</title>

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
					<h1 class="fadeInUp"><span></span>場地資料修改</h1>
				</div>
			</div>
		</section>
	<!--/hero_in-->

<table>
	<tr>
		<th>場地ID</th>
		<th>會員ID</th>
		<th>員工ID</th>
		<th>場地地址</th>
		<th>場地經度</th>
		<th>場地緯度</th>
		<th>場地名稱</th>
		<th>場地類型</th>
		<th>場地設備</th>
		<th>場地用品</th>
		<th>場地規則</th>
		<th>場地退款須知</th>
		<th>場地狀態</th>
		<th>場地註冊日期</th>
		<th>場地上架日期</th>
		<th>場地下架日期</th>
	</tr>
	<tr>
		<td><%=spaceVO.getSpaceId()%></td>
		<td><%=spaceVO.getMemId()%></td>
		<td><%=spaceVO.getEmpId()%></td>
		<td><%=spaceVO.getSpaceAddress()%></td>
		<td><%=spaceVO.getSpaceLng()%></td>
		<td><%=spaceVO.getSpaceLat()%></td>
		<td><%=spaceVO.getSpaceName()%></td>
		<td><%=spaceVO.getSpaceType()%></td>
		<td><%=spaceVO.getSpaceEquipment()%></td>
		<td><%=spaceVO.getSpaceContain()%></td>
		<td><%=spaceVO.getSpaceRule()%></td>
		<td><%=spaceVO.getSpaceRefund()%></td>
		<td><%=spaceVO.getSpaceStatus()%></td>
		<td><%=spaceVO.getSpaceSignupDate()%></td>
		<td><%=spaceVO.getSpaceOnsaleDate()%></td>
		<td><%=spaceVO.getSpaceOffsaleDate()%></td>
	</tr>
</table>
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
</html>