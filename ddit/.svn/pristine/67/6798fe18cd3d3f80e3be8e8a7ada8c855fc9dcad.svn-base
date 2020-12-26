<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Adomx - Responsive Bootstrap 4 Admin Template</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/images/favicon.ico">


    <!-- CSS
	============================================ -->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/css/vendor/bootstrap.min.css">

    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/css/vendor/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/css/vendor/font-awesome.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/css/vendor/themify-icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/css/vendor/cryptocurrency-icons.css">

    <!-- Plugins CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/css/plugins/plugins.css">

    <!-- Helper CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/css/helper.css">

    <!-- Main Style CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/css/style.css">

    <!-- Custom Style CSS Only For Demo Purpose -->
    <link id="cus-style" rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/css/style-primary.css">

<%-- 	<script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/vendor/jquery-3.3.1.min.js"></script> --%>
	
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	
	<style>
		* {
			box-sizing: border-box;
			-webkit-box-sizing: border-box;
			-moz-box-sizing: border-box;
		}
		
		.modal-dialog{
			margin-top: 200px;
			margin-left: 400px;
		}
		
		.content-body {
			min-height : 100%;
		}
		
		.page-link{
			background: black;
		}
	</style>

</head>
<title>대덕인재개발원</title>
<body>

       <!-- Header Section Start -->
        <div class="header-section">
            <div class="container-fluid">
                <div class="row justify-content-between align-items-center">

                    <!-- Header Logo (Header Left) Start -->
                    <div class="header-logo col-md-2">
                        <a href="<%=request.getContextPath()%>">
                            <img src="<%=request.getContextPath()%>/resources/img/uni.png" alt="">
<%--                             <img src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/images/logo/logo-light.png" class="logo-light" alt=""> --%>
                        </a>
                        <div class="col-auto"><button class="side-header-toggle"><i class="zmdi zmdi-menu"></i></button></div>
                    </div><!-- Header Logo (Header Left) End -->

                    <!-- Header Right Start -->
                    <div class="header-right flex-grow-1 col-10">
                        <div class="row justify-content-between align-items-center">

                            <!-- Side Header Toggle & Search Start -->
                            <div class="col-md-1">
                                <div class="row align-items-center">

                                    <!--Side Header Toggle-->
                                    

                                   

                                </div>
                                
                            </div><!-- Side Header Toggle & Search End -->
 							<div class="col-md-8"></div>
                            <!-- Header Notifications Area Start -->
                            <div class="col-md-2">

                                <ul class="header-notification-area">

                                   
                                <!--Mail-->
                                    <li class="adomx-dropdown col-auto">
                             
                             
                             
                                    
                    <!-- 남은시간표시 -->
		<script src="<%=request.getContextPath() %>/resources/js/moment.js"></script>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script>
		showMessage();		
		
// 		setInterval(showRemaining, 2000);		
			function showMessage(){
				 $.ajax({
					url:"<%=request.getContextPath() %>/message/newMessageCheck",
					type:"post",
					success:function(data){
						if(data>0){
							if($("#cop").attr("id")!="cop"){
								$("#messageCheck").append("<span id='cop' class='badge'></span>");
// 								$("#messageDetail").attr("class", "zmdi ti-email");
							}
						}else{
							$("#messageCheck").children('#cop').remove();
// 							$("#messageDetail").attr("class", "zmdi zmdi-email-open");
						}						
					}
						
				 });				
			}				
		</script> 
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
             <a id="messageCheck">
             <i id="messageDetail" class="zmdi zmdi-email-open" onclick="location.href='<%=request.getContextPath()%>/message/list'"></i>
<!--         
	<span class="badge"></span> -->
             </a>

			 </li>
                                   

                                    <!--User-->
                                    <li class="adomx-dropdown col-auto">
                                        <a class="toggle" href="#">
                                            <span class="user">
                                        <span class="avatar">
                                            <img src="<%=request.getContextPath()%>/resources/img/member/${loginUser.member_picture}" alt="내사진" style="height: 40px;">
                                            <span class="status"></span>
                                            </span>
                                            <span class="name">${loginUser.member_name }</span>
                                            </span>
                                        </a>

                                        <!-- Dropdown -->
                                        <div class="adomx-dropdown-menu dropdown-menu-user">
                                            <div class="head">
                                                <h5 class="name"><a href="#">${loginUser.member_name }</a></h5>
                                                <a class="mail" href="#">${loginUser.member_email }</a>
                                            </div>
                                            <div class="body">
                                                <ul>
                                                    <li><a href="<%=request.getContextPath() %>/member/modifyForm"><i class="zmdi zmdi-account"></i>내 정보</a></li>
                                                    <li><a href="#"><i class="zmdi zmdi-email-open"></i>내 일정</a></li>
                                                    <li><a href="#"><i class="zmdi zmdi-wallpaper"></i>내 수업관리</a></li>
                                                </ul>
                                                <ul>
<!--                                                     <li><a href="#"><i class="zmdi zmdi-settings"></i>Setting</a></li> -->
                                                    <li><a href="<%=request.getContextPath() %>/common/logout.do"><i class="zmdi zmdi-lock-open"></i>로그아웃</a></li>
                                                </ul>

                                            </div>
                                        </div>

                                    </li>

                                </ul>

                            </div><!-- Header Notifications Area End -->
							
                        </div>
                    </div><!-- Header Right End -->

                </div>
            </div>
        </div><!-- Header Section End -->
        
        

</body>
