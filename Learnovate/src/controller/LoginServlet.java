package controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier.Builder;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson.JacksonFactory;

import model.Utente;
import persistence.DAOFactory;
import persistence.dao.UtenteDao;

/**
 * Servlet implementation class LoginServlet
 */
@SuppressWarnings("serial")
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private HttpSession session;
	private HttpServletRequest req;
	private HttpServletResponse resp;
	private List<String> id_singleton = Collections
			.singletonList("882797551418-3k980v1ikkqdu0t2gg72elujuqjnj63k.apps.googleusercontent.com");
	private Utente utente;
	static String passGenerator(String arg, String arg2) {
		return ((Integer) ((Integer) (arg.hashCode() + arg2.hashCode())).toString().hashCode()).toString();
	}// passGenerator

	private void mail(String paramEmail, String paramPassword) throws ServletException, IOException {
		session.setAttribute("loggato", null);
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		UtenteDao utenteDao = factory.getUtenteDAO();
		Utente utente = utenteDao.findByCredential(paramEmail, paramPassword);
		this.utente = utente;

		if (utente != null) { 

			session.setAttribute("password", paramPassword);
			session.setAttribute("email", utente.getEmail());
			session.setAttribute("loggato", true);
			session.setAttribute("nome", utente.getNome());
			session.setAttribute("idutente", utente.getIdUtente());
			session.setAttribute("cognome", utente.getCognome());

			session.setAttribute("datadinascita", utente.getDataNascita());
			RequestDispatcher disp;

			if (utente.isProf() == false) {
				session.setAttribute("prof", false);
				session.setAttribute("tipo", utente.isPremium());
				disp = req.getRequestDispatcher("index.jsp");
				try {
					disp.forward(req, resp);
				} catch (ServletException | IOException e) {
					System.out.println("Errore di esecuzione : " + e);
					try {
						resp.sendRedirect("login.jsp");
					} catch (IOException e1) {
						System.out.println("Errore di piattaforma : " + e);
						System.exit(-1);
					}
				}
			} else {
				session.setAttribute("prof", true);
				session.setAttribute("tipo", utente.isPremium());
				
				disp = req.getRequestDispatcher("indexAdmin.jsp");
				disp.forward(req, resp);
			}

		} else {
			session.setAttribute("none", "Dati non disponibili. Registrasi per continuare...");
			resp.sendRedirect("login.jsp");
		}
		
	}// mail

	private void gmail(String idTokenString) throws GeneralSecurityException, IOException, ServletException {
		final HttpTransport transport = new NetHttpTransport();
		final JsonFactory jsonFactory = new JacksonFactory();

		Builder builder = new Builder(transport, jsonFactory);
		builder.setAudience(id_singleton);
		GoogleIdTokenVerifier verifier = builder.build();

		GoogleIdToken idToken = null;
		if (idTokenString == null) {
			System.out.println("Invalid ID token null.");
			System.exit(-1);
		}

		idToken = verifier.verify(idTokenString);

		if (idToken != null) {
			Payload payload = idToken.getPayload();
			// Print user identifier
			String userId = payload.getSubject();

			// Get profile information from payload
			String email = payload.getEmail();
			String password = passGenerator(((Integer) email.hashCode()).toString(),
					((Integer) userId.hashCode()).toString());

			mail(email, password);
		} else
			try {
				resp.sendRedirect("login.jsp");
			} catch (IOException e) {
				System.out.println("Errore di piattaforma : " + e);
				System.exit(-1);
			}
	}// gmail

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.session = req.getSession();
		this.resp = (HttpServletResponse) resp;
		this.req = (HttpServletRequest) req;
		String paramEmail = req.getParameter("email");
		String paramPassword = req.getParameter("password");
		String idTokenString = req.getParameter("idTokenString");
		if (idTokenString != null && idTokenString != "") {
			try {
				gmail(idTokenString);
			} catch (GeneralSecurityException e) {
				e.printStackTrace();
			}
		}else if ((paramEmail != null && paramPassword != null) && (paramEmail != "" && paramPassword != ""))
			mail(paramEmail, paramPassword);
			 else 
			resp.sendRedirect("login.jsp");
		
	}
}
