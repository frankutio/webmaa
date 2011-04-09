package Controle.Painel;

import Entidade.Painel.Funcionarios;
import Entidade.Painel.UF;
import Persistencia.Painel.FuncionariosDAO;
import Persistencia.Painel.UFDAO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Date;
import java.text.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class ControleFuncionarioServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //RECEBE O TIPOD E OPERACAO A REALIZAR
        String operacao = request.getParameter("operacao");
        //LOG PARA TESTE
        System.out.println("Controle Acionado com Operacao: " + operacao);

        String proximaPagina = "";

        if (operacao == null || operacao.equals("FuncionarioLista")) {


            List<Funcionarios> lstFuncionario = FuncionariosDAO.getInstance().leTodos();
            request.setAttribute("lstFuncionario", lstFuncionario);

            List<UF> lstUF = UFDAO.getInstance().leTodos();
            request.setAttribute("lstUF", lstUF);

            Funcionarios mostrarFuncionario = new Funcionarios();
            mostrarFuncionario.setCodigo(0);

            Funcionarios editarFuncionario = new Funcionarios();
            editarFuncionario.setCodigo(0);

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("editarFuncionario", editarFuncionario);
            request.setAttribute("mostrarFuncionario", mostrarFuncionario);
            
            proximaPagina = "/Painel_controle/ong/pesquisar_funcionario.jsp";

        } else if (operacao.equals("FuncionarioNovo")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de Funcionarios

            if (msgErro == null || msgErro.equals("")) {

                List<UF> lstUF = UFDAO.getInstance().leTodos();
                request.setAttribute("lstUF", lstUF);

                Funcionarios funcionario = new Funcionarios();
                request.setAttribute("Funcionarios", funcionario);
            }

            proximaPagina = "/Painel_controle/ong/cad_funcionario.jsp";

        } else if (operacao.equals("FuncionarioNovoProcessa")) {

            //COVNERTE DATA
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/mm/yyyy");
            // ISNTANCIA A CLASSE - Obtem dados do formulario
            Funcionarios funcionario = new Funcionarios();

            //RECUPERA PARAMENTRO DESCRICAO
            try{

                funcionario.setNome(request.getParameter("nome"));
                funcionario.setUf(Integer.parseInt(request.getParameter("uf_codigo")));
                funcionario.setEmail(request.getParameter("Email"));
                funcionario.setTelefone(request.getParameter("telefone"));
                funcionario.setBairro(request.getParameter("bairro"));
                funcionario.setCidade(request.getParameter("cidade"));

                Date dtadmissao = dateFormat.parse(request.getParameter("dataadmissao"));
                funcionario.setDataAdmissao(dtadmissao);

                Date dtnascimento = dateFormat.parse(request.getParameter("datanascimento"));
                funcionario.setDataNascimento(dtnascimento);

                funcionario.setCep(request.getParameter("cep"));
                funcionario.setCpf(request.getParameter("cpf"));
                funcionario.setRg(request.getParameter("rg"));
                funcionario.setEndereco(request.getParameter("endereco"));
                funcionario.setCargo(request.getParameter("cargo"));

                 Date dtCadastro = new Date();
                funcionario.setDataCadastro(dtCadastro);

                funcionario.setComplemento(request.getParameter("complemento"));
               

                // Mensagem de erro e proxima pagina
                String msgErro = funcionario.validaDados(funcionario.INCLUSAO);

                // Monta Funcionario com dados validos ou monta mensagens de erro

                if (msgErro.equals("")) {

                    //funcionario.setCodigo(funcionario.getCodigo());

                    funcionario.setNome(funcionario.getNome());
                    funcionario.setUf(funcionario.getUf());
                    funcionario.setEmail(funcionario.getEmail());
                    funcionario.setTelefone(funcionario.getTelefone());
                    funcionario.setBairro(funcionario.getBairro());
                    funcionario.setCidade(funcionario.getCidade());
                    funcionario.setDataAdmissao(funcionario.getDataAdmissao());
                    funcionario.setDataNascimento(funcionario.getDataNascimento());
                    funcionario.setCep(funcionario.getCep());
                    funcionario.setCpf(funcionario.getCpf());
                    funcionario.setRg(funcionario.getRg());
                    funcionario.setEndereco(funcionario.getEndereco());
                    funcionario.setCargo(funcionario.getCargo());
                    funcionario.setDataCadastro(funcionario.getDataCadastro());
                    funcionario.setComplemento(funcionario.getComplemento());
                    
                    //EFETUA A GRAVACAO DOS DADOS
                    FuncionariosDAO.getInstance().grava(funcionario);

                    //REMOVE OS ATRIBUTOS
                    request.removeAttribute("msgErro");
                    request.removeAttribute("Funcionario");

                    proximaPagina = "ControleFuncionarioServlet?operacao=FuncionarioNovo";

                } else {
                    request.setAttribute("msgErro", msgErro);

                    //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
                    request.setAttribute("Funcionario", funcionario);

                    proximaPagina = "ControleFuncionarioServlet?operacao=FuncionarioNovo";
                }
            }catch(ParseException e){
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            }catch(Exception ex){
                System.out.println(ex.getMessage());
                System.out.println(ex.getStackTrace());
            }
         } else if (operacao.equals("FuncionarioMostra")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de Funcionarios
            if (msgErro == null || msgErro.equals("")) {

                //Busca pelo codigo
                Funcionarios funcionario = FuncionariosDAO.getInstance().le(request.getParameter("codigo"));

                  List<UF> lstUF = UFDAO.getInstance().leTodos();
                //Busca Todos
                List<Funcionarios> lstFuncionario = FuncionariosDAO.getInstance().leTodos();

                Funcionarios mostrarFuncionario = new Funcionarios();

                mostrarFuncionario.setCodigo(funcionario.getCodigo());
                mostrarFuncionario.setNome(funcionario.getNome());
                mostrarFuncionario.setUf(funcionario.getUf());
                mostrarFuncionario.setEmail(funcionario.getEmail());
                mostrarFuncionario.setTelefone(funcionario.getTelefone());
                mostrarFuncionario.setBairro(funcionario.getBairro());
                mostrarFuncionario.setCidade(funcionario.getCidade());
                mostrarFuncionario.setDataAdmissao(funcionario.getDataAdmissao());
                mostrarFuncionario.setDataNascimento(funcionario.getDataNascimento());
                mostrarFuncionario.setCep(funcionario.getCep());
                mostrarFuncionario.setCpf(funcionario.getCpf());
                mostrarFuncionario.setRg(funcionario.getRg());
                mostrarFuncionario.setEndereco(funcionario.getEndereco());
                mostrarFuncionario.setSexo(funcionario.getSexo());
                mostrarFuncionario.setDataCadastro(funcionario.getDataCadastro());
                mostrarFuncionario.setComplemento(funcionario.getComplemento());
                mostrarFuncionario.setCargo(funcionario.getCargo());
                
                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP - Para preencher a grid
                request.setAttribute("lstFuncionario", lstFuncionario);
                request.setAttribute("mostrarFuncionario", mostrarFuncionario);
                request.setAttribute("lstUF", lstUF);
            }

            proximaPagina = "/Painel_controle/ong/pesquisar_funcionario.jsp";

        }else if (operacao.equals("FuncionarioEditaProcessa")) {

            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/mm/yyyy");

            Funcionarios funcionario = new Funcionarios();

            int codigo =   Integer.parseInt(request.getParameter("codigo"));

            funcionario.setCodigo(codigo);
            funcionario.setNome(request.getParameter("nome"));
            funcionario.setUf(Integer.parseInt(request.getParameter("uf_codigo")));
            funcionario.setEmail(request.getParameter("Email"));
            funcionario.setTelefone(request.getParameter("telefone"));
            funcionario.setBairro(request.getParameter("bairro"));
            funcionario.setCidade(request.getParameter("cidade"));
            funcionario.setCep(request.getParameter("cep"));
            funcionario.setCpf(request.getParameter("cpf"));
            funcionario.setRg(request.getParameter("rg"));
            funcionario.setEndereco(request.getParameter("endereco"));
            funcionario.setCargo(request.getParameter("cargo"));
            funcionario.setComplemento(request.getParameter("complemento"));
            //RECUPERA PARAMENTRO DESCRICAO
            try{
                Date dtadmissao = dateFormat.parse(request.getParameter("dataadmissao"));
                funcionario.setDataAdmissao(dtadmissao);
                Date dtnascimento = dateFormat.parse(request.getParameter("dataNascimento"));
                funcionario.setDataNascimento(dtnascimento);
                Date dtCadastro = new Date();
                funcionario.setDataCadastro(dtCadastro);

                // Mensagem de erro e proxima pagina
                String msgErro = funcionario.validaDados(funcionario.ALTERACAO);
                // Monta Funcionario com dados validos ou monta mensagens de erro

                if (msgErro.equals("")) {

                    //funcionario.setCodigo(funcionario.getCodigo());

                    funcionario.setNome(funcionario.getNome());
                    funcionario.setUf(funcionario.getUf());
                    funcionario.setEmail(funcionario.getEmail());
                    funcionario.setTelefone(funcionario.getTelefone());
                    funcionario.setBairro(funcionario.getBairro());
                    funcionario.setCidade(funcionario.getCidade());
                    funcionario.setDataAdmissao(funcionario.getDataAdmissao());
                    funcionario.setDataNascimento(funcionario.getDataNascimento());
                    funcionario.setCep(funcionario.getCep());
                    funcionario.setCpf(funcionario.getCpf());
                    funcionario.setRg(funcionario.getRg());
                    funcionario.setEndereco(funcionario.getEndereco());
                    funcionario.setCargo(funcionario.getCargo());
                    funcionario.setDataCadastro(funcionario.getDataCadastro());
                    funcionario.setComplemento(funcionario.getComplemento());

                    //FAZ O UPDATE OU SEJA ATUALIZA O DADO EDITADO
                    FuncionariosDAO.getInstance().altera(funcionario);

                    //REMOVE OS ATRIBUTOS
                    request.removeAttribute("msgErro");
                    request.removeAttribute("Funcionario");

                    proximaPagina = "ControleFuncionarioServlet?operacao=FuncionarioLista";

                } else {
                    request.setAttribute("msgErro", msgErro);

                    //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
                    request.setAttribute("Funcionario", funcionario);

                    proximaPagina = "ControleFuncionarioServlet?operacao=FuncionarioEdita";
                }
            }catch(ParseException e){
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            }catch(Exception ex){
                System.out.println(ex.getMessage());
                System.out.println(ex.getStackTrace());
            }
        }else if (operacao.equals("FuncionarioEdita")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de Funcionarios
            if (msgErro == null || msgErro.equals("")) {

                //Busca pelo codigo
                Funcionarios funcionario = FuncionariosDAO.getInstance().le(request.getParameter("codigo"));
                Funcionarios mostrarFuncionario = new Funcionarios();
                mostrarFuncionario.setCodigo(0);

                List<UF> lstUF = UFDAO.getInstance().leTodos();
                //Busca Todos
                List<Funcionarios> lstFuncionario = FuncionariosDAO.getInstance().leTodos();

                Funcionarios editarFuncionario = new Funcionarios();

                editarFuncionario.setCodigo(funcionario.getCodigo());
                editarFuncionario.setNome(funcionario.getNome());
                editarFuncionario.setUf(funcionario.getUf());
                editarFuncionario.setEmail(funcionario.getEmail());
                editarFuncionario.setTelefone(funcionario.getTelefone());
                editarFuncionario.setBairro(funcionario.getBairro());
                editarFuncionario.setCidade(funcionario.getCidade());
                editarFuncionario.setDataAdmissao(funcionario.getDataAdmissao());
                editarFuncionario.setDataNascimento(funcionario.getDataNascimento());
                editarFuncionario.setCep(funcionario.getCep());
                editarFuncionario.setCpf(funcionario.getCpf());
                editarFuncionario.setRg(funcionario.getRg());
                editarFuncionario.setEndereco(funcionario.getEndereco());
                editarFuncionario.setSexo(funcionario.getSexo());
                editarFuncionario.setDataCadastro(funcionario.getDataCadastro());
                editarFuncionario.setComplemento(funcionario.getComplemento());
                editarFuncionario.setCargo(funcionario.getCargo());

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP - Para preencher a grid
                request.setAttribute("lstFuncionario", lstFuncionario);
                request.setAttribute("editarFuncionario", editarFuncionario);
                request.setAttribute("lstUF", lstUF);
                request.setAttribute("mostrarFuncionario", mostrarFuncionario);
            }

            proximaPagina = "/Painel_controle/ong/pesquisar_funcionario.jsp";

        }else if (operacao.equals("FuncionarioApaga")) {

            //RECUPERA E CONVERTE PARA INT PARA DEPOIS APAGAR O REGISTRO NO BANCO
            int codigo = Integer.parseInt(request.getParameter("codigo"));

            //METODO PARA APAGAR OS DADOS NO BANCO
            int ret = FuncionariosDAO.getInstance().apaga(codigo);

            proximaPagina = "ControleFuncionarioServlet?operacao=FuncionarioLista";

        }

        //PARA DIRECIONAR AS PAGINAS PARA O LOCAL CERTO.
        RequestDispatcher rd = request.getRequestDispatcher(proximaPagina);
        rd.forward(request, response);

    }

// <editor-fold defaultstate="collapsed" desc="M�todos HttpServlet. Clique no sinal de + � esquerda para editar o c�digo.">
    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
