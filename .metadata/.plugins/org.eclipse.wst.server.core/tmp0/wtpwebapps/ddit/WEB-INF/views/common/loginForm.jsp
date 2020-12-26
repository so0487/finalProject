<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<title>대덕컴퓨터학원</title>
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

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

</head>

<style>
	.whitefont{
		size:30px;
		font-weight: bold;
		color: white;
		font-family: 'Nanum Square', 'Nanum Gothic', sans-serif;
	}
	.buttonLogin{
	    width: 240px;
    height: 50px;
    display: block;
    text-align: center;
    background: #002154;
    font-weight: 200;
    font-size: 18px;
    color: white;
    text-decoration: none;
    line-height: 50px;
    padding: 0;
    border: 0;
    border-radius: 3px;
	}
</style>
<body>

<%--     <div class="main-wrapper" style="margin-top:250px; background-image: url('<%=request.getContextPath() %>/resources/img/uni.jpg'); background-position:center; background-size:cover; background-repeat : no-repeat;"> --%>
    <div class="main-wrapper" style="height:500px;margin-top:150px;" >

        <!-- Content Body Start -->
        <div class="content-body m-0 p-0" >

			<div class="login-register-wrap">
				<div class="row">
					<div class="d-flex align-self-center justify-content-center order-1 order-lg-1 col-lg-12 col-12">
						<div style="width: 530px;">
							<div >
								<img src="<%=request.getContextPath()%>/resources/img/uni.png" style="width: 150px; height: 100px;">
								<span style="font-weight: bold; font-size:35px;">대덕컴퓨터학원</span>
							</div>							
						</div>
					</div>
				</div>
				<div class="row">

					<div
						class="d-flex align-self-center justify-content-center order-2 order-lg-1 col-lg-12 col-12">

						<div class="login-register-form-wrap"
							style="background-color: #12316e; height: 400px; border-radius: 10px;">

							<div class="content">
								<h1 class="whitefont" style="font-weight: bold;">로그인</h1>

							</div>

							<div class="login-register-form">
								<form action="<%=request.getContextPath() %>/common/login.do"
									method="post">
									<div class="row">
										<div class="col-12 mb-20">
											<input class="form-control" name="id" type="text" maxlength="12"
												value="${pastID }" placeholder="User ID">
										</div>
										<div class="col-12 mb-20">
											<input class="form-control" name="pwd" type="password" maxlength="12"
												placeholder="Password">
										</div>
										<div class="col-12 mb-20">
											<label for="remember" class="adomx-checkbox-2 whitefont"><input
												name="remember" id="remember" type="checkbox" value="check"><i class="icon"></i>아이디 저장</label>
										</div>
										<div class="col-12">
											<div class="row justify-content-between">
																						
												<div class="col-auto mb-15">
													<a href="<%=request.getContextPath() %>/common/findForm" onClick="window.open(this.href, '', 'width=450, height=550, left=600, top=200'); return false;"
														class="whitefont">아이디 찾기 / 비밀번호 찾기</a> 
												</div>
												<div class="col-auto mb-15 whitefont">
													계정이 없다면 <a
														href="<%=request.getContextPath() %>/member/registForm"
														class="whitefont">계정 만들기</a>
												</div>
											</div>
										</div>
										<div class="col-12 mt-10">
											<button class="buttonLogin"
												style="font-weight: bold;">로그인</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>



				</div>
			</div>

		</div><!-- Content Body End -->

    </div>

<!-- Footer Section Start -->
<!-- <div class="footer-section">
    <div class="container-fluid">

        <div class="footer-copyright text-center">
            <p class="text-body-light">2019 &copy; <a href="https://themeforest.net/user/codecarnival">Codecarnival</a></p>
        </div>

    </div> -->
</div><!-- Footer Section End -->


    <!-- JS
============================================ -->

    <!-- Global Vendor, plugins & Activation JS -->
    <script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/vendor/modernizr-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/vendor/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/vendor/popper.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/vendor/bootstrap.min.js"></script>
    <!--Plugins JS-->
    <script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/plugins/tippy4.min.js.js"></script>
    <!--Main JS-->
    <script src="<%=request.getContextPath()%>/resources/bootstrap/adomx-html-tf-v1.1/html/light/assets/js/main.js"></script>





</html>