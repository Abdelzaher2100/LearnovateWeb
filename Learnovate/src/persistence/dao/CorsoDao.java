package persistence.dao;


import model.Corso;

public interface CorsoDao {

	public void save(Corso c);  // Create
	Corso findByPrimaryKey(int id);
	Corso findByLink(String link);
	
	public void update(Corso c); //Update
	public void delete(Corso c); //Delete	
}
