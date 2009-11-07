/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Persistencia.Painel;

import Persistencia.Painel.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Entidade.Painel.Colaborador;

public class ColaboradorDAO {

    private static ColaboradorDAO instance = new ColaboradorDAO();

    public static ColaboradorDAO getInstance() {
        return instance;
    }

    private ColaboradorDAO() {
    }

    public int grava(Colaborador colaborador) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "INSERT INTO colaborador " +
                        "(nome,uf_codigo,email,telefone,bairro,cidade,numero" +
                        ",datanascimento,cep,cpf,rg,endereco,sexo,datacadastro,complemento,foto,celular)" +
                        " VALUES (?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?,?)");
                pstmt.setString(1, colaborador.getNome());
                pstmt.setInt(2, colaborador.getUf());
                pstmt.setString(3, colaborador.getEmail());
                pstmt.setString(4, colaborador.getTelefone());
                pstmt.setString(5, colaborador.getBairro());
                pstmt.setString(6, colaborador.getCidade());
                pstmt.setInt(7, colaborador.getNumero());
                pstmt.setDate(8, new java.sql.Date(colaborador.getDataNascimento().getTime()));
                pstmt.setString(9, colaborador.getCep());
                pstmt.setString(10, colaborador.getCpf());
                pstmt.setString(11, colaborador.getRg());
                pstmt.setString(12, colaborador.getEndereco());
                pstmt.setBoolean(13, colaborador.getSexo());
                pstmt.setDate(14, new java.sql.Date(colaborador.getDataCadastro().getTime()));
                pstmt.setString(15, colaborador.getComplemento());
                pstmt.setString(16, colaborador.getEndFoto());
                pstmt.setString(17, colaborador.getCelular());

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

    public List<Colaborador> leTodos() {

        Statement stmt = null;
        List<Colaborador> colaboradors = new ArrayList<Colaborador>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM colaborador");
                while (rs.next()) {
                    Colaborador colaborador = new Colaborador();
                    colaborador.setCodigo(rs.getInt("codigo"));
                    colaborador.setNome(rs.getString("nome"));
                    colaborador.setUf(rs.getInt("uf_codigo"));
                    colaborador.setEmail(rs.getString("Email"));
                    colaborador.setTelefone(rs.getString("telefone"));
                    colaborador.setBairro(rs.getString("bairro"));
                    colaborador.setCidade(rs.getString("cidade"));
                    colaborador.setNumero(rs.getInt("numero"));
                    colaborador.setDataNascimento(rs.getDate("datanascimento"));
                    colaborador.setCep(rs.getString("cep"));
                    colaborador.setCpf(rs.getString("cpf"));
                    colaborador.setRg(rs.getString("rg"));
                    colaborador.setEndereco(rs.getString("endereco"));
                    colaborador.setSexo(rs.getBoolean("sexo"));
                    colaborador.setDatacadastro(rs.getDate("datacadastro"));
                    colaborador.setComplemento(rs.getString("complemento"));
                    colaborador.setEndFoto(rs.getString("foto"));
                    colaborador.setCelular(rs.getString("celular"));

                    colaboradors.add(colaborador);
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
        return colaboradors;
    }

    public Colaborador le(String codigo) {

        Statement stmt = null;
        Colaborador colaborador = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM colaborador WHERE codigo = " +
                        codigo);
                if (rs.next()) {
                    colaborador = carregaDadosNoObjeto(rs);
                } else {
                    colaborador = null;
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
        return colaborador;

    }

    private Colaborador carregaDadosNoObjeto(ResultSet rs) throws SQLException {

        Colaborador colaborador = new Colaborador();

        colaborador.setCodigo(rs.getInt("codigo"));
        colaborador.setNome(rs.getString("nome"));
        colaborador.setUf(rs.getInt("uf_codigo"));
        colaborador.setEmail(rs.getString("Email"));
        colaborador.setTelefone(rs.getString("telefone"));
        colaborador.setBairro(rs.getString("bairro"));
        colaborador.setCidade(rs.getString("cidade"));
        colaborador.setNumero(rs.getInt("numero"));
        colaborador.setDataNascimento(rs.getDate("datanascimento"));
        colaborador.setCep(rs.getString("cep"));
        colaborador.setCpf(rs.getString("cpf"));
        colaborador.setRg(rs.getString("rg"));
        colaborador.setEndereco(rs.getString("endereco"));
        colaborador.setSexo(rs.getBoolean("sexo"));
        colaborador.setDatacadastro(rs.getDate("datacadastro"));
        colaborador.setComplemento(rs.getString("complemento"));
        colaborador.setEndFoto(rs.getString("foto"));
        colaborador.setCelular(rs.getString("celular"));

        return colaborador;

    }

    public int apaga(int codigo) {

        int n = 0;
        Statement stmt = null;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement();
                n = stmt.executeUpdate(
                        "DELETE FROM colaborador WHERE codigo = " +
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

    public int altera(Colaborador colaborador) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE colaborador SET " +
                        "nome = ?,uf_codigo= ?,email= ?,telefone= ?,bairro= ?,cidade= ?,numero= ? " +
                        ",datanascimento= ?,cep= ?,cpf= ?,rg= ?,endereco= ?,sexo= ?,datacadastro= ?,complemento= ?" +
                        ",foto= ?,celular= ? " +
                        "WHERE codigo = ?");

                 pstmt.setString(1, colaborador.getNome());
                pstmt.setInt(2, colaborador.getUf());
                pstmt.setString(3, colaborador.getEmail());
                pstmt.setString(4, colaborador.getTelefone());
                pstmt.setString(5, colaborador.getBairro());
                pstmt.setString(6, colaborador.getCidade());
                pstmt.setInt(7, colaborador.getNumero());
                pstmt.setDate(8, new java.sql.Date(colaborador.getDataNascimento().getTime()));
                pstmt.setString(9, colaborador.getCep());
                pstmt.setString(10, colaborador.getCpf());
                pstmt.setString(11, colaborador.getRg());
                pstmt.setString(12, colaborador.getEndereco());
                pstmt.setBoolean(13, colaborador.getSexo());
                pstmt.setDate(14, new java.sql.Date(colaborador.getDataCadastro().getTime()));
                pstmt.setString(15, colaborador.getComplemento());
                pstmt.setString(16, colaborador.getEndFoto());
                pstmt.setString(17, colaborador.getCelular());
                pstmt.setInt(18, colaborador.getCodigo());

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