package model;

import java.util.Calendar;
import java.util.Date;

public class Utente {
private int idUtente;
private String email; 
private String nome;
private String cognome;
private String password;
private Date dataNascita;
private boolean prof ;
private boolean registrato;
private boolean premium;

public Utente(String email, String nome, String cognome, String password, Date dataNascita,boolean prof,boolean prem) {
	super();
	
	this.email = email;
	this.nome = nome;
	this.cognome = cognome;
	this.password = password;
	this.dataNascita = dataNascita;
	this.prof = prof;
	this.registrato = true;
	this.premium=prem;
	
}


public Utente() {
	this.email = "";
	this.nome = "";
	this.cognome = "";
	this.password = "";
	this.prof = false;
	this.registrato = true;
	
	Calendar cal = Calendar.getInstance();
	cal.set(1995, Calendar.MARCH, 21);
	this.dataNascita = cal.getTime();
	
	
}
public String getEmail() {
	return email;
}


public void setEmail(String email) {
	this.email = email;
}


public String getNome() {
	return nome;
}


public void setNome(String nome) {
	this.nome = nome;
}


public String getCognome() {
	return cognome;
}


public void setCognome(String cognome) {
	this.cognome = cognome;
}


public String getPassword() {
	return password;
}


public void setPassword(String password) {
	this.password = password;
}


public Date getDataNascita() {
	return dataNascita;
}


public void setDataNascita(Date dataNascita) {
	this.dataNascita = dataNascita;
}


public boolean isProf() {
	return prof;
}


public void setProf(boolean prof) {
	this.prof = prof;
}


public boolean isRegistrato() {
	return registrato;
}


public void setRegistrato(boolean registrato) {
	this.registrato = registrato;
}


public int getIdUtente() {
	return idUtente;
}


public void setIdUtente(int idUtente) {
	this.idUtente = idUtente;
}


public boolean isPremium() {
	return premium;
}


public void setPremium(boolean premium) {
	this.premium = premium;
}


}
