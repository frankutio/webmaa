/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Controle.Painel;

import Entidade.Painel.Notificacao;
import Persistencia.Painel.NotificacaoDAO;
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
public class ControleNotificacaoServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
          
        String operacao = request.getParameter("operacao");
        
        System.out.println("Controle Acionado com Operacao: " + operacao);

        String proximaPagina = "";

        
       if (operacao == null || operacao.equals("AnimaisProcessaNotificacao")) {
      
            
            Notificacao notificacao = new Notificacao();

            //RECUPERA PARAMENTRO DESCRICAO
            int codigoanimal=Integer.parseInt(request.getParameter("codigoanimal"));
            
            notificacao.setCodigoFuncionario(Integer.parseInt(request.getParameter("codigo_funcionario")));
            notificacao.setCodigoColaborador(Integer.parseInt(request.getParameter("codigocolaborador")));
            notificacao.setDescricao(request.getParameter("descricaoassunto"));
            notificacao.setDatacadastro(notificacao.getDataCadastro());
            notificacao.setMensagem(request.getParameter("mensagem").trim());
            
            // Mensagem de erro e proxima pagina
            String msgErro = notificacao.validaDados(notificacao.INCLUSAO);

            // Monta Notificacao com dados validos ou monta mensagens de erro

            if (msgErro.equals("")) {

                notificacao.setCodigoFuncionario(notificacao.getCodigoFuncionario());
                notificacao.setCodigoColaborador(notificacao.getCodigoColaborador());
                notificacao.setDescricao(notificacao.getDescricao());
                notificacao.setDatacadastro(notificacao.getDataCadastro());
                notificacao.setMensagem(notificacao.getMensagem());

                //EFETUA A GRAVACAO DOS DADOS
                NotificacaoDAO.getInstance().grava(notificacao);

                //REMOVE OS ATRIBUTOS
                request.removeAttribute("msgErro");
                request.removeAttribute("Notificacao");

                proximaPagina = "/ControleAnimaisServlet?operacao=AnimaisMostraDoacao&codigo="+codigoanimal;

            } else {
                request.setAttribute("msgErro", msgErro);

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
                request.setAttribute("Notificacao", notificacao);

                proximaPagina = "/ControleAnimaisServlet?operacao=AnimaisMostraDoacao&codigo="+codigoanimal;
            }

        
        }

        //PARA DIRECIONAR AS PAGINAS PARA O LOCAL CERTO.
        RequestDispatcher rd = request.getRequestDispatcher(proximaPagina);
        rd.forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="Métodos HttpServlet. Clique no sinal de + à esquerda para editar o código.">
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
