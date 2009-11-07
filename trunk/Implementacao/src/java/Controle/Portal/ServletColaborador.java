package Controle.Portal;

import Entidade.Portal.Animais;
import Entidade.Portal.Colaborador;
import Entidade.Portal.Cor;
import Entidade.Portal.Notificacao;
import Entidade.Portal.Pelagem;
import Entidade.Portal.Porte;
import Entidade.Portal.Raca;
import Entidade.Portal.TipoEnvio;
import Entidade.Portal.UF;
import Persistencia.Portal.AnimalDAO;
import Persistencia.Portal.CorDAO;
import Persistencia.Portal.EnvioDAO;
import Persistencia.Portal.NotificacaoDAO;
import Persistencia.Portal.PelagemDAO;
import Persistencia.Portal.PortalColabDAO;
import Persistencia.Portal.PorteDAO;
import Persistencia.Portal.RacaDAO;
import Persistencia.Portal.UFDAO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Date;
import java.text.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletColaborador extends HttpServlet {
    
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

        if (operacao.equals("termoValido")){

            Colaborador usr = new Colaborador();

            String termo = request.getParameter("descricaoTermoAceito");

            //RECUPERA LISTA DE FORMA DE ENVIOS - METODO LETODOS()
            List<UF> lstUF = UFDAO.getInstance().leTodos();

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("lstUF", lstUF);

            request.setAttribute("descricaoTermo", termo);           

            proximaPagina = "cadastro/inicioCad.jsp";

        }

        else if (operacao.equals("cadastro")) {

            //COVNERTE DATA
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            // ISNTANCIA A CLASSE - Obtem dados do formulario
            Colaborador colaborador = new Colaborador();

            String valida = "Nao";
            String foto = "fotoUsr2.png";

            //RECUPERA PARAMENTRO DESCRICAO
            try{

                colaborador.setNome(request.getParameter("nome"));
                colaborador.setRg(request.getParameter("rg"));
                colaborador.setCpf(request.getParameter("cpf"));
                colaborador.setEmail(request.getParameter("email"));
                colaborador.setSexo(request.getParameter("sexo"));
                Date dtnascimento = dateFormat.parse(request.getParameter("idade"));
                colaborador.setDataNascimento(dtnascimento);
                colaborador.setTelefone(request.getParameter("fone"));
                colaborador.setCelular(request.getParameter("cel"));

                colaborador.setCep(request.getParameter("cep"));
                colaborador.setEndereco(request.getParameter("end"));
                colaborador.setComplemento(request.getParameter("complemento"));
                colaborador.setNumero(Integer.parseInt(request.getParameter("numero")));
                colaborador.setCidade(request.getParameter("cidade"));
                colaborador.setBairro(request.getParameter("bairro"));
                colaborador.setUf(Integer.parseInt(request.getParameter("uf")));
                colaborador.setProtocolo(request.getParameter("protocolo"));                
                Date dtCadastro = dateFormat.parse(request.getParameter("dataCad"));
                colaborador.setDatacadastro(dtCadastro);               
                
                colaborador.setTermoAceito(request.getParameter("termo"));
                colaborador.setValidacao(valida);
                colaborador.setEndFoto(foto);

                // Mensagem de erro e proxima pagina
                String msgErro = colaborador.validaDados(colaborador.INCLUSAO);

                // Monta Colaborador com dados validos ou monta mensagens de erro

                if (msgErro.equals("")) {

                    //colaborador.setCodigo(colaborador.getCodigo());

                    colaborador.setNome(colaborador.getNome());
                    colaborador.setUf(colaborador.getUf());
                    colaborador.setEmail(colaborador.getEmail());
                    colaborador.setTelefone(colaborador.getTelefone());
                    colaborador.setBairro(colaborador.getBairro());
                    colaborador.setCidade(colaborador.getCidade());
                    colaborador.setNumero(colaborador.getNumero());
                    colaborador.setDataNascimento(colaborador.getDataNascimento());
                    colaborador.setCep(colaborador.getCep());
                    colaborador.setCpf(colaborador.getCpf());
                    colaborador.setRg(colaborador.getRg());
                    colaborador.setEndereco(colaborador.getEndereco());
                    colaborador.setSexo(colaborador.getSexo());
                    colaborador.setDatacadastro(colaborador.getDataCadastro());
                    colaborador.setComplemento(colaborador.getComplemento());
                   // colaborador.setEndFoto(colaborador.getEndFoto());
                    colaborador.setCelular(colaborador.getCelular());
                    colaborador.setTermoAceito(colaborador.getTermoAceito());
                    colaborador.setProtocolo(colaborador.getProtocolo());
                    colaborador.setValidacao(valida);
                    colaborador.setEndFoto(foto);
                    
                    //EFETUA A GRAVACAO DOS DADOS
                    PortalColabDAO.getInstance().grava(colaborador);

                    Colaborador colab = PortalColabDAO.getInstance().login(colaborador.getEmail(), colaborador.getCpf());

                    //REMOVE OS ATRIBUTOS
                    request.removeAttribute("msgErro");
                    request.removeAttribute("Colaborador");

                    // redireciona para a Servlet preparar o Email
                    proximaPagina = "Email?operacao=enviarProtocolo&protocolo="+colab.getProtocolo()+
                            "&cpf="+colab.getCpf()+"&email="+colab.getEmail()+"&nome="+colab.getNome();

                }else {
                    request.setAttribute("msgErro", msgErro);

                    //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
                    request.setAttribute("Colaborador", colaborador);

                    proximaPagina = "cadastro/inicioCad.jsp";
                }
            }catch(ParseException e){

            }
        }

       else if (operacao.equals("ColaboradorEditaProcessa")) {

            //COVNERTE DATA
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            // ISNTANCIA A CLASSE - Obtem dados do formulario

            Colaborador colaborador = new Colaborador();

            //RECUPERA PARAMENTRO DESCRICAO
            try{

                colaborador.setCodigo(Integer.parseInt(request.getParameter("cod")));
                colaborador.setNome(request.getParameter("nome"));
                colaborador.setRg(request.getParameter("rg"));
                colaborador.setCpf(request.getParameter("cpf"));
                colaborador.setEmail(request.getParameter("email"));
                colaborador.setSexo(request.getParameter("sexo"));
                Date dtnascimento = dateFormat.parse(request.getParameter("idade"));
                colaborador.setDataNascimento(dtnascimento);
                colaborador.setTelefone(request.getParameter("fone"));
                colaborador.setCelular(request.getParameter("cel"));

                colaborador.setCep(request.getParameter("cep"));
                colaborador.setEndereco(request.getParameter("end"));
                colaborador.setComplemento(request.getParameter("complemento"));
                colaborador.setNumero(Integer.parseInt(request.getParameter("numero")));
                colaborador.setCidade(request.getParameter("cidade"));
                colaborador.setBairro(request.getParameter("bairro"));
                colaborador.setUf(Integer.parseInt(request.getParameter("uf")));

                // Mensagem de erro e proxima pagina
                String msgErro = colaborador.validaDados(colaborador.ALTERACAO);

                // Monta Colaborador com dados validos ou monta mensagens de erro

                if (msgErro.equals("")) {

                    colaborador.setCodigo(colaborador.getCodigo());
                    colaborador.setNome(colaborador.getNome());
                    colaborador.setRg(colaborador.getRg());
                    colaborador.setCpf(colaborador.getCpf());
                    colaborador.setEmail(colaborador.getEmail());
                    colaborador.setSexo(colaborador.getSexo());
                    colaborador.setDataNascimento(colaborador.getDataNascimento());
                    colaborador.setTelefone(colaborador.getTelefone());
                    colaborador.setCelular(colaborador.getCelular());

                    colaborador.setCep(colaborador.getCep());
                    colaborador.setEndereco(colaborador.getEndereco());
                    colaborador.setComplemento(colaborador.getComplemento());
                    colaborador.setNumero(colaborador.getNumero());
                    colaborador.setCidade(colaborador.getCidade());
                    colaborador.setBairro(colaborador.getBairro());
                    colaborador.setUf(colaborador.getUf());


                    //EFETUA A GRAVACAO DOS DADOS
                    PortalColabDAO.getInstance().altera(colaborador);
                    Colaborador colab = PortalColabDAO.getInstance().le(colaborador.getCodigo());

                    //REMOVE OS ATRIBUTOS
                    request.removeAttribute("msgErro");
                    request.removeAttribute("Colaborador");

                    request.setAttribute("Altera", "Dados Alterados com Sucesso!");
                    request.getSession().setAttribute("Colaborador", colab);

                    proximaPagina = "PainelControle?operacao=exibirPainel&colaborador=" + colaborador.getCodigo();

                }else {

                    request.setAttribute("ErroAlt", "Ocorreu um erro ao tentar atualizar a base de dados.");
                    proximaPagina = "PainelControle?operacao=exibirPainel&colaborador=" + colaborador.getCodigo();
                }
            }catch(ParseException e){
                System.out.println(e);
            }
        }

        else if (operacao.equals("ColaboradorApaga")) {

            //RECUPERA E CONVERTE PARA INT PARA DEPOIS APAGAR O REGISTRO NO BANCO
            int codigo = Integer.parseInt(request.getParameter("codigo"));

            //METODO PARA APAGAR OS DADOS NO BANCO
            int ret = PortalColabDAO.getInstance().apaga(codigo);

            proximaPagina = "index.jsp";

        }

        else if(operacao.equals("login")){

            Colaborador usr = new Colaborador();

            String login = request.getParameter("login");
            String cpf = request.getParameter("cpf");

            String direciona = request.getParameter("dispara");

                        
           Colaborador colaborador = PortalColabDAO.getInstance().login(login, cpf);         


           if(colaborador == null){

               request.getSession().removeAttribute("colaborador");
               request.setAttribute("MsgErro", "Login Inválido!");
               proximaPagina = direciona;
           }

           else {               

              int logado = 1;
              
              usr.setLogin(logado);

              request.getSession().setAttribute("Colaborador", colaborador);
              request.getSession().setAttribute("Log", colaborador);

              // Verifica se existe mensagem para o Colaborador

              List<Notificacao> lstMsg = NotificacaoDAO.getInstance().carregaMsg(colaborador.getCodigo());

              request.getSession().setAttribute("qtd", lstMsg.size());
              request.getSession().setAttribute("Msg", lstMsg);

               proximaPagina = direciona;
           }
           
        }

        else if(operacao.equals("alterar_cad"))
        {

             List<UF> lstUf = UFDAO.getInstance().leTodos();

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("lstUF", lstUf);
            
            proximaPagina = "Painel_controle/Usuario/cad_edit.jsp";
        }


        //PARA DIRECIONAR AS PAGINAS PARA O LOCAL CERTO.
        RequestDispatcher rd = request.getRequestDispatcher(proximaPagina);
        rd.forward(request, response);

    } 

   

}
