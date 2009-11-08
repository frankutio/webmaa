package Controle.Portal;

import Entidade.Portal.Animais;
import Entidade.Portal.Cor;
import Entidade.Portal.Pelagem;
import Entidade.Portal.Porte;
import Entidade.Portal.Processo;
import Entidade.Portal.SuperProcesso;
import Entidade.Portal.Raca;
import Entidade.Portal.TipoEnvio;
import Persistencia.Portal.ColaboradorDAO;
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
            List<SuperProcesso> superProcessos = new ArrayList<SuperProcesso>();
            for (Processo p : ProcessoDAO.getInstance().recuperaProcessos(codigoAnimal)) {
                SuperProcesso superProc = new SuperProcesso();
                superProc.processo = p;
                superProc.colaborador = PortalColabDAO.getInstance().le(p.getCodigoColaborador());
                superProcessos.add(superProc);
            }
            request.setAttribute("Processos", superProcessos);
            request.setAttribute("lstUF", UFDAO.getInstance().leTodos());
            request.setAttribute("Animal", AnimalDAO.getInstance().preparaAnimal(codigoAnimal));
            proximaPagina = "Painel_controle/Usuario/detalhar_processo.jsp";
        }

    // -------------------------- ADOÇÃO ------------------------------------ //

        else if (operacao.equals("ver_adocao")) {
            int codigoColaborador = Integer.parseInt(request.getParameter("cod_colaborador"));
            SuperProcesso superProc = new SuperProcesso();
            superProc.processo = ProcessoDAO.getInstance().recuperaAdocao(codigoColaborador);
            superProc.colaborador = PortalColabDAO.getInstance().le(superProc.processo.getCodigoColaborador());
            superProc.animal = AnimalDAO.getInstance().preparaAnimal(superProc.processo.getCodigoAnimal());
        }


        //PARA DIRECIONAR AS PAGINAS PARA O LOCAL CERTO.
        RequestDispatcher rd = request.getRequestDispatcher(proximaPagina);
        rd.forward(request, response);

    }
}
