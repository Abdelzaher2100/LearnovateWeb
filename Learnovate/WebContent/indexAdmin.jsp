<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="java.util.Date"%>


 <!-- PER NON METTERE NEL "URL" LA PAGINA DI ADMIN SENZA POTERLO FARE -->
    <c:if test="${not prof}">
    	<script>window.location = "index.jsp" </script> 
    </c:if>
	<c:if test="${not loggato}">
    	<script>window.location = "index.jsp" </script> 
    </c:if>
	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

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
						<li class="nav-item active"><a class="nav-link"
							href="indexAdmin.jsp">Home </a></li>
										
						<c:if test="${tipo}">
						
						
						<li class="nav-item dropdown"><a class="nav-link"
							href="mieicorsi">Miei corsi</a></li>
						</c:if>
						
						
						<c:if test="${not tipo}">

							<li class="nav-item dropdown"><a class="nav-link"
								href="Premium.jsp">Premium </a></li>
						</c:if>
						<li class="nav-item dropdown"><a class="nav-link"
							href="contatti.jsp">Contattaci</a></li>

						<li class="nav-item dropdown"><a class="nav-link"
							href="chiSiamo.jsp">Chi siamo </a></li>
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
    
    
	
    
    

    <!-- ***** Welcome Area Start ***** -->
    <section class="dorne-welcome-area bg-img bg-overlay" style="background-image: url(img/bg-img/sfond3.jpg);">
								<c:if test="${not tipo}">
		
        <div class="container h-100">
            <div class="row h-100 align-items-center justify-content-center">
                <div class="col-12 col-md-10">
                    <div class="hero-content">
                        <h3>Ispira gli studenti con i tuoi metodi di insegnamento </h3>
                        <h4>E noi ti aiuteremo a promuovere i tuoi corsi youtube sul nostro sito </h4>
                    </div>
                    <!-- Hero Search Form -->
                    <div class="hero-search-form">
                    
                        <!-- Tabs -->
                        <div class="nav nav-tabs" id="heroTab" role="tablist">
                            <a class="nav-item nav-link active" id="nav-places-tab" data-toggle="tab" href="#nav-places" role="tab" aria-controls="nav-places" aria-selected="true">Learnovate</a>
                        </div>
                        <!-- Tabs Content -->

                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-places" role="tabpanel" aria-labelledby="nav-places-tab">
                                <h6>Diventa premiuem ora per caricare il tuo primo corso</h6>
                                        
                                 <!-- DATA INIZIO --> 
                                <form action="mieicorsi.jsp"> 
                                	
                                		       
										       
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
	 								<!-- <div class="container-login100-form-btn"> -->
	                                       <div class="button">
	                                   
	                                    <button type="submit" class="btn dorne-btn">
	                                    <i class="fa fa-youtube-play" aria-hidden="true">
	                                   
	                                    </i> 
                                   	 <h7> Permium</h7>
                                    </button>
                                	</div> 
		                                </form> 
		                            </div>
		                        </div>
                            </div>
                        </div>
                    </div>
                </div>
           
        </c:if>
           
								<c:if test="${ tipo}">
		
        <div class="container h-100">
            <div class="row h-100 align-items-center justify-content-center">
                <div class="col-12 col-md-10">
                    <div class="hero-content">
                        <h3>Ispira gli studenti con i tuoi metodi di insegnamento </h3>
                        <h4>E noi ti aiuteremo a promuovere i tuoi corsi youtube sul nostro sito </h4>
                    </div>
                    <!-- Hero Search Form -->
                    <div class="hero-search-form">
                    
                        <!-- Tabs -->
                        <div class="nav nav-tabs" id="heroTab" role="tablist">
                            <a class="nav-item nav-link active" id="nav-places-tab" data-toggle="tab" href="#nav-places" role="tab" aria-controls="nav-places" aria-selected="true">Learnovate</a>
                        </div>
                        <!-- Tabs Content -->

                        <div class="tab-content" id="nav-tabContent">
                            <div class="tab-pane fade show active" id="nav-places" role="tabpanel" aria-labelledby="nav-places-tab">
                                <h6>Vai alla pagina Miei corsi per aggiungere un nuovo corso o per gestire i tuoi corsi </h6>
                                        
                                 <!-- DATA INIZIO --> 
                                <form action="mieicorsi"> 
                                	
                                		       
										       
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
	 								<!-- <div class="container-login100-form-btn"> -->
	                                       <div class="button">
	                                   
	                                    <button type="submit" class="btn dorne-btn">
	                                    <i class="fa fa-youtube-play" aria-hidden="true">
	                                   
	                                    </i> 
                                   	 <h7> Miei corsi</h7>
                                    </button>
                                	</div> 
		                                </form> 
		                            </div>
		                        </div>
                            </div>
                        </div>
                    </div>
                </div>
           
        </c:if>
           
		

    <!-- ***** Editor Pick Area Start ***** -->
       
    <footer class="dorne-footer-area"style="background-image: url(img/bg-img/sfond3.jpg);">
        <div class="container-fluid">
            <div class="row" >
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
</body>

</html>