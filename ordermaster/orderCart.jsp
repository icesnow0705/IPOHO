<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.orderMaster.model.*"%>
<%@ page import="com.orderDetail.model.*"%>

<%
	OrderMasterVO orderMasterVO = (OrderMasterVO)request.getAttribute("addOrderMaster");
	List<OrderDetailVO> list = (List<OrderDetailVO>)request.getAttribute("odlist");
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("orderMasterVO", orderMasterVO);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>付款頁面</title>

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
					<h1 class="fadeInUp"><span></span>付款頁面</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->

			<div class="container margin_60_35">
				<div class="row">
					<div class="col-lg-8">
						<div class="box_cart">						
						<div class="form_title">
							<h3><strong>1</strong>您的資訊</h3>
							<p>
								為了您的權益，個資部分請務必填真實資料
							</p>
						</div>
						<div class="step">
							<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label>您的姓名</label>
									<input type="text" class="form-control" id="firstname_booking" name="firstname_booking">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>您的暱稱</label>
									<input type="text" class="form-control" id="lastname_booking" name="lastname_booking">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label>Email</label>
									<input type="email" id="email_booking" name="email_booking" class="form-control">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label>確認 email</label>
									<input type="email" id="email_booking_2" name="email_booking_2" class="form-control">
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label>聯絡電話</label>
									<input type="text" id="telephone_booking" name="telephone_booking" class="form-control">
								</div>
							</div>
						</div>
						</div>
						<hr>
						<!--End step -->

						<div class="form_title">
							<h3><strong>2</strong>付款資訊</h3>
							<p>
								請使用信用卡
							</p>
						</div>
						<div class="step">
							<div class="form-group">
							<label>卡片姓名</label>
							<input type="text" class="form-control" id="name_card_bookign" name="name_card_bookign">
						</div>
						<div class="row">
							<div class="col-md-8 col-sm-12">
								<div class="form-group">
									<label>卡片號碼</label>
									<input type="text" id="card_number" name="card_number" class="form-control">
								</div>
							</div>
							<div class="col-md-4 col-sm-12">
								<img src="<%=request.getContextPath()%>/plugins/img/cards_all.png" width="146" height="49.83" alt="Cards" class="cards-payment" >
							</div>
						</div>
						<div class="row">
							<div class="col-md-6">
								<label>到期日</label>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<input type="text" id="expire_month" name="expire_month" class="form-control" placeholder="MM">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<input type="text" id="expire_year" name="expire_year" class="form-control" placeholder="Year">
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label>安全碼</label>
									<div class="row">
										<div class="col-4">
											<div class="form-group">
												<input type="text" id="ccv" name="ccv" class="form-control" placeholder="CCV">
											</div>
										</div>
										<div class="col-8">
											<img src="<%=request.getContextPath()%>/plugins/img/icon_ccv.gif" width="50" height="29" alt="ccv"><small>Last 3 digits</small>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--End row -->
												
						</div>
						<hr>
						<!--End step -->

						<div class="form_title">
							<h3><strong>3</strong>帳單地址</h3>
							<p>
								為了您的權益，個資部分請務必填真實資料
							</p>
						</div>
						<div class="step">
							<div class="row">
								<div class="col-sm-4">
									<div class="form-group">
										<label>國籍</label>
										<input type="text" id="city_booking" name="city_booking" class="form-control">
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label>城市</label>
										<input type="text" id="state_booking" name="state_booking" class="form-control">
									</div>
								</div>
								<div class="col-sm-4">
									<div class="form-group">
										<label>郵遞區號</label>
										<input type="text" id="postal_code" name="postal_code" class="form-control">
									</div>
								</div>
							</div>
							<div class="row">								
								<div class="col-sm-12">
									<div class="form-group">
										<label>地址</label>
										<input type="text" id="street_2" name="street_2" class="form-control">
									</div>
								</div>
							</div>							
							<!--End row -->
						</div>
						<hr>
						<!--End step -->
						<div id="policy">
							<h5>退訂條款</h5>
							<p class="nomargin">你各位趕快把錢付了下好離手 <a href="#0">(可以放退訂條款連結)</a>, 卡號先殺來幫您保留位子</p>
						</div>
						</div>
					</div>
					<!-- /col -->
					
					<aside class="col-lg-4" id="sidebar">
						<div class="box_detail">
							<div id="total_cart">
								Total <span class="float-right">${orderMasterVO.orderAmount}</span>
							</div>
							<c:forEach var="orderDetailVO" items="${list}">
							<ul class="cart_details">
								<li>From <span>${orderDetailVO.rentStartTime}</span></li>
								<li>To <span>${orderDetailVO.rentEndTime}</span></li>
								<jsp:useBean id="spaceDetailSvc" scope="page" class="com.spaceDetail.model.SpaceDetailService" />
								<li>Amount <span>${spaceDetailSvc.selectOneSpaceDetail(orderDetailVO.spaceDetailId).spaceDetailCharge}</span></li>
							</ul>
							</c:forEach>
							<a href="cart-3.html" class="btn_1 full-width purchase">購買</a>
							<div class="text-center"><small>按下按鈕之前不會收任何費用</small></div>
						</div>
						
					</aside>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</main>
		<!--/main-->
</div>
<!-- page -->
<div id="toTop"></div><!-- Back to top button -->
	
<!-- COMMON SCRIPTS -->
    <script src="<%=request.getContextPath()%>/plugins/js/common_scripts.js"></script>
    <script src="<%=request.getContextPath()%>/plugins/js/main.js"></script>
</body>
</html>