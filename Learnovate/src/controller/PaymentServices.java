package controller;

import java.util.ArrayList;
import java.util.List;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import model.Utente;


public class PaymentServices {
	private static final String CLIENT_ID = "ARt3_36khjB3PWax4xz-KuuCyTGhLKvH2eZr6OybSXoO_xf5X44BwGYLEbe2B8rG80sTeJ4XC1Xz4VtN";
	private static final String CLIENT_SECRET = "EA7owe9pDRgonoC0L2_QotSbGQKpL8gpovo7oZWxUgZ-juQi7u0Y0sMON5L89BHbP49U-sm5Xe9gLHCF";
	private static final String MODE = "live";
	
	
	public String authorizePayment(OrderDetails od, Utente utente ) throws PayPalRESTException {
		Payer payer = getPayerInformation(utente);
		RedirectUrls redirectUrls = getRedirectURLs();
		List<Transaction> listTransaction = getTransactionInformation(od);
		
		Payment requestPayment = new Payment();
		requestPayment.setTransactions(listTransaction)
					  .setRedirectUrls(redirectUrls)
					  .setPayer(payer)
					  .setIntent("authorize");
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
		Payment approvedPayment = requestPayment.create(apiContext);
		
		return getApprovalLink(approvedPayment);
	}//authorizePayment
	
	
	private String getApprovalLink(Payment approvedPayment) {
		List<Links> links = approvedPayment.getLinks();
		String approvalLink = null;
		
		for(Links link : links) {
			if(link.getRel().equalsIgnoreCase("approval_url")) {
				approvalLink = link.getHref();
				break;
			}
		}//foreach
		return approvalLink;
	}//getApprovalLink
	
	private List<Transaction> getTransactionInformation(OrderDetails od ) {
		Details details = new Details();
		details.setShipping(od.getShipping());
		details.setSubtotal(od.getSubtotal());
		details.setTax(od.getTax());
		
		Amount amount = new Amount();
		amount.setCurrency("EUR");
		amount.setTotal(od.getTotal());
		amount.setDetails(details);
		
		Transaction transaction = new Transaction();
		transaction.setAmount(amount);
		transaction.setDescription(od.getService());
		
		ItemList il = new ItemList();
		List<Item> items = new ArrayList<Item>();
		Item item = new Item();
		item.setCurrency("EUR").setName(od.getService())
							   .setPrice(od.getSubtotal())
							   .setTax(od.getTax())
							   .setQuantity("1");
		
		items.add(item);
		il.setItems(items);
		transaction.setItemList(il);
		
		List<Transaction> listTransaction = new ArrayList<Transaction>();
		listTransaction.add(transaction);
		
		return listTransaction;
	}//getTransactionInformation
	
	private RedirectUrls getRedirectURLs() {
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl("http://localhost:8080/Learnovate/Premium.jsp");
		redirectUrls.setReturnUrl("http://localhost:8080/Learnovate/ExecutePayment");
		return redirectUrls;
	}//getRedirectURLs
	
	
	private Payer getPayerInformation(Utente utente) {
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");
		PayerInfo payerInfo = new PayerInfo();
		payerInfo.setFirstName(utente.getNome()).
		setLastName(utente.getCognome())
		.setEmail(utente.getEmail());
		return payer;
	}//getPayerInformation
	
	public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
	    APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
	    return Payment.get(apiContext, paymentId);
	}//getPaymentDetails
	
	public Payment executePayment(String paymentId, String payerId)
	        throws PayPalRESTException {
	    PaymentExecution paymentExecution = new PaymentExecution();
	    paymentExecution.setPayerId(payerId);
	 
	    Payment payment = new Payment().setId(paymentId);
	 
	    APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
	 
	    return payment.execute(apiContext, paymentExecution);
	}//executePayment
}//PaymentServices
