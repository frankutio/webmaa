package Persistencia.Portal;

import Persistencia.Portal.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Entidade.Portal.Porte;

public class PorteDAO {

    //CRIA INSTANCIA DA CLASSE
    private static PorteDAO instance = new PorteDAO();

    public static PorteDAO getInstance() {
        return instance;
    }

    //CONSTRUTOR VAZIO
    private PorteDAO() {
    }

    //RECUPERA UMA  LISTA DE TODOS OS REGISTRO DO BANCO
    public List<Porte> leTodos() {

        Statement stmt = null;
        List<Porte> lstPortes = new ArrayList<Porte>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM porteanimal");
                while (rs.next()) {
                    Porte porte = new Porte();
                    porte.setCodigo(rs.getInt("codigo"));
                    porte.setPorte(rs.getString("descricao"));

                    lstPortes.add(porte);
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
        return lstPortes;
    }

}
