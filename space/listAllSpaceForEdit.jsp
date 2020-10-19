<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.space.model.*"%>
<%@ page import="com.spacePhoto.model.*"%>

<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    SpaceService spaceSvc = new SpaceService();
    List<SpaceVO> list = spaceSvc.getAll();
    pageContext.setAttribute("list",list);
    
//  SpacePhotoService sps = new SpacePhotoService();
%>


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>我的場地</title>

<!-- GOOGLE WEB FONT -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<!-- BASE CSS -->
    <link href="<%=request.getContextPath()%>/plugins/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/plugins/css/style.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/plugins/css/vendors.css" rel="stylesheet">

<!-- Your custom styles -->
    <link href="<%=request.getContextPath()%>/plugins/css/custom.css" rel="stylesheet" type="text/css">

<!-- Favicons-->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/plugins/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="<%=request.getContextPath()%>/plugins/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="<%=request.getContextPath()%>/plugins/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="<%=request.getContextPath()%>/plugins/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="<%=request.getContextPath()%>/plugins/img/apple-touch-icon-144x144-precomposed.png">
    
</head>
<body>

<div id="page">
<%@ include file="/frontend/header.jsp" %>		

  <main>
		
	<section class="hero_in hotels">
		<div class="wrapper">
			<div class="container">
				<h1 class="fadeInUp"><span></span>我的場地</h1>
			</div>
		</div>
	</section>
	<!--/hero_in-->
	
	<div class="container margin_60_35">
		<div class="box_list">
			<div class="row no-gutters">
				<c:forEach var="spaceVO" items="${list}">
					<div class="col-lg-5">
						<figure>
							<small>${spaceVO.spaceId}</small>
							<a><img src="<%=request.getContextPath()%>/space/showonepicture?spaceId=${spaceVO.spaceId}" class="img-fluid" alt="" width="800" height="533"></a>
<%-- 							<a><img src="data:image/png;Base64," + <%=sps.getDefaultFirstPhoto(((SpaceVO)pageContext.getAttribute("spaceVO")).getSpaceId())%> class="img-fluid" alt="" width="800" height="533"></a> --%>
						</figure>
					</div>
					<div class="col-lg-7">
						<div class="wrapper">
							<div class="cat_star"><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i><i class="icon_star"></i></div>
								<h3><a>${spaceVO.spaceName}</a></h3>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/space/space.do" >
									<input type="hidden" name="spaceId" value="${spaceVO.spaceId}">
									<input type="hidden" name="action" value="getOne_For_Display">
       								<input type="submit" value="前往場地介紹" class="btn_1">
       							</FORM>
       							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/spacedetail/spacedetail.do" >
									<input type="hidden" name="spaceId" value="${spaceVO.spaceId}">
									<input type="hidden" name="action" value="listAllSpaceDetailBySpaceForEdit">
       								<input type="submit" value="編輯場地明細" class="btn_1">
       							</FORM>
       							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/spacephoto/spacephoto.do" >
									<input type="hidden" name="spaceId" value="${spaceVO.spaceId}">
									<input type="hidden" name="action" value="listAllSpacePhotoBySpaceForEdit">
       								<input type="submit" value="編輯場地照片" class="btn_1">
       							</FORM>
       							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/space/space.do" >
			     					<input type="submit" value="修改場地" class="btn_1">
			     					<input type="hidden" name="spaceId" value="${spaceVO.spaceId}">
			     					<input type="hidden" name="action"	value="getOne_For_Update">
			     				</FORM>
			     				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/space/space.do" >
			     					<input type="submit" value="場地下架申請" class="btn_1">
			     					<input type="hidden" name="spaceId" value="${spaceVO.spaceId}">
			     					<input type="hidden" name="action" value="delete">
			     				</FORM>
						</div>
					</div>
				</c:forEach>
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