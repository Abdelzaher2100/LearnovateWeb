package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.Corso;
import persistence.dao.CorsoDao;
import persistence.dao.CorsoUtenteDao;

public class CorsoDaoJDBC implements CorsoDao{

	private DataSource dataSource;

	public CorsoDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void save(Corso corso) {
		Connection connection = this.dataSource.getConnection();
		try 
		{
			int id = IdBroker.getId(connection);
			corso.setId(id);
			System.out.print(id);
			String insert = "insert into corsi(nome,link,tipo,descrizione,id) values (?,?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(insert);
			
			statement.setString(1, corso.getNome());
			
			statement.setString(2, corso.getLink());
			statement.setString(3, corso.getTipo());
			statement.setString(4, corso.getDesc());
			statement.setInt(5, corso.getId());

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
	public Corso findByPrimaryKey(int id) {
		Connection connection = this.dataSource.getConnection();
		Corso corso = null;
		try {
			PreparedStatement statement;
			String query = "select * from corsi where id = ?";
			statement = connection.prepareStatement(query);
			statement.setInt(1, id);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				corso = new Corso();
				corso.setId(result.getInt("id"));
				corso.setNome(result.getString("nome"));
				corso.setLink(result.getString("link"));	
				corso.setTipo(result.getString("tipo"));
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
		return corso;
	}
	public Corso findByLink(String l) {
		Connection connection = this.dataSource.getConnection();
		Corso corso = null;
		try {
			PreparedStatement statement;
			String query = "select * from corsi where link = ?";
			statement = connection.prepareStatement(query);
			statement.setString(1, l);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				corso = new Corso();
				corso.setId(result.getInt("id"));
				corso.setNome(result.getString("nome"));
				corso.setLink(result.getString("link"));	
				corso.setTipo(result.getString("tipo"));
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
		return corso;
	}


	@Override
	public void delete(Corso corso) {
		Connection connection = this.dataSource.getConnection();
		try {
			String delete = "delete FROM corsi WHERE id = ? ";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setInt(1, corso.getId());
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

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void update(Corso c) {
		// TODO Auto-generated method stub
		
	}

	
	
}
