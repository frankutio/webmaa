/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Controle.Painel;

import Entidade.Painel.UF;
import Persistencia.Painel.UFDAO;
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
public class ControleUFServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //RECEBE O TIPOD E OPERACAO A REALIZAR
        String operacao = request.getParameter("operacao");
        //LOG PARA TESTE
        System.out.println("Controle Acionado com Operacao: " + operacao);

        String proximaPagina = "";

        if (operacao == null || operacao.equals("UFLista")) {

            //RECUPERA LISTA DE FORMA DE ENVIOS - METODO LETODOS()
            List<UF> lstUF = UFDAO.getInstance().leTodos();

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("lstUF", lstUF);

            //INSTANCIA A CLASSE - FEITO PARA SOLUCIONAR PROBLEMA DE ALTERCAO
            UF editarUF = new UF();
            editarUF.setCodigo(0);
            editarUF.setUF("");

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("editarUF", editarUF);

            proximaPagina = "/Painel_controle/ong/gerencia_uf.jsp";

        } else if (operacao.equals("UFNovo")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de UFs
            System.out.println(msgErro);

            if (msgErro == null || msgErro.equals("")) {

                //INSTANCIA A CLASSE
                UF uf = new UF();

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSPs
                request.setAttribute("UF", uf);
            }

            proximaPagina = "/Painel_controle/ong/gerencia_uf.jsp";

        } else if (operacao.equals("UFNovoProcessa")) {

            // ISNTANCIA A CLASSE - Obtem dados do formulario
            UF uf = new UF();

            //RECUPERA PARAMENTRO DESCRICAO
            uf.setUF(request.getParameter("descricao").trim());

            // Mensagem de erro e proxima pagina
            String msgErro = uf.validaDados(uf.INCLUSAO);

            // Monta UF com dados validos ou monta mensagens de erro

            if (msgErro.equals("")) {

                //uf.setCodigo(uf.getCodigo());
                uf.setUF(uf.getUF());

                //EFETUA A GRAVACAO DOS DADOS
                UFDAO.getInstance().grava(uf);

                //REMOVE OS ATRIBUTOS
                request.removeAttribute("msgErro");
                request.removeAttribute("UF");

                proximaPagina = "ControleUFServlet?operacao=UFLista";

            } else {
                request.setAttribute("msgErro", msgErro);

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
                request.setAttribute("UF", uf);

                proximaPagina = "ControleUFServlet?operacao=UFNovo";
            }

        } else if (operacao.equals("UFMostra")) {

            int codigo =   Integer.parseInt(request.getParameter("codigo"));

            //LE OS DADOS APARTIR DE UM CODIGO
            UF uf = UFDAO.getInstance().le(codigo);

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("UF", uf);

            proximaPagina = "/Painel_controle/ong/gerencia_uf.jsp";

        } else if (operacao.equals("UFEdita")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de UFs
            if (msgErro == null || msgErro.equals("")) {

                //CONVERTE O CODIGO PARA RECUPERAR
                int codigo =   Integer.parseInt(request.getParameter("codigo"));

                //Busca pelo codigo
                UF uf = UFDAO.getInstance().le(codigo);

                //Busca Todos
                List<UF> lstUF = UFDAO.getInstance().leTodos();

                UF editarUF = new UF();

                editarUF.setCodigo(uf.getCodigo());
                editarUF.setUF(uf.getUF());

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP - Para preencher a grid
                request.setAttribute("lstUF", lstUF);
                //para preencher os campos que serao alterados
                request.setAttribute("editarUF", editarUF);
            }

            proximaPagina = "/Painel_controle/ong/gerencia_uf.jsp";

        } else if (operacao.equals("UFEditaProcessa")) {

            // Obtem dados do formulario
            UF UF = new UF();

            int codigo =   Integer.parseInt(request.getParameter("codigo"));

            UF.setCodigo(codigo);
            UF.setUF(request.getParameter("descricao").trim());

            // Mensagem de erro e proxima pagina
            String msgErro = UF.validaDados(UF.ALTERACAO);

            // Monta UF com dados validos ou monta mensagens de erro
            if (msgErro.equals("")) {

                UF uf = new UF();

                uf.setCodigo(UF.getCodigo());
                uf.setUF(UF.getUF());

                //FAZ O UPDATE OU SEJA ATUALIZA O DADO EDITADO
                UFDAO.getInstance().altera(uf);

                //REMOVE OS ATRIBUTOS
                request.removeAttribute("msgErro");
                request.removeAttribute("UF");

                proximaPagina = "ControleUFServlet?operacao=UFLista";
            } else {

                //SETA OS ATRIBUTOS
                request.setAttribute("msgErro", msgErro);
                request.setAttribute("UF", UF);

                proximaPagina = "ControleUFServlet?operacao=UFEdita";
            }

        } else if (operacao.equals("UFApaga")) {

            //RECUPERA E CONVERTE PARA INT PARA DEPOIS APAGAR O REGISTRO NO BANCO
            int codigo = Integer.parseInt(request.getParameter("codigo"));

            //METODO PARA APAGAR OS DADOS NO BANCO
            int ret = UFDAO.getInstance().apaga(codigo);

            proximaPagina = "ControleUFServlet?operacao=UFLista";

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
