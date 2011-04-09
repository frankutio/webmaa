package Persistencia.Portal;

import Persistencia.Portal.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Entidade.Portal.Cor;

public class CorDAO {

    //CRIA INSTANCIA DA CLASSE
    private static CorDAO instance = new CorDAO();

    public static CorDAO getInstance() {
        return instance;
    }

    //CONSTRUTOR VAZIO
    private CorDAO() {
    }

    //RECUPERA UMA  LISTA DE TODOS OS REGISTRO DO BANCO
    public List<Cor> leTodos() {

        Statement stmt = null;
        List<Cor> lstCores = new ArrayList<Cor>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM cor");
                while (rs.next()) {
                    Cor cor = new Cor();
                    cor.setCodigo(rs.getInt("codigo"));
                    cor.setCor(rs.getString("descricao"));

                    lstCores.add(cor);
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
        return lstCores;
    }

}
