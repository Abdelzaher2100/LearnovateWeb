<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${not loggato}">
	<script>
		window.location = "index.jsp"
	</script>
	 
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
<title>Miei Corsi</title>
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

</head>
<style>
*{margin: 0px; padding:0px; font-family:Helvetica, Arial, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=password] {
    width: 90%;
    padding: 12px 20px;
    margin: 8px 26px;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
	font-size:16px;
}

/* Set a style for all buttons */
button {
    background-color: #B59189;
    color: white;
    padding: 14px 20px;
  	 margin: 50px 26px;
    
    border: none;
    cursor: pointer;
    width: 90%;
	font-size:20px;
}
button:hover {
    opacity: 0.8;
}

/* Center the image and position the close button */
.imgcontainer2 {
    text-align: center;
    margin: 24px 0 12px 0;
    position: relative;
}
.avatar2 {
    width: 200px;
	height:200px;
    border-radius: 50%;
}

/* The Modal (background) */
.modal {
	display:none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.4);
}

/* Modal Content Box */
.modal-content {
    background-color: #fefefe;
    margin: 4% auto 15% auto;
    border: 1px solid #888;
    width: 40%;
	padding-bottom: 30px;
}

/* The Close Button (x) */
.close {
    position: absolute;
    right: 25px;
    top: 0;
    color: #000;
    font-size: 35px;
    font-weight: bold;
}
.close:hover,.close:focus {
    color: red;
    cursor: pointer;
}

/* Add Zoom Animation */
.animate {
    animation: zoom 0.6s
}
@keyframes zoom {
    from {transform: scale(0)}
    to {transform: scale(1)}
}
</style>

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
							href="indexAdmin.jsp">Home </a></li>
										
						
						
						<li class="nav-item active"><a class="nav-link"
							href="mieicorsi">Miei corsi</a></li>
						
						
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




	    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero-1.jpg)">
    </div>
    <!-- ***** Breadcumb Area End ***** -->
      
        <div class="limiter">
		<div class="container-table100" style="background-image: url(img/bg-img/67.jpg)">
	            <div class="col-6" style="margin-bottom: 0;">
                    <div class="section-heading dark text-center"  style="margin-bottom: 0;">
             <h4>
						I tuoi Corsi
						<h4>
							<p>Qui potrai vedere i corsi che hai aggiunto 
							</p>           	
                          <button onclick="document.getElementById('modal-wrapper').style.display='block'" style="width:200px;margin:0 auto; margin-top:20px">  <i class="fa fa-plus-circle"></i>
Aggiungi  </button>
                        
           </div>
     </div>
  
<div id="modal-wrapper" class="modal">

  <form class="modal-content animate" action="${pageContext.request.contextPath}/CTA" method="Get">

    <div class="imgcontainer2">
      <span onclick="document.getElementById('modal-wrapper').style.display='none'" class="close" title="Close PopUp">&times;</span>
      <img 
					src="img/core-img/logo.png"  class="avatar2">
      <h1 style="text-align:center">Aggiungi un nuovo corso</h1>
    </div>

    <div class="container">
      <div class="wrap-input100 validate-input m-b-20" data-validate="Inserisci il tuo nome">
	 <input type="text" placeholder="Nome Corso" required name="nome_corso">
     					<span class="focus-input100"></span>
					</div>
		
      <input type="text" placeholder="Descrizione" required name="descrizione">
      <input type="text" placeholder="Link" required name="link">
  	<label for="tipo" style="width:90px;margin:0 auto; margin-left:45px">Tipo:</label>
  <select id="tipo" name="tipo">
    <option value="Free">Free</option>
    <option value="Premium">Premium</option>
  </select>
      <button type="submit"style="margin-left:100 px;">Aggiungi</button>
     
    </div>

  </form>

</div>

    
			<div class="wrap-table100" style=" margin-top:0px;margin-bottom:0px;	">
				<div class="table100" >
					<table>
						<thead>
							<tr class="table100-head">
								<th style="text-align:center">Num</th>
								<th style="text-align:center">Nome</th>
								<th style="text-align:center">Descrizione</th>
								<th style="text-align:center">Link</th>
								<th style="text-align:center">Data Aggiunta</th>
								
							</tr>
						</thead>
						<tbody>
						<%int num=1; %>
								<c:forEach items="${prenotazioni}" var="p">
								

									<tr>
										<td style="text-align:center"><%=num %></td>
										<td style="text-align:center">${p.nomeC}</td>
										<td style="text-align:center" >${p.descrizione}</td>
										<td style="text-align:center">${p.link}</td>
										<td style="text-align:center">${p.dataAggiunta}</td>

									</tr>
								<% num=num+1; %>
								</c:forEach>
								
								
						</tbody>
					</table>
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
	<script>
// If user clicks anywhere outside of the modal, Modal will close

var modal = document.getElementById('modal-wrapper');
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
	
</body>
</html>