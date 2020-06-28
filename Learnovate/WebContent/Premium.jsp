<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${admin}">
	<script>window.location = "indexAdmin.jsp" </script>
</c:if>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Premium</title>

<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->


<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link href="style.css" rel="stylesheet">

<!-- Responsive CSS -->
<link href="css/responsive/responsive.css" rel="stylesheet">

<!-- <script src="js/custom.js"></script> -->
</head>

<body>
	<%
            if(session.getAttribute("admin")==null)
              session.setAttribute("admin",false);
            Date oggi=new Date();
            session.setAttribute("oggi", oggi);
          %>
	<!-- Preloader -->
	<div id="preloader">
		<div class="dorne-load"></div>
	</div>
	<script
		src="https://www.paypal.com/sdk/js?AfEttLem762Or0HOq5hBTKrztQXjCKSTOZG2T15M61wQ7m6JbrTh9nuIY02nRVgEVD0hBS5pxMej-Lvf"> // Required. Replace SB_CLIENT_ID with your sandbox client ID.
  		  </script>


	<!-- ***** Header Area Start ***** -->
	<header class="header_area" id="header">
	<div class="container-fluid h-100">
		<div class="row h-100">
			<div class="col-12 h-100">
				<nav class="h-100 navbar navbar-expand-lg"> <a
					class="navbar-brand" href="index.jsp"><img
					src="img/core-img/logo.png" alt=""></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#dorneNav" aria-controls="dorneNav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="fa fa-bars"></span>
				</button>
				<!-- Nav -->
				<div class="collapse navbar-collapse" id="dorneNav">
					<ul class="navbar-nav mr-auto" id="dorneMenu">
						<li class="nav-item dropdown"><a class="nav-link"
							href="index.jsp">Home </a></li>
						<c:if test="${not prof}">

							<li class="nav-item dropdown "><a class="nav-link"
								href="free_courses.jsp">Corsi<span class="sr-only">(current)</span>
							</a></li>
						</c:if>

						<c:if test="${not prof}">


							<li class="nav-item dropdown"><a class="nav-link"
								href="mieicorsi">Miei corsi</a></li>
						</c:if>


						<c:if test="${not tipo}">

							<li class="nav-item active"><a class="nav-link"
								href="Premium.jsp">Premium </a></li>
						</c:if>
						<li class="nav-item dropdown"><a class="nav-link"
							href="contatti.jsp">Contattaci </a></li>

						<li class="nav-item dropdown"><a class="nav-link"
							href="flotta.jsp">Chi siamo </a></li>
					</ul>

					<c:if test="${not loggato }">
						<!-- Signin btn -->
						<div class="dorne-signin-btn">
							<a href="login.jsp">Accedi</a>
						</div>

					</c:if>

					<c:if test="${loggato }">
						<div class="dorne-signin-btn">
							<a href="disconnectServlet">Disconnetti</a>
						</div>

						<div class="dorne-signin-btn">
							<a class="nav-link" href="profilo.jsp">${nome}</a>
						</div>
					</c:if>




				</div>
				</nav>
			</div>
		</div>
	</div>
	</header>
	<!-- ***** Header Area End ***** -->

	<div class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(img/bg-img/hero-1.jpg)"></div>


	<section class="dorne-listing-destinations-area section-padding-100-50"
		style="background-image: url(img/bg-img/67.jpg)">


	<div class="container">
		<div class="row">
			<div class="error-text">
				<span class="error-text">${error}${error1}${errorMessage}${success_premium}</span>
				<%session.removeAttribute("error");session.removeAttribute("error1");session.removeAttribute("errorMessage");session.removeAttribute("success_premium");%>
			</div>
		</div>
	</div>

	<div class="container">
				<div class="col-12">
				<div class="section-heading dark text-center">
					<h4 style="color:black;">
