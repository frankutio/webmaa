

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Ong Amigos Fieis</title>

        <link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/geral.css" />
        <link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/jquery-ui-datepicker.css" />
        <link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/estilos.css" />
        <link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/abas.css" />
        <link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/drop_vertical.css" />

        <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/jquery.min.js"></script>

        <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/jquery.js"></script>
        <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/utilidades.js"></script>
        <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/maskedinput.js"></script>
        <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/jquery-ui-datepicker.js"></script>
        <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/menuVertical.js"></script>

        <script type="text/javascript" src="/WebMAA/Painel_controle/ong/js/modal.js"></script>
        <link type="text/css" rel="stylesheet" href="/WebMAA/Painel_controle/ong/css/estilo_modal.css" />
         <script type="text/javascript">
           function detalhar(codigo,codigoanimal) {
                
                window.location = "/WebMAA/ControleAnimaisServlet?operacao=AnimaisMostraColabAdocao&codigo=" + codigo + "&codigoanimal=" + codigoanimal;

            }
          </script>

        <script>
            function focoBt(id){
                if(id ==="logoff"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_logoff_light.png");
                }

                else if(id ==="exibir"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_exibir_light.png");
                }

                else if(id ==="exibir2"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_exibir_light.png");
                }

                else if(id ==="exibir3"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_exibir_light.png");
                }
            }

            function bt(id){
                if(id ==="logoff"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_logoff.png");
                }

                else if(id ==="exibir"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_exibir.png");
                }

                else if(id ==="exibir2"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_exibir.png");
                }

                else if(id ==="exibir3"){
                    $("#"+id).attr("src","/WebMAA/Painel_controle/ong/images/botao/bt_exibir.png");
                }

            }
        </script>

    </head>

    <body>

        <!-- Corpo da pagina -->
        <div id="corpo">

            <!-- div com o banner -->

            <div id="faixaBanner">
                <div class="imgBannerInfLeft"><img src="/WebMAA/Painel_controle/ong/images/topo2.png" alt="Logo" title="Logo" class="seta_link" /></div>
                <div class="imgBannerInfRight"></div>
            </div>

            <!-- CONTEUDO -->

            <div id="conteudo">

                <div id="topo_painel">
                    <%@include file="topo.jsp" %>
                </div>
                <div class="imgBase_sem_coluna">

                    <!-- CONTEUDO AQUI -->
                    <div id="cont">
                        <div class="menuLeft">
                            <br />
                            <br />

                            <div id="menu3">
                                <%@include file="menu.jsp" %>
                            </div>
                        </div>
                        <div class="conteudo_painel">
                            <div class="lista">
                                <div class="bordaFaixaLeft">
                                    <span>Gerenciamento de Adoções</span>
                                </div>
                                 
                                 <c:if test="${listaAnimais == null}">
                                     <br/>
                                    <div class="nota_destaque" style="width:100%;">Não Existem Adoções Pendentes de Aprovação</div>
                                    <br />
                                  </c:if>
                                <br />
                                <div id="inicio">
                                    
                                    <br />
                                     <c:if test="${listaAnimais == null}">
                                        <div id="resultado" class="esconde">
                                        <div class="nota_destaque" style="width:100%;">Não Existem Adoções Pendentes de Aprovação</div>
                                        <br />
                                      </c:if>
                                     <c:if test="${listaAnimais != null}">
                                        <div id="resultado" class="mostra">
                                      </c:if>
                                   
                                        <div class="nota_destaque" style="width:100%;">Adoções Pendentes de Aprovação</div>
                                        <br />

                                        <table class="grid" style=" width:98%;">
                                            <tr>
                                                <td width="10%" align="center" class="grid_titulo">Foto</td>
                                                <td width="6%" align="center" class="grid_titulo">Cod</td>
                                                <td width="24%" align="center" class="grid_titulo">Nome</td>
                                                <td width="10%" align="center" class="grid_titulo">Tipo</td>
                                                <td width="17%" align="center" class="grid_titulo">Raça</td>
                                                <td width="15%" align="center" class="grid_titulo">Dt. Cadastro</td>
                                                <td width="11%" align="center" class="grid_titulo">Detalhar</td>
                                            </tr>
                                            <c:forEach  items="${listaAnimais}" var="lstAnimais">
                                            <tr>
                                                <td align="center"><img src="/WebMAA/Painel_controle/ong/images/img_gato/miniaturas/loky.png" width="69" height="59" /></td>
                                                <td align="center">${lstAnimais.codigo}</td>
                                                <td align="center">${lstAnimais.nome}</td>
                                                <td align="center">${lstAnimais.especie}</td>
                                                <td align="center">Comum</td>
                                                <td align="center">${lstAnimais.dataCadastro}</td>
                                                <td align="center">
                                                    <img src="/WebMAA/Painel_controle/ong/images/botao/zoom.png" class="seta_link" alt="Detalhar Processo" title="Detalhar Processo" onclick="detalhar(${lstAnimais.codigoColaborador},${lstAnimais.codigo});mostra('inicio','detalhes');" />
                                                </td>
                                            </tr>
                                            </c:forEach>
                                          
                                        </table>
                                    </div>



                                </div>
                                <c:if test="${detalheColab.codigo==0}">
                                <div id="detalhes" class="esconde">
                                </c:if>
                                <c:if test="${detalheColab.codigo!=0}">
                                <div id="detalhes" class="mostra">
                                </c:if>
                                
                                    <p>
                                        Somente 1 pessoa poderá adotar o animal, por isso pense bem e analise todos os casos com cuidado.<br />
                                        Apos a escolha do colaborador, selecione a coluna corespendente a mesma e clique em "Aprovar".<br /><br />

                                        <span class="obrigatorio">Os demais usuarios, caso haja mais de 1, recebera um email informando a sua decisão.<br />
                                        Você tambem podera mandar uma Mensagem personalizada caso assim desseje.</span>
                                    </p>
                                    <br />

                                    <table class="grid" style="width:100%;">
                                        <tr>
                                            <td width="8%" align="center" class="grid_titulo">Cod</td>
                                            <td width="38%" align="center" class="grid_titulo">Nome</td>
                                            <td width="13%" align="center" class="grid_titulo">Sexo</td>
                                            <td width="14%" align="center" class="grid_titulo">Detalhar</td>
                                    
                                        </tr>
                                        <tr>
                                            <td align="center">${detalheColab.codigo}</td>
                                            <td align="center">${detalheColab.nome}</td>
                                            <c:if test="${detalheColab.sexo!='M'}">
                                            <td align="center">Feminino</td>
                                            </c:if>
                                            <c:if test="${detalheColab.sexo =='M'}">
                                            <td align="center">Masculino</td>
                                            </c:if>
                                            <td align="center">
                                                
                                                    <img src="/WebMAA/Painel_controle/ong/images/botao/zoom.png" alt="Detalhar" title="Detalhar" class="seta_link" onclick="mostra('detalhes','detalharUsr');" />
                                                
                                            </td>
                                        
                                        </tr>
                                    </table>
                                    <br />

                                    <div align="center" style="width:95%;">
                                        <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="mostra('detalhes','inicio'); mostrar('resultado');" />&nbsp;&nbsp;
                                        <a href="/WebMAA/ControleAnimaisServlet?operacao=AnimaisAprovarAdocoes&codigoanimal=<c:out value="${processo.animaisCodigo}"></c:out>&codigoprocesso=<c:out value="${processo.codigo}"></c:out>" >
                                            <img src="images/botao/bt_aprovar_light.png" id="aprovar" onmouseover="focoBt('aprovar');" onmouseout="bt('aprovar');" class="seta_link" alt="Aprovar" title="Aprovar" />
                                        </a>

                                    </div>

                                </div>

                                <div id="detalharUsr" class="esconde" >
                             

                                        <div class="nota_destaque" style="width:95%; margin-left:2%;">
                                            <span>Detalhes do Usuário</span>
                                        </div>
                                        <br />

                                        <!-- FOTO DO USUARIO -->
                                        <div id="foto">
                                            <img src="/WebMAA/Painel_controle/ong/foto/fotoUsr.png" />
                                        </div>
                                        <!-- FOTO -->

                                                <!-- DADOS DO USUARIO -->
                                        <div id="dadosUsuario" style="width:370px;">
                                            <h3 class="titulo3">${detalheColab.nome}</h3>
                                            <table class="grid dadosModal" width="100%">
                                                <tr>
                                                    <td width="24%" align="right">Cod: &nbsp;</td>
                                                    <td width="76%"><strong>${detalheColab.codigo}</strong></td>
                                                </tr>
                                                <tr>
                                                    <td align="right">Sexo: &nbsp;</td>
                                                    <c:if test="${detalheColab.sexo!='M'}">
                                                        <td><strong>Feminino</strong></td>
                                                    </c:if>
                                                    <c:if test="${detalheColab.sexo=='M'}">
                                                        <td><strong>Masculino</strong></td>
                                                    </c:if>
                                                </tr>
                                                <tr>
                                                    <td align="right">Estado: &nbsp;</td>
                                                    <td><strong>DF</strong></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <!-- DADOS DO USUARIO -->

                                        <div class="clear"></div>

                                        <!-- DETALHES DA PETIÇÃO -->
                                        <div id="conteudoDetalhe">
                                            <br />
                                            <br />

                                            <p>
                                                ${detalheColab.nome}, demonstrou enteresse no animal. <br />

                                            </p>
                                            <span class="obrigatorio" style="font-size:14px">Mensagem Pessoal enviada.</span>

                                            <br />
                                            <br />

                                            <textarea rows="5" cols="60" readonly="readonly" ><c:out value="${processo.mensagem}"></c:out></textarea>

                                            <br />
                                            <br />
                                            <span class="escondeFase obrigatorio" id="usrReprovado"><img src="/WebMAA/Painel_controle/ong/images/botao/alert.png" alt="alerta" title="alerta" /> &nbsp; Usuario Negado. </span>

                                            <br />
                                            <br />

                                            <div align="right">
                                                <img src="/WebMAA/Painel_controle/ong/images/botao/bt_voltar.png" alt="Voltar" title="Voltar" class="seta_link" onclick="mostra('detalharUsr','detalhes'); mostrar('detalhes');" />&nbsp;&nbsp;
                                            </div>
                                        </div>
                                        <!-- DETALHES DA PETIÇÃO -->
                            

                                </div>
                 

                              
                            </div>

                        </div>

                        <div class="clear">
                        </div>

                    </div>
                    <!-- FIM DO CONTEUDO -->

                </div>
                <span class="imgFim_sem_coluna"></span>
            </div>

        </div>
        <!-- Fim do corpo -->

<!-- Rodapé -->

        <div id="rodape">
            Versão do Sistema &nbsp;&nbsp; 1.0
        </div>


    </body>

</html>