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
import java.util.*;
import Entidade.Painel.Animais;
import Entidade.Painel.Processo;
import java.text.DecimalFormat;

public class AnimaisDAO {

    private static AnimaisDAO instance = new AnimaisDAO();

    public static AnimaisDAO getInstance() {
        return instance;
    }

    private AnimaisDAO() {
    }

    public int aprova(int codigo) {
          int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE animais SET " +
                        " disponibilidade = ? ,bloqueio=? " +
                        "WHERE codigo = ?");


                pstmt.setString(1, "Sim");
                pstmt.setString(2, "Nao");
                pstmt.setInt(3, codigo);

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

    public int aprovaAdocoesProcesso( int codigoprocesso) {
          int n = 0;
        
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                

              
                 pstmt = conn.prepareStatement(
                        "UPDATE processo SET " +
                        " FaseProcesso_codigo = ? " +
                        "WHERE codigo = ?");


                pstmt.setInt(1, 4);
                pstmt.setInt(2, codigoprocesso);

                
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

    public int aprovaAdocoesAnimais(int codigoAnimal) {
          int n = 0;
      
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE animais SET " +
                        " disponibilidade = ? ,bloqueio=? " +
                        "WHERE codigo = ?");


                pstmt.setString(1, "Nao");
                pstmt.setString(2, "Nao");
                pstmt.setInt(3, codigoAnimal);

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

    public int grava(Animais animais) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "INSERT INTO animais " +
                        "( Cor_SegCor, Cor_codigo, TipoPelo_codigo, PorteAnimal_codigo," +
                        " TipoRaca_codigo,sexo,descricao, foto, disponibilidade, datacadastro," +
                        "idade, nome, vacinado, descricaovacinas, laudoveterinario, " +
                        " localanimal, tipoespecie, animalcastrado,  valormanutencao,Funcionarios_codigo,TipoFormaEnvio_codigo,bloqueio)" +
                        " VALUES ( ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?,?,?,?,?,?,?,?)");
                              
                pstmt.setInt(1, animais.getCor2());
                pstmt.setInt(2, animais.getCor1());
                pstmt.setInt(3, animais.getCodigoPelagem());
                pstmt.setInt(4 , animais.getPorte());
                pstmt.setInt(5, animais.getCodigoRaca());
                pstmt.setString(6, animais.getSexo());
                pstmt.setString(7,animais.getDescricao());
                pstmt.setString(8, animais.getEndFoto());
                pstmt.setString(9, "Sim");
                pstmt.setDate(10, new java.sql.Date(animais.getDataCadastro().getTime()));
                pstmt.setInt(11, animais.getIdade());
                pstmt.setString(12, animais.getNome());
                pstmt.setString(13, animais.getVacinado());
                pstmt.setString(14, animais.getDescricaoVacina());
                pstmt.setString(15, animais.getLaudoVeterinario());
                pstmt.setString(16, "Sim");
                pstmt.setString(17, animais.getEspecie());
                pstmt.setString(18, animais.getCastrado());
                pstmt.setDouble(19, animais.getVlrTaxa());
                pstmt.setInt(20, animais.getCodigoFuncionario());
                pstmt.setInt(21, animais.getCodigoFormaEnvio());
                pstmt.setString(22, "Nao");

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

    public List<Processo> leEmFaseAdocao() {
          Statement stmt = null;

        List<Processo> lstProcesso = new ArrayList<Processo>();

        String strSQL;

        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);

                strSQL=" SELECT * FROM processo where FaseProcesso_codigo < 4;" ;

                ResultSet rs = stmt.executeQuery(strSQL);


