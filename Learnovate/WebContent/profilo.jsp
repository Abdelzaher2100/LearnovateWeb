<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
 
 <c:if test="${not loggato}">
    	<script>window.location = "index.jsp" </script> 
    </c:if>
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profilo</title>

    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<!-- <link href="css/profiloProva.css" rel="stylesheet" rel="stylesheet" id="bootstrap-css">  -->
	
	<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
	<!------ Include the above in your HEAD tag ---------->
	
	
	<link rel="stylesheet" href="https://bootswatch.com/4/simplex/bootstrap.min.css"/>

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
    
    <!-- ***** Header Area Start ***** -->
     <header class="header_area" id="header">
        <div class="container-fluid h-100">
            <div class="row h-100">
                <div class="col-12 h-100">
                    <nav class="h-100 navbar navbar-expand-lg">
                        <a class="navbar-brand" href="index.jsp"><img src="img/core-img/logo.png" alt=""></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#dorneNav" aria-controls="dorneNav" aria-expanded="false" aria-label="Toggle navigation"><span class="fa fa-bars"></span></button>
                        <!-- Nav -->
                        <div class="collapse navbar-collapse" id="dorneNav">
                            <ul class="navbar-nav mr-auto" id="dorneMenu">
                                <li class="nav-item dropdown">
                                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                                </li>
                                                                <c:if test="${not prof}">
                                
                                <li class="nav-item dropdown">
                                	<a class="nav-link" href="free_courses.jsp">Corsi </a>
								</li>
								        						    </c:if>
								
								<% if (session.getAttribute("nome")!=null){ %>
                                <li class="nav-item dropdown">
                                	<a class="nav-link" href="mieicorsi">Miei corsi</a>
                                </li>
                                <%}%>
                                <c:if test="${not tipo}">
    	                        <li class="nav-item dropdown">
                                	<a class="nav-link" href="Premium.jsp">Premium </a>
                                </li>
        						    </c:if>
        
                                <li class="nav-item dropdown">
                                	<a class="nav-link" href="contatti.jsp">Conttataci</a>
                                </li>
                                
                                <li class="nav-item dropdown">
                                	<a class="nav-link" href="chiSiamo.jsp">Chi Siamo </a>
                                </li>
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
  
                                <li class="nav-item active">
                                	<a class="nav-link" href="profilo.jsp">${nome}</a>
                                </li>
                               
     </c:if>
                       
                            
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero-1.jpg)">
    </div>
    
     
 <div class="container-login100" style="background-image: url('img/bg-img/67.jpg');" >
    <br><br><br>
   
                <div class="col-12">
                    <div class="section-heading dark text-center">
                        <span></span>
                        <h4>Profilo</h4>
                        <p>Gestisci il tuo profilo</p>
                    </div>
                </div>
    
    <div class="container" >
        <div class="row">
            <div class="col-12">
                <div class="card">

                    <div class="card-body"style="background-color: white;" >
                        <div class="card-title mb-4">
                            <div class="d-flex justify-content-start">
                                <div class="userData ml-3">
                                    <h2 class="d-block" style="font-size: 1.5rem; font-weight: bold"><a href="javascript:void(0);"> ${nome} ${cognome} </a></h2>
                                    
                                </div>
                                <div class="ml-auto">
                                    <input type="button" class="btn btn-primary d-none" id="btnDiscard" value="Annulla cambiamenti" />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="true">Dati Profilo</a>
                                    </li>
                                    
                                </ul>
                                <div class="tab-content ml-1" id="myTabContent">
                                    <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                                        

                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Nome e Cognome</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                ${nome} ${cognome}
                                            </div>
                                        </div>
                                        <hr />

                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Data di nascita</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                               ${datadinascita.getDate()}-${datadinascita.getMonth()+1}-${datadinascita.getYear()+1900}
                                            </div>
                                        </div>
                                        <hr />
                                        
                                        
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">profilo</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <c:if test="${not tipo}">
    Free 
    </c:if>
                                                <c:if test="${tipo}">
    Premium 
    </c:if>
 
                                            </div>
                                        </div>
                                        <hr />
                                        <hr />
                                                                       <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">Tipo</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                <c:if test="${not prof}">
    Studente 
    </c:if>
                                                <c:if test="${tipo}">
    Professore 
    </c:if>
 
                                            </div>
                                        </div>
             <hr />
                                        <hr />
                            
                                        <div class="row">
                                            <div class="col-sm-3 col-md-2 col-5">
                                                <label style="font-weight:bold;">E-mail</label>
                                            </div>
                                            <div class="col-md-8 col-6">
                                                ${email}
                                            </div>
                                        </div>
                                        <hr />
                                        <hr />

                                    </div>
                                    
                                </div>
                            </div>
                        </div>


                    </div>

                </div>
            </div>
        </div>
    </div>
    
    </div>
    
    
    
    <!-- ****** Footer Area Start ****** -->
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

    
    
    
    
    
    
   
    
    
    
    <!-- ***** Header Area End ***** -->
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
    
    <script src="js/profiloprova.js"></script>

</body>

</html>


