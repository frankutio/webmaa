/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


package Persistencia.Painel;

import Persistencia.Portal.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import Entidade.Painel.Funcionarios;

public class FuncionariosDAO {

    private static FuncionariosDAO instance = new FuncionariosDAO();

    public static FuncionariosDAO getInstance() {
        return instance;
    }

    private FuncionariosDAO() {
    }

    public int grava(Funcionarios funcionario) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "INSERT INTO funcionarios " +
                        "(nome,uf_codigo,email,telefone,bairro,cidade,dataadmissao" +
                        ",datanascimento,cep,cpf,rg,endereco,cargo,datacadastro,complemento)" +
                        " VALUES (?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?)");
                pstmt.setString(1, funcionario.getNome());
                pstmt.setInt(2, funcionario.getUf());
                pstmt.setString(3, funcionario.getEmail());
                pstmt.setString(4, funcionario.getTelefone());
                pstmt.setString(5, funcionario.getBairro());
                pstmt.setString(6, funcionario.getCidade());
                pstmt.setDate(7, new java.sql.Date(funcionario.getDataAdmissao().getTime()));
                pstmt.setDate(8, new java.sql.Date(funcionario.getDataNascimento().getTime()));
                pstmt.setString(9, funcionario.getCep());
                pstmt.setString(10, funcionario.getCpf());
                pstmt.setString(11, funcionario.getRg());
                pstmt.setString(12, funcionario.getEndereco());
                pstmt.setString(13, funcionario.getCargo());
                pstmt.setDate(14, new java.sql.Date(funcionario.getDataCadastro().getTime()));
                pstmt.setString(15, funcionario.getComplemento());

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

    public List<Funcionarios> leTodos() {

        Statement stmt = null;
        List<Funcionarios> funcionarios = new ArrayList<Funcionarios>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM funcionarios");
                while (rs.next()) {
                    Funcionarios funcionario = new Funcionarios();
                    funcionario.setCodigo(rs.getInt("codigo"));
                    funcionario.setNome(rs.getString("nome"));
                    funcionario.setUf(rs.getInt("uf_codigo"));
                    funcionario.setEmail(rs.getString("email"));
                    funcionario.setTelefone(rs.getString("telefone"));
                    funcionario.setBairro(rs.getString("bairro"));
                    funcionario.setCidade(rs.getString("cidade"));
                    funcionario.setDataAdmissao(rs.getDate("dataadmissao"));
                    funcionario.setDataNascimento(rs.getDate("datanascimento"));
                    funcionario.setCep(rs.getString("cep"));
                    funcionario.setCpf(rs.getString("cpf"));
                    funcionario.setRg(rs.getString("rg"));
                    funcionario.setEndereco(rs.getString("endereco"));
                    funcionario.setCargo(rs.getString("cargo"));
                    funcionario.setDataCadastro(rs.getDate("datacadastro"));
                    funcionario.setComplemento(rs.getString("complemento"));

                    funcionarios.add(funcionario);
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
        return funcionarios;
    }

    public Funcionarios le(String codigo) {

        Statement stmt = null;
        Funcionarios funcionario = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM funcionarios WHERE codigo = " +
                        codigo);
                if (rs.next()) {
                    funcionario = carregaDadosNoObjeto(rs);
                } else {
                    funcionario = null;
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
        return funcionario;

    }

    private Funcionarios carregaDadosNoObjeto(ResultSet rs) throws SQLException {

        Funcionarios funcionario = new Funcionarios();

        funcionario.setCodigo(rs.getInt("codigo"));
        funcionario.setNome(rs.getString("nome"));
        funcionario.setUf(rs.getInt("uf_codigo"));
        funcionario.setEmail(rs.getString("email"));
        funcionario.setTelefone(rs.getString("telefone"));
        funcionario.setBairro(rs.getString("bairro"));
        funcionario.setCidade(rs.getString("cidade"));
        funcionario.setDataAdmissao(rs.getDate("dataadmissao"));
        funcionario.setDataNascimento(rs.getDate("datanascimento"));
        funcionario.setCep(rs.getString("cep"));
        funcionario.setCpf(rs.getString("cpf"));
        funcionario.setRg(rs.getString("rg"));
        funcionario.setEndereco(rs.getString("endereco"));
        funcionario.setCargo(rs.getString("cargo"));
        funcionario.setDataCadastro(rs.getDate("datacadastro"));
        funcionario.setComplemento(rs.getString("complemento"));

        return funcionario;

    }

    public int apaga(int codigo) {

        int n = 0;
        Statement stmt = null;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement();
                n = stmt.executeUpdate(
                        "DELETE FROM funcionarios WHERE codigo = " +
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

    public int altera(Funcionarios funcionario) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE funcionarios SET " +
                        "nome = ?,uf_codigo= ?,email= ?,telefone= ?,bairro= ?,cidade= ?,dataadmissao= ? " +
                        ",datanascimento= ?,cep= ?,cpf= ?,rg= ?,endereco= ?,cargo= ?,datacadastro= ?,complemento= ?" +
                        "WHERE codigo = ?");

                pstmt.setString(1, funcionario.getNome());
                pstmt.setInt(2, funcionario.getUf());
                pstmt.setString(3, funcionario.getEmail());
                pstmt.setString(4, funcionario.getTelefone());
                pstmt.setString(5, funcionario.getBairro());
                pstmt.setString(6, funcionario.getCidade());
                pstmt.setDate(7, new java.sql.Date(funcionario.getDataAdmissao().getTime()));
                pstmt.setDate(8, new java.sql.Date(funcionario.getDataNascimento().getTime()));
                pstmt.setString(9, funcionario.getCep());
                pstmt.setString(10, funcionario.getCpf());
                pstmt.setString(11, funcionario.getRg());
                pstmt.setString(12, funcionario.getEndereco());
                pstmt.setString(13, funcionario.getCargo());
                pstmt.setDate(14, new java.sql.Date(funcionario.getDataCadastro().getTime()));
                pstmt.setString(15, funcionario.getComplemento());
                
                pstmt.setInt(16, funcionario.getCodigo());

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