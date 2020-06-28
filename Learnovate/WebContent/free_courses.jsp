<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
    <%@page import="java.sql.*" %>  
    <%@ page import="java.util.regex.*"%>
    


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
 <c:if test="${not loggato}">
    	<script>window.location = "login.jsp" </script> 
    </c:if>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Corsi</title>
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
<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.btn {
  background-color: DodgerBlue;
  border: none;
  color: white;
  padding: 12px 16px;
  font-size: 16px;
  cursor: pointer;
}

/* Darker background on mouse-over */
.btn:hover {
  background-color: RoyalBlue;
}
</style>
    <script src="js/custom.js"></script>

    
    
<script Language="JavaScript">
$(document).ajaxStop(function () {

});


    
function cat3(corsoid) {
	swal({
		  title: "Sei Sicuro?",
		  text: " il corso verrà aggiunto ai tuoi corsi ",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		
	}).then((willDelete) => {
		  if (willDelete) {
		    $.ajax({
		    	
		    	type:"POST",
				url:"CAT",
				data:{corso:corsoid},
				success:function(response){
		    		swal( {
						  title: "Perfetto! il corso è stato aggiunto ",
					      icon: "success",
					      button:true,
					    });
		    		setInterval('location.reload()', 2000);        

				}
			    
		    });

			  } else {
		    swal("Hai annullato l'operazione!");
		  }
		  
		});
	

}
</script>


</head>

<body>
<%
	String keyword = "";
	if(request.getParameter("txtKeyword") != null) {
		keyword = request.getParameter("txtKeyword");
	}
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
                    <nav class="h-100 navbar navbar-expand-lg">
                        <a class="navbar-brand" href="index.jsp"><img src="img/core-img/logo.png" alt=""></a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#dorneNav" aria-controls="dorneNav" aria-expanded="false" aria-label="Toggle navigation"><span class="fa fa-bars"></span></button>
                        <!-- Nav -->
                        <div class="collapse navbar-collapse" id="dorneNav">
                            <ul class="navbar-nav mr-auto" id="dorneMenu">
                                <li class="nav-item dropdown">
                                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item active">
                                	<a class="nav-link" href="free_courses.jsp">Corsi </a>
								</li>
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
    <!-- ***** Header Area End ***** -->

    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/hero-1.jpg)">
    </div>
