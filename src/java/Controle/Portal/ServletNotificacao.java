package Controle.Portal;

import Entidade.Portal.Notificacao;
import Persistencia.Portal.NotificacaoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletNotificacao extends HttpServlet {
   
   
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

        if(operacao.equals("abrirCentro")){

            // Redireciona para a página do Centro de Mensagens

            // Verifica se existe mensagem para o Colaborador

            int codigo = Integer.parseInt(request.getParameter("colaborador"));

             List<Notificacao> lstMsg = NotificacaoDAO.getInstance().carregaMsg(codigo);
              request.setAttribute("Msg", lstMsg);

            proximaPagina="Painel_controle/Usuario/centro_msg.jsp";
        }

        else if(operacao.equals("lerMsg")){

         // Verifica se existe mensagem para o Colaborador

         int codigo = Integer.parseInt(request.getParameter("codigoMsg"));

              Notificacao msg = NotificacaoDAO.getInstance().leMsg(codigo);

              request.setAttribute("Notificacao", msg);

              proximaPagina="Painel_controle/Usuario/lerMsg_usr.jsp";
        }

        else if(operacao.equals("apagaMsg")){

            int codigoMsg = Integer.parseInt(request.getParameter("codigoMsg"));
            int colaborador = Integer.parseInt(request.getParameter("colaborador"));
            String dispara = request.getParameter("dispara");
            
            String pagina = "PainelControle?operacao=exibirPainel&colaborador=" + colaborador;

            if(dispara.equals("centro")){

                pagina = "Painel_controle/Usuario/centro_msg.jsp";
            }

            int ret = NotificacaoDAO.getInstance().apaga(codigoMsg);

            // Verifica se existe mensagem para o Colaborador

            // Remove os dados da sessao.
             request.getSession().removeAttribute("Msg");

             // Recarega as mensagens

              List<Notificacao> lstMsg = NotificacaoDAO.getInstance().carregaMsg(colaborador);

              request.getSession().setAttribute("qtd", lstMsg.size());
              request.getSession().setAttribute("Msg", lstMsg);

            proximaPagina = pagina;
        }


          //PARA DIRECIONAR AS PAGINAS PARA O LOCAL CERTO.
        RequestDispatcher rd = request.getRequestDispatcher(proximaPagina);
        rd.forward(request, response);

    } 
    

}
