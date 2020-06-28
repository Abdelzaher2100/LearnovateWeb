package controller;


import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.List;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
//import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.*;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier.Builder;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson.JacksonFactory;

import model.Utente;
import persistence.DAOFactory;
import persistence.dao.UtenteDao;

/**
 * Servlet implementation class RegistrazioneServlet
 */
@WebServlet("/registrazione")
public class RegistrazioneServlet extends HttpServlet {
	 static final long serialVersionUID = 1L;
	 HttpServletRequest req;
	 HttpServletResponse resp;
	 List<String> id_singleton = Collections.singletonList("882797551418-3k980v1ikkqdu0t2gg72elujuqjnj63k.apps.googleusercontent.com");
	 DAOFactory factory;
	 UtenteDao utenteDao;
	 Utente utente;
	 RequestDispatcher disp;
	 HttpSession session;


	 @Override
	 protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.resp = resp;
		this.resp.setBufferSize(2048);
		this.req = req;
		this.session = req.getSession();
		String idTokenString = this.req.getParameter("idTokenString");
		String dataDiNascita = this.req.getParameter("datanascita");
		String tipoUtente = this.req.getParameter("tipo");
		Boolean tipo=null;

		if(tipoUtente.equals("Docente"))
			tipo = true;
		else 
			tipo = false;
		if(idTokenString != null)
			try {
				gmail(idTokenString, dataDiNascita, tipo);
			} catch (GeneralSecurityException e1) {
				e1.printStackTrace();
			} else {
				String paramEmail = this.req.getParameter("email");
				String paramNome = this.req.getParameter("nome");
				String paramCognome = this.req.getParameter("cognome");
				String paramPassword = this.req.getParameter("password");
				String paramIndirizzo = this.req.getParameter("indirizzo");
				String tipoUtent = this.req.getParameter("tipo");
				Boolean paramAdmin=null;

				if(tipoUtent.equals("Docente"))
					paramAdmin = true;
				else 
					paramAdmin = false;
				String paramDate = this.req.getParameter("datanascita");

				if(paramNome == "" || paramCognome == "" || paramPassword == "" || paramEmail == "" || paramIndirizzo == "") {
					session.setAttribute("mancanza","Credenziali mancanti");
					resp.sendRedirect("registrazione.jsp");
					return;
				} else
					param(paramNome, paramCognome, paramPassword, paramEmail, paramIndirizzo, paramAdmin, paramDate);

			}
	 }

	 static String passGenerator(String arg, String arg2) {
			return ((Integer)((Integer)(arg.hashCode() + arg2.hashCode())).toString().hashCode()).toString();
	 }//passGenerator

	 void param(String paramNome, String paramCognome, String paramPassword, String paramEmail, String paramIndirizzo, boolean paramAdmin, String paramDate) throws IOException, ServletException {
		/*
		 * factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
	 	utenteDao = factory.getUtenteDAO();
	 	utente = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getUtenteDAO().findByEmail(paramEmail);
		*/
		utente = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getUtenteDAO().findByEmail(paramEmail);
	 	if(utente != null) {
	 		session.setAttribute("esistenza","Account con respettiva email gi� esistente !");
			resp.sendRedirect("registrazione.jsp");
			return;
	 	 } else {
	 		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	 		Date finale = null;

			try {
				if(paramDate != null)
					finale = sdf.parse(paramDate);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			Utente nuovoUtente = new Utente(paramEmail, paramNome, paramCognome, paramPassword, finale, paramAdmin, false);
			DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getUtenteDAO().save(nuovoUtente);
	 		sendEmail(paramEmail);
			resp.sendRedirect("login.jsp");
			return;
	 	 }
	 }//param

	 void gmail(String idTokenString, String data, boolean tipo) throws GeneralSecurityException, IOException, ServletException {
		final HttpTransport transport = new NetHttpTransport();
		final JsonFactory jsonFactory = new JacksonFactory();

		Builder builder = new Builder( transport , jsonFactory);
		builder.setAudience(id_singleton);
		GoogleIdTokenVerifier verifier = builder.build();


		GoogleIdToken idToken = null;
		if(idTokenString == null) {
		   System.out.println("Invalid ID token null.");
		   System.exit(-1);
		}

		idToken = verifier.verify(idTokenString);


		if (idToken != null) {
		  Payload payload = idToken.getPayload();
		   // Print user identifier
		  String email = payload.getEmail();
		  if(DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getUtenteDAO().findByEmail(email) != null) {
			  session.setAttribute("esistenza","Account con respettiva email gi� esistente !");
			  resp.sendRedirect("registrazione.jsp");
			  return;
		  }

		  String userId = payload.getSubject();


		  // Get profile information from payload
		  String password = passGenerator(((Integer)email.hashCode()).toString(), ((Integer)userId.hashCode()).toString());

		  String name = (String) payload.get("name");
		  //String pictureUrl = (String) payload.get("picture");
		  String locale = (String) payload.get("locale");
		  String familyName = (String) payload.get("family_name");
		  //String givenName = (String) payload.get("given_name");

		  param(name, familyName, password, email, locale,  tipo, data);
		}
	}//gmail

	 void sendEmail(String userEmail) {
		 try{
			  String host ="smtp.gmail.com" ;
			  String user = "siwmail001@gmail.com";
	          String pass = "Sistemiperilweb.";
	          String to = userEmail;
	          String from = "siwmail001@gmail.com";
	          String subject = "Inviata da progetto SIW";
	          String messageText = "Questa � una mail inviata dal servizio mail di SIW, congratulazioni la registrazione � stata effettuata con Successo";
	          boolean sessionDebug = false;

	          Properties props = System.getProperties();

	          props.put("mail.smtp.starttls.enable", "true");
	          props.put("mail.smtp.host", host);
	          props.put("mail.smtp.port", "587");
	          props.put("mail.smtp.auth", "true");
	          props.put("mail.smtp.starttls.required", "true");

			  //java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
	          Session mailSession = Session.getDefaultInstance(props, null);
	          mailSession.setDebug(sessionDebug);
	          Message msg = new MimeMessage(mailSession);
	          msg.setFrom(new InternetAddress(from));
	          InternetAddress[] address = {new InternetAddress(to)};
	          msg.setRecipients(Message.RecipientType.TO, address);
	          msg.setSubject(subject); msg.setSentDate(new Date());
	          msg.setText(messageText);

	          Transport transport=mailSession.getTransport("smtp");
	          transport.connect(host, user, pass);
	          transport.sendMessage(msg, msg.getAllRecipients());
	          transport.close();
	          System.out.println("Messaggio inviato correttamente");
	   } catch (Exception ex) {
	            System.out.println(ex+"problema nell'invio la mail");
	        }
	}

}
