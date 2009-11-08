package Controle.Portal;

import Entidade.Portal.Animais;
import Entidade.Portal.Cor;
import Entidade.Portal.Pelagem;
import Entidade.Portal.Porte;
import Entidade.Portal.Processo;
import Entidade.Portal.Raca;
import Entidade.Portal.TipoEnvio;
import Persistencia.Portal.CorDAO;
import Persistencia.Portal.EnvioDAO;
import Persistencia.Portal.PelagemDAO;
import Persistencia.Portal.PorteDAO;
import Persistencia.Portal.ProcessoDAO;
import Persistencia.Portal.RacaDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletProcesso extends HttpServlet {

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

        if (operacao.equals("listar_animais")) {
            int codigoDono = Integer.parseInt(request.getParameter("cod_colaborador"));
            List<Animais> animais = ProcessoDAO.getInstance().recuperaAnimais(codigoDono);
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
            request.setAttribute("Animais", animais);
            proximaPagina = "Painel_controle/Usuario/filtro_processo.jsp";
        }

        else if (operacao.equals("listar_processos")) {
            int codigoAnimal = Integer.parseInt(request.getParameter("cod_animal"));
            List<Processo> processos = ProcessoDAO.getInstance().recuperaProcessos(codigoAnimal);
        }

        //PARA DIRECIONAR AS PAGINAS PARA O LOCAL CERTO.
        RequestDispatcher rd = request.getRequestDispatcher(proximaPagina);
        rd.forward(request, response);

    }
}