<%
	Connection connect = null;
	Statement s = null;
	
	try {
		
		//remoto
			
		//locale
		Class.forName("org.postgresql.Driver").newInstance();
		
			
		connect =  DriverManager.getConnection("jdbc:postgresql://packy.db.elephantsql.com:5432/wuyaorrc", "wuyaorrc", "EMgOBHsV4DKzblEyLERKMF6e5Cc01Y5S");
		
		s = connect.createStatement();
		
		String sql = "SELECT * FROM  corsi WHERE nome LIKE '" +  keyword + "%' " ;
		
		
		ResultSet rec = s.executeQuery(sql);
		%>
                      
 <section class="dorne-listing-destinations-area section-padding-100-50"style="background-image: url(img/bg-img/67.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading dark text-center">
                        <span></span>
                        <form form name="frmSearch" method="get" action="free_courses.jsp"> 
                                
                       									
                       									<input name="txtKeyword" type="text" id="txtKeyword" size="70"
										     placeholder="   COSA VUOI IMPARARE?" value="<%=keyword%>">
										       
										       
								
	 								<!-- <div class="container-login100-form-btn"> -->
	                                    <button type="submit" class="btn dorne-btn">
	                                    <i class="fa fa-search pr-2" aria-hidden="true">
	                                    
	                                    </i> 
                                   	 <h7> Conferma</h7>
                                    </button>
                                	
		                                </form> 
                       
                        <h4>Seleziona il corso</h4>
                        <p>Scegli il corso piu' adatto alle tue esigenze</p>
                    </div>
                </div>
            </div>
            <div class="row">
            <% boolean t=(Boolean)session.getAttribute("tipo");
            while((rec!=null) && (rec.next())) { %>
                 
                



                <!-- Single Features Area -->
                <div class="col-12 col-sm-6 col-lg-4">
                    <div class="single-features-area mb-50">
                        <a id="A" style="cursor: pointer;">  
                     <%  
                     	String p=rec.getString("tipo");
                     if(!t){
                    		 if(!p.equals("Premium")){ %>             
                        <iframe width="350" height="315" src="http://www.youtube.com/embed/videoseries?list=<%=rec.getString("link") %>" frameborder="10" allowfullscreen></iframe>
<%} else{%>
             <iframe frameborder="10" scrolling="no" width="350" height="340"
   src="img/bg-img/115.jpg" name="imgbox" id="imgbox">
</iframe><br />                         
                        
                    
		 <% }}
                    		 else{ %>
                    		               <iframe width="350" height="315" src="http://www.youtube.com/embed/videoseries?list=<%=rec.getString("link") %>" frameborder="10" allowfullscreen></iframe><% 		 }
%>
                        <!-- Price -->
                        
                        <div class="price-start">
                        <%          if(!t&&p.equals("Premium")){      %>        
                        
                            <p>     Solo Premium</p>
                            <%} %>
                        </div>
                        <div class="feature-content d-flex align-items-center justify-content-between">
                            <div class="feature-title">
       <%		
                            String sql2 = "SELECT * FROM  utente_corsi WHERE id_utente =  ? and id_corso=?" ;
  
    		int idUtente = (Integer) session.getAttribute("idutente");
      		PreparedStatement ps = connect.prepareStatement(sql2);
      		ps.setInt(1,idUtente);
      		ps.setInt(2,rec.getInt("id"));
            ResultSet rs2=ps.executeQuery();
          if(!t&&!p.equals("Premium")){             
            
        	  if(rs2.next()==false ){
 %>
             	           
             	          <button onclick="cat3(<%=rec.getString("id")%>)"class="btn"><i class="fa fa-plus-circle"></i> Aggiungi ai miei corsi</button>
                         
                         <%}
                         else {
                        	 %>      
                          <button disabled="true" class="btn"><i class="fa fa-minus-circle"></i> Corso aggiunto</button>
                         
                         
                         <%}}if(t){ %>
            
        	 <% if(rs2.next()==false){
 %>
             	           
             	          <button onclick="cat3(<%=rec.getString("id")%>)"class="btn"><i class="fa fa-plus-circle"></i> Aggiungi ai miei corsi</button>
                         
                         <%}
        	 else{
                        	 %>      
                          <button disabled="true" class="btn"><i class="fa fa-minus-circle"></i> Corso aggiunto</button>
                         
   
                                                   <% }}%>
                         
                                <h5><%=rec.getString("nome")%></h5>
                                <p><%=rec.getString("descrizione")%></p>
                                
                            </div>
                        </div>
                        </a>
                    </div>
                </div>
            
            <%} %>    
                
                
                
                
                
        </section>
    <%	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	
		try {
			if(s!=null){
				s.close();
				connect.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
		}
	%>
    
    
    
    <!-- ****** Footer Area Start ****** -->
    <footer class="dorne-footer-area" style="background-image: url(img/bg-img/sfond3.jpg);">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 d-md-flex align-items-center justify-content-between">
                    <div class="footer-text">
                        <p>
                        
                            
	Copyright &copy;<script>document.write(new Date().getFullYear());</script> Learnovate
                        </p>
                    </div>
                    
                </div>
            </div>
        </div>
    </footer>
    <!-- ****** Footer Area End ****** -->
	<!-- jQuery-2.2.4 js -->
 <script src="js/jquery/jquery-2.2.4.min.js"></script>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	    
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap-4 js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/others/plugins.js"></script>
    <!-- Active JS -->
    <script src="js/active.js"></script>
    <script src="js/custom.js"></script>
    
       
</body>
</html>