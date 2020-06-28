package controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CorsoUtente;
import persistence.DAOFactory;
import persistence.dao.CorsoDao;
import persistence.dao.CorsoUtenteDao;
/**
 * Servlet implementation class PrenotazioniClienteServlet
 */
@SuppressWarnings("serial")
@WebServlet("/mieicorsi")
public class MieiCorsi extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
	 	CorsoUtenteDao corsoUtente = factory.getCorsoUtenteDAO();
	 	List <CorsoUtente> corsi = corsoUtente.findByCredential((int) session.getAttribute("idutente"));
	 	
	 	session.setAttribute("prenotazioni", corsi);
	 	RequestDispatcher disp;
	 	if((Boolean)session.getAttribute("prof")==false)
	 	disp = req.getRequestDispatcher("miei_corsi.jsp");
	 	else
	 		disp = req.getRequestDispatcher("corsi_prof.jsp");
		disp.forward(req, resp);
	}
}
