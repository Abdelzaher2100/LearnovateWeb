package persistence.dao;

import java.util.List;

import model.CorsoUtente;

public interface CorsoUtenteDao {

	public void save(CorsoUtente prenotazione);  // Create
	public CorsoUtente findByPrimaryKey(int idPrenotazione);     // Retrieve
	public void delete(CorsoUtente prenotazione); //Delete	
	
	public List<CorsoUtente> findByCredential(int idCliente);
}
