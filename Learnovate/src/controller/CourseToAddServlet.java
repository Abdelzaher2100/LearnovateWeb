package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.Proxy;
import java.net.URL;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Corso;
import model.CorsoUtente;
import persistence.CorsoDaoJDBC;
import persistence.DAOFactory;
import persistence.DataSource;
import persistence.IdBroker;
import persistence.dao.CorsoUtenteDao;

/**
 * Servlet implementation class CategoriaAServlet
 */
@SuppressWarnings("serial")
@WebServlet("/CTA")
public class CourseToAddServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);


		String nome_corso = req.getParameter("nome_corso");
		String desc = req.getParameter("descrizione");
		String link=req.getParameter("link");
		String link2=link; 
		final String regex = "[&?]list=([^&]+)";

		Pattern compiledPattern = Pattern.compile(regex,Pattern.CASE_INSENSITIVE);      
	        Matcher matcher = compiledPattern.matcher(link);
	        if(matcher.find()){
	            link2=matcher.group(1);
	        }
	        System.out.println(link2);
		String tipo=req.getParameter("tipo");
		Corso corso = new Corso(nome_corso,link2,desc,tipo);
		
		CorsoDaoJDBC CO = factory.getCorsoDaoJDBC();
		CO.save(corso);

		Corso corso_salvato = CO.findByLink(corso.getLink());
		int idCorsoI = corso_salvato.getId();
		int idUtente = (Integer) session.getAttribute("idutente");
		CorsoUtente corso_utente = new CorsoUtente(idUtente, idCorsoI);
		CorsoUtenteDao CU = factory.getCorsoUtenteDAO();

		CU.save(corso_utente);

		PrintWriter out = resp.getWriter();

		RequestDispatcher disp = req.getRequestDispatcher("/mieicorsi");
		disp.forward(req, resp);
	}
}
