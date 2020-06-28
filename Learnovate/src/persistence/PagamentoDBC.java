package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import persistence.PersistenceException;

public class PagamentoDBC {
	private static DataSource dataSource = new DataSource("jdbc:postgresql://packy.db.elephantsql.com:5432/wuyaorrc", "wuyaorrc", "EMgOBHsV4DKzblEyLERKMF6e5Cc01Y5S");
	public boolean save(String abbonamento, Integer id, Integer mese) {

		
		Connection connection = dataSource.getConnection();
		try {
			int idp = IdBroker.getId(connection);
			String insert = "insert into pagamento( abbonamento, ID_Utente, Mese_pagato, ID) values (?,?,?,?)";
			String update = "UPDATE utente SET premium = 'true' WHERE idutente = "+id+";";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setString(1, abbonamento);
			statement.setInt(2, id);
			statement.setInt(3, mese);
			statement.setInt(4, idp);
			statement.executeUpdate();
			
			statement = connection.prepareStatement(update);
			statement.executeUpdate();
			return true;
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				System.out.println("prob 2");
				throw new PersistenceException(e.getMessage());
			}
		}
	}  
}
