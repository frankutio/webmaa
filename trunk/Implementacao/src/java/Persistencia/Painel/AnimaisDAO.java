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

public class AnimaisDAO {

    private static AnimaisDAO instance = new AnimaisDAO();

    public static AnimaisDAO getInstance() {
        return instance;
    }

    private AnimaisDAO() {
    }

    public int grava(Animais animais) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "INSERT INTO animais " +
                        "( segundacor, corpredominante, TipoPelo_codigo, PorteAnimal_codigo," +
                        " TipoRaca_codigo,sexo,descricao, foto, disponibilidade, datacadastro," +
                        "idade, nome, vacinado, descricaovacinas, laudoveterinario, certificado," +
                        " localanimal, tipoespecie, animalcastrado,  valormanutencao)" +
                        " VALUES ( ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?,?,?,?,?,?)");

                pstmt.setInt(1, animais.getCor2());
                pstmt.setInt(2, animais.getCor1());
                pstmt.setInt(3, animais.getCodigoPelagem());
                pstmt.setInt(4 , animais.getPorte());
                pstmt.setInt(5, animais.getCodigoRaca());
                pstmt.setString(6, animais.getSexo());
                pstmt.setString(7,animais.getDescricao());
                pstmt.setString(8, animais.getEndFoto());
                pstmt.setBoolean(9, true);
                pstmt.setDate(10, new java.sql.Date(animais.getDataCadastro().getTime()));
                pstmt.setInt(11, animais.getIdade());
                pstmt.setString(12, animais.getNome());
                pstmt.setString(13, animais.getVacinado());
                pstmt.setString(14, animais.getDescricaoVacina());
                pstmt.setString(15, animais.getLaudoVeterinario());
                pstmt.setString(16, animais.getLaudoVeterinario());
                pstmt.setString(17, animais.getLocalAnimal());
                pstmt.setString(18, animais.getEspecie());
                pstmt.setString(19, animais.getCastrado());
                pstmt.setDouble(20, animais.getVlrTaxa());

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
                animais.setEspecie(rs.getString("especie"));
                animais.setSexo(rs.getString("sexo"));
                animais.setCodigoRaca(rs.getInt("TipoRaca_codigo"));
                animais.setIdade(rs.getInt("idade"));
                animais.setCor1(rs.getInt("corpredominante"));
                animais.setCor2(rs.getInt("segundacor"));
                animais.setCodigoPelagem(rs.getInt("TipoPelo_codigo"));
                animais.setPorte(rs.getInt("PorteAnimal_codigo"));
                animais.setEndFoto(rs.getString("foto"));
                animais.setCastrado(rs.getString("animalcastrado"));
                animais.setLaudoVeterinario(rs.getString("LaudoVeterinario"));
                animais.setVacinado(rs.getString("Vacinado"));
                animais.setdescricaoVacina(rs.getString("DescricaoVacinas"));
                animais.setVlrTaxa(rs.getDouble("valormanutencao"));
                animais.setdescricao(rs.getString("Descricao"));

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

    public Animais le(String codigo) {

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

    private Animais carregaDadosNoObjeto(ResultSet rs) throws SQLException {

        Animais animais = new Animais();

        animais.setCodigo(rs.getInt("codigo"));
        animais.setDataCadastro(rs.getDate("DataCadastro"));
        animais.setNome(rs.getString("nome"));
        animais.setEspecie(rs.getString("especie"));
        animais.setSexo(rs.getString("sexo"));
        animais.setCodigoRaca(rs.getInt("TipoRaca_codigo"));
        animais.setIdade(rs.getInt("idade"));
        animais.setCor1(rs.getInt("corpredominante"));
        animais.setCor2(rs.getInt("segundacor"));
        animais.setCodigoPelagem(rs.getInt("TipoPelo_codigo"));
        animais.setPorte(rs.getInt("PorteAnimal_codigo"));
        animais.setEndFoto(rs.getString("foto"));
        animais.setCastrado(rs.getString("animalcastrado"));
        animais.setLaudoVeterinario(rs.getString("LaudoVeterinario"));
        animais.setVacinado(rs.getString("Vacinado"));
        animais.setdescricaoVacina(rs.getString("DescricaoVacinas"));
        animais.setVlrTaxa(rs.getDouble("valormanutencao"));
        animais.setdescricao(rs.getString("Descricao"));

        return animais;

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
                        "segundacor = ?, corpredominante = ?, TipoPelo_codigo = ?, PorteAnimal_codigo = ?," +
                        " TipoRaca_codigo = ?,sexo = ?,descricao = ?, foto = ?, disponibilidade = ?, datacadastro = ?," +
                        "idade = ?, nome = ?, vacinado = ?, descricaovacinas = ?, laudoveterinario = ?, certificado = ?," +
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
                pstmt.setString(9, animais.getDisponibilidade());
                pstmt.setDate(10, new java.sql.Date(animais.getDataCadastro().getTime()));
                pstmt.setInt(11, animais.getIdade());
                pstmt.setString(12, animais.getNome());
                pstmt.setString(13, animais.getVacinado());
                pstmt.setString(14, animais.getDescricaoVacina());
                pstmt.setString(15, animais.getLaudoVeterinario());
                pstmt.setString(16, animais.getCertificado());
                pstmt.setString(17, animais.getLocalAnimal());
                pstmt.setString(18, animais.getEspecie());
                pstmt.setString(19, animais.getCastrado());
                pstmt.setDouble(20, animais.getVlrTaxa());

                pstmt.setInt(21, animais.getCodigo());

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