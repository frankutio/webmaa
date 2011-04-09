package Controle.Portal;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletLogoff extends HttpServlet {
   
    
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

        if(operacao.equals("sair")){
            request.getSession().removeAttribute("Log");
            request.getSession().removeAttribute("Colaborador");

            // Remove os dados de mensagem da sessao.
             request.getSession().removeAttribute("Msg");

            if(request.getSession().getAttribute("Animal") != null){

                request.getSession().removeAttribute("Animal");
            }
             if(request.getSession().getAttribute("AnimalCad") != null){

                request.getSession().removeAttribute("AnimalCad");
            }
            if(request.getSession().getAttribute("lstCor") != null){

                request.getSession().removeAttribute("lstCor");
            }
            if(request.getSession().getAttribute("lstPorte") != null){

                request.getSession().removeAttribute("lstPorte");
            }
            if(request.getSession().getAttribute("lstEnvio") != null){

                request.getSession().removeAttribute("lstEnvio");
            }
            if(request.getSession().getAttribute("lstPelagem") != null){

                request.getSession().removeAttribute("lstPelagem");
            }
            if(request.getSession().getAttribute("lstRaca") != null){

                request.getSession().removeAttribute("lstRaca");
            }

            

            proximaPagina = "index.jsp";

        }

        //PARA DIRECIONAR AS PAGINAS PARA O LOCAL CERTO.
        RequestDispatcher rd = request.getRequestDispatcher(proximaPagina);
        rd.forward(request, response);
 }

   

}
