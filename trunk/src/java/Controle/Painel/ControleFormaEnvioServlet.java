package Controle.Painel;

import Entidade.Painel.FormaEnvio;
import Persistencia.Painel.FormaEnvioDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class ControleFormaEnvioServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //RECEBE O TIPOD E OPERACAO A REALIZAR
        String operacao = request.getParameter("operacao");
        //LOG PARA TESTE
        System.out.println("Controle Acionado com Operacao: " + operacao);

        String proximaPagina = "";

        if (operacao == null || operacao.equals("FormaEnvioLista")) {

            //RECUPERA LISTA DE FORMA DE ENVIOS - METODO LETODOS()
            List<FormaEnvio> lstFormaEnvios = FormaEnvioDAO.getInstance().leTodos();
            
            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("lstFormaEnvios", lstFormaEnvios);

            //INSTANCIA A CLASSE - FEITO PARA SOLUCIONAR PROBLEMA DE ALTERCAO
            FormaEnvio editarFormaEnvios = new FormaEnvio();
            editarFormaEnvios.setCodigo(0);
            editarFormaEnvios.setdescricao("");

            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("editarFormaEnvios", editarFormaEnvios);

            proximaPagina = "/Painel_controle/ong/gerencia_forma_envio.jsp";

        } else if (operacao.equals("FormaEnvioNovo")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de FormaEnvios
            System.out.println(msgErro);
            
            if (msgErro == null || msgErro.equals("")) {
                
                //INSTANCIA A CLASSE
                FormaEnvio formaEnvio = new FormaEnvio();
                
                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
                request.setAttribute("FormaEnvio", formaEnvio);
            }

            proximaPagina = "/Painel_controle/ong/gerencia_forma_envio.jsp";

        } else if (operacao.equals("FormaEnvioNovoProcessa")) {

            // ISNTANCIA A CLASSE - Obtem dados do formulario
            FormaEnvio formaEnvio = new FormaEnvio();

            //RECUPERA PARAMENTRO DESCRICAO
            formaEnvio.setdescricao(request.getParameter("descricao").trim());

            // Mensagem de erro e proxima pagina
            String msgErro = formaEnvio.validaDados(formaEnvio.INCLUSAO);

            // Monta FormaEnvio com dados validos ou monta mensagens de erro
           
            if (msgErro.equals("")) {
                
                //formaEnvio.setCodigo(formaEnvio.getCodigo());
                formaEnvio.setdescricao(formaEnvio.getDescricao());
                
                //EFETUA A GRAVACAO DOS DADOS
                FormaEnvioDAO.getInstance().grava(formaEnvio);
                
                //REMOVE OS ATRIBUTOS
                request.removeAttribute("msgErro");
                request.removeAttribute("FormaEnvio");

                proximaPagina = "ControleFormaEnvioServlet?operacao=FormaEnvioLista";

            } else {
                request.setAttribute("msgErro", msgErro);
               
                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
                request.setAttribute("FormaEnvio", formaEnvio);

                proximaPagina = "ControleFormaEnvioServlet?operacao=FormaEnvioNovo";
            }

        } else if (operacao.equals("FormaEnvioMostra")) {

            int codigo =   Integer.parseInt(request.getParameter("codigo"));

            //LE OS DADOS APARTIR DE UM CODIGO
            FormaEnvio formaEnvio = FormaEnvioDAO.getInstance().le(codigo);
            
            //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP
            request.setAttribute("FormaEnvio", formaEnvio);
            
            proximaPagina = "/Painel_controle/ong/gerencia_forma_envio.jsp";

        } else if (operacao.equals("FormaEnvioEdita")) {

            String msgErro = (String) request.getAttribute("msgErro");

            // Acionamento novo pelo controle geral de FormaEnvios
            if (msgErro == null || msgErro.equals("")) {

                //CONVERTE O CODIGO PARA RECUPERAR
                int codigo =   Integer.parseInt(request.getParameter("codigo"));

                //Busca pelo codigo
                FormaEnvio formaEnvio = FormaEnvioDAO.getInstance().le(codigo);

                //Busca Todos
                List<FormaEnvio> lstFormaEnvios = FormaEnvioDAO.getInstance().leTodos();

                FormaEnvio editarFormaEnvios = new FormaEnvio();

                editarFormaEnvios.setCodigo(formaEnvio.getCodigo());
                editarFormaEnvios.setdescricao(formaEnvio.getDescricao());

                //CRIA UM ATRIBUTO PARA MANDAR PARA A JSP - Para preencher a grid
                request.setAttribute("lstFormaEnvios", lstFormaEnvios);
                //para preencher os campos que serao alterados
                request.setAttribute("editarFormaEnvios", editarFormaEnvios);
            }

            proximaPagina = "/Painel_controle/ong/gerencia_forma_envio.jsp";
            
        } else if (operacao.equals("FormaEnvioEditaProcessa")) {

            // Obtem dados do formulario
            FormaEnvio FormaEnvio = new FormaEnvio();

            int codigo =   Integer.parseInt(request.getParameter("codigo"));

            FormaEnvio.setCodigo(codigo);
            FormaEnvio.setdescricao(request.getParameter("descricao").trim());
            
            // Mensagem de erro e proxima pagina
            String msgErro = FormaEnvio.validaDados(FormaEnvio.ALTERACAO);

            // Monta FormaEnvio com dados validos ou monta mensagens de erro
            if (msgErro.equals("")) {

                FormaEnvio formaEnvio = new FormaEnvio();

                formaEnvio.setCodigo(FormaEnvio.getCodigo());
                formaEnvio.setdescricao(FormaEnvio.getDescricao());

                //FAZ O UPDATE OU SEJA ATUALIZA O DADO EDITADO
                FormaEnvioDAO.getInstance().altera(formaEnvio);
                
                //REMOVE OS ATRIBUTOS
                request.removeAttribute("msgErro");
                request.removeAttribute("FormaEnvio");

                proximaPagina = "ControleFormaEnvioServlet?operacao=FormaEnvioLista";
            } else {

                //SETA OS ATRIBUTOS
                request.setAttribute("msgErro", msgErro);
                request.setAttribute("FormaEnvio", FormaEnvio);

                proximaPagina = "ControleFormaEnvioServlet?operacao=FormaEnvioEdita";
            }

        } else if (operacao.equals("FormaEnvioApaga")) {

            //RECUPERA E CONVERTE PARA INT PARA DEPOIS APAGAR O REGISTRO NO BANCO
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            
            //METODO PARA APAGAR OS DADOS NO BANCO
            int ret = FormaEnvioDAO.getInstance().apaga(codigo);

            proximaPagina = "ControleFormaEnvioServlet?operacao=FormaEnvioLista";

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
