package model;

import java.sql.Date;

public class CorsoUtente {
	private int id;
	private int idUtente;
	private int idCorso;
	private Date dataAggiunta;
	private String nomeC;
	private String link;
	private String descrizione;
	public CorsoUtente(int idU, int idC) {
		
		super();
		this.idUtente = idU;
		this.idCorso = idC;
		
	}
	public CorsoUtente() {
		super();
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdUtente() {
		return idUtente;
	}

	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}

	public int getIdCorso() {
		return idCorso;
	}

	public void setIdCorso(int idCorso) {
		this.idCorso = idCorso;
	}

	

	public Date getDataAggiunta() {
		return dataAggiunta;
	}
	public void setDataAggiunta(Date dataAggiunta) {
		this.dataAggiunta = dataAggiunta;
	}
	public String getNomeC() {
		return nomeC;
	}
	public void setNomeC(String nomeC) {
		this.nomeC = nomeC;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizone) {
		this.descrizione = descrizone;
	}
	@Override
	public String toString() {
		return "CorsoUtente [id=" + id + ", idUtente=" + idUtente + ", idCorso=" + idCorso
				+  "]";
	}

}
