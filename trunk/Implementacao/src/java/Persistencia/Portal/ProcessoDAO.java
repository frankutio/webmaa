
package Persistencia.Portal;

import Entidade.Portal.Animais;
import Entidade.Portal.Processo;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
            System.out.println("Não conectou.");
            throw new Exception("Não foi possível abrir conexão com o banco");
        }
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(
                    "INSERT INTO processo (FaseProcesso_codigo, Animais_codigo," +
                    "   Colaborador_codigo, dataprocesso, datacadastro, codigostatus, mensagem, status_avaliacao)" +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            pstmt.setInt(1, processo.getFaseProcesso());
            pstmt.setInt(2, processo.getCodigoAnimal());
            pstmt.setInt(3, processo.getCodigoColaborador());
            pstmt.setDate(4, new java.sql.Date(processo.getDataProcesso().getTime()));
            pstmt.setDate(5, new java.sql.Date(processo.getDataCadastro().getTime()));
            pstmt.setString(6, processo.getStatus());
            pstmt.setString(7, processo.getMensagem());
            pstmt.setString(8, "Pendente");
            
            pstmt.execute();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Não executou a query.");
            throw new Exception(e);
        }
    }

    

    /**
     * Fornece a lista dos seus animais que têm processos de adoção abertos.
     * @param codigoColaborador O código do colaborador que tem animais sendo doados
     * @return A lista de animais que têm alguém querendo adotar ou <a>null</a>
     */
    public List<Animais> recuperaAnimais(int codigoColaborador) {
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn == null) return null;
        List<Animais> animais = new ArrayList<Animais>();
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(
                    "SELECT distinct animais.* " +
                    "FROM processo, animais " +
                    "WHERE processo.animais_codigo = animais.codigo " +
                    "   AND animais.Colaborador_codigo = ? " +
                    "   AND processo.codigostatus = 'Sim' ");
            pstmt.setInt(1, codigoColaborador);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Animais animal = new Animais();
                animal.setCodigo(rs.getInt("codigo"));
                animal.setCor2(rs.getInt("Cor_SegCor"));
                animal.setCor1(rs.getInt("Cor_codigo"));
                animal.setCodigoPelagem(rs.getInt("TipoPelo_codigo"));
                animal.setPorte(rs.getInt("PorteAnimal_codigo"));
                animal.setCodigoRaca(rs.getInt("TipoRaca_codigo"));
                animal.setSexo(rs.getString("sexo"));
                animal.setdescricao(rs.getString("descricao"));
                animal.setEndFoto(rs.getString("foto"));
                animal.setDataCadastro(rs.getDate("datacadastro"));
                animal.setIdade(rs.getInt("idade"));
                animal.setNome(rs.getString("nome"));
                animal.setVacinado(rs.getString("vacinado"));
                animal.setdescricaoVacina(rs.getString("descricaovacinas"));
                animal.setLaudoVeterinario(rs.getString("laudoveterinario"));
                animal.setLocalAnimal(rs.getString("localanimal"));
                animal.setEspecie(rs.getString("tipoespecie"));
                animal.setCodigoFormaEnvio(rs.getInt("TipoFormaEnvio_codigo"));
                animal.setCodigoUsuario(rs.getInt("Colaborador_codigo"));
                animais.add(animal);
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (animais.size() > 0) return animais;
        else return null;
    }


    public Processo recuperaProcessos(int codigoAnimal) {

        Statement stmt = null;
        Processo processo = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                       " SELECT * FROM processo WHERE Animais_codigo="+
                       codigoAnimal + "");
                if (rs.next()) {
                    processo = carregaDadosNoObjeto(rs);
                    
                } else {
                    processo = null;
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
         return processo;

    }

    private Processo carregaDadosNoObjeto(ResultSet rs) throws SQLException {

        Processo processo = new Processo();

        processo.setCodigo(rs.getInt("codigo"));
        processo.setFaseProcesso(rs.getInt("FaseProcesso_codigo"));
        processo.setCodigoAnimal(rs.getInt("Animais_codigo"));
        processo.setCodigoColaborador(rs.getInt("Colaborador_codigo"));
        processo.setDataProcesso(rs.getDate("dataprocesso"));
        processo.setDataCadastro(rs.getDate("datacadastro"));
        processo.setStatus(rs.getString("codigostatus"));
        processo.setAvaliacao(rs.getString("avaliacao"));
        processo.setDescricaoAvaliacao(rs.getString("descricaoavaliacao"));
        processo.setNotaAvaliacao(rs.getString("notaavaliacao"));
        processo.setMensagem(rs.getString("mensagem"));
        processo.setEntregaAnimal(rs.getString("entrega_animal"));
        processo.setStatusAvaliacao(rs.getString("status_avaliacao"));
        
        return processo;

    }
    

    public Processo leProcesso(int codigoProcesso) {
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn == null) return null;
        Processo processo = null;
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("" +
                    "SELECT * " +
                    "FROM processo " +
                    "WHERE codigo = ? ");

            pstmt.setInt(1, codigoProcesso);
            
            ResultSet rs = pstmt.executeQuery();
            if (rs.last()) {
                processo = new Processo();
                processo.setCodigo(rs.getInt(1));
                processo.setFaseProcesso(rs.getInt(2));
                processo.setCodigoAnimal(rs.getInt(3));
                processo.setCodigoColaborador(rs.getInt(4));
                processo.setDataProcesso(rs.getDate(5));
                processo.setDataCadastro(rs.getDate(6));
                processo.setStatus(rs.getString(7));
                processo.setAvaliacao(rs.getString(8));
                processo.setDescricaoAvaliacao(rs.getString(9));
                processo.setNotaAvaliacao(rs.getString(10));
                processo.setMensagem(rs.getString(11));
                processo.setEntregaAnimal(rs.getString(12));
                processo.setStatusAvaliacao(rs.getString(13));
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return processo;
    }

    /**
     * Retorna o processo do animal que você está adotando.
     * @param codigoColaborador O código do colaborador que está adotando um animal
     * @return O processo referente a essa adoção ou <a>null</a>
     */

   public List<Animais> recuperaAdocao(int codigoColaborador) {
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn == null) return null;
        List<Animais> animais = new ArrayList<Animais>();
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(
                    "SELECT distinct animais.* " +
                    "FROM processo, animais " +
                    "WHERE processo.animais_codigo = animais.codigo " +
                    "   AND processo.Colaborador_codigo = ? " +
                    "   AND processo.codigostatus = 'Sim' ");
            pstmt.setInt(1, codigoColaborador);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Animais animal = new Animais();
                animal.setCodigo(rs.getInt("codigo"));
                animal.setCor2(rs.getInt("Cor_SegCor"));
                animal.setCor1(rs.getInt("Cor_codigo"));
                animal.setCodigoPelagem(rs.getInt("TipoPelo_codigo"));
                animal.setPorte(rs.getInt("PorteAnimal_codigo"));
                animal.setCodigoRaca(rs.getInt("TipoRaca_codigo"));
                animal.setSexo(rs.getString("sexo"));
                animal.setdescricao(rs.getString("descricao"));
                animal.setEndFoto(rs.getString("foto"));
                animal.setDataCadastro(rs.getDate("datacadastro"));
                animal.setIdade(rs.getInt("idade"));
                animal.setNome(rs.getString("nome"));
                animal.setVacinado(rs.getString("vacinado"));
                animal.setdescricaoVacina(rs.getString("descricaovacinas"));
                animal.setLaudoVeterinario(rs.getString("laudoveterinario"));
                animal.setLocalAnimal(rs.getString("localanimal"));
                animal.setEspecie(rs.getString("tipoespecie"));
                animal.setCodigoFormaEnvio(rs.getInt("TipoFormaEnvio_codigo"));
                animal.setCodigoUsuario(rs.getInt("Colaborador_codigo"));
                animais.add(animal);
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (animais.size() > 0) return animais;
        else return null;
    }

   public Processo detalhaProcessoAdocao(int codigo) {

        Statement stmt = null;
        Processo processo = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                       "SELECT * FROM processo WHERE Animais_codigo="+
                       codigo + "");
                if (rs.next()) {
                    processo = carregaDadosNoObjeto(rs);
                } else {
                    processo = null;
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
         return processo;

    }
    
    
    // ALTERAÇÃO DAS FASES DP PROCESSO.

    public int alteraFase(Processo processo) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE processo SET " +
                        "FaseProcesso_codigo = ? " +
                        "WHERE codigo = ?");

                    pstmt.setInt(1, processo.getFaseProcesso());
                    pstmt.setInt(2, processo.getCodigo());

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

    // VERIFICA SE TEM PROCESSO FINALIZADO e com pendencia de avaliação

    public List<Processo> avaliacaoAcompanha(int codigo){

        Statement stmt = null;
        List<Processo> lstProcesso = new ArrayList<Processo>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM processo WHERE" +
                        " Colaborador_codigo="+codigo+ 
                       " and codigostatus='Nao' "+
                       "and status_avaliacao='Pendente'");

                while (rs.next()) {
                    Processo proc = new Processo();
                    
                    proc.setCodigo(rs.getInt("codigo"));
                    proc.setFaseProcesso(rs.getInt("FaseProcesso_codigo"));
                    proc.setCodigoAnimal(rs.getInt("Animais_codigo"));
                    proc.setCodigoColaborador(rs.getInt("Colaborador_codigo"));
                    proc.setDataProcesso(rs.getDate("dataprocesso"));
                    proc.setDataCadastro(rs.getDate("datacadastro"));
                    proc.setStatus(rs.getString("codigostatus"));
                    proc.setAvaliacao(rs.getString("avaliacao"));
                    proc.setDescricaoAvaliacao(rs.getString("descricaoavaliacao"));
                    proc.setNotaAvaliacao(rs.getString("notaavaliacao"));
                    proc.setMensagem(rs.getString("mensagem"));
                    proc.setEntregaAnimal(rs.getString("entrega_animal"));
                    proc.setStatusAvaliacao(rs.getString("status_avaliacao"));
                    

                    lstProcesso.add(proc);
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
        } return lstProcesso;
    }        
       

    /*************************************************************************
     *********** VERIFICA SE TEM PROCESSOS FINALIZADOS PARA AVALIAÇÃO*********
     *************************************************************************/

    public List<Animais> recuperaProcessosAvaliacao(int codigoColaborador) {
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn == null) return null;
        List<Animais> animais = new ArrayList<Animais>();
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(
                    "SELECT distinct animais.* " +
                    "FROM processo, animais " +
                    "WHERE processo.animais_codigo = animais.codigo " +
                    " AND processo.Colaborador_codigo = ? " +
                    " AND processo.codigostatus = 'Nao'" +
                    " AND status_avaliacao='Pendente'");
            pstmt.setInt(1, codigoColaborador);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Animais animal = new Animais();
                animal.setCodigo(rs.getInt("codigo"));
                animal.setCor2(rs.getInt("Cor_SegCor"));
                animal.setCor1(rs.getInt("Cor_codigo"));
                animal.setCodigoPelagem(rs.getInt("TipoPelo_codigo"));
                animal.setPorte(rs.getInt("PorteAnimal_codigo"));
                animal.setCodigoRaca(rs.getInt("TipoRaca_codigo"));
                animal.setSexo(rs.getString("sexo"));
                animal.setdescricao(rs.getString("descricao"));
                animal.setEndFoto(rs.getString("foto"));
                animal.setDataCadastro(rs.getDate("datacadastro"));
                animal.setIdade(rs.getInt("idade"));
                animal.setNome(rs.getString("nome"));
                animal.setVacinado(rs.getString("vacinado"));
                animal.setdescricaoVacina(rs.getString("descricaovacinas"));
                animal.setLaudoVeterinario(rs.getString("laudoveterinario"));
                animal.setLocalAnimal(rs.getString("localanimal"));
                animal.setEspecie(rs.getString("tipoespecie"));
                animal.setCodigoFormaEnvio(rs.getInt("TipoFormaEnvio_codigo"));
                animal.setCodigoUsuario(rs.getInt("Colaborador_codigo"));
                animais.add(animal);
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (animais.size() > 0) return animais;
        else return null;
    }
    
    
    /*****      EXLUIR PROCESSO  *****/
    
    public int apagaProcesso(int codigo) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "DELETE from processo " +
                        "where codigo= ?");

                    pstmt.setInt(1, codigo);

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
