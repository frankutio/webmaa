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
import Entidade.Painel.PorteAnimal;


public class PorteAnimalDAO {

    //CRIA INSTANCIA DA CLASSE
    private static PorteAnimalDAO instance = new PorteAnimalDAO();

    public static PorteAnimalDAO getInstance() {
        return instance;
    }

    //CONSTRUTOR VAZIO
    private PorteAnimalDAO() {
    }

    //METODO PARA GRAVAR AS INFORMACOES NO BANCO
    public int grava(PorteAnimal porteAnimal) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "INSERT INTO PorteAnimal " +
                        "(descricao)" +
                        " VALUES (?)");
                pstmt.setString(1, porteAnimal.getDescricao());
              
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
    public List<PorteAnimal> leTodos() {

        Statement stmt = null;
        List<PorteAnimal> lstPorteAnimals = new ArrayList<PorteAnimal>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM PorteAnimal");
                while (rs.next()) {
                    PorteAnimal porteAnimal = new PorteAnimal();
                    porteAnimal.setCodigo(rs.getInt("codigo"));
                    porteAnimal.setDescricao(rs.getString("descricao"));

                    lstPorteAnimals.add(porteAnimal);
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
        return lstPorteAnimals;
    }

    //RECUPERA UM REGISTRO DO BANCO ATRAVES DO COGIDO
    public PorteAnimal le(int codigo) {

        Statement stmt = null;
        PorteAnimal porteAnimal = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM PorteAnimal WHERE codigo = " +
                        codigo);
                if (rs.next()) {
                    porteAnimal = carregaDadosNoObjeto(rs);
                } else {
                    porteAnimal = null;
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
        return porteAnimal;

    }

    //CARREGA A CLASSE
    private PorteAnimal carregaDadosNoObjeto(ResultSet rs) throws SQLException {

        PorteAnimal porteAnimal = new PorteAnimal();
        porteAnimal.setCodigo(rs.getInt("codigo"));
        porteAnimal.setDescricao(rs.getString("descricao"));

        return porteAnimal;

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
                        "DELETE FROM PorteAnimal WHERE codigo = " +
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
    public int altera(PorteAnimal porteAnimal) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE PorteAnimal SET " +
                        "descricao = ? " +
                        "WHERE codigo = ?");
                pstmt.setString(1, porteAnimal.getDescricao());
                pstmt.setInt(2, porteAnimal.getCodigo());
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