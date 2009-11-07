package Controle.Portal;

import Entidade.Portal.Colaborador;
import Persistencia.Portal.PortalColabDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletAtivacao extends HttpServlet {
   
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       processRequest(request, response);
   }
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       processRequest(request, response);
   }
 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

     //RECEBE O TIPOD E OPERACAO A REALIZAR
        String operacao = request.getParameter("operacao");
        //LOG PARA TESTE
        System.out.println("Controle Acionado com Operacao: " + operacao);

        String proximaPagina = "";

        if(operacao.equals("verifica")){
            String protocolo = request.getParameter("protocolo");

            request.setAttribute("Protocolo", protocolo);

            request.setAttribute("Ativado", false);

            proximaPagina="cadastro/ativar_cadastro.jsp";
        }

        else if(operacao.equals("ativar_cad")){

            String cpf = request.getParameter("cpf");
            String protocolo = request.getParameter("protocolo");

            // Chama metodo para verificar os dados informados.

            Colaborador colaborador = PortalColabDAO.getInstance().validaPt(cpf,protocolo);

                
            if(colaborador != null){

                PortalColabDAO.getInstance().desbloqueaColab(colaborador.getCodigo());

                request.setAttribute("Ativado", true);

                proximaPagina = "cadastro/ativar_cadastro.jsp";

            }
            else {

                request.setAttribute("MsgErro", "Problemas na Ativação da Sua Conta. - CPF ou Protocolo Inválido");
                proximaPagina="index.jsp";
            }
        }



        //PARA DIRECIONAR AS PAGINAS PARA O LOCAL CERTO.
        RequestDispatcher rd = request.getRequestDispatcher(proximaPagina);
        rd.forward(request, response);
    } 

    

}
