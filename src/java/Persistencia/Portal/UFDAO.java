package Persistencia.Portal;

import Persistencia.Portal.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Entidade.Portal.UF;


public class UFDAO {

    //CRIA INSTANCIA DA CLASSE
    private static UFDAO instance = new UFDAO();

    public static UFDAO getInstance() {
        return instance;
    }

    //CONSTRUTOR VAZIO
    private UFDAO() {
    }

    //METODO PARA GRAVAR AS INFORMACOES NO BANCO
    public int grava(UF uf) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "INSERT INTO uf " +
                        "(uf)" +
                        " VALUES (?)");
                pstmt.setString(1, uf.getUF());

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
    public List<UF> leTodos() {

        Statement stmt = null;
        List<UF> lstUfs = new ArrayList<UF>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM uf");
                while (rs.next()) {
                    UF uf = new UF();
                    uf.setCodigo(rs.getInt("codigo"));
                    uf.setUF(rs.getString("UF"));

                    lstUfs.add(uf);
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
    public UF le(int codigo) {

        Statement stmt = null;
        UF uf = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM uf WHERE codigo = " +
                        codigo);
                if (rs.next()) {
                    uf = carregaDadosNoObjeto(rs);
                } else {
                    uf = null;
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
        return uf;

    }

    //CARREGA A CLASSE
    private UF carregaDadosNoObjeto(ResultSet rs) throws SQLException {

        UF uf = new UF();
        uf.setCodigo(rs.getInt("codigo"));
        uf.setUF(rs.getString("descricao"));

        return uf;

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
                        "DELETE FROM uf WHERE codigo = " +
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
    public int altera(UF uf) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE uf SET " +
                        "descricao = ? " +
                        "WHERE codigo = ?");
                pstmt.setString(1, uf.getUF());
                pstmt.setInt(2, uf.getCodigo());
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