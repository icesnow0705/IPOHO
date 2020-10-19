<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.space.model.*"%>
<%@ page import="java.util.*"%>

<%
  SpaceVO spaceVO = (SpaceVO) request.getAttribute("spaceVO");
  LinkedList<String> errorMessages = (LinkedList<String>) request.getAttribute("errorMessages");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>新增場地</title>

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
					<h1 class="fadeInUp"><span></span>新增場地</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->
		
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/space/space.do" name="form1">
  <div class="content-wrapper">
    <div class="container-fluid">
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-file"></i>新增場地</h2>
			</div>
			<div class="row">										
				<div class="col-md-4">
					<div class="form-group">
						<label>場地名稱</label>
						<input type="text" name="spaceName" class="form-control" value="<%= (spaceVO == null)? "" : spaceVO.getSpaceName()%>"/>
						<span style="color:red"><%= (errorMessages == null)? "" : (!spaceVO.getSpaceName().equals(""))? "" : "  " + errorMessages.poll()%></span>
					</div>
				</div>
				<div class="col-md-8">
					<div class="form-group">
						<label>場地地址</label>
						<input type="text" name="spaceAddress" class="form-control" value="<%= (spaceVO == null)? "" : spaceVO.getSpaceAddress()%>"/>
						<span style="color:red"><%= (errorMessages == null)? "" : (!spaceVO.getSpaceAddress().equals(""))? "" : "  " + errorMessages.poll()%></span>
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>場地設備</label>
						<br><input type="checkbox" name="spaceEquipment" class="form-group" value="WIFI:"/>&nbsp;<img src="<%=request.getContextPath()%>/plugins/img/hotel_facilites_icon_4.svg" alt="">&nbsp;WIFI
						<br><input type="checkbox" name="spaceEquipment" class="form-group" value="冷氣:"/>&nbsp;<img src="<%=request.getContextPath()%>/plugins/img/hotel_facilites_icon_7.svg" alt="">&nbsp;冷氣
						<br><input type="checkbox" name="spaceEquipment" class="form-group" value="咖啡機:"/>&nbsp;<img src="<%=request.getContextPath()%>/plugins/img/hotel_facilites_icon_1.svg" alt="">&nbsp;咖啡機
						<br><input type="checkbox" name="spaceEquipment" class="form-group" value="吹風機:"/>&nbsp;<img src="<%=request.getContextPath()%>/plugins/img/hotel_facilites_icon_8.svg" alt="">&nbsp;吹風機
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>其他設備</label><input type="text" name="spaceEquipment" class="form-control">
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
							  <option>其他</option>
							</select>
					  </div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>場地容納人數</label>
						<div class="styled2-select">
							<select name="spaceContain">
							  <option>10</option>
							  <option>20</option>
							  <option>30</option>
							  <option>40</option>
							  <option>50</option>
							</select>
					    </div>
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label>場地介紹</label>
						<textarea name="spaceText" class="form-control" rows="5">新增場地介紹</textarea>
					</div>
				</div>
			</div>			
			<!-- /row-->
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label>場地規則</label>
						<textarea name="spaceRule" class="form-control" rows="5">新增場地規則</textarea>
					</div>
				</div>
			</div>
			<!-- /row-->
			<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label>場地退款須知</label>
						<textarea name="spaceRefund" class="form-control" rows="5">新增場地場地退款須知</textarea>
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
		</div>
  </div>
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
	
</body>

</html>