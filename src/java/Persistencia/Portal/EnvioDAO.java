package Persistencia.Portal;

import Persistencia.Portal.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Entidade.Portal.TipoEnvio;

public class EnvioDAO {

    //CRIA INSTANCIA DA CLASSE
    private static EnvioDAO instance = new EnvioDAO();

    public static EnvioDAO getInstance() {
        return instance;
    }

    //CONSTRUTOR VAZIO
    private EnvioDAO() {
    }

    //RECUPERA UMA  LISTA DE TODOS OS REGISTRO DO BANCO
    public List<TipoEnvio> leTodos() {

        Statement stmt = null;
        List<TipoEnvio> lstEnvio = new ArrayList<TipoEnvio>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM tipoformaenvio");
                while (rs.next()) {
                    TipoEnvio envio = new TipoEnvio();
                    envio.setCodigo(rs.getInt("codigo"));
                    envio.setEnvio(rs.getString("descricao"));

                    lstEnvio.add(envio);
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
        return lstEnvio;
    }
}
