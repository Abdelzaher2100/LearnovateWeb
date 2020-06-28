package persistence;

import persistence.DAOFactory;
import persistence.DataSource;
import persistence.UtenteDaoJDBC;
import persistence.dao.*;

public class PostgresDAOFactory extends DAOFactory {

	private static DataSource dataSource;
	private static PostgresDAOFactory factory;

	// --------------------------------------------

	static {
		try {
			//com.mysql.cj.jdbc.Driver  org.postgresql.Driver
			Class.forName("org.postgresql.Driver").newInstance();
			
		//remoto
		dataSource = new DataSource("jdbc:postgresql://packy.db.elephantsql.com:5432/wuyaorrc", "wuyaorrc", "EMgOBHsV4DKzblEyLERKMF6e5Cc01Y5S");
			
		//locale
		//dataSource=new DataSource("jdbc:mysql://localhost:3306/webcomputing?serverTimezone=UTC","root","");
		
		} catch (Exception e) {
			System.err.println("PostgresDAOFactory.class: failed to load MySQL JDBC driver\n" + e);
			e.printStackTrace();
		}
	}
	

	public static PostgresDAOFactory getInstance(){
		if (factory == null){
			factory = new PostgresDAOFactory();
		}
		return factory;
	}
	// --------------------------------------------

	@Override
	public UtenteDao getUtenteDAO() {
		return new UtenteDaoJDBC(dataSource);
	}

	@Override
	public CorsoUtenteDao getCorsoUtenteDAO() {
		return new CorsoUtenteDaoJDBC(dataSource);
	}

	@Override
	public CorsoDaoJDBC getCorsoDaoJDBC() {
		// TODO Auto-generated method stub
		return new CorsoDaoJDBC(dataSource);
	}

	
	@Override
	public UtilDao getUtilDAO() {
		return new UtilDao(dataSource);
	}


}
