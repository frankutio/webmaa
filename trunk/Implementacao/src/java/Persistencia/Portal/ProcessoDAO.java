
package Persistencia.Portal;

import Entidade.Portal.Processo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class ProcessoDAO {

    private static ProcessoDAO instance = new ProcessoDAO();

    private ProcessoDAO() {
    }

    public static ProcessoDAO getInstance() {
        return instance;
    }

    public int grava(Processo processo) {
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn == null) return -1;
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(
                    "INSERT INTO processo (FaseProcesso_codigo, Animais_codigo," +
                    "   Colaborador_codigo, dataprocesso, datacadastro, codigostatus)" +
                    "VALUES (?, ?, ?, ?, ?, ?)");
            pstmt.setInt(1, processo.getFaseProcesso());
            pstmt.setInt(2, processo.getCodigoAnimal());
            pstmt.setInt(3, processo.getCodigoColaborador());
            pstmt.setDate(4, new java.sql.Date(processo.getDataProcesso().getTime()));
            pstmt.setDate(5, new java.sql.Date(processo.getDataCadastro().getTime()));
            pstmt.setString(6, processo.getStatus());
            pstmt.execute();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Inclusao Falhou!!!\n" + e.getMessage());
        }
        return 0;
    }

    public int altera(Processo processo) {
        
        return 0;
    }

}
