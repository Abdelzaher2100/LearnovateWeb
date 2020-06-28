<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
  max-height: 500;
}

.about-section {
  padding: 50px;
  text-align: center;
  background-color: #474e5d;
  color: white;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chi siamo</title>
	<meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->


    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link href="style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="css/responsive/responsive.css" rel="stylesheet">
 	

  
      <link rel="stylesheet" href="css/slideshow.css"> 

</head>

<body>
    <!-- Preloader -->
    <div id="preloader">
        <div class="dorne-load"></div>
    </div>

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
						
						<c:if test="${prof}">
						<c:if test="${tipo}">
						
						
						<li class="nav-item dropdown"><a class="nav-link"
							href="mieicorsi">Miei corsi</a></li>
						</c:if>
												</c:if>
						
						<c:if test="${loggato}">
						
						<c:if test="${not prof}">
						
						
						<li class="nav-item dropdown"><a class="nav-link"
							href="mieicorsi">Miei corsi</a></li>
						</c:if>
												</c:if>
						
						
						<c:if test="${not tipo}">

							<li class="nav-item dropdown"><a class="nav-link"
								href="Premium.jsp">Premium </a></li>
						</c:if>
						<li class="nav-item dropdown"><a class="nav-link"
							href="contatti.jsp">contattaci </a></li>

						<li class="nav-item active"><a class="nav-link"
							href="chiSiamo.jsp">Chi siamo </a></li>
					</ul>

					<c:if test="${not loggato }">
						<!-- Signin btn -->
						<div class="dorne-signin-btn">
							<a href="login.jsp">Accedi</a>
							
						</div>
						  <div class="dorne-signin-btn">
                                <a href="registrazione.jsp">Registarti</a>
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

    <!-- ***** Breadcumb Area Start ***** -->
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero-1.jpg)">
    </div>
    <!-- ***** Breadcumb Area End ***** -->
 <section class="dorne-listing-destinations-area section-padding-100-50"
		style="background-image: url(img/bg-img/67.jpg)">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section-heading dark text-center">
					<span></span>
				<h4 style="color:black;">
					Learnovate's  Story
						<h4>
							<h4 style="color:black;" >
L'idea di questo sito web nasce dalle esigenze del periodo storico in cui ci siamo trovati a vivere negli ultimi mesi: il lockdown causa Covid-19.                   
La tecnologia è stata la nostra migliore amica e con questo sito abbiamo cercato di sfruttarla al meglio per promuovere la formazione.
 Il sito si presenta come un grande contenitore in cui chiunque può essere professore mettendo in campo i propri saperi nel modo più libero possibile e chiunque può essere allievo perché nella vita non si finisce  mai di imparare. 
							</h4>
							</div>
			</div>
		</div>
			</div>
		
		<div class="row">
			<div class="col-12">
				<div class="section-heading dark text-center">
					<span></span>
					<h4 style="color:black;">
					Learnovate's  Missions
						<h4>
							<h4 style="color:black;" >
Aumentare l'accesso a un'istruzione di alta qualità per tutti, ovunque.
Migliorare l'insegnamento e l'apprendimento online.							</h4>
				</div>
			</div>
		</div>
			
	
	</section>

</body>
      <footer class="dorne-footer-area" style="background-image: url(img/bg-img/sfond3.jpg);">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 d-md-flex align-items-center justify-content-between">
                    <div class="footer-text">
                        <p>
                        
                            
	Copyright &copy;<script>document.write(new Date().getFullYear());</script> Learnovate
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
    
	<script src="https://leemark.github.io/better-simple-slideshow/demo/js/hammer.min.js"></script><!-- for swipe support on touch interfaces -->
  
    <script  src="js/slideshow.js"></script>
    
</body>
</html>