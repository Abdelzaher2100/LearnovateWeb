package persistence;

import persistence.dao.CorsoUtenteDao;
import persistence.dao.UtenteDao;

public abstract class DAOFactory {
    public static final int HSQLDB = 1;
    public static final int POSTGRESQL = 2;

    public static DAOFactory getDAOFactory(int whichFactory) {
        switch ( whichFactory ) {
        
        case HSQLDB:
            return null;//new HsqldbDAOFactory();
        case POSTGRESQL:
            return new PostgresDAOFactory();
        default:
            return null;
        }
    }

    public abstract UtenteDao getUtenteDAO();
    public abstract CorsoUtenteDao getCorsoUtenteDAO();
    public abstract CorsoDaoJDBC getCorsoDaoJDBC();
    public abstract UtilDao	getUtilDAO();
}