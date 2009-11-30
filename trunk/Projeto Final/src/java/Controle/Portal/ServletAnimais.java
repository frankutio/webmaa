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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.io.PrintWriter;
import java.util.List;
import java.io.File;
import java.util.Date;
import java.util.Iterator;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
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

     //RECEBE O TIPO DE OPERACAO A REALIZAR
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
                Animais anl = new Animais();

                String foto = "";
                String disponibilidade ="Nao";

                String especie = request.getParameter("especie");

                if(especie.equals("Gato")){

             DiskFileItemFactory factory = new DiskFileItemFactory();

                // Manipulador de upload de arquivos
                ServletFileUpload upload = new ServletFileUpload(factory);
                try {
                    // Recebe lista de campos do formulario
                    List<FileItem> itens = upload.parseRequest(request);

                    for (FileItem fi : itens) {

                        if (fi.isFormField()) {
                           // Recebe os campos q nao sao file

                          if(fi.getFieldName().equals("codUsr")){
                                anl.setCodigo(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("dataCad")){
                                String dataTeste = fi.getString();
                            }
                            if(fi.getFieldName().equals("especie")){
                                anl.setEspecie(fi.getString());
                            }
                            if(fi.getFieldName().equals("raca")){
                                anl.setCodigoRaca(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("nome")){
                                anl.setNome(fi.getString());
                            }
                            if(fi.getFieldName().equals("idade")){
                                anl.setIdade(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("cor1")){
                                anl.setCor1(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("cor2")){
                                anl.setCor2(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("pelagem")){
                                anl.setCodigoPelagem(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("porte")){
                                anl.setPorte(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("sexo")){
                                anl.setSexo(fi.getString());
                            }
                            if(fi.getFieldName().equals("laudo")){
                                anl.setLaudoVeterinario(fi.getString());
                            }
                            if(fi.getFieldName().equals("vacina")){
                                anl.setVacinado(fi.getString());
                            }
                            if(fi.getFieldName().equals("descricaoVacina")){
                                anl.setdescricaoVacina(fi.getString());
                            }
                            if(fi.getFieldName().equals("formaEnvio")){
                                anl.setCodigoFormaEnvio(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("descricao")){
                                anl.setdescricao(fi.getString());
                            }

                        } else {
                            if(fi.getName() == ""){
                                foto ="gato_default.png";
                            }
                            else{
                            // Cria um objeto file com nome do arquivo
                        // A pasta deve oferecer acesso de escrita para Conteiner
                        File uploadedFile = new File("/Documents and Settings/Frank/Meus documentos/Faculdade/TCC/Implementacao/WebMAA/build/web/Gato/images/miniaturas/" + fi.getName());
                        // Grava arquivo na pasta especificada
                        fi.write(uploadedFile);
                        // Grava o nome do arquivo no perfil do usuario
                        foto = fi.getName();
                      }

                        }
                    }

                } catch (Exception ex) {
                    foto ="gato_default.png";
                    System.out.println(new Date() + " - Exception: " + ex.getMessage());

                }
            }

            else if(especie.equals("Cao")){
             DiskFileItemFactory factory = new DiskFileItemFactory();

                // Manipulador de upload de arquivos
                ServletFileUpload upload = new ServletFileUpload(factory);
                try {
                    // Recebe lista de campos do formulario
                    List<FileItem> itens = upload.parseRequest(request);

                    for (FileItem fi : itens) {

                        if (fi.isFormField()) {
                           // Recebe os campos q nao sao file

                          if(fi.getFieldName().equals("codUsr")){
                                anl.setCodigo(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("dataCad")){
                                String dataTeste = fi.getString();
                            }
                            if(fi.getFieldName().equals("especie")){
                                anl.setEspecie(fi.getString());
                            }
                            if(fi.getFieldName().equals("raca")){
                                anl.setCodigoRaca(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("nome")){
                                anl.setNome(fi.getString());
                            }
                            if(fi.getFieldName().equals("idade")){
                                anl.setIdade(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("cor1")){
                                anl.setCor1(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("cor2")){
                                anl.setCor2(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("pelagem")){
                                anl.setCodigoPelagem(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("porte")){
                                anl.setPorte(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("sexo")){
                                anl.setSexo(fi.getString());
                            }
                            if(fi.getFieldName().equals("laudo")){
                                anl.setLaudoVeterinario(fi.getString());
                            }
                            if(fi.getFieldName().equals("vacina")){
                                anl.setVacinado(fi.getString());
                            }
                            if(fi.getFieldName().equals("descricaoVacina")){
                                anl.setdescricaoVacina(fi.getString());
                            }
                            if(fi.getFieldName().equals("formaEnvio")){
                                anl.setCodigoFormaEnvio(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("descricao")){
                                anl.setdescricao(fi.getString());
                            }

                        } else {
                            if(fi.getName() == ""){
                                foto ="cao_default.png";
                            }
                            else{
                            // Cria um objeto file com nome do arquivo
                        // A pasta deve oferecer acesso de escrita para Conteiner
                        File uploadedFile = new File("/Documents and Settings/Frank/Meus documentos/Faculdade/TCC/Implementacao/WebMAA/build/web/Cao/images/miniaturas/" + fi.getName());
                        // Grava arquivo na pasta especificada
                        fi.write(uploadedFile);
                        // Grava o nome do arquivo no perfil do usuario
                        foto = fi.getName();
                      }

                        }
                    }

                } catch (Exception ex) {
                    foto ="cao_default.png";
                    System.out.println(new Date() + " - Exception: " + ex.getMessage());

                }
            }

             //RECUPERA PARAMENTRO DESCRICAO
            try{

                animal.setCodigoUsuario(anl.getCodigoUsuario());
                animal.setDataCadastro(new Date(System.currentTimeMillis()));
                animal.setEspecie(anl.getEspecie());
                animal.setCodigoRaca(anl.getCodigoRaca());
                animal.setNome(anl.getNome());
                animal.setIdade(anl.getIdade());
                animal.setCor1(anl.getCor1());
                animal.setCor2(anl.getCor2());
                animal.setCodigoPelagem(anl.getCodigoPelagem());
                animal.setPorte(anl.getPorte());
                animal.setSexo(anl.getSexo());
                animal.setEndFoto(foto);
                animal.setLaudoVeterinario(anl.getLaudoVeterinario());
                animal.setVacinado(anl.getVacinado());
                animal.setdescricaoVacina(anl.getDescricaoVacina());
                animal.setCodigoFormaEnvio(anl.getCodigoFormaEnvio());
                animal.setdescricao(anl.getDescricao());
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
                    request.setAttribute("AnimalCad", animal);

                    proximaPagina = "cadastro/cad_animal.jsp";
                }


            }catch(Exception e){
                System.out.println(new Date() + " Erro: " + e.getMessage());
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
                String local = "Nao";

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

                proximaPagina = "cadastro/confirmCad_animal.jsp";
             }
             catch(ParseException e){

            }

        }

        else if (operacao.equals("edita_Animal_painel")) {

            Animais animal = new Animais();
            Animais anl = new Animais();
            String disp = "Sim";
            String fotoAnimal = request.getParameter("fotoAnimal");
            String especie = request.getParameter("especie");

            if(especie.equals("Gato")){

             DiskFileItemFactory factory = new DiskFileItemFactory();

                // Manipulador de upload de arquivos
                ServletFileUpload upload = new ServletFileUpload(factory);
                try {
                    // Recebe lista de campos do formulario
                    List<FileItem> itens = upload.parseRequest(request);

                    for (FileItem fi : itens) {

                        if (fi.isFormField()) {
                           // Recebe os campos q nao sao file

                          if(fi.getFieldName().equals("codigo")){
                                anl.setCodigo(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("codUsr")){
                                anl.setCodigoUsuario(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("especie")){
                                anl.setEspecie(fi.getString());
                            }
                            if(fi.getFieldName().equals("raca")){
                                anl.setCodigoRaca(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("nome")){
                                anl.setNome(fi.getString());
                            }
                            if(fi.getFieldName().equals("idade")){
                                anl.setIdade(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("cor1")){
                                anl.setCor1(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("cor2")){
                                anl.setCor2(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("pelagem")){
                                anl.setCodigoPelagem(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("porte")){
                                anl.setPorte(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("sexo")){
                                anl.setSexo(fi.getString());
                            }
                            if(fi.getFieldName().equals("laudo")){
                                anl.setLaudoVeterinario(fi.getString());
                            }
                            if(fi.getFieldName().equals("vacina")){
                                anl.setVacinado(fi.getString());
                            }
                            if(fi.getFieldName().equals("descricaoVacina")){
                                anl.setdescricaoVacina(fi.getString());
                            }
                            if(fi.getFieldName().equals("formaEnvio")){
                                anl.setCodigoFormaEnvio(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("descricao")){
                                anl.setdescricao(fi.getString());
                            }

                        } else {
                            if(fi.getName() == ""){
                                anl.setEndFoto(fotoAnimal);
                            }
                            else{
                            // Cria um objeto file com nome do arquivo
                        // A pasta deve oferecer acesso de escrita para Conteiner
                        File uploadedFile = new File("/Documents and Settings/Frank/Meus documentos/Faculdade/TCC/Implementacao/WebMAA/build/web/Gato/images/miniaturas/" + fi.getName());
                        // Grava arquivo na pasta especificada
                        fi.write(uploadedFile);
                        // Grava o nome do arquivo no perfil do usuario
                        anl.setEndFoto(fi.getName());
                      }

                        }
                    }

                } catch (Exception ex) {
                   anl.setEndFoto(fotoAnimal);
                    System.out.println(new Date() + " - Exception: " + ex.getMessage());

                }
            }

            if(especie.equals("Cao")){

             DiskFileItemFactory factory = new DiskFileItemFactory();

                // Manipulador de upload de arquivos
                ServletFileUpload upload = new ServletFileUpload(factory);
                try {
                    // Recebe lista de campos do formulario
                    List<FileItem> itens = upload.parseRequest(request);

                    for (FileItem fi : itens) {

                        if (fi.isFormField()) {
                           // Recebe os campos q nao sao file

                          if(fi.getFieldName().equals("codigo")){
                                anl.setCodigo(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("codUsr")){
                                anl.setCodigoUsuario(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("especie")){
                                anl.setEspecie(fi.getString());
                            }
                            if(fi.getFieldName().equals("raca")){
                                anl.setCodigoRaca(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("nome")){
                                anl.setNome(fi.getString());
                            }
                            if(fi.getFieldName().equals("idade")){
                                anl.setIdade(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("cor1")){
                                anl.setCor1(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("cor2")){
                                anl.setCor2(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("pelagem")){
                                anl.setCodigoPelagem(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("porte")){
                                anl.setPorte(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("sexo")){
                                anl.setSexo(fi.getString());
                            }
                            if(fi.getFieldName().equals("laudo")){
                                anl.setLaudoVeterinario(fi.getString());
                            }
                            if(fi.getFieldName().equals("vacina")){
                                anl.setVacinado(fi.getString());
                            }
                            if(fi.getFieldName().equals("descricaoVacina")){
                                anl.setdescricaoVacina(fi.getString());
                            }
                            if(fi.getFieldName().equals("formaEnvio")){
                                anl.setCodigoFormaEnvio(Integer.parseInt(fi.getString()));
                            }
                            if(fi.getFieldName().equals("descricao")){
                                anl.setdescricao(fi.getString());
                            }

                        } else {
                            if(fi.getName() == ""){
                                anl.setEndFoto(fotoAnimal);
                            }
                            else{
                            // Cria um objeto file com nome do arquivo
                        // A pasta deve oferecer acesso de escrita para Conteiner
                        File uploadedFile = new File("/Documents and Settings/Frank/Meus documentos/Faculdade/TCC/Implementacao/WebMAA/build/web/Cao/images/miniaturas/" + fi.getName());
                        // Grava arquivo na pasta especificada
                        fi.write(uploadedFile);
                        // Grava o nome do arquivo no perfil do usuario
                        anl.setEndFoto(fi.getName());
                      }

                        }
                    }

                } catch (Exception ex) {
                   anl.setEndFoto(fotoAnimal);
                    System.out.println(new Date() + " - Exception: " + ex.getMessage());

                }
            }

            //RECUPERA PARAMENTRO DESCRICAO
            try{

                animal.setCodigo(anl.getCodigo());
                animal.setCodigoUsuario(anl.getCodigoUsuario());
                animal.setEspecie(especie);
                animal.setCodigoRaca(anl.getCodigoRaca());
                animal.setNome(anl.getNome());
                animal.setIdade(anl.getIdade());
                animal.setCor1(anl.getCor1());
                animal.setCor2(anl.getCor2());
                animal.setCodigoPelagem(anl.getCodigoPelagem());
                animal.setPorte(anl.getPorte());
                animal.setSexo(anl.getSexo());
                animal.setEndFoto(anl.getEndFoto());
                animal.setLaudoVeterinario(anl.getLaudoVeterinario());
                animal.setVacinado(anl.getVacinado());
                animal.setdescricaoVacina(anl.getDescricaoVacina());
                animal.setCodigoFormaEnvio(anl.getCodigoFormaEnvio());
                animal.setdescricao(anl.getDescricao());

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
            processo.setMensagem(request.getParameter("mensagemPessoal"));
            processo.setDataCadastro(new Date(System.currentTimeMillis()));
            processo.setDataProcesso(new Date(System.currentTimeMillis()));

            try{
                //EFETUA A GRAVACAO DOS DADOS
                ProcessoDAO.getInstance().grava(processo);

                // Retira o animal da lista de adoção

                AnimalDAO.getInstance().retiraAnimal(processo.getCodigoAnimal());

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
                notificacao2.setMensagem("<h2>Você possui uma solicitação de Adoção.</h2><br>"+
                        "<br>" +
                        "Você pode acompanhar este processo em seu \"Painel de Controle\" na coluna \"Adoções\".<br>");

                NotificacaoDAO.getInstance().gravaMsg(notificacao2);

                proximaPagina="Painel_controle/Usuario/processo/confirm_processo.jsp";

            }
            catch(Exception e){

                request.setAttribute("MsgErro", "Erro ao Finalizar o processo");

                proximaPagina="Painel_controle/Usuario/processo/confirm_processo.jsp";
            }

            
        }

        else if(operacao.equals("apagarAnimal")){

            int codigoAnimal = Integer.parseInt(request.getParameter("codigo"));
            // Recupera o codigo do proprietario antes de apagar o animal.
            Animais animal = AnimalDAO.getInstance().preparaAnimal(codigoAnimal);
            int codigoColaborador = animal.getCodigoUsuario();

            // Testa se o animal se encontra em um processo de adoção

            Processo processo = ProcessoDAO.getInstance().recuperaProcessos(codigoAnimal);

            // apaga o animal selecionado se ele nao fizer parte do processo

            if(processo == null){
                int ret = AnimalDAO.getInstance().apaga(codigoAnimal);

                // prepara uma mensagem de confirmação para mandar pra JSP
                request.setAttribute("Altera", "Animal Excluido com Sucesso!");
            }
            else{
                request.setAttribute("msgErro", "Atenção: O animal não pode ser excluido, pois o mesmo se encontra em processo de adoção.");
            }

            proximaPagina="PainelControle?operacao=exibirPainel&colaborador="+codigoColaborador;

        }


         //PARA DIRECIONAR AS PAGINAS PARA O LOCAL CERTO.
        RequestDispatcher rd = request.getRequestDispatcher(proximaPagina);
        rd.forward(request, response);
        
    }     

}
