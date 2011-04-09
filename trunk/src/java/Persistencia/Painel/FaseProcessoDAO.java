/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


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
import Entidade.Painel.FaseProcesso;


public class FaseProcessoDAO {

    //CRIA INSTANCIA DA CLASSE
    private static FaseProcessoDAO instance = new FaseProcessoDAO();

    public static FaseProcessoDAO getInstance() {
        return instance;
    }

    //CONSTRUTOR VAZIO
    private FaseProcessoDAO() {
    }

    //METODO PARA GRAVAR AS INFORMACOES NO BANCO
    public int grava(FaseProcesso faseprocesso) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "INSERT INTO faseprocesso " +
                        "(descricao)" +
                        " VALUES (?)");
                pstmt.setString(1, faseprocesso.getDescricao());

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
    public List<FaseProcesso> leTodos() {

        Statement stmt = null;
        List<FaseProcesso> lstUfs = new ArrayList<FaseProcesso>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM faseprocesso");
                while (rs.next()) {
                    FaseProcesso faseprocesso = new FaseProcesso();
                    faseprocesso.setCodigo(rs.getInt("codigo"));
                    faseprocesso.setDescricao(rs.getString("descricao"));

                    lstUfs.add(faseprocesso);
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
    public FaseProcesso le(int codigo) {

        Statement stmt = null;
        FaseProcesso faseprocesso = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM faseprocesso WHERE codigo = " +
                        codigo);
                if (rs.next()) {
                    faseprocesso = carregaDadosNoObjeto(rs);
                } else {
                    faseprocesso = null;
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
        return faseprocesso;

    }

    //CARREGA A CLASSE
    private FaseProcesso carregaDadosNoObjeto(ResultSet rs) throws SQLException {

        FaseProcesso faseprocesso = new FaseProcesso();
        faseprocesso.setCodigo(rs.getInt("codigo"));
        faseprocesso.setDescricao(rs.getString("descricao"));

        return faseprocesso;

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
                        "DELETE FROM faseprocesso WHERE codigo = " +
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
    public int altera(FaseProcesso faseprocesso) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE faseprocesso SET " +
                        "descricao = ? " +
                        "WHERE codigo = ?");
                pstmt.setString(1, faseprocesso.getDescricao());
                pstmt.setInt(2, faseprocesso.getCodigo());
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