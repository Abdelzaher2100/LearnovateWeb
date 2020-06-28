<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<script src="https://apis.google.com/js/api:client.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<script src="https://apis.google.com/js/api:client.js"></script>
	<!--  script src="https://apis.google.com/js/platform.js?onload=init" async defer></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<title>Login</title>
	 <script>
	  var googleUser = {};
	  var startApp = function() {
	    gapi.load('auth2', function(){
	      // Retrieve the singleton for the GoogleAuth library and set up the client.
	      auth2 = gapi.auth2.init({
	        client_id: '882797551418-3k980v1ikkqdu0t2gg72elujuqjnj63k.apps.googleusercontent.com',
	        cookiepolicy: 'single_host_origin',
	        // Request scopes in addition to 'profile' and 'email'
	        //scope: 'additional_scope'
	      });
	      attachSignin(document.getElementById('customBtn'));
	    });
	  };
	  
	  function attachSignin(element) {
	    auth2.attachClickHandler(element, {},
	       function (googleUser) {
			  document.getElementById('idTokenString').value = googleUser.getAuthResponse().id_token;
			  document.getElementById('loginForm').submit();
	        }, function(error) {
	          alert(JSON.stringify(error, undefined, 2));
	        });
	  }
  </script>
	
	</head>
	<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================================-->
		<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<!--===============================================================================================-->
		<link rel="stylesheet" type="text/css" href="css/util.css">
		<link rel="stylesheet" type="text/css" href="css/main.css">
	<!--==================================required placeholder="email"==============================required placeholder="password"===============================-->
	<body>
		<div class="container-login100" style="background-image: url('img/bg-img/34.jpg');" >
			<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
				<form action="${pageContext.request.contextPath}/login" method="POST" id="loginForm">
					<span class="login100-form-title p-b-37">
						Immetti i tuoi dati
					</span>
					<c:out class="error-text" >${none}</c:out>
					<%session.removeAttribute("none");%>
					<%	if(session.getAttribute("loggato") != null) 
							response.sendRedirect("indexAdmin.jsp");
					%>
					<div class="wrap-input100 validate-input m-b-20" data-validate="Enter email" >
							<input class="input100" type="text" name="email" id="email" required placeholder="email">
							<span class="focus-input100"></span>
					</div>
					<!-- <input type="password" name="password"/> -->
					<div class="wrap-input100 validate-input m-b-25" data-validate ="Enter password" >
							<input class="input100" type="password" name="password" id="password" required placeholder="password">
							<span class="focus-input100"></span>
					</div>
					<div>
							<input type="hidden" name="idTokenString" id="idTokenString" >
					</div>
					<div class="container-login100-form-btn">
			 			<a>
			 				<button class="login100-form-btn">
								Accedi 
							</button>
						</a>
          			</div>
          		</form>
          		<div class="g-signin2s" id="g-singin2s">
         			<button class="g-signin2" id="customBtn">
          				<div  class="abcRioButtons abcRioButtonLightBlues">
          					<div class="abcRioButtonContentWrappers">
          						<div class="abcRioButtonIcons" style="padding:8px;">
	          						<div style="width:18px;height:18px;" class="abcRioButtonSvgImageWithFallback abcRioButtonIconImage abcRioButtonIconImage18">
	          							<svg version="1.1" xmlns="http://www.w3.org/2000/svg" width="18px" height="18px" viewBox="0 0 48 48" class="abcRioButtonSvg">
		          							<g>
			          							<path fill="#EA4335" d="M24 9.5c3.54 0 6.71 1.22 9.21 3.6l6.85-6.85C35.9 2.38 30.47 0 24 0 14.62 0 6.51 5.38 2.56 13.22l7.98 6.19C12.43 13.72 17.74 9.5 24 9.5z"></path>
			          							<path fill="#4285F4" d="M46.98 24.55c0-1.57-.15-3.09-.38-4.55H24v9.02h12.94c-.58 2.96-2.26 5.48-4.78 7.18l7.73 6c4.51-4.18 7.09-10.36 7.09-17.65z"></path>
			          							<path fill="#FBBC05" d="M10.53 28.59c-.48-1.45-.76-2.99-.76-4.59s.27-3.14.76-4.59l-7.98-6.19C.92 16.46 0 20.12 0 24c0 3.88.92 7.54 2.56 10.78l7.97-6.19z"></path>
			          							<path fill="#34A853" d="M24 48c6.48 0 11.93-2.13 15.89-5.81l-7.73-6c-2.15 1.45-4.92 2.3-8.16 2.3-6.26 0-11.57-4.22-13.47-9.91l-7.98 6.19C6.51 42.62 14.62 48 24 48z"></path>
			          							<path fill="none" d="M0 0h48v48H0z"></path>
		          							</g>
	          							</svg>
	          						</div>
          						</div>
          							<span style="font-size:13px;line-height:34px;" >
          							<span id="not_signed_insfwp9bo445nt" style="">Sign in</span>
          							</span>
          					</div>
          				</div>
       				</button>
        		</div>
				<div class="text-center">
					<a href="index.jsp" class="txt2 hov1">
						Torna alla home
					</a>
				</div>
				<div class="text-center">
					<a href="registrazione.jsp" class="txt2 hov1">
						Non sei registrato? Clicca qui
					</a>
				</div>
			</div>
 	 	</div>
		<script>startApp();</script>
	</body>
</html>
