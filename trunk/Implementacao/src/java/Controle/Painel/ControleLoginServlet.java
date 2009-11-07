/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Controle.Painel;

import Entidade.Painel.Funcionarios;
import Persistencia.Painel.LoginDAO;
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
public class ControleLoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //RECEBE O TIPOD E OPERACAO A REALIZAR
        String operacao = request.getParameter("operacao");
        //LOG PARA TESTE
        System.out.println("Controle Acionado com Operacao: " + operacao);

        String proximaPagina = "";

        if (operacao == null || operacao.equals("Logar")) {

            // ISNTANCIA A CLASSE - Obtem dados do formulario
            Funcionarios func = new Funcionarios();

            func.setCpf( request.getParameter("cpf").trim());
            func.setEmail(request.getParameter("email").trim());
            
            String msgErro = func.validaDados(func.LOGAR);

            if (msgErro.equals("")) {

                request.removeAttribute("msgErro");
                
                Funcionarios funcionario = LoginDAO.getInstance().le(func.getEmail(),func.getCpf());

                if(funcionario==null)
                {
                    request.removeAttribute("funcionario");
                    proximaPagina = "/Painel_controle/ong/admin.jsp";
                }
                else
                {
                    request.setAttribute("funcionario", funcionario);
                    proximaPagina = "/Painel_controle/ong/painel.jsp";
                }
            }else {
                request.setAttribute("msgErro", msgErro);

                proximaPagina = "/Painel_controle/ong/admin.jsp";
            }

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
