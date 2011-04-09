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
/**
 *
 * @author usuario
 */
public class LoginDAO {
private static LoginDAO instance = new LoginDAO();

    public static LoginDAO getInstance() {
        return instance;
    }

    private LoginDAO() {
    }
    
   public Funcionarios le(String email, String cpf) {

        Statement stmt = null;
        Funcionarios funcionario = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM funcionarios WHERE email = '" +
                        email + "' and cpf = '" + cpf + "'");
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

}
