package Controle.Portal;

import Entidade.Portal.Animais;
import Entidade.Portal.Colaborador;
import Entidade.Portal.Notificacao;
import Entidade.Portal.Processo;
import Entidade.Portal.SuperProcesso;
import Persistencia.Portal.AnimalDAO;
import Persistencia.Portal.CorDAO;
import Persistencia.Portal.EnvioDAO;
import Persistencia.Portal.PelagemDAO;
import Persistencia.Portal.PortalColabDAO;
import Persistencia.Portal.PorteDAO;
import Persistencia.Portal.ProcessoDAO;
import Persistencia.Portal.RacaDAO;
import Persistencia.Portal.UFDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletProcesso extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
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

    // ---------------------- DOAÇÕES --------------------------------------- //

        /* A pessoa que tem animais para adoção escolhe a opção para ver quais
        desses animais têm pessoas querendo adotá-los. */
        if (operacao.equals("listar_animais")) {
            int codigoDono = Integer.parseInt(request.getParameter("cod_colaborador"));
            List<Animais> animais = ProcessoDAO.getInstance().recuperaAnimais(codigoDono);
            request.setAttribute("Animais", animais);
            request.setAttribute("lstCor", CorDAO.getInstance().leTodos());
            request.setAttribute("lstPorte", PorteDAO.getInstance().leTodos());
            request.setAttribute("lstEnvio", EnvioDAO.getInstance().leTodos());
            request.setAttribute("lstPelagem", PelagemDAO.getInstance().leTodos());
            request.setAttribute("lstRaca", RacaDAO.getInstance().leTodos());
            proximaPagina = "Painel_controle/Usuario/filtro_processo.jsp";
        }

        /* O dono do animal pede para ver as pessoas que estão interessadas em
        adotar um de seus animais específico. */
        else if (operacao.equals("listar_processos")) {

            int codigoAnimal = Integer.parseInt(request.getParameter("cod_animal"));

            Processo processo = ProcessoDAO.getInstance().recuperaProcessos(codigoAnimal);

            Colaborador colaborador = PortalColabDAO.getInstance().le(processo.getCodigoColaborador());

            request.setAttribute("Processos", processo);
            request.setAttribute("ColabProcesso", colaborador);
            request.setAttribute("lstUF", UFDAO.getInstance().leTodos());
            request.setAttribute("Animal", AnimalDAO.getInstance().preparaAnimal(codigoAnimal));
            

            proximaPagina = "Painel_controle/Usuario/detalhar_processo.jsp";
        }

        /* Recupera os dados de um processo para que o mesmo possa ser exibidos em uma Jsp*/

        else if (operacao.equals("recupera_modal")) {

            int codigoProcesso = Integer.parseInt(request.getParameter("codigoProcesso"));
            SuperProcesso superProc = new SuperProcesso();
            superProc.processo = ProcessoDAO.getInstance().leProcesso(codigoProcesso);
            superProc.colaborador = PortalColabDAO.getInstance().le(superProc.processo.getCodigoColaborador());


            request.setAttribute("Processo", superProc);
            request.setAttribute("lstUF", UFDAO.getInstance().leTodos());
            proximaPagina = "Painel_controle/Usuario/processo/modalDetalharProcesso.jsp";
        }



        // ---------------------- CONFIRMACAO ------------------------------- //

        else if(operacao.equals("confirma_processo")){

            int codigoProcesso = Integer.parseInt(request.getParameter("codigo"));
            int fase = Integer.parseInt(request.getParameter("fase"));
            int codigoAnimal = Integer.parseInt(request.getParameter("codAnimal"));
            int codigoColaborador = Integer.parseInt(request.getParameter("codigoColab"));
            
            // Prepara o direcionamento para a Servlet de Notifição
            String dispara = "gerProcesso?operacao=listar_processos&cod_animal="+codigoAnimal;


            
                Processo processo = new Processo();

                processo.setFaseProcesso(fase);
                processo.setCodigo(codigoProcesso);

                ProcessoDAO.getInstance().alteraFase(processo);

                proximaPagina = "NotificarProcesso?operacao=alteraFase&fase="+fase+"&codigoColab="+codigoColaborador+"&dispara="+dispara+
                        "&codAnimal="+codigoAnimal;

        }

         else if(operacao.equals("confirma_processo_adocao")){

            int codigoProcesso = Integer.parseInt(request.getParameter("codigo"));
            int fase = Integer.parseInt(request.getParameter("fase"));
            int codigoAnimal = Integer.parseInt(request.getParameter("codAnimal"));
            String dispara = "gerProcesso?operacao=detalhar_processo&cod_animal="+codigoAnimal;
            int codigoColaborador = Integer.parseInt(request.getParameter("codigoColab"));
            int codigoUsr = Integer.parseInt(request.getParameter("codigoUsr"));

                Processo processo = new Processo();

                processo.setFaseProcesso(fase);
                processo.setCodigo(codigoProcesso);

                ProcessoDAO.getInstance().alteraFase(processo);

                
                proximaPagina = "NotificarProcesso?operacao=alteraFase&fase="+fase+"&codigoColab="+codigoColaborador+"&dispara="+dispara+
                        "&codAnimal="+codigoAnimal+"&codigoUsr="+codigoUsr;

        }



    // -------------------------- ADOÇÃO ------------------------------------ //

        else if (operacao.equals("ver_adocao")) {

            int codigoColaborador = Integer.parseInt(request.getParameter("cod_colaborador"));

            List<Animais> animais = ProcessoDAO.getInstance().recuperaAdocao(codigoColaborador);

            request.setAttribute("Animais", animais);
            request.setAttribute("lstCor", CorDAO.getInstance().leTodos());
            request.setAttribute("lstPorte", PorteDAO.getInstance().leTodos());
            request.setAttribute("lstEnvio", EnvioDAO.getInstance().leTodos());
            request.setAttribute("lstPelagem", PelagemDAO.getInstance().leTodos());
            request.setAttribute("lstRaca", RacaDAO.getInstance().leTodos());

            proximaPagina = "Painel_controle/Usuario/processo/filtro_processo.jsp";
        }

        else if(operacao.equals("detalhar_processo")){

            int codigoAnimal = Integer.parseInt(request.getParameter("cod_animal"));

            Processo processo = ProcessoDAO.getInstance().recuperaProcessos(codigoAnimal);

            // recupera os dados do animal que esta em processo.
            Animais animal = AnimalDAO.getInstance().preparaAnimal(codigoAnimal);
            // Recupera os dados do dono do animal.
            Colaborador dono = PortalColabDAO.getInstance().le(animal.getCodigoUsuario());
            // Faz o carregamento dos outros componentes

            request.setAttribute("Processo", processo);
            request.setAttribute("Dono", dono);
            request.setAttribute("Animal", animal);
            request.setAttribute("lstCor", CorDAO.getInstance().leTodos());
            request.setAttribute("lstPorte", PorteDAO.getInstance().leTodos());
            request.setAttribute("lstEnvio", EnvioDAO.getInstance().leTodos());
            request.setAttribute("lstPelagem", PelagemDAO.getInstance().leTodos());
            request.setAttribute("lstRaca", RacaDAO.getInstance().leTodos());
            request.setAttribute("lstUF", UFDAO.getInstance().leTodos());
            request.setAttribute("FormaEnvio", EnvioDAO.getInstance().leTodos());

            proximaPagina ="Painel_controle/Usuario/processo/detalhar_processo_adocao.jsp";

        }

        // EXIBE O PROCESSO QUE AINDA NAO FOI AVALIADO POR VC

         else if (operacao.equals("ver_avaliacao")) {

            int codigoColaborador = Integer.parseInt(request.getParameter("cod_colaborador"));

            List<Animais> animais = ProcessoDAO.getInstance().recuperaProcessosAvaliacao(codigoColaborador);

            request.setAttribute("Animais", animais);
            request.setAttribute("lstCor", CorDAO.getInstance().leTodos());
            request.setAttribute("lstPorte", PorteDAO.getInstance().leTodos());
            request.setAttribute("lstEnvio", EnvioDAO.getInstance().leTodos());
            request.setAttribute("lstPelagem", PelagemDAO.getInstance().leTodos());
            request.setAttribute("lstRaca", RacaDAO.getInstance().leTodos());

            proximaPagina = "Painel_controle/Usuario/processo/filtro_avaliacao.jsp";
        }

        // Detalhar a avalição.

        else if(operacao.equals("detalhar_avaliacao")){

            int codigoAnimal = Integer.parseInt(request.getParameter("cod_animal"));

            Processo processo = ProcessoDAO.getInstance().recuperaProcessos(codigoAnimal);

            // recupera os dados do animal que esta em processo.
            Animais animal = AnimalDAO.getInstance().preparaAnimal(codigoAnimal);
            // Recupera os dados do dono do animal.
            Colaborador dono = PortalColabDAO.getInstance().le(animal.getCodigoUsuario());
            // Faz o carregamento dos outros componentes

            request.setAttribute("Processo", processo);
            request.setAttribute("Dono", dono);
            request.setAttribute("Animal", animal);
            request.setAttribute("lstCor", CorDAO.getInstance().leTodos());
            request.setAttribute("lstPorte", PorteDAO.getInstance().leTodos());
            request.setAttribute("lstEnvio", EnvioDAO.getInstance().leTodos());
            request.setAttribute("lstPelagem", PelagemDAO.getInstance().leTodos());
            request.setAttribute("lstRaca", RacaDAO.getInstance().leTodos());
            request.setAttribute("lstUF", UFDAO.getInstance().leTodos());
            request.setAttribute("FormaEnvio", EnvioDAO.getInstance().leTodos());

            proximaPagina ="Painel_controle/Usuario/processo/avaliar_processo.jsp";

        }

        // Realiza a avaliação do Processo

        else if(operacao.equals("avaliar")){

            int codigo = Integer.parseInt(request.getParameter("codigo"));
            int codigoUsuario = Integer.parseInt(request.getParameter("codigoUsuario"));
            String nome = request.getParameter("nome");
            String entrega = request.getParameter("recebe_animal");
            String descricaoavaliacao = request.getParameter("descricaoavaliacao");

            String avaliacao = request.getParameter("avaliacao");

                if(descricaoavaliacao == ""){
                    descricaoavaliacao = null;
                }
                if(avaliacao.equals("positiva")){
                    avaliacao ="Sim";
                }
                if(avaliacao.equals("negativa")){
                    avaliacao ="Nao";
                }

               Processo avalia = new Processo();

               avalia.setCodigo(codigo);
               avalia.setRecebeAnimal(entrega);
               avalia.setDescricaoAvaliacao(descricaoavaliacao);
               avalia.setNotaAvaliacao(avaliacao);
               avalia.setAvaliacao("Sim");

               ProcessoDAO.getInstance().avaliarProcesso(avalia);

               // Prepara para mandar uma mensagem

               request.setAttribute("Altera", "Processo Avaliado com Sucesso, Obrigado.");

               proximaPagina="PainelControle?operacao=exibirPainel&colaborador="+codigoUsuario;


        }

        // CANCELA UM PROCESSO

         else if(operacao.equals("cancela_processo_usuario")){

            int codigoProcesso = Integer.parseInt(request.getParameter("codigo"));
            int codigoAnimal = Integer.parseInt(request.getParameter("codAnimal"));
            int codigoColaborador = Integer.parseInt(request.getParameter("codigoColab"));

            // Exclui o Processo
            ProcessoDAO.getInstance().apagaProcesso(codigoProcesso);

            // Retorna o animal para a lista de adoção

            AnimalDAO.getInstance().retornaAnimal(codigoAnimal);

            // Recupera informação do animal
            Animais animal = AnimalDAO.getInstance().preparaAnimal(codigoAnimal);
            // Recupera informação do dono do animal.
            int codigoDono = animal.getCodigoUsuario();

            // Redireciona para a servlet poder mandar uma notificação.

            proximaPagina="NotificarProcesso?operacao=cancelarProcesso_usuario&codigoColaborador="+codigoColaborador+
                    "&codigoAnimal="+codigoAnimal+"&codigoDono="+codigoDono;

         }

        else if(operacao.equals("cancela_processo_dono")){

            int codigoProcesso = Integer.parseInt(request.getParameter("codigo"));
            int codigoAnimal = Integer.parseInt(request.getParameter("codAnimal"));
            int codigoDono = Integer.parseInt(request.getParameter("codigoDono"));
            int codigoColaborador = Integer.parseInt(request.getParameter("codigoColab"));
            String msgPessoal = request.getParameter("justificativa");

            // Exclui o Processo
            ProcessoDAO.getInstance().apagaProcesso(codigoProcesso);

            // Retorna o animal para a lista de adoção

            AnimalDAO.getInstance().retornaAnimal(codigoAnimal);

            // Redireciona para a servlet poder mandar uma notificação.

            proximaPagina="NotificarProcesso?operacao=cancelarProcesso_dono&codigoColaborador="+codigoColaborador+
                    "&codigoAnimal="+codigoAnimal+"&codigoDono="+codigoDono+"&msgPessoal="+msgPessoal;

         }

        // Encerra um processo de adoção (Fase 4 do processo)

        else if(operacao.equals("declarar_entrega")){

            int codigoProcesso = Integer.parseInt(request.getParameter("codigoProcesso"));
            String entrega = request.getParameter("confirma");
            int fase = Integer.parseInt(request.getParameter("fasePeocesso"));

            if(entrega.equals("Sim")){

                // realiza o fechamento do processo
                Processo processo = new Processo();

                processo.setCodigo(codigoProcesso);
                processo.setEntregaAnimal(entrega);
                processo.setFaseProcesso(fase);
                
                processo.setStatus("Nao");

                // Recupera o codigo do animal para que se possa desabilita-lo

                Processo animal = ProcessoDAO.getInstance().leProcesso(codigoProcesso);
                // Finaliza um processo
                ProcessoDAO.getInstance().finalizarProcesso(processo);
                // Retira o poder do proprietario
                AnimalDAO.getInstance().completa_final_processo(animal.getCodigoAnimal());

                // Prepara para mandar uma mensagem para a pessoa que adotou o animal.

                proximaPagina="NotificarProcesso?operacao=finalizar&codigoProcesso="+codigoProcesso;
            }

            else{

                int codigoAnimal = Integer.parseInt(request.getParameter("codigoAnimal"));

                request.setAttribute("MsgErro", "Você não nos deu certeza que de ja entregou o animal.");

                proximaPagina="gerProcesso?operacao=listar_processos&cod_animal="+codigoAnimal;
            }


        }

        //PARA DIRECIONAR AS PAGINAS PARA O LOCAL CERTO.
        RequestDispatcher rd = request.getRequestDispatcher(proximaPagina);
        rd.forward(request, response);

    }
}
