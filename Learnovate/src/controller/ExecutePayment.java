package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import model.Utente;
import persistence.DAOFactory;
import persistence.PagamentoDBC;
import persistence.dao.UtenteDao;

/**
 * Servlet implementation class ExecutePayment
 */
@WebServlet("/ExecutePayment")
public class ExecutePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String email;
	private String abbonamento;
	private Integer id;
	private Integer mese;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
        try {
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);
             
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            abbonamento = transaction.getDescription();
            email = payerInfo.getEmail();
             
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", ex.getMessage());
            ex.printStackTrace();
            request.getRequestDispatcher("Premium.jsp").forward(request, response);
        }
        
        DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		UtenteDao utenteDao = factory.getUtenteDAO();
		Utente utente = utenteDao.findByEmail(email);
        id = utente.getIdUtente();
        char c = abbonamento.charAt(0);
        switch(c) {
        	case '3' : mese = 3; abbonamento = "3 Mesi"; break;
        	case '6' : mese = 6; abbonamento = "6 Mesi"; break;
        	case 'U' : mese = 12;abbonamento = "Un anno"; break;
        	default : request.setAttribute("errorMessage", "errore nel pagamento");
        			  request.getRequestDispatcher("Premium.jsp").forward(request, response);
        }
        
        PagamentoDBC pag = new PagamentoDBC();
        if(pag.save(abbonamento, id, mese)) {
        	request.setAttribute("success_premium", "Grazie per aver attivato Premium ! inizia ad usufruire di tutti i vantaggi !");
			  request.getRequestDispatcher("Premium.jsp").forward(request, response);
        }else {
        	request.setAttribute("errorMessage", "errore nel pagamento");
        	request.getRequestDispatcher("Premium.jsp").forward(request, response);
        }
		
	}

}

