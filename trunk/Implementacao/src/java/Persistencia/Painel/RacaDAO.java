/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Persistencia.Painel;

/**
 *
 * @author usuario
 */

import Persistencia.Portal.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Entidade.Painel.Raca;


public class RacaDAO {

    //CRIA INSTANCIA DA CLASSE
    private static RacaDAO instance = new RacaDAO();

    public static RacaDAO getInstance() {
        return instance;
    }

    //CONSTRUTOR VAZIO
    private RacaDAO() {
    }

    //METODO PARA GRAVAR AS INFORMACOES NO BANCO
    public int grava(Raca raca) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "INSERT INTO TipoRaca " +
                        "(descricao,especie)" +
                        " VALUES (?,?)");
                pstmt.setString(1, raca.getDescricao());
                pstmt.setBoolean(2, raca.isEspecie());
                
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
                        "SELECT * FROM TipoRaca");
                while (rs.next()) {
                    Raca raca = new Raca();
                    raca.setCodigo(rs.getInt("codigo"));
                    raca.setDescricao(rs.getString("descricao"));
                    raca.setEspecie(rs.getBoolean("especie"));
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

    //RECUPERA UM REGISTRO DO BANCO ATRAVES DO COGIDO
    public Raca le(int codigo) {

        Statement stmt = null;
        Raca raca = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM TipoRaca WHERE codigo = " +
                        codigo);
                if (rs.next()) {
                    raca = carregaDadosNoObjeto(rs);
                } else {
                    raca = null;
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
        return raca;

    }

    //CARREGA A CLASSE
    private Raca carregaDadosNoObjeto(ResultSet rs) throws SQLException {

        Raca raca = new Raca();
        raca.setCodigo(rs.getInt("codigo"));
        raca.setDescricao(rs.getString("descricao"));
        raca.setEspecie(rs.getBoolean("especie"));
        return raca;

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
                        "DELETE FROM TipoRaca WHERE codigo = " +
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
    public int altera(Raca raca) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE TipoRaca SET " +
                        " descricao = ? " +
                        ", especie = ? " +
                        " WHERE codigo = ?");
                pstmt.setString(1, raca.getDescricao());
                pstmt.setInt(3, raca.getCodigo());
                pstmt.setBoolean(2, raca.isEspecie());
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