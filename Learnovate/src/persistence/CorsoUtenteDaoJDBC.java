package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.CorsoUtente;
import persistence.dao.CorsoUtenteDao;

public class CorsoUtenteDaoJDBC implements CorsoUtenteDao {
	
	private DataSource dataSource;
	

	public CorsoUtenteDaoJDBC(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	
	@Override
	public void save(CorsoUtente corsoUtente) {
		Connection connection = this.dataSource.getConnection();
		try {
			int id = IdBroker.getId(connection);
			corsoUtente.setId(id);
			String insert = "insert into utente_corsi( id_utente,id_corso,id) values (?,?,?)";
			PreparedStatement statement = connection.prepareStatement(insert);
			
			statement.setInt(1, corsoUtente.getIdUtente());
			statement.setInt(2, corsoUtente.getIdCorso());
			statement.setInt(3, corsoUtente.getId());
			statement.executeUpdate();
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
	}

	@Override
	public CorsoUtente findByPrimaryKey(int id) {
		Connection connection = this.dataSource.getConnection();
		CorsoUtente corsoutente = null;
		try {
			PreparedStatement statement;
			String query = "select * from utente_corsi where id = ?";
			statement = connection.prepareStatement(query);
			statement.setInt(1,id);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				corsoutente = new CorsoUtente();
				corsoutente.setId(result.getInt("id"));
				corsoutente.setIdUtente(result.getInt("id_utente"));
				corsoutente.setIdCorso(result.getInt("id_corso"));
				
			}
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}	
		return corsoutente;
	}

	
	@Override
	public void delete(CorsoUtente corsoutente) {
		Connection connection = this.dataSource.getConnection();
		try {
			String delete = "delete FROM utente_corsi WHERE id = ? ";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setInt(1, corsoutente.getId());
			statement.executeUpdate();
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
	}

	@Override
	public List<CorsoUtente> findByCredential(int idUtente) {
		Connection connection = this.dataSource.getConnection();
		List<CorsoUtente> corsiUtente = new LinkedList<>();
		try {
			CorsoUtente corsoUtente;
			PreparedStatement statement;
			PreparedStatement statement2;
			String query = "select * from utente_corsi where id_utente=?";
			statement = connection.prepareStatement(query);
			statement.setInt(1, idUtente);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				corsoUtente = new CorsoUtente();
				corsoUtente.setId(result.getInt("id"));
				corsoUtente.setIdUtente(result.getInt("id_utente"));
				corsoUtente.setIdCorso(result.getInt("id_corso"));
				corsoUtente.setDataAggiunta(result.getDate("data_aggiunta"));
				String query2 = "select descrizione,nome,link from corsi where ID=?";
				statement2 = connection.prepareStatement(query2);
				statement2.setInt(1,result.getInt("id_corso"));
				ResultSet result2 = statement2.executeQuery();
				if(result2.next()){
					corsoUtente.setNomeC(result2.getString("nome"));
					corsoUtente.setLink(result2.getString("link"));
					corsoUtente.setDescrizione(result2.getString("descrizione"));
					corsiUtente.add(corsoUtente);
				}
				}
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		}	 finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
		return corsiUtente;
	}


	

}
