package Controle.Painel;

import Entidade.Painel.Raca;
import Persistencia.Painel.RacaDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class ControleRacaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //RECEBE O TIPOD E OPERACAO A REALIZAR
        String operacao = request.getParameter("operacao");
        //LOG PARA TESTE
        System.out.println("Controle Acionado com Operacao: " + operacao);

        String proximaPagina = "";

        if (operacao == null || operacao.equals("RacaLista")) {

            //RECUPERA LISTA DE FORMA DE ENVIOS - METODO LETODOS()
            List<Raca> lstRacas = RacaDAO.getInstance().leTodos();

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
          
            request.setAttribute("lstRacas", lstRacas);

            //INSTANCIA A CLASSE - FEITO PARA SOLUCIONAR PROBLEMA DE ALTERCAO
            Raca editarRacas = new Raca();
            editarRacas.setCodigo(0);
            editarRacas.setDescricao("");
            editarRacas.setEspecie("");

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("editarRacas", editarRacas);

            proximaPagina = "/Painel_controle/ong/gerencia_raças.jsp";

        } else if (operacao.equals("RacaNovo")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de Racas
            System.out.println(msgErro);

            if (msgErro == null || msgErro.equals("")) {

                //INSTANCIA A CLASSE
                Raca raca = new Raca();

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
                request.setAttribute("Raca", raca);
            }

            proximaPagina = "/Painel_controle/ong/gerencia_raças.jsp";

        } else if (operacao.equals("RacaNovoProcessa")) {

            // ISNTANCIA A CLASSE - Obtem dados do formulario
            Raca raca = new Raca();

            //RECUPERA PARAMENTRO DESCRICAO
            raca.setDescricao(request.getParameter("descricao").trim());
            String especie = request.getParameter("cao");
            if(especie!= "on")
            {
                 especie ="Cao";
            }else
            {
                especie="Gato";
            }
            raca.setEspecie(especie);

            // Mensagem de erro e proxima pagina
            String msgErro = raca.validaDados(raca.INCLUSAO);

            // Monta Raca com dados validos ou monta mensagens de erro

            if (msgErro.equals("")) {

                //raca.setCodigo(raca.getCodigo());
                raca.setDescricao(raca.getDescricao());
                raca.setEspecie(raca.getEspecie());
                //EFETUA A GRAVACAO DOS DADOS
                RacaDAO.getInstance().grava(raca);

                //REMOVE OS ATRIBUTOS
                request.removeAttribute("msgErro");
                request.removeAttribute("Raca");

                proximaPagina = "ControleRacaServlet?operacao=RacaLista";

            } else {
                request.setAttribute("msgErro", msgErro);

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
                request.setAttribute("Raca", raca);

                proximaPagina = "ControleRacaServlet?operacao=RacaNovo";
            }

        } else if (operacao.equals("RacaMostra")) {

            int codigo =   Integer.parseInt(request.getParameter("codigo"));

            //LE OS DADOS APARTIR DE UM CODIGO
            Raca raca = RacaDAO.getInstance().le(codigo);

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("Raca", raca);

            proximaPagina = "/Painel_controle/ong/gerencia_raças.jsp";

        } else if (operacao.equals("RacaEdita")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de Racas
            if (msgErro == null || msgErro.equals("")) {

                //CONVERTE O CODIGO PARA RECUPERAR
                int codigo =   Integer.parseInt(request.getParameter("codigo"));

                //Busca pelo codigo
                Raca raca = RacaDAO.getInstance().le(codigo);

                //Busca Todos
                List<Raca> lstRacas = RacaDAO.getInstance().leTodos();

                Raca editarRacas = new Raca();

                editarRacas.setCodigo(raca.getCodigo());
                editarRacas.setDescricao(raca.getDescricao());
                editarRacas.setEspecie(raca.getEspecie());

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP - Para preencher a grid
                request.setAttribute("lstRacas", lstRacas);
                //para preencher os campos que serao alterados
                request.setAttribute("editarRacas", editarRacas);
            }

            proximaPagina = "/Painel_controle/ong/gerencia_raças.jsp";

        } else if (operacao.equals("RacaEditaProcessa")) {

            // Obtem dados do formulario
            Raca Raca = new Raca();

            int codigo =   Integer.parseInt(request.getParameter("codigo"));
            Raca.setCodigo(codigo);
            Raca.setDescricao(request.getParameter("descricao").trim());
            String especie = request.getParameter("cao");
            if(especie!= "on")
            {
                 especie ="Cao";
            }else
            {
                especie="Gato";
            }
            Raca.setEspecie(especie);
            // Mensagem de erro e proxima pagina
            String msgErro = Raca.validaDados(Raca.ALTERACAO);

            // Monta Raca com dados validos ou monta mensagens de erro
            if (msgErro.equals("")) {

                Raca raca = new Raca();

                raca.setCodigo(Raca.getCodigo());
                raca.setDescricao(Raca.getDescricao());
                raca.setEspecie(Raca.getEspecie());
                //FAZ O UPDATE OU SEJA ATUALIZA O DADO EDITADO
                RacaDAO.getInstance().altera(raca);

                //REMOVE OS ATRIBUTOS
                request.removeAttribute("msgErro");
                request.removeAttribute("Raca");

                proximaPagina = "ControleRacaServlet?operacao=RacaLista";
            } else {

                //SETA OS ATRIBUTOS
                request.setAttribute("msgErro", msgErro);
                request.setAttribute("Raca", Raca);

                proximaPagina = "ControleRacaServlet?operacao=RacaEdita";
            }

        } else if (operacao.equals("RacaApaga")) {

            //RECUPERA E CONVERTE PARA INT PARA DEPOIS APAGAR O REGISTRO NO BANCO
            int codigo = Integer.parseInt(request.getParameter("codigo"));

            //METODO PARA APAGAR OS DADOS NO BANCO
            int ret = RacaDAO.getInstance().apaga(codigo);

            proximaPagina = "ControleRacaServlet?operacao=RacaLista";

        }

        //PARA DIRECIONAR AS PAGINAS PARA O LOCAL CERTO.
        RequestDispatcher rd = request.getRequestDispatcher(proximaPagina);
        rd.forward(request, response);

    }

// <editor-fold defaultstate="collapsed" desc="M�todos HttpServlet. Clique no sinal de + � esquerda para editar o c�digo.">
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
