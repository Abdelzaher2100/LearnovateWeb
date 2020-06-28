<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${not loggato}">
	<script>window.location = "index.jsp" </script>
</c:if>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/utilT.css">
<link rel="stylesheet" type="text/css" href="css/mainT.css">
<!--===============================================================================================-->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Miei corsi</title>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags must come first in the head; any other head content must come after these tags -->


<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link href="style.css" rel="stylesheet">

<!-- Responsive CSS -->
<link href="css/responsive/responsive.css" rel="stylesheet">

</head>

<body>
	<!-- Preloader -->
	<div id="preloader">
		<div class="dorne-load"></div>
	</div>



	<!-- ** Header Area Start ** -->
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
							href="index.jsp">Home <span class="sr-only">(current)</span></a>
						</li>

						<li class="nav-item dropdown"><a class="nav-link"
							" href="free_courses.jsp">Corsi </a></li>


						<% if (session.getAttribute("nome")!=null){ %>
						<li class="nav-item active"><a class="nav-link"
							href="mieicorsi">Miei corsi</a></li>
						<%}%>
<c:if test="${not tipo}">
						
						<li class="nav-item dropdown"><a class="nav-link"
							href="Premium.jsp">Premium </a></li>
</c:if>
						<li class="nav-item dropdown"><a class="nav-link"
							href="contatti.jsp">Conttataci</a></li>

						<li class="nav-item dropdown"><a class="nav-link"
							href="chiSiamo.jsp">Chi Siamo </a></li>
					</ul>

					<c:if test="${not loggato }">
						<!-- Signin btn -->
						<div class="dorne-signin-btn">
							<a href="login.jsp">Accedi</a>
						</div>
						<!-- Signin btn -->
						<div class="dorne-signin-btn">
							<a href="registrazione.jsp">Registarti</a>
						</div>
					</c:if>

					<c:if test="${loggato }">
						<div class="dorne-signin-btn">
							<a href="disconnectServlet">Disconnetti</a>
						</div>

						<div class="dorne-signin-btn">
							<a href="profilo.jsp">${nome}</a>
						</div>
					</c:if>


				</div>
				</nav>
			</div>
		</div>
	</div>
	</header>
	<!-- ** Header Area End ** -->




	<!-- ** Breadcumb Area Start ** -->
	<div class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(img/bg-img/hero-1.jpg)"></div>
	<!-- ** Breadcumb Area End ** -->
	<c:if test="${not admin}">
	</c:if>

	<c:if test="${admin}">
		<section
			class="dorne-listing-destinations-area section-padding-100-50">
		</section>

	</c:if>
	<section class="dorne-listing-destinations-area section-padding-100-50"
		style="background-image: url(img/bg-img/67.jpg)">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section-heading dark text-center">
					<span></span>
					<h4>
						I tuoi Corsi
						<h4>
							<p>Qui potrai vedere i corsi che hai aggiunto alla tua lista
							</p>
				</div>
			</div>
		</div>
	</div>

	<div class="container">

		<% int  var = 1; %>
		<div class="row">

			<c:forEach items="${prenotazioni}" var="p">

				<!-- Single Features Area -->
				<div class="col-12 col-sm-6 col-lg-4">
					<div class="single-features-area mb-50">
						<iframe width="350" height="315"
							src="http://www.youtube.com/embed/videoseries?list=${ p.link}"
							frameborder="10" allowfullscreen></iframe>
						<!-- Price -->
						<div class="price-start">
							<p><%=var %></p>
						</div>
						<div
							class="feature-content d-flex align-items-center justify-content-between">
							<div class="feature-title">
								<h5>${p.nomeC}</h5>
								<p>Data aggiunta: ${p.dataAggiunta}.</p>
							</div>
						</div>
						</a>
					</div>
				</div>


				<%   var =var+1; %>
			</c:forEach>
		</div>


	</div>

	</section>



	<!-- ** Footer Area Start ** -->
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

	<!-- ** Footer Area End ** -->

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