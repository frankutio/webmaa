package Persistencia.Portal;

import Entidade.Portal.Animais;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AnimalDAO {


    private static AnimalDAO instance = new AnimalDAO();

    public static AnimalDAO getInstance() {
        return instance;
    }

    private AnimalDAO() {
    }

    public int grava(Animais animal) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "INSERT INTO animais " +
                        "(Cor_SegCor,Cor_codigo,TipoPelo_codigo,PorteAnimal_codigo" +
                        ",TipoRaca_codigo,sexo,descricao,foto,disponibilidade,datacadastro" +
                        ",idade,nome,vacinado,descricaovacinas,laudoveterinario,localanimal" +
                        ",tipoespecie,TipoFormaEnvio_codigo,Colaborador_codigo,bloqueio"+
                        ")" +
                        " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                pstmt.setInt(1, animal.getCor2());
                pstmt.setInt(2, animal.getCor1());
                pstmt.setInt(3, animal.getCodigoPelagem());
                pstmt.setInt(4, animal.getPorte());
                pstmt.setInt(5, animal.getCodigoRaca());
                pstmt.setString(6, animal.getSexo());
                pstmt.setString(7, animal.getDescricao());
                pstmt.setString(8, animal.getEndFoto());
                pstmt.setString(9, animal.getDisponibilidade());
                pstmt.setDate(10, new java.sql.Date(animal.getDataCadastro().getTime()));
                pstmt.setInt(11, animal.getIdade());
                pstmt.setString(12, animal.getNome());
                pstmt.setString(13, animal.getVacinado());
                pstmt.setString(14, animal.getDescricaoVacina());
                pstmt.setString(15, animal.getLaudoVeterinario());
                pstmt.setString(16, animal.getLocalAnimal());
                pstmt.setString(17, animal.getEspecie());
                pstmt.setInt(18, animal.getCodigoFormaEnvio());
                pstmt.setInt(19, animal.getCodigoUsuario());
                pstmt.setString(20, "Sim");

                pstmt.execute();
            } catch (SQLException e) {
                System.out.println("Inclusao Falhou!!!\n" + e.getMessage());
            }catch(Exception ex){
                System.out.println("Error: " + ex.getMessage() + "-" + ex.getStackTrace());
            }
                    finally {
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

    public Animais listaAnimais(String esp, String disp) {

        Statement stmt = null;
        Animais animal = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM animais " +
                        "WHERE disponibilidade ='" +
                        disp + "' and tipoespecie ='" + esp + "'");
                if (rs.next()) {
                    animal = carregaDadosNoObjeto(rs);
                } else {
                    animal = null;
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
         return animal;

    }

    //RECUPERA UMA  LISTA DE TODOS OS REGISTRO DO BANCO
    public List<Animais> listaAni(String esp, String disp, String bloqueio) {

        Statement stmt = null;
        List<Animais> lstAnimal = new ArrayList<Animais>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM animais " +
                        "WHERE disponibilidade ='" +
                        disp + "' and tipoespecie ='" + esp + "' " +
                        "and bloqueio='"+bloqueio+"'");
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

                    lstAnimal.add(animal);
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
        return lstAnimal;
    }

    private Animais carregaDadosNoObjeto(ResultSet rs) throws SQLException {

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
        animal.setCodigoFuncionario(rs.getInt("Funcionarios_codigo"));
        animal.setCastrado(rs.getString("animalcastrado"));
        animal.setVlrTaxa(rs.getDouble("valormanutencao"));


        return animal;

    }

    public List<Animais> carregaDadosAnimal(int codUsr, String bloq) {

        Statement stmt = null;
        List<Animais> lstAnimal = new ArrayList<Animais>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM animais " +
                        "WHERE Colaborador_codigo =" +
                        codUsr + " and bloqueio ='" + bloq + "'");

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


                    lstAnimal.add(animal);
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
        return lstAnimal;
    }

    public List<Animais> carregaDadosAnimalTeste(int codUsr, String bloq) {

        Statement stmt = null;
        List<Animais> lstAnimal = new ArrayList<Animais>();
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            try {
                stmt = conn.createStatement(
                        ResultSet.TYPE_SCROLL_SENSITIVE,
                        ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = stmt.executeQuery(
                        "SELECT distinct A.* FROM processo p, ANIMAIS A "+
                         "WHERE P.ANIMAIS_CODIGO=A.CODIGO "+
                         "AND A.COLABORADOR_CODIGO="+codUsr+
                         " AND P.FASEPROCESSO_CODIGO<>3 "+
                         "AND A.BLOQUEIO='Nao'");

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


                    lstAnimal.add(animal);
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
        return lstAnimal;
    }

    /* public Animais carregaDadosAnimal(int codUsr, String disp) {

        Statement stmt = null;
        Animais animal = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                        "SELECT * FROM animais " +
                        "WHERE Colaborador_codigo =" +
                        codUsr + " and disponibilidade ='" + disp + "'");
                if (rs.next()) {
                    animal = carregaDadosNoObjeto(rs);
                } else {
                    animal = null;
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
         return animal;

    } */

    public int altera(Animais animal) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE animais SET " +
                        "tipoespecie = ?,TipoRaca_codigo= ?,nome= ?,idade= ?,Cor_codigo= ?,Cor_SegCor= ?,TipoPelo_codigo= ? " +
                        ",PorteAnimal_codigo= ?,sexo= ?,foto= ?,laudoveterinario= ?,vacinado= ?,descricaovacinas= ?,TipoFormaEnvio_codigo= ?" +
                        ",descricao= ? " +
                        "WHERE codigo = ? and Colaborador_codigo= ?");

                 pstmt.setString(1, animal.getEspecie());
                 pstmt.setInt(2, animal.getCodigoRaca());
                 pstmt.setString(3, animal.getNome());
                 pstmt.setInt(4, animal.getIdade());
                 pstmt.setInt(5, animal.getCor1());
                 pstmt.setInt(6, animal.getCor2());
                 pstmt.setInt(7, animal.getCodigoPelagem());
                 pstmt.setInt(8, animal.getPorte());
                 pstmt.setString(9, animal.getSexo());
                 pstmt.setString(10, animal.getEndFoto());
                 pstmt.setString(11, animal.getLaudoVeterinario());
                 pstmt.setString(12, animal.getVacinado());
                 pstmt.setString(13, animal.getDescricaoVacina());
                 pstmt.setInt(14, animal.getCodigoFormaEnvio());
                 pstmt.setString(15, animal.getDescricao());
                 pstmt.setInt(16, animal.getCodigo());
                 pstmt.setInt(17, animal.getCodigoUsuario());


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

    public Animais preparaAnimal(int codigo) {

        Statement stmt = null;
        Animais animal = null;
        Connection conn = Conexao.getInstance().criaConexao();
        if (conn != null) {
            try {
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                       " SELECT * FROM animais WHERE codigo ="+
                       codigo + "");
                if (rs.next()) {
                    animal = carregaDadosNoObjeto(rs);
                } else {
                    animal = null;
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
         return animal;

    }

    // Retira um animal da lista de adoção

    public int retiraAnimal(int codigoAnimal) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE animais SET " +
                        "disponibilidade ='Nao'" +
                        " WHERE codigo ="+codigoAnimal);

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

    public int retornaAnimal(int codigoAnimal) {

        int n = 0;
        Connection conn = Conexao.getInstance().criaConexao();

        if (conn != null) {
            PreparedStatement pstmt = null;
            try {
                pstmt = conn.prepareStatement(
                        "UPDATE animais SET " +
                        "disponibilidade ='Sim'" +
                        " WHERE codigo ="+codigoAnimal);

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

    //APAGA UM ANIMAL DA BASE DE DADOS
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

}
