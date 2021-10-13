import Contrôleur.Controller;

import java.sql.SQLException;

public class Traitement {

    public static void main(String[] args) throws SQLException {
        Controller ctrl1 = new Controller();
        ctrl1.traiterRequete();
    }
}
