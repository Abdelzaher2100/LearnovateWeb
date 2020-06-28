package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CorsoUtente;

import persistence.DAOFactory;
import persistence.dao.CorsoUtenteDao;

/**
 * Servlet implementation class CategoriaAServlet
 */
@SuppressWarnings("serial")
@WebServlet("/CAT")
public class AddTomyListServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);

		String idcorso = req.getParameter("corso");
		int idCorsoI = Integer.parseInt(idcorso);
		int idUtente = (Integer) session.getAttribute("idutente");
		CorsoUtente corso_utente = new CorsoUtente(idUtente, idCorsoI);
		CorsoUtenteDao CU = factory.getCorsoUtenteDAO();

		CU.save(corso_utente);

		PrintWriter out = resp.getWriter();

		out.write("1");
	}

}
