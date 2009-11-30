package Controle.Portal;

import Entidade.Portal.Animais;
import Entidade.Portal.Colaborador;
import Entidade.Portal.Cor;
import Entidade.Portal.Notificacao;
import Entidade.Portal.Pelagem;
import Entidade.Portal.Porte;
import Entidade.Portal.Processo;
import Entidade.Portal.Raca;
import Entidade.Portal.TipoEnvio;
import Persistencia.Portal.AnimalDAO;
import Persistencia.Portal.CorDAO;
import Persistencia.Portal.EnvioDAO;
import Persistencia.Portal.NotificacaoDAO;
import Persistencia.Portal.PelagemDAO;
import Persistencia.Portal.PortalColabDAO;
import Persistencia.Portal.PorteDAO;
import Persistencia.Portal.ProcessoDAO;
import Persistencia.Portal.RacaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.io.File;
import java.util.Date;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletPainelControle extends HttpServlet {
   
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
        
        if(operacao.equals("exibirPainel")){
            
            int codUsr = Integer.parseInt(request.getParameter("colaborador"));
               String bloq = "Nao";

               List<Animais> listaAnimal = AnimalDAO.getInstance().carregaDadosAnimalTeste(codUsr,bloq);

                request.getSession().setAttribute("QtdAnimal", listaAnimal.size());
                request.getSession().setAttribute("listaAnimal", listaAnimal);

                // Verifica se existe mensagem para o Colaborador

              List<Notificacao> lstMsg = NotificacaoDAO.getInstance().carregaMsg(codUsr);

              request.getSession().setAttribute("qtd", lstMsg.size());
              request.getSession().setAttribute("Msg", lstMsg);


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

            // Reescreve a sessao do usuario

            Colaborador colaborador = PortalColabDAO.getInstance().le(codUsr);

            request.getSession().setAttribute("Colaborador", colaborador);

            // verifica se o usuario tem processos de adoção concluidos

            List<Processo> lstProcesso = ProcessoDAO.getInstance().avaliacaoAcompanha(colaborador.getCodigo());
           
            request.setAttribute("Tamanho", lstProcesso.size());
            request.setAttribute("Avaliacao", lstProcesso);
                        
            proximaPagina="Painel_controle/Usuario/index.jsp";
        
        }

        else if(operacao.equals("alterar_foto")){

            // seta a foto padrão

            String foto="fotoUsr.png";

            Colaborador colaborador = new Colaborador();

            colaborador.setCodigo(Integer.parseInt(request.getParameter("codigo")));

             // Verifica se a requisicao e do tipo multipart
        if (ServletFileUpload.isMultipartContent(request)) {

            // Fabrica para arquivos baseados em disco
            DiskFileItemFactory factory = new DiskFileItemFactory();

            // Manipulador de upload de arquivos
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                // Recebe lista de campos do formulario
                List<FileItem> itens = upload.parseRequest(request);

                for (FileItem fi : itens) {

                    
                        // Cria um objeto file com nome do arquivo
                        // A pasta deve oferecer acesso de escrita para Conteiner
                        File uploadedFile = new File("/Documents and Settings/Frank/Meus documentos/Faculdade/TCC/Implementacao/WebMAA/build/web/Painel_controle/Usuario/foto/" + fi.getName());
                        // Grava arquivo na pasta especificada
                        fi.write(uploadedFile);

                        // Grava o nome do arquivo no perfil do usuario

                        
                        colaborador.setEndFoto(fi.getName());

                        PortalColabDAO.getInstance().alteraFoto(colaborador);

                       proximaPagina = "PainelControle?operacao=exibirPainel&colaborador=" + colaborador.getCodigo();
                   

                }
            } catch (Exception ex) {

                colaborador.setEndFoto(foto);

                PortalColabDAO.getInstance().alteraFoto(colaborador);
                proximaPagina = "PainelControle?operacao=exibirPainel&colaborador=" + colaborador.getCodigo();
                
                System.out.println(new Date() + " - Exception: " + ex.getMessage());
            }
        }

        }

                
         //PARA DIRECIONAR AS PAGINAS PARA O LOCAL CERTO.
        RequestDispatcher rd = request.getRequestDispatcher(proximaPagina);
        rd.forward(request, response);


}

}
