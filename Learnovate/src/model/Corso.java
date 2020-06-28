package model;

public class Corso {


	
	private String nome;
	private String link;
	private String desc;
	private String tipo;
	private int id;
	
	
	
	

	public Corso(String n,String l,String d,String t) {
		super();
		this.nome = n;
		this.link = l;
		this.tipo = t;
		this.desc=d;
		
	}
	
	
	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public String getLink() {
		return link;
	}


	public void setLink(String link) {
		this.link = link;
	}


	public String getDesc() {
		return desc;
	}


	public void setDesc(String desc) {
		this.desc = desc;
	}


	public String getTipo() {
		return tipo;
	}


	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	public Corso() {
	}



	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	
	@Override
	public String toString() {
		return "Corso [id=" + id + ", nome=" + nome + ", desc=" + desc + ", tipo=" + tipo
				+ "]";
	}
	
	
	
}
