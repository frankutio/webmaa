/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Controle.Painel;

import Entidade.Painel.Cor;
import Persistencia.Painel.CorDAO;
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
public class ControleCorServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //RECEBE O TIPOD E OPERACAO A REALIZAR
        String operacao = request.getParameter("operacao");
        //LOG PARA TESTE
        System.out.println("Controle Acionado com Operacao: " + operacao);

        String proximaPagina = "";

        if (operacao == null || operacao.equals("CorLista")) {

            //RECUPERA LISTA DE FORMA DE ENVIOS - METODO LETODOS()
            List<Cor> lstCor = CorDAO.getInstance().leTodos();

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("lstCor", lstCor);

            //INSTANCIA A CLASSE - FEITO PARA SOLUCIONAR PROBLEMA DE ALTERCAO
            Cor editarCor = new Cor();
            editarCor.setCodigo(0);
            editarCor.setDescricao("");

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("editarCor", editarCor);

            proximaPagina = "/Painel_controle/ong/gerencia_cor.jsp";

        } else if (operacao.equals("CorNovo")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de Cors
            System.out.println(msgErro);

            if (msgErro == null || msgErro.equals("")) {

                //INSTANCIA A CLASSE
                Cor cor = new Cor();

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSPs
                request.setAttribute("Cor", cor);
            }

            proximaPagina = "/Painel_controle/ong/gerencia_cor.jsp";

        } else if (operacao.equals("CorNovoProcessa")) {

            // ISNTANCIA A CLASSE - Obtem dados do formulario
            Cor cor = new Cor();

            //RECUPERA PARAMENTRO DESCRICAO
            cor.setDescricao(request.getParameter("descricao").trim());

            // Mensagem de erro e proxima pagina
            String msgErro = cor.validaDados(cor.INCLUSAO);

            // Monta Cor com dados validos ou monta mensagens de erro

            if (msgErro.equals("")) {

                //cor.setCodigo(cor.getCodigo());
                cor.setDescricao(cor.getDescricao());

                //EFETUA A GRAVACAO DOS DADOS
                CorDAO.getInstance().grava(cor);

                //REMOVE OS ATRIBUTOS
                request.removeAttribute("msgErro");
                request.removeAttribute("Cor");

                proximaPagina = "ControleCorServlet?operacao=CorLista";

            } else {
                request.setAttribute("msgErro", msgErro);

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
                request.setAttribute("Cor", cor);

                proximaPagina = "ControleCorServlet?operacao=CorNovo";
            }

        } else if (operacao.equals("CorMostra")) {

            int codigo =   Integer.parseInt(request.getParameter("codigo"));

            //LE OS DADOS APARTIR DE UM CODIGO
            Cor cor = CorDAO.getInstance().le(codigo);

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("Cor", cor);

            proximaPagina = "/Painel_controle/ong/gerencia_cor.jsp";

        } else if (operacao.equals("CorEdita")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de Cors
            if (msgErro == null || msgErro.equals("")) {

                //CONVERTE O CODIGO PARA RECUPERAR
                int codigo =   Integer.parseInt(request.getParameter("codigo"));

                //Busca pelo codigo
                Cor cor = CorDAO.getInstance().le(codigo);

                //Busca Todos
                List<Cor> lstCor = CorDAO.getInstance().leTodos();

                Cor editarCor = new Cor();

                editarCor.setCodigo(cor.getCodigo());
                editarCor.setDescricao(cor.getDescricao());

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP - Para preencher a grid
                request.setAttribute("lstCor", lstCor);
                //para preencher os campos que serao alterados
                request.setAttribute("editarCor", editarCor);
            }

            proximaPagina = "/Painel_controle/ong/gerencia_cor.jsp";

        } else if (operacao.equals("CorEditaProcessa")) {

            // Obtem dados do formulario
            Cor Cor = new Cor();

            int codigo =   Integer.parseInt(request.getParameter("codigo"));

            Cor.setCodigo(codigo);
            Cor.setDescricao(request.getParameter("descricao").trim());

            // Mensagem de erro e proxima pagina
            String msgErro = Cor.validaDados(Cor.ALTERACAO);

            // Monta Cor com dados validos ou monta mensagens de erro
            if (msgErro.equals("")) {

                Cor cor = new Cor();

                cor.setCodigo(Cor.getCodigo());
                cor.setDescricao(Cor.getDescricao());

                //FAZ O UPDATE OU SEJA ATUALIZA O DADO EDITADO
                CorDAO.getInstance().altera(cor);

                //REMOVE OS ATRIBUTOS
                request.removeAttribute("msgErro");
                request.removeAttribute("Cor");

                proximaPagina = "ControleCorServlet?operacao=CorLista";
            } else {

                //SETA OS ATRIBUTOS
                request.setAttribute("msgErro", msgErro);
                request.setAttribute("Cor", Cor);

                proximaPagina = "ControleCorServlet?operacao=CorEdita";
            }

        } else if (operacao.equals("CorApaga")) {

            //RECUPERA E CONVERTE PARA INT PARA DEPOIS APAGAR O REGISTRO NO BANCO
            int codigo = Integer.parseInt(request.getParameter("codigo"));

            //METODO PARA APAGAR OS DADOS NO BANCO
            int ret = CorDAO.getInstance().apaga(codigo);

            proximaPagina = "ControleCorServlet?operacao=CorLista";

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
