package controller;


import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier.Builder;
//import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.auth.oauth2.*;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson.JacksonFactory;
//import com.google.api.client.json.jackson2.JacksonFactory;

/**
 * Servlet implementation class GoogleTokenSignIn
 */
@WebServlet("/GoogleTokenSignIn")
public class GoogleTokenSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<String> id_singleton = Collections.singletonList("882797551418-3k980v1ikkqdu0t2gg72elujuqjnj63k.apps.googleusercontent.com");

		
		
		final HttpTransport transport = new NetHttpTransport();
		final JsonFactory jsonFactory = new JacksonFactory();
	//	GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder( transport , jsonFactory)
		//		.setAudience(id_singleton).build();
	
		Builder builder = null;
		try {
			builder = new Builder( transport , jsonFactory);
		} catch (Exception e) {
			System.out.println("error: "+e);
		}
		
		try {
			builder.setAudience(id_singleton);
		} catch (Exception e) {
			System.out.println("error: "+e);
		}
		
		GoogleIdTokenVerifier verifier = null;
		
		try {
			verifier = builder.build();
		} catch (Exception e) {
			System.out.println("error: "+e);
		}
	
		
		
		// Specify the CLIENT_ID of the app that accesses the backend:
		 // Or, if multiple clients access the backend:
		 //.setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))

		 //HttpSession session = req.getSession();
			
		// (Receive idTokenString by HTTPS POST)
		String idTokenString = req.getParameter("idTokenString");

		 GoogleIdToken idToken = null;
		 if(idTokenString == null) {
			   System.out.println("Invalid ID token null.");
			   System.exit(-1);
		 }else 
			 System.out.println(idTokenString);
			try {
				idToken = verifier.verify(idTokenString);
			} catch (GeneralSecurityException e) {
				e.printStackTrace();
			}
		 if (idToken != null) {
		   Payload payload = idToken.getPayload();

		   // Print user identifier
		   String userId = payload.getSubject();

		   // Get profile information from payload
		   String email = payload.getEmail();
		   boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
		   String name = (String) payload.get("name");
		 //String pictureUrl = (String) payload.get("picture");
		   String locale = (String) payload.get("locale");
		   String familyName = (String) payload.get("family_name");
		   String givenName = (String) payload.get("given_name");
		   resp.sendRedirect("registrazione.jsp");
		   // Use or store profile information
		   // ...
		 } else {
		   System.out.println("Invalid ID token.");
		 }
	}
}
