package Controle.Portal;

import Entidade.Portal.Animais;
import Entidade.Portal.Colaborador;
import Entidade.Portal.Notificacao;
import Entidade.Portal.Processo;
import Persistencia.Portal.AnimalDAO;
import Persistencia.Portal.NotificacaoDAO;
import Persistencia.Portal.PortalColabDAO;
import Persistencia.Portal.ProcessoDAO;
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

            if(fase == 3){

                int codigoUsuario = Integer.parseInt(request.getParameter("codigoUsr"));

                 // Prepara uma notificacao para mandar ao usuario.
                Notificacao notificacao = new Notificacao();

                notificacao.setCodigoColaborador(codigoColaborador);
                notificacao.setDataCadastro(new Date(System.currentTimeMillis()));
                notificacao.setAssunto("Confirmação de Adoção");
                notificacao.setRemetenteNotificacao("Sim");

                notificacao.setMensagem("<h2>Processo de Adoção Realizado com Sucesso!</h2><br><br />" +
                        "O interessado na Adoção confirmou o seu interesse para o seguinte animal abaixo:<br /><hr />" +
                        "<strong>Codigo:</strong> "+animal.getCodigo()+"<br />"+
                        "<strong>Espécie:</strong> "+animal.getEspecie()+"<br />" +
                        "<strong>Nome:</strong> "+animal.getNome()+"<br /> <hr />" +
                        "Agora falta muito pouco...<br />" +
                        "Acesse no painel de controle o menu \"Acompanhar Doações\" e siga os procedimentos da tela" +
                        " e não se esqueça de confirmar a entrega do seu animal.");

                NotificacaoDAO.getInstance().gravaMsg(notificacao);

                // Recupera os dados do proprietario do animal para preparar uma notificação ao colaborador
                // participante do processo.

                Colaborador dono = PortalColabDAO.getInstance().le(codigoColaborador);

                // cria a mensagem
                Notificacao notificacao2 = new Notificacao();

                notificacao2.setCodigoColaborador(codigoUsuario);
                notificacao2.setDataCadastro(new Date(System.currentTimeMillis()));
                notificacao2.setAssunto("Adoção Aprovada");
                notificacao2.setRemetenteNotificacao("Sim");

                notificacao2.setMensagem("<h2>Processo de Adoção Realizado com Sucesso!</h2><br><br />" +
                        "Parabéns, agora falta muito pouco para que você realmente possa ter o seu animalzinho.<br />" +
                        "O Sistema enviou uma mensagem ao proprietário do animal informando como ele deverá proceder para realizar a entrega do animal.<br />" +
                        "O que devo fazer agora?<br />" +
                        "Entre em contato com o Proprietario e negocie a adoção. Após a entrega do animal será necessario que você avalie o processo.<br />"+
                        "Mais não se preocupe com isso agora, assim que esta etapa estiver pronta, você receberá um aviso em seu Painel de Controle.<br />"+
                        "<span style=\"color:#060; font-weight:bold;\">Qualquer problema durante a negociação entre com contato com a nossa Ong informando o codigo do proprietário</span><br />" +
                        "Dados para Negociação<br /><hr />" +
                        "<table class=\"grid\" style=\"width:100%;\">"+
						"<tr><td class=\"grid_titulo\" align=\"center\">Cod</td><td class=\"grid_titulo\" align=\"center\">Nome</td>"+
						"<td class=\"grid_titulo\" align=\"center\">E-mail</td><td class=\"grid_titulo\" align=\"center\">Telefone</td></tr>"+
						"<tr class=\"td_escura\"><td align=\"center\">"+dono.getCodigo()+"</td><td align=\"center\">"+dono.getNome()+
						"<td align=\"center\">"+dono.getEmail()+"</td><td align=\"center\">"+dono.getTelefone()+"</td></tr></table>"+
                        "<br />Dados do Animal:<hr /> "+
                        "<strong>Codigo:</strong> "+animal.getCodigo()+"<br />"+
                        "<strong>Espécie:</strong> "+animal.getEspecie()+"<br />" +
                        "<strong>Nome:</strong> "+animal.getNome()+"<br /> <hr />");

                NotificacaoDAO.getInstance().gravaMsg(notificacao2);
                

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

        // Finalizar o Processo de Adoção
        else if(operacao.equals("finalizar")){

                int codigoProcesso = Integer.parseInt(request.getParameter("codigoProcesso"));

                // recupera os dados do processo
                Processo dados = ProcessoDAO.getInstance().leProcesso(codigoProcesso);
                // Recupera Dados do Animal
                Animais animal = AnimalDAO.getInstance().preparaAnimal(dados.getCodigoAnimal());

                // Prepara uma notificacao
                Notificacao notificacao = new Notificacao();

                notificacao.setCodigoColaborador(dados.getCodigoColaborador());
                notificacao.setDataCadastro(new Date(System.currentTimeMillis()));
                notificacao.setAssunto("Avaliação do Processo");
                notificacao.setRemetenteNotificacao("Sim");

                notificacao.setMensagem("<h2>Avaliação do Processo de Adoção</h2><br>"+
                        "<br>" +
                        "Recebemos a informação de que a negociação entre você e o proprietário do animal abaixo " +
                        "foi dada como \"CONCLUIDA\":<br /><br />" +
                        "<strong>Codigo:</strong> "+animal.getCodigo()+"<br />" +
                        "<strong>Espécie:</strong> "+animal.getEspecie()+"<br />" +
                        "<strong>Nome:</strong> "+animal.getNome()+"<br /> <hr />" +
                        "<br />" +
                        "Com a entrega do animal, precisamos que você faça uma breve avaliação da sua experiência em relação a este processo." +
                        "<br />" +
                        "Caso não tenha recebido o animal no tempo acordado, entre com contato com a ONG informado o ocorrido.");

                 NotificacaoDAO.getInstance().gravaMsg(notificacao);

                 // Redireciona para o Painel de Controle

                 proximaPagina="PainelControle?operacao=exibirPainel&colaborador="+animal.getCodigoUsuario();

        }

       
        //PARA DIRECIONAR AS PAGINAS PARA O LOCAL CERTO.
        RequestDispatcher rd = request.getRequestDispatcher(proximaPagina);
        rd.forward(request, response);


    } 

    

}
