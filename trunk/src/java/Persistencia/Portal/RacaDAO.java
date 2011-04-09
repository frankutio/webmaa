package Persistencia.Portal;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Entidade.Portal.Raca;

public class RacaDAO {

   //CRIA INSTANCIA DA CLASSE
    private static RacaDAO instance = new RacaDAO();

    public static RacaDAO getInstance() {
        return instance;
    }

    //CONSTRUTOR VAZIO
    private RacaDAO() {
    }

    //RECUPERA UMA  LISTA DE TODOS OS REGISTRO DO BANCO
    public List<Raca> leTodos() {

        Statement stmt = null;
        List<Raca> lstRaca = new ArrayList<Raca>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM tiporaca");
                while (rs.next()) {
                    Raca raca = new Raca();
                    raca.setCodigo(rs.getInt("codigo"));
                    raca.setDescricao(rs.getString("descricao"));

                    lstRaca.add(raca);
                }
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
                try {
                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    System.out.println(e.getMessage());
                }
            }
        }
        return lstRaca;
    }

}
