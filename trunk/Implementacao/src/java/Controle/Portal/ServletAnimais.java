package Controle.Portal;

import Entidade.Portal.Cor;
import Entidade.Portal.Animais;
import Entidade.Portal.Notificacao;
import Entidade.Portal.Porte;
import Entidade.Portal.Pelagem;
import Entidade.Portal.Processo;
import Entidade.Portal.Raca;
import Entidade.Portal.TipoEnvio;
import Persistencia.Portal.AnimalDAO;
import Persistencia.Portal.CorDAO;
import Persistencia.Portal.EnvioDAO;
import Persistencia.Portal.NotificacaoDAO;
import Persistencia.Portal.PelagemDAO;
import Persistencia.Portal.PorteDAO;
import Persistencia.Portal.ProcessoDAO;
import Persistencia.Portal.RacaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletAnimais extends HttpServlet {
   
   
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

        if(operacao.equals("iniciar_cad")){

             List<Cor> lstCor = CorDAO.getInstance().leTodos();

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("lstCor", lstCor);

            List<Porte> lstPorte = PorteDAO.getInstance().leTodos();
            request.setAttribute("lstPorte", lstPorte);

            List<TipoEnvio> lstEnvio = EnvioDAO.getInstance().leTodos();
            request.setAttribute("lstEnvio", lstEnvio);

            List<Pelagem> lstPelagem = PelagemDAO.getInstance().leTodos();
            request.setAttribute("lstPelagem", lstPelagem);

            List<Raca> lstRaca = RacaDAO.getInstance().leTodos();
            request.setAttribute("lstRaca", lstRaca);
            

            proximaPagina = "cadastro/cad_animal.jsp";
        }

        else if(operacao.equals("Listar_Cad")){

            //COVNERTE DATA
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

            // ISNTANCIA A CLASSE - Obtem dados do formulario

            Animais animal = new Animais();

            String foto = "";
            String disponibilidade ="Nao";

            String especie = request.getParameter("especie");

            if(especie.equals("Gato")){
                foto = "lucky.png";
            }
            else if(especie.equals("Cao")){
                foto = "apolo.png";
            }

             //RECUPERA PARAMENTRO DESCRICAO
            try{

                animal.setCodigoUsuario(Integer.parseInt(request.getParameter("codUsr")));
                Date dtcadastro = dateFormat.parse(request.getParameter("dataCad"));
                animal.setDataCadastro(dtcadastro);
                animal.setEspecie(request.getParameter("especie"));
                animal.setCodigoRaca(Integer.parseInt(request.getParameter("raca")));
                animal.setNome(request.getParameter("nome"));
                animal.setIdade(Integer.parseInt(request.getParameter("idade")));
                animal.setCor1(Integer.parseInt(request.getParameter("cor1")));
                animal.setCor2(Integer.parseInt(request.getParameter("cor2")));
                animal.setCodigoPelagem(Integer.parseInt(request.getParameter("pelagem")));
                animal.setPorte(Integer.parseInt(request.getParameter("porte")));
                animal.setSexo(request.getParameter("sexo"));
                animal.setEndFoto(foto);
                animal.setLaudoVeterinario(request.getParameter("laudo"));
                animal.setVacinado(request.getParameter("vacina"));
                animal.setdescricaoVacina(request.getParameter("descricaoVacina"));
                animal.setCodigoFormaEnvio(Integer.parseInt(request.getParameter("formaEnvio")));
                animal.setdescricao(request.getParameter("descricao"));
                animal.setDisponibilidade(disponibilidade);


                // Mensagem de erro e proxima pagina
                String msgErro = animal.validaDados(animal.INCLUSAO);

                // Monta Colaborador com dados validos ou monta mensagens de erro

                if (msgErro.equals("")) {

                animal.setCodigoUsuario(animal.getCodigoUsuario());
                animal.setDataCadastro(animal.getDataCadastro());
                animal.setEspecie(animal.getEspecie());
                animal.setCodigoRaca(animal.getCodigoRaca());
                animal.setNome(animal.getNome());
                animal.setIdade(animal.getIdade());
                animal.setCor1(animal.getCor1());
                animal.setCor2(animal.getCor2());
                animal.setCodigoPelagem(animal.getCodigoPelagem());
                animal.setPorte(animal.getPorte());
                animal.setSexo(animal.getSexo());
                animal.setEndFoto(animal.getEndFoto());
                animal.setLaudoVeterinario(animal.getLaudoVeterinario());
                animal.setVacinado(animal.getVacinado());
                animal.setdescricaoVacina(animal.getDescricaoVacina());
                animal.setCodigoFormaEnvio(animal.getCodigoFormaEnvio());
                animal.setdescricao(animal.getDescricao());
                animal.setDisponibilidade(animal.getDisponibilidade());

                    //REMOVE OS ATRIBUTOS
                    request.removeAttribute("msgErro");
                    //request.removeAttribute("Animal");

                     List<Cor> lstCor = CorDAO.getInstance().leTodos();

                    //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
                    request.setAttribute("lstCor", lstCor);

                    List<Porte> lstPorte = PorteDAO.getInstance().leTodos();
                    request.setAttribute("lstPorte", lstPorte);

                    List<TipoEnvio> lstEnvio = EnvioDAO.getInstance().leTodos();
                    request.setAttribute("lstEnvio", lstEnvio);

                    List<Pelagem> lstPelagem = PelagemDAO.getInstance().leTodos();
                    request.setAttribute("lstPelagem", lstPelagem);

                    List<Raca> lstRaca = RacaDAO.getInstance().leTodos();
                    request.setAttribute("lstRaca", lstRaca);

                    request.getSession().setAttribute("Animal", animal);

                    proximaPagina = "cadastro/confirm_cad_pet.jsp";

                }else {
                    request.setAttribute("msgErro", msgErro);

                    //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
                    request.setAttribute("Erro", "Ocorreu um Erro ao Tentar Processar a Requisição, " +
                            "Por Favor Refaça o Cadastro.");

                    proximaPagina = "cadastro/cad_animal.jsp";
                }


            }catch(ParseException e){

            }
        }

        else if(operacao.equals("editar_animal")){

                    //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP

                    List<Cor> lstCor = CorDAO.getInstance().leTodos();
                    request.setAttribute("lstCor", lstCor);

                    List<Porte> lstPorte = PorteDAO.getInstance().leTodos();
                    request.setAttribute("lstPorte", lstPorte);

                    List<TipoEnvio> lstEnvio = EnvioDAO.getInstance().leTodos();
                    request.setAttribute("lstEnvio", lstEnvio);

                    List<Pelagem> lstPelagem = PelagemDAO.getInstance().leTodos();
                    request.setAttribute("lstPelagem", lstPelagem);

                    List<Raca> lstRaca = RacaDAO.getInstance().leTodos();
                    request.setAttribute("lstRaca", lstRaca);

                    proximaPagina = "cadastro/cad_animal_edit.jsp";
        }

        else if(operacao.equals("exibir_dados_animal")){

            int codigo = Integer.parseInt(request.getParameter("codigo"));

            Animais animal = AnimalDAO.getInstance().preparaAnimal(codigo);

            request.setAttribute("AnimalEdita", animal);

            List<Cor> lstCor = CorDAO.getInstance().leTodos();
                    request.setAttribute("lstCor", lstCor);

                    List<Porte> lstPorte = PorteDAO.getInstance().leTodos();
                    request.setAttribute("lstPorte", lstPorte);

                    List<TipoEnvio> lstEnvio = EnvioDAO.getInstance().leTodos();
                    request.setAttribute("lstEnvio", lstEnvio);

                    List<Pelagem> lstPelagem = PelagemDAO.getInstance().leTodos();
                    request.setAttribute("lstPelagem", lstPelagem);

                    List<Raca> lstRaca = RacaDAO.getInstance().leTodos();
                    request.setAttribute("lstRaca", lstRaca);
                    
            proximaPagina = "Painel_controle/Usuario/alt_animal.jsp";
        }

        else if(operacao.equals("cadastrar")){

            //COVNERTE DATA
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/mm/yyyy");

            // ISNTANCIA A CLASSE - Obtem dados do formulario

            Animais animal = new Animais();
                String disponibilidade ="Nao";
                String local = "Sim";

             try{
                animal.setCodigoUsuario(Integer.parseInt(request.getParameter("codUsr")));
                Date dtcadastro = dateFormat.parse(request.getParameter("dataCad"));
                animal.setDataCadastro(dtcadastro);
                animal.setEspecie(request.getParameter("especie"));
                animal.setCodigoRaca(Integer.parseInt(request.getParameter("raca")));
                animal.setNome(request.getParameter("nome"));
                animal.setIdade(Integer.parseInt(request.getParameter("idade")));
                animal.setCor1(Integer.parseInt(request.getParameter("cor1")));
                animal.setCor2(Integer.parseInt(request.getParameter("cor2")));
                animal.setCodigoPelagem(Integer.parseInt(request.getParameter("pelagem")));
                animal.setPorte(Integer.parseInt(request.getParameter("porte")));
                animal.setSexo(request.getParameter("sexo"));
                animal.setEndFoto(request.getParameter("foto"));
                animal.setLaudoVeterinario(request.getParameter("laudo"));
                animal.setVacinado(request.getParameter("vacina"));
                animal.setdescricaoVacina(request.getParameter("descricaoVacina"));
                animal.setCodigoFormaEnvio(Integer.parseInt(request.getParameter("formaEnvio")));
                animal.setdescricao(request.getParameter("descricao"));
                animal.setDisponibilidade(disponibilidade);
                animal.setLocalAnimal(local);

                //EFETUA A GRAVACAO DOS DADOS
                 AnimalDAO.getInstance().grava(animal);

                 request.getSession().removeAttribute("Animal");

                proximaPagina = "Painel_controle/Usuario/index.jsp";
             }
             catch(ParseException e){

            }

        }

        else if (operacao.equals("edita_Animal_painel")) {

            Animais animal = new Animais();
            String disp = "Sim";

            //RECUPERA PARAMENTRO DESCRICAO
            try{

                animal.setCodigo(Integer.parseInt(request.getParameter("codigo")));
                animal.setCodigoUsuario(Integer.parseInt(request.getParameter("codUsr")));
                animal.setEspecie(request.getParameter("especie"));
                animal.setCodigoRaca(Integer.parseInt(request.getParameter("raca")));
                animal.setNome(request.getParameter("nome"));
                animal.setIdade(Integer.parseInt(request.getParameter("idade")));
                animal.setCor1(Integer.parseInt(request.getParameter("cor1")));
                animal.setCor2(Integer.parseInt(request.getParameter("cor2")));
                animal.setCodigoPelagem(Integer.parseInt(request.getParameter("pelagem")));
                animal.setPorte(Integer.parseInt(request.getParameter("porte")));
                animal.setSexo(request.getParameter("sexo"));
                animal.setEndFoto(request.getParameter("foto"));
                animal.setLaudoVeterinario(request.getParameter("laudo"));
                animal.setVacinado(request.getParameter("vacina"));
                animal.setdescricaoVacina(request.getParameter("descricaoVacina"));
                animal.setCodigoFormaEnvio(Integer.parseInt(request.getParameter("formaEnvio")));
                animal.setdescricao(request.getParameter("descricao"));

                // Mensagem de erro e proxima pagina
                String msgErro = animal.validaDados(animal.ALTERACAO);

                // Monta Colaborador com dados validos ou monta mensagens de erro

                if (msgErro.equals("")) {

                animal.setCodigo(animal.getCodigo());
                animal.setCodigoUsuario(animal.getCodigoUsuario());
                animal.setEspecie(animal.getEspecie());
                animal.setCodigoRaca(animal.getCodigoRaca());
                animal.setNome(animal.getNome());
                animal.setIdade(animal.getIdade());
                animal.setCor1(animal.getCor1());
                animal.setCor2(animal.getCor2());
                animal.setCodigoPelagem(animal.getCodigoPelagem());
                animal.setPorte(animal.getPorte());
                animal.setSexo(animal.getSexo());
                animal.setEndFoto(animal.getEndFoto());
                animal.setLaudoVeterinario(animal.getLaudoVeterinario());
                animal.setVacinado(animal.getVacinado());
                animal.setdescricaoVacina(animal.getDescricaoVacina());
                animal.setCodigoFormaEnvio(animal.getCodigoFormaEnvio());
                animal.setdescricao(animal.getDescricao());


                    //EFETUA A GRAVACAO DOS DADOS
                    AnimalDAO.getInstance().altera(animal);

                    //REMOVE OS ATRIBUTOS
                    request.removeAttribute("msgErro");
                    request.removeAttribute("Colaborador");

                    request.setAttribute("Altera", "Dados Alterados com Sucesso!");

                    proximaPagina = "PainelControle?operacao=exibirPainel&colaborador=" + animal.getCodigoUsuario();

                }else {

                    request.setAttribute("ErroAlt", "Ocorreu um erro ao tentar atualizar a base de dados.");
                    proximaPagina = "Painel_controle/Usuario/cad_edit.jsp";
                }
            }catch(Exception e){
                System.out.println(e);
            }
        }

        else if(operacao.equals("abreConfirmaAdocao")){

            int codigo = Integer.parseInt(request.getParameter("codigo"));

            Animais animal = AnimalDAO.getInstance().preparaAnimal(codigo);

                    List<Cor> lstCor = CorDAO.getInstance().leTodos();
                    request.setAttribute("lstCor", lstCor);

                    List<Porte> lstPorte = PorteDAO.getInstance().leTodos();
                    request.setAttribute("lstPorte", lstPorte);

                    List<TipoEnvio> lstEnvio = EnvioDAO.getInstance().leTodos();
                    request.setAttribute("lstEnvio", lstEnvio);

                    List<Pelagem> lstPelagem = PelagemDAO.getInstance().leTodos();
                    request.setAttribute("lstPelagem", lstPelagem);

                    List<Raca> lstRaca = RacaDAO.getInstance().leTodos();
                    request.setAttribute("lstRaca", lstRaca);

               request.setAttribute("DetalharAnimal", animal);

               proximaPagina="Painel_controle/Usuario/processo/detalhar_animal_adocao_inicio.jsp";
        }

        else if(operacao.equals("adotar")){

            // Recebe os parametros para preparar a tabela de processos

            //COVNERTE DATA
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

            Processo processo = new Processo();

            String status = "Sim";
            int codigoProprietario = Integer.parseInt(request.getParameter("proprietario"));

            processo.setFaseProcesso(1);
            processo.setCodigoAnimal(Integer.parseInt(request.getParameter("codigoAnimal")));
            processo.setCodigoColaborador(Integer.parseInt(request.getParameter("colaborador")));
            processo.setStatus(status);
            processo.setDataCadastro(new Date(System.currentTimeMillis()));
            processo.setDataProcesso(new Date(System.currentTimeMillis()));

            try{
                //EFETUA A GRAVACAO DOS DADOS
                ProcessoDAO.getInstance().grava(processo);

                // Prepara uma notificação para ser lançada.

                Notificacao notificacao = new Notificacao();

                notificacao.setCodigoColaborador(Integer.parseInt(request.getParameter("colaborador")));
                notificacao.setDataCadastro(new Date(System.currentTimeMillis()));
                notificacao.setAssunto("Processo de Adoção");
                notificacao.setRemetenteNotificacao("Sim");
                notificacao.setMensagem("<h2>Parabéns, Você acaba de ser incluido em um processo de adoção.</h2><br>"+
                        "<br>" +
                        "Você pode acompanhar este processo em seu \"Painel de Controle\" na coluna \"Adoções\". ");

                NotificacaoDAO.getInstance().gravaMsg(notificacao);

                // Prepara Mensagem para o prorpietario

                Notificacao notificacao2 = new Notificacao();

                notificacao2.setCodigoColaborador(codigoProprietario);
                notificacao2.setDataCadastro(new Date(System.currentTimeMillis()));
                notificacao2.setAssunto("Processo de Adoção");
                notificacao2.setRemetenteNotificacao("Sim");

                notificacao.setMensagemPessoal(request.getParameter("mensagemPessoal"));
                String msgPessoal = "Mensagem Pessoal deixada pelo usuario:<br>" +
                        "<br>"+notificacao.getMensagemPessoal();

                notificacao2.setMensagem("<h2>Você possui uma solicitação de Adoção.</h2><br>"+
                        "<br>" +
                        "Você pode acompanhar este processo em seu \"Painel de Controle\" na coluna \"Adoções\".<br>" +
                        "<br> "+msgPessoal);

                NotificacaoDAO.getInstance().gravaMsg(notificacao2);

                proximaPagina="Painel_controle/Usuario/processo/confirm_processo.jsp";

            }
            catch(Exception e){

                request.setAttribute("MsgErro", "Erro ao Finalizar o processo");

                proximaPagina="Painel_controle/Usuario/processo/confirm_processo.jsp";
            }

            
        }


         //PARA DIRECIONAR AS PAGINAS PARA O LOCAL CERTO.
        RequestDispatcher rd = request.getRequestDispatcher(proximaPagina);
        rd.forward(request, response);
        
    }     

}
