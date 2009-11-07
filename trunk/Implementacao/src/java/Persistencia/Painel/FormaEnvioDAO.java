/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Persistencia.Painel;

/**
 *
 * @author usuario
 */

import Persistencia.Painel.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Entidade.Painel.FormaEnvio;


public class FormaEnvioDAO {

    //CRIA INSTANCIA DA CLASSE
    private static FormaEnvioDAO instance = new FormaEnvioDAO();

    public static FormaEnvioDAO getInstance() {
        return instance;
    }

    //CONSTRUTOR VAZIO
    private FormaEnvioDAO() {
    }

    //METODO PARA GRAVAR AS INFORMACOES NO BANCO
    public int grava(FormaEnvio formaEnvio) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "INSERT INTO TipoFormaEnvio " +
                        "(descricao)" +
                        " VALUES (?)");
                pstmt.setString(1, formaEnvio.getDescricao());
                System.out.println("Controle descricao 2: " + formaEnvio.getDescricao());
                pstmt.execute();
                System.out.println("JA FEZ");
            } catch (SQLException e) {
                System.out.println("Inclusao Falhou!!!\n" + e.getMessage());
            } finally {
                try {
                    if (pstmt != null) {
                        pstmt.close();
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

    //RECUPERA UMA  LISTA DE TODOS OS REGISTRO DO BANCO
    public List<FormaEnvio> leTodos() {

        Statement stmt = null;
        List<FormaEnvio> lstFormaEnvios = new ArrayList<FormaEnvio>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM TipoFormaEnvio");
                while (rs.next()) {
                    FormaEnvio formaEnvio = new FormaEnvio();
                    formaEnvio.setCodigo(rs.getInt("codigo"));
                    formaEnvio.setdescricao(rs.getString("descricao"));
                    
                    lstFormaEnvios.add(formaEnvio);
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
        return lstFormaEnvios;
    }

    //RECUPERA UM REGISTRO DO BANCO ATRAVES DO COGIDO
    public FormaEnvio le(int codigo) {

        Statement stmt = null;
        FormaEnvio formaEnvio = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM TipoFormaEnvio WHERE codigo = " +
                        codigo);
                if (rs.next()) {
                    formaEnvio = carregaDadosNoObjeto(rs);
                } else {
                    formaEnvio = null;
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
        return formaEnvio;

    }

    //CARREGA A CLASSE
    private FormaEnvio carregaDadosNoObjeto(ResultSet rs) throws SQLException {

        FormaEnvio formaEnvio = new FormaEnvio();
        formaEnvio.setCodigo(rs.getInt("codigo"));
        formaEnvio.setdescricao(rs.getString("descricao"));
        
        return formaEnvio;

    }

    //METODO PARA DELETAR OS REGISTROS DO BANCO
    public int apaga(int codigo) {

        int n = 0;
        Statement stmt = null;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement();
                n = stmt.executeUpdate(
                        "DELETE FROM TipoFormaEnvio WHERE codigo = " +
                        codigo);
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

    //METODO PARA ALTERAR OS DADOS
    public int altera(FormaEnvio formaEnvio) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE TipoFormaEnvio SET " +
                        "descricao = ? " +
                        "WHERE codigo = ?");
                pstmt.setString(1, formaEnvio.getDescricao());
                pstmt.setInt(2, formaEnvio.getCodigo());
                n = pstmt.executeUpdate();
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
                try {
                    if (pstmt != null) {
                        pstmt.close();
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