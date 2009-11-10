package Persistencia.Portal;

import Entidade.Portal.Colaborador;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PortalColabDAO {

    private static PortalColabDAO instance = new PortalColabDAO();

    public static PortalColabDAO getInstance() {
        return instance;
    }

    private PortalColabDAO() {
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
                        ",datanascimento,cep,cpf,rg,endereco,sexo,complemento,celular,termoAceite,protocolo,"+
                        "datacadastro,validacao,foto)" +
                        " VALUES (?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?,?,?,?,?,?)");
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
                pstmt.setString(13, colaborador.getSexo());
                pstmt.setString(14, colaborador.getComplemento());
                //pstmt.setString(16, colaborador.getEndFoto());
                pstmt.setString(15, colaborador.getCelular());
                pstmt.setString(16, colaborador.getTermoAceito());
                pstmt.setString(17, colaborador.getProtocolo());
                pstmt.setDate(18, new java.sql.Date(colaborador.getDataCadastro().getTime()));
                pstmt.setString(19, colaborador.getValidacao());
                pstmt.setString(20, colaborador.getEndFoto());

                n = pstmt.executeUpdate();
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
                    colaborador.setSexo(rs.getString("sexo"));
                    colaborador.setDatacadastro(rs.getDate("datacadastro"));
                    colaborador.setComplemento(rs.getString("complemento"));
                    colaborador.setEndFoto(rs.getString("foto"));
                    colaborador.setCelular(rs.getString("celular"));
                    colaborador.setProtocolo(rs.getString("protocolo"));
                    colaborador.setTermoAceito(rs.getString("termoaceite"));
                    colaborador.setValidacao(rs.getString("validacao"));
                    colaborador.setEndFoto(rs.getString("foto"));

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

    public Colaborador le(int codigo) {

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
        colaborador.setSexo(rs.getString("sexo"));
        colaborador.setDatacadastro(rs.getDate("datacadastro"));
        colaborador.setComplemento(rs.getString("complemento"));
        colaborador.setEndFoto(rs.getString("foto"));
        colaborador.setCelular(rs.getString("celular"));
        colaborador.setProtocolo(rs.getString("protocolo"));
        colaborador.setTermoAceito(rs.getString("termoaceite"));
        colaborador.setValidacao(rs.getString("validacao"));
        colaborador.setEndFoto(rs.getString("foto"));

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
                        ",datanascimento= ?,cep= ?,cpf= ?,rg= ?,endereco= ?,sexo= ?,complemento= ?" +
                        ",celular= ? " +
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
                pstmt.setString(13, colaborador.getSexo());
                pstmt.setString(14, colaborador.getComplemento());
                pstmt.setString(15, colaborador.getCelular());
                pstmt.setInt(16, colaborador.getCodigo());

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

    public Colaborador login(String email, String cpf) {

        Statement stmt = null;
        Colaborador colaborador = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM colaborador WHERE email = '" +
                        email + "' " + "AND cpf = '" + cpf + "'");
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

    public int alteraFoto(Colaborador colaborador) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE colaborador SET " +
                        "foto = ?" +
                        "WHERE codigo = ?");

                pstmt.setString(1, colaborador.getEndFoto());
                pstmt.setInt(2, colaborador.getCodigo());

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

    public Colaborador validaPt(String cpf, String pt) {

        Statement stmt = null;
        Colaborador colaborador = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM colaborador WHERE cpf ='" +
                        cpf+"' and protocolo ='"+pt+"' ");
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

    public int desbloqueaColab(int codigo) {

        int n = 0;
        Statement stmt = null;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement();
                n = stmt.executeUpdate(
                        "UPDATE colaborador SET " +
                        "validacao ='Sim'" +
                        " WHERE codigo ="+codigo);
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

   /* public int desbloqueaColab(Colaborador colaborador) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE colaborador SET " +
                        "validacao ='Sim'" +
                        " WHERE codigo = ?");

                pstmt.setInt(1, colaborador.getCodigo());

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

    } */

}
