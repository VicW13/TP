package View;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Vue1 {

    public static void showView(ResultSet result) throws SQLException {

        try {
            System.out.println("\n\nListe des produits par catégorie : ");

            while (result.next()) {
                //Traitement requête
                String prod = result.getString("nom_prod");
                String qte = result.getString("qte_stock");
                String prix = result.getString("pu_prod");
                System.out.println(prod + "\t\t\t" + qte + "\t\t\t" + prix);
            }
        } catch (SQLException se) {
            se.getMessage();
        }

    }
}
