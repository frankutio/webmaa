package Persistencia.Portal;

import Persistencia.Portal.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Entidade.Portal.Notificacao;

public class NotificacaoDAO {

    //CRIA INSTANCIA DA CLASSE
    private static NotificacaoDAO instance = new NotificacaoDAO();

    public static NotificacaoDAO getInstance() {
        return instance;
    }

    //CONSTRUTOR VAZIO
    private NotificacaoDAO() {

    }


    //RECUPERA UMA  LISTA DE TODOS OS REGISTRO DO BANCO
    public List<Notificacao> carregaMsg(int codigoColaborador) {

        Statement stmt = null;
        List<Notificacao> lstMsg = new ArrayList<Notificacao>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM notificacao " +
                        "WHERE Colaborador_codigo =" +
                        codigoColaborador + " ");
                while (rs.next()) {
                    Notificacao msg = new Notificacao();
                    msg.setCodigo(rs.getInt("codigo"));
                    msg.setCodigoColaborador(rs.getInt("Colaborador_codigo"));
                    msg.setAssunto(rs.getString("descricao"));
                    msg.setRemetenteNotificacao(rs.getString("remetentenotificacao"));
                    msg.setMensagem(rs.getString("mensagem"));
                    

                    lstMsg.add(msg);
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
        return lstMsg;
    }

    /* public Notificacao carregaMsg(int codigoColaborador) {

        Statement stmt = null;
        Notificacao msg = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM notificacao " +
                        "WHERE Colaborador_codigo =" +
                        codigoColaborador + " ");
                if (rs.next()) {
                    msg = carregaDadosNoObjeto(rs);
                } else {
                    msg = null;
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
         return msg;

    } */

    public Notificacao leMsg(int codigo) {

        Statement stmt = null;
        Notificacao msg = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                       " SELECT * FROM notificacao WHERE codigo ="+
                       codigo + "");
                if (rs.next()) {
                    msg = carregaDadosNoObjeto(rs);
                } else {
                    msg = null;
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
         return msg;

    }

    private Notificacao carregaDadosNoObjeto(ResultSet rs) throws SQLException {

        Notificacao msg = new Notificacao();

        msg.setCodigo(rs.getInt("codigo"));
        msg.setCodigoColaborador(rs.getInt("Colaborador_codigo"));
        msg.setAssunto(rs.getString("descricao"));
        msg.setRemetenteNotificacao(rs.getString("remetentenotificacao"));
        msg.setMensagem(rs.getString("mensagem"));

        return msg;

    }

    //METODO PARA DELETAR OS REGISTROS DO BANCO
    public int apaga(int codigoMsg) {

        int n = 0;
        Statement stmt = null;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement();
                n = stmt.executeUpdate(
                        "DELETE FROM notificacao WHERE codigo = " +
                        codigoMsg);
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
        return n;

    }

}
