/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Controle.Painel;

import Entidade.Painel.FaseProcesso;
import Persistencia.Painel.FaseProcessoDAO;
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
public class ControleFaseProcessoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //RECEBE O TIPOD E OPERACAO A REALIZAR
        String operacao = request.getParameter("operacao");
        //LOG PARA TESTE
        System.out.println("Controle Acionado com Operacao: " + operacao);

        String proximaPagina = "";

        if (operacao == null || operacao.equals("FaseProcessoLista")) {

            //RECUPERA LISTA DE FORMA DE ENVIOS - METODO LETODOS()
            List<FaseProcesso> lstFaseProcesso = FaseProcessoDAO.getInstance().leTodos();

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("lstFaseProcesso", lstFaseProcesso);

            //INSTANCIA A CLASSE - FEITO PARA SOLUCIONAR PROBLEMA DE ALTERCAO
            FaseProcesso editarFaseProcesso = new FaseProcesso();
            editarFaseProcesso.setCodigo(0);
            editarFaseProcesso.setDescricao("");

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("editarFaseProcesso", editarFaseProcesso);

            proximaPagina = "/Painel_controle/ong/gerencia_faseprocesso.jsp";

        } else if (operacao.equals("FaseProcessoNovo")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de FaseProcessos
            System.out.println(msgErro);

            if (msgErro == null || msgErro.equals("")) {

                //INSTANCIA A CLASSE
                FaseProcesso faseprocesso = new FaseProcesso();

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSPs
                request.setAttribute("FaseProcesso", faseprocesso);
            }

            proximaPagina = "/Painel_controle/ong/gerencia_faseprocesso.jsp";

        } else if (operacao.equals("FaseProcessoNovoProcessa")) {

            // ISNTANCIA A CLASSE - Obtem dados do formulario
            FaseProcesso faseprocesso = new FaseProcesso();

            //RECUPERA PARAMENTRO DESCRICAO
            faseprocesso.setDescricao(request.getParameter("descricao").trim());

            // Mensagem de erro e proxima pagina
            String msgErro = faseprocesso.validaDados(faseprocesso.INCLUSAO);

            // Monta FaseProcesso com dados validos ou monta mensagens de erro

            if (msgErro.equals("")) {

                //faseprocesso.setCodigo(faseprocesso.getCodigo());
                faseprocesso.setDescricao(faseprocesso.getDescricao());

                //EFETUA A GRAVACAO DOS DADOS
                FaseProcessoDAO.getInstance().grava(faseprocesso);

                //REMOVE OS ATRIBUTOS
                request.removeAttribute("msgErro");
                request.removeAttribute("FaseProcesso");

                proximaPagina = "ControleFaseProcessoServlet?operacao=FaseProcessoLista";

            } else {
                request.setAttribute("msgErro", msgErro);

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
                request.setAttribute("FaseProcesso", faseprocesso);

                proximaPagina = "ControleFaseProcessoServlet?operacao=FaseProcessoNovo";
            }

        } else if (operacao.equals("FaseProcessoMostra")) {

            int codigo =   Integer.parseInt(request.getParameter("codigo"));

            //LE OS DADOS APARTIR DE UM CODIGO
            FaseProcesso faseprocesso = FaseProcessoDAO.getInstance().le(codigo);

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("FaseProcesso", faseprocesso);

            proximaPagina = "/Painel_controle/ong/gerencia_faseprocesso.jsp";

        } else if (operacao.equals("FaseProcessoEdita")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de FaseProcessos
            if (msgErro == null || msgErro.equals("")) {

                //CONVERTE O CODIGO PARA RECUPERAR
                int codigo =   Integer.parseInt(request.getParameter("codigo"));

                //Busca pelo codigo
                FaseProcesso faseprocesso = FaseProcessoDAO.getInstance().le(codigo);

                //Busca Todos
                List<FaseProcesso> lstFaseProcesso = FaseProcessoDAO.getInstance().leTodos();

                FaseProcesso editarFaseProcesso = new FaseProcesso();

                editarFaseProcesso.setCodigo(faseprocesso.getCodigo());
                editarFaseProcesso.setDescricao(faseprocesso.getDescricao());

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP - Para preencher a grid
                request.setAttribute("lstFaseProcesso", lstFaseProcesso);
                //para preencher os campos que serao alterados
                request.setAttribute("editarFaseProcesso", editarFaseProcesso);

                proximaPagina = "/Painel_controle/ong/gerencia_faseprocesso.jsp";
            }

            

        } else if (operacao.equals("FaseProcessoEditaProcessa")) {

            // Obtem dados do formulario
            FaseProcesso FaseProcesso = new FaseProcesso();

            int codigo =   Integer.parseInt(request.getParameter("codigo"));

            FaseProcesso.setCodigo(codigo);
            FaseProcesso.setDescricao(request.getParameter("descricao").trim());

            // Mensagem de erro e proxima pagina
            String msgErro = FaseProcesso.validaDados(FaseProcesso.ALTERACAO);

            // Monta FaseProcesso com dados validos ou monta mensagens de erro
            if (msgErro.equals("")) {

                FaseProcesso faseprocesso = new FaseProcesso();

                faseprocesso.setCodigo(FaseProcesso.getCodigo());
                faseprocesso.setDescricao(FaseProcesso.getDescricao());

                //FAZ O UPDATE OU SEJA ATUALIZA O DADO EDITADO
                FaseProcessoDAO.getInstance().altera(faseprocesso);

                //REMOVE OS ATRIBUTOS
                request.removeAttribute("msgErro");
                request.removeAttribute("FaseProcesso");

                proximaPagina = "ControleFaseProcessoServlet?operacao=FaseProcessoLista";
            } else {

                //SETA OS ATRIBUTOS
                request.setAttribute("msgErro", msgErro);
                request.setAttribute("FaseProcesso", FaseProcesso);

                proximaPagina = "ControleFaseProcessoServlet?operacao=FaseProcessoEdita";
            }

        } else if (operacao.equals("FaseProcessoApaga")) {

            //RECUPERA E CONVERTE PARA INT PARA DEPOIS APAGAR O REGISTRO NO BANCO
            int codigo = Integer.parseInt(request.getParameter("codigo"));

            //METODO PARA APAGAR OS DADOS NO BANCO
            int ret = FaseProcessoDAO.getInstance().apaga(codigo);

            proximaPagina = "ControleFaseProcessoServlet?operacao=FaseProcessoLista";

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
