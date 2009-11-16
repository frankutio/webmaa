package Controle.Portal;

import Entidade.Portal.Animais;
import Entidade.Portal.Notificacao;
import Persistencia.Portal.AnimalDAO;
import Persistencia.Portal.NotificacaoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletNotificacaoProcesso extends HttpServlet {
   
    
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

        if(operacao.equals("alteraFase")){

            int fase = Integer.parseInt(request.getParameter("fase"));
            int codigoColaborador = Integer.parseInt(request.getParameter("codigoColab"));
            String dispara = request.getParameter("dispara");
            int codAnimal = Integer.parseInt(request.getParameter("codAnimal"));

            // recupera os dados do animal envolvido no processo.

            Animais animal = AnimalDAO.getInstance().preparaAnimal(codAnimal);

            if(fase == 2){

                 // Prepara uma notificacao para mandar ao usuario.
                Notificacao notificacao = new Notificacao();

                notificacao.setCodigoColaborador(codigoColaborador);
                notificacao.setDataCadastro(new Date(System.currentTimeMillis()));
                notificacao.setAssunto("Fase de Adoção Aprovada");
                notificacao.setRemetenteNotificacao("Sim");
                
                notificacao.setMensagem("<h2>Pedido Aprovado</h2><br><br />" +
                        "O seu pedido de Adoção para o animal abaixo foi aprovado:<br />" +
                        "<strong>Codigo:</strong>"+animal.getCodigo()+"<br />"+
                        "<strong>Espécie:</strong>"+animal.getEspecie()+"<br />" +
                        "<strong>Nome:</strong>"+animal.getNome()+"<br /> <hr />" +
                        "O proprietário do animal acima aceitou o seu pedido de adoção, e aguarda a sua resposta.<br />" +
                        "Você deve acessar o link \"Acompanhar Adoção\" no painel de controle para prosseguir com a Fase 02.<br /><br />" +
                        "<span style=\"color:red;\">Atenção:</span> Essa aprovação não é decisiva pois o proprietario pode desistir a qualquer momento.");

                NotificacaoDAO.getInstance().gravaMsg(notificacao);
                
                proximaPagina=dispara;


            }

        }

        else if(operacao.equals("cancelarProcesso_usuario")){

            int codigoColaborador = Integer.parseInt(request.getParameter("codigoColaborador"));
            int codigoDono = Integer.parseInt(request.getParameter("codigoDono"));
            int codigoAnimal = Integer.parseInt(request.getParameter("codigoAnimal"));

            // Recupera informação do animal

            Animais animal = AnimalDAO.getInstance().preparaAnimal(codigoAnimal);


            // Prepara uma notificação para ser lançada.
                Notificacao notificacao = new Notificacao();

                notificacao.setCodigoColaborador(codigoColaborador);
                notificacao.setDataCadastro(new Date(System.currentTimeMillis()));
                notificacao.setAssunto("Cancelamento de Adoção");
                notificacao.setRemetenteNotificacao("Sim");

                notificacao.setMensagem("<h2>Processo de Adoção Cancelado!</h2><br>"+
                        "<br>" +
                        "Você cancelou o processo de adoção para o seguinte animal:<br />" +
                        "<strong>Codigo:</strong>"+animal.getCodigo()+"<br />" +
                        "<strong>Espécie:</strong>"+animal.getEspecie()+"<br />" +
                        "<strong>Nome:</strong>"+animal.getNome()+"<br /> <hr />" +
                        "<br />" +
                        "Caso queira adota-lo novamente, o mesmo estará disponivel no menu \"Adotar\"");

                NotificacaoDAO.getInstance().gravaMsg(notificacao);

                // Notifica o Dono do Animal cancelado

                Notificacao notificacao2 = new Notificacao();

                notificacao2.setCodigoColaborador(codigoDono);
                notificacao2.setDataCadastro(new Date(System.currentTimeMillis()));
                notificacao2.setAssunto("Cancelamento de Adoção");
                notificacao2.setRemetenteNotificacao("Sim");

                notificacao2.setMensagem("<h2>Processo de Adoção Cancelado!</h2><br>"+
                        "<br>" +
                        "O processo de adoção foi cancelado para o seguinte animal:<br />" +
                        "<strong>Codigo:</strong>"+animal.getCodigo()+"<br />" +
                        "<strong>Espécie:</strong>"+animal.getEspecie()+"<br />" +
                        "<strong>Nome:</strong>"+animal.getNome()+"<br /> <hr />" +
                        "<br />" +
                        "Este animal está novamente disponivel para adoção.");

                NotificacaoDAO.getInstance().gravaMsg(notificacao2);
                
                // Redireciona para o Painel de controle

                proximaPagina ="PainelControle?operacao=exibirPainel&colaborador="+codigoColaborador;
        }

        else if(operacao.equals("cancelarProcesso_dono")){

            int codigoColaborador = Integer.parseInt(request.getParameter("codigoColaborador"));
            int codigoDono = Integer.parseInt(request.getParameter("codigoDono"));
            int codigoAnimal = Integer.parseInt(request.getParameter("codigoAnimal"));
            String msgPessoal = request.getParameter("msgPessoal");
            String MsgPessoal = "";

            if(msgPessoal != null){
                MsgPessoal = "<strong>Justificativa do cancelamento dada pelo dono do Animal:</strong><br /><br />" +
                        ""+msgPessoal;
            }

            // Recupera informação do animal

            Animais animal = AnimalDAO.getInstance().preparaAnimal(codigoAnimal);


            // Prepara uma notificação para ser lançada.
                Notificacao notificacao = new Notificacao();

                notificacao.setCodigoColaborador(codigoDono);
                notificacao.setDataCadastro(new Date(System.currentTimeMillis()));
                notificacao.setAssunto("Cancelamento de Adoção");
                notificacao.setRemetenteNotificacao("Sim");

                notificacao.setMensagem("<h2>Processo de Adoção Cancelado!</h2><br>"+
                        "<br>" +
                        "Você cancelou o processo de adoção para o seguinte animal:<br />" +
                        "<strong>Codigo:</strong>"+animal.getCodigo()+"<br />" +
                        "<strong>Espécie:</strong>"+animal.getEspecie()+"<br />" +
                        "<strong>Nome:</strong>"+animal.getNome()+"<br /> <hr />" +
                        "<br />" +
                        "Este animal está novamente disponivel para adoção.");

                NotificacaoDAO.getInstance().gravaMsg(notificacao);

                // Notifica o Dono do Animal cancelado

                Notificacao notificacao2 = new Notificacao();

                notificacao2.setCodigoColaborador(codigoColaborador);
                notificacao2.setDataCadastro(new Date(System.currentTimeMillis()));
                notificacao2.setAssunto("Cancelamento de Adoção");
                notificacao2.setRemetenteNotificacao("Sim");

                notificacao2.setMensagem("<h2>Processo de Adoção Cancelado!</h2><br>"+
                        "<br>" +
                        "O processo de adoção foi cancelado para o seguinte animal:<br />" +
                        "<strong>Codigo:</strong>"+animal.getCodigo()+"<br />" +
                        "<strong>Espécie:</strong>"+animal.getEspecie()+"<br />" +
                        "<strong>Nome:</strong>"+animal.getNome()+"<br /> <hr />" +
                        "<br />" +
                        "Este animal está novamente disponivel para adoção.<br /><br />" +
                        MsgPessoal);

                NotificacaoDAO.getInstance().gravaMsg(notificacao2);

                // Redireciona para o Painel de controle

                proximaPagina ="PainelControle?operacao=exibirPainel&colaborador="+codigoDono;
        }


        //PARA DIRECIONAR AS PAGINAS PARA O LOCAL CERTO.
        RequestDispatcher rd = request.getRequestDispatcher(proximaPagina);
        rd.forward(request, response);


    } 

    

}
