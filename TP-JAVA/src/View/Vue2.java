package View;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Vue2 {

    public static void showView(ResultSet result) throws SQLException {

        try {
            System.out.println("\n\nListe des produits ayant atteint le stock de sécurité : ");

            while (result.next()) {
                //Traitement requête
                String produit = result.getString("nom_prod");
                String stock = result.getString("qte_stock");
                String securite = result.getString("st_secu");
                System.out.println(produit + "\t\t\t" + stock + "\t\t\t" + securite);
            }
        } catch (SQLException se) {
            se.getMessage();
        }

    }
}
