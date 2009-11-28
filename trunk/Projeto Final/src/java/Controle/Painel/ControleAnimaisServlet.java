
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controle.Painel;

import Persistencia.Painel.AnimaisDAO;
import Persistencia.Painel.CorDAO;
import Persistencia.Painel.RacaDAO;
import Persistencia.Painel.PelagemDAO;
import Persistencia.Painel.PorteAnimalDAO;
import Persistencia.Painel.FormaEnvioDAO;
import Persistencia.Painel.ColaboradorDAO;

import Entidade.Painel.Colaborador;
import Entidade.Painel.Animais;
import Entidade.Painel.Cor;
import Entidade.Painel.Raca;
import Entidade.Painel.Pelagem;
import Entidade.Painel.PorteAnimal;
import Entidade.Painel.FormaEnvio;
import Entidade.Painel.Processo;


import Entidade.Painel.UF;
import Persistencia.Painel.UFDAO;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author usuario
 */
public class ControleAnimaisServlet extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String operacao="";
         operacao = request.getParameter("operacao");
        System.out.println("Controle Acionado com Operacao: " + operacao);
        String proximaPagina = "";

        
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimalLista.">
        if (operacao == null || operacao.equals("AnimalLista")) {

            Animais editarAnimal = new Animais();
            editarAnimal.setCodigo(0);

            request.setAttribute("editarAnimal", editarAnimal);

            proximaPagina = "/Painel_controle/ong/pesquisar_animal.jsp";

        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisMostraCanil.">
        else if (operacao.equals("AnimaisMostraCanil")) {

            int codigoAnimal = Integer.parseInt(request.getParameter("codigo"));

            Animais animais = AnimaisDAO.getInstance().le(codigoAnimal);
            List<Pelagem> lstpelagem = PelagemDAO.getInstance().leTodos();
            List<FormaEnvio> lstFormaEnvio = FormaEnvioDAO.getInstance().leTodos();
            List<Cor> lstCor = CorDAO.getInstance().leTodos();

            request.setAttribute("lstCor", lstCor);
            request.setAttribute("detalheCanil", animais);
            request.setAttribute("lstpelagem", lstpelagem);
            request.setAttribute("lstFormaEnvio", lstFormaEnvio);

            Animais animal = new Animais();
            animal.setCodigo(0);
            request.setAttribute("detalheColab", animal);
            request.setAttribute("editaAnimais", animal);

            proximaPagina = "/Painel_controle/ong/pesquisar_animal.jsp";

        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisMostraDoacao.">
        else if (operacao.equals("AnimaisMostraDoacao")) {

            int codigoAnimal = Integer.parseInt(request.getParameter("codigo"));

            Animais animais = AnimaisDAO.getInstance().le(codigoAnimal);
            List<Pelagem> lstpelagem = PelagemDAO.getInstance().leTodos();
            List<FormaEnvio> lstFormaEnvio = FormaEnvioDAO.getInstance().leTodos();
            List<Cor> lstCor = CorDAO.getInstance().leTodos();
            Colaborador colaborador= ColaboradorDAO.getInstance().le(animais.getCodigoColaborador());
            List<UF> lstUF = UFDAO.getInstance().leTodos();

            request.setAttribute("lstCor", lstCor);
            request.setAttribute("detalheCanil", animais);
            request.setAttribute("lstpelagem", lstpelagem);
            request.setAttribute("lstFormaEnvio", lstFormaEnvio);
            request.setAttribute("dadosColaborador", colaborador);
            request.setAttribute("lstUf", lstUF);

            Animais animal = new Animais();
            animal.setCodigo(0);
            request.setAttribute("detalheColab", animal);
            request.setAttribute("editaAnimais", animal);
            request.setAttribute("detalheAdotados", animal);

            proximaPagina = "/Painel_controle/ong/gerencia_doacao.jsp";

        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisMostraColaborador.">
        else if (operacao.equals("AnimaisMostraColaborador")) {

            int codigoAnimal = Integer.parseInt(request.getParameter("codigo"));

            Animais animais = AnimaisDAO.getInstance().le(codigoAnimal);
            List<Pelagem> lstpelagem = PelagemDAO.getInstance().leTodos();
            List<FormaEnvio> lstFormaEnvio = FormaEnvioDAO.getInstance().leTodos();
            List<Cor> lstCor = CorDAO.getInstance().leTodos();

            request.setAttribute("lstCor", lstCor);
            request.setAttribute("detalheColab", animais);
            request.setAttribute("lstpelagem", lstpelagem);
            request.setAttribute("lstFormaEnvio", lstFormaEnvio);

            Animais animal = new Animais();
            animal.setCodigo(0);
            request.setAttribute("detalheCanil", animal);
            request.setAttribute("editaAnimais", animais);

            proximaPagina = "/Painel_controle/ong/pesquisar_animal.jsp";
            //detalhes
        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisMostraAdotados.">
        else if (operacao.equals("AnimaisMostraAdotados")) {

            int codigoAnimal = Integer.parseInt(request.getParameter("codigoanimal"));
            int codigocolaborador = Integer.parseInt(request.getParameter("codigocolaborador"));

            Animais animais = AnimaisDAO.getInstance().le(codigoAnimal);
            Colaborador colaborador = ColaboradorDAO.getInstance().le(codigocolaborador);

            List<Pelagem> lstpelagem = PelagemDAO.getInstance().leTodos();
            List<Cor> lstCor = CorDAO.getInstance().leTodos();
            List<Processo> lstProcesso = AnimaisDAO.getInstance().leTodosAdotados();
            List<Animais> lstAnimais = AnimaisDAO.getInstance().leTodos();
            List<Colaborador> lstColaborador = ColaboradorDAO.getInstance().leTodos();

            request.setAttribute("lstColaborador", lstColaborador);
            request.setAttribute("lstProcesso", lstProcesso);
            request.setAttribute("lstAnimais", lstAnimais);

            request.setAttribute("lstCor", lstCor);
            request.setAttribute("detalheAdotados", animais);
            request.setAttribute("lstpelagem", lstpelagem);
            request.setAttribute("detalheColaborador", colaborador);

            proximaPagina = "/Painel_controle/ong/relatorio_adotados_canil.jsp";
            //detalhes
        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisMostraAdotadosColab.">
        else if (operacao.equals("AnimaisMostraAdotadosColab")) {

            int codigoAnimal = Integer.parseInt(request.getParameter("codigoanimal"));
            int codigocolaborador = Integer.parseInt(request.getParameter("codigocolaborador"));

            Animais animais = AnimaisDAO.getInstance().le(codigoAnimal);
            Colaborador colaborador = ColaboradorDAO.getInstance().le(codigocolaborador);
            Colaborador excolaborador = ColaboradorDAO.getInstance().le(animais.getCodigoColaborador());
            
            List<Pelagem> lstpelagem = PelagemDAO.getInstance().leTodos();
            List<Cor> lstCor = CorDAO.getInstance().leTodos();
            List<Processo> lstProcesso = AnimaisDAO.getInstance().leTodosAdotadosColaborador();
            List<Animais> lstAnimais = AnimaisDAO.getInstance().leTodos();
            List<Colaborador> lstColaborador = ColaboradorDAO.getInstance().leTodos();

            request.setAttribute("lstColaborador", lstColaborador);
            request.setAttribute("lstProcesso", lstProcesso);
            request.setAttribute("lstAnimais", lstAnimais);

            request.setAttribute("lstCor", lstCor);
            request.setAttribute("detalheAdotados", animais);
            request.setAttribute("lstpelagem", lstpelagem);
            request.setAttribute("detalheColaborador", colaborador);
            request.setAttribute("exdetalheColaborador", excolaborador);

            proximaPagina = "/Painel_controle/ong/relatorio_adotados_colab.jsp";
            //detalhe fila canil
        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisMostraFilaCanil.">
        else if (operacao.equals("AnimaisMostraFilaCanil")) {

            int codigoAnimal = Integer.parseInt(request.getParameter("codigoanimal"));
            
            Animais animais = AnimaisDAO.getInstance().le(codigoAnimal);
            
            List<Pelagem> lstpelagem = PelagemDAO.getInstance().leTodos();
            List<Cor> lstCor = CorDAO.getInstance().leTodos();
            List<Colaborador> lstColaborador = ColaboradorDAO.getInstance().leTodos();
            List<Animais> lstProcesso = AnimaisDAO.getInstance().leTodosFilaCanil();

            request.setAttribute("lstProcesso", lstProcesso);
            request.setAttribute("lstColaborador", lstColaborador);
            request.setAttribute("lstCor", lstCor);
            request.setAttribute("detalheAdotados", animais);
            request.setAttribute("lstpelagem", lstpelagem);
            

            proximaPagina = "/Painel_controle/ong/relatorio_fila_canil.jsp";
            //processa os relatorios
        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisMostraFilaColab.">
        else if (operacao.equals("AnimaisMostraFilaColab")) {

            int codigoAnimal = Integer.parseInt(request.getParameter("codigoanimal"));
            
            Animais animais = AnimaisDAO.getInstance().le(codigoAnimal);
            
            List<Pelagem> lstpelagem = PelagemDAO.getInstance().leTodos();
            List<Cor> lstCor = CorDAO.getInstance().leTodos();
            List<Colaborador> lstColaborador = ColaboradorDAO.getInstance().leTodos();
            List<Animais> lstProcesso = AnimaisDAO.getInstance().leTodosFilaColab();

            request.setAttribute("lstProcesso", lstProcesso);
            request.setAttribute("lstColaborador", lstColaborador);
            request.setAttribute("lstCor", lstCor);
            request.setAttribute("detalheAdotados", animais);
            request.setAttribute("lstpelagem", lstpelagem);
            

            proximaPagina = "/Painel_controle/ong/relatorio_fila_colab.jsp";
            //processa os relatorios
        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisMostraPendentesColab.">
        else if (operacao.equals("AnimaisMostraPendentesColab")) {

            int codigoAnimal = Integer.parseInt(request.getParameter("codigoanimal"));

            Animais animais = AnimaisDAO.getInstance().le(codigoAnimal);

            List<Pelagem> lstpelagem = PelagemDAO.getInstance().leTodos();
            List<Cor> lstCor = CorDAO.getInstance().leTodos();
            List<Colaborador> lstColaborador = ColaboradorDAO.getInstance().leTodos();
            List<Animais> lstProcesso = AnimaisDAO.getInstance().leTodosPendentesColab();
            List<FormaEnvio> lstFormaEnvio = FormaEnvioDAO.getInstance().leTodos();


            request.setAttribute("lstCor", lstCor);
            request.setAttribute("detalheCanil", animais);
            request.setAttribute("lstpelagem", lstpelagem);
            request.setAttribute("lstFormaEnvio", lstFormaEnvio);

            request.setAttribute("lstProcesso", lstProcesso);
            request.setAttribute("lstColaborador", lstColaborador);

            proximaPagina = "/Painel_controle/ong/relatorio_pendente_colab.jsp";

            //processa os relatorios
        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisMostraPendentesAprovacao.">
        else if (operacao.equals("AnimaisMostraPendentesAprovacao")) {

            int codigoAnimal = Integer.parseInt(request.getParameter("codigoanimal"));
            
            Animais animais = AnimaisDAO.getInstance().le(codigoAnimal);
            
            List<Pelagem> lstpelagem = PelagemDAO.getInstance().leTodos();
            List<Cor> lstCor = CorDAO.getInstance().leTodos();
            List<Colaborador> lstColaborador = ColaboradorDAO.getInstance().leTodos();
            List<Animais> lstProcesso = AnimaisDAO.getInstance().leTodosPendentesColab();
            List<FormaEnvio> lstFormaEnvio = FormaEnvioDAO.getInstance().leTodos();


            request.setAttribute("lstCor", lstCor);
            request.setAttribute("detalheCanil", animais);
            request.setAttribute("lstpelagem", lstpelagem);
            request.setAttribute("lstFormaEnvio", lstFormaEnvio);

            request.setAttribute("lstProcesso", lstProcesso);
            request.setAttribute("lstColaborador", lstColaborador);

             //na fila para adocao - canil
            List<Animais> lstfila = AnimaisDAO.getInstance().leTodosFilaCanil();
            int totalfilacani = lstfila.size();

            //adotados canil
            List<Processo> lstadotadoscanil = AnimaisDAO.getInstance().leTodosAdotados();
            //adotados colab
            List<Processo> lstadotadoscolab = AnimaisDAO.getInstance().leTodosAdotadosColaborador();
            int totalAdotados = lstadotadoscanil.size() + lstadotadoscolab.size() ;

            //animais cadastrados
            List<Animais> lstAnimais = AnimaisDAO.getInstance().leTodos();
             int totalanimaisCadastrados = lstAnimais.size();

            //pendentes de aprovacao de cadastro
            List<Animais> lstpendentecolab = AnimaisDAO.getInstance().leTodosPendentesColab();
            int totalpendentescolab = lstpendentecolab.size();

            request.setAttribute("totalfilacani", totalfilacani);
            request.setAttribute("totalAdotados", totalAdotados);
            request.setAttribute("totalanimaisCadastrados", totalanimaisCadastrados);
            request.setAttribute("totalpendentescolab", totalpendentescolab);

            List<Animais> lstTodosAnimais = AnimaisDAO.getInstance().leTodos();
            List<Processo> lstTodosProcessos = AnimaisDAO.getInstance().leTodosProcessos();

            request.setAttribute("lstTodosAnimais", lstTodosAnimais);
            request.setAttribute("lstTodosProcessos", lstTodosProcessos);
           
            proximaPagina = "/Painel_controle/ong/relatorio_geral.jsp";

            //processa os relatorios
        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisProcessaRelatorio.">
        else if (operacao.equals("AnimaisProcessaRelatorio")) {
            //Vlr-descricao
            //Sim-Animais em Canil/Gatil   -- name="tipo" value="adotados" id="animal_ad"
            //Nao-Animais em Colaborador   -- name="tipo" value="fila" id="animal_fl"
            //Todos-Geral                  -- name="tipo" value="pendente" id="animal_cdp"

            String localAnimal = request.getParameter("local");
            String tipoRelatorio = request.getParameter("tipo");

            HttpSession sessao = request.getSession();


            if (localAnimal.equals("") && tipoRelatorio.equals("")) {

                localAnimal = request.getParameter("localAnimal");
                tipoRelatorio = request.getParameter("tipoRelatorio");

            }
            if (localAnimal.equals("") && tipoRelatorio.equals("")) {

                proximaPagina = "/Painel_controle/ong/relatorio_animal.jsp";

            } else {

                sessao.setAttribute("localAnimal", localAnimal);
                sessao.setAttribute("tipoRelatorio", tipoRelatorio);

                //Animais adotados na ONG
                if (localAnimal.equals("Sim") && tipoRelatorio.equals("adotados"))
                {
                    List<Processo> lstProcesso = AnimaisDAO.getInstance().leTodosAdotados();
                    List<Animais> lstAnimais = AnimaisDAO.getInstance().leTodos();
                    List<Colaborador> lstColaborador = ColaboradorDAO.getInstance().leTodos();

                    request.setAttribute("lstColaborador", lstColaborador);
                    request.setAttribute("lstProcesso", lstProcesso);
                    request.setAttribute("lstAnimais", lstAnimais);


                    int count = lstProcesso.size();

                    if (count == 0) {
                        Animais animais = new Animais();
                        animais = null;
                        request.setAttribute("lstAnimais", animais);

                        Animais animal = new Animais();
                        animal.setCodigo(0);
                        request.setAttribute("detalheAdotados", animal);
                        

                        proximaPagina = "/Painel_controle/ong/relatorio_animal.jsp";

                    } else {
                        Animais animais = new Animais();
                        animais.setCodigo(0);
                        request.setAttribute("detalheAdotados", animais);
                        

                        proximaPagina = "/Painel_controle/ong/relatorio_adotados_canil.jsp";
                    }
                    
                }
                //Animais adotados no colaborador
                if (localAnimal.equals("Nao") && tipoRelatorio.equals("adotados")) {

                     List<Processo> lstProcesso = AnimaisDAO.getInstance().leTodosAdotadosColaborador();
                    List<Animais> lstAnimais = AnimaisDAO.getInstance().leTodos();
                    List<Colaborador> lstColaborador = ColaboradorDAO.getInstance().leTodos();

                    request.setAttribute("lstColaborador", lstColaborador);
                    request.setAttribute("lstProcesso", lstProcesso);
                    request.setAttribute("lstAnimais", lstAnimais);


                    int count = lstProcesso.size();

                    if (count == 0) {
                        Animais animais = new Animais();
                        animais = null;
                        request.setAttribute("lstAnimais", animais);

                        Animais animal = new Animais();
                        animal.setCodigo(0);
                        request.setAttribute("detalheAdotados", animal);


                        proximaPagina = "/Painel_controle/ong/relatorio_animal.jsp";

                    } else {
                        Animais animais = new Animais();
                        animais.setCodigo(0);
                        request.setAttribute("detalheAdotados", animais);

                        proximaPagina = "/Painel_controle/ong/relatorio_adotados_colab.jsp";
                        
                    }
                    
                }
                //Animais na fila ONG
                if (localAnimal.equals("Sim") && tipoRelatorio.equals("fila")) {

                    List<Animais> lstProcesso = AnimaisDAO.getInstance().leTodosFilaCanil();
                    
                    request.setAttribute("lstProcesso", lstProcesso);

                    int count = lstProcesso.size();

                    if (count == 0) {
                        Animais animais = new Animais();
                        animais = null;
                        request.setAttribute("lstAnimais", animais);

                        Animais animal = new Animais();
                        animal.setCodigo(0);
                        request.setAttribute("detalheAdotados", animal);


                        proximaPagina = "/Painel_controle/ong/relatorio_animal.jsp";

                    } else {
                        Animais animais = new Animais();
                        animais.setCodigo(0);
                        request.setAttribute("detalheAdotados", animais);

                        proximaPagina = "/Painel_controle/ong/relatorio_fila_canil.jsp";

                    }

                     
                }
                //Animais na fila colaborador
                if (localAnimal.equals("Nao") && tipoRelatorio.equals("fila")) {

                    List<Animais> lstProcesso = AnimaisDAO.getInstance().leTodosFilaColab();
                    List<Animais> lstAnimais = AnimaisDAO.getInstance().leTodos();
                    List<Colaborador> lstColaborador = ColaboradorDAO.getInstance().leTodos();

                    request.setAttribute("lstColaborador", lstColaborador);
                    request.setAttribute("lstProcesso", lstProcesso);
                    request.setAttribute("lstAnimais", lstAnimais);


                    int count = lstProcesso.size();

                    if (count == 0) {
                        Animais animais = new Animais();
                        animais = null;
                        request.setAttribute("lstAnimais", animais);

                        Animais animal = new Animais();
                        animal.setCodigo(0);
                        request.setAttribute("detalheAdotados", animal);


                        proximaPagina = "/Painel_controle/ong/relatorio_animal.jsp";

                    } else {
                        Animais animais = new Animais();
                        animais.setCodigo(0);
                        request.setAttribute("detalheAdotados", animais);

                        proximaPagina = "/Painel_controle/ong/relatorio_fila_colab.jsp";

                    }
                    
                }
                //Animais pendente colaborador
                if (localAnimal.equals("Nao") && tipoRelatorio.equals("pendente")) {

                    List<Animais> lstProcesso = AnimaisDAO.getInstance().leTodosPendentesColab();
                   
                    request.setAttribute("lstProcesso", lstProcesso);
                    
                    int count = lstProcesso.size();

                    if (count == 0) {
                        Animais animais = new Animais();
                        animais = null;
                        request.setAttribute("lstAnimais", animais);

                        Animais animal = new Animais();
                        animal.setCodigo(0);
                        request.setAttribute("detalheAdotados", animal);


                        proximaPagina = "/Painel_controle/ong/relatorio_animal.jsp";

                    } else {
                        Animais animais = new Animais();
                        animais.setCodigo(0);
                        request.setAttribute("detalheCanil", animais);

                        proximaPagina = "/Painel_controle/ong/relatorio_pendente_colab.jsp";

                    }
                    
                }
                if (localAnimal.equals("Todos")) {

                    //na fila para adocao - canil
                    List<Animais> lstfila = AnimaisDAO.getInstance().leTodosFilaCanil();
                    int totalfilacani = lstfila.size();

                    //adotados canil
                    List<Processo> lstadotadoscanil = AnimaisDAO.getInstance().leTodosAdotados();
                    //adotados colab
                    List<Processo> lstadotadoscolab = AnimaisDAO.getInstance().leTodosAdotadosColaborador();
                    int totalAdotados = lstadotadoscanil.size() + lstadotadoscolab.size() ;
                    
                    //animais cadastrados
                    List<Animais> lstAnimais = AnimaisDAO.getInstance().leTodos();
                     int totalanimaisCadastrados = lstAnimais.size();

                    //pendentes de aprovacao de cadastro
                    List<Animais> lstpendentecolab = AnimaisDAO.getInstance().leTodosPendentesColab();
                    int totalpendentescolab = lstpendentecolab.size();

                    request.setAttribute("totalfilacani", totalfilacani);
                    request.setAttribute("totalAdotados", totalAdotados);
                    request.setAttribute("totalanimaisCadastrados", totalanimaisCadastrados);
                    request.setAttribute("totalpendentescolab", totalpendentescolab);

                    List<Animais> lstTodosAnimais = AnimaisDAO.getInstance().leTodos();
                    List<Processo> lstTodosProcessos = AnimaisDAO.getInstance().leTodosProcessos();

                    request.setAttribute("lstTodosAnimais", lstTodosAnimais);
                    request.setAttribute("lstTodosProcessos", lstTodosProcessos);

                    Animais anima= new Animais();
                    anima.setCodigo(0);

                    request.setAttribute("detalheCanil", anima);
                    
                    proximaPagina = "/Painel_controle/ong/relatorio_geral.jsp";
                }
              }
        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisProcessaPesquisaDoacao.">
        else if (operacao.equals("AnimaisProcessaPesquisaDoacao")) {

            String localAnimal = "Nao";
            String tipoAnimal = request.getParameter("tipoAnimal");

            HttpSession sessao = request.getSession();

            if (localAnimal.equals("") || tipoAnimal.equals("")) {
                localAnimal = request.getParameter("tipoL");
                tipoAnimal = request.getParameter("tipoA");
            }
            if (localAnimal.equals("") && tipoAnimal.equals("")) {
                localAnimal = request.getParameter("tipoL");
                tipoAnimal = request.getParameter("tipoA");
            }
            if (localAnimal.equals("") || tipoAnimal.equals("")) {

                proximaPagina = "/Painel_controle/ong/gerencia_doacao.jsp";
            } else {
                sessao.setAttribute("localAnimal", localAnimal);
                sessao.setAttribute("tipoAnimal", tipoAnimal);

                List<Animais> lstAnimais = AnimaisDAO.getInstance().leTodosDoacao(tipoAnimal);

                List<Colaborador> lstColaborador = ColaboradorDAO.getInstance().leTodos();

                request.setAttribute("lstColaborador", lstColaborador);
                request.setAttribute("lstAnimais", lstAnimais);

                int count = lstAnimais.size();

                if (count == 0) {
                    Animais animais = new Animais();
                    animais = null;
                    request.setAttribute("lstAnimais", animais);

                    Animais animal = new Animais();
                    animal.setCodigo(0);
                    request.setAttribute("detalheCanil", animal);
                    request.setAttribute("detalheColab", animal);
                    request.setAttribute("editaAnimais", animal);
                    request.setAttribute("detalheAdotados",animais);

                    proximaPagina = "/Painel_controle/ong/gerencia_doacao.jsp";

                } else {
                    Animais animais = new Animais();
                    animais.setCodigo(0);
                    request.setAttribute("detalheCanil", animais);
                    request.setAttribute("detalheColab", animais);
                    request.setAttribute("editaAnimais", animais);
                    request.setAttribute("detalheAdotados",animais);
                    request.setAttribute("exdetalheColaborador",animais);
                    request.setAttribute("detalheColaborador",animais);
                    request.setAttribute("DadosColaborador", animais);
                    
                    proximaPagina = "/Painel_controle/ong/gerencia_doacao.jsp";
                }
            }


        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisProcessaPesquisa.">
        else if (operacao.equals("AnimaisProcessaPesquisa")) {

            String localAnimal = request.getParameter("localAnimal");
            String tipoAnimal = request.getParameter("tipoAnimal");

            HttpSession sessao = request.getSession();


            if (localAnimal.equals("") && tipoAnimal.equals("")) {
                localAnimal = request.getParameter("tipoL");
                tipoAnimal = request.getParameter("tipoA");
            }
            if (localAnimal.equals("") || tipoAnimal.equals("")) {

                proximaPagina = "/Painel_controle/ong/pesquisar_animal.jsp";
            } else {
                sessao.setAttribute("localAnimal", localAnimal);
                sessao.setAttribute("tipoAnimal", tipoAnimal);

                List<Animais> lstAnimais = AnimaisDAO.getInstance().leTodos(localAnimal, tipoAnimal);

                List<Colaborador> lstColaborador = ColaboradorDAO.getInstance().leTodos();

                request.setAttribute("lstColaborador", lstColaborador);
                request.setAttribute("lstAnimais", lstAnimais);

                int count = lstAnimais.size();

                if (count == 0) {
                    Animais animais = new Animais();
                    animais = null;
                    request.setAttribute("lstAnimais", animais);

                    Animais animal = new Animais();
                    animal.setCodigo(0);
                    request.setAttribute("detalheCanil", animal);
                    request.setAttribute("detalheColab", animal);
                    request.setAttribute("editaAnimais", animal);

                    proximaPagina = "/Painel_controle/ong/pesquisar_animal.jsp";

                } else {
                    Animais animais = new Animais();
                    animais.setCodigo(0);
                    request.setAttribute("detalheCanil", animais);
                    request.setAttribute("detalheColab", animais);
                    request.setAttribute("editaAnimais", animais);

                    proximaPagina = "/Painel_controle/ong/pesquisar_animal.jsp";
                }
            }


        } 
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisPesquisar.">
        else if (operacao.equals("AnimaisPesquisar")) {

            Animais animais = new Animais();
            animais.setCodigo(0);

            request.setAttribute("detalheCanil", animais);
            request.setAttribute("detalheColab", animais);
            request.setAttribute("editaAnimais", animais);

            proximaPagina = "/Painel_controle/ong/pesquisar_animal.jsp";

        } 
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AdocoesPesquisar.">
        else if (operacao.equals("AdocoesPesquisar")) {

            List<Animais> lstAnimais= AnimaisDAO.getInstance().leTodosFilaAdocao();

            int count = lstAnimais.size();

            if (count == 0) {
                Animais animais = new Animais();
                animais=null;

                request.setAttribute("lstAnimais", animais);

                Animais animal = new Animais();
                animal.setCodigo(0);

                Colaborador colaborador = new Colaborador();
                colaborador.setCodigo(0);

                request.setAttribute("detalheCanil", animal);
                request.setAttribute("detalheColab", colaborador);
                request.setAttribute("editaAnimais", animal);
                request.setAttribute("detalheAdotados", animal);

                proximaPagina = "/Painel_controle/ong/gerencia_adocao.jsp";
            }else{
                Animais animais = new Animais();
                animais.setCodigo(0);

                Colaborador colaborador = new Colaborador();
                colaborador.setCodigo(0);

                request.setAttribute("detalheCanil", animais);
                request.setAttribute("detalheColab", colaborador);
                request.setAttribute("editaAnimais", animais);
                request.setAttribute("detalheAdotados", animais);
                request.setAttribute("listaAnimais", lstAnimais);

                proximaPagina = "/Painel_controle/ong/gerencia_adocao.jsp";
            }

        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisMostraColabAdocao.">
        else if (operacao.equals("AnimaisMostraColabAdocao")) {

            int codigo = Integer.parseInt(request.getParameter("codigo"));
            int codigoanimal = Integer.parseInt(request.getParameter("codigoanimal"));
            Colaborador colaborador= ColaboradorDAO.getInstance().le(codigo);
            Processo processo = AnimaisDAO.leProcessoAnimal(codigo,codigoanimal);
            
            Animais animais = new Animais();
            animais=null;

            request.setAttribute("lstAnimais", animais);

            Animais animal = new Animais();
            animal.setCodigo(0);

            request.setAttribute("processo", processo);
            request.setAttribute("detalheColab", colaborador);
            request.setAttribute("editaAnimais", animal);
            request.setAttribute("detalheAdotados", animal);

            proximaPagina = "/Painel_controle/ong/gerencia_adocao.jsp";
        } 
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:DoacoesPesquisar.">
        else if (operacao.equals("DoacoesPesquisar")) {

            Animais animais = new Animais();
            animais.setCodigo(0);

            request.setAttribute("detalheCanil", animais);
            request.setAttribute("detalheColab", animais);
            request.setAttribute("editaAnimais", animais);
            request.setAttribute("detalheAdotados", animais);

            proximaPagina = "/Painel_controle/ong/gerencia_doacao.jsp";

        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisRelatorio.">
        else if (operacao.equals("AnimaisRelatorio")) {

            proximaPagina = "/Painel_controle/ong/relatorio_animal.jsp";

        } 
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisNovo.">
        else if (operacao.equals("AnimaisNovo")) {

            String msgErro = (String) request.getAttribute("msgErro");

            if (msgErro == null || msgErro.equals("")) {

                List<Cor> lstCor = CorDAO.getInstance().leTodos();
                List<Raca> lstRaca = RacaDAO.getInstance().leTodos();
                List<Pelagem> lstpelagem = PelagemDAO.getInstance().leTodos();
                List<PorteAnimal> lstPorteAnimal = PorteAnimalDAO.getInstance().leTodos();
                List<FormaEnvio> lstFormaEnvio = FormaEnvioDAO.getInstance().leTodos();

                request.setAttribute("lstCor", lstCor);
                request.setAttribute("lstRaca", lstRaca);
                request.setAttribute("lstpelagem", lstpelagem);
                request.setAttribute("lstPorteAnimal", lstPorteAnimal);
                request.setAttribute("lstFormaEnvio", lstFormaEnvio);

                Animais animais = new Animais();
                request.setAttribute("Animais", animais);
            }

            proximaPagina = "/Painel_controle/ong/cad_animal.jsp";

        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisNovoProcessa.">
        else if (operacao.equals("AnimaisNovoProcessa")) {

            Animais animais = new Animais();

            Date dtCadastro = new Date();
            animais.setDataCadastro(dtCadastro);
            animais.setNome(request.getParameter("nome"));
            animais.setEspecie(request.getParameter("especie"));
            animais.setSexo(request.getParameter("sexo"));
            animais.setCodigoRaca(Integer.parseInt(request.getParameter("raca")));
            animais.setIdade(Integer.parseInt(request.getParameter("idade")));
            animais.setCor1(Integer.parseInt(request.getParameter("cor1")));
            if(request.getParameter("cor2")!=null){
                animais.setCor2(Integer.parseInt(request.getParameter("cor2")));
            }else{
                animais.setCor2(99);
            }
            
            animais.setCodigoPelagem(Integer.parseInt(request.getParameter("cbopelagem")));
            animais.setPorte(Integer.parseInt(request.getParameter("porte")));
            animais.setEndFoto(request.getParameter("foto"));
            animais.setCastrado(request.getParameter("castrado"));
            animais.setLaudoVeterinario(request.getParameter("laudo"));
            animais.setVacinado(request.getParameter("vacina"));
            animais.setDescricaoVacina(request.getParameter("doses"));
            animais.setCodigoFormaEnvio(Integer.parseInt(request.getParameter("envio")));
            animais.setVlrTaxa(Double.parseDouble(request.getParameter("valortaxa")));
            animais.setDescricao(request.getParameter("descricao"));
            animais.setCodigoFuncionario(Integer.parseInt(request.getParameter("codigo_funcionario")));

            String msgErro = animais.validaDados(animais.INCLUSAO);

            if (msgErro.equals("")) {

                animais.setDataCadastro(animais.getDataCadastro());
                animais.setNome(animais.getNome());
                animais.setEspecie(animais.getEspecie());
                animais.setSexo(animais.getSexo());
                animais.setCodigoRaca(animais.getCodigoRaca());
                animais.setIdade(animais.getIdade());
                animais.setCor1(animais.getCor1());
                animais.setCor2(animais.getCor2());
                animais.setCodigoPelagem(animais.getCodigoPelagem());
                animais.setPorte(animais.getPorte());
                animais.setEndFoto(animais.getEndFoto());
                animais.setCastrado(animais.getCastrado());
                animais.setLaudoVeterinario(animais.getLaudoVeterinario());
                animais.setVacinado(animais.getVacinado());
                animais.setDescricaoVacina(animais.getDescricaoVacina());
                animais.setCodigoFormaEnvio(animais.getCodigoFormaEnvio());
                animais.setVlrTaxa(animais.getVlrTaxa());
                animais.setDescricao(animais.getDescricao());
                animais.setCodigoFuncionario(animais.getCodigoFuncionario());

                AnimaisDAO.getInstance().grava(animais);

                request.removeAttribute("msgErro");
                request.removeAttribute("Animais");

                proximaPagina = "ControleAnimaisServlet?operacao=AnimaisNovo";

            } else {
                request.setAttribute("msgErro", msgErro);

                request.setAttribute("Animais", animais);

                proximaPagina = "ControleAnimaisServlet?operacao=AnimaisNovo";
            }

        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisEdita.">
        else if (operacao.equals("AnimaisEdita")) {

            String localAnimal = request.getParameter("localAnimal");
            String tipoAnimal = request.getParameter("tipoAnimal");

            HttpSession sessao = request.getSession();

            sessao.setAttribute("localAnimal", localAnimal);
            sessao.setAttribute("tipoAnimal", tipoAnimal);

            int codigo = Integer.parseInt(request.getParameter("codigo"));

            String msgErro = (String) request.getAttribute("msgErro");

            if (msgErro == null || msgErro.equals("")) {

                List<Cor> lstCor = CorDAO.getInstance().leTodos();
                List<Raca> lstRaca = RacaDAO.getInstance().leTodos();
                List<Pelagem> lstpelagem = PelagemDAO.getInstance().leTodos();
                List<PorteAnimal> lstPorteAnimal = PorteAnimalDAO.getInstance().leTodos();
                List<FormaEnvio> lstFormaEnvio = FormaEnvioDAO.getInstance().leTodos();

                request.setAttribute("lstCor", lstCor);
                request.setAttribute("lstRaca", lstRaca);
                request.setAttribute("lstpelagem", lstpelagem);
                request.setAttribute("lstPorteAnimal", lstPorteAnimal);
                request.setAttribute("lstFormaEnvio", lstFormaEnvio);

                Animais animais = AnimaisDAO.getInstance().le(codigo);

                request.setAttribute("editaAnimais", animais);

                Animais felinos = new Animais();
                felinos = null;
                request.setAttribute("lstAnimais", felinos);

                Animais animal = new Animais();
                animal.setCodigo(0);
                request.setAttribute("detalheCanil", animal);
                request.setAttribute("detalheColab", animal);

            }


            proximaPagina = "/Painel_controle/ong/alterar_animal.jsp";

        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisEditaDoacao.">
        else if (operacao.equals("AnimaisEditaDoacao")) {

            String localAnimal = request.getParameter("localAnimal");
            String tipoAnimal = request.getParameter("tipoAnimal");

            HttpSession sessao = request.getSession();

            sessao.setAttribute("localAnimal", localAnimal);
            sessao.setAttribute("tipoAnimal", tipoAnimal);

            int codigo = Integer.parseInt(request.getParameter("codigo"));

            String msgErro = (String) request.getAttribute("msgErro");

            if (msgErro == null || msgErro.equals("")) {

                List<Cor> lstCor = CorDAO.getInstance().leTodos();
                List<Raca> lstRaca = RacaDAO.getInstance().leTodos();
                List<Pelagem> lstpelagem = PelagemDAO.getInstance().leTodos();
                List<PorteAnimal> lstPorteAnimal = PorteAnimalDAO.getInstance().leTodos();
                List<FormaEnvio> lstFormaEnvio = FormaEnvioDAO.getInstance().leTodos();

                request.setAttribute("lstCor", lstCor);
                request.setAttribute("lstRaca", lstRaca);
                request.setAttribute("lstpelagem", lstpelagem);
                request.setAttribute("lstPorteAnimal", lstPorteAnimal);
                request.setAttribute("lstFormaEnvio", lstFormaEnvio);

                Animais animais = AnimaisDAO.getInstance().le(codigo);

                request.setAttribute("editaAnimais", animais);

                Animais felinos = new Animais();
                felinos = null;
                request.setAttribute("lstAnimais", felinos);

                Animais animal = new Animais();
                animal.setCodigo(0);
                request.setAttribute("detalheCanil", animal);
                request.setAttribute("detalheColab", animal);

            }


            proximaPagina = "/Painel_controle/ong/alterar_animal_doacao.jsp";

        }
         // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisEditaProcessa.">
        else if (operacao.equals("AnimaisEditaProcessa")) {

            int codigo = Integer.parseInt(request.getParameter("codigo"));
            String localAnimal = request.getParameter("tipoL");
            String tipoAnimal = request.getParameter("tipoA");

            HttpSession sessao = request.getSession();

            sessao.setAttribute("localAnimal", localAnimal);
            sessao.setAttribute("tipoAnimal", tipoAnimal);

            Animais animais = new Animais();

            Date dtCadastro = new Date();
            animais.setDataCadastro(dtCadastro);
            animais.setCodigo(codigo);
            animais.setNome(request.getParameter("nome"));
            animais.setEspecie(request.getParameter("especie"));
            animais.setSexo(request.getParameter("sexo"));
            animais.setCodigoRaca(Integer.parseInt(request.getParameter("raca")));
            animais.setIdade(Integer.parseInt(request.getParameter("idade")));
            animais.setCor1(Integer.parseInt(request.getParameter("cor1")));
            animais.setCor2(Integer.parseInt(request.getParameter("cor2")));
            animais.setCodigoPelagem(Integer.parseInt(request.getParameter("cbopelagem")));
            animais.setPorte(Integer.parseInt(request.getParameter("porte")));
            animais.setEndFoto(request.getParameter("foto"));
            animais.setCastrado(request.getParameter("castrado"));
            animais.setLaudoVeterinario(request.getParameter("laudo"));
            animais.setVacinado(request.getParameter("vacina"));
            animais.setDescricaoVacina(request.getParameter("doses"));
            animais.setCodigoFormaEnvio(Integer.parseInt(request.getParameter("envio")));
            animais.setVlrTaxa(Double.parseDouble(request.getParameter("valortaxa")));
            animais.setDescricao(request.getParameter("descricao"));
            animais.setCodigoFuncionario(Integer.parseInt(request.getParameter("codigo_funcionario")));

            String msgErro = animais.validaDados(animais.ALTERACAO);

            if (msgErro.equals("")) {

                animais.setDataCadastro(animais.getDataCadastro());
                animais.setCodigo(animais.getCodigo());
                animais.setNome(animais.getNome());
                animais.setEspecie(animais.getEspecie());
                animais.setSexo(animais.getSexo());
                animais.setCodigoRaca(animais.getCodigoRaca());
                animais.setIdade(animais.getIdade());
                animais.setCor1(animais.getCor1());
                animais.setCor2(animais.getCor2());
                animais.setCodigoPelagem(animais.getCodigoPelagem());
                animais.setPorte(animais.getPorte());
                animais.setEndFoto(animais.getEndFoto());
                animais.setCastrado(animais.getCastrado());
                animais.setLaudoVeterinario(animais.getLaudoVeterinario());
                animais.setVacinado(animais.getVacinado());
                animais.setDescricaoVacina(animais.getDescricaoVacina());
                animais.setCodigoFormaEnvio(animais.getCodigoFormaEnvio());
                animais.setVlrTaxa(animais.getVlrTaxa());
                animais.setDescricao(animais.getDescricao());
                animais.setCodigoFuncionario(animais.getCodigoFuncionario());

                AnimaisDAO.getInstance().altera(animais);

                request.removeAttribute("msgErro");
                request.removeAttribute("Animais");

                proximaPagina = "ControleAnimaisServlet?operacao=AnimaisProcessaPesquisa&localAnimal=" + localAnimal + "&tipoAnimal=" + tipoAnimal;

            } else {
                request.setAttribute("msgErro", msgErro);

                request.setAttribute("Animais", animais);

                proximaPagina = "ControleAnimaisServlet?operacao=AnimaisEdita&localAnimal=" + localAnimal + "&tipoAnimal=" + tipoAnimal + "&codigo=" + codigo;
            }

        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisEditaProcessaDoacao.">
        else if (operacao.equals("AnimaisEditaProcessaDoacao")) {

            int codigo = Integer.parseInt(request.getParameter("codigo"));
            String localAnimal = request.getParameter("tipoL");
            String tipoAnimal = request.getParameter("tipoA");

            HttpSession sessao = request.getSession();

            sessao.setAttribute("localAnimal", localAnimal);
            sessao.setAttribute("tipoAnimal", tipoAnimal);

            Animais animais = new Animais();

            Date dtCadastro = new Date();
            animais.setDataCadastro(dtCadastro);
            animais.setCodigo(codigo);
            animais.setNome(request.getParameter("nome"));
            animais.setEspecie(request.getParameter("especie"));
            animais.setSexo(request.getParameter("sexo"));
            animais.setCodigoRaca(Integer.parseInt(request.getParameter("raca")));
            animais.setIdade(Integer.parseInt(request.getParameter("idade")));
            animais.setCor1(Integer.parseInt(request.getParameter("cor1")));
            animais.setCor2(Integer.parseInt(request.getParameter("cor2")));
            animais.setCodigoPelagem(Integer.parseInt(request.getParameter("cbopelagem")));
            animais.setPorte(Integer.parseInt(request.getParameter("porte")));
            animais.setEndFoto(request.getParameter("foto"));
            animais.setCastrado(request.getParameter("castrado"));
            animais.setLaudoVeterinario(request.getParameter("laudo"));
            animais.setVacinado(request.getParameter("vacina"));
            animais.setDescricaoVacina(request.getParameter("doses"));
            animais.setCodigoFormaEnvio(Integer.parseInt(request.getParameter("envio")));
            animais.setVlrTaxa(Double.parseDouble(request.getParameter("valortaxa")));
            animais.setDescricao(request.getParameter("descricao"));
            animais.setCodigoFuncionario(Integer.parseInt(request.getParameter("codigo_funcionario")));

            String msgErro = animais.validaDados(animais.ALTERACAO);

            if (msgErro.equals("")) {

                animais.setDataCadastro(animais.getDataCadastro());
                animais.setCodigo(animais.getCodigo());
                animais.setNome(animais.getNome());
                animais.setEspecie(animais.getEspecie());
                animais.setSexo(animais.getSexo());
                animais.setCodigoRaca(animais.getCodigoRaca());
                animais.setIdade(animais.getIdade());
                animais.setCor1(animais.getCor1());
                animais.setCor2(animais.getCor2());
                animais.setCodigoPelagem(animais.getCodigoPelagem());
                animais.setPorte(animais.getPorte());
                animais.setEndFoto(animais.getEndFoto());
                animais.setCastrado(animais.getCastrado());
                animais.setLaudoVeterinario(animais.getLaudoVeterinario());
                animais.setVacinado(animais.getVacinado());
                animais.setDescricaoVacina(animais.getDescricaoVacina());
                animais.setCodigoFormaEnvio(animais.getCodigoFormaEnvio());
                animais.setVlrTaxa(animais.getVlrTaxa());
                animais.setDescricao(animais.getDescricao());
                animais.setCodigoFuncionario(animais.getCodigoFuncionario());

                AnimaisDAO.getInstance().alteraDoacao(animais);

                request.removeAttribute("msgErro");
                request.removeAttribute("Animais");

                proximaPagina = "ControleAnimaisServlet?operacao=AnimaisProcessaPesquisaDoacao&localAnimal=" + localAnimal + "&tipoAnimal=" + tipoAnimal;

            } else {
                request.setAttribute("msgErro", msgErro);

                request.setAttribute("Animais", animais);

                proximaPagina = "ControleAnimaisServlet?operacao=AnimaisEditaDoacao&localAnimal=" + localAnimal + "&tipoAnimal=" + tipoAnimal + "&codigo=" + codigo;
            }

        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisApaga.">
        else if (operacao.equals("AnimaisApaga")) {

            String localAnimal = request.getParameter("localAnimal");
            String tipoAnimal = request.getParameter("tipoAnimal");

            //RECUPERA E CONVERTE PARA INT PARA DEPOIS APAGAR O REGISTRO NO BANCO
            int codigo = Integer.parseInt(request.getParameter("codigo"));

            //METODO PARA APAGAR OS DADOS NO BANCO
            int ret = AnimaisDAO.getInstance().apaga(codigo);

            proximaPagina = "ControleAnimaisServlet?operacao=AnimaisProcessaPesquisa&localAnimal=" + localAnimal + "&tipoAnimal=" + tipoAnimal;

        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisApagaDoacao.">
        else if (operacao.equals("AnimaisApagaDoacao")) {

            String localAnimal = request.getParameter("localAnimal");
            String tipoAnimal = request.getParameter("tipoAnimal");

            //RECUPERA E CONVERTE PARA INT PARA DEPOIS APAGAR O REGISTRO NO BANCO
            int codigo = Integer.parseInt(request.getParameter("codigo"));

            //METODO PARA APAGAR OS DADOS NO BANCO
            int ret = AnimaisDAO.getInstance().apaga(codigo);

            proximaPagina = "ControleAnimaisServlet?operacao=AnimaisProcessaPesquisaDoacao&localAnimal=" + localAnimal + "&tipoAnimal=" + tipoAnimal;

        }
        // </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisAprovarAdocoes.">
        else if (operacao.equals("AnimaisAprovarAdocoes")) {


            int codigoAnimal = Integer.parseInt(request.getParameter("codigoanimal"));
            int codigoprocesso = Integer.parseInt(request.getParameter("codigoprocesso"));

            //METODO PARA APAGAR OS DADOS NO BANCO
            int ret = AnimaisDAO.getInstance().aprovaAdocoesAnimais(codigoAnimal);
            int ret1 = AnimaisDAO.getInstance().aprovaAdocoesProcesso(codigoprocesso);

            proximaPagina = "ControleAnimaisServlet?operacao=AdocoesPesquisar";

        }// </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisAprovarPendentesColab.">
        else if (operacao.equals("AnimaisAprovarPendentesColab")) {


            int codigo = Integer.parseInt(request.getParameter("codigoanimal"));

            //METODO PARA APAGAR OS DADOS NO BANCO
            int ret = AnimaisDAO.getInstance().aprova(codigo);

            proximaPagina = "ControleAnimaisServlet?operacao=AnimaisProcessaRelatorio&local=Nao&tipo=pendente";

        }// </editor-fold>
        // <editor-fold defaultstate="collapsed" desc="Operacao:AnimaisAprovarPendentesAprovacao.">
        else if (operacao.equals("AnimaisAprovarPendentesAprovacao")) {

            
            int codigo = Integer.parseInt(request.getParameter("codigoanimal"));

            //METODO PARA APAGAR OS DADOS NO BANCO
            int ret = AnimaisDAO.getInstance().aprova(codigo);

            proximaPagina = "ControleAnimaisServlet?operacao=AnimaisProcessaRelatorio&local=Todos";

        }// </editor-fold>

        RequestDispatcher rd = request.getRequestDispatcher(proximaPagina);
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="Métodos HttpServlet. Clique no sinal de + à esquerda para editar o código.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
