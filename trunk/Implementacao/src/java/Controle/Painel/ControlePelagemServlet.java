/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Controle.Painel;

import Entidade.Painel.Pelagem;
import Persistencia.Painel.PelagemDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author usuario
 */
public class ControlePelagemServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //RECEBE O TIPOD E OPERACAO A REALIZAR
        String operacao = request.getParameter("operacao");
        //LOG PARA TESTE
        System.out.println("Controle Acionado com Operacao: " + operacao);

        String proximaPagina = "";

        if (operacao == null || operacao.equals("PelagemLista")) {

            //RECUPERA LISTA DE FORMA DE ENVIOS - METODO LETODOS()
            List<Pelagem> lstPelagem = PelagemDAO.getInstance().leTodos();

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("lstPelagem", lstPelagem);

            //INSTANCIA A CLASSE - FEITO PARA SOLUCIONAR PROBLEMA DE ALTERCAO
            Pelagem editarPelagem = new Pelagem();
            editarPelagem.setCodigo(0);
            editarPelagem.setDescricao("");

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("editarPelagem", editarPelagem);

            proximaPagina = "/Painel_controle/ong/gerencia_pelagem.jsp";

        } else if (operacao.equals("PelagemNovo")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de Pelagems
            System.out.println(msgErro);

            if (msgErro == null || msgErro.equals("")) {

                //INSTANCIA A CLASSE
                Pelagem pelagem = new Pelagem();

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSPs
                request.setAttribute("Pelagem", pelagem);
            }

            proximaPagina = "/Painel_controle/ong/gerencia_pelagem.jsp";

        } else if (operacao.equals("PelagemNovoProcessa")) {

            // ISNTANCIA A CLASSE - Obtem dados do formulario
            Pelagem pelagem = new Pelagem();

            //RECUPERA PARAMENTRO DESCRICAO
            pelagem.setDescricao(request.getParameter("descricao").trim());

            // Mensagem de erro e proxima pagina
            String msgErro = pelagem.validaDados(pelagem.INCLUSAO);

            // Monta Pelagem com dados validos ou monta mensagens de erro

            if (msgErro.equals("")) {

                //pelagem.setCodigo(pelagem.getCodigo());
                pelagem.setDescricao(pelagem.getDescricao());

                //EFETUA A GRAVACAO DOS DADOS
                PelagemDAO.getInstance().grava(pelagem);

                //REMOVE OS ATRIBUTOS
                request.removeAttribute("msgErro");
                request.removeAttribute("Pelagem");

                proximaPagina = "ControlePelagemServlet?operacao=PelagemLista";

            } else {
                request.setAttribute("msgErro", msgErro);

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
                request.setAttribute("Pelagem", pelagem);

                proximaPagina = "ControlePelagemServlet?operacao=PelagemNovo";
            }

        } else if (operacao.equals("PelagemMostra")) {

            int codigo =   Integer.parseInt(request.getParameter("codigo"));

            //LE OS DADOS APARTIR DE UM CODIGO
            Pelagem pelagem = PelagemDAO.getInstance().le(codigo);

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("Pelagem", pelagem);

            proximaPagina = "/Painel_controle/ong/gerencia_pelagem.jsp";

        } else if (operacao.equals("PelagemEdita")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de Pelagems
            if (msgErro == null || msgErro.equals("")) {

                //CONVERTE O CODIGO PARA RECUPERAR
                int codigo =   Integer.parseInt(request.getParameter("codigo"));

                //Busca pelo codigo
                Pelagem pelagem = PelagemDAO.getInstance().le(codigo);

                //Busca Todos
                List<Pelagem> lstPelagem = PelagemDAO.getInstance().leTodos();

                Pelagem editarPelagem = new Pelagem();

                editarPelagem.setCodigo(pelagem.getCodigo());
                editarPelagem.setDescricao(pelagem.getDescricao());

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP - Para preencher a grid
                request.setAttribute("lstPelagem", lstPelagem);
                //para preencher os campos que serao alterados
                request.setAttribute("editarPelagem", editarPelagem);
            }

            proximaPagina = "/Painel_controle/ong/gerencia_pelagem.jsp";

        } else if (operacao.equals("PelagemEditaProcessa")) {

            // Obtem dados do formulario
            Pelagem Pelagem = new Pelagem();

            int codigo =   Integer.parseInt(request.getParameter("codigo"));

            Pelagem.setCodigo(codigo);
            Pelagem.setDescricao(request.getParameter("descricao").trim());

            // Mensagem de erro e proxima pagina
            String msgErro = Pelagem.validaDados(Pelagem.ALTERACAO);

            // Monta Pelagem com dados validos ou monta mensagens de erro
            if (msgErro.equals("")) {

                Pelagem pelagem = new Pelagem();

                pelagem.setCodigo(Pelagem.getCodigo());
                pelagem.setDescricao(Pelagem.getDescricao());

                //FAZ O UPDATE OU SEJA ATUALIZA O DADO EDITADO
                PelagemDAO.getInstance().altera(pelagem);

                //REMOVE OS ATRIBUTOS
                request.removeAttribute("msgErro");
                request.removeAttribute("Pelagem");

                proximaPagina = "ControlePelagemServlet?operacao=PelagemLista";
            } else {

                //SETA OS ATRIBUTOS
                request.setAttribute("msgErro", msgErro);
                request.setAttribute("Pelagem", Pelagem);

                proximaPagina = "ControlePelagemServlet?operacao=PelagemEdita";
            }

        } else if (operacao.equals("PelagemApaga")) {

            //RECUPERA E CONVERTE PARA INT PARA DEPOIS APAGAR O REGISTRO NO BANCO
            int codigo = Integer.parseInt(request.getParameter("codigo"));

            //METODO PARA APAGAR OS DADOS NO BANCO
            int ret = PelagemDAO.getInstance().apaga(codigo);

            proximaPagina = "ControlePelagemServlet?operacao=PelagemLista";

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
