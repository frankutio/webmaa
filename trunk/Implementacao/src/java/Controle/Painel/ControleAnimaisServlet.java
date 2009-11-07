/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Controle.Painel;

import Entidade.Painel.Colaborador;
import Entidade.Painel.Animais;
import Persistencia.Painel.AnimaisDAO;

import Persistencia.Painel.CorDAO;
import Persistencia.Painel.RacaDAO;
import Persistencia.Painel.PelagemDAO;
import Persistencia.Painel.PorteAnimalDAO;
import Persistencia.Painel.FormaEnvioDAO;

import Entidade.Painel.Cor;
import Entidade.Painel.Raca;
import Entidade.Painel.Pelagem;
import Entidade.Painel.PorteAnimal;
import Entidade.Painel.FormaEnvio;

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
        //RECEBE O TIPOD E OPERACAO A REALIZAR
        String operacao = request.getParameter("operacao");
        //LOG PARA TESTE
        System.out.println("Controle Acionado com Operacao: " + operacao);

        String proximaPagina = "";

        if (operacao == null || operacao.equals("ColaboradorLista")) {

            //RECUPERA LISTA DE FORMA DE ENVIOS - METODO LETODOS()
            //List<Colaborador> lstColaborador = AnimaisDAO.getInstance().leTodos();
            //request.setAttribute("lstColaborador", lstColaborador);

            //List<Cor> lstUF = CorDAO.getInstance().leTodos();
            //request.setAttribute("lstUF", lstUF);

            Colaborador editarColaborador = new Colaborador();
            editarColaborador.setCodigo(0);

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("editarColaborador", editarColaborador);

            proximaPagina = "/Painel_controle/ong/pesquisar_colaborador.jsp";

        } else if (operacao.equals("AnimaisNovo")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de Colaboradors
            if (msgErro == null || msgErro.equals("")) {

                List<Cor> lstCor = CorDAO.getInstance().leTodos();
                List<Raca> lstRaca = RacaDAO.getInstance().leTodos();
                List<Pelagem> lstpelagem=PelagemDAO.getInstance().leTodos();
                List<PorteAnimal> lstPorteAnimal=PorteAnimalDAO.getInstance().leTodos();
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

        }else if (operacao.equals("AnimaisNovoProcessa")) {

            //COVNERTE DATA
           
            // ISNTANCIA A CLASSE - Obtem dados do formulario
            Animais animais = new Animais();

            //RECUPERA PARAMENTRO DESCRICAO
            

            Date dtCadastro = new Date();
            animais.setDataCadastro(dtCadastro);
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
            animais.setdescricaoVacina(request.getParameter("doses"));
            animais.setCodigoFormaEnvio(Integer.parseInt(request.getParameter("envio")));
            animais.setVlrTaxa(Double.parseDouble(request.getParameter("valortaxa")));
            animais.setdescricao(request.getParameter("descricao"));
                
            // Mensagem de erro e proxima pagina
            String msgErro = animais.validaDados(animais.INCLUSAO);

            // Monta Colaborador com dados validos ou monta mensagens de erro

            if (msgErro.equals("")) {

                //colaborador.setCodigo(colaborador.getCodigo());

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
                animais.setdescricaoVacina(animais.getDescricaoVacina());
                animais.setCodigoFormaEnvio(animais.getCodigoFormaEnvio());
                animais.setVlrTaxa(animais.getVlrTaxa());
                animais.setdescricao(animais.getDescricao());
                    //EFETUA A GRAVACAO DOS DADOS
                    AnimaisDAO.getInstance().grava(animais);

                    //REMOVE OS ATRIBUTOS
                    request.removeAttribute("msgErro");
                    request.removeAttribute("Animais");

                    proximaPagina = "ControleAnimaisServlet?operacao=AnimaisNovo";

                } else {
                    request.setAttribute("msgErro", msgErro);

                    //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
                    request.setAttribute("Animais", animais);

                    proximaPagina = "ControleAnimaisServlet?operacao=AnimaisNovo";
                }
             
        }
         //PARA DIRECIONAR AS PAGINAS PARA O LOCAL CERTO.
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
