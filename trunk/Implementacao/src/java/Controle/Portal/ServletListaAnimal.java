package Controle.Portal;

import Persistencia.Portal.AnimalDAO;
import Entidade.Portal.Animais;
import Entidade.Portal.Cor;
import Entidade.Portal.Pelagem;
import Entidade.Portal.Porte;
import Entidade.Portal.Raca;
import Entidade.Portal.TipoEnvio;
import Persistencia.Portal.CorDAO;
import Persistencia.Portal.EnvioDAO;
import Persistencia.Portal.PelagemDAO;
import Persistencia.Portal.PorteDAO;
import Persistencia.Portal.RacaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ServletListaAnimal extends HttpServlet {
   
   
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

        if(operacao.equals("lista_gato")){
            
            String esp = "Gato";
            String disp = "Sim";

                        
             List<Animais> lstAnimal = AnimalDAO.getInstance().listaAni(esp,disp);


            if(lstAnimal == null){

                request.setAttribute("MsgErro", "Nenhum Gato Cadastrado para Adoção!");
                proximaPagina = "Gato/listaGato.jsp";

            }else {

            request.setAttribute("lstAnimal", lstAnimal);
            proximaPagina = "Gato/listaGato.jsp";
            }
        }

        else if(operacao.equals("lista_cao")){

            String esp = "Cao";
            String disp = "Sim";

             List<Animais> lstAnimal = AnimalDAO.getInstance().listaAni(esp,disp);

             if(lstAnimal == null){

                request.setAttribute("MsgErro", "Nenhum Gato Cadastrado para Adoção!");
                proximaPagina = "Cao/listaCao.jsp";

            }else {

            request.setAttribute("lstAnimal", lstAnimal);
            proximaPagina = "Cao/listaCao.jsp";
            }

        }

        if(operacao.equals("detalhar_gato")){

            int codigo = Integer.parseInt(request.getParameter("codigo"));


             Animais animal = AnimalDAO.getInstance().preparaAnimal(codigo);

             if(animal == null){

                 request.setAttribute("MsgErr", "Erro ao Processar os Dados do Animal.");

                 proximaPagina="Gato/detalharGato_usuario.jsp";
             }
             else{

                 request.setAttribute("DetalharAnimal", animal);

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

                 proximaPagina="Gato/detalharGato_usuario.jsp";
             }


        }

        if(operacao.equals("detalhar_cao")){

            int codigo = Integer.parseInt(request.getParameter("codigo"));


             Animais animal = AnimalDAO.getInstance().preparaAnimal(codigo);

             if(animal == null){

                 request.setAttribute("MsgErr", "Erro ao Processar os Dados do Animal.");

                 proximaPagina="Cao/detalharCao_usuario.jsp";
             }
             else{

                 request.setAttribute("DetalharAnimal", animal);

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

                 proximaPagina="Cao/detalharCao_usuario.jsp";
             }


        }

        

        //PARA DIRECIONAR AS PAGINAS PARA O LOCAL CERTO.
        RequestDispatcher rd = request.getRequestDispatcher(proximaPagina);
        rd.forward(request, response);

    } 

   

}
