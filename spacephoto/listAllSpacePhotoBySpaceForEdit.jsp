<%@ page import="sun.misc.BASE64Encoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spacePhoto.model.*"%>
<%@ page import="com.space.model.*"%>

<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	SpaceVO spaceVO = (SpaceVO) request.getAttribute("spaceVO"); //SpaceServlet.java(Concroller), 存入req的spaceVO物件
	SpacePhotoService spacePhotoSvc = new SpacePhotoService();
	List<SpacePhotoVO> photolist = spacePhotoSvc.getAllPhoto(spaceVO.getSpaceId());
	pageContext.setAttribute("photolist",photolist);
%>


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>編輯場地照片</title>

<!-- GOOGLE WEB FONT -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<!-- BASE CSS -->
    <link href="<%=request.getContextPath()%>/plugins/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/plugins/css/style.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/plugins/css/vendors.css" rel="stylesheet">

<!-- Plugin styles -->
	<link href="<%=request.getContextPath()%>/plugins/vendor/dropzone.css" rel="stylesheet">

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
						<h2>場地照片<small>第一張為預設圖片</small></h2>
						<div class="room_type first">
							<div class="row">
							<c:forEach var="spacePhotoVO" items="${photolist}">
								<div class="col-md-4">
									<img src="<%=request.getContextPath()%>/space/showpicture?spacePhotoId=${spacePhotoVO.spacePhotoId}" width="200" height="135">
									<hr>
			     					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/spacephoto/spacephoto.do" style="margin-bottom: 0px;">
			     						<input type="submit" value="刪除">
			     						<input type="hidden" name="spacePhotoId"  value="${spacePhotoVO.spacePhotoId}">
			     						<input type="hidden" name="action" value="delete">
			     					</FORM>
								</div>
							</c:forEach>
							</div>
							<!-- /row -->
							<hr>
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/spacephoto/spacephoto.do" enctype="multipart/form-data" name="form1">
							<div class="row">										
								<div class="col-md-12">
									<div class="form-group">
										<input type="file" name="spacePhoto" id="imgInp" />
										<img id="blah" src="#" />
									</div>
								</div>
							</div>
							<!-- /row-->
							<hr>
							<p>
								<input type="hidden" name="spaceId" value="${spaceVO.spaceId}">
								<input type="hidden" name="action" value="insert">
            					<input type="submit" value="新增照片" class="btn_1 medium">
							</p>	
							</FORM>
						</div>
						<!-- /row-->
					</section>
					<!-- /section -->
				</div>
				<!-- col -->
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
<!-- Custom scripts for this page-->
	<script src="<%=request.getContextPath()%>/plugins/vendor/dropzone.min.js"></script>
<!-- JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		

<script>
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    
	    reader.onload = function(e) {
	      $('#blah').attr('src', e.target.result);
	    }
	    
	    reader.readAsDataURL(input.files[0]); // convert to base64 string
	  }
}

$("#imgInp").change(function() {
	readURL(this);
});
</script>

</body>
</html>
