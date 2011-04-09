/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Controle.Painel;

import Entidade.Painel.PorteAnimal;
import Persistencia.Painel.PorteAnimalDAO;
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
public class ControlePorteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //RECEBE O TIPOD E OPERACAO A REALIZAR
        String operacao = request.getParameter("operacao");
        //LOG PARA TESTE
        System.out.println("Controle Acionado com Operacao: " + operacao);

        String proximaPagina = "";

        if (operacao == null || operacao.equals("PorteLista")) {

            //RECUPERA LISTA DE FORMA DE ENVIOS - METODO LETODOS()
            List<PorteAnimal> lstPorteAnimal = PorteAnimalDAO.getInstance().leTodos();

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("lstPorteAnimal", lstPorteAnimal);

            //INSTANCIA A CLASSE - FEITO PARA SOLUCIONAR PROBLEMA DE ALTERCAO
            PorteAnimal editarPorteAnimal = new PorteAnimal();
            editarPorteAnimal.setCodigo(0);
            editarPorteAnimal.setDescricao("");

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("editarPorte", editarPorteAnimal);

            proximaPagina = "/Painel_controle/ong/gerencia_portes.jsp";

        } else if (operacao.equals("PorteNovo")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de PorteAnimals
            System.out.println(msgErro);

            if (msgErro == null || msgErro.equals("")) {

                //INSTANCIA A CLASSE
                PorteAnimal porteAnimal = new PorteAnimal();

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSPs
                request.setAttribute("PorteAnimal", porteAnimal);
            }

            proximaPagina = "/Painel_controle/ong/gerencia_portes.jsp";

        } else if (operacao.equals("PorteNovoProcessa")) {

            // ISNTANCIA A CLASSE - Obtem dados do formulario
            PorteAnimal porteAnimal = new PorteAnimal();

            //RECUPERA PARAMENTRO DESCRICAO
            porteAnimal.setDescricao(request.getParameter("descricao").trim());

            // Mensagem de erro e proxima pagina
            String msgErro = porteAnimal.validaDados(porteAnimal.INCLUSAO);

            // Monta PorteAnimal com dados validos ou monta mensagens de erro

            if (msgErro.equals("")) {

                //porteAnimal.setCodigo(porteAnimal.getCodigo());
                porteAnimal.setDescricao(porteAnimal.getDescricao());

                //EFETUA A GRAVACAO DOS DADOS
                PorteAnimalDAO.getInstance().grava(porteAnimal);

                //REMOVE OS ATRIBUTOS
                request.removeAttribute("msgErro");
                request.removeAttribute("PorteAnimal");

                proximaPagina = "ControlePorteServlet?operacao=PorteLista";

            } else {
                request.setAttribute("msgErro", msgErro);

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
                request.setAttribute("PorteAnimal", porteAnimal);

                proximaPagina = "ControlePorteServlet?operacao=PorteNovo";
            }

        } else if (operacao.equals("PorteMostra")) {

            int codigo =   Integer.parseInt(request.getParameter("codigo"));

            //LE OS DADOS APARTIR DE UM CODIGO
            PorteAnimal porteAnimal = PorteAnimalDAO.getInstance().le(codigo);

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("PorteAnimal", porteAnimal);

            proximaPagina = "/Painel_controle/ong/gerencia_portes.jsp";

        } else if (operacao.equals("PorteEdita")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de PorteAnimals
            if (msgErro == null || msgErro.equals("")) {

                //CONVERTE O CODIGO PARA RECUPERAR
                int codigo =   Integer.parseInt(request.getParameter("codigo"));

                //Busca pelo codigo
                PorteAnimal porteAnimal = PorteAnimalDAO.getInstance().le(codigo);

                //Busca Todos
                List<PorteAnimal> lstPorteAnimal = PorteAnimalDAO.getInstance().leTodos();

                PorteAnimal editarPorteAnimal = new PorteAnimal();

                editarPorteAnimal.setCodigo(porteAnimal.getCodigo());
                editarPorteAnimal.setDescricao(porteAnimal.getDescricao());

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP - Para preencher a grid
                request.setAttribute("lstPorteAnimal", lstPorteAnimal);
                //para preencher os campos que serao alterados
                request.setAttribute("editarPorte", editarPorteAnimal);
            }

            proximaPagina = "/Painel_controle/ong/gerencia_portes.jsp";

        } else if (operacao.equals("PorteEditaProcessa")) {

            // Obtem dados do formulario
            PorteAnimal PorteAnimal = new PorteAnimal();

            int codigo =   Integer.parseInt(request.getParameter("codigo"));

            PorteAnimal.setCodigo(codigo);
            PorteAnimal.setDescricao(request.getParameter("descricao").trim());

            // Mensagem de erro e proxima pagina
            String msgErro = PorteAnimal.validaDados(PorteAnimal.ALTERACAO);

            // Monta PorteAnimal com dados validos ou monta mensagens de erro
            if (msgErro.equals("")) {

                PorteAnimal porteAnimal = new PorteAnimal();

                porteAnimal.setCodigo(PorteAnimal.getCodigo());
                porteAnimal.setDescricao(PorteAnimal.getDescricao());

                //FAZ O UPDATE OU SEJA ATUALIZA O DADO EDITADO
                PorteAnimalDAO.getInstance().altera(porteAnimal);

                //REMOVE OS ATRIBUTOS
                request.removeAttribute("msgErro");
                request.removeAttribute("PorteAnimal");

                proximaPagina = "ControlePorteServlet?operacao=PorteLista";
            } else {

                //SETA OS ATRIBUTOS
                request.setAttribute("msgErro", msgErro);
                request.setAttribute("PorteAnimal", PorteAnimal);

                proximaPagina = "ControlePorteServlet?operacao=PorteEdita";
            }

        } else if (operacao.equals("PorteApaga")) {

            //RECUPERA E CONVERTE PARA INT PARA DEPOIS APAGAR O REGISTRO NO BANCO
            int codigo = Integer.parseInt(request.getParameter("codigo"));

            //METODO PARA APAGAR OS DADOS NO BANCO
            int ret = PorteAnimalDAO.getInstance().apaga(codigo);

            proximaPagina = "ControlePorteServlet?operacao=PorteLista";

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
