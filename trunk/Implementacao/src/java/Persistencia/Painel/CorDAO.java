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
import Entidade.Painel.Cor;


public class CorDAO {

    //CRIA INSTANCIA DA CLASSE
    private static CorDAO instance = new CorDAO();

    public static CorDAO getInstance() {
        return instance;
    }

    //CONSTRUTOR VAZIO
    private CorDAO() {
    }

    //METODO PARA GRAVAR AS INFORMACOES NO BANCO
    public int grava(Cor cor) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "INSERT INTO cor " +
                        "(descricao)" +
                        " VALUES (?)");
                pstmt.setString(1, cor.getDescricao());

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
    public List<Cor> leTodos() {

        Statement stmt = null;
        List<Cor> lstUfs = new ArrayList<Cor>();
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
                    cor.setDescricao(rs.getString("descricao"));

                    lstUfs.add(cor);
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
        return lstUfs;
    }

    //RECUPERA UM REGISTRO DO BANCO ATRAVES DO COGIDO
    public Cor le(int codigo) {

        Statement stmt = null;
        Cor cor = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM cor WHERE codigo = " +
                        codigo);
                if (rs.next()) {
                    cor = carregaDadosNoObjeto(rs);
                } else {
                    cor = null;
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
        return cor;

    }

    //CARREGA A CLASSE
    private Cor carregaDadosNoObjeto(ResultSet rs) throws SQLException {

        Cor cor = new Cor();
        cor.setCodigo(rs.getInt("codigo"));
        cor.setDescricao(rs.getString("descricao"));

        return cor;

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
                        "DELETE FROM cor WHERE codigo = " +
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
    public int altera(Cor cor) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE cor SET " +
                        "descricao = ? " +
                        "WHERE codigo = ?");
                pstmt.setString(1, cor.getDescricao());
                pstmt.setInt(2, cor.getCodigo());
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