package Controle.Portal;

import Entidade.Portal.Mail;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletEmail extends HttpServlet {
   
    
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
        
        if(operacao.equals("enviarProtocolo")){

            String protocolo = request.getParameter("protocolo");
            String email = request.getParameter("email");
            String nome = request.getParameter("nome");

            // Prepara um e-mail com os dados recebidos para que o usuario possa validar mais tarde.

            String msg = "<div style='width:500px; background:#FFC; font:Verdana, Geneva, sans-serif; font-size:12px; color:#003;'>"+
                "<p><h2>Validação de sua conta Necessária!</h2>"+
                "<p>"+nome+", para sua segurança será necessario que vc a ative a sua conta informando o número de protocolo que lhe foi enviado por E-mail, somente após esse procedimento, você poderá se logar no nosso portal.</p>"+
                 "</p><br /><br />"+
                "<div style='width:50%; border:#F00 dotted 1px; margin-left:100px;'>"+
                "<table width='100%'>"+
                    "<tr><td width='34%'>Protocolo: &nbsp;</td><td width='66%'><strong>"+protocolo+"</strong></td>"+
                   "</tr></table></div><br />"+
                " Acesse o link Abaixo para Ativação da conta.<br />"+
                "<a href='http://localhost:8084/WebMAA/Ativacao?operacao=verifica&protocolo="+protocolo+"'>http://localhost:8084/WebMAA/cadastro/ativar_cadastro.jsp</a>"+
                "<br /></div>";

            Mail mail = new Mail();

            try {
                mail.sendMail("Amigos Fieis<webmaatcc@gmail.com>", email , "Validação da Conta",msg);
            } catch (Exception e) {
               e.printStackTrace();
            }
             // Redireciona o fluxo para a JSP

            proximaPagina="cadastro/confirmCad.jsp";

        }
        
        //PARA DIRECIONAR AS PAGINAS PARA O LOCAL CERTO.
        RequestDispatcher rd = request.getRequestDispatcher(proximaPagina);
        rd.forward(request, response);


    } 

    

}
