<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.space.model.*"%>

<%
  SpaceVO spaceVO = (SpaceVO) request.getAttribute("spaceVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>場地資料新增</title>

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
					<h1 class="fadeInUp"><span></span>新增場地</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->
		
<FORM METHOD="post" ACTION="space.do" name="form1">
  <!-- /Navigation-->
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="<%=request.getContextPath()%>/space/spaceHome.jsp">spaceHome</a>
        </li>
        <li class="breadcrumb-item active">新增場地</li>
      </ol>
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-file"></i>新增場地</h2>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="form-group">
						<label>場地ID</label>
						<input type="text" name="spaceId" class="form-control" value="New_SpaceId">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>會員ID</label>
						<input type="text" name="memId" class="form-control" value="MEM00001">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
						<label>員工ID</label>
						<input type="text" name="empId" class="form-control" value="EMP00001">
					</div>
				</div>
			</div>			
			<!-- /row-->
			<div class="row">										
				<div class="col-md-12">
					<div class="form-group">
						<label>場地地址</label>
						<input type="text" name="spaceAddress" class="form-control" value="New_spaceAddress">
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>經度</label>
						<input type="text" name="spaceLng" class="form-control" value="123.456">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>緯度</label>
						<input type="text" name="spaceLat" class="form-control" value="-78.765">
					</div>
				</div>				
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label>場地名稱</label>
						<input type="text" name="spaceName" class="form-control" value="NewSpaceName">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>場地類型</label>
						<div class="styled2-select">
							<select name="spaceType">
							 <option>會議</option>
							 <option>聚會</option>
							 <option>私人談話</option>
							 <option>活動</option>
							</select>
					  </div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>場地設備</label>
						<input type="text" name="spaceEquipment" class="form-control" value="WIFI">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>場地容納人數</label>
						<input type="text" name="spaceContain" class="form-control" value="10">
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label>場地介紹</label>
<%-- 					<div class="editor"></div>     --%>
						<input type="text" name="spaceText" class="form-control" value="新增的場地介紹">
					</div>
				</div>
			</div>			
			<!-- /row-->
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label>場地規則</label>
<%-- 					<div class="editor"></div>     --%>
						<input type="text" name="spaceRule" class="form-control" value="NewSpaceRule">
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label>場地退款須知</label>
						<input type="text" name="spaceRefund" class="form-control" value="NewSpaceRefund">
					</div>
				</div>
			</div>			
			<!-- /row-->
			<div class="row">
				<div class="col-md-3">
					<div class="form-group">
						<label>場地狀態</label>
						<div class="styled2-select">
							<select name="spaceStatus">
							 <option>o</option>
							 <option>c</option>							 
							</select>
					  </div>
					</div>
				</div>
        	<div class="col-md-3">
					<div class="form-group">
						<label>場地註冊日期</label>
						<input type="text" name="spaceSignupDate" class="form-control" value="2020-09-23">
					</div>
				</div>
        	<div class="col-md-3">
					<div class="form-group">
						<label>場地上架日期</label>
						<input type="text" name="spaceOnsaleDate" class="form-control" value="2020-09-23">
					</div>
				</div>
        	<div class="col-md-3">
					<div class="form-group">
						<label>場地下架日期</label>
						<input type="text" name="spaceOffsaleDate" class="form-control" value="2020-09-24">
					</div>
			</div>
		</div>	
		<!-- /row-->
		</div>    
		<!-- /box_general-->
		<p>
			<input type="hidden" name="action" value="insert">
            <input type="submit" value="送出新增" class="btn_1 medium">
		</p>
	</FORM>
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