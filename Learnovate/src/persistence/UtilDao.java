package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UtilDao {

	private DataSource dataSource;
	
	public UtilDao(DataSource dataSource) {
		this.dataSource=dataSource;
	}

	
	// elimina tutte le tabelle create in precedenza
public void dropDatabase(){
	
	Connection connection = dataSource.getConnection();
	try {
		String delete = "drop SEQUENCE if EXISTS sequenza_id;"
				+ "drop table if exists corsi;"
				+ "drop table if exists utente_corsi;"
				+ "drop table if exists pagamento;"
				+ "drop table if exists utente;";
		PreparedStatement statement = connection.prepareStatement(delete);
		
		statement.executeUpdate();
		System.out.println("Drop database eseguito");
		
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

public void createDatabase(){
	
	Connection connection = dataSource.getConnection();
	try {
		
		String create = "create SEQUENCE sequenza_id;"
				+ "create table utente(\"idutente\" bigint primary key, email varchar(255),nome varchar(255),cognome varchar(255),password varchar(255),dataNascita DATE,tipo boolean, premium boolean);"
				+ "create table corsi(\"ID\" bigint primary key,nome varchar(255),descrizione varchar(255),tipo varchar(255),link varchar(255));"
				+ "create table pagamento(\"ID\" bigint primary key,abbonamento varchar(255),Mese_pagato bigint,Data TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,ID_Utente bigint);"
				+ "create table utente_corsi(\"ID\" bigint primary key,id_utente bigint, id_corso bigint,data_aggiunta TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP);";
		PreparedStatement statement = connection.prepareStatement(create);
		
		statement.executeUpdate();
		System.out.println("Creazione database eseguita");
		
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

// elimina tutte le righe delle tabelle create
public  void resetDatabase() {
		
		Connection connection = dataSource.getConnection();
		try {
			String delete = "delete FROM utente";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.executeUpdate();
			
			delete = "delete FROM corsi";
			statement = connection.prepareStatement(delete);
			
			delete = "delete FROM utente_corsi";
			statement = connection.prepareStatement(delete);
			
			delete = "delete FROM pagamento";
			statement = connection.prepareStatement(delete);
			
			
			statement.executeUpdate();
			System.out.println("Reset database eseguito");

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
}

