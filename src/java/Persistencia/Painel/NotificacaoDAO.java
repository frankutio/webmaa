/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Persistencia.Painel;

import Entidade.Painel.Notificacao;
import Persistencia.Portal.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author usuario
 */
public class NotificacaoDAO {
      //CRIA INSTANCIA DA CLASSE
    private static NotificacaoDAO instance = new NotificacaoDAO();

    public static NotificacaoDAO getInstance() {
        return instance;
    }

    //CONSTRUTOR VAZIO
    private NotificacaoDAO() {
    }

    //METODO PARA GRAVAR AS INFORMACOES NO BANCO
    public int grava(Notificacao notificacao) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "INSERT INTO Notificacao (Funcionarios_codigo, Colaborador_codigo, descricao, datacadastro, remetentenotificacao, mensagem) " +
                        " VALUES (?,?,?,?,?,?)");
                pstmt.setInt(1, notificacao.getCodigoFuncionario());
                pstmt.setInt(2, notificacao.getCodigoColaborador());
                pstmt.setString(3, notificacao.getDescricao());
                pstmt.setDate(4,new java.sql.Date(notificacao.getDataCadastro().getTime()));
                pstmt.setString(5, "Sim");
                pstmt.setString(6, notificacao.getMensagem());

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

}
