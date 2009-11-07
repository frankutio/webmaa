
package Persistencia.Portal;

import Entidade.Portal.Colaborador;
import Entidade.Portal.Processo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class ProcessoDAO {

    private static ProcessoDAO instance = new ProcessoDAO();

    private ProcessoDAO() {
    }

    public static ProcessoDAO getInstance() {
        return instance;
    }

    public void grava(Processo processo) throws Exception {
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn == null) {
            throw new Exception("Não foi possível abrir conexão com o banco");
        }
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
            throw new Exception(e);
        }
    }

    public int altera(Processo processo) {
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn == null) return -1;
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(
                    "UPDATE processo" +
                    "SET FaseProcesso_codigo = ?, Animais_codigo = ?," +
                    "   Colaborador_codigo = ?, dataprocesso = ?, datacadastro = ?," +
                    "   codigostatus = ?, avaliacao = ?, descricaoavaliacao = ?," +
                    "   notaavaliacao = ?" +
                    "WHERE Codigo = ?");
            pstmt.setInt(1, processo.getFaseProcesso());
            pstmt.setInt(2, processo.getCodigoAnimal());
            pstmt.setInt(3, processo.getCodigoColaborador());
            pstmt.setDate(4, new java.sql.Date(processo.getDataProcesso().getTime()));
            pstmt.setDate(5, new java.sql.Date(processo.getDataCadastro().getTime()));
            pstmt.setString(6, processo.getStatus());
            pstmt.setString(7, processo.getAvaliacao());
            pstmt.setString(8, processo.getDescricaoAvaliacao());
            pstmt.setString(9, processo.getNotaAvaliacao());
            pstmt.setInt(10, processo.getCodigo());
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Processo> recuperaDoacoes(Colaborador colaborador) {
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn == null) return null;
        List<Processo> processos = new ArrayList<Processo>();
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(
                    "SELECT *" +
                    "FROM processo, animais" +
                    "WHERE processo.animais_codigo = animais.codigo" +
                    "   AND animais.Colaborador_codigo = ?" +
                    "   AND processo.codigostatus = 'Sim'");
            pstmt.setInt(1, colaborador.getCodigo());
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Processo processo = new Processo();
                processo.setCodigo(rs.getInt(1));
                processo.setFaseProcesso(rs.getInt(2));
                processo.setCodigoColaborador(rs.getInt(3));
                processo.setDataProcesso(new Date(rs.getDate(4).getTime()));
                processo.setDataCadastro(new Date(rs.getDate(5).getTime()));
                processo.setStatus(rs.getString(6));
                processo.setAvaliacao(rs.getString(7));
                processo.setDescricaoAvaliacao(rs.getString(8));
                processo.setNotaAvaliacao(rs.getString(9));
                processos.add(processo);
            }
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return processos;
    }

}
