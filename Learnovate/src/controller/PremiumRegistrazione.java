package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.paypal.base.rest.PayPalRESTException;

import model.Utente;
import persistence.DAOFactory;
import persistence.dao.UtenteDao;

/**
 * Servlet implementation class PremiumRegistrazione
 */
@WebServlet("/PremiumRegistrazione")
public class PremiumRegistrazione extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpServletRequest req;
	HttpServletResponse resp;
	private HttpSession session;
	private String service;
	private String total;
	private String email;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.req = request;
		this.resp = response;
		session = req.getSession();
		service = req.getParameter("service");
		email = req.getParameter("email");
		if(service == null || email == null || service == "" || email == "") {
			session.setAttribute("error","Accedi per continuare");
			resp.sendRedirect("Premium.jsp");
			return;
		}

		if(service != null && service != "")
			switch(service) {
				case "3Mesi"  : total="0.01"; service = "3 mesi";
												break;
				case "6Mesi"  : total="0.01"; service = "6 mesi";
											  break;
				case "Unanno" : total="0.01";service = "Un anno";
												break;
				default 			: session.setAttribute("error","C'e' stato un errore. Riprova da switch");
												resp.sendRedirect("Premium.jsp");
												return;
			}
		else {
			session.setAttribute("error","C'e' stato un errore. Riprova da else");
			resp.sendRedirect("Premium.jsp");
			return;
		}

		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		UtenteDao utenteDao = factory.getUtenteDAO();
		Utente utente = utenteDao.findByEmail(email);

		OrderDetails od = new OrderDetails(service+" di abbonamento elearning per corsi pagati senza limiti.", total);
		PaymentServices ps = new PaymentServices();
		String approvalLink = null;
		try {
			approvalLink = ps.authorizePayment(od, utente);
		} catch (PayPalRESTException e) {
			 req.setAttribute("errorMessage", e.getMessage());
	            e.printStackTrace();
				req.setAttribute("error1","Pagamento fallito");
	            req.getRequestDispatcher("Premium.jsp").forward(req, resp);
		}
		response.sendRedirect(approvalLink);
	}//doPost
}//PremiumRegistrazione
