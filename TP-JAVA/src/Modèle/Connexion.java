package Modèle;

import java.sql.*;
import java.util.*;

public class Connexion {

    public static Connection getConnexion (String url, Properties props) {

        try {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Connection conn = null ;

        try {
            conn = DriverManager.getConnection(url,props) ;
        }
        catch (SQLException e) {
            // Traitement des exceptions
        }
        return conn;

    }
}
