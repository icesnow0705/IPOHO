<%@ page import="sun.misc.BASE64Encoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spacePhoto.model.*"%>
<%@ page import="com.space.model.*"%>

<%
  SpaceVO spaceVO = (SpaceVO) request.getAttribute("spaceVO"); // SpaceServlet.java (Concroller) 存入req的spaceVO物件 (包括幫忙取出的spaceVO, 也包括輸入資料錯誤時的spaceVO物件)
  String spaceEqAll = spaceVO.getSpaceEquipment();
  String[] spaceEqSplit = spaceEqAll.split(":");
  out.print(spaceEqSplit[spaceEqSplit.length-1]);
  LinkedList<String> errorMessages = (LinkedList<String>) request.getAttribute("errorMessages");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>場地資料修改</title>

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
					<h1 class="fadeInUp"><span></span>修改場地資料</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->


<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/space/space.do" name="form1">
<div class="content-wrapper">
    <div class="container-fluid">
		<div class="box_general padding_bottom">
			<div class="header_box version_2">
				<h2><i class="fa fa-file"></i>修改場地</h2>
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
							<br><input type="checkbox" name="spaceEquipment" class="form-group" value="WIFI" <%=(spaceEqAll.contains("WIFI") ? "Checked":"")%>/>&nbsp;<img src="<%=request.getContextPath()%>/plugins/img/hotel_facilites_icon_4.svg" alt="">&nbsp;WIFI
							<br><input type="checkbox" name="spaceEquipment" class="form-group" value="冷氣:" <%=(spaceEqAll.contains("冷氣") ? "Checked":"")%>/>&nbsp;<img src="<%=request.getContextPath()%>/plugins/img/hotel_facilites_icon_7.svg" alt="">&nbsp;冷氣
							<br><input type="checkbox" name="spaceEquipment" class="form-group" value="咖啡機:" <%=(spaceEqAll.contains("咖啡機") ? "Checked":"")%>/>&nbsp;<img src="<%=request.getContextPath()%>/plugins/img/hotel_facilites_icon_1.svg" alt="">&nbsp;咖啡機
							<br><input type="checkbox" name="spaceEquipment" class="form-group" value="吹風機:" <%=(spaceEqAll.contains("吹風機") ? "Checked":"")%>/>&nbsp;<img src="<%=request.getContextPath()%>/plugins/img/hotel_facilites_icon_8.svg" alt="">&nbsp;吹風機
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label>其他設備</label><input type="text" name="spaceEquipment" class="form-control" value="<%= spaceEqSplit[spaceEqSplit.length-1] %>">
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>場地類型</label>
						<div class="styled2-select">
							<select name="spaceType">
							  <option <%=(spaceVO.getSpaceType().contains("會議")? "selected":"")%>>會議</option>
							  <option <%=(spaceVO.getSpaceType().contains("聚會")? "selected":"")%>>聚會</option>
							  <option <%=(spaceVO.getSpaceType().contains("私人談話")? "selected":"")%>>私人談話</option>
							  <option <%=(spaceVO.getSpaceType().contains("活動")? "selected":"")%>>活動</option>
							  <option <%=(spaceVO.getSpaceType().contains("其他")? "selected":"")%>>其他</option>
							</select>
					  </div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="form-group">
						<label>場地容納人數</label>
						<div class="styled2-select">
							<select name="spaceContain">
							  <option <%=(spaceVO.getSpaceContain().contains("10")? "selected":"") %>>10</option>
							  <option <%=(spaceVO.getSpaceContain().contains("20")? "selected":"") %>>20</option>
							  <option <%=(spaceVO.getSpaceContain().contains("30")? "selected":"") %>>30</option>
							  <option <%=(spaceVO.getSpaceContain().contains("40")? "selected":"") %>>40</option>
							  <option <%=(spaceVO.getSpaceContain().contains("50")? "selected":"") %>>50</option>
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
			<input type="hidden" name="action" value="update">
			<input type="hidden" name="spaceId" value="<%=spaceVO.getSpaceId()%>">
			<input type="hidden" name="spaceLng" value="<%=spaceVO.getSpaceLng()%>">
			<input type="hidden" name="spaceLat" value="<%=spaceVO.getSpaceLat()%>">
            <input type="submit" value="儲存變更" class="btn_1 medium">
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



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

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
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:false,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '<%=spaceVO.getSpaceSignupDate()%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
</html>