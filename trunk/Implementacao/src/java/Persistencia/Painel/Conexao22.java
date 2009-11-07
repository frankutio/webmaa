package Persistencia.Painel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao22 {

    private static Conexao22 instance = new Conexao22();

    public static Conexao22 getInstance() {
        return instance;
    }

    private Conexao22() {
    }

    public Connection criaConexao() {

        //String driver = "org.apache.derby.jdbc.ClientDriver";
        //String strConexao = "jdbc:derby://localhost:1527/2008AulaLP5Anhanguera";
        String driver = "org.gjt.mm.mysql.Driver";
        String strConexao = "jdbc:mysql://localhost/bdmaa";
        String usuario = "root";
        String senha = "";

        Connection conn = null;

        try {
            Class.forName(driver);
            System.out.println("Driver registrado.");
            conn = DriverManager.getConnection(strConexao, usuario, senha);
            System.out.println("Conexão efetuada.");
        } catch (ClassNotFoundException ex) {
            System.out.println("Driver do banco nao encontrado.");
        } catch (SQLException ex) {
            System.out.print("Erro ao obter conexao: " + ex.getMessage());
        }

        return conn;

    }

}
