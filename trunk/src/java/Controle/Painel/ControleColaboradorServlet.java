package Controle.Painel;

import Entidade.Painel.Colaborador;
import Entidade.Painel.UF;
import Persistencia.Painel.ColaboradorDAO;
import Persistencia.Painel.UFDAO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Date;
import java.text.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class ControleColaboradorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //RECEBE O TIPOD E OPERACAO A REALIZAR
        String operacao = request.getParameter("operacao");
        //LOG PARA TESTE
        System.out.println("Controle Acionado com Operacao: " + operacao);

        String proximaPagina = "";

        if (operacao == null || operacao.equals("ColaboradorLista")) {

            //RECUPERA LISTA DE FORMA DE ENVIOS - METODO LETODOS()
            List<Colaborador> lstColaborador = ColaboradorDAO.getInstance().leTodos();
            request.setAttribute("lstColaborador", lstColaborador);

            List<UF> lstUF = UFDAO.getInstance().leTodos();
            request.setAttribute("lstUF", lstUF);
            
            Colaborador editarColaborador = new Colaborador();
            editarColaborador.setCodigo(0);
            
            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("editarColaborador", editarColaborador);

            proximaPagina = "/Painel_controle/ong/pesquisar_colaborador.jsp";

        } else if (operacao.equals("ColaboradorNovo")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de Colaboradors
            if (msgErro == null || msgErro.equals("")) {

                List<UF> lstUF = UFDAO.getInstance().leTodos();
                request.setAttribute("lstUF", lstUF);

                Colaborador colaborador = new Colaborador();
                request.setAttribute("Colaborador", colaborador);
            }

            proximaPagina = "/Painel_controle/ong/cad_colaborador.jsp";

        } else if (operacao.equals("ColaboradorNovoProcessa")) {

            //COVNERTE DATA
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/mm/yyyy");
            // ISNTANCIA A CLASSE - Obtem dados do formulario
            Colaborador colaborador = new Colaborador();

            //RECUPERA PARAMENTRO DESCRICAO
            try{

                colaborador.setNome(request.getParameter("nome"));
                colaborador.setUf(Integer.parseInt(request.getParameter("uf_codigo")));
                colaborador.setEmail(request.getParameter("Email"));
                colaborador.setTelefone(request.getParameter("telefone"));
                colaborador.setBairro(request.getParameter("bairro"));
                colaborador.setCidade(request.getParameter("cidade"));
                colaborador.setNumero(Integer.parseInt(request.getParameter("numero")));

                System.out.println(request.getParameter("datanascimento"));

                Date dtnascimento = dateFormat.parse(request.getParameter("datanascimento"));
                colaborador.setDataNascimento(dtnascimento);

                colaborador.setCep(request.getParameter("cep"));
                colaborador.setCpf(request.getParameter("cpf"));
                colaborador.setRg(request.getParameter("rg"));
                colaborador.setEndereco(request.getParameter("endereco"));
                colaborador.setSexo(request.getParameter("sexo"));

                Date dtCadastro = new Date();
                colaborador.setDatacadastro(dtCadastro);

                colaborador.setComplemento(request.getParameter("complemento"));
                colaborador.setEndFoto(request.getParameter("foto"));
                colaborador.setCelular(request.getParameter("celular"));

                // Mensagem de erro e proxima pagina
                String msgErro = colaborador.validaDados(colaborador.INCLUSAO);

                // Monta Colaborador com dados validos ou monta mensagens de erro

                if (msgErro.equals("")) {

                    //colaborador.setCodigo(colaborador.getCodigo());

                    colaborador.setNome(colaborador.getNome());
                    colaborador.setUf(colaborador.getUf());
                    colaborador.setEmail(colaborador.getEmail());
                    colaborador.setTelefone(colaborador.getTelefone());
                    colaborador.setBairro(colaborador.getBairro());
                    colaborador.setCidade(colaborador.getCidade());
                    colaborador.setNumero(colaborador.getNumero());
                    colaborador.setDataNascimento(colaborador.getDataNascimento());
                    colaborador.setCep(colaborador.getCep());
                    colaborador.setCpf(colaborador.getCpf());
                    colaborador.setRg(colaborador.getRg());
                    colaborador.setEndereco(colaborador.getEndereco());
                    colaborador.setSexo(colaborador.getSexo());
                    colaborador.setDatacadastro(colaborador.getDataCadastro());
                    colaborador.setComplemento(colaborador.getComplemento());
                    colaborador.setEndFoto(colaborador.getEndFoto());
                    colaborador.setCelular(colaborador.getCelular());
                    //EFETUA A GRAVACAO DOS DADOS
                    ColaboradorDAO.getInstance().grava(colaborador);

                    //REMOVE OS ATRIBUTOS
                    request.removeAttribute("msgErro");
                    request.removeAttribute("Colaborador");

                    proximaPagina = "ControleColaboradorServlet?operacao=ColaboradorNovo";

                } else {
                    request.setAttribute("msgErro", msgErro);

                    //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
                    request.setAttribute("Colaborador", colaborador);

                    proximaPagina = "ControleColaboradorServlet?operacao=ColaboradorNovo";
                }
            }catch(ParseException e){
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            }catch(Exception ex){
                System.out.println(ex.getMessage());
                System.out.println(ex.getStackTrace());
            }
        } else if (operacao.equals("ColaboradorMostra")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de Colaboradors
            if (msgErro == null || msgErro.equals("")) {

                //Busca pelo codigo
                int codigo= Integer.parseInt(request.getParameter("codigo"));
                Colaborador colaborador = ColaboradorDAO.getInstance().le(codigo);

                List<UF> lstUF = UFDAO.getInstance().leTodos();

                //Busca Todos
                List<Colaborador> lstColaborador = ColaboradorDAO.getInstance().leTodos();

                Colaborador editarColaborador = new Colaborador();

                editarColaborador.setCodigo(colaborador.getCodigo());
                editarColaborador.setNome(colaborador.getNome());
                editarColaborador.setUf(colaborador.getUf());
                editarColaborador.setEmail(colaborador.getEmail());
                editarColaborador.setTelefone(colaborador.getTelefone());
                editarColaborador.setBairro(colaborador.getBairro());
                editarColaborador.setCidade(colaborador.getCidade());
                editarColaborador.setNumero(colaborador.getNumero());
                editarColaborador.setDataNascimento(colaborador.getDataNascimento());
                editarColaborador.setCep(colaborador.getCep());
                editarColaborador.setCpf(colaborador.getCpf());
                editarColaborador.setRg(colaborador.getRg());
                editarColaborador.setEndereco(colaborador.getEndereco());
                editarColaborador.setSexo(colaborador.getSexo());
                editarColaborador.setDatacadastro(colaborador.getDataCadastro());
                editarColaborador.setComplemento(colaborador.getComplemento());
                editarColaborador.setEndFoto(colaborador.getEndFoto());
                editarColaborador.setCelular(colaborador.getCelular());

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP - Para preencher a grid
                request.setAttribute("lstColaborador", lstColaborador);
                //para preencher os campos que serao alterados
                request.setAttribute("editarColaborador", editarColaborador);
                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
                request.setAttribute("lstUF", lstUF);
            }

            proximaPagina = "/Painel_controle/ong/pesquisar_colaborador.jsp";

        } else if (operacao.equals("ColaboradorApaga")) {

            //RECUPERA E CONVERTE PARA INT PARA DEPOIS APAGAR O REGISTRO NO BANCO
            int codigo = Integer.parseInt(request.getParameter("codigo"));

            //METODO PARA APAGAR OS DADOS NO BANCO
            int ret = ColaboradorDAO.getInstance().apaga(codigo);

            proximaPagina = "ControleColaboradorServlet?operacao=ColaboradorLista";

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
