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
import Entidade.Painel.Pelagem;


public class PelagemDAO {

    //CRIA INSTANCIA DA CLASSE
    private static PelagemDAO instance = new PelagemDAO();

    public static PelagemDAO getInstance() {
        return instance;
    }

    //CONSTRUTOR VAZIO
    private PelagemDAO() {
    }

    //METODO PARA GRAVAR AS INFORMACOES NO BANCO
    public int grava(Pelagem pelagem) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "INSERT INTO TipoPelo " +
                        "(descricao)" +
                        " VALUES (?)");
                pstmt.setString(1, pelagem.getDescricao());
                
                pstmt.execute();
                
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
    public List<Pelagem> leTodos() {

        Statement stmt = null;
        List<Pelagem> lstPelagems = new ArrayList<Pelagem>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM TipoPelo");
                while (rs.next()) {
                    Pelagem pelagem = new Pelagem();
                    pelagem.setCodigo(rs.getInt("codigo"));
                    pelagem.setDescricao(rs.getString("descricao"));

                    lstPelagems.add(pelagem);
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
        return lstPelagems;
    }

    //RECUPERA UM REGISTRO DO BANCO ATRAVES DO COGIDO
    public Pelagem le(int codigo) {

        Statement stmt = null;
        Pelagem pelagem = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM TipoPelo WHERE codigo = " +
                        codigo);
                if (rs.next()) {
                    pelagem = carregaDadosNoObjeto(rs);
                } else {
                    pelagem = null;
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
        return pelagem;

    }

    //CARREGA A CLASSE
    private Pelagem carregaDadosNoObjeto(ResultSet rs) throws SQLException {

        Pelagem pelagem = new Pelagem();
        pelagem.setCodigo(rs.getInt("codigo"));
        pelagem.setDescricao(rs.getString("descricao"));

        return pelagem;

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
                        "DELETE FROM TipoPelo WHERE codigo = " +
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
    public int altera(Pelagem pelagem) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE TipoPelo SET " +
                        "descricao = ? " +
                        "WHERE codigo = ?");
                pstmt.setString(1, pelagem.getDescricao());
                pstmt.setInt(2, pelagem.getCodigo());
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