                while (rs.next()) {
                Processo processo= new Processo();
                processo.setCodigo(rs.getInt("codigo"));
                processo.setDataCadastro(rs.getDate("DataCadastro"));
                processo.setDataProcesso(rs.getDate("DataProcesso"));
                processo.setFaseProcessoCodigo(rs.getInt("FaseProcesso_Codigo"));
                processo.setAnimaisCodigo(rs.getInt("Animais_codigo"));
                processo.setColaboradorCodigo(rs.getInt("Colaborador_codigo"));
                processo.setCodigoStatus(rs.getString("codigostatus"));
                processo.setAvaliacao(rs.getString("avaliacao"));
                processo.setDescricaoAvaliacao(rs.getString("descricaoavaliacao"));
                processo.setNotaAvaliacao(rs.getString("notaavaliacao"));
                processo.setMensagem(rs.getString("mensagem"));
                lstProcesso.add(processo);
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
        return lstProcesso;
    }

    public List<Animais> leTodos() {

        Statement stmt = null;
        List<Animais> animaiss = new ArrayList<Animais>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM animais");
                while (rs.next()) {
                Animais animais = new Animais();
                animais.setCodigo(rs.getInt("codigo"));
                animais.setDataCadastro(rs.getDate("DataCadastro"));
                animais.setNome(rs.getString("nome"));
                animais.setEspecie(rs.getString("tipoespecie"));
                animais.setSexo(rs.getString("sexo"));
                animais.setCodigoRaca(rs.getInt("TipoRaca_codigo"));
                animais.setIdade(rs.getInt("idade"));
                animais.setCor1(rs.getInt("Cor_codigo"));
                animais.setCor2(rs.getInt("Cor_SegCor"));
                animais.setCodigoPelagem(rs.getInt("TipoPelo_codigo"));
                animais.setPorte(rs.getInt("PorteAnimal_codigo"));
                animais.setEndFoto(rs.getString("foto"));
                animais.setCastrado(rs.getString("animalcastrado"));
                animais.setLaudoVeterinario(rs.getString("LaudoVeterinario"));
                animais.setVacinado(rs.getString("Vacinado"));
                animais.setDescricaoVacina(rs.getString("DescricaoVacinas"));
                animais.setVlrTaxa(rs.getDouble("valormanutencao"));
                animais.setDescricao(rs.getString("Descricao"));
                animais.setLocalAnimal(rs.getString("localAnimal"));
                animais.setCodigoColaborador(rs.getInt("Colaborador_Codigo"));
                animais.setCodigoFuncionario(rs.getInt("Funcionarios_Codigo"));
                animais.setCodigoFormaEnvio(rs.getInt("TipoFormaEnvio_codigo"));
                animais.setBloqueio(rs.getString("bloqueio"));
                animais.setDisponibilidade(rs.getString("disponibilidade"));
                    animaiss.add(animais);
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
        return animaiss;
    }
    public List<Animais> leTodos(String localAnimal, String tipoAnimal) {

        Statement stmt = null;

        List<Animais> animaiss = new ArrayList<Animais>();

        String strSQL;

        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                if(tipoAnimal.equals("Todos"))
                {
                    strSQL= "SELECT * FROM animais where localanimal ='" + localAnimal + "'";
                }else{
                    strSQL="SELECT * FROM animais where localanimal ='" + localAnimal + "' and tipoespecie='" + tipoAnimal + "'" ;
                }
                ResultSet rs = stmt.executeQuery(strSQL);
                        
                while (rs.next()) {
                Animais animais = new Animais();
                animais.setCodigo(rs.getInt("codigo"));
                animais.setDataCadastro(rs.getDate("DataCadastro"));
                animais.setNome(rs.getString("nome"));
                animais.setEspecie(rs.getString("tipoespecie"));
                animais.setSexo(rs.getString("sexo"));
                animais.setCodigoRaca(rs.getInt("TipoRaca_codigo"));
                animais.setIdade(rs.getInt("idade"));
                animais.setCor1(rs.getInt("Cor_codigo"));
                animais.setCor2(rs.getInt("Cor_SegCor"));
                animais.setCodigoPelagem(rs.getInt("TipoPelo_codigo"));
                animais.setPorte(rs.getInt("PorteAnimal_codigo"));
                animais.setEndFoto(rs.getString("foto"));
                animais.setCastrado(rs.getString("animalcastrado"));
                animais.setLaudoVeterinario(rs.getString("LaudoVeterinario"));
                animais.setVacinado(rs.getString("Vacinado"));
                animais.setDescricaoVacina(rs.getString("DescricaoVacinas"));
                animais.setVlrTaxa(rs.getDouble("valormanutencao"));
                animais.setDescricao(rs.getString("Descricao"));
                animais.setLocalAnimal(rs.getString("localAnimal"));
                animais.setCodigoColaborador(rs.getInt("Colaborador_Codigo"));
                animais.setCodigoFuncionario(rs.getInt("Funcionarios_Codigo"));
                animais.setCodigoFormaEnvio(rs.getInt("TipoFormaEnvio_codigo"));
                    animaiss.add(animais);
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
        return animaiss;
    }
    public static Processo leProcessoAnimal(int codigo, int codigoanimal) {
         Statement stmt = null;
        Processo processo = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM processo WHERE Colaborador_codigo = " +
                        codigo + " and Animais_codigo = " + codigoanimal);
                if (rs.next()) {
                    processo = carregaDadosNoObjetoProcesso(rs);
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
    public static Processo leProcesso(int codigo) {
         Statement stmt = null;
        Processo processo = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM processo WHERE Colaborador_codigo = " +
                        codigo);
                if (rs.next()) {
                    processo = carregaDadosNoObjetoProcesso(rs);
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
    public Animais le(int codigo) {

        Statement stmt = null;
        Animais animais = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM animais WHERE codigo = " +
                        codigo);
                if (rs.next()) {
                    animais = carregaDadosNoObjeto(rs);
                } else {
                    animais = null;
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
        return animais;

    }

    public List<Processo> leTodosProcessos() {
         Statement stmt = null;

        List<Processo> lstProcesso = new ArrayList<Processo>();

        String strSQL;

        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);

                strSQL=" SELECT * FROM processo" ;

                ResultSet rs = stmt.executeQuery(strSQL);


                while (rs.next()) {
                Processo processo= new Processo();
                processo.setCodigo(rs.getInt("codigo"));
                processo.setDataCadastro(rs.getDate("DataCadastro"));
                processo.setDataProcesso(rs.getDate("DataProcesso"));
                processo.setFaseProcessoCodigo(rs.getInt("FaseProcesso_Codigo"));
                processo.setAnimaisCodigo(rs.getInt("Animais_codigo"));
                processo.setColaboradorCodigo(rs.getInt("Colaborador_codigo"));
                processo.setCodigoStatus(rs.getString("codigostatus"));
                processo.setAvaliacao(rs.getString("avaliacao"));
                processo.setDescricaoAvaliacao(rs.getString("descricaoavaliacao"));
                processo.setNotaAvaliacao(rs.getString("notaavaliacao"));
                processo.setMensagem(rs.getString("mensagem"));
                lstProcesso.add(processo);
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
        return lstProcesso;
    }
    public List<Processo> leTodosAdotados() {
         Statement stmt = null;

        List<Processo> lstProcesso = new ArrayList<Processo>();

        String strSQL;

        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
               
                strSQL=" SELECT distinct P.CODIGO,P.FASEPROCESSO_CODIGO,P.ANIMAIS_CODIGO,P.DATAPROCESSO, " +
                        " P.COLABORADOR_CODIGO,P.DATACADASTRO,P.CODIGOSTATUS," +
                        " P.AVALIACAO,P.DESCRICAOAVALIACAO,P.NOTAAVALIACAO" +
                        " FROM processo p, ANIMAIS A" +
                        " WHERE P.ANIMAIS_CODIGO=A.CODIGO" +
                        " AND A.COLABORADOR_CODIGO IS NULL" +
                        " AND P.FASEPROCESSO_CODIGO=4;" ;
               
                ResultSet rs = stmt.executeQuery(strSQL);

              
                while (rs.next()) {
                Processo processo= new Processo();
                processo.setCodigo(rs.getInt("codigo"));
                processo.setDataCadastro(rs.getDate("DataCadastro"));
                processo.setDataProcesso(rs.getDate("DataProcesso"));
                processo.setFaseProcessoCodigo(rs.getInt("FaseProcesso_Codigo"));
                processo.setAnimaisCodigo(rs.getInt("Animais_codigo"));
                processo.setColaboradorCodigo(rs.getInt("Colaborador_codigo"));
                processo.setCodigoStatus(rs.getString("codigostatus"));
                processo.setAvaliacao(rs.getString("avaliacao"));
                processo.setDescricaoAvaliacao(rs.getString("descricaoavaliacao"));
                processo.setNotaAvaliacao(rs.getString("notaavaliacao"));

                lstProcesso.add(processo);
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
        return lstProcesso;
    }

    public List<Processo> leTodosAdotadosColaborador() {
         Statement stmt = null;

        List<Processo> lstProcesso = new ArrayList<Processo>();

        String strSQL;

        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);

                strSQL=" SELECT distinct P.CODIGO,P.FASEPROCESSO_CODIGO,P.ANIMAIS_CODIGO,P.DATAPROCESSO, " +
                        " P.COLABORADOR_CODIGO,P.DATACADASTRO,P.CODIGOSTATUS," +
                        " P.AVALIACAO,P.DESCRICAOAVALIACAO,P.NOTAAVALIACAO" +
                        " FROM processo p, ANIMAIS A" +
                        " WHERE P.ANIMAIS_CODIGO=A.CODIGO" +
                        " AND A.COLABORADOR_CODIGO IS not NULL" +
                        " AND P.FASEPROCESSO_CODIGO=4;" ;

                ResultSet rs = stmt.executeQuery(strSQL);


                while (rs.next()) {
                Processo processo= new Processo();
                processo.setCodigo(rs.getInt("codigo"));
                processo.setDataCadastro(rs.getDate("DataCadastro"));
                processo.setDataProcesso(rs.getDate("DataProcesso"));
                processo.setFaseProcessoCodigo(rs.getInt("FaseProcesso_Codigo"));
                processo.setAnimaisCodigo(rs.getInt("Animais_codigo"));
                processo.setColaboradorCodigo(rs.getInt("Colaborador_codigo"));
                processo.setCodigoStatus(rs.getString("codigostatus"));
                processo.setAvaliacao(rs.getString("avaliacao"));
                processo.setDescricaoAvaliacao(rs.getString("descricaoavaliacao"));
                processo.setNotaAvaliacao(rs.getString("notaavaliacao"));

                lstProcesso.add(processo);
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
        return lstProcesso;
    }

    public List<Animais> leTodosFilaAdocao() {
         Statement stmt = null;
        List<Animais> animaiss = new ArrayList<Animais>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        " SELECT distinct a.* , p.Colaborador_codigo as codigo_colaborador FROM animais a, processo p where a.disponibilidade='Sim' and  " +
                        "  Funcionarios_Codigo is not null and a.codigo in(select p.animais_codigo from processo p where codigostatus='Nao' );");
                while (rs.next()) {
                Animais animais = new Animais();
                animais.setCodigo(rs.getInt("codigo"));
                animais.setDataCadastro(rs.getDate("DataCadastro"));
                animais.setNome(rs.getString("nome"));
                animais.setEspecie(rs.getString("tipoespecie"));
                animais.setSexo(rs.getString("sexo"));
                animais.setCodigoRaca(rs.getInt("TipoRaca_codigo"));
                animais.setIdade(rs.getInt("idade"));
                animais.setCor1(rs.getInt("Cor_codigo"));
                animais.setCor2(rs.getInt("Cor_SegCor"));
                animais.setCodigoPelagem(rs.getInt("TipoPelo_codigo"));
                animais.setPorte(rs.getInt("PorteAnimal_codigo"));
                animais.setEndFoto(rs.getString("foto"));
                animais.setCastrado(rs.getString("animalcastrado"));
                animais.setLaudoVeterinario(rs.getString("LaudoVeterinario"));
                animais.setVacinado(rs.getString("Vacinado"));
                animais.setDescricaoVacina(rs.getString("DescricaoVacinas"));
                animais.setVlrTaxa(rs.getDouble("valormanutencao"));
                animais.setDescricao(rs.getString("Descricao"));
                animais.setLocalAnimal(rs.getString("localAnimal"));
                animais.setCodigoColaborador(rs.getInt("codigo_colaborador"));
                animais.setCodigoFuncionario(rs.getInt("Funcionarios_Codigo"));
                animais.setCodigoFormaEnvio(rs.getInt("TipoFormaEnvio_codigo"));

                    animaiss.add(animais);
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
        return animaiss;
    }

    public List<Animais> leTodosFilaCanil() {
         Statement stmt = null;
        List<Animais> animaiss = new ArrayList<Animais>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        " SELECT distinct a.* FROM animais a, processo p where a.disponibilidade='Sim' and  " +
                        " a.codigo not in(select p.animais_codigo from processo p);");
                while (rs.next()) {
                Animais animais = new Animais();
                animais.setCodigo(rs.getInt("codigo"));
                animais.setDataCadastro(rs.getDate("DataCadastro"));
                animais.setNome(rs.getString("nome"));
                animais.setEspecie(rs.getString("tipoespecie"));
                animais.setSexo(rs.getString("sexo"));
                animais.setCodigoRaca(rs.getInt("TipoRaca_codigo"));
                animais.setIdade(rs.getInt("idade"));
                animais.setCor1(rs.getInt("Cor_codigo"));
                animais.setCor2(rs.getInt("Cor_SegCor"));
                animais.setCodigoPelagem(rs.getInt("TipoPelo_codigo"));
                animais.setPorte(rs.getInt("PorteAnimal_codigo"));
                animais.setEndFoto(rs.getString("foto"));
                animais.setCastrado(rs.getString("animalcastrado"));
                animais.setLaudoVeterinario(rs.getString("LaudoVeterinario"));
                animais.setVacinado(rs.getString("Vacinado"));
                animais.setDescricaoVacina(rs.getString("DescricaoVacinas"));
                animais.setVlrTaxa(rs.getDouble("valormanutencao"));
                animais.setDescricao(rs.getString("Descricao"));
                animais.setLocalAnimal(rs.getString("localAnimal"));
                animais.setCodigoColaborador(rs.getInt("Colaborador_Codigo"));
                animais.setCodigoFuncionario(rs.getInt("Funcionarios_Codigo"));
                animais.setCodigoFormaEnvio(rs.getInt("TipoFormaEnvio_codigo"));

                    animaiss.add(animais);
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
        return animaiss;
    }

    public List<Animais> leTodosFilaColab() {
         Statement stmt = null;
        List<Animais> animaiss = new ArrayList<Animais>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        " SELECT distinct a.* FROM animais a, processo p where a.Colaborador_codigo is not null and a.disponibilidade='Sim' and  " +
                        " a.codigo not in(select p.animais_codigo from processo p);");
                while (rs.next()) {
                Animais animais = new Animais();
                animais.setCodigo(rs.getInt("codigo"));
                animais.setDataCadastro(rs.getDate("DataCadastro"));
                animais.setNome(rs.getString("nome"));
                animais.setEspecie(rs.getString("tipoespecie"));
                animais.setSexo(rs.getString("sexo"));
                animais.setCodigoRaca(rs.getInt("TipoRaca_codigo"));
                animais.setIdade(rs.getInt("idade"));
                animais.setCor1(rs.getInt("Cor_codigo"));
                animais.setCor2(rs.getInt("Cor_SegCor"));
                animais.setCodigoPelagem(rs.getInt("TipoPelo_codigo"));
                animais.setPorte(rs.getInt("PorteAnimal_codigo"));
                animais.setEndFoto(rs.getString("foto"));
                animais.setCastrado(rs.getString("animalcastrado"));
                animais.setLaudoVeterinario(rs.getString("LaudoVeterinario"));
                animais.setVacinado(rs.getString("Vacinado"));
                animais.setDescricaoVacina(rs.getString("DescricaoVacinas"));
                animais.setVlrTaxa(rs.getDouble("valormanutencao"));
                animais.setDescricao(rs.getString("Descricao"));
                animais.setLocalAnimal(rs.getString("localAnimal"));
                animais.setCodigoColaborador(rs.getInt("Colaborador_Codigo"));
                animais.setCodigoFuncionario(rs.getInt("Funcionarios_Codigo"));
                animais.setCodigoFormaEnvio(rs.getInt("TipoFormaEnvio_codigo"));

                    animaiss.add(animais);
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
        return animaiss;
    }

    public List<Animais> leTodosDoacao(String tipoAnimal) {
         Statement stmt = null;
        List<Animais> animaiss = new ArrayList<Animais>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs;
                if(tipoAnimal.equals("Todos"))
                {
                        rs = stmt.executeQuery(
                        " SELECT distinct a.* FROM animais a, processo p where a.Colaborador_codigo is not null and  " +
                        " a.localanimal='Nao' and a.codigo not in(select p.animais_codigo from processo p);");
                }else{
                       rs = stmt.executeQuery(
                        " SELECT distinct a.* FROM animais a, processo p where a.Colaborador_codigo is not null and  " +
                        " a.localanimal='Nao' and tipoespecie='" + tipoAnimal + "' and a.codigo not in(select p.animais_codigo from processo p);");
                }
                while (rs.next()) {
                Animais animais = new Animais();
                animais.setCodigo(rs.getInt("codigo"));
                animais.setDataCadastro(rs.getDate("DataCadastro"));
                animais.setNome(rs.getString("nome"));
                animais.setEspecie(rs.getString("tipoespecie"));
                animais.setSexo(rs.getString("sexo"));
                animais.setCodigoRaca(rs.getInt("TipoRaca_codigo"));
                animais.setIdade(rs.getInt("idade"));
                animais.setCor1(rs.getInt("Cor_codigo"));
                animais.setCor2(rs.getInt("Cor_SegCor"));
                animais.setCodigoPelagem(rs.getInt("TipoPelo_codigo"));
                animais.setPorte(rs.getInt("PorteAnimal_codigo"));
                animais.setEndFoto(rs.getString("foto"));
                animais.setCastrado(rs.getString("animalcastrado"));
                animais.setLaudoVeterinario(rs.getString("LaudoVeterinario"));
                animais.setVacinado(rs.getString("Vacinado"));
                animais.setDescricaoVacina(rs.getString("DescricaoVacinas"));
                animais.setVlrTaxa(rs.getDouble("valormanutencao"));
                animais.setDescricao(rs.getString("Descricao"));
                animais.setLocalAnimal(rs.getString("localAnimal"));
                animais.setCodigoColaborador(rs.getInt("Colaborador_Codigo"));
                animais.setCodigoFuncionario(rs.getInt("Funcionarios_Codigo"));
                animais.setCodigoFormaEnvio(rs.getInt("TipoFormaEnvio_codigo"));

                    animaiss.add(animais);
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
        return animaiss;
    }

    public List<Animais> leTodosPendentesColab() {
         Statement stmt = null;
        List<Animais> animaiss = new ArrayList<Animais>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        " SELECT distinct a.* FROM animais a "+
                        " where a.Colaborador_codigo is not null and bloqueio='Sim' and a.disponibilidade='Nao';");
                while (rs.next()) {
                Animais animais = new Animais();
                animais.setCodigo(rs.getInt("codigo"));
                animais.setDataCadastro(rs.getDate("DataCadastro"));
                animais.setNome(rs.getString("nome"));
                animais.setEspecie(rs.getString("tipoespecie"));
                animais.setSexo(rs.getString("sexo"));
                animais.setCodigoRaca(rs.getInt("TipoRaca_codigo"));
                animais.setIdade(rs.getInt("idade"));
                animais.setCor1(rs.getInt("Cor_codigo"));
                animais.setCor2(rs.getInt("Cor_SegCor"));
                animais.setCodigoPelagem(rs.getInt("TipoPelo_codigo"));
                animais.setPorte(rs.getInt("PorteAnimal_codigo"));
                animais.setEndFoto(rs.getString("foto"));
                animais.setCastrado(rs.getString("animalcastrado"));
                animais.setLaudoVeterinario(rs.getString("LaudoVeterinario"));
                animais.setVacinado(rs.getString("Vacinado"));
                animais.setDescricaoVacina(rs.getString("DescricaoVacinas"));
                animais.setVlrTaxa(rs.getDouble("valormanutencao"));
                animais.setDescricao(rs.getString("Descricao"));
                animais.setLocalAnimal(rs.getString("localAnimal"));
                animais.setCodigoColaborador(rs.getInt("Colaborador_Codigo"));
                animais.setCodigoFuncionario(rs.getInt("Funcionarios_Codigo"));
                animais.setCodigoFormaEnvio(rs.getInt("TipoFormaEnvio_codigo"));

                    animaiss.add(animais);
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
        return animaiss;
    }

    private Animais carregaDadosNoObjeto(ResultSet rs) throws SQLException {

        Animais animais = new Animais();

        animais.setCodigo(rs.getInt("codigo"));
        animais.setDataCadastro(rs.getDate("DataCadastro"));
        animais.setNome(rs.getString("nome"));
        animais.setEspecie(rs.getString("tipoespecie"));
        animais.setSexo(rs.getString("sexo"));
        animais.setCodigoRaca(rs.getInt("TipoRaca_codigo"));
        animais.setIdade(rs.getInt("idade"));
        animais.setCor1(rs.getInt("Cor_codigo"));
        animais.setCor2(rs.getInt("Cor_SegCor"));
        animais.setCodigoPelagem(rs.getInt("TipoPelo_codigo"));
        animais.setPorte(rs.getInt("PorteAnimal_codigo"));
        animais.setEndFoto(rs.getString("foto"));
        animais.setCastrado(rs.getString("animalcastrado"));
        animais.setLaudoVeterinario(rs.getString("LaudoVeterinario"));
        animais.setVacinado(rs.getString("Vacinado"));
        animais.setDescricaoVacina(rs.getString("DescricaoVacinas"));
        animais.setVlrTaxa(rs.getDouble("valormanutencao"));
        animais.setDescricao(rs.getString("Descricao"));
        animais.setLocalAnimal(rs.getString("localAnimal"));
        animais.setCodigoColaborador(rs.getInt("Colaborador_Codigo"));
        animais.setCodigoFuncionario(rs.getInt("Funcionarios_Codigo"));
        animais.setCodigoFormaEnvio(rs.getInt("TipoFormaEnvio_codigo"));
        return animais;

    }
     private static Processo carregaDadosNoObjetoProcesso(ResultSet rs)throws SQLException  {

         Processo processo = new Processo();

        processo.setCodigo(rs.getInt("codigo"));
        processo.setFaseProcessoCodigo(rs.getInt("FaseProcesso_codigo"));
        processo.setAnimaisCodigo(rs.getInt("Animais_codigo"));
        processo.setColaboradorCodigo(rs.getInt("Colaborador_codigo"));
        processo.setDataProcesso(rs.getDate("dataprocesso"));
        processo.setDataCadastro(rs.getDate("datacadastro"));
        processo.setCodigoStatus(rs.getString("codigostatus"));
        processo.setAvaliacao(rs.getString("avaliacao"));
        processo.setDescricaoAvaliacao(rs.getString("descricaoavaliacao"));
        processo.setNotaAvaliacao(rs.getString("notaavaliacao"));
        processo.setMensagem(rs.getString("mensagem"));

        return processo;
    }
    public int apaga(int codigo) {

        int n = 0;
        Statement stmt = null;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement();
                n = stmt.executeUpdate(
                        "DELETE FROM animais WHERE codigo = " +
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

    public int altera(Animais animais) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE animais SET " +
                        "Cor_SegCor = ?, Cor_codigo = ?, TipoPelo_codigo = ?, PorteAnimal_codigo = ?," +
                        " TipoRaca_codigo = ?,sexo = ?,descricao = ?, foto = ?, disponibilidade = ?, datacadastro = ?," +
                        "idade = ?, nome = ?, vacinado = ?, descricaovacinas = ?, laudoveterinario = ?, " +
                        " localanimal = ?, tipoespecie = ?, animalcastrado = ?,  valormanutencao = ?" +
                        "WHERE codigo = ?");

                pstmt.setInt(1, animais.getCor2());
                pstmt.setInt(2, animais.getCor1());
                pstmt.setInt(3, animais.getCodigoPelagem());
                pstmt.setInt(4 , animais.getPorte());
                pstmt.setInt(5, animais.getCodigoRaca());
                pstmt.setString(6, animais.getSexo());
                pstmt.setString(7,animais.getDescricao());
                pstmt.setString(8, animais.getEndFoto());
                pstmt.setString(9, "Sim");
                pstmt.setDate(10, new java.sql.Date(animais.getDataCadastro().getTime()));
                pstmt.setInt(11, animais.getIdade());
                pstmt.setString(12, animais.getNome());
                pstmt.setString(13, animais.getVacinado());
                pstmt.setString(14, animais.getDescricaoVacina());
                pstmt.setString(15, animais.getLaudoVeterinario());
                pstmt.setString(16, "Sim");
                pstmt.setString(17, animais.getEspecie());
                pstmt.setString(18, animais.getCastrado());
                pstmt.setDouble(19, animais.getVlrTaxa());

                pstmt.setInt(20, animais.getCodigo());

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

    public int alteraDoacao(Animais animais) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE animais SET " +
                        "Cor_SegCor = ?, Cor_codigo = ?, TipoPelo_codigo = ?, PorteAnimal_codigo = ?," +
                        " TipoRaca_codigo = ?,sexo = ?,descricao = ?, foto = ?, datacadastro = ?," +
                        "idade = ?, nome = ?, vacinado = ?, descricaovacinas = ?, laudoveterinario = ?, " +
                        " localanimal = ?, tipoespecie = ?, animalcastrado = ?,  valormanutencao = ?" +
                        "WHERE codigo = ?");

                pstmt.setInt(1, animais.getCor2());
                pstmt.setInt(2, animais.getCor1());
                pstmt.setInt(3, animais.getCodigoPelagem());
                pstmt.setInt(4 , animais.getPorte());
                pstmt.setInt(5, animais.getCodigoRaca());
                pstmt.setString(6, animais.getSexo());
                pstmt.setString(7,animais.getDescricao());
                pstmt.setString(8, animais.getEndFoto());
                pstmt.setDate(9, new java.sql.Date(animais.getDataCadastro().getTime()));
                pstmt.setInt(10, animais.getIdade());
                pstmt.setString(11, animais.getNome());
                pstmt.setString(12, animais.getVacinado());
                pstmt.setString(13, animais.getDescricaoVacina());
                pstmt.setString(14, animais.getLaudoVeterinario());
                pstmt.setString(15, "Nao");
                pstmt.setString(16, animais.getEspecie());
                pstmt.setString(17, animais.getCastrado());
                pstmt.setDouble(18, animais.getVlrTaxa());

                pstmt.setInt(20, animais.getCodigo());

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