Scegli il tuo Premium
	</h4>
						<span></span>
	</div>
	
	</div>
		<div class="row">
		
			<div class="col-md-4 col-sm-6">
				<form
					action="${pageContext.request.contextPath}/PremiumRegistrazione"
					method="post">
					<input type="hidden" name="3Mesi" value="">
					<div class="pricingTable">
						<div class="pricingTable-header">
							<span class="heading">
								<h3>3 Mesi</h3>
							</span> <span class="price-value">&euro;90<span class="month"></span>
								<span>"Imparare durante l'infanzia..</span><span>
									&egrave; come scolpire sulla pietra."</span> <span>"La sapienza
									&egrave; figliola della sperienza."</span>
							</span>
						</div>

						<div>
							<c:if test="${loggato}">
								<input type="hidden" name="service" value="3Mesi">
								<input type="hidden" name="email" value=${email}>
							</c:if>
						</div>
						<div class="pricingTable-sign-up">
							<c:if test="${loggato}">
								<button class="hover-btn-new orange" style="color: #333333">
									<span>sign up</span>
								</button>
							</c:if>
							<c:if test="${not loggato}">
								<button onclick="null;" class="hover-btn-new orange"
									style="color: #333333">
									<span>sign up</span>
								</button>
							</c:if>
						</div>
						<!-- BUTTON BOX è &egrave;-->
					</div>
				</form>
			</div>

			<div class="col-md-4 col-sm-6">
				<form
					action="${pageContext.request.contextPath}/PremiumRegistrazione"
					method="post">
					<div class="pricingTable">
						<div class="pricingTable-header">
							<span class="heading">
								<h3>6 Mesi</h3>
							</span> <span class="price-value">&euro;160<span class="month"></span>
								<span>"Alcuni imparano per fare soldi.. </span><span>altri
									vendono propriet&agrave;..</span><span>altri fanno entrambe le
									cose."</span></span>
						</div>
						<div>
							<c:if test="${loggato}">
								<input type="hidden" name="service" value="6Mesi">
								<input type="hidden" name="email" value=${email}>
							</c:if>
						</div>

						<div class="pricingTable-sign-up">
							<c:if test="${loggato}">
								<button class="hover-btn-new orange" style="color: #333333">
									<span>sign up</span>
								</button>
							</c:if>
							<c:if test="${not loggato}">
								<button onclick="null;" class="hover-btn-new orange"
									style="color: #333333">
									<span>sign up</span>
								</button>
							</c:if>
						</div>
						<!-- BUTTON BOX-->
					</div>
				</form>
			</div>

			<div class="col-md-4 col-sm-6">
				<form
					action="${pageContext.request.contextPath}/PremiumRegistrazione"
					method="post">
					<input type="hidden" name="Unanno" value="">
					<div class="pricingTable pink">
						<div class="pricingTable-header">
							<span class="heading">
								<h3>Un anno</h3>
							</span> <span class="price-value">&euro;260<span class="month"></span>
								<span>"Alcuni imparano per fare soldi.. </span><span>altri
									vendono propriet&agrave;..</span><span>altri fanno entrambe le
									cose."</span></span>
						</div>

						<div>
							<c:if test="${loggato}">
								<input type="hidden" name="service" value="Unanno">
								<input type="hidden" name="email" value=${email}>
							</c:if>
						</div>

						<div class="pricingTable-sign-up">
							<c:if test="${loggato}">
								<button class="hover-btn-new orange" style="color: #333333">
									<span>sign up</span>
								</button>
							</c:if>
							<c:if test="${not loggato}">
								<button onclick="null;" class="hover-btn-new orange"
									style="color: #333333">
									<span>sign up</span>
								</button>
							</c:if>

						</div>
						<!-- BUTTON BOX-->
						<script>
						   paypal.Buttons().render('#pricingTable-sign-up');
						</script>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- end section --> <!-- ***** Clients Area End ***** --> <!-- ***** Clients Area Start ***** -->
	<div class="dorne-clients-area section-padding-100">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div
						class="clients-logo d-md-flex align-items-center justify-content-around">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ***** Clients Area End ***** --> </section>

	<!-- ****** Footer Area Start ****** -->
	<footer class="dorne-footer-area"
		style="background-image: url(img/bg-img/sfond3.jpg);">
	<div class="container-fluid">
		<div class="row">
			<div
				class="col-12 d-md-flex align-items-center justify-content-between">
				<div class="footer-text">
					<p>


						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						Learnovate
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>

			</div>
		</div>
	</div>
	</footer>

	<!-- ****** Footer Area End ****** -->

	<!-- jQuery-2.2.4 js -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap-4 js -->
	<script src="js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="js/others/plugins.js"></script>
	<!-- Active JS -->
	<script src="js/active.js"></script>
</body>

</html>
