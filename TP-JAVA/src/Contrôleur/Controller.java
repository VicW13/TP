package Contrôleur;

import Modèle.Connexion;
import Modèle.Repository;
import View.Vue1;
import View.Vue2;

import java.sql.*;
import java.util.Properties;

public class Controller {

    public void traiterRequete () {

        Statement stmt1=null, stmt2=null;
        ResultSet rst1=null, rst2=null;

        Properties props = new Properties();
        String url= "jdbc:mysql://localhost:3306/bddrh";
        props.setProperty("user","root");
        props.setProperty("password","");

        Connection conn = null;

        try {

            conn = Connexion.getConnexion(url, props);

            Vue1 vue1 = new Vue1();
            Vue2 vue2 = new Vue2();

            Repository rep1 = new Repository(stmt1);
            Repository rep2 = new Repository(stmt2);

            String req1 = "SELECT* FROM produit p INNER JOIN catégorie c ON p.num_cat = c.num_cat WHERE c.nom_cat = 'Electroménagers' OR c.nom_cat = 'Electroniques' ORDER BY c.nom_cat";
            String req2 = "SELECT* FROM produit WHERE qte_stock = st_secu";

            rst1 = rep1.request(conn, req1);
            rst2 = rep2.request(conn, req2);

            vue1.showView(rst1);
            vue2.showView(rst2);


        }

        catch (SQLException se) {
            se.getMessage();
        }

    }
}

