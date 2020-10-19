<%@ page import="sun.misc.BASE64Encoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spacePhoto.model.*"%>
<%@ page import="com.space.model.*"%>
<%@ page import="com.spaceDetail.model.*"%>
<%@ page import="com.orderDetail.model.*"%>
<%@ page import="com.spaceComment.model.*"%>

<%
  SpaceVO spaceVO = (SpaceVO) request.getAttribute("spaceVO"); //SpaceServlet.java(Concroller), 存入req的spaceVO物件
  //SpaceEquipment拆字串用
  String spaceEqAll = spaceVO.getSpaceEquipment();
  String[] spaceEqSplit = spaceEqAll.split(":");
  pageContext.setAttribute("spaceEqSplit", spaceEqSplit);
  //SpacePhoto印出照片用
  SpacePhotoService spacePhotoSvc = new SpacePhotoService();
  //印出所有場地照片
  List<SpacePhotoVO> photolist = spacePhotoSvc.getAllPhoto(spaceVO.getSpaceId());
  pageContext.setAttribute("photolist", photolist);
  //誠實業者必備顯示最低價格
  SpaceDetailService spaceDetailSvc = new SpaceDetailService();
  SpaceDetailVO spaceDetailVO = spaceDetailSvc.selectOneLowest(spaceVO.getSpaceId());
  //SpaceComment列出所有場地評價用
  SpaceCommentService spaceCommentSvc = new SpaceCommentService();
  List<SpaceCommentVO> commentlist = spaceCommentSvc.getAllCommBySpace(spaceVO.getSpaceId());
  for(SpaceCommentVO transfer : commentlist){
	  transfer.setSpaceCommentId(spaceCommentSvc.showNickname(transfer.getMemberId()));
  }
  pageContext.setAttribute("commentlist", commentlist);
  
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
<%@ include file="/frontend/header.jsp" %>		

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
								</ul>
							</div>
							<div class="col-lg-6">
								<ul class="bullets">
									<li>場地容納人數：<%=spaceVO.getSpaceContain()%>人</li>
								</ul>
							</div>
							<div class="col-lg-12">
								<ul class="bullets">
									<li>場地地址：<%=spaceVO.getSpaceAddress()%></li>
								</ul>
							</div>
							<div class="col-lg-12">
								<ul class="bullets">
									<li>場地設備：</li>
									<c:forEach var="string" items="${spaceEqSplit}">
										<c:choose>
											<c:when test="${'WIFI' == string}"> 
												<p><img src="<%=request.getContextPath()%>/plugins/img/hotel_facilites_icon_4.svg" alt="">&nbsp;WIFI</p>
											</c:when>
											<c:when test="${'冷氣' == string}"> 
												<p><img src="<%=request.getContextPath()%>/plugins/img/hotel_facilites_icon_7.svg" alt="">&nbsp;冷氣</p>
											</c:when>
											<c:when test="${'咖啡機' == string}"> 
												<p><img src="<%=request.getContextPath()%>/plugins/img/hotel_facilites_icon_1.svg" alt="">&nbsp;咖啡機</p>
											</c:when>
											<c:when test="${'吹風機' == string}"> 
												<p><img src="<%=request.getContextPath()%>/plugins/img/hotel_facilites_icon_8.svg" alt="">&nbsp;吹風機</p>
											</c:when>
											<c:otherwise>
												<p>${string}</p>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</ul>
							</div>
						</div>
						<!-- /row -->
						<hr>
						<h3>場地照片</h3>
						<div class="room_type first">
							<div class="row">
							<c:forEach var="spacePhotoVO" items="${photolist}">
								<div class="col-md-4">
									<img src="<%=request.getContextPath()%>/space/showpicture?spacePhotoId=${spacePhotoVO.spacePhotoId}" width="200" height="135">
								</div>
							</c:forEach>
							</div>
							<!-- /row -->
						</div>
						<hr>
						<h3>Location</h3>
						<div id="map" class="map map_single add_bottom_30"></div>
						<!-- End Map -->
						<hr>
						<h3>場地評價</h3>
						<div class="reviews-container">
						<c:forEach var="spaceCommentVO" items="${commentlist}">
							<div class="review-box clearfix">
								<figure class="rev-thumb"><img src="<%=request.getContextPath()%>/space/showmempicture?memberId=${spaceCommentVO.memberId}">
								</figure>
								<div class="rev-content">
									<div class="rating">
										<i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star voted"></i><i class="icon_star"></i>
									</div>
									<div class="rev-info">
										 ${spaceCommentVO.spaceCommentId} – ${spaceCommentVO.spaceCommentDate}
									</div>
									<div class="rev-text">
										<p>
											${spaceCommentVO.spaceCommentContent}
										</p>
									</div>
								</div>
							</div>
							<!-- /review-box -->
						</c:forEach>
						</div>
						<!-- /review-container -->
					</section>
					<!-- /section -->
				</div>
				<!-- col -->
				<aside class="col-lg-4" id="sidebar">
						<div class="box_detail booking">
							<div class="price">
								<span><%= (spaceDetailVO.getSpaceDetailCharge() == null)? "最低收費" : spaceDetailVO.getSpaceDetailCharge() %> /小時<small>起</small></span>
							</div>
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/spacedetail/spacedetail.do" name="form1">
							<input type="hidden" name="spaceId" value="<%=spaceVO.getSpaceId()%>">
							<input type="hidden" name="memberId" value="<%=spaceVO.getMemberId()%>">
							<input type="hidden" name="orderCreateDate" value="<%=new Date()%>">
							<input type="hidden" name="action" value="listAllSpaceDetailBySpace">
							<input type="submit" value="搶先預約!" class="add_top_30 btn_1 full-width purchase">
							<div class="text-center"><small>此步驟不收取任何費用</small></div>
							</FORM>
						</div>
				</aside>
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