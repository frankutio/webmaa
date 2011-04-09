package Persistencia.Portal;

import Persistencia.Portal.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Entidade.Portal.Pelagem;

public class PelagemDAO {

     //CRIA INSTANCIA DA CLASSE
    private static PelagemDAO instance = new PelagemDAO();

    public static PelagemDAO getInstance() {
        return instance;
    }

    //CONSTRUTOR VAZIO
    private PelagemDAO() {
    }
    
     //RECUPERA UMA  LISTA DE TODOS OS REGISTRO DO BANCO
    public List<Pelagem> leTodos() {

        Statement stmt = null;
        List<Pelagem> lstPelagem = new ArrayList<Pelagem>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM tipopelo");
                while (rs.next()) {
                    Pelagem pelagem = new Pelagem();
                    pelagem.setCodigo(rs.getInt("codigo"));
                    pelagem.setPelagem(rs.getString("descricao"));

                    lstPelagem.add(pelagem);
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
        return lstPelagem;
    }


}
